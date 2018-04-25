Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:52079 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752884AbeDYMWj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Apr 2018 08:22:39 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2] hwmon: (k10temp) Add temperature offset for Ryzen 2700X
Date: Wed, 25 Apr 2018 05:22:34 -0700
Message-Id: <1524658954-5673-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Ryzen 2700X has a temperature offset of 10 degrees C.
On some systems, it has an additional temperature offset of 49 degrees C.
Experiments show that this offset is enabled if bit 20 of the 'Reported
Temperature Control' register is set. Take this into account as well.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Address secondary temperature adjustment

 drivers/hwmon/k10temp.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 051a72eecb24..d19d08f81c6f 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -72,6 +72,7 @@ struct k10temp_data {
 	struct pci_dev *pdev;
 	void (*read_tempreg)(struct pci_dev *pdev, u32 *regval);
 	int temp_offset;
+	u32 temp_adjust_mask;
 };
 
 struct tctl_offset {
@@ -84,6 +85,7 @@ static const struct tctl_offset tctl_offset_table[] = {
 	{ 0x17, "AMD Ryzen 5 1600X", 20000 },
 	{ 0x17, "AMD Ryzen 7 1700X", 20000 },
 	{ 0x17, "AMD Ryzen 7 1800X", 20000 },
+	{ 0x17, "AMD Ryzen 7 2700X", 10000 },
 	{ 0x17, "AMD Ryzen Threadripper 1950X", 27000 },
 	{ 0x17, "AMD Ryzen Threadripper 1920X", 27000 },
 	{ 0x17, "AMD Ryzen Threadripper 1900X", 27000 },
@@ -129,6 +131,8 @@ static ssize_t temp1_input_show(struct device *dev,
 
 	data->read_tempreg(data->pdev, &regval);
 	temp = (regval >> 21) * 125;
+	if (regval & data->temp_adjust_mask)
+		temp -= 49000;
 	if (temp > data->temp_offset)
 		temp -= data->temp_offset;
 	else
@@ -259,12 +263,14 @@ static int k10temp_probe(struct pci_dev *pdev,
 	data->pdev = pdev;
 
 	if (boot_cpu_data.x86 == 0x15 && (boot_cpu_data.x86_model == 0x60 ||
-					  boot_cpu_data.x86_model == 0x70))
+					  boot_cpu_data.x86_model == 0x70)) {
 		data->read_tempreg = read_tempreg_nb_f15;
-	else if (boot_cpu_data.x86 == 0x17)
+	} else if (boot_cpu_data.x86 == 0x17) {
+		data->temp_adjust_mask = 0x80000;
 		data->read_tempreg = read_tempreg_nb_f17;
-	else
+	} else {
 		data->read_tempreg = read_tempreg_pci;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(tctl_offset_table); i++) {
 		const struct tctl_offset *entry = &tctl_offset_table[i];
-- 
2.7.4

