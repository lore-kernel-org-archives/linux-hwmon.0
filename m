Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970D73C7691
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Sep 2026 14:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174522; cv=none; b=qeoMNRediphG5Z5EkHEmOxEKnRXOMKUt5ISFjBE5bMqbI+gRgZGViGEk8WRcMt/7ZO11jDw60fnSV4aNI43r2ZfY8TyjEYf6x8RPrur7COipixl7K5+bMOioiRm1rGbKkL4hSgmFYLDNP3vqr4dkCf8Vpskys0Sh8OX76XsZ8Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174522; c=relaxed/simple;
	bh=7l9FJzN2Q/11oP4/2plIomY2L5fL5NSBP9Fh/Mm5DjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PQzWkTN/NJbM9mzHIx1OHDe86y+hI644kuk11eeYOVpBNs1Y8lg9IqQQppkC+IGDBWP8/Akz5FO++qWLC7uewRIFqyd0/Wgo37Swv2IReDX6PwwKpWW/6q1Sl4Mvxe2/1d0JfjbcIBHEL58JiLVLZbl3tvMwWF41+gPUy3OFCgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InrXPSXJ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InrXPSXJ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so922272f8f.1
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Sep 2026 07:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174518; x=1790779318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQ2M0aHQjyvXWIrWaD61ZPwAoFJN+F19bNvFZPbBx2c=;
        b=InrXPSXJTFZp08Y8iH8UkeHIwpElpw5wHTw2vCaX0BB1xfVg1Ebo2oZ6L4oMAieav8
         EUaLyNaH+LBvgBchBVkPMUauJRP6+Gx2erUo0i7R4gA32xdqdyxDukNRSc4vn3OFpZ7e
         SVLUsTx6wYN5pjp31Ji3dN8sZuSrqZJmctX9VO/747/BKsBgx+ubniLW7tcudBfhcAmd
         zyK4V9tz37jUHKfQyrI6LZYOLipEoMZSsyouai9Rismg5+y96YdzYOCWO+0KH5j9Jodc
         J9HooF7xR1GWgpK0Xi2hoTgyzLsmO0ImUTM17InOKOjCyRPLschHARBDwEqyEvh674yx
         x3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174518; x=1790779318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQ2M0aHQjyvXWIrWaD61ZPwAoFJN+F19bNvFZPbBx2c=;
        b=wdGSOlwBSuz8cCfyJREUGB5S4+YgrSb6Z7gaiMdxJihV8kZx0fhbR2zK3XKwank+c+
         PeFuYf1cnQgSQgVYdQZDA8sjgPWl3nb9yX7kUJjnifE1h62sSI600irnGOdZErUTYIX5
         WwTQK8LQhM8g3XTvNP3pKuN7dTvgQlr9NqkxjU35goqmgFf8SKNpe30VXlx+lXvqNhCs
         xErkYSymZ4gXd4n+HEf5Zq032R4PRTeEXrLqPbsYFzJM+g+yM2/WSQwwHII7umbIRjMf
         M5ps1A297ladMoH6pimo3PfX+GxYf/oOx1O/YuI0hAx7PCAG/NqhK2zmMHIHnh20eZXz
         hv+A==
X-Gm-Message-State: AFuF++kHP3uikgaRRT6RZ2IL8ftcgL9OsrtxZwakgR5nMW8hp26G3xxs
	G8rsBqeieBx6Ns0RyL6UxxoVYBK8BWQ0nFL2PnNXvaLccSxNrTcVQ4obzH7Ocw==
X-Gm-Gg: AYBFou0P8MDRPJFzfOoup4tY47/ORrZXW0n56H8cvJalBM+B3sfA2RNbTbMbb+sSA62
	HjdI/uSpaFxOyG2oYVySFRcsk1EoSWDzuiBCOBYs0NJsdFS8W3CsqhK/OBLY7WY0Sni+x4paiyM
	YKKi7zzSmAkwpe4mXrUN6yDHJYy2FREQsFGJruqBIiVrGaa5b7RsOCIk9F0bxhiTLU4NwMNhHNO
	WWxpGfIkHWFYz5K3JeIGBv8LGaA4clvHOVMFS8b0ZwbsZ5X1BBeHiLBShSRkw1FczjbgZJYf8UW
	pff7DDb6e0P3Hk8jKiaNfVut1sVQs8DbmB/X7OJBNt3TdR7vyoCgHMSR73uSlgeBrHhYuT2kk0s
	NE9epr6rH5rC75vjELXgJMnohskMbXM+oNKUyenranrzAjgP40LuZZxJeK1nOhBMb1a5BPtn8T2
	RyFbUwh1LEX8AMbzk3jhFXwuy7tCquWtaHXOXfuauep3lIwXZky1hC1RtfkCSwCForjYk2HXcRq
	T5g5Rhl3ZV3
X-Received: by 2002:a05:6000:3102:b0:488:6078:8aef with SMTP id ffacd0b85a97d-4886706f935mr4671548f8f.20.1790174517606;
        Wed, 23 Sep 2026 07:41:57 -0700 (PDT)
