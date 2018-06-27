Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:45263 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751114AbeF0Mam (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Jun 2018 08:30:42 -0400
From: Vadim Pasternak <vadimp@mellanox.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, jiri@resnulli.us,
        michaelsh@mellanox.com, Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v3 1/1] hwmon: (mlxreg-fan) Add support for Mellanox FAN driver
Date: Wed, 27 Jun 2018 14:26:22 +0000
Message-Id: <1530109582-4851-1-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Driver obtains PWM and tachometers registers location according to the
system configuration and creates FAN/PWM hwmon objects and a cooling
device. PWM and tachometers are controlled through the on-board
programmable device, which exports its register map. This device could be
attached to any bus type, for which register mapping is supported. Single
instance is created with one PWM control, up to 12 tachometers and one
cooling device. It could be as many instances as programmable device
supports.

Currently driver will be activated from the Mellanox platform driver:
drivers/platform/x86/mlx-platform.c.
For the future ARM based systems it could be activated from the ARM
platform module.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v2->v3:
 Comments pointed out by Guenter:
 - Add documentation.
 - Simplify MLXREG_FAN_GET_FAULT macros.
 - Change type of fileds reg and mask in the structures
   mlxreg_fan_tacho and mlxreg_fan_pwm from int to u32
   for alignment with mlxreg_read and mlxreg_write.
 - Add validation for divider and round to ensure that
   there are no divide by zero. Validation is added to
   the probe routine.
 - Prevent setting of multiple "conf" entries.
 - Use driver name directly in
   devm_hwmon_device_register_with_info.
v1->v2:
 Comments pointed out by Guenter:
 - In Kconfig change "depends on REGMAP" to select REGMAP and
   use "depends on THERMAL || THERMAL=n".
 - Remove include for hwmon-sysfs.h.
 - Change comments for the structures description: remove
   replace "/**" with "/*" and mark as for internal use.
 - Fix multi-line comments (two occurrences).
 - Add dev handle to mlxreg_fan private data go get rid of
   dereferencing it.
 - Fix layout of "if" condition in mlxreg_fan_write.
 - Pass mlxreg_core_platform_data as argument to avoid needing it in
   mlxreg_fan.
 - Remove dev_info call from mlxreg_fan_config.
 - Replace dev_set_drvdata with platform_set_drvdata.
 - Remove assignment for name mlxreg_fan{%d}, use always mlxreg_fan.
 - Allow driver probing in case subsystem is not configured.
   Use IS_REACHABLE(CONFIG_THERMAL) for test.
---
 Documentation/hwmon/mlxreg-fan |  60 ++++++
 drivers/hwmon/Kconfig          |  12 ++
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/mlxreg-fan.c     | 476 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 549 insertions(+)
 create mode 100644 Documentation/hwmon/mlxreg-fan
 create mode 100644 drivers/hwmon/mlxreg-fan.c

diff --git a/Documentation/hwmon/mlxreg-fan b/Documentation/hwmon/mlxreg-fan
new file mode 100644
index 0000000..fc531c6
--- /dev/null
+++ b/Documentation/hwmon/mlxreg-fan
@@ -0,0 +1,60 @@
+Kernel driver mlxreg-fan
+========================
+
+Provides FAN control for the next Mellanox systems:
+QMB700, equipped with 40x200GbE InfiniBand ports;
+MSN3700, equipped with 32x200GbE or 16x400GbE Ethernet ports;
+MSN3410, equipped with 6x400GbE plus 48x50GbE Ethernet ports;
+MSN3800, equipped with 64x1000GbE Ethernet ports;
+These are the Top of the Rack systems, equipped with Mellanox switch
+board with Mellanox Quantum or Spectrume-2 devices.
+FAN controller is implemented by the programmable device logic.
+
+The default registers offsets set within the programmable device is as
+following:
+- pwm1			0xe3
+- fan1 (tacho1)		0xe4
+- fan2 (tacho2)		0xe5
+- fan3 (tacho3)		0xe6
+- fan4 (tacho4)		0xe7
+- fan5 (tacho5)		0xe8
+- fan6 (tacho6)		0xe9
+- fan7 (tacho7)		0xea
+- fan8 (tacho8)		0xeb
+- fan9 (tacho9)		0xec
+- fan10 (tacho10)	0xed
+- fan11 (tacho11)	0xee
+- fan12 (tacho12)	0xef
+This setup can be re-programmed with other registers.
+
+Author: Vadim Pasternak <vadimp@mellanox.com>
+
+Description
+-----------
+
+The driver implements a simple interface for driving a fan connected to
+a PWM output and tachometer inputs.
+This driver obtains PWM and tachometers registers location according to
+the system configuration and creates FAN/PWM hwmon objects and a cooling
+device. PWM and tachometers are sensed through the on-board programmable
+device, which exports its register map. This device could be attached to
+any bus type, for which register mapping is supported.
+Single instance is created with one PWM control, up to 12 tachometers and
+one cooling device. It could be as many instances as programmable device
+supports.
+The driver exposes the fan to the user space through the hwmon's and
+thermal's sysfs interfaces.
+
+/sys files in hwmon subsystem
+-----------------------------
+
+fan[1-12]_fault - RO files for tachometers TACH1-TACH12 fault indication
+fan[1-12]_input - RO files for tachometers TACH1-TACH12 input (in RPM)
+pwm1		- RW file for fan[1-12] target duty cycle (0..255)
+
+/sys files in thermal subsystem
+-------------------------------
+
+cur_state	- RW file for current cooling state of the cooling device
+		  (0..max_state)
+max_state	- RO file for maximum cooling state of the cooling device
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index f10840a..cd9ec2e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -937,6 +937,18 @@ config SENSORS_MCP3021
 	  This driver can also be built as a module.  If so, the module
 	  will be called mcp3021.
 
