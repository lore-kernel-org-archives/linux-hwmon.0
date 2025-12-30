Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D8A31ED70
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Dec 2025 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767106283; cv=none; b=Shk/RAu6TaRGjwSjKzqtuHYxLhaftAbXN+KXgGXU0vPkxjTeu88lkaYh8e3B/kDJDXkiVfBRNdRBFA06vsTi2NZl9MGnv4FiYbwy8P2Rcyz6/YPESDaMVEC787z3fIqlIr5NgzSHdooAiFgwKyH7GYriZAwUik3CfQ35KUVTpxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767106283; c=relaxed/simple;
	bh=PafXgWDMvXLR2Nstor1AR1m6gZWJgpmSJIc0jQ0emsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=izw2NHss9IHOcjOMxPjk/9nyu10PCuyPZfRP8Msslj3KVlHrcTn8gLe5Kvy1CiX8a4E6d/I6w7BKoFTZdblHQRrASRQMwhdTgKg8tJ8QJw86OHzJLowSXYYjajCJwJ8d0nDffB068ZJaEBOo+st4F1KRxOUKQvPdeScU0VStlNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4WjBufF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4WjBufF"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0c09bb78cso72645925ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Dec 2025 06:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767106278; x=1767711078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbAQovtJoKutCpVbRAys9lPE9fj9fNigF3AvHChA6z4=;
        b=D4WjBufFKWJRbhhoytD4vdCGmMhu9+zkffluefb8iWHWhkbSyGlsihb5EiyDdZLxco
         xpDywUNzYvfX5v95YvClBJo7R6ZlYMgxXYGB0pFZUx0b0aEsh+ulu8UUWwJRA4xtD0jT
         Lx4HDNLFPkLXbTFTcmjvpSaq1t8pWgEXbOPErmyqkYKzx+bcd6nSbB+1LkoYScN4x77N
         TVjadq+1uD1ZT5XMcWYUH1jdSqqpah2eoVV08gWJWRErTD6fM6rpRBBr+sYCS2tCoDld
         BUx/ExVeAHPy1z1WxSyWZ4RTinpR9/n9B0gkbOpkfkgaO96qOD3wAVAdsIL0tkrpkMb7
         B7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767106278; x=1767711078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xbAQovtJoKutCpVbRAys9lPE9fj9fNigF3AvHChA6z4=;
        b=rKniw/QRuFNMHZFpXsfkMU7QFkhZVLVk0p0df7UxixWYFNxtt2Lrdi6J1Fnw5Xb1MK
         SAjiFeVEiGOTl0pTiKXSA3oY4BscC40Mp8dnD08Lnf5fLX74ksIJV5+PjIfqOuuGc7Kq
         +qM1SPoSGZpXcykBn3UKosPLlYPE/U9QlCA3ZH437aYflLqpdGecpgbPt9fCgRKYUdZ0
         u1gna5l/1C4Rqt3nN0cSundvk0NdIfX17MDAMclVh34vblk7u9y9cPNlr5GbQJfvSUDE
         LN7t02VHYjAO3dO3+nbcumNsnQAZ10gI9TSanMDTmYz0Bjk6ZiDKuQJZdALHC6iUIy3r
         EDbA==
X-Forwarded-Encrypted: i=1; AJvYcCXvodPhOFVaBVIRYRGRvlBRPJ51w8owQAyZOIS8OrcUGm+EFJmqhVTzif6Xm41tWu4sNv9hjU+avZcl8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiGXVZqIMTlC7NoPMW5TXQU9dVI3BwEV2m9uSUXzj8E9+S9f+A
	awywiYzCC9GD872cBBr7ixltFicssOd1/AHow43BixQM/kO3jk4DUlK6
