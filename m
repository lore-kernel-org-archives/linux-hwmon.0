Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C179C40C5B0;
	Fri, 29 May 2026 20:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780086730; cv=none; b=Jl8GhXJB4E8Y2AICNbdeY6dtF0aN4Ew8tplaIj3ybeY56o6qb3/ufMrzse04cEiiKP17Jh4bUfWorRHJicqBoFaESkKkGlYGUz3Xi1t8dSBycZYrkkaL5dP9kvalxoIz7KWt8wMe/5SKrMP2iq7JtUvh16Ghqh6CyTk6UrtkCv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780086730; c=relaxed/simple;
	bh=x4m5aMe8NaCbr7VItgqtb5OnFt/0Y9A57oQd9W+rVoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M7F/NC87O/znv+n+we1VpHRztClcNVNcCoAp5SpSYVqMuBscFzSzEpmP221UHBe1pVjxfd8tlz54qrWf/KrmtWRKDKlAXGrdAfeG/mnXb8sPkw9mD9kkP+AfG7i85y7YzwtxVeoCoJdl+mDLEw88wmToj2aFMH8ThN82DEALN4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Eu327Uzt; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Eu327Uzt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780086726;
	bh=x4m5aMe8NaCbr7VItgqtb5OnFt/0Y9A57oQd9W+rVoU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Eu327Uztx0i8QLZ6Aam9bssYgLn6vr0svyCiAu03cnIp7vLpuzZs+Rbgh0tnmwl77
	 FOAQF942awP2x6i+ZbPaNCr045BakulCeuPf13GIXZCmWLkuXNVdfm5nUce4ReIPLQ
	 fgOXPlHG9fN9JZEyFJP9do9WsC2jTqJo7iXllgcg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 29 May 2026 22:31:55 +0200
Subject: [PATCH 4/5] hwmon: (cros_ec) Add support for displaying fan curves
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-cros_ec-hwmon-fan-curve-v1-4-da6792b3830f@weissschuh.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780086726; l=7273;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=x4m5aMe8NaCbr7VItgqtb5OnFt/0Y9A57oQd9W+rVoU=;
 b=ZMqBcAvPUg/sDCYfR+m7h8wq6n7sRd0qMXmgtKBCzby5jQxBphG4AoDtpZyt7PhwF4gHbjwO5
 H0x9qXCc0+7CEidbNO70gVjGNAVfqTqSQ6mJjLe119ZzSpZa38RoDSy
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The automatic fan control mode of the embedded controller uses fan
curves with two trigger points to calculate the target fan speed.
All temperature sensors affect all fans.

Expose these fan curves through the standard hwmon sysfs ABI.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Documentation/hwmon/cros_ec_hwmon.rst |   3 +
 drivers/hwmon/cros_ec_hwmon.c         | 139 ++++++++++++++++++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
index 9ccab721e7c2..7a8683227252 100644
--- a/Documentation/hwmon/cros_ec_hwmon.rst
+++ b/Documentation/hwmon/cros_ec_hwmon.rst
@@ -46,3 +46,6 @@ PWM fan control
 
     If a fan is controllable, this driver will register that fan as a cooling device
     in the thermal framework as well.
+
+Fan curves:
+   If supported by the EC. Reading only.
diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index a6cc909e56b7..731143f8c6b2 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -7,6 +7,7 @@
 
 #include <linux/device.h>
 #include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
 #include <linux/math.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -17,6 +18,8 @@
 #include <linux/types.h>
 #include <linux/units.h>
 
+#define to_dev_attr(_attr) container_of_const(_attr, struct device_attribute, attr)
+
 #define DRV_NAME	"cros-ec-hwmon"
 
 #define CROS_EC_HWMON_PWM_GET_FAN_DUTY_CMD_VERSION	0
@@ -372,6 +375,141 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
 	return 0;
 }
 
