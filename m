Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F998821;
	Wed, 19 Nov 2025 17:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763574334; cv=none; b=rx1S3jVZ48cP4VYL317jo881aittGglQlmtle6o0UgdtRuCEen2GdXrv7Fltlvnlsr5uDk+TmqRrczcDlz5jXngHahekGLbsQPnnWZ+Q/b9f1BfZjgKqWxG/ZsMITGwt30B8oasZgv7TZhmq3RJkLwgxRvVowH2PPJvCh8foDxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763574334; c=relaxed/simple;
	bh=dg2PWnJWHw2TMx+htIzckKTnrAvFPsfwrO0MKQSihr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fK0wi8T3jxO4Hf5Y9CFy3W4UpFSH2NQE3KEN1Cm7yYljXjqc94Qwfdo8z7cplVNaNXNPSwieYjETFhy8tD5+C6WVuC11yYVgkj0Nridaor7XEDGTKoylpEr/SmcGRYZwxaunJeQjdpvUZLF7kuFEGvyHAGDos4m/p28gem5PePo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=SI1RdoVs; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="SI1RdoVs"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id C93015E56A;
	Wed, 19 Nov 2025 19:45:22 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id CDC085E57D;
	Wed, 19 Nov 2025 19:45:21 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id CF7CE200E7D;
	Wed, 19 Nov 2025 19:45:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763574320;
	bh=7Z2g4VwJyUUCI2hqKgqo/X5lORYPMvx7C5VUT20FoK8=; h=From:To:Subject;
	b=SI1RdoVs+9DwKEg4w/nVTzj7MVGCKNT9u53QKI0aDnDZjd2q2PriyvGyGar53NKbE
	 nAvYyb3fGaW6VvQnTblmGIR97mx+Z0fvelGcnnOn/Lo4j2J/KsaGu9LanbnY8kjqab
	 ZEjNP50/ES3euHBu58RWTT1/b9CilIICqQCYTJa4sDJE0f53s770uabw36ScWUACGF
	 6qlmZCaJloKZ70HdOd8Fbcv5hfZT2bX3areHRLVQYSzgF58N4BRvDCrI9fdbSMQO0t
	 Ao8j+ydNb2is3UqaWi3Zm4AtQj/u50Td/cW6q57nM4su/uy4v6z3IUFDDIKOOSGyDL
	 Y05R2Ggw9JS6A==
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
	Armin-Wolf <W_Armin@gmx.de>
Subject: [PATCH v6 2/6] platform/x86: ayaneo-ec: Add hwmon support
Date: Wed, 19 Nov 2025 18:45:01 +0100
Message-ID: <20251119174505.597218-3-lkml@antheas.dev>
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
 <176357431973.2086411.9254263283028849340@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Add hwmon single fan sensor reads and control for Ayaneo devices.
The register and method of access is the same for all devices.

Reviewed-by: Armin-Wolf <W_Armin@gmx.de>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/Kconfig     |   2 +
 drivers/platform/x86/ayaneo-ec.c | 136 +++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 8ca95536f8d9..e19850bd2609 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -319,6 +319,8 @@ config ASUS_TF103C_DOCK
 config AYANEO_EC
 	tristate "Ayaneo EC platform control"
 	depends on DMI
+	depends on ACPI_EC
+	depends on HWMON
 	help
 	  Enables support for the platform EC of Ayaneo devices. This
 	  includes fan control, fan speed, charge limit, magic
diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
index 2fe66c8a89f4..86d4eed49f42 100644
--- a/drivers/platform/x86/ayaneo-ec.c
+++ b/drivers/platform/x86/ayaneo-ec.c
@@ -7,14 +7,24 @@
  * Copyright (C) 2025 Antheas Kapenekakis <lkml@antheas.dev>
  */
 
