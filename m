Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DD231813A
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Dec 2025 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767106277; cv=none; b=rsONjhiJwsvotwBHpzbYOIK8jGRC45abpluGswZir3ICTlFQZiMC+xeMHkkDQS8QxzUo+9/2s1QloPNfNOPiIjqmGRuuOlBMdQo8xor0UaDn23gAbnrwPEgNyNTc4K4fd/RIYnslVZySSheX96oHrOS7wJcQTlVMluIOva/J3es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767106277; c=relaxed/simple;
	bh=Q/yYXm0G3YL70J74hMdrWYHiYE7HMiCZrgDZEzA83Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=loF0l6KKsh5b5jJJZ0WlcJC2tdLw/7ARrXP86u5bVR8oZDxHpNsuzahYQqTQmnmPXmpxSAp5apJ8brWeBjsmAoAUKRu29vN3j1WKUPyX8kRyi8dvI+24CIJoaa0pzguKnIeRFjWXKF/PKwAu/VylK9cWlQkK3kqbYz6qBeC8nJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPEXrPvQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPEXrPvQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a07fac8aa1so107409705ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Dec 2025 06:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767106274; x=1767711074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKWUhpb9A+qYTHQbroFo6Yk396vrwSG6LpfcLMrzWnI=;
        b=bPEXrPvQF0coJiei+lJ60LfTbrYdySkzgqj2ocGkZSesalQSOTJig/OhuT6EukNByB
         rm71IMFJFh+762xVmRP1boR5VcqpApgX4LHE41JuFAPKBDDaes4QFqjBXeFsJgESYXJN
         Is0C7Cxrm+MqjuTq0QQfQ3EYiyVTo64Mabv260IE7SiopQuwByUDoA4K/J++H1xyApKh
         d7p6Vu7XQglOSjgcdmiQPh8/R802LGYdKTwovy6q2NUjroq+8p19t3UGhwLTQZt8W4vV
         YKnLDjyomP7wRRLayWOk43HRm6q6WGo1c7DbESdL7Ebwh099rfLeB1rwGti2+1kD6uxn
         EZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767106274; x=1767711074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VKWUhpb9A+qYTHQbroFo6Yk396vrwSG6LpfcLMrzWnI=;
        b=MTCPG1Mxgb93Va1shTS/BJBpoJXJEdrrH6Ef+xAaRHxZpa5zM0N+8mqz/fLl2XXRBC
         XNLe2mrv4yYVxbplQS3NWXjfti/FOKUplEqyjh4wOi1qZF9jZsM/aThZ9qqOxF225qhh
         /BH44PCfBY0dyrwP528MlrB63ChGQX56LxkcVVIF1c2XxwEg3eyD4bHRpyiGkGbVfPA+
         GJUlv485/tkCSOc5YHid/x+XUK3CBbRL63QL9thEFWc+nE6pL1026HbI9l1ZqzyZp+SI
         1faCaH1mWzToG82I3TRb4xPHPfbWFK8Y538yPa7s61C141cxOu67dIYTsg/qBguqLs/d
         RmLA==
X-Forwarded-Encrypted: i=1; AJvYcCWclUdYBkwSWd7HS0Llnb5WlBxF7MyruO5bc+FhOE3d4hQWp98DCXpmWu4rvBbZ0pWYuJ+cpjk07lZQtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTcoO4JPIPyeprfB0cAty9lbGoCiiNNFn41wqabw8pNSROLWf5
	XGck5eES9lVEzvkro7GdyWRXhkcmd9WNmP28FMKA4Sc+rrZLzl4U0Q8o
