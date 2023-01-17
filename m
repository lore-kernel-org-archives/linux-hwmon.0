Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8197BC3DA78
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 Jan 2023 16:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjAQQN7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 Jan 2023 11:13:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbjAQQN6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Jan 2023 11:13:58 -0500
Received: from mail.zeus06.de (www.zeus06.de [194.117.254.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FAF23B675
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Jan 2023 08:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=kicherer.org; h=from:to
        :cc:subject:date:message-id:in-reply-to:references:mime-version
        :content-transfer-encoding; s=k1; bh=xaDUioXq2np/SrkKC4F+rHZHT8L
        OVi6lIhfFpr1s3PY=; b=GHym9QEcbWFWXh3O7tHnkUBaUxVnhuabmP/X3LGPVWP
        KprPa2ZhLNhGAulrfxW+zSbr9Cr2PZsJtHYCJ2cOgR/K9mS8Xlwc+8t8q2N4oCTo
        X5LDk5XdA3udvE91QLRFwlHiQfT1h37iFdPsSeceKngEBQGgtKdCsusQJNy565b8
        =
Received: (qmail 1170876 invoked from network); 17 Jan 2023 17:13:55 +0100
Received: by mail.zeus06.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jan 2023 17:13:55 +0100
X-UD-Smtp-Session: l3s6476p2@Q+dR/Hfy1u7CtAHJ
From:   Mario Kicherer <dev@kicherer.org>
To:     linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        Mario Kicherer <dev@kicherer.org>
Subject: [PATCH v3 1/3] hwmon: add initial NXP MC34VR500 PMIC monitoring support
Date:   Tue, 17 Jan 2023 17:13:38 +0100
Message-Id: <20230117161340.1310936-2-dev@kicherer.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117161340.1310936-1-dev@kicherer.org>
References: <20230117161340.1310936-1-dev@kicherer.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch adds initial monitoring support for the MC34VR500 PMIC. In its
current form, input voltage and temperature alarms are reported to hwmon.

Datasheet:
 - https://www.nxp.com/docs/en/data-sheet/MC34VR500.pdf

Changes since v1:
 - included required #defines directly in the C file
 - removed separate header file
 - removed #defines for unimplemented sensors
 - removed error log output
 - use hwmon_device_register_with_info API
 - cleaned probe function

Signed-off-by: Mario Kicherer <dev@kicherer.org>
---
 drivers/hwmon/Kconfig     |   7 ++
 drivers/hwmon/Makefile    |   1 +
 drivers/hwmon/mc34vr500.c | 245 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 253 insertions(+)
 create mode 100644 drivers/hwmon/mc34vr500.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 3176c33af6c6..69d4c1609494 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1166,6 +1166,13 @@ config SENSORS_MAX31790
 	  This driver can also be built as a module. If so, the module
 	  will be called max31790.
 
+config SENSORS_MC34VR500
+	tristate "NXP MC34VR500 hardware monitoring driver"
+	depends on I2C
+	help
+	  If you say yes here you get support for the temperature and input
+	  voltage sensors of the NXP MC34VR500.
+
 config SENSORS_MCP3021
 	tristate "Microchip MCP3021 and compatibles"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index e2e4e87b282f..4bef13d16c66 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -149,6 +149,7 @@ obj-$(CONFIG_SENSORS_MAX6650)	+= max6650.o
 obj-$(CONFIG_SENSORS_MAX6697)	+= max6697.o
 obj-$(CONFIG_SENSORS_MAX31790)	+= max31790.o
 obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
+obj-$(CONFIG_SENSORS_MC34VR500)	+= mc34vr500.o
 obj-$(CONFIG_SENSORS_MCP3021)	+= mcp3021.o
 obj-$(CONFIG_SENSORS_TC654)	+= tc654.o
 obj-$(CONFIG_SENSORS_TPS23861)	+= tps23861.o
diff --git a/drivers/hwmon/mc34vr500.c b/drivers/hwmon/mc34vr500.c
new file mode 100644
index 000000000000..211dc44af42e
--- /dev/null
+++ b/drivers/hwmon/mc34vr500.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * An hwmon driver for the NXP MC34VR500 PMIC
+ *
+ * Author: Mario Kicherer <dev@kicherer.org>
+ */
+
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+
+#define MC34VR500_I2C_ADDR		0x08
+#define MC34VR500_DEVICEID_VALUE	0x14
+
+/* INTSENSE0 */
+#define ENS_BIT		BIT(0)
+#define LOWVINS_BIT	BIT(1)
+#define THERM110S_BIT	BIT(2)
+#define THERM120S_BIT	BIT(3)
+#define THERM125S_BIT	BIT(4)
+#define THERM130S_BIT	BIT(5)
+
+#define MC34VR500_DEVICEID	0x00
+
+#define MC34VR500_SILICONREVID	0x03
+#define MC34VR500_FABID		0x04
+#define MC34VR500_INTSTAT0	0x05
+#define MC34VR500_INTMASK0	0x06
+#define MC34VR500_INTSENSE0	0x07
+
+struct mc34vr500_data {
+	struct device *hwmon_dev;
+	struct i2c_client *client;
+	struct regmap *regmap;
+};
+
+static irqreturn_t mc34vr500_process_interrupt(int irq, void *userdata)
+{
+	struct mc34vr500_data *data = (struct mc34vr500_data *)userdata;
+	unsigned int reg;
+	int ret;
+
+	ret = regmap_read(data->regmap, MC34VR500_INTSTAT0, &reg);
+	if (ret < 0)
+		return IRQ_HANDLED;
+
+	if (reg) {
+		if (reg & LOWVINS_BIT)
+			hwmon_notify_event(data->hwmon_dev, hwmon_in,
+					   hwmon_in_min_alarm, 0);
+
+		if (reg & THERM110S_BIT)
+			hwmon_notify_event(data->hwmon_dev, hwmon_temp,
+					   hwmon_temp_max_alarm, 0);
+
+		if (reg & THERM120S_BIT)
+			hwmon_notify_event(data->hwmon_dev, hwmon_temp,
+					   hwmon_temp_crit_alarm, 0);
+
+		if (reg & THERM130S_BIT)
+			hwmon_notify_event(data->hwmon_dev, hwmon_temp,
+					   hwmon_temp_emergency_alarm, 0);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static umode_t mc34vr500_is_visible(const void *data,
+				    enum hwmon_sensor_types type,
+				    u32 attr, int channel)
+{
+	switch (attr) {
+	case hwmon_in_min_alarm:
+	case hwmon_temp_max_alarm:
+	case hwmon_temp_crit_alarm:
+	case hwmon_temp_emergency_alarm:
+		return 0444;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mc34vr500_alarm_read(struct mc34vr500_data *data, int index,
+				long *val)
+{
+	unsigned int reg;
+	int ret;
+
+	ret = regmap_read(data->regmap, MC34VR500_INTSTAT0, &reg);
+	if (ret < 0)
+		return ret;
+
+	*val = !!(reg & index);
+
+	/* write 1 to clear */
+	reg = index;
+	regmap_write(data->regmap, MC34VR500_INTSTAT0, reg);
+
+	return 0;
+}
+
+static int mc34vr500_read(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long *val)
+{
+	struct mc34vr500_data *data = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_min_alarm:
+			return mc34vr500_alarm_read(data, LOWVINS_BIT, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_max_alarm:
+			return mc34vr500_alarm_read(data, THERM110S_BIT, val);
+		case hwmon_temp_crit_alarm:
+			return mc34vr500_alarm_read(data, THERM120S_BIT, val);
+		case hwmon_temp_emergency_alarm:
+			return mc34vr500_alarm_read(data, THERM130S_BIT, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_channel_info *mc34vr500_info[] = {
+	HWMON_CHANNEL_INFO(in, HWMON_I_MIN_ALARM),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM
+			   | HWMON_T_EMERGENCY_ALARM),
+	NULL,
+};
+
+static const struct hwmon_ops mc34vr500_hwmon_ops = {
+	.is_visible = mc34vr500_is_visible,
+	.read = mc34vr500_read,
+};
+
+static const struct hwmon_chip_info mc34vr500_chip_info = {
+	.ops = &mc34vr500_hwmon_ops,
+	.info = mc34vr500_info,
+};
+
+static const struct regmap_config mc34vr500_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MC34VR500_INTSENSE0,
+};
+
+static int mc34vr500_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct mc34vr500_data *data;
+	struct device *hwmon_dev;
+	int ret;
+	unsigned int reg, revid, fabid;
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_i2c(client, &mc34vr500_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	data = devm_kzalloc(dev, sizeof(struct mc34vr500_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = regmap;
+	data->client = client;
+
+	ret = regmap_read(regmap, MC34VR500_DEVICEID, &reg);
+	if (ret < 0)
+		return ret;
+
+	if (reg != MC34VR500_DEVICEID_VALUE)
+		return -ENODEV;
+
+	ret = regmap_read(regmap, MC34VR500_SILICONREVID, &revid);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_read(regmap, MC34VR500_FABID, &fabid);
+	if (ret < 0)
+		return ret;
+
+	dev_dbg(dev, "mc34vr500: revid 0x%x fabid 0x%x\n", revid, fabid);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data,
+							 &mc34vr500_chip_info,
+							 NULL);
+	data->hwmon_dev = hwmon_dev;
+
+	if (client->irq) {
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						mc34vr500_process_interrupt,
+						IRQF_TRIGGER_RISING |
+						IRQF_ONESHOT |
+						IRQF_SHARED,
+						dev_name(dev), data);
+		if (ret)
+			return ret;
+
+		/* clear interrupts */
+		ret = regmap_write(regmap, MC34VR500_INTSTAT0, 0);
+		if (ret)
+			return ret;
+
+		/* unmask interrupts */
+		ret = regmap_write(regmap, MC34VR500_INTMASK0,
+				   ~(LOWVINS_BIT | THERM110S_BIT));
+		if (ret)
+			return ret;
+	}
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id mc34vr500_id[] = {
+	{ "mc34vr500", 0 },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, mc34vr500_id);
+
+static struct i2c_driver mc34vr500_driver = {
+	.driver = {
+		   .name = "mc34vr500",
+		    },
+	.probe_new = mc34vr500_probe,
+	.id_table = mc34vr500_id,
+};
+
+module_i2c_driver(mc34vr500_driver);
+
+MODULE_AUTHOR("Mario Kicherer <dev@kicherer.org>");
+
+MODULE_DESCRIPTION("MC34VR500 driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

