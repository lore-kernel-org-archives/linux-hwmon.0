Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A025C38FF1A
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307884; cv=none; b=DbDhvEFIFa4CksyZ3E3tohUuA5Cbw5cURD3uw0R7gSmHapZ80iK9VPW2bM+UKWV2LOgiM1wDoJ7x8n+VwzT3TP0eQhtR9G7LmZJbYdyN8YiQDiSva1JQpqUTCRCEWaAks5MTl/Z6cCQiWsmsYZCUrzZNi4/HK2UiDzGGwqf7sKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307884; c=relaxed/simple;
	bh=CCULviIUt1z9O4zm0Y/tKUyP/DMbEeojREOXeyucv0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fD/82Zuh2Rb5OPgN8hcgHwdQjTeT3dootT66AL2bN85qX+xifecBFcnwV1qk8hLeV61c9b66E7egludzdwk0uZEbSSy82AUaQBjnORbiaXwrzl/xv2yCk7iVLX8kokYRJKDZK8u5n8/QxoAiLv7mob0evYiaFpZl98bhxZwP99I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjAF6B46; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjAF6B46"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f3b4ae67bso1573002b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 04:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768307880; x=1768912680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KgPNZ1+hiG4bP2a4hNVRlEnc7lnvw26sruTYHkKl3A=;
        b=TjAF6B46C1880MRmAKko5tS55L1chEmPHhJ2d5ObRAw6+1tmQZM5Z8aMnBXN9GaU32
         wqP7DWJ0NYNfPyaMqvhKYQtLzklElcrshJHU6Cal4Lki5dOyBKGAdCPi2IUjIdy71bUj
         TLne4nfC4SnF3rg9UC1Nn+fxPzGDT+Ru12+7TgcoQHK1GkIxz8LU1rS47dfIh4Gongw4
         NZe3KmEhFA5oSccgvX3sGeL/N3Sh8jcx6bHtErJCVnVtwzO2ftvVt+VZ1y446XAyryEx
         3PAP5rlUnQ+8AI8ga8ry3WlS7Wlp0+ahgxQ1LkPkqBmZT24uYqrR+T2G/KpfrqNdXF+b
         6NZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307880; x=1768912680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2KgPNZ1+hiG4bP2a4hNVRlEnc7lnvw26sruTYHkKl3A=;
        b=expo88a1PNzJqu8SavrsYRWetQCTmPUaSap1u6hpDdRgKPMZlXvpSOjUu5pAPuZ3Qu
         1gtdpsLi1ImRiCjfT3WleYLXUtglyUJM5SBzQuXKzGMCQe6DOPS7QoGybshMOJQT8Szq
         rthEkwSbALnU/5XTZQBVtqmii91RsiscJ80hBtO9BJE9uo3JJVjpAZWVmJILvLqGCpUw
         nR6tnhOgta5uVIFi/L9LRFbP0nQTbEpV6X5iE1NdFfQ7WE95PxlP7q9fFQ36/WRJ7MZi
         0VNbR/uAHIRZJ+7I+Cf8oRPIN1Nj9Cn4dFHHNSvQONhEksvzEvt/GX9N5GWTJXB7CPuj
         wlFw==
X-Forwarded-Encrypted: i=1; AJvYcCXHnjMG+/TI0GE1+h86g2UhCQJpcQyMZ/3pW1NS76nWoyGtyuN4odjLbA2HPM//8LvmazX4hcsmLMfLcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJK9CshGOq+RO+qnR73aEKBHoIXqTJhQiVnlQ3PA5UzS0EDulA
	5ZwDcUtV7tIPOd/U/bqtAY9zv2xFbirTL+sVcNYETYqy9CSv5uXcJS1HM2Qy3w==
X-Gm-Gg: AY/fxX7OB2opDwfwsqnMwk+H6tl/W7akOH/A0XEygq9GRua5nwJUeEo+y7Ej0idEq+U
	wOztroiQ96qsq0cpXU8RyQwrhRb9t2w3xJQDCEI2cXNYMDez4zw05R5dizV0KZVFJOEjlTJK5LW
	m4H9SHagDSGjN884DFYbIWPKT6vrp+bo1Ecu1SXE6qbg6yyZS5fQ16ptfZ37en3bYB3zcF75N6D
	qTBx4DHrj7r9nb3SxvaaH9nxEmedUjZ/jEdSiDMMoYMBVcukKodynUCFoIj4ipLE+5GRO9cM4Cm
	aGfNSeU3UVEDaQ+wukKcGqzleCzcyfiqULyrjYHQarJa3skZfgpJt4JDyI/j0/xFjFOkmcxLOEc
	6WXYAtJit0NdojaoKn4XiLnvwG8Au0CHkBnoeRq8Hu+vG3v52ZyCm/mXV8ZYyg3J2lvYE3NookC
	vLrrbZxRT94OkLh3f1dvg=
X-Google-Smtp-Source: AGHT+IE4FDzI2fl3iF/FeHvk73xQO0/uUff9GpZajmdaH4++8DOBr9WgUzShXoJrvM7PV7zAGGon7Q==
X-Received: by 2002:a05:6a00:8c10:b0:7b7:5066:7f9 with SMTP id d2e1a72fcca58-81b7e928742mr18063499b3a.7.1768307880309;
        Tue, 13 Jan 2026 04:38:00 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e9dd8fd8dsm11409000b3a.10.2026.01.13.04.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:38:00 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v3 3/3] platform/x86: hp-wmi: implement fan keep-alive