X-Gm-Gg: AY/fxX769f+T+nRt79MeqD2Mg31lkZby6TnOhhd477PSCmPnyKysFfiMMVTY9N8RWfq
	TJs4jIIq0tIKCYIsDn09Fv0jJCmMDc31bvde3io9oz93iDq+etY00RJdr6dUkjMbTyhKROJouok
	FXbfc8XG1kKLxQtXd8NHQZ93+/86dze0jlVy0RiRvIaXeI2Hxjwo3tpez4uNgwsq6ya8qLi+72+
	DLO7HoD/6k4DdDERXIfAFu9dRsYHb+E1fSqmX3Mz7SR//4qa0qHQpWGXviUhEWUSf7myQLBsX+p
	Hj9rB0E0ultyg6rotZll0Dk2ISX6tFdzoFNKVRh28oIsd2J5x5gxdCFJA4SYjRqXpnPcGPOyal0
	eYc31DE7Or5Yt9XRHclD4MhhN+cvvWltG/kUpHiXf0xFGxzdD13MD/DuWJEQxzZqNuplZJphREI
	6FSnY5nkU2t+tN/wWDIP8=
X-Google-Smtp-Source: AGHT+IG0VbiBPFJk+NgXM9TTIabakFUAvQgY7BPNIEnncnf0aTtCX/29ck1/GOWjzXo+aJfmf3MVig==
X-Received: by 2002:a17:903:19f0:b0:2a0:a92c:2cb6 with SMTP id d9443c01a7336-2a2f2732647mr356743915ad.36.1767106274117;
        Tue, 30 Dec 2025 06:51:14 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d86esm301257245ad.74.2025.12.30.06.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:51:13 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v2 1/2] platform/x86: hp-wmi: add manual fan control for Victus S models
Date: Tue, 30 Dec 2025 20:20:52 +0530
Message-ID: <20251230145053.516196-2-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230145053.516196-1-krishna.chomal108@gmail.com>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com>
 <20251230145053.516196-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add manual fan speed control and PWM reporting for HP Victus S-series
laptops.

While HPWMI_FAN_SPEED_SET_QUERY was previously added to reset max fan
mode, it is actually capable of individual fan control. This patch
implements hp_wmi_fan_speed_set() to allow manual control and hides
PWM inputs for non-Victus devices as the query is Victus specific.

The existing hp_wmi_fan_speed_max_get() query is unreliable on Victus S
firmware, often incorrectly reporting "Auto" mode even when "Max" is
active. To resolve this synchronization issue, move state tracking to
a per-device private context and apply "Auto" mode during driver
initialization to ensure a consistent starting point.

Refactor hp_wmi_apply_fan_settings() to use an intermediate ret
variable. This prepares the switch block for keep-alive logic being
added in a later patch, avoiding the need for duplicated mode check.

Tested on: HP Omen 16-wf1xxx (board ID 8C78)

Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
Changes in v2:
- Added limits.h and minmax.h headers
- Re-written pwm-to-rpm (and vice-versa) conversion from macros to
  static inline functions
- Removed redundant NULL checking of drvdata
- Made integer promotion explicit by casting intermediate result to
  unsigned int when calculating the GPU fan speed
- Renamed "enforce_ctx" to "apply_fan_settings" for clarity
- Removed unnecessary comments
- Renamed "ctx" to "priv" as it is more consistent for drvdata
- Added new struct victus_s_fan_table to avoid complex type casting
---
 drivers/platform/x86/hp/hp-wmi.c | 263 +++++++++++++++++++++++++------
 1 file changed, 218 insertions(+), 45 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f4ea1ea05997..ef419575174c 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -30,6 +30,10 @@
 #include <linux/rfkill.h>
 #include <linux/string.h>
 #include <linux/dmi.h>
+#include <linux/fixp-arith.h>
+#include <linux/limits.h>
+#include <linux/minmax.h>
+#include <linux/compiler_attributes.h>
 
 MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
 MODULE_DESCRIPTION("HP laptop WMI driver");
