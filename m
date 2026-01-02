Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE701A9FBA;
	Fri,  2 Jan 2026 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767348973; cv=none; b=BC9bubFvTVMFukjY5LvE2x1c6c7yXHhxC4Aj1LRjmb69jgXMKQU/uqjdXWSN0e30OzDCtXqOAaac6TFl5TQ3T9q79Z5MItAZmYlzmEQisq4r6RLd+YHgNa2hv7clstRSkV6JxYT6asw3+PBS1SAe9r+zZXSUTNR+rnontEBVZpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767348973; c=relaxed/simple;
	bh=YHIG2teSNRD9jK8S8mBpJW0Iq87DILrFYdZNZXIRgu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=erJ/ijvxrLpdzxsJEE7/jzNeW0IRSZ6qxdkdHGJhLi7IZegNo9vqf49GhB6s2I6I0Y0NMmsKNWHrxKN6IQ55XzpCFmxqCKkoO/9zrkOJAWaxm2iVlOzTQop6f/BV5KLMIOLqnwi2xDXhvrBsX97Uc7KtkNu8covdmNRbs1l6jo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=pal3i1EJ; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="pal3i1EJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=xvP6YGWZdJ3cpp1y+FwX/0J+boMg67bhQxhgAQBiUdM=; b=pal3i1EJGIT8yylthUuWp7X/UH
	Tlz1Qo+NWVz82D02SFxstX2xx8SeLFSxuZFgcaY6BuSqzJlp6vk2ccoZeykCOf+WQlqKUlcjUGPqM
	P15reuRCsnL3phYayd2B7W7uxMSanWzAg2ksmhae1ZEdH0gB9h0aFbLgKN90Z3mX96vsp0D4RWZRQ
	0ChVghNL3fLRkneovQ51zk3EMX0sw3MuAlab83GWC3UrAHMnxnvIi2/QhfxjVGtJZ5XiB18TgB4MZ
	+qx685YKB9kuvgiPqUPEnInpTFljQa/VrwbLp0SCwU4Ultku26u7kMmkE417EmHWoWDmH4DjmGTXK
	ITtlLbRQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Fri, 02 Jan 2026 11:13:57 +0100
Subject: [PATCH v3 2/2] regulator: Add TPS65185 driver
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-tps65185-submit-v3-2-23bda35772f2@kemnade.info>
References: <20260102-tps65185-submit-v3-0-23bda35772f2@kemnade.info>
In-Reply-To: <20260102-tps65185-submit-v3-0-23bda35772f2@kemnade.info>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>, 
 Josua Mayer <josua.mayer@jm0.eu>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15691; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=YHIG2teSNRD9jK8S8mBpJW0Iq87DILrFYdZNZXIRgu8=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJnhs+6kmy38r79WJ7r5Pbt5SWP/BUG7PwUBkww3XpOzy
 bl/VSCno5SFQYyLQVZMkeWXtYLbJ5VnucFTI+xh5rAygQxh4OIUgIkoqzIytFUoZgQkxHFv6Jm0
 4V+Q8tZp+gt4/b5xb5ZKeiOge9PgB8NfCXW5t5+PcwQX7euZ9lZ6+o2d049cs3906aHecd89kzc
 0cQMA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Add a driver for the TPS65185 regulator. Implement handling of the various
gpio pins. Because the PWRUP (=enable) pin functionality can be achieved
by just using two bits instead, just ensure that it is set to a stable
value.
Implement the pair of symmetric LDOs as a single regulator because they
share a single voltage set register. As the VCOM regulator sits behind that
machinery, just define that one as a supply.
For simplicity, just add the temperature sensor (depending on external NTC)
directly.

There is a mechanism to measure some kick-back voltage during a defined EPD
operation, to calibrate the VCOM voltage setting and store that
non-volatile in the chip to be the power up default setup. That is not
implemented yet in the driver, but that also means that there is a
non-factory default value in these registers after power-up.

