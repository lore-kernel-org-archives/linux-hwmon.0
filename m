Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:37055 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933088AbdIFWgW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Sep 2017 18:36:22 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Clemens Ladisch <clemens@ladisch.de>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 2/3] hwmon: (k10temp) Add support for family 17h
Date: Wed,  6 Sep 2017 15:36:15 -0700
Message-Id: <1504737376-32013-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1504737376-32013-1-git-send-email-linux@roeck-us.net>
References: <1504737376-32013-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add support for temperature sensors on Family 17h (Ryzen) processors.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Moved definition of PCI_DEVICE_ID_AMD_17H_DF_F3 to other defines.
    Code is now based on cleanup code (patch 1/3) and uses a new function
    to read the temperature from Family 17h chips.
    Temperature offset is now handled in third patch.

 drivers/hwmon/k10temp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 337795e3d81a..8ce27b6b78be 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -36,6 +36,10 @@ MODULE_PARM_DESC(force, "force loading on processors with erratum 319");
 /* Provide lock for writing to NB_SMU_IND_ADDR */
 static DEFINE_MUTEX(nb_smu_ind_mutex);
 
+#ifndef PCI_DEVICE_ID_AMD_17H_DF_F3
+#define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
+#endif
+
 /* CPUID function 0x80000001, ebx */
 #define CPUID_PKGTYPE_MASK	0xf0000000
 #define CPUID_PKGTYPE_F		0x00000000
@@ -61,6 +65,9 @@ static DEFINE_MUTEX(nb_smu_ind_mutex);
  */
 #define F15H_M60H_REPORTED_TEMP_CTRL_OFFSET	0xd8200ca4
 
+/* F17h M01h Access througn SMN */
+#define F17H_M01H_REPORTED_TEMP_CTRL_OFFSET	0x00059800
+
 struct k10temp_data {
 	struct pci_dev *pdev;
 	void (*read_tempreg)(struct pci_dev *pdev, u32 *regval);
@@ -88,6 +95,12 @@ static void read_tempreg_nb_f15(struct pci_dev *pdev, u32 *regval)
 			  F15H_M60H_REPORTED_TEMP_CTRL_OFFSET, regval);
 }
 
+static void read_tempreg_nb_f17(struct pci_dev *pdev, u32 *regval)
+{
+	amd_nb_index_read(pdev, PCI_DEVFN(0, 0), 0x60,
+			  F17H_M01H_REPORTED_TEMP_CTRL_OFFSET, regval);
+}
+
 static ssize_t temp1_input_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
@@ -224,6 +237,8 @@ static int k10temp_probe(struct pci_dev *pdev,
 	if (boot_cpu_data.x86 == 0x15 && (boot_cpu_data.x86_model == 0x60 ||
 					  boot_cpu_data.x86_model == 0x70))
 		data->read_tempreg = read_tempreg_nb_f15;
+	else if (boot_cpu_data.x86 == 0x17)
+		data->read_tempreg = read_tempreg_nb_f17;
 	else
 		data->read_tempreg = read_tempreg_pci;
 
@@ -242,6 +257,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M60H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, k10temp_id_table);
-- 
2.7.4

