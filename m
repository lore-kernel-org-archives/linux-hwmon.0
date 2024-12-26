Received: from smtp1.math.uni-bielefeld.de (smtp1.math.uni-bielefeld.de [129.70.45.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD4D42AAB;
	Thu, 26 Dec 2024 17:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.70.45.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232496; cv=none; b=qcO4P4f5yA5rHKX8WhlYKzP+cNtSvPi5Yp7dURK0BGPAbju1pyuhKXDY7znhhX9WLkxwCZ3noqU+7ekZa9NKzI+SwAVfKRTxlJCIbg4JI4M2uDiJlSY+qotJFmjLkTZv3oxjafdtKDAJx4abkx+7MVAB5BYpLjxTB9UVkUSUZx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232496; c=relaxed/simple;
	bh=ZdV/x4fj5wadrrWjnH/hKOlaj1URVeGLBcevqMOKpyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uvz68LzlkdZ+TCXnWp/ilvJLGkth+k3Rd23YdMAiQHTlSv3ukCDENHkxq7FYN82nS/pemE8zdUnbGj/2tmDgzIwTxU9AvFfT6tpr2bJogjkOEEAUaKGKaJDqd5QT68c4negiWjq6SqGU4naCJxihpFxY5Ch8nxEQR5soAZE7b+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de; spf=pass smtp.mailfrom=math.uni-bielefeld.de; dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b=wQVduBzr; arc=none smtp.client-ip=129.70.45.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="wQVduBzr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=math.uni-bielefeld.de; s=default; t=1735232488;
	bh=ZdV/x4fj5wadrrWjnH/hKOlaj1URVeGLBcevqMOKpyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wQVduBzr6WLVwRy4QQPNT7s1MCVMa/ZEdh+J0+JF6jZ5D6i0hW2bJ2YH0OAelVBbD
	 jElxvu/m69Ux+q3+wZXbkQJbMMW/VA3K/Jr7xRM87vegUAsylRo1pn5iZGHuaHUYz9
	 PSZj9m2/LWCqmpFebjJHUkghXKyXsNHYBG6iVB5NCJURpfvjPVe2bwxEz3TIPR0Q+m
	 Y1b4dTb0T31xa2827FLpMCih1elKNtX6tAYEkMuAZp24/OBz4feVKY+cYtYeh1VV/9
	 QRknGIm2IwN7bJeJcgFZHP/eP2eZpsb26wMx1/KVOuUToPPLqSeL2aT//rOmTAPvsM
	 geOjfyvVIMdcw==
Received: from localhost (58-32-133-N4.customer.vsm.sh [170.133.32.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp1.math.uni-bielefeld.de (Postfix) with ESMTPSA id D1759206CD;
	Thu, 26 Dec 2024 18:01:27 +0100 (CET)
From: tjakobi@math.uni-bielefeld.de
To: Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] hwmon: (oxp-sensors) Separate logic from device-specific data
Date: Thu, 26 Dec 2024 18:00:16 +0100
Message-ID: <daa7571b0731e203b5a86e484da8083fd034601e.1735232354.git.tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
References: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

We currently have large switch-statements in all functions that
write to EC registers, even though the bulk of the supported
devices functions more or less the same.

Factor the device-specific data out into a struct oxp_config. This
only leaves logic in the corresponding functions and should make
adding future devices much easier and less error-prone.

Also introduce struct oxp_data which is going to be used in a
later commit to cache device state.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/hwmon/oxp-sensors.c | 517 +++++++++++++++---------------------
 1 file changed, 215 insertions(+), 302 deletions(-)

diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
index 83730d931824..fbd1463d1494 100644
--- a/drivers/hwmon/oxp-sensors.c
+++ b/drivers/hwmon/oxp-sensors.c
@@ -42,27 +42,6 @@ static bool unlock_global_acpi_lock(void)
 	return ACPI_SUCCESS(acpi_release_global_lock(oxp_mutex));
 }
 
-enum oxp_board {
-	aok_zoe_a1 = 1,
-	aya_neo_2,
-	aya_neo_air,
-	aya_neo_air_1s,
-	aya_neo_air_plus_mendo,
-	aya_neo_air_pro,
-	aya_neo_flip,
-	aya_neo_geek,
-	aya_neo_kun,
-	orange_pi_neo,
-	oxp_2,
-	oxp_fly,
-	oxp_mini_amd,
-	oxp_mini_amd_a07,
-	oxp_mini_amd_pro,
-	oxp_x1,
-};
-
-static enum oxp_board board;
-
 /* Fan reading and PWM */
 #define OXP_SENSOR_FAN_REG             0x76 /* Fan reading is 2 registers long */
 #define OXP_2_SENSOR_FAN_REG           0x58 /* Fan reading is 2 registers long */
@@ -89,125 +68,212 @@ static enum oxp_board board;
 
 #define OXP_TURBO_RETURN_VAL           0x00 /* Common return val */
 
+enum oxp_feature_bits {
+	OXP_FEATURE_SENSOR_FAN,
+	OXP_FEATURE_PWM,
+	OXP_FEATURE_TURBO,
+	OXP_FEATURE_ONLY_AMD,
+};
+
+struct oxp_config {
+	unsigned long features;
+
+	u8 sensor_pwm_enable_reg;
+	u8 sensor_pwm_reg;
+	u8 sensor_pwm_scale[2];
+	u8 sensor_fan_reg;
+
+	u8 turbo_switch_reg;
+	u8 turbo_enable_val;
+};
+
+struct oxp_data {
+	struct device *hwmon_dev;
+	const struct oxp_config *config;
+};
+
+static const struct oxp_config config_oxp = {
+	.features = BIT(OXP_FEATURE_SENSOR_FAN) | BIT(OXP_FEATURE_PWM),
+
+	.sensor_pwm_enable_reg = OXP_SENSOR_PWM_ENABLE_REG,
+	.sensor_pwm_reg = OXP_SENSOR_PWM_REG,
+	.sensor_pwm_scale = {0, 100},
+	.sensor_fan_reg = OXP_SENSOR_FAN_REG,
+};
+
+static const struct oxp_config config_mini_amd = {
+	.features = BIT(OXP_FEATURE_SENSOR_FAN) | BIT(OXP_FEATURE_PWM) | BIT(OXP_FEATURE_ONLY_AMD),
+
+	.sensor_pwm_enable_reg = OXP_SENSOR_PWM_ENABLE_REG,
+	.sensor_pwm_reg = OXP_SENSOR_PWM_REG,
+	.sensor_pwm_scale = {0, 100},
+	.sensor_fan_reg = OXP_SENSOR_FAN_REG,
+};
+
+static const struct oxp_config config_mini_amd_a07 = {
+	.features = BIT(OXP_FEATURE_SENSOR_FAN) | BIT(OXP_FEATURE_PWM) | BIT(OXP_FEATURE_TURBO),
+
+	.sensor_pwm_enable_reg = OXP_SENSOR_PWM_ENABLE_REG,
+	.sensor_pwm_reg = OXP_SENSOR_PWM_REG,
+	.sensor_pwm_scale = {0, 100},
+	.sensor_fan_reg = OXP_SENSOR_FAN_REG,
+
+	.turbo_switch_reg = OXP_MINI_TURBO_SWITCH_REG,
+	.turbo_enable_val = OXP_MINI_TURBO_TAKE_VAL,
+};
+
+static const struct oxp_config config_oxp2_turbo = {
+	.features = BIT(OXP_FEATURE_SENSOR_FAN) | BIT(OXP_FEATURE_PWM) | BIT(OXP_FEATURE_TURBO),
+
+	.sensor_pwm_enable_reg = OXP_SENSOR_PWM_ENABLE_REG,
+	.sensor_pwm_reg = OXP_SENSOR_PWM_REG,
+	.sensor_pwm_scale = {0, 184},
+	.sensor_fan_reg = OXP_2_SENSOR_FAN_REG,
+
+	.turbo_switch_reg = OXP_2_TURBO_SWITCH_REG,
+	.turbo_enable_val = OXP_TURBO_TAKE_VAL,
+};
+
+static const struct oxp_config config_orange = {
+	.features = BIT(OXP_FEATURE_SENSOR_FAN) | BIT(OXP_FEATURE_PWM),
+
+	.sensor_pwm_enable_reg = ORANGEPI_SENSOR_PWM_ENABLE_REG,
+	.sensor_pwm_reg = ORANGEPI_SENSOR_PWM_REG,
+	.sensor_pwm_scale = {1, 244},
+	.sensor_fan_reg = ORANGEPI_SENSOR_FAN_REG,
+};
+
+static const struct oxp_config config_aok_zoe = {
+	.features = BIT(OXP_FEATURE_SENSOR_FAN) | BIT(OXP_FEATURE_PWM) | BIT(OXP_FEATURE_TURBO),
+
+	.sensor_pwm_enable_reg = OXP_SENSOR_PWM_ENABLE_REG,
+	.sensor_pwm_reg = OXP_SENSOR_PWM_REG,
+	.sensor_pwm_scale = {0, 255},
+	.sensor_fan_reg = OXP_SENSOR_FAN_REG,
+
+	.turbo_switch_reg = OXP_TURBO_SWITCH_REG,
+	.turbo_enable_val = OXP_TURBO_TAKE_VAL,
+};
+
 static const struct dmi_system_id dmi_table[] = {
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07"),
 		},
-		.driver_data = (void *)aok_zoe_a1,
+		.driver_data = (void *)&config_aok_zoe,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 Pro"),
 		},
-		.driver_data = (void *)aok_zoe_a1,
+		.driver_data = (void *)&config_aok_zoe,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
 			DMI_MATCH(DMI_BOARD_NAME, "AYANEO 2"),
 		},
