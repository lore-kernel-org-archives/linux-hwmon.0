Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215F0CD13DE
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:04:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjIRJBA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240909AbjIRJAR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:17 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1189013E
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6r-00004s-Pk; Mon, 18 Sep 2023 11:00:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6q-007B74-WE; Mon, 18 Sep 2023 11:00:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6q-002ZA5-Mt; Mon, 18 Sep 2023 11:00:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 22/24] hwmon: (w83627hf) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:49 +0200
Message-Id: <20230918085951.1234172-23-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1wNtftdHg+/e+1gVtxKSOjAtWXFqdiCZyH+hNfOa9YA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBBCp3ffOj4+00TiURCf8Rz8L1BNFzTPLPRzQ wB/xHwlONyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQQgAKCRCPgPtYfRL+ Tn7kB/432w7UwtMd7gxYrvL8ZMVRklNomEj0lMcEvvJmyqCxjitR9vevae1SfmuQvWzncx13GhO nMduYKr6IcPXQShykb1S8IyARDgz6rrFsvx+eDi9TbH98vuzasj6VMe/drNaL3yWpV3vtx4foJ9 OLuouYTR2MglgpNpE7f9C8dkBtnIvB9LL35571vjKzJ5g+jTniKqaw9rQ143sgaBvzo4LyECcZ0 ZdV74tHb/7kiGmn4j6g7XApr1KS8JQxlQ8vfdB1H+dDxOaJzrxVI/I6syB1NYZjEmwhRa+GlOSJ BnFoPyQpLH0vFQ9slVYFCEfpz0ksOux68e4HO3d26lUs5N0W
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
 drivers/hwmon/w83627hf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/w83627hf.c b/drivers/hwmon/w83627hf.c
index b638d672ac45..2fc9b718e2ab 100644
--- a/drivers/hwmon/w83627hf.c
+++ b/drivers/hwmon/w83627hf.c
@@ -1828,7 +1828,7 @@ static int w83627hf_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int w83627hf_remove(struct platform_device *pdev)
+static void w83627hf_remove(struct platform_device *pdev)
 {
 	struct w83627hf_data *data = platform_get_drvdata(pdev);
 
@@ -1836,8 +1836,6 @@ static int w83627hf_remove(struct platform_device *pdev)
 
 	sysfs_remove_group(&pdev->dev.kobj, &w83627hf_group);
 	sysfs_remove_group(&pdev->dev.kobj, &w83627hf_group_opt);
-
-	return 0;
 }
 
 static struct platform_driver w83627hf_driver = {
@@ -1846,7 +1844,7 @@ static struct platform_driver w83627hf_driver = {
 		.pm	= W83627HF_DEV_PM_OPS,
 	},
 	.probe		= w83627hf_probe,
-	.remove		= w83627hf_remove,
+	.remove_new	= w83627hf_remove,
 };
 
 static int __init w83627hf_find(int sioaddr, unsigned short *addr,
-- 
2.40.1

