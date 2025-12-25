Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F17322C67
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Dec 2025 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766672616; cv=none; b=PXOO24gzLKdK7ejEr4DnsAmUyguCk+tXFZgoj83wDWsNK16YxXECpw2uSPMf3Q1d8ejrGkLMGomZTwtPBd7LL8yrCRMQa3p+85AuqiQyGoGCejR2rhDjsrfsETVbEJgt8e+dq8WZ0RSA3hOCmSbC7Qb78b2Xtqdit76jR+qDk2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766672616; c=relaxed/simple;
	bh=mVPS6LkRPl+sxwDQfI689mE4Ko3BwxorlYHQVKDDTOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pghIxGjT9bN3OcyIMH+IkMLY+O3qp9wRglzecGl2V88j3vBUpUCY82v6gk8OdBoX0kpoPYqfG9O5YefKIU9zTp8AUED+0FJ/inbA7H9ea6K9cLUnLbmY9jVVf5fim5tHe1Vg1eyjIlw+XF7Ce/PM9aMbmE/YvYcyGLjirzJnPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqFoQmiR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqFoQmiR"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a1022dda33so54341155ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Dec 2025 06:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766672614; x=1767277414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XtGbvPPOEhA++1tnsjmmdjZm8y7YdqsFQGc+i7WZUg=;
        b=aqFoQmiRm9a8kF7agSMU9qGmkcBflkC7WGX4d80tkfk+jytYY/AFkZDhXhzQGJ6HWw
         UJuYVMLXMxScy/5c6IplWo/V5XqsEETr0k1ssEp4WqAQujIS8lfcIIdhoDuW5hN/1L9L
         ikY9+oumhDjcifzh9c8rDoGvnLVX5/iLzB06z5EpIwcJRfhpON2uC97CVbpqhZulMoDR
         dmsF1S2j/8cpy5tdqX0CDjtFjX5mrUHs8DTc3S2y92iIrO3os6bB7g1+m+fbw4s3Qggj
         mPVg8Xcz+gDqQcu/lIzdXdnTYg0VQd0Ul5L8wqvhSnTw3Nn2DXROjkYntvHkiSCef0x/
         KP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766672614; x=1767277414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6XtGbvPPOEhA++1tnsjmmdjZm8y7YdqsFQGc+i7WZUg=;
        b=p/iZo24hx918jFNj6CMa4xODhSM5xE4QutWF/v/NswhYMHjSRyfAktI7eVzJ2P5cnq
         5xLG02KbteJd6GCzexrukyfTZdQj1ArJIezPh5ttjeziEbT20Kox/H8syNo/hF4TytFm
         5hvljWj8hSmTCPfGWLERooQukzs2f1nBLzF1UBYPcllfa60xKOq1eVKpY19wl//FDUkt
         OAv2lkuDvCKHYk97AMUJP09hZxM2jIQ8MvGOfu7zbgNei1LQyW/0oq5I5X47phoAA4la
         kFQhckL6aDXZ5aiH7qCpMw/UFblQiCK5YiNXSFFAnFRevKcO1hJAXzOO8BFa7P5cm+47
         KB3A==
X-Forwarded-Encrypted: i=1; AJvYcCWrxrwxx7lskMJGe9JiavnUBr5pCnCg6UFeEkULem6eNKwvfcPRoKmF/wLC0wJroUoO0u+bQkpkOGfssg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6lK9k2JtNfcvSDhP9a+Gz1uD/bVVYsSNPjcgwC/B8PvtkQN9D
	NGwiA2Oa7HDh9fdUncCJPIMVuipHBq0482PyAy03M1EWk70FWdwDUue4+kRkfg==
X-Gm-Gg: AY/fxX6bWAQaYxTN/Hu417HIE2ENbr3Vt/54LUG9zhNYYpSm/65YhYPOzE9sbMlSdlA
	XqzKAH/mzaaY/cCurn4Dw/xCI2frIG494HgqJBa/ET4Jp0ULFXCMVl/9OIvtTVtcO3xNALJgwE3
	oKxlsDJBnAVWmcw/znqphteAKSd79TonMyLhcBA6xIBaG77ajav0mrimuika1U7PJBhwEfVPjCd
	L7H0dvBijdy3JX2LXy4NyxEsWy1IIXRv0R9B1I8jIAuUjbm6CQbetlsG5/aGWIERT75NXnm05qS
	lszQhu0uXIrgPzWkIXvR52yS9llE6cwzYj4OvGe7AMrkT1WqH7C7AR8De1dowBUa+Jr7VlUCuzZ
	kN9hy5D1ZwFjAX0RnACMZZ+aXNa2AzOQSiNkowxFHYV6El0eKXo+elRc5WbwpZO/JiEmH5oLh8T
	82knrbpJFBnkiPyDJ8Hewj7MUIXSnPyg==
