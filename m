Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9F4CD13D8
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240928AbjIRJAq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240930AbjIRJAJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:09 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9CEFB
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-0008Ir-Cu; Mon, 18 Sep 2023 10:59:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6n-007B61-QU; Mon, 18 Sep 2023 10:59:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6n-002Z96-HC; Mon, 18 Sep 2023 10:59:57 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 07/24] hwmon: (f71882fg) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:34 +0200
Message-Id: <20230918085951.1234172-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1799; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=50l0hLGmaPxmeEZGz9hTtFDVpGPNc3HHZDLrvu0Nrqk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBAyr8DqJ9SMTeL+cwp9i3yaGDeAMMqxrB/4W FKOt+KkEFCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQMgAKCRCPgPtYfRL+ TujQB/9uXDy8q2Ph1lpEefpNejz/CFy2Ck+OuOZNDtevf7YgbLFehISUR6vionNENgWR1WAhoO/ tB88oIbCos3x7wdh14nUzFPBmX6wQtm0uzOUlgQ4SyskjoZFnd1GSBD77+NKXeunfqN7bf0jYfg +U44Bf9Y6CkCE4fiJn7DeekKqTap4I5EmYVIsBDc4q53pNSDhoq4JwabPzevi2GkWpsV8zmJQdJ 6XwCkC5qC4oHZ6O+hWnAOxZCQGJfuDlIucUMscGjZyW/gRS/HFSNZxqP+t1r0yH6kWGyEEfalwu TQiqptbIvHAnqQ/oR2GIQETx1D/q1iIb2+2jIxRsI51qdGmH
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
 drivers/hwmon/f71882fg.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/f71882fg.c b/drivers/hwmon/f71882fg.c
index 27207ec6f7fe..7c941d320a18 100644
--- a/drivers/hwmon/f71882fg.c
+++ b/drivers/hwmon/f71882fg.c
@@ -2223,7 +2223,7 @@ static int f71882fg_create_fan_sysfs_files(
 	return err;
 }
 
-static int f71882fg_remove(struct platform_device *pdev)
+static void f71882fg_remove(struct platform_device *pdev)
 {
 	struct f71882fg_data *data = platform_get_drvdata(pdev);
 	int nr_fans = f71882fg_nr_fans[data->type];
@@ -2333,7 +2333,6 @@ static int f71882fg_remove(struct platform_device *pdev)
 				ARRAY_SIZE(fxxxx_auto_pwm_attr[0]) * nr_fans);
 		}
 	}
-	return 0;
 }
 
 static int f71882fg_probe(struct platform_device *pdev)
@@ -2659,7 +2658,7 @@ static struct platform_driver f71882fg_driver = {
 		.name	= DRVNAME,
 	},
 	.probe		= f71882fg_probe,
-	.remove		= f71882fg_remove,
+	.remove_new	= f71882fg_remove,
 };
 
 static int __init f71882fg_init(void)
-- 
2.40.1