Date: Tue, 13 Jan 2026 18:07:38 +0530
Message-ID: <20260113123738.222244-4-krishna.chomal108@gmail.com>
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

The firmware on some HP laptops automatically reverts the fan speed
control to "Auto" mode after a 120 second timeout window.

To ensure that the user-selected fan profile (Max/Manual) persists,
implement a keep-alive mechanism that periodically refreshes the fan
mode trigger before the timeout occurs.

- Introduce a delayed workqueue to trigger the fan mode refresh every 90
  seconds, ensuring the system maintains the correct fan mode setting.
- Integrate the refresh mechanism into hp_wmi_hwmon_enforce_ctx() to
  start, update or cancel the keep-alive process based on the current
  fan mode.

This ensures that the driver stays in sync with the hardware.

Tested on: HP Omen 16-wf1xxx (board ID 8C78)

Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
Changes in v3:
- Rename "ctx" to "priv" for drvdata
Changes in v2:
- Explicitly specify time unit in KEEP_ALIVE_DELAY macro
- Handle work rescheduling directly in switch/case
---
 drivers/platform/x86/hp/hp-wmi.c | 46 +++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d04e53ae1803..45ab644ff10e 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -34,6 +34,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
 MODULE_DESCRIPTION("HP laptop WMI driver");
@@ -368,6 +369,7 @@ struct hp_wmi_hwmon_priv {
 	u8 gpu_delta;
 	u8 mode;
 	u8 pwm;
+	struct delayed_work keep_alive_dwork;
 };
 
 struct victus_s_fan_table_header {
@@ -386,6 +388,12 @@ struct victus_s_fan_table {
 	struct victus_s_fan_table_entry entries[];
 } __packed;
 
+/*
+ * 90s delay to prevent the firmware from resetting fan mode after fixed
+ * 120s timeout
+ */
+#define KEEP_ALIVE_DELAY_SECS     90
+
 static inline u8 rpm_to_pwm(u8 rpm, struct hp_wmi_hwmon_priv *priv)
 {
 	return fixp_linear_interpolate(0, 0, priv->max_rpm, U8_MAX,
@@ -2093,6 +2101,7 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 static void __exit hp_wmi_bios_remove(struct platform_device *device)
 {
 	int i;
+	struct hp_wmi_hwmon_priv *priv;
 
 	for (i = 0; i < rfkill2_count; i++) {
 		rfkill_unregister(rfkill2[i].rfkill);
@@ -2111,6 +2120,10 @@ static void __exit hp_wmi_bios_remove(struct platform_device *device)
 		rfkill_unregister(wwan_rfkill);
 		rfkill_destroy(wwan_rfkill);
 	}
+
+	priv = platform_get_drvdata(device);
+	if (priv)
+		cancel_delayed_work_sync(&priv->keep_alive_dwork);
 }
 
 static int hp_wmi_resume_handler(struct device *device)
@@ -2179,12 +2192,20 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 		if (is_victus_s_thermal_profile())
 			hp_wmi_get_fan_count_userdefine_trigger();
 		ret = hp_wmi_fan_speed_max_set(1);
-		return ret;
+		if (ret < 0)
+			return ret;
+		schedule_delayed_work(&priv->keep_alive_dwork,
+				      secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
+		return 0;
 	case PWM_MODE_MANUAL:
 		if (!is_victus_s_thermal_profile())
 			return -EOPNOTSUPP;
 		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
-		return ret;
+		if (ret < 0)
+			return ret;
+		schedule_delayed_work(&priv->keep_alive_dwork,
+				      secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
+		return 0;
 	case PWM_MODE_AUTO:
 		if (is_victus_s_thermal_profile()) {
 			hp_wmi_get_fan_count_userdefine_trigger();
@@ -2192,7 +2213,10 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 		} else {
 			ret = hp_wmi_fan_speed_max_set(0);
 		}
-		return ret;
+		if (ret < 0)
+			return ret;
+		cancel_delayed_work_sync(&priv->keep_alive_dwork);
+		return 0;
 	default:
 		/* shouldn't happen */
 		return -EINVAL;
@@ -2336,6 +2360,20 @@ static const struct hwmon_chip_info chip_info = {
 	.info = info,
 };
 
+static void hp_wmi_hwmon_keep_alive_handler(struct work_struct *work)
+{
+	struct delayed_work *dwork;
+	struct hp_wmi_hwmon_priv *priv;
+
+	dwork = to_delayed_work(work);
+	priv = container_of(dwork, struct hp_wmi_hwmon_priv, keep_alive_dwork);
+	/*
+	 * Re-apply the current hwmon context settings.
+	 * NOTE: hp_wmi_apply_fan_settings will handle the re-scheduling.
+	 */
+	hp_wmi_apply_fan_settings(priv);
+}
+
 static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 {
 	u8 fan_data[128] = { 0 };
@@ -2393,6 +2431,8 @@ static int hp_wmi_hwmon_init(void)
 		return PTR_ERR(hwmon);
 	}
 
+	INIT_DELAYED_WORK(&priv->keep_alive_dwork, hp_wmi_hwmon_keep_alive_handler);
+	platform_set_drvdata(hp_wmi_platform_dev, priv);
 	hp_wmi_apply_fan_settings(priv);
 
 	return 0;
-- 
2.52.0

