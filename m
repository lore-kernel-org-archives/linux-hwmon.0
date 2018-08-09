Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.phoronix.com ([23.111.154.110]:54474 "EHLO
        sky.phoronix.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730634AbeHITia (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Aug 2018 15:38:30 -0400
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
From: Michael Larabel <Michael@phoronix.com>
Subject: [PATCH] hwmon: (k10temp) 27C offset needed for Threadripper 2920X /
 2970WX
Message-ID: <962bacd7-4369-0e36-ef55-ee3681baa27e@phoronix.com>
Date: Thu, 9 Aug 2018 11:26:14 -0500
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------666AEDF09EF38D8CF7A43D95"
Content-Language: en-US
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This is a multi-part message in MIME format.
--------------666AEDF09EF38D8CF7A43D95
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Guenter, list:

I was able to confirm that the AMD Threadripper 2920X and 2970WX also 
require a 27 degree Tctl offset.

Michael


--------------666AEDF09EF38D8CF7A43D95
Content-Type: text/x-patch;
 name="0001-k10temp-27C-Offset-needed-for-Threadripper2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-k10temp-27C-Offset-needed-for-Threadripper2.patch"

>From f368ba0dce5eb94e4552650595082b51ebc37b55 Mon Sep 17 00:00:00 2001
From: Michael Larabel <michael@phoronix.com>
Date: Tue, 7 Aug 2018 09:54:54 -0400
Subject: [PATCH] k10temp: 27C Offset needed for Threadripper2

For at least the Threadripper 2950X and Threadripper 2990WX, it's confirmed a 27 degree offset is needed.
---
 drivers/hwmon/k10temp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 17c6460ae351..577e2ede5a1a 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -105,6 +105,8 @@ static const struct tctl_offset tctl_offset_table[] = {
 	{ 0x17, "AMD Ryzen Threadripper 1950", 10000 },
 	{ 0x17, "AMD Ryzen Threadripper 1920", 10000 },
 	{ 0x17, "AMD Ryzen Threadripper 1910", 10000 },
+	{ 0x17, "AMD Ryzen Threadripper 2950X", 27000 },
+	{ 0x17, "AMD Ryzen Threadripper 2990WX", 27000 },
 };
 
 static void read_htcreg_pci(struct pci_dev *pdev, u32 *regval)
-- 
2.17.1


--------------666AEDF09EF38D8CF7A43D95--
