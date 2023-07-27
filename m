Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EACEC00528
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jul 2023 07:19:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbjG0HTw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jul 2023 03:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232760AbjG0HT3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jul 2023 03:19:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F2910A
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jul 2023 00:12:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOv9m-0006wr-0C; Thu, 27 Jul 2023 09:11:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOv9k-002QKd-OY; Thu, 27 Jul 2023 09:11:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOv9k-0088lY-2I; Thu, 27 Jul 2023 09:11:28 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andre Werner <andre.werner@systec-electronic.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] hwmon: (hs3001) Switch to use i2c_driver's probe callback
Date:   Thu, 27 Jul 2023 09:11:23 +0200
Message-Id: <20230727071123.512966-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=B9YopxC1cmyUNuT5PP2hLQKkS3UaNE1/A1Qd2GAD20U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkwhiae09OCBJ9h3DPMUzVbrsDXU9gZ2utHCwO7 3LjuwIcqYSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMIYmgAKCRCPgPtYfRL+ TrwcB/4n2Bmjf4wa3Pz2N6AIkQ1OdePVLlQTZOw6XgunQqKT0zLR0rTmKFulq1SVC4hmOSaE0Ar Yk2VnGb2wI8tuqM0vddI0w9odg+WK6pZhX/HNmhiZ8Eik8+sFma4Va8tBHbYPPfInFYKA1476Fu EhPSGTz7vtLspUL1ev6FoCTMr6D4hiQcPXKbqZGXVjkx1+/Q3OnmM8tFKGovDBiGEEeFDXQK3WR nqNwKU9nDPC3bLmGIrzN6/yTYmLC8dKy5cSglJ4L0OHdmCZImHmgSQCKPQ6ezLQg15C/zKI1kG5 3LUsh3l8u5Cb/WK009pFGJx1HAbqzjorNEZOXEeTjDBxreBH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The previous mass switch of hwmon drivers done in commit 1975d167869e
("hwmon: Switch i2c drivers back to use .probe()") was based on
v6.4-rc1. Since then this driver was added which needs to be converted
back in the same way before eventually .probe_new() can be dropped from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this driver appeared in next today. It would be great if this patch
could be added on top to not interfere with the quest to remove
.probe_new directly after v6.6-rc1.

Thanks
Uwe

 drivers/hwmon/hs3001.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/hs3001.c b/drivers/hwmon/hs3001.c
index 9972f6bbb22a..ac574e46d069 100644
--- a/drivers/hwmon/hs3001.c
+++ b/drivers/hwmon/hs3001.c
@@ -231,7 +231,7 @@ static struct i2c_driver hs3001_i2c_driver = {
 		   .name = "hs3001",
 		   .of_match_table = hs3001_of_match,
 	},
-	.probe_new = hs3001_probe,
+	.probe = hs3001_probe,
 	.id_table = hs3001_ids,
 };
 

base-commit: c944c8c532f7bd6d9e52ee3e2e97dcdd9c6014c0
-- 
2.39.2

