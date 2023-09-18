Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06F1CD13DD
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240965AbjIRJAv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240851AbjIRJAL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:11 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B48119
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-0008IT-FZ; Mon, 18 Sep 2023 10:59:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6n-007B5s-8F; Mon, 18 Sep 2023 10:59:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6m-002Z8v-V5; Mon, 18 Sep 2023 10:59:56 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 04/24] hwmon: (da9052-hwmon) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:31 +0200
Message-Id: <20230918085951.1234172-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=CiVPdsDBpYOFw0XZx1KwV6JX9RA8Rx4wdI7I6zWBwUo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBAuewaxF1EgrhoHDeIbEHFwT7ost+nYIidjd a/wAmQZyHGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQLgAKCRCPgPtYfRL+ TrTZB/40sV68jJV1H42ha8kvm1HwM9AylsG/m9BjLSUEdKvGdmu2MNgzd0VcbNj/Ce7K+swHM5L jFG7aqBO46U3nnqfQHGbncia482WuC92h0yLGLUJ+CloVKdFCpwhJzn0uV9Bff8S8z4BtCqs0NY xIK9ShnCUEQPoUu2eDjZ8zbac3fQSb0RCe1X/NLr+q+kczV23nypsQLI8vRJuqZkD7YNSa6m5+i hNRT8cLgyyrVe90jImBRpq+mRp9ddwcEH6kszy1xTKrDa3uO1N6REf3AUILKUhOMz44tw+CyR1E Lz8y8CACPWk7edium+yn1wGz0//t4wBpv7WR9jSQ/ljv2Dzt
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
 drivers/hwmon/da9052-hwmon.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
index ed6c5df94fdf..2bd7ae8100d7 100644
--- a/drivers/hwmon/da9052-hwmon.c
+++ b/drivers/hwmon/da9052-hwmon.c
@@ -479,7 +479,7 @@ static int da9052_hwmon_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int da9052_hwmon_remove(struct platform_device *pdev)
+static void da9052_hwmon_remove(struct platform_device *pdev)
 {
 	struct da9052_hwmon *hwmon = platform_get_drvdata(pdev);
 
@@ -487,13 +487,11 @@ static int da9052_hwmon_remove(struct platform_device *pdev)
 		da9052_free_irq(hwmon->da9052, DA9052_IRQ_TSIREADY, hwmon);
 		regulator_disable(hwmon->tsiref);
 	}
-
-	return 0;
 }
 
 static struct platform_driver da9052_hwmon_driver = {
 	.probe = da9052_hwmon_probe,
-	.remove = da9052_hwmon_remove,
+	.remove_new = da9052_hwmon_remove,
 	.driver = {
 		.name = "da9052-hwmon",
 	},
-- 
2.40.1