X-Gm-Gg: AY/fxX7GARQs/LQ7pXTpFzRdinBiwe0IXWA3ERZ0jb5KZ2KLUZ1d4PjDJB69I4rysgs
	SZyXVl4cjLipCpuXir0cfrg8z41wMJeGIgZhEBxx9x3pIbVlqhQWZnj0Dmmi4WS/0o6CMPwMWid
	9Y3kTzn6W0r4YcNTwa1C7Q/WuyjkTQtuWAc9DciTLF/vQbG23dmea+MBJO19VLWacpX8x4bGRNb
	uz1r0RfN/224oA97Q7ZoLrv41duaYE/V35ed9G12kAiZyt0CkrN2/697vGx2Q5+lLUXK+gAr4Cs
	xteZXeMCb9rUYHbGrinjJ5bhcN5cHNXpbBsDt1mXjrLL1WpAxI5qmwQwudOaIS0ul+h6nWW2Fqn
	d0u6kigf8jDrNFdK3VZ9ocL9y6pP0nf73IRk3Ik+qXT+7erQqSoXZ4+TBPn0gpIN/5s24QQMYEI
	ZDH3ecHR7oyDyRyBsHUBctjPQizdc26Q==
X-Google-Smtp-Source: AGHT+IEus/WFmxvaHScCzlZVMv3z622sVJr0P9J3GJWro2Nxl6f1Smit9+HrdVV6jt9rstkznaDlyg==
X-Received: by 2002:a17:903:2450:b0:2a0:e5c3:d149 with SMTP id d9443c01a7336-2a2f0d40410mr353178025ad.23.1767106278186;
        Tue, 30 Dec 2025 06:51:18 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d86esm301257245ad.74.2025.12.30.06.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:51:17 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v2 2/2] platform/x86: hp-wmi: implement fan keep-alive
Date: Tue, 30 Dec 2025 20:20:53 +0530
Message-ID: <20251230145053.516196-3-krishna.chomal108@gmail.com>
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
Changes in v2:
- Explicitly specify time unit in KEEP_ALIVE_DELAY macro
- Handle work rescheduling directly in switch/case
---
 drivers/platform/x86/hp/hp-wmi.c | 46 +++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index ef419575174c..cf9327e1f40e 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -34,6 +34,7 @@
 #include <linux/limits.h>
 #include <linux/minmax.h>
 #include <linux/compiler_attributes.h>
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
+	struct hp_wmi_hwmon_priv *ctx;
 
 	for (i = 0; i < rfkill2_count; i++) {
 		rfkill_unregister(rfkill2[i].rfkill);
@@ -2111,6 +2120,10 @@ static void __exit hp_wmi_bios_remove(struct platform_device *device)
 		rfkill_unregister(wwan_rfkill);
 		rfkill_destroy(wwan_rfkill);
 	}
+
+	ctx = platform_get_drvdata(device);
+	if (ctx)
+		cancel_delayed_work_sync(&ctx->keep_alive_dwork);
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
@@ -2337,6 +2361,20 @@ static const struct hwmon_chip_info chip_info = {
 	.info = info,
 };
 
+static void hp_wmi_hwmon_keep_alive_handler(struct work_struct *work)
+{
+	struct delayed_work *dwork;
+	struct hp_wmi_hwmon_priv *ctx;
+
+	dwork = to_delayed_work(work);
+	ctx = container_of(dwork, struct hp_wmi_hwmon_priv, keep_alive_dwork);
+	/*
+	 * Re-apply the current hwmon context settings.
+	 * NOTE: hp_wmi_apply_fan_settings will handle the re-scheduling.
+	 */
+	hp_wmi_apply_fan_settings(ctx);
+}
+
 static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 {
 	u8 fan_data[128] = { 0 };
@@ -2395,6 +2433,8 @@ static int hp_wmi_hwmon_init(void)
 		return PTR_ERR(hwmon);
 	}
 
+	INIT_DELAYED_WORK(&priv->keep_alive_dwork, hp_wmi_hwmon_keep_alive_handler);
+	platform_set_drvdata(hp_wmi_platform_dev, priv);
 	hp_wmi_apply_fan_settings(priv);
 
 	return 0;
-- 
2.52.0