+#include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <linux/err.h>
+#include <linux/hwmon.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
+#define AYANEO_PWM_ENABLE_REG	 0x4A
+#define AYANEO_PWM_REG		 0x4B
+#define AYANEO_PWM_MODE_AUTO	 0x00
+#define AYANEO_PWM_MODE_MANUAL	 0x01
+
+#define AYANEO_FAN_REG		 0x76
+
 struct ayaneo_ec_quirk {
+	bool has_fan_control;
 };
 
 struct ayaneo_ec_platform_data {
@@ -23,6 +33,7 @@ struct ayaneo_ec_platform_data {
 };
 
 static const struct ayaneo_ec_quirk quirk_ayaneo3 = {
+	.has_fan_control = true,
 };
 
 static const struct dmi_system_id dmi_table[] = {
@@ -36,10 +47,128 @@ static const struct dmi_system_id dmi_table[] = {
 	{},
 };
 
+/* Callbacks for hwmon interface */
+static umode_t ayaneo_ec_hwmon_is_visible(const void *drvdata,
+					  enum hwmon_sensor_types type, u32 attr,
+					  int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		return 0444;
+	case hwmon_pwm:
+		return 0644;
+	default:
+		return 0;
+	}
+}
+
+static int ayaneo_ec_read(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long *val)
+{
+	u8 tmp;
+	int ret;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			ret = ec_read(AYANEO_FAN_REG, &tmp);
+			if (ret)
+				return ret;
+			*val = tmp << 8;
+			ret = ec_read(AYANEO_FAN_REG + 1, &tmp);
+			if (ret)
+				return ret;
+			*val |= tmp;
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			ret = ec_read(AYANEO_PWM_REG, &tmp);
+			if (ret)
+				return ret;
+			if (tmp > 100)
+				return -EIO;
+			*val = (255 * tmp) / 100;
+			return 0;
+		case hwmon_pwm_enable:
+			ret = ec_read(AYANEO_PWM_ENABLE_REG, &tmp);
+			if (ret)
+				return ret;
+			if (tmp == AYANEO_PWM_MODE_MANUAL)
+				*val = 1;
+			else if (tmp == AYANEO_PWM_MODE_AUTO)
+				*val = 2;
+			else
+				return -EIO;
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return -EOPNOTSUPP;
+}
+
+static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_enable:
+			switch (val) {
+			case 1:
+				return ec_write(AYANEO_PWM_ENABLE_REG,
+						AYANEO_PWM_MODE_MANUAL);
+			case 2:
+				return ec_write(AYANEO_PWM_ENABLE_REG,
+						AYANEO_PWM_MODE_AUTO);
+			default:
+				return -EINVAL;
+			}
+		case hwmon_pwm_input:
+			if (val < 0 || val > 255)
+				return -EINVAL;
+			return ec_write(AYANEO_PWM_REG, (val * 100) / 255);
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops ayaneo_ec_hwmon_ops = {
+	.is_visible = ayaneo_ec_hwmon_is_visible,
+	.read = ayaneo_ec_read,
+	.write = ayaneo_ec_write,
+};
+
+static const struct hwmon_channel_info *const ayaneo_ec_sensors[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
+	NULL,
+};
+
+static const struct hwmon_chip_info ayaneo_ec_chip_info = {
+	.ops = &ayaneo_ec_hwmon_ops,
+	.info = ayaneo_ec_sensors,
+};
+
 static int ayaneo_ec_probe(struct platform_device *pdev)
 {
 	const struct dmi_system_id *dmi_entry;
 	struct ayaneo_ec_platform_data *data;
+	struct device *hwdev;
 
 	dmi_entry = dmi_first_match(dmi_table);
 	if (!dmi_entry)
@@ -53,6 +182,13 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
 	data->quirks = dmi_entry->driver_data;
 	platform_set_drvdata(pdev, data);
 
+	if (data->quirks->has_fan_control) {
+		hwdev = devm_hwmon_device_register_with_info(&pdev->dev,
+			"ayaneo_ec", NULL, &ayaneo_ec_chip_info, NULL);
+		if (IS_ERR(hwdev))
+			return PTR_ERR(hwdev);
+	}
+
 	return 0;
 }
 
-- 
2.52.0


