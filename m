Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC0939341B
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307878; cv=none; b=ndZe9qJoQMBKIbYp8MXoGa92SXzivQMHwb2z+fcxFI25r734Fy9+RMM/7BE2f3CUK6YPgI94s0VaYu8f1loe/HRj6sO6ibyP7w1jZv0y5hc6DlPxKWgRAqFTRfrnz39EU3IB1kqtAAVyufnlLlvg/3QTt10Z/0pho9yQfahXnKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307878; c=relaxed/simple;
	bh=HaKSx6NV65iDN09fzoWQFtP8zgGFb5cOLVHtPVcS5R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XTuM74H0EGZKxFtSAhRuvI11+62tkCBLIEv4Y3p8UW/hKLY68WfZXNNrDesnWsZ3zs1x1J7I3dmkM4pWyYXBx5nOCRBk60s3sfRxt2VsP6Av37UtVsX2ZXiSa7VdLtqfM2b6+LFD6rWU1QcqY4bv9/7T4a25wpF5LVPcJItRtmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XC64qy5l; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XC64qy5l"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81f4ba336b4so2009338b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 04:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768307875; x=1768912675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCJ3wfOiyPLlBjH6Yx10fmzb6SWvLj34yQj3s2/EvN8=;
        b=XC64qy5ljQRlbY7rRea8kmHBUPmwLZlNG72us0Kwm/mwbneVkopyofAq6hsaScKhro
         GDul+zsIcjl6YY7HTwExDb71hv3r7Y9yskaZYAu9tmwpqh5sgx6UVsO/6wDnmSIkjVd0
         Tfrejm944FFwtY80d7sRvquW/6/NmtxVrQbnoHsHKULbA5EUXPSYWvE+vYiWy4/m3Tr1
         L6T61IOYkKjiFeBscgYL2Nu1G0e34PNdSS3gDZ1Sknc4t9Pp8Lvgi6gHj8+vs7iedsWh
         t37XpU/4n57m4VKNaBWgflLeRB3XpuxiUoOfZIxoN3iEnsi8cJOeFqcT0D+nKcjETnur
         KakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307875; x=1768912675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nCJ3wfOiyPLlBjH6Yx10fmzb6SWvLj34yQj3s2/EvN8=;
        b=TMLbLD/fXYPTdKSzXQHNC2w/Ezatn3p9CC6zSnMVso8Vhg7n8kFPjtbqI8K4EYa6T1
         NER7EytouSvBc480QamKQ22FQ2QurGK6a2WRdpil209+qQiVmzzuht2vAn0AgQJ3S7u4
         i2X8Zjspz4P/RULHALxI0JyVKJ5qPTxYY+yfdoHkfDNeVz+TgVfuDNXsRbWt/zTdWG9s
         wSGoxCFZ5irk6Propcy26epUDd8/nabsaZwN3RyrYY+xu+MfyTW9/f0BmEXUgiV1EEkc
         RxsEKWUUPC3lVmzgGIG5yBENxFAvTv2uL3VyjPcIeNreX8T8RP/wRXu2H6OEnVjQ6KoM
         IWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrhc//5k6TZxZWZ5NIau7y7mBCu6RblQ++ZYraoHunroUghuAs8YW/5A3/6lehkIWaYKnCFVU6uaYdAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyt1jMFyfoGk50mb7WXmMI9C2wsq7f4rFcBYKn6jpzN4i/uAK2
	0Oqo7E7IJItt8opnywh/SMsvRIJ+cs3523EaOkySSc+gXihvVj1LY3QN+WaXQg==
X-Gm-Gg: AY/fxX5z0JcHiyQDJT8tQxEetHGJ8Tcolu6ykqamMdlo4W425Ued2E+OZq4yciUBm2m
	fZ8pbvDNhD1odrRLXrWZdlRV2D43J9q/LNiDZ7kdEB3cjzb8nn556rY5pD69DqRbOxP1vgF1Sxa
	dKVxm76qp3gDhvNGYtN0pRgDHpOcb1VI2xAWhCld37lBtrGOZ74Jn5gSq2vonGIpoxkGeNOiLG9
	WsI15ADoev0OYLzDYuvQ6amSmeVmwx7pBEO9xabjjiFQfs7XJdzZYcTsVZNqmuSDg4uzpYGyTwC
	yR6QBHrzlfdmW4I+MxAGfBr6qZHpXHyoNDwRLQC6mD28sUUsMPhAr7hKg14pCF9ocalxtPhOoK7
	mv5sodZleVaLD+3bHLWYgFQFPGO/zXpBI2Mowk4NERvYTvldkLGYXA4JdN+Jvrp6VShiC/tl2Wl
	7ld6TY3UJMWWyNdjRLyV4=
