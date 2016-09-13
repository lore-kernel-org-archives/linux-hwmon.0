Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35130 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753446AbcIMHWN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Sep 2016 03:22:13 -0400
Received: by mail-pf0-f196.google.com with SMTP id z84so894438pfi.2
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Sep 2016 00:22:12 -0700 (PDT)
From: Axel Lin <axel.lin@ingics.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] hwmon: (lm95245) Select REGMAP_I2C
Date: Tue, 13 Sep 2016 15:21:59 +0800
Message-Id: <1473751319-5027-1-git-send-email-axel.lin@ingics.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This driver now uses regmap APIs, so it needs to select REGMAP_I2C.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/hwmon/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 6c82ee2..45cef3d 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1118,6 +1118,7 @@ config SENSORS_LM95241
 config SENSORS_LM95245
 	tristate "National Semiconductor LM95245 and compatibles"
 	depends on I2C
+	select REGMAP_I2C
 	help
 	  If you say yes here you get support for LM95235 and LM95245
 	  temperature sensor chips.
-- 
2.7.4

