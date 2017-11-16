Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:54718 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758295AbdKPJBb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Nov 2017 04:01:31 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Clemens Ladisch <clemens@ladisch.de>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (k10temp) Correct model name for Ryzen 1600X
Date: Thu, 16 Nov 2017 01:01:27 -0800
Message-Id: <1510822887-30000-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Ryzen 1600X is a Ryzen 5 processor.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/k10temp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 46a54ed23410..0721e175664a 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -81,7 +81,7 @@ struct tctl_offset {
 };
 
 static const struct tctl_offset tctl_offset_table[] = {
-	{ 0x17, "AMD Ryzen 7 1600X", 20000 },
+	{ 0x17, "AMD Ryzen 5 1600X", 20000 },
 	{ 0x17, "AMD Ryzen 7 1700X", 20000 },
 	{ 0x17, "AMD Ryzen 7 1800X", 20000 },
 	{ 0x17, "AMD Ryzen Threadripper 1950X", 27000 },
-- 
2.7.4

