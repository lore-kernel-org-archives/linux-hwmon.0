Received: from relay14.grserver.gr (relay14.grserver.gr [46.224.16.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC71324B3A;
	Thu, 13 Nov 2025 21:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.224.16.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763068957; cv=none; b=DBfWzopxuH7A4BLueEQNheNttY5JT45afFx/E6rDgYYrvl/l8ihSUyK9NZAUqlXHTIEwrP+7Z5enANwI9S3m6cPx59sVftm8r1nQbYwcUEo1LG+IeT/z1QMPhx4rPlVasF21zoQIOh+0jQrRX9+aHs6+nuhYEUR+O1d6Ca0vPBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763068957; c=relaxed/simple;
	bh=HNTFanXXJkkQPYbsxRFYn4JJT7/RryoNvLHYHiyw+EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVuhV2fqE5Sbz5VFgoDBz0efyrr30H+gKxGgR7UMy2YVdFJKc1+rBOUL4HA5Tt02KlYcQjIDFlH9ThX4dzWTZX9KnbxxQbWRbDNna97ACFxo1J2/fE7pFQeNtVPwJANvTLLkyU0N/P3pUZdzP7kE7M5+7yF5pAx1vUvrahLevGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=diobkJjT; arc=none smtp.client-ip=46.224.16.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="diobkJjT"
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id E3C7B43CC8;
	Thu, 13 Nov 2025 21:22:27 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id 4776943D34;
	Thu, 13 Nov 2025 21:22:27 +0000 (UTC)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 30C5320078B;
	Thu, 13 Nov 2025 23:22:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763068947;
	bh=VH9ApSWTbTnPEDf7Kc8XugjwK3jRK2CPHBLxudSNFJQ=; h=From:To:Subject;
	b=diobkJjTZCPz31ALwkg2tts+sOMpyqC9y58+aPQqkdg1ZaBhSf9Fe0eexaP4jmdDd
	 KjqSupQp3lhkjVx1Fvh8F2AOwKufaSz2zPjfYgnXbuaXTABhK4EtMBvbkuP+vDbP5Q
	 s6cmp6T/eoZcqczuKjSd7kFk4JQ8sHGBrC2S3h0+JS0F4U+TZz6OENAhwvPZC0YRo0
	 Mc0/07UjhdskFgILKeshXQYtbj2RQm4cs/m5YfzwqtfyLZ/zsUJa/CdqwwoXl+HsBg
	 rWRPBb+rOgnQExdN5j/g9Drou16Ohi8CSXEItZX1YkcSMPszpdIbhNf71gXJ17Tg64
	 riAgWNVC/Sf/g==
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
Subject: [PATCH v5 3/6] platform/x86: ayaneo-ec: Add charge control support
Date: Thu, 13 Nov 2025 22:22:18 +0100
Message-ID: <20251113212221.456875-4-lkml@antheas.dev>
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
 <176306894669.663164.13210164051233733351@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Ayaneo devices support charge inhibition via the EC. This inhibition
only works while the device is powered on, and resets between restarts.
However, it is maintained across suspend/resume cycles.

The EC does not support charge threshold control. Instead, userspace
software on Windows manually toggles charge inhibition depending on
battery level.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/Kconfig     |   1 +
 drivers/platform/x86/ayaneo-ec.c | 112 +++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index e19850bd2609..b049c55057b7 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -320,6 +320,7 @@ config AYANEO_EC
 	tristate "Ayaneo EC platform control"
 	depends on DMI
 	depends on ACPI_EC
+	depends on ACPI_BATTERY
 	depends on HWMON
 	help
 	  Enables support for the platform EC of Ayaneo devices. This
diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
index 108a23458a4f..697bb053a7d6 100644
--- a/drivers/platform/x86/ayaneo-ec.c
+++ b/drivers/platform/x86/ayaneo-ec.c
@@ -15,6 +15,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <acpi/battery.h>
 
 #define AYANEO_PWM_ENABLE_REG	 0x4A
 #define AYANEO_PWM_REG		 0x4B
@@ -23,17 +25,27 @@
 
 #define AYANEO_FAN_REG		 0x76
 
+#define EC_CHARGE_CONTROL_BEHAVIOURS                         \
+	(BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO) |           \
+	 BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE))
+#define AYANEO_CHARGE_REG		0x1e
+#define AYANEO_CHARGE_VAL_AUTO		0xaa
+#define AYANEO_CHARGE_VAL_INHIBIT	0x55
+
 struct ayaneo_ec_quirk {
 	bool has_fan_control;
+	bool has_charge_control;
 };
 
 struct ayaneo_ec_platform_data {
 	struct platform_device *pdev;
 	struct ayaneo_ec_quirk *quirks;
+	struct acpi_battery_hook battery_hook;
 };
 
 static const struct ayaneo_ec_quirk quirk_ayaneo3 = {
 	.has_fan_control = true,
+	.has_charge_control = true,
 };
 
 static const struct dmi_system_id dmi_table[] = {
@@ -164,11 +176,102 @@ static const struct hwmon_chip_info ayaneo_ec_chip_info = {
 	.info = ayaneo_ec_sensors,
 };
 
+static int ayaneo_psy_ext_get_prop(struct power_supply *psy,
+				   const struct power_supply_ext *ext,
+				   void *data,
+				   enum power_supply_property psp,
+				   union power_supply_propval *val)
+{
+	int ret;
+	u8 tmp;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
+		ret = ec_read(AYANEO_CHARGE_REG, &tmp);
+		if (ret)
+			return ret;
+
+		if (tmp == AYANEO_CHARGE_VAL_INHIBIT)
+			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
+		else
+			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int ayaneo_psy_ext_set_prop(struct power_supply *psy,
+				   const struct power_supply_ext *ext,
+				   void *data,
+				   enum power_supply_property psp,
+				   const union power_supply_propval *val)
+{
+	u8 raw_val;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
+		switch (val->intval) {
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
+			raw_val = AYANEO_CHARGE_VAL_AUTO;
+			break;
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
+			raw_val = AYANEO_CHARGE_VAL_INHIBIT;
+			break;
+		default:
+			return -EINVAL;
+		}
+		return ec_write(AYANEO_CHARGE_REG, raw_val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int ayaneo_psy_prop_is_writeable(struct power_supply *psy,
+					const struct power_supply_ext *ext,
+					void *data,
+					enum power_supply_property psp)
+{
+	return true;
+}
+
+static const enum power_supply_property ayaneo_psy_ext_props[] = {
+	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
+};
+
+static const struct power_supply_ext ayaneo_psy_ext = {
+	.name			= "ayaneo-charge-control",
+	.properties		= ayaneo_psy_ext_props,
+	.num_properties		= ARRAY_SIZE(ayaneo_psy_ext_props),
+	.charge_behaviours	= EC_CHARGE_CONTROL_BEHAVIOURS,
+	.get_property		= ayaneo_psy_ext_get_prop,
+	.set_property		= ayaneo_psy_ext_set_prop,
+	.property_is_writeable	= ayaneo_psy_prop_is_writeable,
+};
+
+static int ayaneo_add_battery(struct power_supply *battery,
+			      struct acpi_battery_hook *hook)
+{
+	struct ayaneo_ec_platform_data *data =
+		container_of(hook, struct ayaneo_ec_platform_data, battery_hook);
+
+	return power_supply_register_extension(battery, &ayaneo_psy_ext,
+					       &data->pdev->dev, NULL);
+}
+
+static int ayaneo_remove_battery(struct power_supply *battery,
+				 struct acpi_battery_hook *hook)
+{
+	power_supply_unregister_extension(battery, &ayaneo_psy_ext);
+	return 0;
+}
+
 static int ayaneo_ec_probe(struct platform_device *pdev)
 {
 	const struct dmi_system_id *dmi_entry;
 	struct ayaneo_ec_platform_data *data;
 	struct device *hwdev;
+	int ret;
 
 	dmi_entry = dmi_first_match(dmi_table);
 	if (!dmi_entry)
@@ -189,6 +292,15 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
 			return PTR_ERR(hwdev);
 	}
 
+	if (data->quirks->has_charge_control) {
+		data->battery_hook.add_battery = ayaneo_add_battery;
+		data->battery_hook.remove_battery = ayaneo_remove_battery;
+		data->battery_hook.name = "Ayaneo Battery";
+		ret = devm_battery_hook_register(&pdev->dev, &data->battery_hook);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.51.2


