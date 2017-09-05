Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Clemens Ladisch <clemens@ladisch.de>
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (k10temp) Add support for family 17h
Date: Mon,  4 Sep 2017 18:45:35 -0700
Message-Id: <1504575935-19476-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Add support for temperature sensors on Family 17h (Ryzen) processors.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Some of this is guesswork, but afaics it is working. No idea if there
is a better way to determine the temperature offset.

 drivers/hwmon/k10temp.c | 42 +++++++++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index ce3b91f22e30..da8fec89020e 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -25,6 +25,10 @@
 #include <linux/pci.h>
 #include <asm/processor.h>
 
+#ifndef PCI_DEVICE_ID_AMD_17H_DF_F3
+#define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
+#endif
+
 MODULE_DESCRIPTION("AMD Family 10h+ CPU core temperature monitor");
 MODULE_AUTHOR("Clemens Ladisch <clemens@ladisch.de>");
 MODULE_LICENSE("GPL");
@@ -61,31 +65,46 @@ static DEFINE_MUTEX(nb_smu_ind_mutex);
  */
 #define F15H_M60H_REPORTED_TEMP_CTRL_OFFSET	0xd8200ca4
 
-static void amd_nb_smu_index_read(struct pci_dev *pdev, unsigned int devfn,
-				  int offset, u32 *val)
+/* F17h M01h Access througn SMN */
+#define F17H_M01H_REPORTED_TEMP_CTRL_OFFSET	0x00059800
+
+static void amd_nb_index_read(struct pci_dev *pdev, unsigned int devfn,
+			      unsigned int base, int offset, u32 *val)
 {
 	mutex_lock(&nb_smu_ind_mutex);
 	pci_bus_write_config_dword(pdev->bus, devfn,
-				   0xb8, offset);
+				   base, offset);
 	pci_bus_read_config_dword(pdev->bus, devfn,
-				  0xbc, val);
+				  base + 4, val);
 	mutex_unlock(&nb_smu_ind_mutex);
 }
 
 static ssize_t temp1_input_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
-	u32 regval;
 	struct pci_dev *pdev = dev_get_drvdata(dev);
-
-	if (boot_cpu_data.x86 == 0x15 && boot_cpu_data.x86_model == 0x60) {
-		amd_nb_smu_index_read(pdev, PCI_DEVFN(0, 0),
-				      F15H_M60H_REPORTED_TEMP_CTRL_OFFSET,
-				      &regval);
+	u32 regval;
+	u32 temp;
+
+	if (boot_cpu_data.x86 == 0x15 && (boot_cpu_data.x86_model == 0x60 ||
+					  boot_cpu_data.x86_model == 0x70)) {
+		amd_nb_index_read(pdev, PCI_DEVFN(0, 0), 0xb8,
+				  F15H_M60H_REPORTED_TEMP_CTRL_OFFSET, &regval);
+	} else if (boot_cpu_data.x86 == 0x17) {
+		amd_nb_index_read(pdev, PCI_DEVFN(0, 0), 0x60,
+				  F17H_M01H_REPORTED_TEMP_CTRL_OFFSET, &regval);
 	} else {
 		pci_read_config_dword(pdev, REG_REPORTED_TEMPERATURE, &regval);
 	}
-	return sprintf(buf, "%u\n", (regval >> 21) * 125);
+
+	temp = (regval >> 21) * 125;
+	/* Ryzen 1700X and 1800X require manually applied temperature offset */
+	if (boot_cpu_data.x86_model_id &&
+	    (strstr(boot_cpu_data.x86_model_id, "AMD Ryzen 7 1700X") ||
+	     strstr(boot_cpu_data.x86_model_id, "AMD Ryzen 7 1800X")))
+		temp -= 20000;
+
+	return sprintf(buf, "%u\n", temp);
 }
 
 static ssize_t temp1_max_show(struct device *dev,
@@ -214,6 +233,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M60H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_NB_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, k10temp_id_table);
-- 
2.7.4
