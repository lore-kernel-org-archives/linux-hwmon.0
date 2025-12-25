Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A247322B86
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Dec 2025 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766672619; cv=none; b=I1ozvm0b8F2TiaM40ctJ22X0x62iUlJeZXNSdURuZwxrXx8/nZ3NI277bk939fhvaZGUE+5uhtQEfGsLUIZW+36g6lxFp3fys8xFnUZhX4GSMbkz8IVxIcqBC/2PUXXAOAD1BHbtflZ4YwQ56QpIruQzSOnV/LCI/RN9QXvD0Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766672619; c=relaxed/simple;
	bh=8as6Tg+WQ8IFIRqRkyQHtagnR5iib3TLHnxyF1PKz80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXaW8hthITls+VLH5u4xlHFLe3DJutRIkhgSxnVHI2nQDJ8DTp/Ni7lhoyCJ4MFeZ7ylht98cSvlX13EIBCknEiHJ1KZsZZ7AVnvhFuF2OOb2LsoL/E0H4WllnBF7N2/w1Z0vRWFDtjEwJXa6l/5/WgvX0vfqPzedle9kp8OUk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EV3OUiw0; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EV3OUiw0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0ac29fca1so57169995ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Dec 2025 06:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766672617; x=1767277417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sdD19Re9ro0Yav25pXuBH3cxFpqUWhOZekWhN56D70=;
        b=EV3OUiw0/9Xycj6Kpi5+FEozSbXQNLuquz2WWZkDyz9I79Am6C1aB2k2gcaOE1+Iyn
         UMFIbS3RZFah4reuB6CQY8K6WrM+NPjZs0PHCBt/oUwyTtFyHlsh8ejktUVlL1omC65v
         C1YTETcYOfrEEJoV9woSb8nOYJSFqlqWH5bFawIVcO5TuH4M/WVp67Wh4MhI+7yoPoVA
         AdqGmsc6HTvHX8eZFGYuhSXvTelVcP1I22vnrPjd6jF7pJDzdhRQgNAcsVjrax0cDqNK
         qtJ8NpbZ4ox74XSOXMNwLpi/YBzWBwXyfRnAONDIZlIKJWThs5UVsMm6gRfery/MfVft
         oEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766672617; x=1767277417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7sdD19Re9ro0Yav25pXuBH3cxFpqUWhOZekWhN56D70=;
        b=NDPicZaBndlkt3NoWve72Cvqd0dAW6i9tWTeR/raOQwX/xTQ399+Xzv/PZg9kKTmO6
         0wTbZjv19/4vWpdnxORrV5R4Webb37jSvn0fe9eX2NxJaYO+gXDRJisX68YpkoeL5UJ1
         6V0Au1FqnwYG1IMO/I4hZsmILz3/LKxcsBD1fOhkGGcSw6yLTQdPIJ1F/eZfQFs9WwLn
         9fdtzd/tci4HNiJ8PhCwXL35XeY4FiQCPZt9dQv/Mj4QDpN3tIvMZefcpC1PD0plwM2P
         /16BbRoijjBoHUiZeaQdAJxP4l9W72XRK5WKMqYuuTw72PIS0oL4WZmp16V8K5EXrx1j
         uNXg==
X-Forwarded-Encrypted: i=1; AJvYcCV2gv4KJuCqpxC0QfGHED9WLmbCl8vB839df5PPcFpHXxmCJgUk5Z3FCREx9NTdW0e6ivnZcBHbuKkwWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaIO8T3iLJeq+krE+wWZw+b/UzZb68Vm+jm3zSi4pqYUmHcplj
	KwpNWnvP2NA1BuOUyBu7h1BfgSxlg0srGYsNvuxN58cxdsFYCP+3fFhO
X-Gm-Gg: AY/fxX65zDIHSV54JUQ4Btv5M1gvYfTxWGznuJj30u1kYnLU+aWjjADOIk3PF9yewyr
	kSvnRSkmvQX0E0j+d61k/RWfFloC8XxR3Q714CR5rfFbY072/IQJOydIACvWWn0ZB4228lZ7OLU
	pywQRS4k9ZiBiAccd3dKke+a6nabOdX/I95KGe+5h4SuV3feMx9sMdTg1kHFJ6kofYhjF8kc7FW
	NV/1X2PYU0F2bwd1Uzx0We7AE3Il8WTy8lyER9FBJKxypsMIUxzfg16FEWFbfjC7qLTgKG6p6SV
	0pBq6XQbGOgCroMOjh9cNDKX35uy/xi/+5lHolOt6pePlgNg2L5+ysuz+jd370PJpf+tEo5K/9S
	y+76KkgoqhBHoEYlyHc1GLOCkRti6zRyKUUbH3odHigKE6N5DQkREliCj/aqqBv+k+LlBOCy+gG
	Un4G5RWJLCotJDX8Zqk4k=
X-Google-Smtp-Source: AGHT+IHhLxUJC8jIpI5cCyFf9GFQOizdf8CcwKsNqsRfZMhwDQ1kXzIt0SrXUQnK6EXtUrfYhROXMA==
X-Received: by 2002:a17:903:1c8:b0:295:c2e7:7199 with SMTP id d9443c01a7336-2a2f2732890mr201635125ad.29.1766672616760;
        Thu, 25 Dec 2025 06:23:36 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3da7dabsm180892195ad.25.2025.12.25.06.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 06:23:36 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH 2/2] platform/x86: hp-wmi: implement fan keep-alive
