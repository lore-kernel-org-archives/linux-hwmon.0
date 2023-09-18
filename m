Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC796CD13D8
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241014AbjIRJAz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240873AbjIRJAN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:13 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8130E126
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6q-0008Pz-8P; Mon, 18 Sep 2023 11:00:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6p-007B6d-E6; Mon, 18 Sep 2023 10:59:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6p-002Z9d-4x; Mon, 18 Sep 2023 10:59:59 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 15/24] hwmon: (sht15) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:42 +0200
Message-Id: <20230918085951.1234172-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=CNcSN+6qyggS67LklJ7L+JGNjE/Y0egQ0kP4RGqgE/8=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlQOAetStiiz6XnsJxs/rD/xc9ctZdffa5xYNvt5ncvs1 eu8e3VHJ6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQAT8U1l/+9uuujwnaor16Sd ZGzX+Tv6Fik6TjCatXbvUU7DBXZ/fj2qYzL78M+4WKk6T2aP7ewv0oq7FXe227ww2OjFNOFWltO fhu1sMcq/17+rCu+yVv4541VCZovNW8nN142msJnO8oz7+v2DquwLmfzSMIufL3u4uNzWPVJd8d Buy5mji4XED5uwKVVf9g05LOzuLKeQFVloMYdx58My+Ws9KhZMrHV3T0zjF7cKYThtkTVfQuSU+ SWeRpWXJZW39wid/r1NMd5dMyZdzS0440D1pajnb/JX/ZsSMeWi/JFZR2UsO5nyZLob5XZG3eG3 MLlklsWwliOmN336/HiDOf02NVInNl6zErrF9zTHLDIUAA==
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
 drivers/hwmon/sht15.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index 32a41fc56fc9..494f9655f44f 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -1017,7 +1017,7 @@ static int sht15_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sht15_remove(struct platform_device *pdev)
+static void sht15_remove(struct platform_device *pdev)
 {
 	struct sht15_data *data = platform_get_drvdata(pdev);
 	int ret;
@@ -1033,8 +1033,6 @@ static int sht15_remove(struct platform_device *pdev)
 		regulator_unregister_notifier(data->reg, &data->nb);
 		regulator_disable(data->reg);
 	}
-
-	return 0;
 }
 
 static const struct platform_device_id sht15_device_ids[] = {
@@ -1053,7 +1051,7 @@ static struct platform_driver sht15_driver = {
 		.of_match_table = of_match_ptr(sht15_dt_match),
 	},
 	.probe = sht15_probe,
-	.remove = sht15_remove,
+	.remove_new = sht15_remove,
 	.id_table = sht15_device_ids,
 };
 module_platform_driver(sht15_driver);
-- 
2.40.1

