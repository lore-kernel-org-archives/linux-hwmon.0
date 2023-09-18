Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD1BCD13D9
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239119AbjIRJA5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240886AbjIRJAP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:15 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740D4133
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6p-0008K2-8U; Mon, 18 Sep 2023 10:59:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-007B6K-KI; Mon, 18 Sep 2023 10:59:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-002Z9M-B1; Mon, 18 Sep 2023 10:59:58 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 11/24] hwmon: (occ/p9_sbe) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:38 +0200
Message-Id: <20230918085951.1234172-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=j/zzKHeL+lXUf6yMc0MgEdhByyOp6Ef/q3lwvFKiPfU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBA2ZvDrq87BAh63A0MtT5aQCijs3P/cpVPjQ 9xNSDpbWD6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQNgAKCRCPgPtYfRL+ TuY1B/49W+hSHIlJtQRVE0CgR8maRFcPpwl6GVOCU3LUzGKDWVj5JKTmujvNlsijiTbzfXxZae0 Oi4UOgGT7QbcroGv6yj74uc85IdaY/Ju3opVWKcOhxDhekoljQtcRFD/FyZLMA+eMdgysRaK0P1 l1lp5WMhRsWbRq7n0/RSBt7wf9dN9/8ksQ8b06P+AtBgXNzq/DyGqSALsWdAJX/jLvTb3urtyND YaRBrAf29SNY480lxNeoJkCH8OjbxRkuMqcjCTWStfzrMXn4Mp1pxHQKB0YgoBy5nuzxmue8zDZ 6dJEGh0SStYySt9Sxq8GtM+q9fyRZx0aJAotEt7L2XCimn24
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
 drivers/hwmon/occ/p9_sbe.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 96521363b696..b5993c79c09e 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -167,7 +167,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int p9_sbe_occ_remove(struct platform_device *pdev)
+static void p9_sbe_occ_remove(struct platform_device *pdev)
 {
 	struct occ *occ = platform_get_drvdata(pdev);
 	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
@@ -178,8 +178,6 @@ static int p9_sbe_occ_remove(struct platform_device *pdev)
 	occ_shutdown(occ);
 
 	kvfree(ctx->ffdc);
-
-	return 0;
 }
 
 static const struct of_device_id p9_sbe_occ_of_match[] = {
@@ -195,7 +193,7 @@ static struct platform_driver p9_sbe_occ_driver = {
 		.of_match_table = p9_sbe_occ_of_match,
 	},
 	.probe	= p9_sbe_occ_probe,
-	.remove = p9_sbe_occ_remove,
+	.remove_new = p9_sbe_occ_remove,
 };
 
 module_platform_driver(p9_sbe_occ_driver);
-- 
2.40.1

