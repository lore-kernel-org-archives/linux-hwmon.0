Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB6A30F938;
	Wed, 19 Nov 2025 17:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763574339; cv=none; b=q+bfM85uw/DrcmKXDOBnGi0P0/PctBxe5cryOLXuC6Gnhmcfzf9MTka4Kjy3EI3yAKl9WauG65uddkfA5aHDNnq64YFq8TQxoYDGNo0tmIkqBYvh+js3FZfTY9TXEXSDc3HBdPHJk07EHTRAy6OgwcciqfVBI6G+VaADRW2pws0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763574339; c=relaxed/simple;
	bh=7X1BQA1mUMdDK0it0rXA7wa5Rtylx7WgcIt2g3SZU5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j5jNse3xLolSQU/cJWqrImsV2bRwnyEBhiXAR++bjpc5iN9fdJd3cWFdoWoIxrjFe/KI6wi4VJ/HeREuizQ7ZTKhnUmnm1Hy0pDpQZLHyQ38bMTaoDpCQ1Sfv+qrKk8dvW4DBwHGbhSXxEYsS2gzo3+OwDxDXbKd4VtbAV24W9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=POX3ly0C; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="POX3ly0C"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 7CBF65E57D;
	Wed, 19 Nov 2025 19:45:25 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 83BAE5E547;
	Wed, 19 Nov 2025 19:45:24 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 04B94200E79;
	Wed, 19 Nov 2025 19:45:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763574323;
	bh=KVPT/Des+65BKE1pzttG2+SbL/78yO7mCWF7rk9Sm3s=; h=From:To:Subject;
	b=POX3ly0CfpmP9Ikybc7kkF+Qg9JYFg1CYPC435Zub+Ae19ua3wzo2CP8VY+ySi4q/
	 XM2rwgvifChZK5ZAOeyBmRjL8qqs42sBvXTt7ip5bSijxgonQoCfPmBgU2qxpp8di7
	 jnLDuHosJxMYfkAZ4T9Du5fzuNQ+RTmmXNejv9BPlttv7drqLq+8hsf+Pl06T6zUZk
	 egN8aquz/Y7kWlwXEO4HiwSre6EXaGhVX05nKtlbeJybc8hfb+NnRz1bH2gdk15a4o
	 NvPxg69qGkLqZGg40O1LxITVjpu1qHNrRzi/VL8MjWNbd9ajOEX3Df9wO3U+B6U6qm
	 VC2GHQjXbLtKQ==
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
Subject: [PATCH v6 5/6] platform/x86: ayaneo-ec: Move Ayaneo devices from
 oxpec to ayaneo-ec
Date: Wed, 19 Nov 2025 18:45:04 +0100
Message-ID: <20251119174505.597218-6-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119174505.597218-1-lkml@antheas.dev>
References: <20251119174505.597218-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176357432362.2086555.9068946600012345904@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Currently, the oxpec driver contains Ayaneo devices. Move them to the
new ayaneo-ec driver, which is dedicated to them.

As this driver supports charge inhibition for Ayaneo, add support for it
for the AIR, AIR 1S, AB05-Medoncino, AIR Pro, and Kun, referenced from
the out-of-tree ayaneo-platform driver.

In addition, update the readmes of oxpec to reflect this change.

Link: https://github.com/ShadowBlip/ayaneo-platform
Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/Kconfig     |   4 +-
 drivers/platform/x86/ayaneo-ec.c |  65 +++++++++++++++++
 drivers/platform/x86/oxpec.c     | 115 +------------------------------
 3 files changed, 67 insertions(+), 117 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b049c55057b7..40f81aef33b8 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1043,9 +1043,7 @@ config OXP_EC
 	help
 		Enables support for the platform EC of OneXPlayer and AOKZOE
 		handheld devices. This includes fan speed, fan controls, and
-		disabling the default TDP behavior of the device. Due to legacy
-		reasons, this driver also provides hwmon functionality to Ayaneo
-		devices and the OrangePi Neo.
+		disabling the default TDP behavior of the device.
 
 source "drivers/platform/x86/tuxedo/Kconfig"
 
diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
index 87ebbb594f8f..a6fe141f07be 100644
--- a/drivers/platform/x86/ayaneo-ec.c
+++ b/drivers/platform/x86/ayaneo-ec.c
@@ -54,6 +54,15 @@ struct ayaneo_ec_platform_data {
 	struct acpi_battery_hook battery_hook;
 };
 
+static const struct ayaneo_ec_quirk quirk_fan = {
+	.has_fan_control = true,
+};
+
+static const struct ayaneo_ec_quirk quirk_charge_limit = {
+	.has_fan_control = true,
+	.has_charge_control = true,
+};
+
 static const struct ayaneo_ec_quirk quirk_ayaneo3 = {
 	.has_fan_control = true,
 	.has_charge_control = true,
@@ -61,6 +70,62 @@ static const struct ayaneo_ec_quirk quirk_ayaneo3 = {
 };
 
 static const struct dmi_system_id dmi_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_MATCH(DMI_BOARD_NAME, "AYANEO 2"),
+		},
+		.driver_data = (void *)&quirk_fan,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
+		},
+		.driver_data = (void *)&quirk_fan,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_MATCH(DMI_BOARD_NAME, "GEEK"),
+		},
+		.driver_data = (void *)&quirk_fan,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR"),
+		},
+		.driver_data = (void *)&quirk_charge_limit,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR 1S"),
+		},
+		.driver_data = (void *)&quirk_charge_limit,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AB05-Mendocino"),
+		},
+		.driver_data = (void *)&quirk_charge_limit,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Pro"),
+		},
+		.driver_data = (void *)&quirk_charge_limit,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "KUN"),
+		},
+		.driver_data = (void *)&quirk_charge_limit,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 54377b282ff8..144a454103b9 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -1,8 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Platform driver for OneXPlayer and AOKZOE devices. For the time being,
- * it also exposes fan controls for AYANEO, and OrangePi Handhelds via
- * hwmon sysfs.
+ * Platform driver for OneXPlayer and AOKZOE devices.
  *
  * Fan control is provided via pwm interface in the range [0-255].
  * Old AMD boards use [0-100] as range in the EC, the written value is
