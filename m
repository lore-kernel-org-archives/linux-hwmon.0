Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from [110.188.70.11] ([110.188.70.11]:8705 "EHLO spam2.hygon.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726111AbeLHG6f (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 8 Dec 2018 01:58:35 -0500
Received: from spam2.hygon.cn (localhost [127.0.0.2] (may be forged))
        by spam2.hygon.cn with ESMTP id wB86YZVV089485
        for <linux-hwmon@vger.kernel.org>; Sat, 8 Dec 2018 14:34:35 +0800 (GMT-8)
        (envelope-from puwen@hygon.cn)
From: Pu Wen <puwen@hygon.cn>
To: <clemens@ladisch.de>, <jdelvare@suse.com>, <linux@roeck-us.net>,
        <bp@alien8.de>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Pu Wen <puwen@hygon.cn>
Subject: [RFC PATCH] hwmon/k10temp: Add Hygon Dhyana support
Date: Sat, 8 Dec 2018 14:33:28 +0800
Message-ID: <1544250808-20462-1-git-send-email-puwen@hygon.cn>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add support for Hygon Dhyana family 18h processor for k10temp to get the
temperature. As Hygon Dhyana shares the same function interface with AMD
family 17h, so add Hygon PCI Vendor ID and reuse the code path of AMD.

Signed-off-by: Pu Wen <puwen@hygon.cn>
---
 drivers/hwmon/k10temp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 2cef0c3..e24ba10 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -330,7 +330,7 @@ static int k10temp_probe(struct pci_dev *pdev,
 	     (boot_cpu_data.x86_model & 0xf0) == 0x70)) {
 		data->read_htcreg = read_htcreg_nb_f15;
 		data->read_tempreg = read_tempreg_nb_f15;
-	} else if (boot_cpu_data.x86 == 0x17) {
+	} else if (boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) {
 		data->temp_adjust_mask = 0x80000;
 		data->read_tempreg = read_tempreg_nb_f17;
 		data->show_tdie = true;
@@ -367,6 +367,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F3) },
+	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, k10temp_id_table);
-- 
2.7.4