+config SENSORS_MLXREG_FAN
+	tristate "Mellanox Mellanox FAN driver"
+	depends on MELLANOX_PLATFORM
+	depends on THERMAL || THERMAL=n
+	select REGMAP
+	help
+	  This option enables support for the FAN control on the Mellanox
+	  Ethernet and InfiniBand switches. The driver can be activated by the
+	  platform device add call. Say Y to enable these. To compile this
+	  driver as a module, choose 'M' here: the module will be called
+	  mlxreg-fan.
+
 config SENSORS_TC654
 	tristate "Microchip TC654/TC655 and compatibles"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index e7d52a3..cac3c06 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -129,6 +129,7 @@ obj-$(CONFIG_SENSORS_MAX31790)	+= max31790.o
 obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
 obj-$(CONFIG_SENSORS_MCP3021)	+= mcp3021.o
 obj-$(CONFIG_SENSORS_TC654)	+= tc654.o
+obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
 obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
 obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
 obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775.o
diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
new file mode 100644
index 0000000..127e1cd
--- /dev/null
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -0,0 +1,476 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// Copyright (c) 2018 Mellanox Technologies. All rights reserved.
+// Copyright (c) 2018 Vadim Pasternak <vadimp@mellanox.com>
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/platform_data/mlxreg.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/thermal.h>
+
+#define MLXREG_FAN_MAX_TACHO		12
+#define MLXREG_FAN_MAX_STATE		10
+#define MLXREG_FAN_MIN_DUTY		51	/* 20% */
+#define MLXREG_FAN_MAX_DUTY		255	/* 100% */
+/*
+ * Minimum and maximum FAN allowed speed in percent: from 20% to 100%. Values
+ * MLXREG_FAN_MAX_STATE + x, where x is between 2 and 10 are used for
+ * setting FAN speed dynamic minimum. For example, if value is set to 14 (40%)
+ * cooling levels vector will be set to 4, 4, 4, 4, 4, 5, 6, 7, 8, 9, 10 to
+ * introduce PWM speed in percent: 40, 40, 40, 40, 40, 50, 60. 70, 80, 90, 100.
+ */
+#define MLXREG_FAN_SPEED_MIN		(MLXREG_FAN_MAX_STATE + 2)
+#define MLXREG_FAN_SPEED_MAX		(MLXREG_FAN_MAX_STATE * 2)
+#define MLXREG_FAN_SPEED_MIN_LEVEL	2	/* 20 percent */
+#define MLXREG_FAN_TACHO_ROUND_DEF	500
+#define MLXREG_FAN_TACHO_DIVIDER_DEF	1132
+#define MLXREG_FAN_GET_RPM(val, d, r)	(15000000 / ((val) * (d) / 100 + (r)))
+#define MLXREG_FAN_GET_FAULT(val, mask) (!!((val) ^ (mask)))
+#define MLXREG_FAN_PWM_DUTY2STATE(duty)	(DIV_ROUND_CLOSEST((duty) *	\
+					 MLXREG_FAN_MAX_STATE,		\
+					 MLXREG_FAN_MAX_DUTY))
+#define MLXREG_FAN_PWM_STATE2DUTY(stat)	(DIV_ROUND_CLOSEST((stat) *	\
+					 MLXREG_FAN_MAX_DUTY,		\
+					 MLXREG_FAN_MAX_STATE))
+
+/*
+ * struct mlxreg_fan_tacho - tachometer data (internal use):
+ *
+ * @connected: indicates if tachometer is connected;
+ * @reg: register offset;
+ * @mask: fault mask;
+ */
+struct mlxreg_fan_tacho {
+	bool connected;
+	u32 reg;
+	u32 mask;
+};
+
+/*
+ * struct mlxreg_fan_pwm - PWM data (internal use):
+ *
+ * @connected: indicates if PWM is connected;
+ * @reg: register offset;
+ */
+struct mlxreg_fan_pwm {
+	bool connected;
+	u32 reg;
+};
+
+/*
+ * struct mlxreg_fan - private data (internal use):
+ *
+ * @pdev: platform device;
+ * @dev: basic device;
+ * @pdata: platform data;
+ * @tacho: tachometer data;
+ * @pwm: PWM data;
+ * @round: round value for tachometer RPM calculation;
+ * @divider: divider value for tachometer RPM calculation;
+ * @configured: indicates if device is configured with non-default parameters;
+ * @cooling: cooling device levels;
+ * @cdev: cooling device;
+ */
+struct mlxreg_fan {
+	struct platform_device *pdev;
+	struct device *dev;
+	struct mlxreg_core_platform_data *pdata;
+	struct mlxreg_fan_tacho tacho[MLXREG_FAN_MAX_TACHO];
+	struct mlxreg_fan_pwm pwm;
+	int round;
+	int divider;
+	bool configured;
+	u8 cooling_levels[MLXREG_FAN_MAX_STATE + 1];
+	struct thermal_cooling_device *cdev;
+};
+
+static int
+mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+		int channel, long *val)
+{
+	struct mlxreg_fan *mlxreg_fan = dev_get_drvdata(dev);
+	struct mlxreg_fan_tacho *tacho;
+	u32 regval;
+	int err;
+
+	switch (type) {
+	case hwmon_fan:
+		tacho = &mlxreg_fan->tacho[channel];
+		switch (attr) {
+		case hwmon_fan_input:
+			err = regmap_read(mlxreg_fan->pdata->regmap,
+					  tacho->reg, &regval);
+			if (err)
+				return err;
+
+			*val = MLXREG_FAN_GET_RPM(regval, mlxreg_fan->divider,
+						  mlxreg_fan->round);
+			break;
+
+		case hwmon_fan_fault:
+			err = regmap_read(mlxreg_fan->pdata->regmap,
+					  tacho->reg, &regval);
+			if (err)
+				return err;
+
+			*val = MLXREG_FAN_GET_FAULT(regval, tacho->mask);
+			break;
+
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			err = regmap_read(mlxreg_fan->pdata->regmap,
+					  mlxreg_fan->pwm.reg, &regval);
+			if (err)
+				return err;
+
+			*val = regval;
+			break;
+
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int
+mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+		 int channel, long val)
+{
+	struct mlxreg_fan *mlxreg_fan = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			if (val < MLXREG_FAN_MIN_DUTY ||
+			    val > MLXREG_FAN_MAX_DUTY)
+				return -EINVAL;
+			return regmap_write(mlxreg_fan->pdata->regmap,
+					    mlxreg_fan->pwm.reg, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static umode_t
+mlxreg_fan_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
+		      int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		if (!(((struct mlxreg_fan *)data)->tacho[channel].connected))
+			return 0;
+
+		switch (attr) {
+		case hwmon_fan_input:
+		case hwmon_fan_fault:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const u32 mlxreg_fan_hwmon_fan_config[] = {
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	0
+};
+
+static const struct hwmon_channel_info mlxreg_fan_hwmon_fan = {
+	.type = hwmon_fan,
+	.config = mlxreg_fan_hwmon_fan_config,
+};
+
+static const u32 mlxreg_fan_hwmon_pwm_config[] = {
+	HWMON_PWM_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info mlxreg_fan_hwmon_pwm = {
+	.type = hwmon_pwm,
+	.config = mlxreg_fan_hwmon_pwm_config,
+};
+
+static const struct hwmon_channel_info *mlxreg_fan_hwmon_info[] = {
+	&mlxreg_fan_hwmon_fan,
+	&mlxreg_fan_hwmon_pwm,
+	NULL
+};
+
+static const struct hwmon_ops mlxreg_fan_hwmon_hwmon_ops = {
+	.is_visible = mlxreg_fan_is_visible,
+	.read = mlxreg_fan_read,
+	.write = mlxreg_fan_write,
+};
+
+static const struct hwmon_chip_info mlxreg_fan_hwmon_chip_info = {
+	.ops = &mlxreg_fan_hwmon_hwmon_ops,
+	.info = mlxreg_fan_hwmon_info,
+};
+
+static int mlxreg_fan_get_max_state(struct thermal_cooling_device *cdev,
+				    unsigned long *state)
+{
+	*state = MLXREG_FAN_MAX_STATE;
+	return 0;
+}
+
+static int mlxreg_fan_get_cur_state(struct thermal_cooling_device *cdev,
+				    unsigned long *state)
+
+{
+	struct mlxreg_fan *mlxreg_fan = cdev->devdata;
+	u32 regval;
+	int err;
+
+	err = regmap_read(mlxreg_fan->pdata->regmap, mlxreg_fan->pwm.reg,
+			  &regval);
+	if (err) {
+		dev_err(mlxreg_fan->dev, "Failed to query PWM duty\n");
+		return err;
+	}
+
+	*state = MLXREG_FAN_PWM_DUTY2STATE(regval);
+
+	return 0;
+}
+
+static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
+				    unsigned long state)
+
+{
+	struct mlxreg_fan *mlxreg_fan = cdev->devdata;
+	unsigned long cur_state;
+	u32 regval;
+	int i;
+	int err;
+
+	/*
+	 * Verify if this request is for changing allowed FAN dynamical
+	 * minimum. If it is - update cooling levels accordingly and update
+	 * state, if current state is below the newly requested minimum state.
+	 * For example, if current state is 5, and minimal state is to be
+	 * changed from 4 to 6, mlxreg_fan->cooling_levels[0 to 5] will be
+	 * changed all from 4 to 6. And state 5 (mlxreg_fan->cooling_levels[4])
+	 * should be overwritten.
+	 */
+	if (state >= MLXREG_FAN_SPEED_MIN && state <= MLXREG_FAN_SPEED_MAX) {
+		state -= MLXREG_FAN_MAX_STATE;
+		for (i = 0; i < state; i++)
+			mlxreg_fan->cooling_levels[i] = state;
+		for (i = state; i <= MLXREG_FAN_MAX_STATE; i++)
+			mlxreg_fan->cooling_levels[i] = i;
+
+		err = regmap_read(mlxreg_fan->pdata->regmap,
+				  mlxreg_fan->pwm.reg, &regval);
+		if (err) {
+			dev_err(mlxreg_fan->dev, "Failed to query PWM duty\n");
+			return err;
+		}
+
+		cur_state = MLXREG_FAN_PWM_DUTY2STATE(regval);
+		if (state < cur_state)
+			return 0;
+
+		state = cur_state;
+	}
+
+	if (state > MLXREG_FAN_MAX_STATE)
+		return -EINVAL;
+
+	/* Normalize the state to the valid speed range. */
+	state = mlxreg_fan->cooling_levels[state];
+	err = regmap_write(mlxreg_fan->pdata->regmap, mlxreg_fan->pwm.reg,
+			   MLXREG_FAN_PWM_STATE2DUTY(state));
+	if (err) {
+		dev_err(mlxreg_fan->dev, "Failed to write PWM duty\n");
+		return err;
+	}
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops mlxreg_fan_cooling_ops = {
+	.get_max_state	= mlxreg_fan_get_max_state,
+	.get_cur_state	= mlxreg_fan_get_cur_state,
+	.set_cur_state	= mlxreg_fan_set_cur_state,
+};
+
+static int mlxreg_fan_config(struct mlxreg_fan *mlxreg_fan,
+			     struct mlxreg_core_platform_data *pdata)
+{
+	struct mlxreg_core_data *data = pdata->data;
+	int tacho_num = 0, i;
+
+	mlxreg_fan->round = MLXREG_FAN_TACHO_ROUND_DEF;
+	mlxreg_fan->divider = MLXREG_FAN_TACHO_DIVIDER_DEF;
+	for (i = 0; i < pdata->counter; i++, data++) {
+		if (strnstr(data->label, "tacho", sizeof(data->label))) {
+			if (tacho_num == MLXREG_FAN_MAX_TACHO) {
+				dev_err(mlxreg_fan->dev, "invalid tacho entry: %s\n",
+					data->label);
+				return -EINVAL;
+			}
+			mlxreg_fan->tacho[tacho_num].reg = data->reg;
+			mlxreg_fan->tacho[tacho_num].mask = data->mask;
+			mlxreg_fan->tacho[tacho_num++].connected = true;
+		} else if (strnstr(data->label, "pwm", sizeof(data->label))) {
+			if (mlxreg_fan->pwm.connected) {
+				dev_err(mlxreg_fan->dev, "invalid pwm entry: %s\n",
+					data->label);
+				return -EINVAL;
+			}
+			mlxreg_fan->pwm.reg = data->reg;
+			mlxreg_fan->pwm.connected = true;
+		} else if (strnstr(data->label, "conf", sizeof(data->label))) {
+			if (mlxreg_fan->configured) {
+				dev_err(mlxreg_fan->dev, "invalid conf entry: %s\n",
+					data->label);
+				return -EINVAL;
+			}
+			/* Validate that divider and round are not zeros. */
+			if (!mlxreg_fan->round || !mlxreg_fan->divider) {
+				dev_err(mlxreg_fan->dev, "invalid conf entry params: %s\n",
+					data->label);
+				return -EINVAL;
+			}
+			mlxreg_fan->round = data->mask;
+			mlxreg_fan->divider = data->bit;
+			mlxreg_fan->configured = true;
+		} else {
+			dev_err(mlxreg_fan->dev, "invalid label: %s\n",
+				data->label);
+			return -EINVAL;
+		}
+	}
+
+	/* Init cooling levels per PWM state. */
+	for (i = 0; i < MLXREG_FAN_SPEED_MIN_LEVEL; i++)
+		mlxreg_fan->cooling_levels[i] = MLXREG_FAN_SPEED_MIN_LEVEL;
+	for (i = MLXREG_FAN_SPEED_MIN_LEVEL; i <= MLXREG_FAN_MAX_STATE; i++)
+		mlxreg_fan->cooling_levels[i] = i;
+
+	return 0;
+}
+
+static int mlxreg_fan_probe(struct platform_device *pdev)
+{
+	struct mlxreg_core_platform_data *pdata;
+	struct mlxreg_fan *mlxreg_fan;
+	struct device *hwm;
+	int err;
+
+	pdata = dev_get_platdata(&pdev->dev);
+	if (!pdata) {
+		dev_err(&pdev->dev, "Failed to get platform data.\n");
+		return -EINVAL;
+	}
+
+	mlxreg_fan = devm_kzalloc(&pdev->dev, sizeof(*mlxreg_fan), GFP_KERNEL);
+	if (!mlxreg_fan)
+		return -ENOMEM;
+
+	mlxreg_fan->pdev = pdev;
+	mlxreg_fan->dev = &pdev->dev;
+	mlxreg_fan->pdata = pdata;
+	platform_set_drvdata(pdev, mlxreg_fan);
+
+	err = mlxreg_fan_config(mlxreg_fan, pdata);
+	if (err)
+		return err;
+
+	hwm = devm_hwmon_device_register_with_info(&pdev->dev, "mlxreg_fan",
+						   mlxreg_fan,
+						   &mlxreg_fan_hwmon_chip_info,
+						   NULL);
+	if (IS_ERR(hwm)) {
+		dev_err(&pdev->dev, "Failed to register hwmon device\n");
+		return PTR_ERR(hwm);
+	}
+
+	if (IS_REACHABLE(CONFIG_THERMAL)) {
+		mlxreg_fan->cdev = thermal_cooling_device_register(
+						"mlxreg_fan",
+						mlxreg_fan,
+						&mlxreg_fan_cooling_ops);
+		if (IS_ERR(mlxreg_fan->cdev)) {
+			dev_err(&pdev->dev, "Failed to register cooling device\n");
+			return PTR_ERR(mlxreg_fan->cdev);
+		}
+	}
+
+	return 0;
+}
+
+static int mlxreg_fan_remove(struct platform_device *pdev)
+{
+	struct mlxreg_fan *mlxreg_fan = platform_get_drvdata(pdev);
+
+	if (IS_REACHABLE(CONFIG_THERMAL))
+		thermal_cooling_device_unregister(mlxreg_fan->cdev);
+
+	return 0;
+}
+
+static struct platform_driver mlxreg_fan_driver = {
+	.driver = {
+	    .name = "mlxreg-fan",
+	},
+	.probe = mlxreg_fan_probe,
+	.remove = mlxreg_fan_remove,
+};
+
+module_platform_driver(mlxreg_fan_driver);
+
+MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
+MODULE_DESCRIPTION("Mellanox FAN driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:mlxreg-fan");
-- 
2.1.4