-		.driver_data = (void *)aya_neo_2,
+		.driver_data = (void *)&config_oxp,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR"),
 		},
-		.driver_data = (void *)aya_neo_air,
+		.driver_data = (void *)&config_oxp,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR 1S"),
 		},
-		.driver_data = (void *)aya_neo_air_1s,
+		.driver_data = (void *)&config_oxp,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AB05-Mendocino"),
 		},
-		.driver_data = (void *)aya_neo_air_plus_mendo,
+		.driver_data = (void *)&config_oxp,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Pro"),
 		},
-		.driver_data = (void *)aya_neo_air_pro,
+		.driver_data = (void *)&config_oxp,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
 			DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
 		},
-		.driver_data = (void *)aya_neo_flip,
+		.driver_data = (void *)&config_oxp,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
 			DMI_MATCH(DMI_BOARD_NAME, "GEEK"),
 		},
-		.driver_data = (void *)aya_neo_geek,
+		.driver_data = (void *)&config_oxp,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "KUN"),
 		},
-		.driver_data = (void *)aya_neo_kun,
+		.driver_data = (void *)&config_oxp,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "OrangePi"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEO-01"),
 		},
-		.driver_data = (void *)orange_pi_neo,
+		.driver_data = (void *)&config_orange,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONE XPLAYER"),
 		},
