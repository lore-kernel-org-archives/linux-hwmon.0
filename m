Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50759 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751093AbcIGEf1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Sep 2016 00:35:27 -0400
Subject: Re: [PATCH] hwmon: xgene: Fix crash when alarm occurs before driver
 probe
To: Hoan Tran <hotran@apm.com>, Jean Delvare <jdelvare@suse.com>
References: <1473220019-2519-1-git-send-email-hotran@apm.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Itaru Kitayama <itaru.kitayama@riken.jp>, lho@apm.com,
        Duc Dang <dhdang@apm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b93b5e63-aae2-a90a-0e23-0b9b1d94f9a6@roeck-us.net>
Date: Tue, 6 Sep 2016 21:35:20 -0700
MIME-Version: 1.0
In-Reply-To: <1473220019-2519-1-git-send-email-hotran@apm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/06/2016 08:46 PM, Hoan Tran wrote:
> The system crashes during probing xgene-hwmon driver when temperature
> alarm interrupt occurs before.
> It's because
>  - xgene_hwmon_probe() requests PCC mailbox channel which also enables
> the mailbox interrupt.
>  - As temperature alarm interrupt is pending, ISR runs and crashes when accesses
> into invalid resource as unmapped PCC shared memory.
>
> This patch fixes this issue by saving this alarm message and scheduling a
> bottom handler after xgene_hwmon_probe() finish.
>

I am not completely happy with this fix. Main problem I have is that the
processing associated with resp_pending doesn't happen until init_flag is set.
Since the hwmon functions can be called right after hwmon_device_register_with_groups(),
there is now a new race condition between that call and setting init_flag.

I am also a bit concerned with init_flag and rx_pending not being atomic and protected.
What happens if a second interrupt occurs right after init_flag is set but before
(or while) rx_pending is evaluated ?

On top of that, init_flag and thus the added complexity is (unless I am missing
something) only needed if acpi is enabled. Penaltizing non-acpi code doesn't seem
to be optimal.

How do other drivers handle this situation ? This must be a common problem
with all mbox users.

Thanks,
Guenter

