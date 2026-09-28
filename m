Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548F84AF9D3
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 11:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595677; cv=none; b=LgtMrN5K9OXQsmEBcVckTBknEWt9ZUCvlTvOsmPBY6zfTmCH+xufe6lDuwWlMmbVIPqtqpp00I49fBKQNPMnoegbSgHxgWs+U3JNOtiEXLorzdfaGwzhHlBvbY5lQL4d7dINzxCfS8Kkm4F9bZ+L2DA7ICfStuT5Zao5jo2WoKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595677; c=relaxed/simple;
	bh=R7dYd0xHeSUhQ87ZqlVKcEnH7B9SQLFY5F0JN8HX2aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0TsQafqJ6aH8mV6xR5PZbf7u+LU1mDyAAvMHoTYk3mnfAfA60dQj+cyzXd/PYGI2O8g7GvsLjjgSd8kaXwPDcssfB0Lis9GzDqVltODC/JkxSKCud50H3tU489BBIA3S/P71sRPSlVrSv1V74d0pS60+dFR1bm5s6+Mx6cD++g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPrUKKiV; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPrUKKiV"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-53315c1a1d3so34135501cf.0
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 04:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790595674; x=1791200474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qi7fpPnLWItXo27Kmur7gK9O6mL1R9tVfZfPpD51KCk=;
        b=nPrUKKiV9hFnoBaEgAk/8sUbNenMIaRPNiQKIrb0BxbwLNSs6eNEoDArE9sY5TwZ+P
         lvvD7+bxGbB9lI19GmRj1KU04fH3uz5IJ+rHOPwXRYv74V5QCz3NEYywrD8k4CfrAKgD
         2ZYIMTf6qtvN3uF5Vr7OHBNQ8LNA1bosk9q0UyYMFnBboQ2Xuq05K/3iqlfqQkmbSaOy
         H0RFnVfPc0QFlUNPglWQEtdoyw00M8ry8U35nGnKJcg43glAyEgxtbIyYeOzu1Q5c/bo
         wtCznvp5vg5DSzNmjrkMHGNvrNQubfshdHBS8LmKYGQHUiETu5IyPWURDbr1zreVu8aj
         2S1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595674; x=1791200474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qi7fpPnLWItXo27Kmur7gK9O6mL1R9tVfZfPpD51KCk=;
        b=x88mspzBBvr6OuO22X6w677OiOTqUtp454GAjxcZmKyM9LGmDDLl4kK+VYQpG37RWW
         vtw3pkpiuKWwYLGxjH+C+/8Nbs9RR2OKjUSr4IYDOspiRYvyaC9FTNcOktrhvgKddqaI
         BFjDP8DHsWQes4+JvHS8uNReUkpLcYaUvjdCfkMG8qHAZp9YpFBD05C00iKKopQX0r4o
         vjdNkn8bfeIDEHyhX6RZzOojFC9KhrYb5MUVloSMfoFWRNip8GlVd5Kv4FppJ1nQHM1E
         u0xQKdFuNkwY0vTkCiMv1uiuzIDmjoXpTabVrSi3+kYFFdIjVTQVASxShNrb0WkGnqXZ
         Y5wg==
X-Gm-Message-State: AFuF++mr0fw4dD8nYsLtHzssdYhozkFDIaQWVXYfvGpyvccFNxofU1Js
	YlOug+PpJ06uWlhHQbGDFxROnp0lRJ46mMcCPryOVYaNXchDfnwzqJLpgBgTEHmv9Fw=
X-Gm-Gg: AYBFou1eDrWg5HfISeFttNPddE2h9CJ1QYOQJ28o7M0VnDw6s1KPZyJekzSjWdJHqf8
	+grei4PowlspQJn3iHq1DTxxUWORfEjwydC3uJpgBtx7taPzhrnWhvZuw3sF3MBNG33O0hpl7wY
	qzZVP7p3E4JDeW7rysksGj0y6fedS00tFq0MbPn4QCvKcdPsPhiICptVbLlIma34hG1gcgLi8F1
	PzAx2KaHZ8B/l7+/kGpXAGK0sLFccJsmXUIHXnzYCYIleIgWGGKim4ODYljHRmbO23bsUAel+qw
	ux5ttVM/uSpM5t3h2Tbu5GpCDR/xv3VrFQ5YHuHo8aUjXS2TyGt+bX0Z81bITpCiZPhH45S3Ji2
	GPms8q/SSAN7cM/S15n5Hp3wAlAZ1fTCfWzdbBDpgRl33G3+FAi3EaUnqZ7ydWZD+AfXNmMGft1
	DzC45yCkMhU38nvPNBHuZeuR+Ioe6A9ZCWmxwLmi+Erai7nL8VOW+ebdatH+HyYzzyiZUSDigtv
	TmHCry4csdaAhxkXwdlo8JBOWGWBizbuo1Mi7d/eqX+kG0GRocHKn4=