@@ -190,7 +194,8 @@ enum hp_wmi_gm_commandtype {
 	HPWMI_SET_GPU_THERMAL_MODES_QUERY	= 0x22,
 	HPWMI_SET_POWER_LIMITS_QUERY		= 0x29,
 	HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY	= 0x2D,
-	HPWMI_FAN_SPEED_SET_QUERY		= 0x2E,
+	HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY	= 0x2E,
+	HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY	= 0x2F,
 };
 
 enum hp_wmi_command {
@@ -348,6 +353,51 @@ static const char * const tablet_chassis_types[] = {
 
 #define DEVICE_MODE_TABLET	0x06
 
+#define CPU_FAN 0
+#define GPU_FAN 1
+
+enum pwm_modes {
+	PWM_MODE_MAX		= 0,
+	PWM_MODE_MANUAL		= 1,
+	PWM_MODE_AUTO		= 2,
+};
+
+struct hp_wmi_hwmon_priv {
+	u8 min_rpm;
+	u8 max_rpm;
+	u8 gpu_delta;
+	u8 mode;
+	u8 pwm;
+};
+
+struct victus_s_fan_table_header {
+	u8 unknown;
+	u8 num_entries;
+} __packed;
+
+struct victus_s_fan_table_entry {
+	u8 cpu_rpm;
+	u8 gpu_rpm;
+	u8 unknown;
+} __packed;
+
+struct victus_s_fan_table {
+	struct victus_s_fan_table_header header;
+	struct victus_s_fan_table_entry entries[];
+} __packed;
+
+static inline u8 rpm_to_pwm(u8 rpm, struct hp_wmi_hwmon_priv *priv)
+{
+	return fixp_linear_interpolate(0, 0, priv->max_rpm, U8_MAX,
+					clamp_val(rpm, 0, priv->max_rpm));
+}
+
+static inline u8 pwm_to_rpm(u8 pwm, struct hp_wmi_hwmon_priv *priv)
+{
+	return fixp_linear_interpolate(0, 0, U8_MAX, priv->max_rpm,
+					clamp_val(pwm, 0, U8_MAX));
+}
+
 /* map output size to the corresponding WMI method id */
 static inline int encode_outsize_for_pvsz(int outsize)
 {
@@ -637,41 +687,53 @@ static int hp_wmi_fan_speed_max_set(int enabled)
 	return enabled;
 }
 
-static int hp_wmi_fan_speed_reset(void)
+static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8 speed)
 {
-	u8 fan_speed[2] = { HP_FAN_SPEED_AUTOMATIC, HP_FAN_SPEED_AUTOMATIC };
+	u8 fan_speed[2];
 	int ret;
 
-	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_SET_QUERY, HPWMI_GM,
-				   &fan_speed, sizeof(fan_speed), 0);
-
-	return ret;
-}
+	fan_speed[CPU_FAN] = speed;
+	fan_speed[GPU_FAN] = speed;
 
-static int hp_wmi_fan_speed_max_reset(void)
-{
-	int ret;
+	/*
+	 * GPU fan speed is always a little higher than CPU fan speed, we fetch
+	 * this delta value from the fan table during hwmon init.
+	 * Exception: Speed is set to HP_FAN_SPEED_AUTOMATIC, to revert to
+	 * automatic mode.
+	 */
+	if (speed != HP_FAN_SPEED_AUTOMATIC)
+		fan_speed[GPU_FAN] = clamp_val((unsigned int)speed +
+						(unsigned int)priv->gpu_delta,
+						0, U8_MAX);
 
+	ret = hp_wmi_get_fan_count_userdefine_trigger();
+	if (ret < 0)
+		return ret;
+	/* Max fans need to be explicitly disabled */
 	ret = hp_wmi_fan_speed_max_set(0);
-	if (ret)
+	if (ret < 0)
 		return ret;
+	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY, HPWMI_GM,
+				   &fan_speed, sizeof(fan_speed), 0);
 
-	/* Disabling max fan speed on Victus s1xxx laptops needs a 2nd step: */
-	ret = hp_wmi_fan_speed_reset();
 	return ret;
 }
 
-static int hp_wmi_fan_speed_max_get(void)
+static int hp_wmi_fan_speed_reset(struct hp_wmi_hwmon_priv *priv)
 {
-	int val = 0, ret;
+	return hp_wmi_fan_speed_set(priv, HP_FAN_SPEED_AUTOMATIC);
+}
 
