Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Clemens Ladisch <clemens@ladisch.de>
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 3/3] hwmon: (k10temp) Add support for temperature offsets
Date: Wed,  6 Sep 2017 15:36:16 -0700
Message-Id: <1504737376-32013-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1504737376-32013-1-git-send-email-linux@roeck-us.net>
References: <1504737376-32013-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Add support for handling temperature offset values for various AMD CPUs,
similar to the code used in the coretemp driver for Intel CPUs. This is
primarily for Ryzen CPUs (which has documented temperature offsets),
but the code is kept generic to simplify adding additional CPUs.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Moved temperature offset handling into separate patch.
    Temperature offset is now determined once in probe function.
    Made temperature handling more generic, and support more chips.

 drivers/hwmon/k10temp.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 8ce27b6b78be..c1a59e4c67b0 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -71,6 +71,24 @@ static DEFINE_MUTEX(nb_smu_ind_mutex);
 struct k10temp_data {
 	struct pci_dev *pdev;
 	void (*read_tempreg)(struct pci_dev *pdev, u32 *regval);
+	int temp_offset;
+};
+
+struct tctl_offset {
+	u8 model;
+	char const *id;
+	int offset;
+};
+
+static const struct tctl_offset tctl_offset_table[] = {
+	{ 0x17, "AMD Ryzen 7 1600X", 20000 },
+	{ 0x17, "AMD Ryzen 7 1700X", 20000 },
+	{ 0x17, "AMD Ryzen 7 1800X", 20000 },
+	{ 0x17, "AMD Ryzen Threadripper 1950X", 27000 },
+	{ 0x17, "AMD Ryzen Threadripper 1920X", 27000 },
+	{ 0x17, "AMD Ryzen Threadripper 1950", 10000 },
+	{ 0x17, "AMD Ryzen Threadripper 1920", 10000 },
+	{ 0x17, "AMD Ryzen Threadripper 1910", 10000 },
 };
 
 static void read_tempreg_pci(struct pci_dev *pdev, u32 *regval)
@@ -110,6 +128,7 @@ static ssize_t temp1_input_show(struct device *dev,
 
 	data->read_tempreg(data->pdev, &regval);
 	temp = (regval >> 21) * 125;
+	temp -= data->temp_offset;
 
 	return sprintf(buf, "%u\n", temp);
 }
@@ -217,6 +236,7 @@ static int k10temp_probe(struct pci_dev *pdev,
 	struct device *dev = &pdev->dev;
 	struct k10temp_data *data;
 	struct device *hwmon_dev;
+	int i;
 
 	if (unreliable) {
 		if (!force) {
@@ -242,6 +262,16 @@ static int k10temp_probe(struct pci_dev *pdev,
 	else
 		data->read_tempreg = read_tempreg_pci;
 
+	for (i = 0; i < ARRAY_SIZE(tctl_offset_table); i++) {
+		const struct tctl_offset *entry = &tctl_offset_table[i];
+
+		if (boot_cpu_data.x86 == entry->model &&
+		    strstr(boot_cpu_data.x86_model_id, entry->id)) {
+			data->temp_offset = entry->offset;
+			break;
+		}
+	}
+
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, "k10temp", data,
 							   k10temp_groups);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
-- 
2.7.4
