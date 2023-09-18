Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5EACD3420
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241081AbjIRJBC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240920AbjIRJAS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:18 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A2D189
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6s-00006X-4q; Mon, 18 Sep 2023 11:00:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6r-007B7C-Dg; Mon, 18 Sep 2023 11:00:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6r-002ZAD-48; Mon, 18 Sep 2023 11:00:01 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 24/24] hwmon: (xgene-hwmon) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:51 +0200
Message-Id: <20230918085951.1234172-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=8pxXYYb/AcFS5gSBOZ6GeCD6lyrxSH69Ls+FXw4Jh0E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBBFofc17ejH6KSQhXTmyWdP9fy9iQEMqe+v/ /bUyIu9A3eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQRQAKCRCPgPtYfRL+ Tuy9B/9Y4oOpCf036eoOeoGrUFcOuRztbi67wrfgqV88ySU6963xTXSnqvI3mrTlo63LHYqyEWl uNRKKYxVg7HoD2eEHLvsgIyZHAiUImC6aTCwYHIEskM6VEwkMLUmfxNYhBMWhrk4ezs4ii5Gr1p QTYhFCALpijxwE3Plj/Si4vBVm7gTxiETyWqC6C0bBkPmuTVE2f7P8pDTMWezgrYkwXQz93NN6L KRkG19VxELioc856ZhEZe3uCjYJkJ5VuATZj9ts5qjIjPudQOPvoUSuMhAOj1dnCdKnq7uDUT8c 9162onep5k2tkzhU6NUGRunBc/p4RKNiD8NaDcX3NBDmeASZ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/xgene-hwmon.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index 78d9f52e2a71..bf5b3880ce5b 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -757,7 +757,7 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int xgene_hwmon_remove(struct platform_device *pdev)
+static void xgene_hwmon_remove(struct platform_device *pdev)
 {
 	struct xgene_hwmon_dev *ctx = platform_get_drvdata(pdev);
 
@@ -768,8 +768,6 @@ static int xgene_hwmon_remove(struct platform_device *pdev)
 		mbox_free_channel(ctx->mbox_chan);
 	else
 		pcc_mbox_free_channel(ctx->pcc_chan);
-
-	return 0;
 }
 
 static const struct of_device_id xgene_hwmon_of_match[] = {
@@ -780,7 +778,7 @@ MODULE_DEVICE_TABLE(of, xgene_hwmon_of_match);
 
 static struct platform_driver xgene_hwmon_driver = {
 	.probe = xgene_hwmon_probe,
-	.remove = xgene_hwmon_remove,
+	.remove_new = xgene_hwmon_remove,
 	.driver = {
 		.name = "xgene-slimpro-hwmon",
 		.of_match_table = xgene_hwmon_of_match,
-- 
2.40.1

