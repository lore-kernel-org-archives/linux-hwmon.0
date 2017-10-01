Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:37424 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751013AbdJAO2f (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 1 Oct 2017 10:28:35 -0400
Date: Sun, 1 Oct 2017 07:28:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: hwmon: (xgene) Fix up error handling path mixup in
 'xgene_hwmon_probe()'
Message-ID: <20171001142833.GA688@roeck-us.net>
References: <20170923064415.25307-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170923064415.25307-1-christophe.jaillet@wanadoo.fr>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Sep 23, 2017 at 08:44:15AM +0200, Christophe Jaillet wrote:
> Commit 2ca492e22cb7 has moved the call to 'kfifo_alloc()' from after the
> main 'if' statement to before it.
> But it has not updated the error handling paths accordingly.
> 
> Fix all that:
>    - if 'kfifo_alloc()' fails we can return directly
>    - direct returns after 'kfifo_alloc()' must now go to 'out_mbox_free'
>    - 'goto out_mbox_free' must be replaced by 'goto out', otherwise the
>      '[pcc_]mbox_free_channel()' call will be missed.
> 
> Fixes: 2ca492e22cb7 ("hwmon: (xgene) Fix crash when alarm occurs before driver probe")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/xgene-hwmon.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
> index 9c0dbb8191ad..e1be61095532 100644
> --- a/drivers/hwmon/xgene-hwmon.c
> +++ b/drivers/hwmon/xgene-hwmon.c
> @@ -630,7 +630,7 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  			 sizeof(struct slimpro_resp_msg) * ASYNC_MSG_FIFO_SIZE,
>  			 GFP_KERNEL);
>  	if (rc)
> -		goto out_mbox_free;
> +		return -ENOMEM;
>  
>  	INIT_WORK(&ctx->workq, xgene_hwmon_evt_work);
>  
> @@ -646,7 +646,8 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  		if (IS_ERR(ctx->mbox_chan)) {
>  			dev_err(&pdev->dev,
>  				"SLIMpro mailbox channel request failed\n");
> -			return -ENODEV;
> +			rc = -ENODEV;
> +			goto out_mbox_free;
>  		}
>  	} else {
>  		struct acpi_pcct_hw_reduced *cppc_ss;
> @@ -654,7 +655,8 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  		if (device_property_read_u32(&pdev->dev, "pcc-channel",
>  					     &ctx->mbox_idx)) {
>  			dev_err(&pdev->dev, "no pcc-channel property\n");
> -			return -ENODEV;
> +			rc = -ENODEV;
> +			goto out_mbox_free;
>  		}
>  
>  		cl->rx_callback = xgene_hwmon_pcc_rx_cb;
> @@ -662,7 +664,8 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  		if (IS_ERR(ctx->mbox_chan)) {
>  			dev_err(&pdev->dev,
>  				"PPC channel request failed\n");
> -			return -ENODEV;
> +			rc = -ENODEV;
> +			goto out_mbox_free;
>  		}
>  
>  		/*
> @@ -675,13 +678,13 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  		if (!cppc_ss) {
>  			dev_err(&pdev->dev, "PPC subspace not found\n");
>  			rc = -ENODEV;
> -			goto out_mbox_free;
> +			goto out;
>  		}
>  
>  		if (!ctx->mbox_chan->mbox->txdone_irq) {
>  			dev_err(&pdev->dev, "PCC IRQ not supported\n");
>  			rc = -ENODEV;
> -			goto out_mbox_free;
> +			goto out;
>  		}
>  
>  		/*
> @@ -696,14 +699,14 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  		} else {
>  			dev_err(&pdev->dev, "Failed to get PCC comm region\n");
>  			rc = -ENODEV;
> -			goto out_mbox_free;
> +			goto out;
>  		}
>  
>  		if (!ctx->pcc_comm_addr) {
>  			dev_err(&pdev->dev,
>  				"Failed to ioremap PCC comm region\n");
>  			rc = -ENOMEM;
> -			goto out_mbox_free;
> +			goto out;
>  		}
>  
>  		/*