@@ -43,14 +41,6 @@ static bool unlock_global_acpi_lock(void)
 
 enum oxp_board {
 	aok_zoe_a1 = 1,
-	aya_neo_2,
-	aya_neo_air,
-	aya_neo_air_1s,
-	aya_neo_air_plus_mendo,
-	aya_neo_air_pro,
-	aya_neo_flip,
-	aya_neo_geek,
-	aya_neo_kun,
 	orange_pi_neo,
 	oxp_2,
 	oxp_fly,
@@ -131,62 +121,6 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)oxp_fly,
 	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
-			DMI_MATCH(DMI_BOARD_NAME, "AYANEO 2"),
-		},
-		.driver_data = (void *)aya_neo_2,
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
-			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR"),
-		},
-		.driver_data = (void *)aya_neo_air,
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
-			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR 1S"),
-		},
-		.driver_data = (void *)aya_neo_air_1s,
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
-			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AB05-Mendocino"),
-		},
-		.driver_data = (void *)aya_neo_air_plus_mendo,
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
-			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Pro"),
-		},
-		.driver_data = (void *)aya_neo_air_pro,
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
-			DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
-		},
-		.driver_data = (void *)aya_neo_flip,
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
-			DMI_MATCH(DMI_BOARD_NAME, "GEEK"),
-		},
-		.driver_data = (void *)aya_neo_geek,
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
-			DMI_EXACT_MATCH(DMI_BOARD_NAME, "KUN"),
-		},
-		.driver_data = (void *)aya_neo_kun,
-	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "OrangePi"),
@@ -672,13 +606,6 @@ static int oxp_pwm_enable(void)
 	case orange_pi_neo:
 		return write_to_ec(ORANGEPI_SENSOR_PWM_ENABLE_REG, PWM_MODE_MANUAL);
 	case aok_zoe_a1:
-	case aya_neo_2:
-	case aya_neo_air:
-	case aya_neo_air_plus_mendo:
-	case aya_neo_air_pro:
-	case aya_neo_flip:
-	case aya_neo_geek:
-	case aya_neo_kun:
 	case oxp_2:
 	case oxp_fly:
 	case oxp_mini_amd:
@@ -699,14 +626,6 @@ static int oxp_pwm_disable(void)
 	case orange_pi_neo:
 		return write_to_ec(ORANGEPI_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
 	case aok_zoe_a1:
-	case aya_neo_2:
-	case aya_neo_air:
-	case aya_neo_air_1s:
-	case aya_neo_air_plus_mendo:
-	case aya_neo_air_pro:
-	case aya_neo_flip:
-	case aya_neo_geek:
-	case aya_neo_kun:
 	case oxp_2:
 	case oxp_fly:
 	case oxp_mini_amd:
@@ -727,14 +646,6 @@ static int oxp_pwm_read(long *val)
 	case orange_pi_neo:
 		return read_from_ec(ORANGEPI_SENSOR_PWM_ENABLE_REG, 1, val);
 	case aok_zoe_a1:
-	case aya_neo_2:
-	case aya_neo_air:
-	case aya_neo_air_1s:
-	case aya_neo_air_plus_mendo:
-	case aya_neo_air_pro:
-	case aya_neo_flip:
-	case aya_neo_geek:
-	case aya_neo_kun:
 	case oxp_2:
 	case oxp_fly:
 	case oxp_mini_amd:
@@ -774,14 +685,6 @@ static int oxp_pwm_fan_speed(long *val)
 	case oxp_g1_i:
 		return read_from_ec(OXP_2_SENSOR_FAN_REG, 2, val);
 	case aok_zoe_a1:
-	case aya_neo_2:
-	case aya_neo_air:
-	case aya_neo_air_1s:
-	case aya_neo_air_plus_mendo:
-	case aya_neo_air_pro:
-	case aya_neo_flip:
-	case aya_neo_geek:
-	case aya_neo_kun:
 	case oxp_fly:
 	case oxp_mini_amd:
 	case oxp_mini_amd_a07:
@@ -810,14 +713,6 @@ static int oxp_pwm_input_write(long val)
 		/* scale to range [0-184] */
 		val = (val * 184) / 255;
 		return write_to_ec(OXP_SENSOR_PWM_REG, val);
-	case aya_neo_2:
-	case aya_neo_air:
-	case aya_neo_air_1s:
-	case aya_neo_air_plus_mendo:
-	case aya_neo_air_pro:
-	case aya_neo_flip:
-	case aya_neo_geek:
-	case aya_neo_kun:
 	case oxp_mini_amd:
 	case oxp_mini_amd_a07:
 		/* scale to range [0-100] */
@@ -854,14 +749,6 @@ static int oxp_pwm_input_read(long *val)
 		/* scale from range [0-184] */
 		*val = (*val * 255) / 184;
 		break;
-	case aya_neo_2:
-	case aya_neo_air:
-	case aya_neo_air_1s:
-	case aya_neo_air_plus_mendo:
-	case aya_neo_air_pro:
-	case aya_neo_flip:
-	case aya_neo_geek:
-	case aya_neo_kun:
 	case oxp_mini_amd:
 	case oxp_mini_amd_a07:
 		ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
-- 
2.52.0


