Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912DAC77B73
	for <linux-hwmon@archiver.kernel.org>; Sun, 23 Apr 2023 08:17:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjDWIRq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 23 Apr 2023 04:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjDWIRp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Apr 2023 04:17:45 -0400
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 23 Apr 2023 01:17:44 PDT
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0F43719BD
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Apr 2023 01:17:43 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id qUnQpJWEt3pfeqUnQpzkaa; Sun, 23 Apr 2023 10:10:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1682237412;
        bh=eUw6lwCqRPFGvEY7KIEtjH9lv7Qyusv4qg87RM8p+Os=;
        h=From:To:Cc:Subject:Date;
        b=ba51sbsnfIixWqGK5DHuJtf4xIHn7siFvpLbbsut35d2LZflItCMtJxXNagucBove
         /zVsrmifLGr0fmdPLXwp4uR7xFLHtb4Mlg3gQubufLRNCUGj3ZtecOUCWGdlgi2K59
         Wt5uMSCYPBMpkWY1fZaeTeS87dqKC0Ocx8/lHCUXOTSfx6CJnOtAo08+Q7y4nhhn0S
         Xd5CgZo6E8dKic7bYuLgA6K8w5EwZUrtb3PgwXARyFRIhSNDneaoEOdyG7puE4wiSJ
         TNkPCzsBKDfGLdO2ztWV3/OQeTw9n6Gj5d0xACkL/1OxvBlpFKz/Zh8L+7wauB0/zK
         4c5FZ2++bSFQw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 23 Apr 2023 10:10:12 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        patches@opensource.cirrus.com, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: lochnagar: Remove the unneeded include <linux/i2c.h>
Date:   Sun, 23 Apr 2023 10:10:07 +0200
Message-Id: <df555e724d1b52bd9958c0bd729a774dfe0cf150.1682237387.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This driver does not use i2c, so there is no point in including
<linux/i2c.h>

Remove it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hwmon/lochnagar-hwmon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/lochnagar-hwmon.c b/drivers/hwmon/lochnagar-hwmon.c
index 9948e2f7208d..6350904a8a8b 100644
--- a/drivers/hwmon/lochnagar-hwmon.c
+++ b/drivers/hwmon/lochnagar-hwmon.c
@@ -11,7 +11,6 @@
 #include <linux/delay.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
-#include <linux/i2c.h>
 #include <linux/math64.h>
 #include <linux/mfd/lochnagar.h>
 #include <linux/mfd/lochnagar2_regs.h>
-- 
2.34.1

