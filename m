Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB14322A22;
	Thu, 13 Nov 2025 21:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763068953; cv=none; b=HBd5QDK0OwAyWvkiavoFCLrVcXxQIgy1HZzWMO+ETOR7TstDlzzTMIam80BJeFZmXxvTnJHtDFdz1GtuODPpR14d9saH+AXITDVPv9qXAe5/yf/KiHhDE3b8tTqJWe7XQ7mTNOOds/9hjWpedZv8uXtAppeTKFRkDiug3K7zPlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763068953; c=relaxed/simple;
	bh=/7z0FA5NFoF5tG1FuTopufWsE0Y5IUObUOJObghkeLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bv2QRFd1NIRyxtglmp7LCWtmluZrGZqk0X2uvtMN/vH/KWcdX7Hk0BonanFT34KPxHF9gpOk82dEOThZNsebk6Jokg2QLDvu5jfpe4uPdlY7Dy3i6nhA0nlJGSf41rU5kxVMXNIc+LLenCTAvSf1urYhGmBnSiczWqSrtQ8yrHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=TFU7f8ug; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="TFU7f8ug"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 4F3CA5E61F;
	Thu, 13 Nov 2025 23:22:30 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 6531D5E4C6;
	Thu, 13 Nov 2025 23:22:29 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id EDC5820078B;
	Thu, 13 Nov 2025 23:22:27 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763068948;
	bh=KBGnZZ/1JfmXG5n8k0mIaogysFR00TuRjIgqouhlQg8=; h=From:To:Subject;
	b=TFU7f8uge+Nj+FW63mOaAfpXfDhJ8lHgVkJw+YwV3Q2KM/y03/BjQDXTOU5iG3NY3
	 2RiO64M24VPsCmpQRoM/4u3hpS7xoCNwFND2F8lC6mVABpRnbdq54JcTS3TkQMC/t5
	 vP2LjQAebdgHYzgpl6RHU6OeOQ/l0XDsRPkjKyWsNOSKn8LcIyvbL9eS30RLGyww/s
	 NMtdOSTyViVq5/YPa6GZw/68y3pww0le8pp4E37pRC/VKdykwjSGK0Wg/vbabBM+Mg
	 KO9v8zyXSz9OqU6UVgBbYvaKufKDypbF/XQVWetR3xIo8AnWQNqQNvn1MFZ6v77mwG
	 JFe4EyF5oez4w==
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
Subject: [PATCH v5 5/6] platform/x86: ayaneo-ec: Move Ayaneo devices from
 oxpec to ayaneo-ec
Date: Thu, 13 Nov 2025 22:22:20 +0100
Message-ID: <20251113212221.456875-6-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113212221.456875-1-lkml@antheas.dev>
References: <20251113212221.456875-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176306894853.663254.8269264807293192399@linux3247.grserver.gr>
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
index a0747e7ee43a..814f7f028710 100644
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
2.51.2


