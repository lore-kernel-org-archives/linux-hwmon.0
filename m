Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3F03A6416;
	Thu, 26 Mar 2026 19:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774552977; cv=pass; b=s3D+ijDK/1a2Pn5uQ82Hqopwf7NelK0KQGPsfKyGP7UJyB6jq19Afo5BxYRcS5h1jXrWnFfU8sPRUzTz8RY5zfBYLU60Gy1kktBs/wT0NG2FDD4jPVTxitY5dgKFgXJsVMDn48RXlHzSctNp8ZOvAE5Q+btmpVJ8Bli/LKWsKMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774552977; c=relaxed/simple;
	bh=ElIcgjPTKcKVuJvtUtybqY4ZrX04zTFLaltESqY317I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W227jzYaR9yD468tAiLEcl5qQsYGMrmRRfTUYHIvB7IVDw6tHPG0vUlbgu3++vf0PTsu8FMCNe7VYxi+Xhaujnx592wAUlgxK4L02EV9ZaQrUyqRx7SQ+NOLxCXCsfpHuqMrXArDn22ts4l/PWWjc/RltQjEQH0a8QsyKUyHCyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=PClXMnih; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="PClXMnih"
ARC-Seal: i=1; a=rsa-sha256; t=1774552958; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AYuKg08mpCVehorbmB4F7w8dHocA+t0uNSyaIUnhGL6OoQrJdK7PvrVawe1lHqM9MrReCuOuoU4EspP8S7VZy6EgU0xjPB6y+r1cLcMMb++AuUgNSwD+FqdOQ12wPhVrtzdwLszBDugUtzP8IS6h9wZL67AqevRARD316g3OTPc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774552958; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/DjgRAt09TnKcBLF5rzLUQRU21V0brOez7Wg4AnrajY=; 
	b=cIFjYBHUxhqV4sy7rm5rflfVPfQZ8bkbepdWUFajNkkomReDWt5bsh7JYV1f/GpKbXaulpQvCFiLng6yHP/lKWe3BZGE8ZJtslEP0kAB+1qhLm9MILDvLYYp2q1FG+e36QBFt2O4nmDODv0BjR/DiKXlOjO/ksuTsi06NTr7TUE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774552958;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=/DjgRAt09TnKcBLF5rzLUQRU21V0brOez7Wg4AnrajY=;
	b=PClXMnihnaWUtw9PJ1pVIaI8ZFKNiStICXOpXuzVjWvRRPm387GyR91029Jp0SjR
	CKLMwqi7Ci9+jbsXDx1Bm1duE7DqURbLJhFDBU5NYHYWAXxRrEJ8hRr2OC9KQGD68Zn
	Wdsj4VKtJFmnEmboKATgSXyYp3yxshckRV1BvwXmx7IItMjSVsrFw53PLVQQa/xB7hj
	AFGDkRu0jnFanp/oD/OZ+TpN+9lEpWVEfBvwTPda/kWkRmNooxh+BXwCU8qkDsjohGe
	RNj4hSI2RCKdpwzhouBCHi615+G7kGWipipID3lpxHiIeB3Mfgg5FetiExVxMoK8Wbl
	M3rkovfW4g==
Received: by mx.zohomail.com with SMTPS id 1774552957703437.16605720448797;
	Thu, 26 Mar 2026 12:22:37 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 27 Mar 2026 03:19:53 +0800
Subject: [PATCH 4/4] hwmon: (witrn) Add monitoring support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-b4-hwmon-witrn-v1-4-8d2f1896c045@rong.moe>
References: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
In-Reply-To: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-ad80c
X-ZohoMailClient: External

With sensor data collected, they can be exported to userspace via hwmon.

Register hwmon driver for witrn, with appropriate channels and
attributes.

Developed and tested with WITRN K2 USB-C tester. Theoretically this
driver should work properly on other models. They can be added to the
HID match table too if someone tests the driver with them.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 Documentation/hwmon/witrn.rst |  30 +++
 drivers/hwmon/Kconfig         |   1 +
 drivers/hwmon/witrn.c         | 423 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 454 insertions(+)

