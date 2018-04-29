Return-Path: <linux@roeck-us.net>
Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas Gleixner <tglx@linutronix.de>,
	Clemens Ladisch <clemens@ladisch.de>
Cc: x86@kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Borislav Petkov <bp@suse.de>,
	Yazen Ghannam <Yazen.Ghannam@amd.com>,
	Brian Woods <brian.woods@amd.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] x86/amd_nb: Add support for Raven Ridge CPUs
Date: Sat, 28 Apr 2018 18:54:38 -0700
Message-Id: <1524966879-9424-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Add Raven Ridge root bridge and data fabric PCI IDs.
This is required for amd_pci_dev_to_node_id() and amd_smn_read().

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
This patch is a prerequisite for the second patch in the series.
I'll be happy to apply both patches through hwmon if that is acceptable
(and Cc: stable for 4.16+). If not, I'll be happy to wait for this patch
to be available upstream.

Since that there is no public documentation available for Raven Ridge,
PCI IDs are derived from output of lspci.

 arch/x86/kernel/amd_nb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index c88e0b127810..bd33613ecb7c 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -14,8 +14,11 @@
 #include <asm/amd_nb.h>
 
 #define PCI_DEVICE_ID_AMD_17H_ROOT	0x1450
+#define PCI_DEVICE_ID_AMD_17H_RR_ROOT	0x15d0
 #define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
 #define PCI_DEVICE_ID_AMD_17H_DF_F4	0x1464
+#define PCI_DEVICE_ID_AMD_17H_RR_DF_F3	0x15eb
+#define PCI_DEVICE_ID_AMD_17H_RR_DF_F4	0x15ec
 
 /* Protect the PCI config register pairs used for SMN and DF indirect access. */
 static DEFINE_MUTEX(smn_mutex);
@@ -24,6 +27,7 @@ static u32 *flush_words;
 
 static const struct pci_device_id amd_root_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_ROOT) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_RR_ROOT) },
 	{}
 };
 
@@ -39,6 +43,7 @@ const struct pci_device_id amd_nb_misc_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_16H_NB_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_RR_DF_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F3) },
 	{}
 };
@@ -51,6 +56,7 @@ static const struct pci_device_id amd_nb_link_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_16H_NB_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_DF_F4) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_RR_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F4) },
 	{}
 };
-- 
2.7.4