> Signed-off-by: Hoan Tran <hotran@apm.com>
> Reported-by: Itaru Kitayama <itaru.kitayama@riken.jp>
> ---
>  drivers/hwmon/xgene-hwmon.c | 75 +++++++++++++++++++++++++++++++++------------
>  1 file changed, 56 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
> index bc78a5d..e3b4e84 100644
> --- a/drivers/hwmon/xgene-hwmon.c
> +++ b/drivers/hwmon/xgene-hwmon.c
> @@ -107,6 +107,8 @@ struct xgene_hwmon_dev {
>  	struct completion	rd_complete;
>  	int			resp_pending;
>  	struct slimpro_resp_msg sync_msg;
> +	bool			init_flag;
> +	bool			rx_pending;
>
>  	struct work_struct	workq;
>  	struct kfifo_rec_ptr_1	async_msg_fifo;
> @@ -465,13 +467,35 @@ static void xgene_hwmon_evt_work(struct work_struct *work)
>  	}
>  }
>
> +static int xgene_hwmon_rx_ready(struct xgene_hwmon_dev *ctx, void *msg)
> +{
> +	if (!ctx->init_flag) {
> +		ctx->rx_pending = true;
> +		/* Enqueue to the FIFO */
> +		kfifo_in_spinlocked(&ctx->async_msg_fifo, msg,
> +				    sizeof(struct slimpro_resp_msg),
> +				    &ctx->kfifo_lock);
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * This function is called when the SLIMpro Mailbox received a message
>   */
>  static void xgene_hwmon_rx_cb(struct mbox_client *cl, void *msg)
>  {
>  	struct xgene_hwmon_dev *ctx = to_xgene_hwmon_dev(cl);
> -	struct slimpro_resp_msg amsg;
> +
> +	/*
> +	 * While the driver registers with the mailbox framework, an interrupt
> +	 * can be pending before the probe function completes its
> +	 * initialization. If such condition occurs, just queue up the message
> +	 * as the driver is not ready for servicing the callback.
> +	 */
> +	if (xgene_hwmon_rx_ready(ctx, msg) < 0)
> +		return;
>
>  	/*
>  	 * Response message format:
> @@ -500,12 +524,8 @@ static void xgene_hwmon_rx_cb(struct mbox_client *cl, void *msg)
>  		return;
>  	}
>
> -	amsg.msg   = ((u32 *)msg)[0];
> -	amsg.param1 = ((u32 *)msg)[1];
> -	amsg.param2 = ((u32 *)msg)[2];
> -
>  	/* Enqueue to the FIFO */
> -	kfifo_in_spinlocked(&ctx->async_msg_fifo, &amsg,
> +	kfifo_in_spinlocked(&ctx->async_msg_fifo, msg,
>  			    sizeof(struct slimpro_resp_msg), &ctx->kfifo_lock);
>  	/* Schedule the bottom handler */
>  	schedule_work(&ctx->workq);
> @@ -520,6 +540,15 @@ static void xgene_hwmon_pcc_rx_cb(struct mbox_client *cl, void *msg)
>  	struct acpi_pcct_shared_memory *generic_comm_base = ctx->pcc_comm_addr;
>  	struct slimpro_resp_msg amsg;
>
> +	/*
> +	 * While the driver registers with the mailbox framework, an interrupt
> +	 * can be pending before the probe function completes its
> +	 * initialization. If such condition occurs, just queue up the message
> +	 * as the driver is not ready for servicing the callback.
> +	 */
> +	if (xgene_hwmon_rx_ready(ctx, &amsg) < 0)
> +		return;
> +
>  	msg = generic_comm_base + 1;
>  	/* Check if platform sends interrupt */
>  	if (!xgene_word_tst_and_clr(&generic_comm_base->status,
> @@ -596,6 +625,17 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, ctx);
>  	cl = &ctx->mbox_client;
>
> +	spin_lock_init(&ctx->kfifo_lock);
> +	mutex_init(&ctx->rd_mutex);
> +
> +	rc = kfifo_alloc(&ctx->async_msg_fifo,
> +			 sizeof(struct slimpro_resp_msg) * ASYNC_MSG_FIFO_SIZE,
> +			 GFP_KERNEL);
> +	if (rc)
> +		goto out_mbox_free;
> +
> +	INIT_WORK(&ctx->workq, xgene_hwmon_evt_work);
> +
>  	/* Request mailbox channel */
>  	cl->dev = &pdev->dev;
>  	cl->tx_done = xgene_hwmon_tx_done;
> @@ -676,17 +716,6 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  		ctx->usecs_lat = PCC_NUM_RETRIES * cppc_ss->latency;
>  	}
>
> -	spin_lock_init(&ctx->kfifo_lock);
> -	mutex_init(&ctx->rd_mutex);
> -
> -	rc = kfifo_alloc(&ctx->async_msg_fifo,
> -			 sizeof(struct slimpro_resp_msg) * ASYNC_MSG_FIFO_SIZE,
> -			 GFP_KERNEL);
> -	if (rc)
> -		goto out_mbox_free;
> -
> -	INIT_WORK(&ctx->workq, xgene_hwmon_evt_work);
> -
>  	ctx->hwmon_dev = hwmon_device_register_with_groups(ctx->dev,
>  							   "apm_xgene",
>  							   ctx,
> @@ -697,17 +726,25 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  		goto out;
>  	}
>
> +	ctx->init_flag = true;
> +	if (ctx->rx_pending) {
> +		/*
> +		 * If there is a pending message, schedule the bottom handler
> +		 */
> +		schedule_work(&ctx->workq);
> +	}
> +
>  	dev_info(&pdev->dev, "APM X-Gene SoC HW monitor driver registered\n");
>
>  	return 0;
>
>  out:
> -	kfifo_free(&ctx->async_msg_fifo);
> -out_mbox_free:
>  	if (acpi_disabled)
>  		mbox_free_channel(ctx->mbox_chan);
>  	else
>  		pcc_mbox_free_channel(ctx->mbox_chan);
> +out_mbox_free:
> +	kfifo_free(&ctx->async_msg_fifo);
>
>  	return rc;
>  }
>