X-Google-Smtp-Source: AGHT+IFp1K2ZEyWnmebqckNT+9GMRo5kic58OuYaodTR4pDXjpCurP4xmY65f8al7xrC2Tb6clvzdA==
X-Received: by 2002:a05:6a00:6087:b0:81d:a1b1:731d with SMTP id d2e1a72fcca58-81da1c0baf1mr13732623b3a.53.1768307875265;
        Tue, 13 Jan 2026 04:37:55 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e9dd8fd8dsm11409000b3a.10.2026.01.13.04.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:37:54 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v3 2/3] platform/x86: hp-wmi: add manual fan control for Victus S models
Date: Tue, 13 Jan 2026 18:07:37 +0530
Message-ID: <20260113123738.222244-3-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113123738.222244-1-krishna.chomal108@gmail.com>
References: <20251230145053.516196-1-krishna.chomal108@gmail.com>
 <20260113123738.222244-1-krishna.chomal108@gmail.com>
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
Changes in v3:
- Fixed improper alignment of multi-line functions and if statements
- Fixed GPU fan speed calculation to use signed int to safely handle
  overflows/underflows
- Directly use rpm instead of intermediate ret in
  hp_wmi_hwmon_read/write
- Updated comments to use proper (uppercase) "PWM" terminology
- Split deeply nested pwm sanity check logic into separate statements
  for readability.
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
 1 file changed, 217 insertions(+), 46 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index fac8e227cee0..d04e53ae1803 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -15,12 +15,16 @@
 
 #include <linux/acpi.h>
 #include <linux/cleanup.h>
+#include <linux/compiler_attributes.h>
 #include <linux/dmi.h>
+#include <linux/fixp-arith.h>
 #include <linux/hwmon.h>
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
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
+				       clamp_val(rpm, 0, priv->max_rpm));
+}
+
+static inline u8 pwm_to_rpm(u8 pwm, struct hp_wmi_hwmon_priv *priv)
+{
+	return fixp_linear_interpolate(0, 0, U8_MAX, priv->max_rpm,
+				       clamp_val(pwm, 0, U8_MAX));
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
-	int ret;
-
-	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_SET_QUERY, HPWMI_GM,
-				   &fan_speed, sizeof(fan_speed), 0);
+	u8 fan_speed[2];
+	int gpu_speed, ret;
 
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
+	if (speed != HP_FAN_SPEED_AUTOMATIC) {
+		gpu_speed = speed + priv->gpu_delta;
+		fan_speed[GPU_FAN] = clamp_val(gpu_speed, 0, U8_MAX);
+	}
 
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
+	int rpm, ret;
 
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
+
+			rpm = hp_wmi_get_fan_speed_victus_s(channel);
+			if (rpm < 0)
+				return rpm;
+			*val = rpm_to_pwm(rpm / 100, priv);
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
@@ -2170,23 +2272,46 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long val)
 {
+	struct hp_wmi_hwmon_priv *priv;
+	int rpm;
+
+	priv = dev_get_drvdata(dev);
 	switch (type) {
 	case hwmon_pwm:
+		if (attr == hwmon_pwm_input) {
+			if (!is_victus_s_thermal_profile())
+				return -EOPNOTSUPP;
+			/* PWM input is invalid when not in manual mode */
+			if (priv->mode != PWM_MODE_MANUAL)
+				return -EINVAL;
+
+			/* ensure PWM input is within valid fan speeds */
+			rpm = pwm_to_rpm(val, priv);
+			rpm = clamp_val(rpm, priv->min_rpm, priv->max_rpm);
+			priv->pwm = rpm_to_pwm(rpm, priv);
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
+			rpm = hp_wmi_get_fan_speed_victus_s(channel);
+			if (rpm < 0)
+				return rpm;
+			priv->pwm = rpm_to_pwm(rpm / 100, priv);
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
@@ -2196,7 +2321,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 
 static const struct hwmon_channel_info * const info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
 	NULL
 };
 
@@ -2211,12 +2336,56 @@ static const struct hwmon_chip_info chip_info = {
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
+	    sizeof(struct victus_s_fan_table_header) +
+	    sizeof(struct victus_s_fan_table_entry) * fan_table->header.num_entries > sizeof(fan_data))
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
@@ -2224,6 +2393,8 @@ static int hp_wmi_hwmon_init(void)
 		return PTR_ERR(hwmon);
 	}
 
+	hp_wmi_apply_fan_settings(priv);
+
 	return 0;
 }
 
-- 
2.52.0

