Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F51CD13D2
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240994AbjIRJAy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240877AbjIRJAO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:14 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2156812C
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6q-0008Sc-Lv; Mon, 18 Sep 2023 11:00:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6p-007B6l-Sl; Mon, 18 Sep 2023 10:59:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6p-002Z9l-JW; Mon, 18 Sep 2023 10:59:59 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 17/24] hwmon: (ultra45_env) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:44 +0200
Message-Id: <20230918085951.1234172-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=8ed1skhb69iRw8dFQY5YnJaBV1WEBpHoLBwlLo9O9cg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBA9tTWkORb/S8bmo0kuM04iXIlXHkE2laBsa M6j2+F9RlGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQPQAKCRCPgPtYfRL+ TixJB/9FCzvxDxbLs4ryz/Uix1ABQd1dU6Onr4tcRMP3lfMTtC4l4eh1UrWJfNYnKP5avUktacF 56+IPt7nWNPRHmIlOHdnrQ5SentWm4/ZAmMtFp3dWfUQGBAAp9Wz+gANm1SmSAE3BPHFYCJ/O1x 2jnqbxlB8WSoWJvOm2+SvfJh1Afa7JDH7mJ0SnW1YJzzBUsok3vcuELzZ8wE9HRQJB1XaE2cNNq Ky6nwVAzi79LH0Jcg5FGZL2RZxVBpT1MHlZmwoXCFgqYrXynujMMJRCEzIYG5DgCthEUTFMtqtn EX7tYh4kN2Obwi4YYCHmVoHdYi1CvbBGmG3ZGcW+d31eKRbH
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
 drivers/hwmon/ultra45_env.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ultra45_env.c b/drivers/hwmon/ultra45_env.c
index 3b580f229887..9823afb0675a 100644
--- a/drivers/hwmon/ultra45_env.c
+++ b/drivers/hwmon/ultra45_env.c
@@ -291,7 +291,7 @@ static int env_probe(struct platform_device *op)
 	goto out;
 }
 
-static int env_remove(struct platform_device *op)
+static void env_remove(struct platform_device *op)
 {
 	struct env *p = platform_get_drvdata(op);
 
@@ -300,8 +300,6 @@ static int env_remove(struct platform_device *op)
 		hwmon_device_unregister(p->hwmon_dev);
 		of_iounmap(&op->resource[0], p->regs, REG_SIZE);
 	}
-
-	return 0;
 }
 
 static const struct of_device_id env_match[] = {
@@ -319,7 +317,7 @@ static struct platform_driver env_driver = {
 		.of_match_table = env_match,
 	},
 	.probe		= env_probe,
-	.remove		= env_remove,
+	.remove_new	= env_remove,
 };
 
 module_platform_driver(env_driver);
-- 
2.40.1

