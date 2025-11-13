Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466F431C576;
	Thu, 13 Nov 2025 21:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763068952; cv=none; b=KMqZMMQHkUD8LNa/r3oRiyS3goOGpIb4qO7j/yhlyBXwsfQCphvpahJV/qFFrF99ll/XBsv2GEnCm923TukQLBc8HfqOWUNtQqEJJhumfvpcTQ9QH2Z9O/u+pMRHUOORFpkaFQqYrdi+wipt4Pxu/U+jKbXwKSOS64PGmGOQiME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763068952; c=relaxed/simple;
	bh=4rHqgvPzwYwWwrohAwGxu5QRS59f+IJ/YjIL+a3e7Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ey9FKhm23Yxms8bj3Tae1g1/zLeyPZmt1xl8jq/L2FGjRNwOhs+WzwdAC7IvTx58fh0AagUwZWtsIV3CUQSCcqcVHU8sWabd2rOKmxLWsqA3uaHPQ2P9VmENWpE9da5DA0VLXoWAGemtEnFaa7T7ewRAw44NoFHYz1QyNrejmwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=BYU5194Y; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="BYU5194Y"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 54E295E5CA;
	Thu, 13 Nov 2025 23:22:29 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 885975E4B1;
	Thu, 13 Nov 2025 23:22:28 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 33B8920077F;
	Thu, 13 Nov 2025 23:22:27 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763068947;
	bh=TKz4jhFq8wMqCW8mdPsZdsjuhyAi1eGJoY4RE72rDrA=; h=From:To:Subject;
	b=BYU5194Y9wsOJFSoCX7JAstnqS7gag6gjCGdBxMRJPhIsNwmk8nUN5dkSbLdLe85/
	 lkMUHHJQQ9ujv4HumjO3xxaKPQMczjj9se8uEv0BRuo6L8f6HskG5NusTDqWneTN5Y
	 VFbVPitAVTI/hDHTBwdRpZ9ir/346/dGo3R33WKQ9LlG0L1BBga+d9PPWWNa3ULfZ8
	 RNTmIegZ6bc6r9iwpMhqVroLGG5Mm5IN2gLzqxMrhRJURPFQ40FarIbVuk+x7s1Mns
	 9TChaIPdfAFI/gxo9ENRoiq3qj588UC0cfyCZpEXHIoGff3gmTobhC6GKF2Ar+wEAf
	 0ntQUzZMGFMbg==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
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
Subject: [PATCH v5 4/6] platform/x86: ayaneo-ec: Add controller power and
 modules attributes
Date: Thu, 13 Nov 2025 22:22:19 +0100
Message-ID: <20251113212221.456875-5-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113212221.456875-1-lkml@antheas.dev>
References: <20251113212221.456875-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176306894768.663207.765024659385764780@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

The Ayaneo 3 features hot-swappable controller modules. The ejection
and management is done through HID. However, after ejecting the modules,
the controller needs to be power cycled via the EC to re-initialize.

For this, the EC provides a variable that holds whether the left or
right modules are connected, and a power control register to turn
the controller on or off. After ejecting the modules, the controller
should be turned off. Then, after both modules are reinserted,
the controller may be powered on again to re-initialize.

This patch introduces two new sysfs attributes:
 - `controller_modules`: a read-only attribute that indicates whether
   the left and right modules are connected (none, left, right, both).
 - `controller_power`: a read-write attribute that allows the user
   to turn the controller on or off (with '1'/'0').

Therefore, after ejection is complete, userspace can power off the
controller, then wait until both modules have been reinserted
(`controller_modules` will return 'both') to turn on the controller.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 .../ABI/testing/sysfs-platform-ayaneo-ec      |  19 ++++
 MAINTAINERS                                   |   1 +
 drivers/platform/x86/ayaneo-ec.c              | 107 ++++++++++++++++++
 3 files changed, 127 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-ayaneo-ec

diff --git a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
new file mode 100644
index 000000000000..4cffbf5fc7ca
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
@@ -0,0 +1,19 @@
+What:		/sys/devices/platform/ayaneo-ec/controller_power
+Date:		Nov 2025
+KernelVersion:	6.19
+Contact:	"Antheas Kapenekakis" <lkml@antheas.dev>
+Description:
+		Current controller power state. Allows turning on and off
+		the controller power (e.g. for power savings). Write 1 to
+		turn on, 0 to turn off. File is readable and writable.
+
+What:		/sys/devices/platform/ayaneo-ec/controller_modules
+Date:		Nov 2025
+KernelVersion:	6.19
+Contact:	"Antheas Kapenekakis"  <lkml@antheas.dev>
+Description:
+		Shows which controller modules are currently connected to
+		the device. Possible values are "left", "right" and "both".
+		File is read-only. The Windows software for this device
+		will only set controller power to 1 if both module sides
+		are connected (i.e. this file returns "both").
diff --git a/MAINTAINERS b/MAINTAINERS
index c5bf7207c45f..f8ab009b6224 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4196,6 +4196,7 @@ AYANEO PLATFORM EC DRIVER
 M:	Antheas Kapenekakis <lkml@antheas.dev>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-platform-ayaneo
 F:	drivers/platform/x86/ayaneo-ec.c
 
 AZ6007 DVB DRIVER
diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
index 697bb053a7d6..a0747e7ee43a 100644
--- a/drivers/platform/x86/ayaneo-ec.c
+++ b/drivers/platform/x86/ayaneo-ec.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/bits.h>
 #include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
@@ -16,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
+#include <linux/sysfs.h>
 #include <acpi/battery.h>
 
 #define AYANEO_PWM_ENABLE_REG	 0x4A
@@ -32,9 +34,18 @@
 #define AYANEO_CHARGE_VAL_AUTO		0xaa
 #define AYANEO_CHARGE_VAL_INHIBIT	0x55
 
+#define AYANEO_POWER_REG	0x2d
+#define AYANEO_POWER_OFF	0xfe
+#define AYANEO_POWER_ON		0xff
+#define AYANEO_MODULE_REG	0x2f
+#define AYANEO_MODULE_LEFT	BIT(0)
+#define AYANEO_MODULE_RIGHT	BIT(1)
+#define AYANEO_MODULE_MASK	(AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT)
+
 struct ayaneo_ec_quirk {
 	bool has_fan_control;
 	bool has_charge_control;
+	bool has_magic_modules;
 };
 
 struct ayaneo_ec_platform_data {
@@ -46,6 +57,7 @@ struct ayaneo_ec_platform_data {
 static const struct ayaneo_ec_quirk quirk_ayaneo3 = {
 	.has_fan_control = true,
 	.has_charge_control = true,
+	.has_magic_modules = true,
 };
 
 static const struct dmi_system_id dmi_table[] = {
@@ -266,6 +278,100 @@ static int ayaneo_remove_battery(struct power_supply *battery,
 	return 0;
 }
 
+static ssize_t controller_power_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf,
+				      size_t count)
+{
+	bool value;
+	int ret;
+
+	ret = kstrtobool(buf, &value);
+	if (ret)
+		return ret;
+
+	ret = ec_write(AYANEO_POWER_REG, value ? AYANEO_POWER_ON : AYANEO_POWER_OFF);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t controller_power_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	int ret;
+	u8 val;
+
+	ret = ec_read(AYANEO_POWER_REG, &val);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", val == AYANEO_POWER_ON);
+}
+
+static DEVICE_ATTR_RW(controller_power);
+
+static ssize_t controller_modules_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
+{
+	char *out;
+	int ret;
+	u8 val;
+
+	ret = ec_read(AYANEO_MODULE_REG, &val);
+	if (ret)
+		return ret;
+
+	switch (~val & AYANEO_MODULE_MASK) {
+	case AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT:
+		out = "both";
+		break;
+	case AYANEO_MODULE_LEFT:
+		out = "left";
+		break;
+	case AYANEO_MODULE_RIGHT:
+		out = "right";
+		break;
+	default:
+		out = "none";
+		break;
+	}
+
+	return sysfs_emit(buf, "%s\n", out);
+}
+
+static DEVICE_ATTR_RO(controller_modules);
+
+static struct attribute *aya_mm_attrs[] = {
+	&dev_attr_controller_power.attr,
+	&dev_attr_controller_modules.attr,
+	NULL
+};
+
+static umode_t aya_mm_is_visible(struct kobject *kobj,
+				 struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct platform_device *pdev = to_platform_device(dev);
+	struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
+
+	if (data->quirks->has_magic_modules)
+		return attr->mode;
+	return 0;
+}
+
+static const struct attribute_group aya_mm_attribute_group = {
+	.is_visible = aya_mm_is_visible,
+	.attrs = aya_mm_attrs,
+};
+
+static const struct attribute_group *ayaneo_ec_groups[] = {
+	&aya_mm_attribute_group,
+	NULL
+};
+
 static int ayaneo_ec_probe(struct platform_device *pdev)
 {
 	const struct dmi_system_id *dmi_entry;
@@ -307,6 +413,7 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
 static struct platform_driver ayaneo_platform_driver = {
 	.driver = {
 		.name = "ayaneo-ec",
+		.dev_groups = ayaneo_ec_groups,
 	},
 	.probe = ayaneo_ec_probe,
 };
-- 
2.51.2