Tested-by: Josua Mayer <josua.mayer@jm0.eu>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/regulator/Kconfig    |  11 ++
 drivers/regulator/Makefile   |   1 +
 drivers/regulator/tps65185.c | 454 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 466 insertions(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d2335276cce5..5c539782e48d 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1690,6 +1690,17 @@ config REGULATOR_TPS65132
 	  This driver supports TPS65132 single inductor - dual output
 	  power supply specifically designed for display panels.
 
+config REGULATOR_TPS65185
+	tristate "TI TPS65185 EPD regulator"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  This driver supports the TPS65185 voltage regulator chip
+	  which is used to provide power to Electronic Paper Displays
+	  so it is found in E-Book readers.
+	  If HWWON is enabled, it also provides temperature measurement.
+
+
 config REGULATOR_TPS65217
 	tristate "TI TPS65217 Power regulators"
 	depends on MFD_TPS65217
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 1beba1493241..240de94cd432 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -192,6 +192,7 @@ obj-$(CONFIG_REGULATOR_TPS65023) += tps65023-regulator.o
 obj-$(CONFIG_REGULATOR_TPS6507X) += tps6507x-regulator.o
 obj-$(CONFIG_REGULATOR_TPS65086) += tps65086-regulator.o
 obj-$(CONFIG_REGULATOR_TPS65090) += tps65090-regulator.o
+obj-$(CONFIG_REGULATOR_TPS65185) += tps65185.o
 obj-$(CONFIG_REGULATOR_TPS65217) += tps65217-regulator.o
 obj-$(CONFIG_REGULATOR_TPS65218) += tps65218-regulator.o
 obj-$(CONFIG_REGULATOR_TPS65219) += tps65219-regulator.o
diff --git a/drivers/regulator/tps65185.c b/drivers/regulator/tps65185.c
new file mode 100644
index 000000000000..3286c9ab33d0
--- /dev/null
+++ b/drivers/regulator/tps65185.c
@@ -0,0 +1,454 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2025 Andreas Kemnade
+
+/* Datasheet: https://www.ti.com/lit/gpn/tps65185 */
+
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/hwmon.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regmap.h>
+
+#define TPS65185_REG_TMST_VALUE 0
+#define TPS65185_REG_ENABLE 1
+#define TPS65185_REG_VADJ 2
+#define TPS65185_REG_VCOM1 3
+#define TPS65185_REG_VCOM2 4
+#define TPS65185_REG_INT_EN1 5
+#define TPS65185_REG_INT_EN2 6
+#define TPS65185_REG_INT1 7
+#define TPS65185_REG_INT2 8
+#define TPS65185_REG_TMST1 0xd
+#define TPS65185_REG_TMST2 0xe
+#define TPS65185_REG_PG 0xf
+#define TPS65185_REG_REVID 0x10
+
+#define TPS65185_READ_THERM BIT(7)
+#define TPS65185_CONV_END BIT(5)
+
+#define TPS65185_ENABLE_ACTIVE BIT(7)
+#define TPS65185_ENABLE_STANDBY BIT(6)
+
+#define PGOOD_TIMEOUT_MSECS 200
+
+struct tps65185_data {
+	struct device *dev;
+	struct regmap *regmap;
+	struct gpio_desc *pgood_gpio;
+	struct gpio_desc *pwrup_gpio;
+	struct gpio_desc *vcom_ctrl_gpio;
+	struct gpio_desc *wakeup_gpio;
+	struct completion pgood_completion;
+	int pgood_irq;
+	struct completion tmst_completion;
+};
+
+static const struct hwmon_channel_info *tps65185_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static int tps65185_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, long *temp)
+{
+	struct tps65185_data *data = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	reinit_completion(&data->tmst_completion);
+	/* start acquisition */
+	regmap_update_bits(data->regmap, TPS65185_REG_TMST1,
+			   TPS65185_READ_THERM, TPS65185_READ_THERM);
+	wait_for_completion_timeout(&data->tmst_completion,
+				    msecs_to_jiffies(PGOOD_TIMEOUT_MSECS));
+	ret = regmap_read(data->regmap, TPS65185_REG_TMST1, &val);
+	if (!(val & TPS65185_CONV_END))
+		return -ETIMEDOUT;
+
+	ret = regmap_read(data->regmap, TPS65185_REG_TMST_VALUE, &val);
+	if (ret)
+		return ret;
+
+	*temp = (s8)val * 1000;
+
+	return 0;
+}
+
+static umode_t tps65185_hwmon_is_visible(const void *data,
+					 enum hwmon_sensor_types type,
+					 u32 attr, int channel)
+{
+	return 0444;
+}
+
+static const struct hwmon_ops tps65185_hwmon_ops = {
+	.is_visible = tps65185_hwmon_is_visible,
+	.read = tps65185_hwmon_read,
+};
+
+static const struct hwmon_chip_info tps65185_chip_info = {
+	.ops = &tps65185_hwmon_ops,
+	.info = tps65185_info,
+};
+
+static bool tps65185_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TPS65185_REG_TMST_VALUE:
+	case TPS65185_REG_ENABLE:
+	case TPS65185_REG_VCOM2:
+	case TPS65185_REG_INT1:
+	case TPS65185_REG_INT2:
+	case TPS65185_REG_TMST1:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x10,
+	.cache_type = REGCACHE_MAPLE,
+	.volatile_reg = tps65185_volatile_reg,
+};
+
+static const struct regulator_ops tps65185_v3p3ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static int tps65185_check_powergood(struct regulator_dev *rdev)
+{
+	struct tps65185_data *data = rdev_get_drvdata(rdev);
+
+	return gpiod_get_value_cansleep(data->pgood_gpio);
+}
+
+static int tps65185_vposneg_get_voltage_sel(struct regulator_dev *rdev)
+{
+	int ret;
+
+	ret = regulator_get_voltage_sel_regmap(rdev);
+	if (ret < 0)
+		return ret;
+
+	/* highest value is lowest voltage */
+	return 6 - ret;
+}
+
+static int tps65185_vposneg_set_voltage_sel(struct regulator_dev *rdev, unsigned int selector)
+{
+	return regulator_set_voltage_sel_regmap(rdev, 6 - selector);
+}
+
+static irqreturn_t pgood_handler(int irq, void *dev_id)
+{
+	struct tps65185_data *data = dev_id;
+
+	complete(&data->pgood_completion);
+
+	return IRQ_HANDLED;
+}
+
+static int tps65185_vposneg_enable(struct regulator_dev *rdev)
+{
+	struct tps65185_data *data = rdev_get_drvdata(rdev);
+	int ret;
+
+	reinit_completion(&data->pgood_completion);
+	if (data->pwrup_gpio)
+		ret = gpiod_set_value_cansleep(data->pwrup_gpio, 1);
+	else
+		ret = regmap_update_bits(data->regmap, TPS65185_REG_ENABLE,
+					 TPS65185_ENABLE_ACTIVE,
+					 TPS65185_ENABLE_ACTIVE);
+
+	if (ret)
+		return ret;
+
+	dev_dbg(data->dev, "turning on...");
+	wait_for_completion_timeout(&data->pgood_completion,
+				    msecs_to_jiffies(PGOOD_TIMEOUT_MSECS));
+	dev_dbg(data->dev, "turned on");
+	if (gpiod_get_value_cansleep(data->pgood_gpio) != 1)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int tps65185_vposneg_disable(struct regulator_dev *rdev)
+{
+	struct tps65185_data *data = rdev_get_drvdata(rdev);
+	int ret;
+
+	if (data->pwrup_gpio)
+		ret = gpiod_set_value_cansleep(data->pwrup_gpio, 0);
+	else
+		ret = regmap_update_bits(data->regmap, TPS65185_REG_ENABLE,
+					 TPS65185_ENABLE_STANDBY,
+					 TPS65185_ENABLE_STANDBY);
+
+	return ret;
+}
+
+static int tps65185_vcom_set_voltage_sel(struct regulator_dev *rdev, unsigned int selector)
+{
+	struct tps65185_data *data = rdev_get_drvdata(rdev);
+	int ret;
+
+	ret = regmap_update_bits(data->regmap, TPS65185_REG_VCOM2, BIT(0), selector >> 8);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write(data->regmap, TPS65185_REG_VCOM1, selector & 0xFF);
+}
+
+static int tps65185_vcom_get_voltage_sel(struct regulator_dev *rdev)
+{
+	struct tps65185_data *data = rdev_get_drvdata(rdev);
+	int ret;
+	unsigned int sel, sel2;
+
+	ret = regmap_read(data->regmap, TPS65185_REG_VCOM1, &sel);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_read(data->regmap, TPS65185_REG_VCOM2, &sel2);
+	if (ret < 0)
+		return ret;
+
+	if (sel2 & BIT(0))
+		sel |= 0x100;
+
+	return sel;
+}
+
+static const struct regulator_ops tps65185_vcom_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.map_voltage = regulator_map_voltage_linear,
+	.set_voltage_sel = tps65185_vcom_set_voltage_sel,
+	.get_voltage_sel = tps65185_vcom_get_voltage_sel,
+};
+
+static const struct regulator_ops tps65185_vposneg_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.map_voltage = regulator_map_voltage_linear,
+	.enable = tps65185_vposneg_enable,
+	.disable = tps65185_vposneg_disable,
+	.is_enabled = tps65185_check_powergood,
+	.set_voltage_sel = tps65185_vposneg_set_voltage_sel,
+	.get_voltage_sel = tps65185_vposneg_get_voltage_sel,
+};
+
+static const struct regulator_desc regulators[] = {
+	{
+		.name = "v3p3",
+		.of_match = of_match_ptr("v3p3"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = 0,
+		.ops = &tps65185_v3p3ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = TPS65185_REG_ENABLE,
+		.enable_mask = BIT(5),
+		.n_voltages = 1,
+		.min_uV = 3300000,
+	},
+	{
+		.name = "vposneg",
+		.of_match = of_match_ptr("vposneg"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = 1,
+		.ops = &tps65185_vposneg_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.n_voltages = 4,
+		.vsel_reg = TPS65185_REG_VADJ,
+		.vsel_mask = 0x7,
+		.min_uV = 14250000,
+		.uV_step = 250000,
+	}
+};
+
+static const struct regulator_desc vcom_regulator_desc = {
+	.name = "vcom",
+	.of_match = of_match_ptr("vcom"),
+	.regulators_node = of_match_ptr("regulators"),
+	.supply_name = "vposneg",
+	.id = 2,
+	.ops = &tps65185_vcom_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+	.n_voltages = 511,
+	.min_uV = 0,
+	.uV_step = 10000,
+};
+
+static irqreturn_t tps65185_irq_thread(int irq, void *dev_id)
+{
+	struct tps65185_data *data = dev_id;
+	unsigned int int_status_1, int_status_2;
+	int ret;
+
+	/* read both status to have irq cleared */
+	ret = regmap_read(data->regmap, TPS65185_REG_INT1, &int_status_1);
+	if (ret)
+		return IRQ_NONE;
+
+	ret = regmap_read(data->regmap, TPS65185_REG_INT2, &int_status_2);
+	if (ret)
+		return IRQ_NONE;
+
+	if (int_status_2 & BIT(0))
+		complete(&data->tmst_completion);
+
+	dev_dbg(data->dev, "irq status %02x %02x\n", int_status_1, int_status_2);
+
+	if (int_status_1 || int_status_2)
+		return IRQ_HANDLED;
+
+	return IRQ_NONE;
+}
+
+static int tps65185_probe(struct i2c_client *client)
+{
+	struct tps65185_data *data;
+	struct regulator_config config = { };
+	struct regulator_dev *rdev;
+	int ret = 0;
+	int i;
+
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	data->regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(data->regmap),
+				     "failed to allocate regmap!\n");
+
+	data->pgood_gpio = devm_gpiod_get(&client->dev, "pwr-good", GPIOD_IN);
+	if (IS_ERR(data->pgood_gpio))
+		return dev_err_probe(&client->dev,
+				     PTR_ERR(data->pgood_gpio),
+				     "failed to get power good gpio\n");
+
+	data->pgood_irq = gpiod_to_irq(data->pgood_gpio);
+	if (data->pgood_irq < 0)
+		return data->pgood_irq;
+
+	data->pwrup_gpio = devm_gpiod_get_optional(&client->dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(data->pwrup_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(data->pwrup_gpio),
+				     "failed to get pwrup gpio\n");
+
+	data->wakeup_gpio = devm_gpiod_get_optional(&client->dev, "wakeup", GPIOD_OUT_HIGH);
+	if (IS_ERR(data->wakeup_gpio))
+		return dev_err_probe(&client->dev,
+				     PTR_ERR(data->wakeup_gpio),
+				     "failed to get wakeup gpio\n");
+
+	data->vcom_ctrl_gpio = devm_gpiod_get_optional(&client->dev, "vcom-ctrl", GPIOD_OUT_LOW);
+	if (IS_ERR(data->vcom_ctrl_gpio))
+		return dev_err_probe(&client->dev,
+				     PTR_ERR(data->vcom_ctrl_gpio),
+				     "failed to get vcm ctrl gpio\n");
+
+	ret = devm_regulator_get_enable(&client->dev, "vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to get vin regulator\n");
+
+	data->dev = &client->dev;
+	i2c_set_clientdata(client, data);
+
+	init_completion(&data->pgood_completion);
+	init_completion(&data->tmst_completion);
+
+	ret = devm_request_threaded_irq(&client->dev, data->pgood_irq, NULL,
+					pgood_handler,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"PGOOD", data);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to request power good irq\n");
+
+	if (client->irq) {
+		ret = devm_request_threaded_irq(&client->dev, client->irq,
+						NULL, tps65185_irq_thread,
+						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						"tps65185", data);
+		if (ret)
+			return dev_err_probe(&client->dev, ret,
+					     "failed to request irq\n");
+	}
+
+	ret = regmap_update_bits(data->regmap, TPS65185_REG_INT_EN2, BIT(0), BIT(0));
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to enable temp irq\n");
+
+	config.driver_data = data;
+	config.dev = &client->dev;
+	config.regmap = data->regmap;
+
+	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
+		rdev = devm_regulator_register(&client->dev, &regulators[i],
+					       &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(&client->dev, PTR_ERR(rdev),
+					     "failed to register %s regulator\n",
+					     regulators[i].name);
+	}
+
+	config.ena_gpiod = data->vcom_ctrl_gpio;
+	rdev = devm_regulator_register(&client->dev, &vcom_regulator_desc, &config);
+	if (IS_ERR(rdev))
+		return dev_err_probe(&client->dev, PTR_ERR(rdev),
+				     "failed to register vcom regulator\n");
+
+	if (IS_REACHABLE(CONFIG_HWMON)) {
+		struct device *hwmon_dev;
+
+		hwmon_dev = devm_hwmon_device_register_with_info(&client->dev, "tps65185", data,
+								 &tps65185_chip_info, NULL);
+		if (IS_ERR(hwmon_dev))
+			dev_notice(&client->dev, "failed to register hwmon\n");
+	}
+
+	return 0;
+}
+
+static const struct of_device_id tps65185_dt_ids[] = {
+	{
+		.compatible = "ti,tps65185",
+	}, {
+		/* sentinel */
+	}
+};
+MODULE_DEVICE_TABLE(of, tps65185_dt_ids);
+
+static struct i2c_driver tps65185_i2c_driver = {
+	.driver = {
+		   .name = "tps65185",
+		   .of_match_table = tps65185_dt_ids,
+	},
+	.probe = tps65185_probe,
+};
+
+module_i2c_driver(tps65185_i2c_driver);
+
+/* Module information */
+MODULE_DESCRIPTION("TPS65185 regulator driver");
+MODULE_LICENSE("GPL");
+

-- 
2.47.3

