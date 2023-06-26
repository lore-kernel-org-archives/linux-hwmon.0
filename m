Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF11EB64D7
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jun 2023 08:58:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbjFZI6A (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jun 2023 04:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbjFZI5d (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jun 2023 04:57:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D112D2710
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jun 2023 01:53:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDhws-0006Jc-7G; Mon, 26 Jun 2023 10:51:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDhwp-00AA3z-Sy; Mon, 26 Jun 2023 10:51:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDhwo-00HUjB-S0; Mon, 26 Jun 2023 10:51:46 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Daniel Matyas <daniel.matyas@analog.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] hwmon: max31827: Switch back to use struct i2c_driver::probe
Date:   Mon, 26 Jun 2023 10:51:45 +0200
Message-Id: <20230626085145.554616-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=793; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=85jXwe0so+chwGCHKtlyYWTjg7YEAQiQpjaHOLBT9WA=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpSZgQve/j6u96bHRiHqnJpAV5abyBvRgF9usboLoxrbC 9pKd4t2MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjAR5mT2P5wXloRundi6cIXL 48ttnZ9jLxy5Wxa12nDeiVdrPYSnWF8xeeBxu+nfW683H3+22De5Xbi5ws7kxhFDKUk7Qw0G0Q8 nQxYq6H7JMteomr6VI7Mh9PVlqdK8wwa10yMEt3/lTlvwuebxPa160x4LVz19d48DSY1K7Gkfj8 UwRx8qu+J5WZ9hU79h5oR5h1eVLDLL5fSz7Qk/d5wz60Bwxc13tUZbuzpvnvwd5aRvtYr358Ppv 9qs2jYuNFwdvlmHs90p54n685gY3u39rzgOvp6ga9bYrnE99aVZ9SSVCR8Evtl/yg2v0eTdav6l kLsjoa00Lf/bTtWAlouFa20EF6o0ihtumXlgnpZR5Hl1AA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

struct i2c_driver::probe_new is about to go away. Switch the driver to
use the probe callback with the same prototype.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/max31827.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
index 7735e8087df3..602f4e4f81ff 100644
--- a/drivers/hwmon/max31827.c
+++ b/drivers/hwmon/max31827.c
@@ -456,7 +456,7 @@ static struct i2c_driver max31827_driver = {
 		.name = "max31827",
 		.of_match_table = max31827_of_match,
 	},
-	.probe_new = max31827_probe,
+	.probe = max31827_probe,
 	.id_table = max31827_i2c_ids,
 };
 module_i2c_driver(max31827_driver);

base-commit: 16d60ba8fdc4c6e4745005889dea6ed82b6b5cbd
-- 
2.39.2

