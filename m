Return-Path: <linux@roeck-us.net>
Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Clemens Ladisch <clemens@ladisch.de>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brian Woods <brian.woods@amd.com>,
	Gabriel C <nix.or.die@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (k10temp) Add support for Stoney Ridge and Bristol Ridge CPUs
Date: Sun, 29 Apr 2018 09:16:45 -0700
Message-Id: <1525018605-22302-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Add support for Stoney Ridge and Bristol Ridge (Family 15h Model 0x70)
CPUs. Registers match those of Family 15h Model 0x60.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/k10temp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 34b5448b00be..f014e03eee5a 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -36,6 +36,10 @@ MODULE_PARM_DESC(force, "force loading on processors with erratum 319");
 /* Provide lock for writing to NB_SMU_IND_ADDR */
 static DEFINE_MUTEX(nb_smu_ind_mutex);
 
+#ifndef PCI_DEVICE_ID_AMD_15H_M70H_NB_F3
+#define PCI_DEVICE_ID_AMD_15H_M70H_NB_F3	0x15b3
+#endif
+
 #ifndef PCI_DEVICE_ID_AMD_17H_DF_F3
 #define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
 #endif
@@ -319,6 +323,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M10H_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M30H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M60H_NB_F3) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M70H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
-- 
2.7.4