diff --git a/Documentation/hwmon/witrn.rst b/Documentation/hwmon/witrn.rst
index e64c527928d0..f13323fdd9d9 100644
--- a/Documentation/hwmon/witrn.rst
+++ b/Documentation/hwmon/witrn.rst
@@ -21,3 +21,33 @@ Description
 This driver implements support for the WITRN USB tester family.
 
 The device communicates with the custom protocol over USB HID.
+
+As current can flow in both directions through the tester the sign of the
+channel "curr1_input" (label "IBUS") indicates the direction.
+
+Sysfs entries
+-------------
+
+  ===============  ==========  ==============================================================
+  Name             Label       Description
+  ===============  ==========  ==============================================================
+  in0_input        VBUS        Measured VBUS voltage (mV)
+  in0_average      VBUS        Calculated average VBUS voltage (mV)
+  in1_input        D+          Measured D+ voltage (mV)
+  in2_input        D-          Measured D- voltage (mV)
+  in3_input        CC1         Measured CC1 voltage (mV)
+  in4_input        CC2         Measured CC2 voltage (mV)
+  cur1_input       IBUS        Measured VBUS current (mA)
+  curr1_average    IBUS        Calculated average VBUS current (mA)
+  curr1_rated_min  IBUS        Stop accumulating (recording) below this VBUS current (mA)
+  power1_input     PBUS        Calculated VBUS power (uW)
+  power1_average   PBUS        Calculated average VBUS power (uW)
+  energy1_input    EBUS        Accumulated VBUS energy (uJ)
+  charge1_input    CBUS        Accumulated VBUS charge (mC)
+  temp1_input      Thermistor  Measured thermistor temperature (m°C), -EXDEV if not connected
+  record_group                 ID of the record group for accumulative values
+  record_time                  Accumulated time for recording (s), see also curr1_rated_min
+  uptime                       Accumulated time since the device has been powered on (s)
+  ===============  ==========  ==============================================================
+
+All entries are readonly.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 746184608f81..c8b5144707a1 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2632,6 +2632,7 @@ config SENSORS_W83627EHF
 config SENSORS_WITRN
 	tristate "WITRN USB tester"
 	depends on USB_HID
+	select HWMON_FP
 	help
 	  If you say yes here you get support for WITRN USB charging
 	  testers.
diff --git a/drivers/hwmon/witrn.c b/drivers/hwmon/witrn.c
index e8713da6de5a..f43bdbf13435 100644
--- a/drivers/hwmon/witrn.c
+++ b/drivers/hwmon/witrn.c
@@ -11,14 +11,19 @@
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/hid.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
 #include <linux/jiffies.h>
 #include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/units.h>
 #include <linux/workqueue.h>
 
+#include "hwmon-fp.h"
+
 #define DRIVER_NAME		"witrn"
 #define WITRN_EP_CMD_OUT	0x01
 #define WITRN_EP_DATA_IN	0x81
