Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130B3C46CA1
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240988AbjIRJAx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240870AbjIRJAN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:13 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B81E123
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6q-0008Op-6D; Mon, 18 Sep 2023 11:00:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6p-007B6Y-8X; Mon, 18 Sep 2023 10:59:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-002Z9Z-Vf; Mon, 18 Sep 2023 10:59:58 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 14/24] hwmon: (sch5636) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:41 +0200
Message-Id: <20230918085951.1234172-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1845; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=j8xaUCT3dTtmLiW7iOuAvLGnTMMAyl3wVD33QVj+sbE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBA6ovR9VgGMxua60JLlk8T0B/27TPRMMZwpn zXx+b3MfBiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQOgAKCRCPgPtYfRL+ TngOB/9NTACq594rtiBvzkA8vF5ZB5E+GTaommC4cmNLA1YBQIZCFOWzWJD5yHL1jZx+i2Q5Nuk N7UOBxW1DASV4K84M+HY45YX/5Ty3/xxdaFYwGQ9XkYuA0uu4/lHZXW+cf3A2rbHCyaJdNuOeeV 5rUsLkSUFfjWOYyosqAvBiDMjmWUVFbzdlmamCld5BFS70xEps2cBnPbKCVx3/+pEKnrQtXWkYL C47FkAHUFzn5JpbFENqm/h6baxo3kpd7mtixPlonIfml4xqe6bquINGOFKP+5VJ9G21R8IUKgrm /hrUJuyfmRuKuA692PGAZ7vFa2blKIdIbGL8d2pHYckeMjK9
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
 drivers/hwmon/sch5636.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/sch5636.c b/drivers/hwmon/sch5636.c
index 269757bc3a9e..6e6d54158474 100644
--- a/drivers/hwmon/sch5636.c
+++ b/drivers/hwmon/sch5636.c
@@ -367,7 +367,7 @@ static struct sensor_device_attribute sch5636_fan_attr[] = {
 	SENSOR_ATTR_RO(fan8_alarm, fan_alarm, 7),
 };
 
-static int sch5636_remove(struct platform_device *pdev)
+static void sch5636_remove(struct platform_device *pdev)
 {
 	struct sch5636_data *data = platform_get_drvdata(pdev);
 	int i;
@@ -385,8 +385,6 @@ static int sch5636_remove(struct platform_device *pdev)
 	for (i = 0; i < SCH5636_NO_FANS * 3; i++)
 		device_remove_file(&pdev->dev,
 				   &sch5636_fan_attr[i].dev_attr);
-
-	return 0;
 }
 
 static int sch5636_probe(struct platform_device *pdev)
@@ -515,7 +513,7 @@ static struct platform_driver sch5636_driver = {
 		.name	= DRVNAME,
 	},
 	.probe		= sch5636_probe,
-	.remove		= sch5636_remove,
+	.remove_new	= sch5636_remove,
 	.id_table	= sch5636_device_id,
 };
 
-- 
2.40.1