-		.driver_data = (void *)oxp_mini_amd,
+		.driver_data = (void *)&config_mini_amd,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
 			DMI_MATCH(DMI_BOARD_NAME, "ONEXPLAYER 2"),
 		},
-		.driver_data = (void *)oxp_2,
+		.driver_data = (void *)&config_oxp2_turbo,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1"),
 		},
-		.driver_data = (void *)oxp_fly,
+		.driver_data = (void *)&config_aok_zoe,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER mini A07"),
 		},
-		.driver_data = (void *)oxp_mini_amd_a07,
+		.driver_data = (void *)&config_mini_amd_a07,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER Mini Pro"),
 		},
-		.driver_data = (void *)oxp_mini_amd_pro,
+		.driver_data = (void *)&config_aok_zoe,
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
 			DMI_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1"),
 		},
-		.driver_data = (void *)oxp_x1,
+		.driver_data = (void *)&config_oxp2_turbo,
 	},
 	{},
 };
@@ -252,83 +318,59 @@ static int write_to_ec(u8 reg, u8 value)
 	return ret;
 }
 
-/* Turbo button toggle functions */
-static int tt_toggle_enable(void)
+/* Rescale a (HW) sensor PWM value to userspace range. */
+static long rescale_sensor_pwm_to_user(const struct oxp_config *config, long val)
 {
-	u8 reg;
-	u8 val;
+	const long range = config->sensor_pwm_scale[1] - config->sensor_pwm_scale[0];
 
-	switch (board) {
-	case oxp_mini_amd_a07:
-		reg = OXP_MINI_TURBO_SWITCH_REG;
-		val = OXP_MINI_TURBO_TAKE_VAL;
-		break;
-	case aok_zoe_a1:
-	case oxp_fly:
-	case oxp_mini_amd_pro:
-		reg = OXP_TURBO_SWITCH_REG;
-		val = OXP_TURBO_TAKE_VAL;
-		break;
-	case oxp_2:
-	case oxp_x1:
-		reg = OXP_2_TURBO_SWITCH_REG;
-		val = OXP_TURBO_TAKE_VAL;
-		break;
-	default:
-		return -EINVAL;
-	}
-	return write_to_ec(reg, val);
+	if (range == 255)
+		return val;
+
+	return ((val - config->sensor_pwm_scale[0]) * 255) / range;
 }
 