X-Received: by 2002:a05:622a:99a:b0:533:3af3:43ba with SMTP id d75a77b69052e-5333af34e9emr72688371cf.37.1790595673812;
        Mon, 28 Sep 2026 04:41:13 -0700 (PDT)
Received: from Z-System.tailddad04.ts.net (c-68-83-199-219.hsd1.mi.comcast.net. [68.83.199.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53322132f3dsm60937351cf.8.2026.09.28.04.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:41:13 -0700 (PDT)
From: Zac Lanzon <lanzonza@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Edward Blair <edward.blair@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zac Lanzon <lanzonza@gmail.com>
Subject: [PATCH v2 2/2] hwmon: (asus_rog_ryujin) Add pwm1_enable for the Ryujin III pump
Date: Mon, 28 Sep 2026 07:41:06 -0400
Message-ID: <8bf4a14fb5d3e2ecffeeef2948f7536518f0298a.1790512964.git.lanzonza@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790512964.git.lanzonza@gmail.com>
References: <cover.1790512964.git.lanzonza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once pwm1 has been written, nothing in the driver hands the RYUJIN III
pump back to its internal controller, and user space cannot tell which
source controls the pump.

Expose the pump control source as pwm1_enable, read from the cooler
duty report: 1 when the pump follows pwm1, 2 when it is handed to its
internal controller, which follows the PWM of the header its 4-pin
cable is plugged into. Writing 2 sends the reported duties with source
0, and writing 1 sends them with source 1, with the same neighbouring
duty write as pwm1. Other values return -EINVAL. Writing pwm1 still
selects source 1. The attribute is not created for the RYUJIN II.

With changes in both directions, source changes can follow each other
closely. The cooler ignored a source change sent 500 ms or less after
the previous one (7 of 7 trials) and applied one sent 1 s or more after
it (5 of 5). Its duty report showed a change within 1.1 s of the
command in every trial. So a write that changes the source now waits
until 1 s has passed since the previous change, then polls the duty
report every 100 ms until it shows the new source, and fails with
-ETIMEDOUT after 2 s. pump_source is only taken from the report. Other
writes are unaffected.

Measured on a RYUJIN III 360 (firmware AURJ2-S750-0108) with the pump
cable on AIO_PUMP and the header PWM set through nct6775 (pump rpm):

                                     header 50%  header 80%  pwm1_enable
  driver loaded, internal controller    2160        3090          2
  pwm1 = 40%                            1725        1740          1
  pwm1_enable = 2                       2130        3090          2
  pwm1_enable = 1                       1740        1740          1
  pwm1_enable = 2, then pwm1 = 60%      2475                      1
  driver reloaded, pump on USB          1740        1740          1

Written back to back, each source change took 0.95 to 1.07 s, and the
sequences ended as requested in 2 of 2 runs each: pwm1_enable = 2 then
pwm1 = 60% with the pump at 60% on USB, pwm1_enable = 1, 2, 1 on USB,
and pwm1 = 60% then pwm1_enable = 2 on the internal controller.

From power-on (measured with v1 of this patch; v2 changes only how the
wait is computed, and the first source change after loading never
waits), with the header at 100%, pwm1_enable read 2, read 1 after
pwm1 = 40% (pump at 1710 rpm), and writing 2 handed the pump back to
its internal controller (3585 rpm).

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Zac Lanzon <lanzonza@gmail.com>
---
v2: patch 2: compute the elapsed time with an unsigned subtraction so a
jiffies wrap on 32-bit cannot cause a long sleep (found by Sashiko).
Patch 1 unchanged.
v1: https://lore.kernel.org/linux-hwmon/20260927120927.72810-1-lanzonza@gmail.com/

 Documentation/hwmon/asus_rog_ryujin.rst |   8 +-
 drivers/hwmon/asus_rog_ryujin.c         | 112 +++++++++++++++++++++++-
 2 files changed, 115 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/asus_rog_ryujin.rst b/Documentation/hwmon/asus_rog_ryujin.rst
index fe072e94d87..1fdf6eb9c84 100644
--- a/Documentation/hwmon/asus_rog_ryujin.rst
+++ b/Documentation/hwmon/asus_rog_ryujin.rst
@@ -37,8 +37,10 @@ supports hot swapping.
 The pump of the RYUJIN III also has a 4-pin cable for a motherboard fan header.
 The cooler either hands the pump to its internal controller, which follows the
 PWM of the header its 4-pin cable is plugged into, or runs it at the pump duty
-set over USB. Writing pwm1 selects the duty set over USB. Writing pwm2 sets
-only the internal fan duty and leaves the pump control as it is.
+set over USB, as reported by pwm1_enable. Writing pwm1 selects the duty set
+over USB, and writing 2 to pwm1_enable hands the pump back to its internal
+controller. Writing pwm2 sets only the internal fan duty and leaves the pump
+control as it is.
 
 Sysfs entries
 -------------
@@ -52,6 +54,8 @@ fan5_input  External (controller) fan 3 speed (in rpm, RYUJIN II only)
 fan6_input  External (controller) fan 4 speed (in rpm, RYUJIN II only)
 temp1_input Coolant temperature (in millidegrees Celsius)
 pwm1        Pump duty
+pwm1_enable Pump control: 1 = pwm1, 2 = internal controller following
+            the fan header PWM (RYUJIN III only)
 pwm2        Internal fan duty
 pwm3        External (controller) fan duty (RYUJIN II only)
 =========== ==========================================================
diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index ba188e86793..4cb18903e98 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/delay.h>
 #include <linux/hid.h>
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
@@ -80,6 +81,14 @@ static const u8 set_cooler_duty_cmd[] = { RYUJIN_CMD_PREFIX, 0x1A, 0x00, 0x00, 0
 #define RYUJIN_SOURCE_HEADER	0
 #define RYUJIN_SOURCE_USB	1
 
+/*
+ * The cooler ignores a pump source change sent 500 ms or less after the
+ * previous one and applies one sent 1 s or more after it. The cooler duty
+ * report shows a change within 1.1 s.
+ */
+#define RYUJIN_SOURCE_CHANGE_INTERVAL	1000	/* ms */
+#define RYUJIN_SOURCE_CHANGE_TIMEOUT	2000	/* ms */
+
 #define RYUJIN_SET_CONTROLLER_FAN_DUTY_OFFSET	4
 static const u8 set_controller_duty_cmd[] = { RYUJIN_CMD_PREFIX, 0x21, 0x00, 0x00, 0x00 };
 
@@ -124,6 +133,7 @@ struct rog_ryujin_data {
 	u16 speed_input[6];	/* Pump, internal fan and four controller fan speeds in RPM */
 	u8 duty_input[3];	/* Pump, internal fan and controller fan duty in PWM */
 	u8 pump_source;		/* Pump control source from the cooler duty report */
+	unsigned long source_changed;	/* jiffies */
 
 	u8 *buffer;
 	unsigned long updated;	/* jiffies */
@@ -171,6 +181,10 @@ static umode_t rog_ryujin_is_visible(const void *data,
 		switch (attr) {
 		case hwmon_pwm_input:
 			return 0644;
+		case hwmon_pwm_enable:
+			if (channel == 0 && priv->info->duty_channel)
+				return 0644;
+			break;
 		default:
 			break;
 		}
@@ -285,6 +299,9 @@ static int rog_ryujin_read(struct device *dev, enum hwmon_sensor_types type,
 		case hwmon_pwm_input:
 			*val = priv->duty_input[channel];
 			break;
+		case hwmon_pwm_enable:
+			*val = priv->pump_source == RYUJIN_SOURCE_USB ? 1 : 2;
+			break;
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -313,6 +330,46 @@ static int rog_ryujin_read_string(struct device *dev, enum hwmon_sensor_types ty
 	return 0;
 }
 
+/*
+ * Send a set cooler duty command. If it changes the pump control source, first
+ * wait until RYUJIN_SOURCE_CHANGE_INTERVAL has passed since the last change,
+ * then wait for the cooler duty report to show the new source, so that success
+ * means the change took effect.
+ */
+static int rog_ryujin_write_cooler_duty(struct rog_ryujin_data *priv, const u8 *set_cmd)
+{
+	unsigned long interval = msecs_to_jiffies(RYUJIN_SOURCE_CHANGE_INTERVAL);
+	u8 source = set_cmd[RYUJIN_SET_COOLER_CHANNEL_OFFSET];
+	unsigned long elapsed, timeout;
+	int ret;
+
+	if (!priv->info->duty_channel || source == priv->pump_source)
+		return rog_ryujin_execute_cmd(priv, set_cmd, SET_CMD_LENGTH,
+					      &priv->cooler_duty_set);
+
+	elapsed = jiffies - priv->source_changed;
+	if (elapsed < interval)
+		msleep(jiffies_to_msecs(interval - elapsed));
+
+	ret = rog_ryujin_execute_cmd(priv, set_cmd, SET_CMD_LENGTH, &priv->cooler_duty_set);
+	if (ret < 0)
+		return ret;
+
+	priv->source_changed = jiffies;
+	timeout = jiffies + msecs_to_jiffies(RYUJIN_SOURCE_CHANGE_TIMEOUT);
+	do {
+		msleep(100);
+		ret = rog_ryujin_execute_cmd(priv, get_cooler_duty_cmd, GET_CMD_LENGTH,
+					     &priv->cooler_duty_received);
+		if (ret < 0)
+			return ret;
+		if (priv->pump_source == source)
+			return 0;
+	} while (time_before(jiffies, timeout));
+
+	return -ETIMEDOUT;
+}
+
 /*
  * On devices with a non-zero duty_channel (the RYUJIN III), the channel byte of
  * the set cooler duty command selects the pump control source.
@@ -345,7 +402,7 @@ static int rog_ryujin_select_pump_source(struct rog_ryujin_data *priv, u8 *set_c
 		return 0;
 
 	set_cmd[RYUJIN_SET_COOLER_PUMP_DUTY_OFFSET] = duty < 100 ? duty + 1 : duty - 1;
-	ret = rog_ryujin_execute_cmd(priv, set_cmd, SET_CMD_LENGTH, &priv->cooler_duty_set);
+	ret = rog_ryujin_write_cooler_duty(priv, set_cmd);
 	set_cmd[RYUJIN_SET_COOLER_PUMP_DUTY_OFFSET] = duty;
 
 	return ret;
@@ -391,7 +448,7 @@ static int rog_ryujin_write_fixed_duty(struct rog_ryujin_data *priv, int channel
 				return ret;
 		}
 
-		return rog_ryujin_execute_cmd(priv, set_cmd, SET_CMD_LENGTH, &priv->cooler_duty_set);
+		return rog_ryujin_write_cooler_duty(priv, set_cmd);
 	} else {
 		/*
 		 * Controller fan duty (channel == 2). No need to retrieve current
@@ -413,6 +470,52 @@ static int rog_ryujin_write_fixed_duty(struct rog_ryujin_data *priv, int channel
 	return 0;
 }
 
+/*
+ * pwm1_enable: 1 hands the pump to pwm1, 2 hands it back to its internal
+ * controller. Both keep the reported duties.
+ */
+static int rog_ryujin_write_pwm_enable(struct rog_ryujin_data *priv, long val)
+{
+	u8 set_cmd[SET_CMD_LENGTH];
+	u8 source;
+	int ret;
+
+	switch (val) {
+	case 1:
+		source = RYUJIN_SOURCE_USB;
+		break;
+	case 2:
+		source = RYUJIN_SOURCE_HEADER;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = rog_ryujin_execute_cmd(priv, get_cooler_duty_cmd, GET_CMD_LENGTH,
+				     &priv->cooler_duty_received);
+	if (ret < 0)
+		return ret;
+
+	if (priv->pump_source == source)
+		return 0;
+
+	memcpy(set_cmd, set_cooler_duty_cmd, SET_CMD_LENGTH);
+	set_cmd[RYUJIN_SET_COOLER_CHANNEL_OFFSET] = source;
+	set_cmd[RYUJIN_SET_COOLER_PUMP_DUTY_OFFSET] =
+	    rog_ryujin_pwm_to_percent(priv->duty_input[0]);
+	set_cmd[RYUJIN_SET_COOLER_FAN_DUTY_OFFSET] =
+	    rog_ryujin_pwm_to_percent(priv->duty_input[1]);
+
+	if (source == RYUJIN_SOURCE_USB) {
+		/* As for a pwm1 write of the reported duty */
+		ret = rog_ryujin_select_pump_source(priv, set_cmd, 0);
+		if (ret < 0)
+			return ret;
+	}
+
+	return rog_ryujin_write_cooler_duty(priv, set_cmd);
+}
+
 static int rog_ryujin_write(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
 			    long val)
 {
@@ -430,6 +533,8 @@ static int rog_ryujin_write(struct device *dev, enum hwmon_sensor_types type, u3
 			if (ret < 0)
 				return ret;
 			break;
+		case hwmon_pwm_enable:
+			return rog_ryujin_write_pwm_enable(priv, val);
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -459,7 +564,7 @@ static const struct hwmon_channel_info *rog_ryujin_info[] = {
 			   HWMON_F_INPUT | HWMON_F_LABEL,
 			   HWMON_F_INPUT | HWMON_F_LABEL),
 	HWMON_CHANNEL_INFO(pwm,
-			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
 			   HWMON_PWM_INPUT,
 			   HWMON_PWM_INPUT),
 	NULL
@@ -596,6 +701,7 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
 	 * a special case there.
 	 */
 	priv->updated = jiffies - msecs_to_jiffies(STATUS_VALIDITY);
+	priv->source_changed = jiffies - msecs_to_jiffies(RYUJIN_SOURCE_CHANGE_INTERVAL);
 
 	ret = hid_parse(hdev);
 	if (ret) {
-- 
2.53.0

