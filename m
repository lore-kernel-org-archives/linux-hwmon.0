Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34584 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731069AbeHGSce (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Aug 2018 14:32:34 -0400
Received: by mail-pf1-f194.google.com with SMTP id k19-v6so8829018pfi.1
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Aug 2018 09:17:32 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Michael Larabel <michael@phoronix.com>
Subject: [PATCH] k10temp: 27C Offset needed for Threadripper2
Date: Tue,  7 Aug 2018 09:17:28 -0700
Message-Id: <1533658648-29154-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Michael Larabel <michael@phoronix.com>

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

