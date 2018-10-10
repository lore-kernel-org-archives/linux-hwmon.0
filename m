Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37128 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727215AbeJJLxf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Oct 2018 07:53:35 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (ina3221) Add operating mode support
Date: Tue,  9 Oct 2018 21:33:10 -0700
Message-Id: <20181010043310.30873-3-nicoleotsuka@gmail.com>
In-Reply-To: <20181010043310.30873-1-nicoleotsuka@gmail.com>
References: <20181010043310.30873-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The hwmon core now has a new optional mode interface. So this patch
just implements this mode support so that user space can check and
configure via sysfs node its operating modes: power-down, one-shot,
and continuous modes.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/hwmon/ina3221.c | 64 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index d61688f04594..5218fd85506d 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -77,6 +77,28 @@ enum ina3221_channels {
 	INA3221_NUM_CHANNELS
 };
 
+enum ina3221_modes {
+	INA3221_MODE_POWERDOWN,
+	INA3221_MODE_ONESHOT,
+	INA3221_MODE_CONTINUOUS,
+	INA3221_NUM_MODES,
+};
+
+static const char *ina3221_mode_names[INA3221_NUM_MODES] = {
+	[INA3221_MODE_POWERDOWN] = "power-down",
+	[INA3221_MODE_ONESHOT] = "one-shot",
+	[INA3221_MODE_CONTINUOUS] = "continuous",
+};
+
+static const u16 ina3221_mode_val[] = {
+	[INA3221_MODE_POWERDOWN] = INA3221_CONFIG_MODE_POWERDOWN,
+	[INA3221_MODE_ONESHOT] = INA3221_CONFIG_MODE_SHUNT |
+				     INA3221_CONFIG_MODE_BUS,
+	[INA3221_MODE_CONTINUOUS] = INA3221_CONFIG_MODE_CONTINUOUS |
+				    INA3221_CONFIG_MODE_SHUNT |
+				    INA3221_CONFIG_MODE_BUS,
+};
+
 /**
  * struct ina3221_input - channel input source specific information
  * @label: label of channel input source
@@ -386,9 +408,51 @@ static const struct hwmon_ops ina3221_hwmon_ops = {
 	.write = ina3221_write,
 };
 
+static int ina3221_mode_get_index(struct device *dev, unsigned int *index)
+{
+	struct ina3221_data *ina = dev_get_drvdata(dev);
+	u16 mode = ina->reg_config & INA3221_CONFIG_MODE_MASK;
+
+	if (mode == INA3221_CONFIG_MODE_POWERDOWN)
+		*index = INA3221_MODE_POWERDOWN;
+	if (mode & INA3221_CONFIG_MODE_CONTINUOUS)
+		*index = INA3221_MODE_CONTINUOUS;
+	else
+		*index = INA3221_MODE_ONESHOT;
+
+	return 0;
+}
+
+static int ina3221_mode_set_index(struct device *dev, unsigned int index)
+{
+	struct ina3221_data *ina = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regmap_update_bits(ina->regmap, INA3221_CONFIG,
+				 INA3221_CONFIG_MODE_MASK,
+				 ina3221_mode_val[index]);
+	if (ret)
+		return ret;
+
+	/* Cache the latest config register value */
+	ret = regmap_read(ina->regmap, INA3221_CONFIG, &ina->reg_config);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct hwmon_mode ina3221_hwmon_mode = {
+	.names = ina3221_mode_names,
+	.list_size = INA3221_NUM_MODES,
+	.get_index = ina3221_mode_get_index,
+	.set_index = ina3221_mode_set_index,
+};
+
 static const struct hwmon_chip_info ina3221_chip_info = {
 	.ops = &ina3221_hwmon_ops,
 	.info = ina3221_info,
+	.mode = &ina3221_hwmon_mode,
 };
 
 /* Extra attribute groups */
-- 
2.17.1