@@ -74,6 +79,7 @@ struct witrn_report {
 static_assert(sizeof(struct witrn_report) == WITRN_REPORT_SZ);
 
 struct witrn_priv {
+	struct device *hwmon_dev;
 	struct hid_device *hdev;
 
 	struct work_struct pause_work;
@@ -178,6 +184,413 @@ static int witrn_raw_event(struct hid_device *hdev, struct hid_report *report,
 	return 0;
 }
 
+/* ======== HWMON ======== */
+
+static int witrn_collect_sensor(struct witrn_priv *priv, struct witrn_sensor *sensor)
+{
+	int ret;
+
+	scoped_guard(spinlock, &priv->lock) {
+		priv->last_access = jiffies;
+
+		if (!sensor_is_outdated(priv)) {
+			memcpy(sensor, &priv->sensor, sizeof(priv->sensor));
+			return 0;
+		}
+
+		reinit_completion(&priv->completion);
+	}
+
+	ret = witrn_open_hid(priv);
+	if (ret)
+		return ret;
+
+	ret = wait_for_completion_interruptible_timeout(&priv->completion,
+							UP_TO_DATE_TIMEOUT);
+	if (ret == 0)
+		return -ETIMEDOUT;
+	else if (ret < 0)
+		return ret;
+
+	scoped_guard(spinlock, &priv->lock)
+		memcpy(sensor, &priv->sensor, sizeof(priv->sensor));
+
+	return 0;
+}
+
+#define SECS_PER_HOUR		3600ULL
+#define WITRN_SCALE_IN_VCC	(HWMON_FP_SCALE_IN / DECI)		/* dV to mV */
+#define WITRN_SCALE_CHARGE	(HWMON_FP_SCALE_CURR * SECS_PER_HOUR)	/* Ah to mC(mAs) */
+#define WITRN_SCALE_ENERGY	(HWMON_FP_SCALE_ENERGY * SECS_PER_HOUR)	/* Wh to uJ(uWs) */
+
+static int witrn_read_in(const struct witrn_sensor *sensor, u32 attr, int channel, long *val)
+{
+	switch (attr) {
+	case hwmon_in_input:
+		switch (channel) {
+		case 0:
+			return hwmon_fp_float_to_long(le32_to_cpu(sensor->vbus),
+						      HWMON_FP_SCALE_IN, val);
+		case 1:
+			return hwmon_fp_float_to_long(le32_to_cpu(sensor->vdp),
+						      HWMON_FP_SCALE_IN, val);
+		case 2:
+			return hwmon_fp_float_to_long(le32_to_cpu(sensor->vdm),
+						      HWMON_FP_SCALE_IN, val);
+		case 3:
+			*val = sensor->vcc1 * WITRN_SCALE_IN_VCC;
+			return 0;
+		case 4:
+			*val = sensor->vcc2 * WITRN_SCALE_IN_VCC;
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	case hwmon_in_average:
+		switch (channel) {
+		case 0:
+			return hwmon_fp_div_to_long(le32_to_cpu(sensor->record_energy),
+						    le32_to_cpu(sensor->record_charge),
+						    HWMON_FP_SCALE_IN, true, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int witrn_read_curr(const struct witrn_sensor *sensor, u32 attr, int channel, long *val)
+{
+	int ret;
+
+	switch (attr) {
+	case hwmon_curr_input:
+		switch (channel) {
+		case 0:
+			return hwmon_fp_float_to_long(le32_to_cpu(sensor->ibus),
+						      HWMON_FP_SCALE_CURR, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+	case hwmon_curr_average:
+		switch (channel) {
+		case 0: {
+			s64 record_time = le32_to_cpu(sensor->record_time);
+			s64 capacity; /* mC(mAs) */
+
+			if (record_time == 0) {
+				*val = 0;
+				return 0;
+			}
+
+			ret = hwmon_fp_float_to_s64(le32_to_cpu(sensor->record_charge),
+						    WITRN_SCALE_CHARGE, &capacity);
+			if (ret)
+				return ret;
+
+			/* mC(mAs) / s = mA */
+			*val = hwmon_fp_s64_to_long(capacity / record_time);
+			return 0;
+		}
+		default:
+			return -EOPNOTSUPP;
+		}
+	case hwmon_curr_rated_min:
+		switch (channel) {
+		case 0:
+			*val = le16_to_cpu(sensor->record_threshold); /* already in mA */
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int witrn_read_power(const struct witrn_sensor *sensor, u32 attr, int channel, long *val)
+{
+	int ret;
+
+	switch (attr) {
+	case hwmon_power_input:
+		switch (channel) {
+		case 0:
+			/*
+			 * The device provides 1e-5 precision.
+			 *
+			 * Though userspace programs can calculate (VBUS * IBUS)
+			 * themselves, this channel is provided for convenience
+			 * and accuracy.
+			 *
+			 * E.g., when VBUS = 5.00049V and IBUS = 0.50049A,
+			 * userspace calculates 5.000V * 0.500A = 2.500000W,
+			 * while this channel reports 2.502695W.
+			 */
+			return hwmon_fp_mul_to_long(le32_to_cpu(sensor->vbus),
+						    le32_to_cpu(sensor->ibus),
+						    HWMON_FP_SCALE_POWER, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+	case hwmon_power_average:
+		switch (channel) {
+		case 0: {
+			s64 record_time = le32_to_cpu(sensor->record_time);
+			s64 energy; /* uJ(uWs) */
+
+			if (record_time == 0) {
+				*val = 0;
+				return 0;
+			}
+
+			ret = hwmon_fp_float_to_s64(le32_to_cpu(sensor->record_energy),
+						    WITRN_SCALE_ENERGY, &energy);
+			if (ret)
+				return ret;
+
+			/* uJ(uWs) / s = uW */
+			*val = hwmon_fp_s64_to_long(energy / record_time);
+			return 0;
+		}
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int witrn_read_temp(const struct witrn_sensor *sensor, u32 attr, int channel, long *val)
+{
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		switch (channel) {
+		case 0:
+			ret = hwmon_fp_float_to_long(le32_to_cpu(sensor->temp_ntc),
+						     HWMON_FP_SCALE_TEMP, val);
+
+			/*
+			 * The thermistor (NTC, B=3435, T0=25°C, R0=10kohm) is an optional
+			 * addon. When it's missing, an extremely cold temperature
+			 * (-50°C - -80°C) is reported as the device deduced a very large
+			 * resistance value (~500Kohm - ~5Mohm).
+			 *
+			 * We choose -40°C (~250kohm) as the threshold to determine whether
+			 * the thermistor is connected.
+			 *
+			 * The addon can be connected to the device after the device being
+			 * connected to the PC, so we can't use is_visible to hide it.
+			 */
+			if (!ret && *val < -40L * (long)HWMON_FP_SCALE_TEMP)
+				return -EXDEV;
+
+			return ret;
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int witrn_read_energy(const struct witrn_sensor *sensor, u32 attr, int channel, s64 *val)
+{
+	switch (attr) {
+	case hwmon_energy_input:
+		switch (channel) {
+		case 0:
+			return hwmon_fp_float_to_s64(le32_to_cpu(sensor->record_energy),
+						     WITRN_SCALE_ENERGY, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int witrn_read(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long *val)
+{
+	struct witrn_priv *priv = dev_get_drvdata(dev);
+	struct witrn_sensor sensor;
+	int ret;
+
+	ret = witrn_collect_sensor(priv, &sensor);
+	if (ret)
+		return ret;
+
+	switch (type) {
+	case hwmon_in:
+		return witrn_read_in(&sensor, attr, channel, val);
+	case hwmon_curr:
+		return witrn_read_curr(&sensor, attr, channel, val);
+	case hwmon_power:
+		return witrn_read_power(&sensor, attr, channel, val);
+	case hwmon_temp:
+		return witrn_read_temp(&sensor, attr, channel, val);
+	case hwmon_energy64:
+		return witrn_read_energy(&sensor, attr, channel, (s64 *)val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int witrn_read_string(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, const char **str)
+{
+	static const char * const in_labels[] = {
+		"VBUS",
+		"D+",
+		"D-",
+		"CC1",
+		"CC2",
+	};
+	static const char * const curr_labels[] = {
+		"IBUS", /* VBUS current */
+	};
+	static const char * const power_labels[] = {
+		"PBUS", /* VBUS power */
+	};
+	static const char * const energy_labels[] = {
+		"EBUS", /* VBUS energy */
+	};
+	static const char * const temp_labels[] = {
+		"Thermistor",
+	};
+
+	if (type == hwmon_in && attr == hwmon_in_label &&
+	    channel < ARRAY_SIZE(in_labels)) {
+		*str = in_labels[channel];
+	} else if (type == hwmon_curr && attr == hwmon_curr_label &&
+		   channel < ARRAY_SIZE(curr_labels)) {
+		*str = curr_labels[channel];
+	} else if (type == hwmon_power && attr == hwmon_power_label &&
+		   channel < ARRAY_SIZE(power_labels)) {
+		*str = power_labels[channel];
+	} else if (type == hwmon_energy64 && attr == hwmon_energy_label &&
+		   channel < ARRAY_SIZE(energy_labels)) {
+		*str = energy_labels[channel];
+	} else if (type == hwmon_temp && attr == hwmon_temp_label &&
+		   channel < ARRAY_SIZE(temp_labels)) {
+		*str = temp_labels[channel];
+	} else {
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static const struct hwmon_channel_info *const witrn_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL | HWMON_I_AVERAGE,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT | HWMON_C_LABEL | HWMON_C_AVERAGE | HWMON_C_RATED_MIN),
+	HWMON_CHANNEL_INFO(power,
+			   HWMON_P_INPUT | HWMON_P_LABEL | HWMON_P_AVERAGE),
+	HWMON_CHANNEL_INFO(energy64,
+			   HWMON_E_INPUT | HWMON_E_LABEL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL
+};
+
+static const struct hwmon_ops witrn_hwmon_ops = {
+	.visible = 0444, /* Nothing is tunable from PC :-( */
+	.read = witrn_read,
+	.read_string = witrn_read_string,
+};
+
+static const struct hwmon_chip_info witrn_chip_info = {
+	.ops = &witrn_hwmon_ops,
+	.info = witrn_info,
+};
+
+enum witrn_attr_channel {
+	ATTR_CHARGE,
+	ATTR_RECORD_GROUP,
+	ATTR_RECORD_TIME,
+	ATTR_UPTIME,
+};
+
+static ssize_t witrn_attr_show(struct device *dev, struct device_attribute *attr,
+			       char *buf)
+{
+	enum witrn_attr_channel channel = to_sensor_dev_attr(attr)->index;
+	struct witrn_priv *priv = dev_get_drvdata(dev);
+	struct witrn_sensor sensor;
+	int ret;
+	s64 val;
+
+	ret = witrn_collect_sensor(priv, &sensor);
+	if (ret)
+		return ret;
+
+	switch (channel) {
+	case ATTR_CHARGE:
+		ret = hwmon_fp_float_to_s64(le32_to_cpu(sensor.record_charge),
+					    WITRN_SCALE_CHARGE, &val);
+		if (ret)
+			return ret;
+		break;
+	case ATTR_RECORD_GROUP:
+		/* +1 to match the index displayed on the meter. */
+		val = sensor.record_group + 1;
+		break;
+	case ATTR_RECORD_TIME:
+		val = le32_to_cpu(sensor.record_time);
+		break;
+	case ATTR_UPTIME:
+		val = le32_to_cpu(sensor.uptime);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return sysfs_emit(buf, "%lld\n", val);
+}
+
+static ssize_t witrn_attr_label_show(struct device *dev, struct device_attribute *attr,
+				     char *buf)
+{
+	enum witrn_attr_channel channel = to_sensor_dev_attr(attr)->index;
+	const char *str;
+
+	switch (channel) {
+	case ATTR_CHARGE:
+		str = "CBUS"; /* VBUS charge */
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return sysfs_emit(buf, "%s\n", str);
+}
+
+static SENSOR_DEVICE_ATTR_RO(charge1_input, witrn_attr, ATTR_CHARGE);
+static SENSOR_DEVICE_ATTR_RO(charge1_label, witrn_attr_label, ATTR_CHARGE);
+static SENSOR_DEVICE_ATTR_RO(record_group, witrn_attr, ATTR_RECORD_GROUP);
+static SENSOR_DEVICE_ATTR_RO(record_time, witrn_attr, ATTR_RECORD_TIME);
+static SENSOR_DEVICE_ATTR_RO(uptime, witrn_attr, ATTR_UPTIME);
+
+static struct attribute *witrn_attrs[] = {
+	&sensor_dev_attr_charge1_input.dev_attr.attr,
+	&sensor_dev_attr_charge1_label.dev_attr.attr,
+	&sensor_dev_attr_record_group.dev_attr.attr,
+	&sensor_dev_attr_record_time.dev_attr.attr,
+	&sensor_dev_attr_uptime.dev_attr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(witrn);
+
 static int witrn_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct device *parent = &hdev->dev;
@@ -219,6 +632,14 @@ static int witrn_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
+	priv->hwmon_dev = hwmon_device_register_with_info(parent, DRIVER_NAME, priv,
+							  &witrn_chip_info, witrn_groups);
+	if (IS_ERR(priv->hwmon_dev)) {
+		witrn_close_hid(priv);
+		hid_hw_stop(hdev);
+		return PTR_ERR(priv->hwmon_dev);
+	}
+
 	return 0;
 }
 
@@ -226,6 +647,8 @@ static void witrn_remove(struct hid_device *hdev)
 {
 	struct witrn_priv *priv = hid_get_drvdata(hdev);
 
+	hwmon_device_unregister(priv->hwmon_dev);
+
 	witrn_close_hid(priv);
 
 	/* Cancel it after closing HID so that it won't be rescheduled. */

-- 
2.53.0