Date: Thu, 25 Dec 2025 19:53:10 +0530
Message-ID: <20251225142310.204831-3-krishna.chomal108@gmail.com>
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
 drivers/platform/x86/hp/hp-wmi.c | 52 +++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 9fb956ce809a..fbe012e7a342 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -31,6 +31,7 @@
 #include <linux/string.h>
 #include <linux/dmi.h>
 #include <linux/fixp-arith.h>
+#include <linux/workqueue.h>
 
 MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
 MODULE_DESCRIPTION("HP laptop WMI driver");
@@ -365,8 +366,15 @@ struct hp_wmi_hwmon_priv {
 	u8 gpu_delta;
 	u8 mode;
 	u8 pwm;
+	struct delayed_work keep_alive_dwork;
 };
 
+/*
+ * 90s delay to prevent the firmware from resetting fan mode after fixed
+ * 120s timeout
+ */
+#define KEEP_ALIVE_DELAY	90
+
 #define RPM_TO_PWM(rpm, ctx) fixp_linear_interpolate(0, 0, \
 						(ctx)->max_rpm, U8_MAX, \
 						clamp_val((rpm), \
@@ -2073,6 +2081,7 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 static void __exit hp_wmi_bios_remove(struct platform_device *device)
 {
 	int i;
+	struct hp_wmi_hwmon_priv *ctx;
 
 	for (i = 0; i < rfkill2_count; i++) {
 		rfkill_unregister(rfkill2[i].rfkill);
@@ -2091,6 +2100,10 @@ static void __exit hp_wmi_bios_remove(struct platform_device *device)
 		rfkill_unregister(wwan_rfkill);
 		rfkill_destroy(wwan_rfkill);
 	}
+
+	ctx = platform_get_drvdata(device);
+	if (ctx)
+		cancel_delayed_work_sync(&ctx->keep_alive_dwork);
 }
 
 static int hp_wmi_resume_handler(struct device *device)
@@ -2152,6 +2165,8 @@ static struct platform_driver hp_wmi_driver __refdata = {
 
 static int hp_wmi_hwmon_enforce_ctx(struct hp_wmi_hwmon_priv *ctx)
 {
+	int ret;
+
 	if (!ctx)
 		return -ENODEV;
 
@@ -2159,23 +2174,36 @@ static int hp_wmi_hwmon_enforce_ctx(struct hp_wmi_hwmon_priv *ctx)
 	case PWM_MODE_MAX:
 		if (is_victus_s_thermal_profile())
 			hp_wmi_get_fan_count_userdefine_trigger();
-		return hp_wmi_fan_speed_max_set(1);
+		ret = hp_wmi_fan_speed_max_set(1);
+		break;
 	case PWM_MODE_MANUAL:
 		if (!is_victus_s_thermal_profile())
 			return -EOPNOTSUPP;
-		return hp_wmi_fan_speed_set(ctx, PWM_TO_RPM(ctx->pwm, ctx));
+		ret = hp_wmi_fan_speed_set(ctx, PWM_TO_RPM(ctx->pwm, ctx));
+		break;
 	case PWM_MODE_AUTO:
 		if (is_victus_s_thermal_profile()) {
 			hp_wmi_get_fan_count_userdefine_trigger();
-			return hp_wmi_fan_speed_max_reset(ctx);
+			ret = hp_wmi_fan_speed_max_reset(ctx);
 		} else {
-			return hp_wmi_fan_speed_max_set(0);
+			ret = hp_wmi_fan_speed_max_set(0);
 		}
+		break;
 	default:
 		/* shouldn't happen */
 		return -EINVAL;
 	}
 
+	if (ret < 0)
+		return ret;
+
+	/* Reschedule keep-alive work based on the new state */
+	if (ctx->mode == PWM_MODE_MAX || ctx->mode == PWM_MODE_MANUAL)
+		schedule_delayed_work(&ctx->keep_alive_dwork,
+				      secs_to_jiffies(KEEP_ALIVE_DELAY));
+	else
+		cancel_delayed_work_sync(&ctx->keep_alive_dwork);
+
 	return 0;
 }
 
@@ -2321,6 +2349,20 @@ static const struct hwmon_chip_info chip_info = {
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
+	 * NOTE: hp_wmi_hwmon_enforce_ctx will handle the re-scheduling.
+	 */
+	hp_wmi_hwmon_enforce_ctx(ctx);
+}
+
 static int hp_wmi_hwmon_setup_ctx(struct hp_wmi_hwmon_priv *ctx)
 {
 	u8 fan_data[128];
@@ -2377,6 +2419,8 @@ static int hp_wmi_hwmon_init(void)
 		return PTR_ERR(hwmon);
 	}
 
+	INIT_DELAYED_WORK(&ctx->keep_alive_dwork, hp_wmi_hwmon_keep_alive_handler);
+	platform_set_drvdata(hp_wmi_platform_dev, ctx);
 	hp_wmi_hwmon_enforce_ctx(ctx);
 
 	return 0;
-- 
2.52.0

