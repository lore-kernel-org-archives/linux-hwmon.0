Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:40353 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753332AbeASOjg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Jan 2018 09:39:36 -0500
Received: by mail-pf0-f196.google.com with SMTP id i66so1498083pfd.7
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jan 2018 06:39:36 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (k10temp) Add temperature offset for Ryzen 1900X
Date: Fri, 19 Jan 2018 06:39:32 -0800
Message-Id: <1516372772-27311-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Like the other CPUs from the same series, the 1900X has a
temperature offset of 27 degrees C.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/k10temp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 0721e175664a..06b4e1c78bd8 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -86,6 +86,7 @@ static const struct tctl_offset tctl_offset_table[] = {
 	{ 0x17, "AMD Ryzen 7 1800X", 20000 },
 	{ 0x17, "AMD Ryzen Threadripper 1950X", 27000 },
 	{ 0x17, "AMD Ryzen Threadripper 1920X", 27000 },
+	{ 0x17, "AMD Ryzen Threadripper 1900X", 27000 },
 	{ 0x17, "AMD Ryzen Threadripper 1950", 10000 },
 	{ 0x17, "AMD Ryzen Threadripper 1920", 10000 },
 	{ 0x17, "AMD Ryzen Threadripper 1910", 10000 },
-- 
2.7.4

