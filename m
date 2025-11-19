Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD59C30DECC;
	Wed, 19 Nov 2025 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763574331; cv=none; b=SXCWXY+TYljzN/+pPmcv4aLUSYA9SN9FNaUafVuRKIrp+qcz+7yutI4w2ABK6TkT7ENf9mo9j/qrjlHp0Vc3Ryftv6lUFL6SsinhQUEhD1JcoFH/rp5haAqpGytikOjcXdV2YE14wVtj1kVhS2/3L0TXBP9d6gQ7T8N9h/c68Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763574331; c=relaxed/simple;
	bh=+z5XqbF4/QQN0A5MmMEjZ77wdwc4xaG3dSNM0lrNndk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l66dxypjicXFgY717UDsXS14C/daWnUD9ftOtCQMH5OLyjE999wmTLXYL+AFpUAjm8xp+fvZoGWgxqJl12XaGkDLfDPbeN9fuppvKdqKddopyByMshSSSNR2vywUfE2/xUTrbMGAYU+8V0i7Vi1ojVMKIdAX6tDNxQjoIp7MjBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=aU9yAx5e; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="aU9yAx5e"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 6EE27C50EC;
	Wed, 19 Nov 2025 19:45:25 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id D9E3EC5023;
	Wed, 19 Nov 2025 19:45:24 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id E626E200E78;
	Wed, 19 Nov 2025 19:45:23 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763574324;
	bh=6YbJcjXJAQ0dSS7I+79MAPOfy2Sg4oINOpDtwrpxxXs=; h=From:To:Subject;
	b=aU9yAx5e489rRkNP/r7TGIcUP7uA99bIVf7sa+Zueb/YMlSO1NPqAsDFXRgz9Ogun
	 wvbh39v3G1Zgqu/bpyR6EFb/8UgqqhktiyWJKZDu2ervkgGiZUowIZR9lQt2HOiBHY
	 sp4u0JrSrDC1r9kqFoS5TYwxDdyvfsKyYJmT4osrpQx8oYioIzafG7vVhlcx/zmsdw
	 mgIz8O0FQ6a6APV5NfXyNdTnLM9ud2PH+E3AJj+XrX4WBBhFVG0MrKewGIzAfLBkU6
	 6EYEl+qqOmIWbqxg6dTJ7cro60/cQjQF83VQ8RKc186I2Up0j8UlSQ7WttzxwXOWvH
	 7ky+/EKodmwrQ==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:8d8a:5967:d692:ea4e) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v6 6/6] platform/x86: ayaneo-ec: Add suspend hook
Date: Wed, 19 Nov 2025 18:45:05 +0100
Message-ID: <20251119174505.597218-7-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119174505.597218-1-lkml@antheas.dev>
References: <20251119174505.597218-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176357432448.2086598.14999151017992077673@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

The Ayaneo EC resets after hibernation, losing the charge control state.
Add a small PM hook to restore this state on hibernation resume.

The fan speed is also lost during hibernation, but since hibernation
failures are common with this class of devices, setting a low fan speed
when the userspace program controlling the fan will potentially not
take over could cause the device to overheat, so it is not restored.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/ayaneo-ec.c | 85 +++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
index a6fe141f07be..41a24e091248 100644
--- a/drivers/platform/x86/ayaneo-ec.c
+++ b/drivers/platform/x86/ayaneo-ec.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/power_supply.h>
 #include <linux/sysfs.h>
 #include <acpi/battery.h>
@@ -52,6 +53,11 @@ struct ayaneo_ec_platform_data {
 	struct platform_device *pdev;
 	struct ayaneo_ec_quirk *quirks;
 	struct acpi_battery_hook battery_hook;
+
+	// Protects access to restore_pwm
+	struct mutex hwmon_lock;
+	bool restore_charge_limit;
+	bool restore_pwm;
 };
 
 static const struct ayaneo_ec_quirk quirk_fan = {
@@ -208,10 +214,16 @@ static int ayaneo_ec_read(struct device *dev, enum hwmon_sensor_types type,
 static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types type,
 			   u32 attr, int channel, long val)
 {
+	struct ayaneo_ec_platform_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	guard(mutex)(&data->hwmon_lock);
+
 	switch (type) {
 	case hwmon_pwm:
 		switch (attr) {
 		case hwmon_pwm_enable:
+			data->restore_pwm = false;
 			switch (val) {
 			case 1:
 				return ec_write(AYANEO_PWM_ENABLE_REG,
@@ -225,6 +237,17 @@ static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types type,
 		case hwmon_pwm_input:
 			if (val < 0 || val > 255)
 				return -EINVAL;
+			if (data->restore_pwm) {
+				/*
+				 * Defer restoring PWM control to after
+				 * userspace resumes successfully
+				 */
+				ret = ec_write(AYANEO_PWM_ENABLE_REG,
+					       AYANEO_PWM_MODE_MANUAL);
+				if (ret)
+					return ret;
+				data->restore_pwm = false;
+			}
 			return ec_write(AYANEO_PWM_REG, (val * 100) / 255);
 		default:
 			break;
@@ -454,11 +477,14 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
 
 	data->pdev = pdev;
 	data->quirks = dmi_entry->driver_data;
+	ret = devm_mutex_init(&pdev->dev, &data->hwmon_lock);
+	if (ret)
+		return ret;
 	platform_set_drvdata(pdev, data);
 
 	if (data->quirks->has_fan_control) {
 		hwdev = devm_hwmon_device_register_with_info(&pdev->dev,
-			"ayaneo_ec", NULL, &ayaneo_ec_chip_info, NULL);
+			"ayaneo_ec", data, &ayaneo_ec_chip_info, NULL);
 		if (IS_ERR(hwdev))
 			return PTR_ERR(hwdev);
 	}
@@ -475,10 +501,67 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int ayaneo_freeze(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
+	int ret;
+	u8 tmp;
+
+	if (data->quirks->has_charge_control) {
+		ret = ec_read(AYANEO_CHARGE_REG, &tmp);
+		if (ret)
+			return ret;
+
+		data->restore_charge_limit = tmp == AYANEO_CHARGE_VAL_INHIBIT;
+	}
+
+	if (data->quirks->has_fan_control) {
+		ret = ec_read(AYANEO_PWM_ENABLE_REG, &tmp);
+		if (ret)
+			return ret;
+
+		data->restore_pwm = tmp == AYANEO_PWM_MODE_MANUAL;
+
+		/*
+		 * Release the fan when entering hibernation to avoid
+		 * overheating if hibernation fails and hangs.
+		 */
+		if (data->restore_pwm) {
+			ret = ec_write(AYANEO_PWM_ENABLE_REG, AYANEO_PWM_MODE_AUTO);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int ayaneo_restore(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
+	int ret;
+
+	if (data->quirks->has_charge_control && data->restore_charge_limit) {
+		ret = ec_write(AYANEO_CHARGE_REG, AYANEO_CHARGE_VAL_INHIBIT);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops ayaneo_pm_ops = {
+	.freeze = ayaneo_freeze,
+	.restore = ayaneo_restore,
+};
+
 static struct platform_driver ayaneo_platform_driver = {
 	.driver = {
 		.name = "ayaneo-ec",
 		.dev_groups = ayaneo_ec_groups,
+		.pm = pm_sleep_ptr(&ayaneo_pm_ops),
 	},
 	.probe = ayaneo_ec_probe,
 };
-- 
2.52.0