+static bool cros_ec_hwmon_attr_is_temp_fan_off(const struct sensor_device_attribute_2 *attr)
+{
+	return attr->nr == 0;
+}
+
+static ssize_t temp_auto_point_pwm_show(struct device *dev, struct device_attribute *attr,
+					char *buf)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	if (cros_ec_hwmon_attr_is_temp_fan_off(sattr))
+		return sysfs_emit(buf, "0\n");
+	else /* temp_fan_max */
+		return sysfs_emit(buf, "255\n");
+}
+
+static ssize_t temp_auto_point_temp_show(struct device *dev, struct device_attribute *attr,
+					 char *buf)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
+	struct ec_thermal_config config;
+	u32 temp;
+	int ret;
+
+	scoped_guard(hwmon_lock, dev) {
+		ret = cros_ec_hwmon_get_thermal_config(priv->cros_ec, sattr->index, &config);
+		if (ret)
+			return ret;
+	}
+
+	if (cros_ec_hwmon_attr_is_temp_fan_off(sattr))
+		temp = config.temp_fan_off;
+	else /* temp_fan_max */
+		temp = config.temp_fan_max;
+
+	if (temp == 0)
+		return -ENODATA;
+
+	return sysfs_emit(buf, "%ld\n", cros_ec_hwmon_kelvin_to_millicelsius(temp));
+}
+
+#define CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(_idx)					\
+	static SENSOR_DEVICE_ATTR_2_RO(temp ## _idx ## _auto_point1_pwm,		\
+				       temp_auto_point_pwm,  0, (_idx) - 1);		\
+	static SENSOR_DEVICE_ATTR_2_RO(temp ## _idx ## _auto_point2_pwm,		\
+				       temp_auto_point_pwm,  1, (_idx) - 1);		\
+	static SENSOR_DEVICE_ATTR_2_RO(temp ## _idx ## _auto_point1_temp,		\
+				       temp_auto_point_temp,  0, (_idx) - 1);		\
+	static SENSOR_DEVICE_ATTR_2_RO(temp ## _idx ## _auto_point2_temp,		\
+				       temp_auto_point_temp,  1, (_idx) - 1)		\
+
+#define CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(_idx)					\
+	&sensor_dev_attr_temp ## _idx ## _auto_point1_pwm.dev_attr.attr,		\
+	&sensor_dev_attr_temp ## _idx ## _auto_point1_temp.dev_attr.attr,		\
+	&sensor_dev_attr_temp ## _idx ## _auto_point2_pwm.dev_attr.attr,		\
+	&sensor_dev_attr_temp ## _idx ## _auto_point2_temp.dev_attr.attr		\
+
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(1);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(2);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(3);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(4);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(5);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(6);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(7);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(8);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(9);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(10);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(11);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(12);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(13);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(14);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(15);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(16);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(17);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(18);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(19);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(20);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(21);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(22);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(23);
+CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(24);
+
+static struct attribute *cros_ec_hwmon_fan_curve_attrs[] = {
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(1),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(2),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(3),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(4),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(5),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(6),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(7),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(8),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(9),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(10),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(11),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(12),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(13),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(14),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(15),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(16),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(17),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(18),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(19),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(20),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(21),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(22),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(23),
+	CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(24),
+	NULL
+};
+
+static_assert(ARRAY_SIZE(cros_ec_hwmon_fan_curve_attrs) ==
+	      ARRAY_SIZE(((struct cros_ec_hwmon_priv *)NULL)->temp_sensor_names) * 4 + 1);
+
+static umode_t cros_ec_hwmon_fan_curve_is_visible(struct kobject *kobj,
+						  struct attribute *attr, int idx)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(to_dev_attr(attr));
+	struct device *dev = kobj_to_dev(kobj);
+	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
+
+	if (!priv->temp_threshold_supported)
+		return 0;
+
+	if (!priv->temp_sensor_names[sattr->index])
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group cros_ec_hwmon_fan_curve_group = {
+	.attrs		= cros_ec_hwmon_fan_curve_attrs,
+	.is_visible	= cros_ec_hwmon_fan_curve_is_visible,
+};
+
 static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(fan,
@@ -415,6 +553,7 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 };
 
 static const struct attribute_group *cros_ec_hwmon_groups[] = {
+	&cros_ec_hwmon_fan_curve_group,
 	NULL
 };
 

-- 
2.54.0

