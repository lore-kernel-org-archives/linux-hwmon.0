Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:40391 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756461AbeEAS0a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 May 2018 14:26:30 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas Gleixner <tglx@linutronix.de>,
        Clemens Ladisch <clemens@ladisch.de>
Cc: Jean Delvare <jdelvare@suse.com>, Borislav Petkov <bp@suse.de>,
        Yazen Ghannam <Yazen.Ghannam@amd.com>,
        Brian Woods <brian.woods@amd.com>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        x86@kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 2/2] hwmon: (k10temp) Use API function to access System Management Network
Date: Tue,  1 May 2018 11:26:22 -0700
Message-Id: <1525199182-10474-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1525199182-10474-1-git-send-email-linux@roeck-us.net>
References: <1525199182-10474-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The SMN (System Management Network) on Family 17h AMD CPUs is also accessed
from other drivers, specifically EDAC. Accessing it directly is racy.
On top of that, accessing the SMN through root bridge 00:00 is wrong on
multi-die CPUs and may result in reading the temperature from the wrong
die. Use available API functions to fix the problem.

For this to work, also change the Raven Ridge PCI device ID to point to
Data Fabric Function 3, since this ID is used by the API functions to
find the CPU node.

Tested-by: Gabriel Craciunescu <nix.or.die@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Fix Raven Ridge device ID and use naming scheme suggested by
    Borislav Petkov.

 drivers/hwmon/k10temp.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index f014e03eee5a..e97105ae4158 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -23,6 +23,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <asm/amd_nb.h>
 #include <asm/processor.h>
 
 MODULE_DESCRIPTION("AMD Family 10h+ CPU core temperature monitor");
@@ -44,8 +45,8 @@ static DEFINE_MUTEX(nb_smu_ind_mutex);
 #define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
 #endif
 
-#ifndef PCI_DEVICE_ID_AMD_17H_RR_NB
-#define PCI_DEVICE_ID_AMD_17H_RR_NB	0x15d0
+#ifndef PCI_DEVICE_ID_AMD_17H_M10H_DF_F3
+#define PCI_DEVICE_ID_AMD_17H_M10H_DF_F3	0x15eb
 #endif
 
 /* CPUID function 0x80000001, ebx */
@@ -140,8 +141,8 @@ static void read_tempreg_nb_f15(struct pci_dev *pdev, u32 *regval)
 
 static void read_tempreg_nb_f17(struct pci_dev *pdev, u32 *regval)
 {
-	amd_nb_index_read(pdev, PCI_DEVFN(0, 0), 0x60,
-			  F17H_M01H_REPORTED_TEMP_CTRL_OFFSET, regval);
+	amd_smn_read(amd_pci_dev_to_node_id(pdev),
+		     F17H_M01H_REPORTED_TEMP_CTRL_OFFSET, regval);
 }
 
 static ssize_t temp1_input_show(struct device *dev,
@@ -327,7 +328,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
-	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_RR_NB) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F3) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, k10temp_id_table);
-- 
2.7.4

