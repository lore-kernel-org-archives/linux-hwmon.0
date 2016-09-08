Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:35029 "EHLO
        mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757681AbcIHPbe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Sep 2016 11:31:34 -0400
Received: by mail-pf0-f173.google.com with SMTP id w87so19283319pfk.2
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Sep 2016 08:31:34 -0700 (PDT)
From: Hoan Tran <hotran@apm.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Itaru Kitayama <itaru.kitayama@riken.jp>, lho@apm.com,
        Duc Dang <dhdang@apm.com>, Hoan Tran <hotran@apm.com>
Subject: [PATCH v2] hwmon: xgene: Fix crash when alarm occurs before driver probe
Date: Thu,  8 Sep 2016 08:31:04 -0700
Message-Id: <1473348664-24547-1-git-send-email-hotran@apm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The system crashes during probing xgene-hwmon driver when temperature
alarm interrupt occurs before.
It's because
 - xgene_hwmon_probe() requests mailbox channel which also enables
the mailbox interrupt.
 - As temperature alarm interrupt is pending, ISR runs and crashes when accesses
into invalid resourse as unmapped PCC shared memory.

This patch fixes this issue by saving this alarm message and scheduling a
bottom handler after xgene_hwmon_probe() finish.

Signed-off-by: Hoan Tran <hotran@apm.com>
Reported-by: Itaru Kitayama <itaru.kitayama@riken.jp>
---
v2
 * Check hwmon_dev and resp_pending to determine the driver is not ready
 * Remove init_flag and rx_pending
 * Replace EBUSY by ENODEV

v1
 * Initial

 drivers/hwmon/xgene-hwmon.c | 69 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index bc78a5d..ea53537 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -465,13 +465,34 @@ static void xgene_hwmon_evt_work(struct work_struct *work)
 	}
 }
 
+static int xgene_hwmon_rx_ready(struct xgene_hwmon_dev *ctx, void *msg)
+{
+	if (IS_ERR(ctx->hwmon_dev) && !ctx->resp_pending) {
+		/* Enqueue to the FIFO */
+		kfifo_in_spinlocked(&ctx->async_msg_fifo, msg,
+				    sizeof(struct slimpro_resp_msg),
+				    &ctx->kfifo_lock);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 /*
  * This function is called when the SLIMpro Mailbox received a message
  */
 static void xgene_hwmon_rx_cb(struct mbox_client *cl, void *msg)
 {
 	struct xgene_hwmon_dev *ctx = to_xgene_hwmon_dev(cl);
-	struct slimpro_resp_msg amsg;
+
+	/*
+	 * While the driver registers with the mailbox framework, an interrupt
+	 * can be pending before the probe function completes its
+	 * initialization. If such condition occurs, just queue up the message
+	 * as the driver is not ready for servicing the callback.
+	 */
+	if (xgene_hwmon_rx_ready(ctx, msg) < 0)
+		return;
 
 	/*
 	 * Response message format:
@@ -500,12 +521,8 @@ static void xgene_hwmon_rx_cb(struct mbox_client *cl, void *msg)
 		return;
 	}
 
-	amsg.msg   = ((u32 *)msg)[0];
-	amsg.param1 = ((u32 *)msg)[1];
-	amsg.param2 = ((u32 *)msg)[2];
-
 	/* Enqueue to the FIFO */
-	kfifo_in_spinlocked(&ctx->async_msg_fifo, &amsg,
+	kfifo_in_spinlocked(&ctx->async_msg_fifo, msg,
 			    sizeof(struct slimpro_resp_msg), &ctx->kfifo_lock);
 	/* Schedule the bottom handler */
 	schedule_work(&ctx->workq);
@@ -520,6 +537,15 @@ static void xgene_hwmon_pcc_rx_cb(struct mbox_client *cl, void *msg)
 	struct acpi_pcct_shared_memory *generic_comm_base = ctx->pcc_comm_addr;
 	struct slimpro_resp_msg amsg;
 
+	/*
+	 * While the driver registers with the mailbox framework, an interrupt
+	 * can be pending before the probe function completes its
+	 * initialization. If such condition occurs, just queue up the message
+	 * as the driver is not ready for servicing the callback.
+	 */
+	if (xgene_hwmon_rx_ready(ctx, &amsg) < 0)
+		return;
+
 	msg = generic_comm_base + 1;
 	/* Check if platform sends interrupt */
 	if (!xgene_word_tst_and_clr(&generic_comm_base->status,
@@ -596,6 +622,17 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ctx);
 	cl = &ctx->mbox_client;
 
+	spin_lock_init(&ctx->kfifo_lock);
+	mutex_init(&ctx->rd_mutex);
+
+	rc = kfifo_alloc(&ctx->async_msg_fifo,
+			 sizeof(struct slimpro_resp_msg) * ASYNC_MSG_FIFO_SIZE,
+			 GFP_KERNEL);
+	if (rc)
+		goto out_mbox_free;
+
+	INIT_WORK(&ctx->workq, xgene_hwmon_evt_work);
+
 	/* Request mailbox channel */
 	cl->dev = &pdev->dev;
 	cl->tx_done = xgene_hwmon_tx_done;
@@ -676,17 +713,6 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
 		ctx->usecs_lat = PCC_NUM_RETRIES * cppc_ss->latency;
 	}
 
-	spin_lock_init(&ctx->kfifo_lock);
-	mutex_init(&ctx->rd_mutex);
-
-	rc = kfifo_alloc(&ctx->async_msg_fifo,
-			 sizeof(struct slimpro_resp_msg) * ASYNC_MSG_FIFO_SIZE,
-			 GFP_KERNEL);
-	if (rc)
-		goto out_mbox_free;
-
-	INIT_WORK(&ctx->workq, xgene_hwmon_evt_work);
-
 	ctx->hwmon_dev = hwmon_device_register_with_groups(ctx->dev,
 							   "apm_xgene",
 							   ctx,
@@ -697,17 +723,22 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
 		goto out;
 	}
 
+	/*
+	 * Schedule the bottom handler if there is a pending message.
+	 */
+	schedule_work(&ctx->workq);
+
 	dev_info(&pdev->dev, "APM X-Gene SoC HW monitor driver registered\n");
 
 	return 0;
 
 out:
-	kfifo_free(&ctx->async_msg_fifo);
-out_mbox_free:
 	if (acpi_disabled)
 		mbox_free_channel(ctx->mbox_chan);
 	else
 		pcc_mbox_free_channel(ctx->mbox_chan);
+out_mbox_free:
+	kfifo_free(&ctx->async_msg_fifo);
 
 	return rc;
 }
-- 
1.9.1

