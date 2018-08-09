Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38864 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbeHIW0Y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Aug 2018 18:26:24 -0400
Received: by mail-pg1-f193.google.com with SMTP id k3-v6so3240086pgq.5
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Aug 2018 13:00:02 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Larabel <Michael@phoronix.com>,
        Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH] hwmon: k10temp: Support Threadripper 2920X, 2970WX; simplify offset table
Date: Thu,  9 Aug 2018 12:59:57 -0700
Message-Id: <1533844797-5181-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

All announced Threadripper 29xx models have a temperature offset of
27 degrees C. Simplify temperature offset table to match all 29xx
Threadripper models with a single entry. Also simplify the table to match
all 19xx Threadripper models with a single entry. This effectively drops
entries for Threadripper 1910/1920/1950 which never saw the light of day.

Cc: Michael Larabel <Michael@phoronix.com>
Cc: Clemens Ladisch <clemens@ladisch.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/k10temp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 577e2ede5a1a..bb15d7816a29 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -99,14 +99,8 @@ static const struct tctl_offset tctl_offset_table[] = {
 	{ 0x17, "AMD Ryzen 7 1700X", 20000 },
 	{ 0x17, "AMD Ryzen 7 1800X", 20000 },
 	{ 0x17, "AMD Ryzen 7 2700X", 10000 },
-	{ 0x17, "AMD Ryzen Threadripper 1950X", 27000 },
-	{ 0x17, "AMD Ryzen Threadripper 1920X", 27000 },
-	{ 0x17, "AMD Ryzen Threadripper 1900X", 27000 },
-	{ 0x17, "AMD Ryzen Threadripper 1950", 10000 },
-	{ 0x17, "AMD Ryzen Threadripper 1920", 10000 },
-	{ 0x17, "AMD Ryzen Threadripper 1910", 10000 },
-	{ 0x17, "AMD Ryzen Threadripper 2950X", 27000 },
-	{ 0x17, "AMD Ryzen Threadripper 2990WX", 27000 },
+	{ 0x17, "AMD Ryzen Threadripper 19", 27000 }, /* 19{00,20,50}X */
+	{ 0x17, "AMD Ryzen Threadripper 29", 27000 }, /* 29{20,50,70,90}[W]X */
 };
 
 static void read_htcreg_pci(struct pci_dev *pdev, u32 *regval)
-- 
2.7.4