X-Google-Smtp-Source: AGHT+IEfZuFwJNEM07LBr6PnqvkSk5drPf1sIoilREe3rc89Scyt2QFKpZoCXX/Sodddgl7xn9n3ZQ==
X-Received: by 2002:a17:902:e746:b0:2a0:d074:e9f4 with SMTP id d9443c01a7336-2a2f2c4e3dcmr207774055ad.59.1766672613689;
        Thu, 25 Dec 2025 06:23:33 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3da7dabsm180892195ad.25.2025.12.25.06.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 06:23:33 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH 1/2] platform/x86: hp-wmi: add manual fan control for Victus S models
Date: Thu, 25 Dec 2025 19:53:09 +0530
Message-ID: <20251225142310.204831-2-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225142310.204831-1-krishna.chomal108@gmail.com>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com>
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
a per-device private context and enforce "Auto" mode during driver
initialization to ensure a consistent starting point.

Tested on: HP Omen 16-wf1xxx (board ID 8C78)

Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 243 +++++++++++++++++++++++++------
 1 file changed, 199 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f4ea1ea05997..9fb956ce809a 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -30,6 +30,7 @@
 #include <linux/rfkill.h>
 #include <linux/string.h>
 #include <linux/dmi.h>
+#include <linux/fixp-arith.h>
 
 MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
 MODULE_DESCRIPTION("HP laptop WMI driver");
@@ -190,7 +191,8 @@ enum hp_wmi_gm_commandtype {
 	HPWMI_SET_GPU_THERMAL_MODES_QUERY	= 0x22,
 	HPWMI_SET_POWER_LIMITS_QUERY		= 0x29,
 	HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY	= 0x2D,
-	HPWMI_FAN_SPEED_SET_QUERY		= 0x2E,
+	HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY	= 0x2E,
+	HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY	= 0x2F,
 };
 
 enum hp_wmi_command {
@@ -348,6 +350,32 @@ static const char * const tablet_chassis_types[] = {
 
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
+#define RPM_TO_PWM(rpm, ctx) fixp_linear_interpolate(0, 0, \
+						(ctx)->max_rpm, U8_MAX, \
+						clamp_val((rpm), \
+						0, (ctx)->max_rpm))
+#define PWM_TO_RPM(pwm, ctx) fixp_linear_interpolate(0, 0, \
+						U8_MAX, (ctx)->max_rpm, \
+						clamp_val((pwm), \
+						0, U8_MAX))
+
 /* map output size to the corresponding WMI method id */
 static inline int encode_outsize_for_pvsz(int outsize)
 {
@@ -637,41 +665,55 @@ static int hp_wmi_fan_speed_max_set(int enabled)
 	return enabled;
 }
 
-static int hp_wmi_fan_speed_reset(void)
+static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *ctx, u8 speed)
 {
-	u8 fan_speed[2] = { HP_FAN_SPEED_AUTOMATIC, HP_FAN_SPEED_AUTOMATIC };
+	u8 fan_speed[2];
 	int ret;
 
-	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_SET_QUERY, HPWMI_GM,
-				   &fan_speed, sizeof(fan_speed), 0);
+	if (!ctx)
+		return -ENODEV;
 
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
+		fan_speed[GPU_FAN] = clamp_val(speed + ctx->gpu_delta, 0, U8_MAX);
 
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
+static int hp_wmi_fan_speed_reset(struct hp_wmi_hwmon_priv *ctx)
 {
-	int val = 0, ret;
+	return hp_wmi_fan_speed_set(ctx, HP_FAN_SPEED_AUTOMATIC);
+}
 
-	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
-				   &val, zero_if_sup(val), sizeof(val));
+static int hp_wmi_fan_speed_max_reset(struct hp_wmi_hwmon_priv *ctx)
+{
+	int ret;
 
+	ret = hp_wmi_fan_speed_max_set(0);
 	if (ret)
-		return ret < 0 ? ret : -EINVAL;
+		return ret;
 
-	return val;
+	/* Disabling max fan speed on Victus s1xxx laptops needs a 2nd step: */
+	ret = hp_wmi_fan_speed_reset(ctx);
+	return ret;
 }
 
 static int __init hp_wmi_bios_2008_later(void)
@@ -2108,12 +2150,43 @@ static struct platform_driver hp_wmi_driver __refdata = {
 	.remove = __exit_p(hp_wmi_bios_remove),
 };
 
