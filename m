Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:36857 "EHLO
        mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750927AbcIMH15 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Sep 2016 03:27:57 -0400
Received: by mail-pa0-f65.google.com with SMTP id p2so2641526pap.3
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Sep 2016 00:27:57 -0700 (PDT)
From: Axel Lin <axel.lin@ingics.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Davide Rizzo <elpa.rizzo@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] hwmon: (lm95241) Update module description to include LM95231
Date: Tue, 13 Sep 2016 15:27:48 +0800
Message-Id: <1473751668-12177-1-git-send-email-axel.lin@ingics.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This driver also supports LM95231.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/hwmon/lm95241.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
index 844c2a0..8c573e6 100644
--- a/drivers/hwmon/lm95241.c
+++ b/drivers/hwmon/lm95241.c
@@ -505,5 +505,5 @@ static struct i2c_driver lm95241_driver = {
 module_i2c_driver(lm95241_driver);
 
 MODULE_AUTHOR("Davide Rizzo <elpa.rizzo@gmail.com>");
-MODULE_DESCRIPTION("LM95241 sensor driver");
+MODULE_DESCRIPTION("LM95231/LM95241 sensor driver");
 MODULE_LICENSE("GPL");
-- 
2.7.4