-static int tt_toggle_disable(void)
+/* Rescale a (userspace) sensor PWM value to hw range. */
+static long rescale_sensor_pwm_to_hw(const struct oxp_config *config, long val)
 {
-	u8 reg;
-	u8 val;
+	const long range = config->sensor_pwm_scale[1] - config->sensor_pwm_scale[0];
 
-	switch (board) {
-	case oxp_mini_amd_a07:
-		reg = OXP_MINI_TURBO_SWITCH_REG;
-		val = OXP_TURBO_RETURN_VAL;
-		break;
-	case aok_zoe_a1:
-	case oxp_fly:
-	case oxp_mini_amd_pro:
-		reg = OXP_TURBO_SWITCH_REG;
-		val = OXP_TURBO_RETURN_VAL;
-		break;
-	case oxp_2:
-	case oxp_x1:
-		reg = OXP_2_TURBO_SWITCH_REG;
-		val = OXP_TURBO_RETURN_VAL;
-		break;
-	default:
+	if (range == 255)
+		return val;
+
+	return config->sensor_pwm_scale[0] + (val * range) / 255;
+}
+
+/* Turbo button toggle functions */
+static int tt_toggle_enable(const struct oxp_config *config)
+{
+	if (!test_bit(OXP_FEATURE_TURBO, &config->features))
 		return -EINVAL;
-	}
-	return write_to_ec(reg, val);
+
+	return write_to_ec(config->turbo_switch_reg, config->turbo_enable_val);
+}
+
+static int tt_toggle_disable(const struct oxp_config *config)
+{
+	if (!test_bit(OXP_FEATURE_TURBO, &config->features))
+		return -EINVAL;
+
+	return write_to_ec(config->turbo_switch_reg, OXP_TURBO_RETURN_VAL);
 }
 
 /* Callbacks for turbo toggle attribute */
 static umode_t tt_toggle_is_visible(struct kobject *kobj,
 				    struct attribute *attr, int n)
 {
-	switch (board) {
-	case aok_zoe_a1:
-	case oxp_2:
-	case oxp_fly:
-	case oxp_mini_amd_a07:
-	case oxp_mini_amd_pro:
-	case oxp_x1:
-		return attr->mode;
-	default:
-		break;
-	}
-	return 0;
+	return attr->mode;
 }
 
 static ssize_t tt_toggle_store(struct device *dev,
 			       struct device_attribute *attr, const char *buf,
 			       size_t count)
 {
+	struct oxp_data *data = dev_get_drvdata(dev);
+	const struct oxp_config *config = data->config;
+
 	int rval;
 	bool value;
 
@@ -337,9 +379,9 @@ static ssize_t tt_toggle_store(struct device *dev,
 		return rval;
 
 	if (value) {
-		rval = tt_toggle_enable();
+		rval = tt_toggle_enable(config);
 	} else {
-		rval = tt_toggle_disable();
+		rval = tt_toggle_disable(config);
 	}
 	if (rval)
 		return rval;
@@ -350,28 +392,15 @@ static ssize_t tt_toggle_store(struct device *dev,
 static ssize_t tt_toggle_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
+	struct oxp_data *data = dev_get_drvdata(dev);
+	const struct oxp_config *config = data->config;
 	int retval;
-	u8 reg;
 	long val;
 
-	switch (board) {
-	case oxp_mini_amd_a07:
-		reg = OXP_MINI_TURBO_SWITCH_REG;
-		break;
-	case aok_zoe_a1:
-	case oxp_fly:
-	case oxp_mini_amd_pro:
-		reg = OXP_TURBO_SWITCH_REG;
-		break;
-	case oxp_2:
-	case oxp_x1:
-		reg = OXP_2_TURBO_SWITCH_REG;
-		break;
-	default:
+	if (!test_bit(OXP_FEATURE_TURBO, &config->features))
 		return -EINVAL;
-	}
 
-	retval = read_from_ec(reg, 1, &val);
+	retval = read_from_ec(config->turbo_switch_reg, 1, &val);
 	if (retval)
 		return retval;
 
@@ -381,55 +410,20 @@ static ssize_t tt_toggle_show(struct device *dev,
 static DEVICE_ATTR_RW(tt_toggle);
 
 /* PWM enable/disable functions */
-static int oxp_pwm_enable(void)
+static int oxp_pwm_enable(const struct oxp_config *config)
 {
-	switch (board) {
-	case orange_pi_neo:
-		return write_to_ec(ORANGEPI_SENSOR_PWM_ENABLE_REG, PWM_MODE_MANUAL);
-	case aok_zoe_a1:
-	case aya_neo_2:
-	case aya_neo_air:
-	case aya_neo_air_plus_mendo:
-	case aya_neo_air_pro:
-	case aya_neo_flip:
-	case aya_neo_geek:
-	case aya_neo_kun:
-	case oxp_2:
-	case oxp_fly:
-	case oxp_mini_amd:
-	case oxp_mini_amd_a07:
-	case oxp_mini_amd_pro:
-	case oxp_x1:
-		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_MANUAL);
-	default:
-		return -EINVAL;
-	}
+	if (test_bit(OXP_FEATURE_PWM, &config->features))
+		return write_to_ec(config->sensor_pwm_enable_reg, PWM_MODE_MANUAL);
+
+	return -EINVAL;
 }
 
-static int oxp_pwm_disable(void)
+static int oxp_pwm_disable(const struct oxp_config *config)
 {
-	switch (board) {
-	case orange_pi_neo:
-		return write_to_ec(ORANGEPI_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
-	case aok_zoe_a1:
-	case aya_neo_2:
-	case aya_neo_air:
-	case aya_neo_air_1s:
-	case aya_neo_air_plus_mendo:
-	case aya_neo_air_pro:
-	case aya_neo_flip:
-	case aya_neo_geek:
-	case aya_neo_kun:
-	case oxp_2:
-	case oxp_fly:
-	case oxp_mini_amd:
-	case oxp_mini_amd_a07:
-	case oxp_mini_amd_pro:
-	case oxp_x1:
-		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
-	default:
-		return -EINVAL;
-	}
+	if (test_bit(OXP_FEATURE_PWM, &config->features))
+		return write_to_ec(config->sensor_pwm_enable_reg, PWM_MODE_AUTO);
+
+	return -EINVAL;
 }
 
 /* Callbacks for hwmon interface */
@@ -449,108 +443,33 @@ static umode_t oxp_ec_hwmon_is_visible(const void *drvdata,
 static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
 			     u32 attr, int channel, long *val)
 {
-	int ret;
+	struct oxp_data *data = dev_get_drvdata(dev);
+	const struct oxp_config *config = data->config;
 
 	switch (type) {
 	case hwmon_fan:
-		switch (attr) {
-		case hwmon_fan_input:
-			switch (board) {
-			case orange_pi_neo:
-				return read_from_ec(ORANGEPI_SENSOR_FAN_REG, 2, val);
-			case oxp_2:
-			case oxp_x1:
-				return read_from_ec(OXP_2_SENSOR_FAN_REG, 2, val);
-			case aok_zoe_a1:
-			case aya_neo_2:
-			case aya_neo_air:
-			case aya_neo_air_1s:
-			case aya_neo_air_plus_mendo:
-			case aya_neo_air_pro:
-			case aya_neo_flip:
-			case aya_neo_geek:
-			case aya_neo_kun:
-			case oxp_fly:
-			case oxp_mini_amd:
-			case oxp_mini_amd_a07:
-			case oxp_mini_amd_pro:
-				return read_from_ec(OXP_SENSOR_FAN_REG, 2, val);
-			default:
-				break;
-			}
-			break;
-		default:
-			break;
-		}
+		if (attr == hwmon_fan_input && test_bit(OXP_FEATURE_SENSOR_FAN, &config->features))
+			return read_from_ec(config->sensor_fan_reg, 2, val);
 		break;
 	case hwmon_pwm:
 		switch (attr) {
 		case hwmon_pwm_input:
-			switch (board) {
-			case orange_pi_neo:
-				ret = read_from_ec(ORANGEPI_SENSOR_PWM_REG, 1, val);
-				if (ret)
-					return ret;
-				/* scale from range [1-244] */
-				*val = ((*val - 1) * 254 / 243) + 1;
-				break;
-			case oxp_2:
-			case oxp_x1:
-				ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
-				if (ret)
-					return ret;
-				/* scale from range [0-184] */
-				*val = (*val * 255) / 184;
-				break;
-			case aya_neo_2:
-			case aya_neo_air:
-			case aya_neo_air_1s:
-			case aya_neo_air_plus_mendo:
-			case aya_neo_air_pro:
-			case aya_neo_flip:
-			case aya_neo_geek:
-			case aya_neo_kun:
-			case oxp_mini_amd:
-			case oxp_mini_amd_a07:
-				ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
-				if (ret)
-					return ret;
-				/* scale from range [0-100] */
-				*val = (*val * 255) / 100;
-				break;
-			case aok_zoe_a1:
-			case oxp_fly:
-			case oxp_mini_amd_pro:
-			default:
-				ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
+			if (test_bit(OXP_FEATURE_PWM, &config->features)) {
+				int ret;
+				long tmp;
+
+				ret = read_from_ec(config->sensor_pwm_reg, 1, &tmp);
 				if (ret)
 					return ret;
-				break;
+
+				*val = rescale_sensor_pwm_to_user(config, tmp);
+
+				return 0;
 			}
-			return 0;
+			break;
 		case hwmon_pwm_enable:
-			switch (board) {
-			case orange_pi_neo:
-				return read_from_ec(ORANGEPI_SENSOR_PWM_ENABLE_REG, 1, val);
-			case aok_zoe_a1:
-			case aya_neo_2:
-			case aya_neo_air:
-			case aya_neo_air_1s:
-			case aya_neo_air_plus_mendo:
-			case aya_neo_air_pro:
-			case aya_neo_flip:
-			case aya_neo_geek:
-			case aya_neo_kun:
-			case oxp_2:
-			case oxp_fly:
-			case oxp_mini_amd:
-			case oxp_mini_amd_a07:
-			case oxp_mini_amd_pro:
-			case oxp_x1:
-				return read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1, val);
-			default:
-				break;
-			}
+			if (test_bit(OXP_FEATURE_PWM, &config->features))
+				return read_from_ec(config->sensor_pwm_enable_reg, 1, val);
 			break;
 		default:
 			break;
@@ -559,53 +478,32 @@ static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
 	default:
 		break;
 	}
+
 	return -EOPNOTSUPP;
 }
 
 static int oxp_platform_write(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long val)
 {
+	struct oxp_data *data = dev_get_drvdata(dev);
+	const struct oxp_config *config = data->config;
+
 	switch (type) {
 	case hwmon_pwm:
 		switch (attr) {
 		case hwmon_pwm_enable:
 			if (val == 1)
-				return oxp_pwm_enable();
+				return oxp_pwm_enable(config);
 			else if (val == 0)
-				return oxp_pwm_disable();
+				return oxp_pwm_disable(config);
 			return -EINVAL;
 		case hwmon_pwm_input:
 			if (val < 0 || val > 255)
 				return -EINVAL;
-			switch (board) {
-			case orange_pi_neo:
-				/* scale to range [1-244] */
-				val = ((val - 1) * 243 / 254) + 1;
-				return write_to_ec(ORANGEPI_SENSOR_PWM_REG, val);
-			case oxp_2:
-			case oxp_x1:
-				/* scale to range [0-184] */
-				val = (val * 184) / 255;
-				return write_to_ec(OXP_SENSOR_PWM_REG, val);
-			case aya_neo_2:
-			case aya_neo_air:
-			case aya_neo_air_1s:
-			case aya_neo_air_plus_mendo:
-			case aya_neo_air_pro:
-			case aya_neo_flip:
-			case aya_neo_geek:
-			case aya_neo_kun:
-			case oxp_mini_amd:
-			case oxp_mini_amd_a07:
-				/* scale to range [0-100] */
-				val = (val * 100) / 255;
-				return write_to_ec(OXP_SENSOR_PWM_REG, val);
-			case aok_zoe_a1:
-			case oxp_fly:
-			case oxp_mini_amd_pro:
-				return write_to_ec(OXP_SENSOR_PWM_REG, val);
-			default:
-				break;
+			if (test_bit(OXP_FEATURE_PWM, &config->features)) {
+				const long hw_val = rescale_sensor_pwm_to_hw(config, val);
+
+				return write_to_ec(config->sensor_pwm_reg, hw_val);
 			}
 			break;
 		default:
@@ -657,12 +555,43 @@ static const struct hwmon_chip_info oxp_ec_chip_info = {
 static int oxp_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device *hwdev;
+	struct oxp_data *data;
 
-	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", NULL,
-						     &oxp_ec_chip_info, NULL);
+	const struct dmi_system_id *dmi_entry;
+	const struct oxp_config *config;
 
-	return PTR_ERR_OR_ZERO(hwdev);
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	dmi_entry = dmi_first_match(dmi_table);
+	if (!dmi_entry)
+		return -ENODEV;
+
+	config = dmi_entry->driver_data;
+
+	/*
+	 * Have to check for AMD processor here because DMI strings are the same
+	 * between Intel and AMD boards on older OneXPlayer devices, the only way
+	 * to tell them apart is the CPU. Old Intel boards have an unsupported EC.
+	 */
+	if (test_bit(OXP_FEATURE_ONLY_AMD, &config->features) &&
+	    boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return -ENODEV;
+
+	/* If we lack the turbo feature, don't expose the turbo toggle attribute. */
+	if (!test_bit(OXP_FEATURE_TURBO, &config->features))
+		dev_attr_tt_toggle.attr.mode = 0;
+
+	data->config = config;
+	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, "oxpec", data,
+							       &oxp_ec_chip_info, NULL);
+	if (IS_ERR(data->hwmon_dev))
+		return PTR_ERR(data->hwmon_dev);
+
+	platform_set_drvdata(pdev, data);
+
+	return 0;
 }
 
 static struct platform_driver oxp_platform_driver = {
@@ -677,22 +606,6 @@ static struct platform_device *oxp_platform_device;
 
 static int __init oxp_platform_init(void)
 {
-	const struct dmi_system_id *dmi_entry;
-
-	dmi_entry = dmi_first_match(dmi_table);
-	if (!dmi_entry)
-		return -ENODEV;
-
-	board = (enum oxp_board)(unsigned long)dmi_entry->driver_data;
-
-	/*
-	 * Have to check for AMD processor here because DMI strings are the same
-	 * between Intel and AMD boards on older OneXPlayer devices, the only way
-	 * to tell them apart is the CPU. Old Intel boards have an unsupported EC.
-	 */
-	if (board == oxp_mini_amd && boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
-		return -ENODEV;
-
 	oxp_platform_device =
 		platform_create_bundle(&oxp_platform_driver,
 				       oxp_platform_probe, NULL, 0, NULL, 0);
-- 
2.45.2

