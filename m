Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA60CD13DF
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241089AbjIRJBE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240917AbjIRJAS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:18 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D98188
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6r-0008VQ-FU; Mon, 18 Sep 2023 11:00:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6q-007B70-PJ; Mon, 18 Sep 2023 11:00:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6q-002ZA1-G2; Mon, 18 Sep 2023 11:00:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Roger Lucas <vt8231@hiddenengine.co.uk>,
        linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 21/24] hwmon: (vt8231) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:48 +0200
Message-Id: <20230918085951.1234172-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=qR6TESNlDnUSqetH+MwtFfp5v8mHVaX029JscLQ5gJA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBBBCLdp/79C47Aij126MeIYC4WhvWbwU79qZ RSLQg2ab5yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQQQAKCRCPgPtYfRL+ TsoICACzDiTJYoMFZ7Bj4aX3faE2GfQGBI4UMKb9F3ZCkXw3ildD9YImUuaYkr/ViGohsGsXC6E i1oXmPo6WPaTh9fVPjZ/5z6ag69q++dCkxtPvt826IBrUt67DNRe3YMk4+7dIbGxC0zldDlf+bO aerKxhpFviiG+OMCPkUxefAiTOReVU5iFhpeNlRgqwD5i/hhYMW2fC4wbHmJbhmNrsfEOO0TPoi X8IlJdBJ40+P/SoN/ooo3+1bbnxpD1nRoVBe/mG8liCidw4jgKnqqsk1icpApNlbm6wN8kYyP5E IJlljszIq7kM7Pz+St6dMRnx6PFK2LySIYVsjRC2y1sLQH1n
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
 drivers/hwmon/vt8231.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/vt8231.c b/drivers/hwmon/vt8231.c
index 16bc16d33cd1..dcdd14ccd115 100644
--- a/drivers/hwmon/vt8231.c
+++ b/drivers/hwmon/vt8231.c
@@ -892,7 +892,7 @@ static int vt8231_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int vt8231_remove(struct platform_device *pdev)
+static void vt8231_remove(struct platform_device *pdev)
 {
 	struct vt8231_data *data = platform_get_drvdata(pdev);
 	int i;
@@ -906,8 +906,6 @@ static int vt8231_remove(struct platform_device *pdev)
 		sysfs_remove_group(&pdev->dev.kobj, &vt8231_group_temps[i]);
 
 	sysfs_remove_group(&pdev->dev.kobj, &vt8231_group);
-
-	return 0;
 }
 
 
@@ -916,7 +914,7 @@ static struct platform_driver vt8231_driver = {
 		.name	= DRIVER_NAME,
 	},
 	.probe	= vt8231_probe,
-	.remove	= vt8231_remove,
+	.remove_new = vt8231_remove,
 };
 
 static const struct pci_device_id vt8231_pci_ids[] = {
-- 
2.40.1