-	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
-				   &val, zero_if_sup(val), sizeof(val));
+static int hp_wmi_fan_speed_max_reset(struct hp_wmi_hwmon_priv *priv)
+{
+	int ret;
 
+	ret = hp_wmi_fan_speed_max_set(0);
 	if (ret)
-		return ret < 0 ? ret : -EINVAL;
+		return ret;
 
-	return val;
+	/* Disabling max fan speed on Victus s1xxx laptops needs a 2nd step: */
+	return hp_wmi_fan_speed_reset(priv);
 }
 
 static int __init hp_wmi_bios_2008_later(void)
@@ -2108,12 +2170,45 @@ static struct platform_driver hp_wmi_driver __refdata = {
 	.remove = __exit_p(hp_wmi_bios_remove),
 };
 
+static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
+{
+	int ret;
+
+	switch (priv->mode) {
+	case PWM_MODE_MAX:
+		if (is_victus_s_thermal_profile())
+			hp_wmi_get_fan_count_userdefine_trigger();
+		ret = hp_wmi_fan_speed_max_set(1);
+		return ret;
+	case PWM_MODE_MANUAL:
+		if (!is_victus_s_thermal_profile())
+			return -EOPNOTSUPP;
+		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
+		return ret;
+	case PWM_MODE_AUTO:
+		if (is_victus_s_thermal_profile()) {
+			hp_wmi_get_fan_count_userdefine_trigger();
+			ret = hp_wmi_fan_speed_max_reset(priv);
+		} else {
+			ret = hp_wmi_fan_speed_max_set(0);
+		}
+		return ret;
+	default:
+		/* shouldn't happen */
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static umode_t hp_wmi_hwmon_is_visible(const void *data,
 				       enum hwmon_sensor_types type,
 				       u32 attr, int channel)
 {
 	switch (type) {
 	case hwmon_pwm:
+		if (attr == hwmon_pwm_input && !is_victus_s_thermal_profile())
+			return 0;
 		return 0644;
 	case hwmon_fan:
 		if (is_victus_s_thermal_profile()) {
@@ -2134,8 +2229,10 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
 static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			     u32 attr, int channel, long *val)
 {
-	int ret;
+	struct hp_wmi_hwmon_priv *priv;
+	int current_rpm, ret;
 
+	priv = dev_get_drvdata(dev);
 	switch (type) {
 	case hwmon_fan:
 		if (is_victus_s_thermal_profile())
@@ -2147,16 +2244,21 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 		*val = ret;
 		return 0;
 	case hwmon_pwm:
-		switch (hp_wmi_fan_speed_max_get()) {
-		case 0:
-			/* 0 is automatic fan, which is 2 for hwmon */
-			*val = 2;
+		if (attr == hwmon_pwm_input) {
+			if (!is_victus_s_thermal_profile())
+				return -EOPNOTSUPP;
+			ret = hp_wmi_get_fan_speed_victus_s(channel);
+			if (ret < 0)
+				return ret;
+			current_rpm = ret;
+			*val = rpm_to_pwm(current_rpm / 100, priv);
 			return 0;
-		case 1:
-			/* 1 is max fan, which is 0
-			 * (no fan speed control) for hwmon
-			 */
-			*val = 0;
+		}
+		switch (priv->mode) {
+		case PWM_MODE_MAX:
+		case PWM_MODE_MANUAL:
+		case PWM_MODE_AUTO:
+			*val = priv->mode;
 			return 0;
 		default:
 			/* shouldn't happen */
@@ -2170,23 +2272,47 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long val)
 {
+	struct hp_wmi_hwmon_priv *priv;
+	int current_rpm, ret;
+
+	priv = dev_get_drvdata(dev);
 	switch (type) {
 	case hwmon_pwm:
+		if (attr == hwmon_pwm_input) {
+			if (!is_victus_s_thermal_profile())
+				return -EOPNOTSUPP;
+			/* pwm input is invalid when not in manual mode */
+			if (priv->mode != PWM_MODE_MANUAL)
+				return -EINVAL;
+			/* ensure pwm input is within valid fan speeds */
+			priv->pwm = rpm_to_pwm(clamp_val(pwm_to_rpm(val, priv),
+							priv->min_rpm,
+							priv->max_rpm),
+						priv);
+			return hp_wmi_apply_fan_settings(priv);
+		}
 		switch (val) {
-		case 0:
-			if (is_victus_s_thermal_profile())
-				hp_wmi_get_fan_count_userdefine_trigger();
-			/* 0 is no fan speed control (max), which is 1 for us */
-			return hp_wmi_fan_speed_max_set(1);
-		case 2:
-			/* 2 is automatic speed control, which is 0 for us */
-			if (is_victus_s_thermal_profile()) {
-				hp_wmi_get_fan_count_userdefine_trigger();
-				return hp_wmi_fan_speed_max_reset();
-			} else
-				return hp_wmi_fan_speed_max_set(0);
+		case PWM_MODE_MAX:
+			priv->mode = PWM_MODE_MAX;
+			return hp_wmi_apply_fan_settings(priv);
+		case PWM_MODE_MANUAL:
+			if (!is_victus_s_thermal_profile())
+				return -EOPNOTSUPP;
+			/*
+			 * When switching to manual mode, set fan speed to
+			 * current RPM values to ensure a smooth transition.
+			 */
+			ret = hp_wmi_get_fan_speed_victus_s(channel);
+			if (ret < 0)
+				return ret;
+			current_rpm = ret;
+			priv->pwm = rpm_to_pwm(current_rpm / 100, priv);
+			priv->mode = PWM_MODE_MANUAL;
+			return hp_wmi_apply_fan_settings(priv);
+		case PWM_MODE_AUTO:
+			priv->mode = PWM_MODE_AUTO;
+			return hp_wmi_apply_fan_settings(priv);
 		default:
-			/* we don't support manual fan speed control */
 			return -EINVAL;
 		}
 	default:
@@ -2196,7 +2322,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 
 static const struct hwmon_channel_info * const info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
 	NULL
 };
 
@@ -2211,12 +2337,57 @@ static const struct hwmon_chip_info chip_info = {
 	.info = info,
 };
 
+static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
+{
+	u8 fan_data[128] = { 0 };
+	struct victus_s_fan_table *fan_table;
+	u8 min_rpm, max_rpm, gpu_delta;
+	int ret;
+
+	/* Default behaviour on hwmon init is automatic mode */
+	priv->mode = PWM_MODE_AUTO;
+
+	/* Bypass all non-Victus S devices */
+	if (!is_victus_s_thermal_profile())
+		return 0;
+
+	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY,
+				   HPWMI_GM, &fan_data, 4, sizeof(fan_data));
+	if (ret)
+		return ret;
+
+	fan_table = (struct victus_s_fan_table *)fan_data;
+	if (fan_table->header.num_entries == 0 ||
+		sizeof(struct victus_s_fan_table_header) +
+		sizeof(struct victus_s_fan_table_entry) * fan_table->header.num_entries >
+		sizeof(fan_data))
+		return -EINVAL;
+
+	min_rpm = fan_table->entries[0].cpu_rpm;
+	max_rpm = fan_table->entries[fan_table->header.num_entries - 1].cpu_rpm;
+	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
+	priv->min_rpm = min_rpm;
+	priv->max_rpm = max_rpm;
+	priv->gpu_delta = gpu_delta;
+
+	return 0;
+}
+
 static int hp_wmi_hwmon_init(void)
 {
 	struct device *dev = &hp_wmi_platform_dev->dev;
+	struct hp_wmi_hwmon_priv *priv;
 	struct device *hwmon;
+	int ret;
 
-	hwmon = devm_hwmon_device_register_with_info(dev, "hp", &hp_wmi_driver,
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret = hp_wmi_setup_fan_settings(priv);
+	if (ret)
+		return ret;
+	hwmon = devm_hwmon_device_register_with_info(dev, "hp", priv,
 						     &chip_info, NULL);
 
 	if (IS_ERR(hwmon)) {
@@ -2224,6 +2395,8 @@ static int hp_wmi_hwmon_init(void)
 		return PTR_ERR(hwmon);
 	}
 
+	hp_wmi_apply_fan_settings(priv);
+
 	return 0;
 }
 
-- 
2.52.0

