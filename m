Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDA9CD13DE
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239127AbjIRJAu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240854AbjIRJAM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:12 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22FA11C
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6p-0008Mo-HM; Mon, 18 Sep 2023 10:59:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-007B6V-W2; Mon, 18 Sep 2023 10:59:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-002Z9U-Mf; Mon, 18 Sep 2023 10:59:58 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 13/24] hwmon: (pc87427) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:40 +0200
Message-Id: <20230918085951.1234172-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=RUT/Pfu/4GocYLB/DQhEVDWcd0hkLupM+oTfz9pjpag=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlQOAQv/3m0OcYcCDU7UBDJ7HNofVee+17D2ctmVW+pRI vEHYnw7GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZjIL0/2f4q3bErZxMUYLSRz zOtunZouzOzsP2nbHu95t/ZNOffL/maW90rtJcxaBjpPAlITL8b/2P3grtxMyRrx2dJ/5DZOsct 6MC+NbW3eLt4FBdk/Vty75qX2SP5Q3T9ny12/s1ZMcshPZJczNzdiulMXsMCvIsuq/HWnh6KmyK LVjy607wqbfH3hvsp/H+Rv/t427f8jIUGuiIhmGbZpmybv4643O3K3uJqDb9HR9o+u1g2FW46ZW 7JUaXHZ7Ki4Z/y9vLlk59lJdzcH7WqL0rLlvuYyTysiZOLcFWaHjDov3tEyNVFm8xRfdN7PTj1R iLfr5qkQESuPUt5vGuy/ElvDWo9/Nlqjm3/vodbdu+b+AA==
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
 drivers/hwmon/pc87427.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pc87427.c b/drivers/hwmon/pc87427.c
index eaab83d879fb..7bca04eb4ee4 100644
--- a/drivers/hwmon/pc87427.c
+++ b/drivers/hwmon/pc87427.c
@@ -1115,14 +1115,12 @@ static int pc87427_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int pc87427_remove(struct platform_device *pdev)
+static void pc87427_remove(struct platform_device *pdev)
 {
 	struct pc87427_data *data = platform_get_drvdata(pdev);
 
 	hwmon_device_unregister(data->hwmon_dev);
 	pc87427_remove_files(&pdev->dev);
-
-	return 0;
 }
 
 
@@ -1131,7 +1129,7 @@ static struct platform_driver pc87427_driver = {
 		.name	= DRVNAME,
 	},
 	.probe		= pc87427_probe,
-	.remove		= pc87427_remove,
+	.remove_new	= pc87427_remove,
 };
 
 static int __init pc87427_device_add(const struct pc87427_sio_data *sio_data)
-- 
2.40.1

