Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:60720 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750826AbeDXP7v (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Apr 2018 11:59:51 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?q?Ren=C3=A9=20Rebe?= <rene@exactcode.de>
Subject: [PATCH] hwmon: (k10temp) Add support for AMD Ryzen w/ Vega graphics
Date: Tue, 24 Apr 2018 08:59:45 -0700
Message-Id: <1524585585-5711-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Enable k10temp for AMD Ryzen APUs w/ Vega Mobile Gfx.

Based on patch from René Rebe <rene@exactcode.de>. Dropped temperature
offsets since those are not supposed to apply for the affected CPUs.

Cc: René Rebe <rene@exactcode.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/k10temp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 051a72eecb24..cb3959880b4c 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -40,6 +40,10 @@ static DEFINE_MUTEX(nb_smu_ind_mutex);
 #define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
 #endif
 
+#ifndef PCI_DEVICE_ID_AMD_17H_RR_NB
+#define PCI_DEVICE_ID_AMD_17H_RR_NB	0x15d0
+#endif
+
 /* CPUID function 0x80000001, ebx */
 #define CPUID_PKGTYPE_MASK	0xf0000000
 #define CPUID_PKGTYPE_F		0x00000000
@@ -292,6 +296,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_RR_NB) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, k10temp_id_table);
-- 
2.7.4

