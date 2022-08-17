Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C560C25B08
	for <linux-hwmon@archiver.kernel.org>; Wed, 17 Aug 2022 13:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239806AbiHQNMD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 17 Aug 2022 09:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239696AbiHQNL6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 Aug 2022 09:11:58 -0400
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 17 Aug 2022 06:11:36 PDT
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2505A4D153
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Aug 2022 06:11:35 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id OIiHo1kjmGDTnOIiHo5A9C; Wed, 17 Aug 2022 15:04:02 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 17 Aug 2022 15:04:02 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus) Use dev_err_probe() to filter -EPROBE_DEFER error messages
Date:   Wed, 17 Aug 2022 15:04:00 +0200
Message-Id: <3adf1cea6e32e54c0f71f4604b4e98d992beaa71.1660741419.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

devm_regulator_register() can return -EPROBE_DEFER, so better use
dev_err_probe() instead of dev_err(), it is less verbose in such a case.

It is also more informative, which can't hurt.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hwmon/pmbus/pmbus_core.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 5541d26e8623..e000674d50df 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3016,11 +3016,10 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 
 		rdev = devm_regulator_register(dev, &info->reg_desc[i],
 					       &config);
-		if (IS_ERR(rdev)) {
-			dev_err(dev, "Failed to register %s regulator\n",
-				info->reg_desc[i].name);
-			return PTR_ERR(rdev);
-		}
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "Failed to register %s regulator\n",
+					     info->reg_desc[i].name);
 	}
 
 	return 0;
-- 
2.34.1

