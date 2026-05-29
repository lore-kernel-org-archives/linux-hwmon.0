Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264674218A3;
	Fri, 29 May 2026 20:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780086731; cv=none; b=B8qkZ0SvhV+OG5ePt1IrWMQdA9A89AgpDDrQRqpLwZJeog1pSYGrV1ij++jZqliXVusiNiEOLGeR8gjR356CyS/4ZYIvo6DdB6SdMMFoLTg/VTGnaH0Nn4YgvATidtTqeyg4mmDdc1uY1kFstldWVffQw7Ol2cKx1LyWgQ1OMl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780086731; c=relaxed/simple;
	bh=QZvBUP1hs/bohg2wpRQ1DiYUpKav0hya0+CvfYNx0H0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5yfXMl1kFN3qn4rlB8aK22L+zpr8OcBimAT1RSYjb3yN+84hWMU6Q1YhBQ2oWMK3L6iq1T8OiBO6Eewg80q/PSR42rYYz72o85EW4N7mpYlyC82BjMlT3QZKzCGUmQWUFVLyWppvonOlmVbviDSElHrCYq5ZWST7sDa4BwEnvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=D06kodnv; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="D06kodnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780086727;
	bh=QZvBUP1hs/bohg2wpRQ1DiYUpKav0hya0+CvfYNx0H0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D06kodnvV46PJ10fqgMLc95Z69+PWsi83QkCrEJacQaFTvBODDeDypcCitX8J2Zev
	 I6Z/N6f9/vO9AztWnsGKGDwsgbak4TPCoxwGhFUv2bdNsLdlLfLG1Qbdk1mL2ZgTpi
	 vPXBQTwG5u74FmnYCBpcoRaaPOrMXJzwcy/9uVZ8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 29 May 2026 22:31:56 +0200
Subject: [PATCH 5/5] hwmon: (cros_ec) Allow modification of fan curves
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-cros_ec-hwmon-fan-curve-v1-5-da6792b3830f@weissschuh.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780086726; l=4312;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=QZvBUP1hs/bohg2wpRQ1DiYUpKav0hya0+CvfYNx0H0=;
 b=BoF9oYNY5sX5IFEw40Hio3ttzYXeEvRjjyW7S4GYoDMs/hK2stzPIgKWEqxffWPu+MDaIIrRj
 /0PCHiamk+8D0W1B36ENM7O9BhaREmQnALbqWzbRT+EINhb0TZpwc4e
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The fan curves used by the embedded controller can be configured.

Expose this through the standard hwmon sysfs ABI.

Only allow the curves to be made more aggressive than the current ones.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Documentation/hwmon/cros_ec_hwmon.rst |  2 +-
 drivers/hwmon/cros_ec_hwmon.c         | 68 +++++++++++++++++++++++++++++++++--
 2 files changed, 67 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
index 7a8683227252..a3d0e43c8833 100644
--- a/Documentation/hwmon/cros_ec_hwmon.rst
+++ b/Documentation/hwmon/cros_ec_hwmon.rst
@@ -48,4 +48,4 @@ PWM fan control
     in the thermal framework as well.
 
 Fan curves:
-   If supported by the EC. Reading only.
+   If supported by the EC. Reading and writing.
diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 731143f8c6b2..fb73a00ebeeb 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -8,9 +8,11 @@
 #include <linux/device.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
+#include <linux/kstrtox.h>
 #include <linux/math.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -135,6 +137,22 @@ static int cros_ec_hwmon_get_thermal_config(struct cros_ec_device *cros_ec, u8 i
 	return 0;
 }
 
+static int cros_ec_hwmon_set_thermal_config(struct cros_ec_device *cros_ec, u8 index,
+					    const struct ec_thermal_config *config)
+{
+	struct ec_params_thermal_set_threshold_v1 req = {};
+	int ret;
+
+	req.sensor_num = index;
+	req.cfg = *config;
+	ret = cros_ec_cmd(cros_ec, 1, EC_CMD_THERMAL_SET_THRESHOLD,
+			  &req, sizeof(req), NULL, 0);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int cros_ec_hwmon_read_temp_threshold(struct cros_ec_device *cros_ec, u8 index,
 					     enum ec_temp_thresholds threshold, u32 *temp)
 {
@@ -417,14 +435,60 @@ static ssize_t temp_auto_point_temp_show(struct device *dev, struct device_attri
 	return sysfs_emit(buf, "%ld\n", cros_ec_hwmon_kelvin_to_millicelsius(temp));
 }
 
+static ssize_t temp_auto_point_temp_store(struct device *dev, struct device_attribute *attr,
+					  const char *buf, size_t size)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
+	struct ec_thermal_config config;
+	u32 *temp_field;
+	s64 temp;
+	int ret;
+
+	ret = kstrtos64(buf, 10, &temp);
+	if (ret)
+		return ret;
+
+	temp = cros_ec_hwmon_millicelsius_to_kelvin(temp);
+
+	if (overflows_type(temp, config.temp_fan_off))
+		return -ERANGE;
+
+	guard(hwmon_lock)(dev);
+
+	ret = cros_ec_hwmon_get_thermal_config(priv->cros_ec, sattr->index, &config);
+	if (ret)
+		return ret;
+
+	if (cros_ec_hwmon_attr_is_temp_fan_off(sattr))
+		temp_field = &config.temp_fan_off;
+	else /* temp_fan_max */
+		temp_field = &config.temp_fan_max;
+
+	/* Only allow values which are more aggressive than the current ones */
+	if (temp > *temp_field)
+		return -EINVAL;
+
+	*temp_field = temp;
+
+	if (config.temp_fan_off > config.temp_fan_max)
+		return -EINVAL;
+
+	ret = cros_ec_hwmon_set_thermal_config(priv->cros_ec, sattr->index, &config);
+	if (ret)
+		return ret;
+
+	return size;
+}
+
 #define CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS(_idx)					\
 	static SENSOR_DEVICE_ATTR_2_RO(temp ## _idx ## _auto_point1_pwm,		\
 				       temp_auto_point_pwm,  0, (_idx) - 1);		\
 	static SENSOR_DEVICE_ATTR_2_RO(temp ## _idx ## _auto_point2_pwm,		\
 				       temp_auto_point_pwm,  1, (_idx) - 1);		\
-	static SENSOR_DEVICE_ATTR_2_RO(temp ## _idx ## _auto_point1_temp,		\
+	static SENSOR_DEVICE_ATTR_2_RW(temp ## _idx ## _auto_point1_temp,		\
 				       temp_auto_point_temp,  0, (_idx) - 1);		\
-	static SENSOR_DEVICE_ATTR_2_RO(temp ## _idx ## _auto_point2_temp,		\
+	static SENSOR_DEVICE_ATTR_2_RW(temp ## _idx ## _auto_point2_temp,		\
 				       temp_auto_point_temp,  1, (_idx) - 1)		\
 
 #define CROS_EC_HWMON_TEMP_AUTO_POINT_ATTRS_PTRS(_idx)					\

-- 
2.54.0