+static int hp_wmi_hwmon_enforce_ctx(struct hp_wmi_hwmon_priv *ctx)
+{
+	if (!ctx)
+		return -ENODEV;
+
+	switch (ctx->mode) {
+	case PWM_MODE_MAX:
+		if (is_victus_s_thermal_profile())
+			hp_wmi_get_fan_count_userdefine_trigger();
+		return hp_wmi_fan_speed_max_set(1);
+	case PWM_MODE_MANUAL:
+		if (!is_victus_s_thermal_profile())
+			return -EOPNOTSUPP;
+		return hp_wmi_fan_speed_set(ctx, PWM_TO_RPM(ctx->pwm, ctx));
+	case PWM_MODE_AUTO:
+		if (is_victus_s_thermal_profile()) {
+			hp_wmi_get_fan_count_userdefine_trigger();
+			return hp_wmi_fan_speed_max_reset(ctx);
+		} else {
+			return hp_wmi_fan_speed_max_set(0);
+		}
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
+			return 0; /* Hide PWM input if not Victus S */
 		return 0644;
 	case hwmon_fan:
 		if (is_victus_s_thermal_profile()) {
@@ -2134,7 +2207,12 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
 static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			     u32 attr, int channel, long *val)
 {
-	int ret;
+	struct hp_wmi_hwmon_priv *ctx;
+	int current_rpm, ret;
+
+	ctx = dev_get_drvdata(dev);
+	if (!ctx)
+		return -ENODEV;
 
 	switch (type) {
 	case hwmon_fan:
@@ -2147,16 +2225,21 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
+			*val = RPM_TO_PWM(current_rpm / 100, ctx);
 			return 0;
-		case 1:
-			/* 1 is max fan, which is 0
-			 * (no fan speed control) for hwmon
-			 */
-			*val = 0;
+		}
+		switch (ctx->mode) {
+		case PWM_MODE_MAX:
+		case PWM_MODE_MANUAL:
+		case PWM_MODE_AUTO:
+			*val = ctx->mode;
 			return 0;
 		default:
 			/* shouldn't happen */
@@ -2170,23 +2253,50 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long val)
 {
+	struct hp_wmi_hwmon_priv *ctx;
+	int current_rpm, ret;
+
+	ctx = dev_get_drvdata(dev);
+	if (!ctx)
+		return -ENODEV;
+
 	switch (type) {
 	case hwmon_pwm:
+		if (attr == hwmon_pwm_input) {
+			if (!is_victus_s_thermal_profile())
+				return -EOPNOTSUPP;
+			/* pwm input is invalid when not in manual mode */
+			if (ctx->mode != PWM_MODE_MANUAL)
+				return -EINVAL;
+			/* ensure pwm input is within valid fan speeds */
+			ctx->pwm = RPM_TO_PWM(clamp_val(PWM_TO_RPM(val, ctx),
+							ctx->min_rpm,
+							ctx->max_rpm),
+						ctx);
+			return hp_wmi_hwmon_enforce_ctx(ctx);
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
+			ctx->mode = PWM_MODE_MAX;
+			return hp_wmi_hwmon_enforce_ctx(ctx);
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
+			ctx->pwm = RPM_TO_PWM(current_rpm / 100, ctx);
+			ctx->mode = PWM_MODE_MANUAL;
+			return hp_wmi_hwmon_enforce_ctx(ctx);
+		case PWM_MODE_AUTO:
+			ctx->mode = PWM_MODE_AUTO;
+			return hp_wmi_hwmon_enforce_ctx(ctx);
 		default:
-			/* we don't support manual fan speed control */
 			return -EINVAL;
 		}
 	default:
@@ -2196,7 +2306,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 
 static const struct hwmon_channel_info * const info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
 	NULL
 };
 
@@ -2211,12 +2321,55 @@ static const struct hwmon_chip_info chip_info = {
 	.info = info,
 };
 
+static int hp_wmi_hwmon_setup_ctx(struct hp_wmi_hwmon_priv *ctx)
+{
+	u8 fan_data[128];
+	u8 (*fan_table)[3];
+	u8 rows, min_rpm, max_rpm, gpu_delta;
+	int ret;
+
+	/* Default behaviour on hwmon init is automatic mode */
+	ctx->mode = PWM_MODE_AUTO;
+
+	/* Bypass all non-Victus S devices */
+	if (!is_victus_s_thermal_profile())
+		return 0;
+
+	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY,
+				   HPWMI_GM, &fan_data, 4, sizeof(fan_data));
+	if (ret != 0)
+		return ret;
+
+	rows = fan_data[1];
+	if (2 + rows * 3 >= sizeof(fan_data))
+		return -EINVAL;
+
+	fan_table = (u8 (*)[3]) & fan_data[2];
+	min_rpm = fan_table[0][CPU_FAN];
+	max_rpm = fan_table[rows - 1][CPU_FAN];
+	gpu_delta = fan_table[0][GPU_FAN] - fan_table[0][CPU_FAN];
+	ctx->min_rpm = min_rpm;
+	ctx->max_rpm = max_rpm;
+	ctx->gpu_delta = gpu_delta;
+
+	return 0;
+}
+
 static int hp_wmi_hwmon_init(void)
 {
 	struct device *dev = &hp_wmi_platform_dev->dev;
+	struct hp_wmi_hwmon_priv *ctx;
 	struct device *hwmon;
+	int ret;
 
-	hwmon = devm_hwmon_device_register_with_info(dev, "hp", &hp_wmi_driver,
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ret = hp_wmi_hwmon_setup_ctx(ctx);
+	if (ret != 0)
+		return ret;
+	hwmon = devm_hwmon_device_register_with_info(dev, "hp", ctx,
 						     &chip_info, NULL);
 
 	if (IS_ERR(hwmon)) {
@@ -2224,6 +2377,8 @@ static int hp_wmi_hwmon_init(void)
 		return PTR_ERR(hwmon);
 	}
 
+	hp_wmi_hwmon_enforce_ctx(ctx);
+
 	return 0;
 }
 
-- 
2.52.0

