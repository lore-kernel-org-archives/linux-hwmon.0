Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:32926 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758802AbeD0TP7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Apr 2018 15:15:59 -0400
Received: by mail-lf0-f65.google.com with SMTP id m18-v6so4181385lfb.0
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Apr 2018 12:15:58 -0700 (PDT)
From: ojab <ojab@ojab.ru>
To: clemens@ladisch.de, linux-hwmon@vger.kernel.org
Cc: ojab <ojab@ojab.ru>
Subject: [PATCH]  hwmon: (k10temp) Add support for Raven Ridge (Ryzen APU)
Date: Fri, 27 Apr 2018 19:15:29 +0000
Message-Id: <20180427191529.4923-1-ojab@ojab.ru>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Signed-off-by: ojab <ojab@ojab.ru>
---
 drivers/hwmon/k10temp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 051a72e..0e428b0 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -39,6 +39,7 @@ static DEFINE_MUTEX(nb_smu_ind_mutex);
 #ifndef PCI_DEVICE_ID_AMD_17H_DF_F3
 #define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
 #endif
+#define PCI_DEVICE_ID_AMD_RAVEN_RIDGE	0x15d0
 
 /* CPUID function 0x80000001, ebx */
 #define CPUID_PKGTYPE_MASK	0xf0000000
@@ -292,6 +293,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_RAVEN_RIDGE) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, k10temp_id_table);
-- 
2.10.0