Received: from fedora ([213.55.185.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886848636asm7050899f8f.6.2026.09.23.07.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:41:57 -0700 (PDT)
From: Michal Szpakowski <michi.szpakowski@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (applesmc) Expose the SMC battery charge limit
Date: Wed, 23 Sep 2026 16:41:17 +0200
Message-ID: <20260923144117.295450-1-michi.szpakowski@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel Macs keep a battery charge limit inside the SMC, in the key BCLM
(one byte, percent). The SMC enforces it on its own: charging stops at
the limit and the value survives reboots and operating systems, so the
only thing an OS has to do is write it. On macOS the tool "bclm" does
that; on Linux there has been no way, because applesmc exposes keys
read-only through key_at_index.

Expose it as the standard charge_control_end_threshold property on the
battery through a power supply extension, so UPower and the desktops
that read that property pick it up without knowing anything about
Apple. The battery of an Intel Mac is an ACPI Smart Battery handled by
the sbs driver, which the ACPI battery hooks do not cover, so the
supply is found by walking the registered supplies; should it register
after applesmc, its first property-change notification attaches the
extension. Nothing happens on machines whose SMC lacks the key. Writes
are read back, because the SMC silently drops values it does not
accept; 100 disables the cap.

Tested on a MacBookPro13,1 (2016, 13", no Touch Bar): with the limit at
80 and the charger attached, charging ran at a steady 1.55 A and stopped
at 79% of charge_full with status "Full" and current 0, and the limit
read back 80 after a reboot.

Signed-off-by: Michal Szpakowski <michi.szpakowski@gmail.com>
---
 drivers/hwmon/Kconfig    |  4 +++-
 drivers/hwmon/applesmc.c | 134 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 137 insertions(+), 1 deletion(-)

--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -368,13 +368,15 @@
 config SENSORS_APPLESMC
 	tristate "Apple SMC (Motion sensor, light sensor, keyboard backlight)"
 	depends on INPUT && X86
+	depends on POWER_SUPPLY
 	select NEW_LEDS
 	select LEDS_CLASS
 	help
 	  This driver provides support for the Apple System Management
 	  Controller, which provides an accelerometer (Apple Sudden Motion
 	  Sensor), light sensors, temperature sensors, keyboard backlight
-	  control and fan control.
+	  control, fan control and, on machines whose SMC has the BCLM key,
+	  a battery charge limit exposed as charge_control_end_threshold.
 
 	  Only Intel-based Apple's computers are supported (MacBook Pro,
 	  MacBook, MacMini).
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -33,6 +33,7 @@
 #include <linux/workqueue.h>
 #include <linux/err.h>
 #include <linux/bits.h>
+#include <linux/power_supply.h>
 
 /* data port used by Apple SMC */
 #define APPLESMC_DATA_PORT	0x300
@@ -64,6 +65,8 @@
 
 #define CLAMSHELL_KEY		"MSLD" /* r-o ui8 (unused) */
 
+#define CHARGE_LIMIT_KEY	"BCLM" /* r/w ui8, percent */
+
 #define MOTION_SENSOR_X_KEY	"MO_X" /* r-o sp78 (2 bytes) */
 #define MOTION_SENSOR_Y_KEY	"MO_Y" /* r-o sp78 (2 bytes) */
 #define MOTION_SENSOR_Z_KEY	"MO_Z" /* r-o sp78 (2 bytes) */
@@ -130,6 +133,7 @@
 	int num_light_sensors;		/* number of light sensors */
 	bool has_accelerometer;		/* has motion sensor */
 	bool has_key_backlight;		/* has keyboard backlight */
+	bool has_charge_limit;		/* has battery charge limit */
 	bool init_complete;		/* true when fully initialized */
 	struct applesmc_entry *cache;	/* cached key entries */
 	const char **index;		/* temperature key index */
@@ -621,6 +625,9 @@
 	ret = applesmc_has_key(BACKLIGHT_KEY, &s->has_key_backlight);
 	if (ret)
 		return ret;
+	ret = applesmc_has_key(CHARGE_LIMIT_KEY, &s->has_charge_limit);
+	if (ret)
+		return ret;
 
 	s->num_light_sensors = left_light_sensor + right_light_sensor;
 	s->init_complete = true;
@@ -669,6 +676,155 @@
 }
 
 /* Device model stuff */
+/*
+ * Battery charge limit
+ *
+ * The SMC key BCLM holds the maximum charge level in percent and the SMC
+ * enforces it by itself: charging stops there and the value is kept across
+ * reboots; 100 means no limit. It is the setting the macOS tool "bclm"
+ * writes. Expose it as charge_control_end_threshold on the battery through
+ * a power supply extension. The battery of an Intel Mac is an ACPI Smart
+ * Battery (sbs), which the ACPI battery hooks do not cover, so the battery
+ * is found by walking the registered supplies; if it is not there yet when
+ * this driver loads, the first property-change notification from it does
+ * the job.
+ */
+static const enum power_supply_property applesmc_battery_props[] = {
+	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
+};
+
+static int applesmc_battery_get_property(struct power_supply *psy,
+					 const struct power_supply_ext *ext,
+					 void *data,
+					 enum power_supply_property psp,
+					 union power_supply_propval *val)
+{
+	u8 limit;
+	int ret;
+
+	if (psp != POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
+		return -EINVAL;
+
+	ret = applesmc_read_key(CHARGE_LIMIT_KEY, &limit, 1);
+	if (ret)
+		return ret;
+
+	val->intval = limit;
+	return 0;
+}
+
+static int applesmc_battery_set_property(struct power_supply *psy,
+					 const struct power_supply_ext *ext,
+					 void *data,
+					 enum power_supply_property psp,
+					 const union power_supply_propval *val)
+{
+	u8 limit, readback;
+	int ret;
+
+	if (psp != POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
+		return -EINVAL;
+	if (val->intval < 1 || val->intval > 100)
+		return -EINVAL;
+
+	limit = val->intval;
+	ret = applesmc_write_key(CHARGE_LIMIT_KEY, &limit, 1);
+	if (ret)
+		return ret;
+
+	/* The SMC silently ignores values it does not accept. */
+	ret = applesmc_read_key(CHARGE_LIMIT_KEY, &readback, 1);
+	if (ret)
+		return ret;
+	if (readback != limit)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int applesmc_battery_property_is_writeable(struct power_supply *psy,
+						  const struct power_supply_ext *ext,
+						  void *data,
+						  enum power_supply_property psp)
+{
+	return psp == POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD;
+}
+
+static const struct power_supply_ext applesmc_battery_ext = {
+	.name = "applesmc-charge-limit",
+	.properties = applesmc_battery_props,
+	.num_properties = ARRAY_SIZE(applesmc_battery_props),
+	.get_property = applesmc_battery_get_property,
+	.set_property = applesmc_battery_set_property,
+	.property_is_writeable = applesmc_battery_property_is_writeable,
+};
+
+static struct power_supply *applesmc_battery;	/* the extended supply */
+static DEFINE_MUTEX(applesmc_battery_mutex);
+
+static int applesmc_battery_extend(struct power_supply *psy, void *data)
+{
+	int ret;
+
+	if (psy->desc->type != POWER_SUPPLY_TYPE_BATTERY)
+		return 0;
+
+	ret = power_supply_register_extension(psy, &applesmc_battery_ext,
+					      &pdev->dev, NULL);
+	if (ret)
+		return ret;
+
+	get_device(&psy->dev);
+	applesmc_battery = psy;
+	return 1;	/* one battery is enough, stop walking */
+}
+
+static void applesmc_battery_attach(struct work_struct *work)
+{
+	mutex_lock(&applesmc_battery_mutex);
+	if (!applesmc_battery)
+		power_supply_for_each_psy(NULL, applesmc_battery_extend);
+	mutex_unlock(&applesmc_battery_mutex);
+}
+
+static DECLARE_WORK(applesmc_battery_work, applesmc_battery_attach);
+
+static int applesmc_battery_notify(struct notifier_block *nb,
+				   unsigned long event, void *data)
+{
+	if (event == PSY_EVENT_PROP_CHANGED && !applesmc_battery)
+		schedule_work(&applesmc_battery_work);
+	return NOTIFY_OK;
+}
+
+static struct notifier_block applesmc_battery_nb = {
+	.notifier_call = applesmc_battery_notify,
+};
+
+static void applesmc_battery_init(void)
+{
+	if (!smcreg.has_charge_limit)
+		return;
+	power_supply_reg_notifier(&applesmc_battery_nb);
+	applesmc_battery_attach(NULL);
+}
+
+static void applesmc_battery_exit(void)
+{
+	if (!smcreg.has_charge_limit)
+		return;
+	power_supply_unreg_notifier(&applesmc_battery_nb);
+	cancel_work_sync(&applesmc_battery_work);
+	mutex_lock(&applesmc_battery_mutex);
+	if (applesmc_battery) {
+		power_supply_unregister_extension(applesmc_battery,
+						  &applesmc_battery_ext);
+		power_supply_put(applesmc_battery);
+		applesmc_battery = NULL;
+	}
+	mutex_unlock(&applesmc_battery_mutex);
+}
+
 static int applesmc_probe(struct platform_device *dev)
 {
 	int ret;
@@ -1369,6 +1525,8 @@
 		goto out_light_ledclass;
 	}
 
+	applesmc_battery_init();
+
 	return 0;
 
 out_light_ledclass:
@@ -1398,6 +1556,7 @@
 
 static void __exit applesmc_exit(void)
 {
+	applesmc_battery_exit();
 	hwmon_device_unregister(hwmon_dev);
 	applesmc_release_key_backlight();
 	applesmc_release_light_sensor();
