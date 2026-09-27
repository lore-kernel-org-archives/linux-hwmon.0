Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAF83D524F
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 12:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510977; cv=none; b=NRk+9kmReZg/eMZXAsP0YiCM92WpRRJn71K2iShuVzbVu3VywPEIW5zRkiyJgYG94LMTXjc+BzNaXoQ7tnvabUC5mwnt1uOLMgRHQcPM0sEF7XL/JTDZOxFuylu9hdCCXQQKoF14Hcv5tQd6d0bb1Eq52ZYMwCxB5M2reWgMsmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510977; c=relaxed/simple;
	bh=yxb3Xqf3wQqJqn2mjOayEr2BhXln3uwghi4aUKOgxoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ClUs1hC7kB6h/a+FSvrwnxBJdWwPZ7hjTeRIhXSAMxJ1pZIa1eWg5eZa0/33CEz0bbvZW7UfTkBljuQSytPdXdSLl1NwCZghN7jS08DsndO6VpYJflex9ApbV/GkG24kopXnkp6Ti9D0YUPE+cLKrQb9rELxNg9K123+9bIcnX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcFeCpzj; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcFeCpzj"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5332048323bso11875161cf.1
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790510974; x=1791115774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cjl+Kww8RPfDcXEiz8Dv5MschylbfBDVv5QF74nNm7w=;
        b=RcFeCpzjop6/ZS5XYYIogqSe4ct8ZAtszxg0hCV3oEPRWqoluzNXrQ/xHSAZ4VOCzo
         M9vH+kwY8njXe4uvbEzxbw1MS9fMkiu0GLFk7fAe3JUEfxizum36CS117q1FQKbrWLHC
         iM05ICvhOCzzle4IopA7E7QXLJADNFLz8/y9k3TdMKvNGCS4EkPpiZRxieaBd4vW48VQ
         a6bM1ipVaPoXEO7iYBjxl2iv0SUsi8pZglqmAM2edRRQTRhb/QR9VihwNOlgjcg7iLgY
         Vrzyg4b7TuYyGcqexWRavHeRFqu+VNlgRe/mwUFwWIH31QAvgmDgImNJszQ/9NL0mx/h
         jE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790510974; x=1791115774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cjl+Kww8RPfDcXEiz8Dv5MschylbfBDVv5QF74nNm7w=;
        b=wrFW5N3u465P5pgSAAnzUXgxPbHqeAIE8aNGHHYzaxiU/TE4Xg/p2/nh5RFGGKK9IL
         ePm+NKdk5VUoJY+z77k2VgzmNgU0ZBQ0YkG5/C2P4CmriZZKktc71I//VeJfHYbfXysP
         1EzsTcOhoQHawgVfU+prT2ZStKOOQ1Z/QWfEbta2frKJhW5tMw7gCPbZqU3sj4ypdI+0
         U9Bqfku2NA4IpjdkyEmIbRt2+pIku1PoMqQ+Bl6N0J/QKZs6GStlijPYNsTljkyVb4rV
         PX+oFoEVobQSKfvRBKdKiANdiVeKlNOGYCRU9woxpkEpS8+NF1HlPWCBOplLhlTl+J79
         Dugw==
X-Gm-Message-State: AFuF++mmmYLUdnwjSKjwcmn/fB7PJX4FTG7wSKVq6m/JPg2s7sZwuI+G
	/+zBbpc17U56GP1e0pVeQWvM+MSPguBo/gwVEEW3og+jh9yaa4HORXj/Airw3Y1cqVI=
X-Gm-Gg: AYBFou1MMsZs/QPPvGfUSGaVtW9u8NBvA7fqLWgdH39PBxg0+y2u1mhlDy0yuuVdsxE
	6RelIrtQjCD3zqyaApnbauXYDMQ4R1K0WyGjmZRtvAuBpcygtQRiVMJWCoB3gs9MUdf6MmnM/la
	vo6DerNeKW0bgp14yIcE4tnaE2pNdRMSfurAqGzpfjtzDaAS6p8bTgw5RqgjvfIWQ7i5ZJCTs7b
	tcETSoDA7fJE5NRl/TTIf/HWQCVQ97YNZsNfM7tTf2PfDT+LmpqUc2UyuVyOC7UouaU6fxuav0I
	uo43TScFle0fhxyHns+v7Q84ZU8L9cHvYdOw4vNA+KcynN/DuyaI0nwtM5jfokIZwmqdc837Rww
	L0zM5ZThZyncg3unP+c6rvU7s051sUHD5FIboIQZp4P1MNQ/fLrR12H65Yo0XRkNumOOMEwjSoU
	7qlQMsvZfEBUt1d60tZlDhNuZbZrLe9GyapLELeCd5vSB2ucLl0YeWjIi3E8bweL853EMogftTN
	PYkHIp5s9TYX7HnGE69g8WX1vkNeMfHbPk3KxNvj7i9zqb0sNCEcwc=
X-Received: by 2002:a05:622a:4805:b0:532:aac4:7c5 with SMTP id d75a77b69052e-5330b590eadmr157187211cf.16.1790510973545;
        Sun, 27 Sep 2026 05:09:33 -0700 (PDT)
Received: from Z-System.tailddad04.ts.net (c-68-83-199-219.hsd1.mi.comcast.net. [68.83.199.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533222585a1sm39538581cf.11.2026.09.27.05.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:09:33 -0700 (PDT)
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
Subject: [PATCH 2/2] hwmon: (asus_rog_ryujin) Add pwm1_enable for the Ryujin III pump
Date: Sun, 27 Sep 2026 08:09:27 -0400
Message-ID: <20260927120927.72810-3-lanzonza@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927120927.72810-1-lanzonza@gmail.com>
References: <20260927120927.72810-1-lanzonza@gmail.com>
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
it (5 of 5). Its duty report showed a change within 1.06 s of the
command in every trial. So a write that changes the source now waits
until 1 s has passed since the previous change, then polls the duty
report every 100 ms until it shows the new source, and fails with
-ETIMEDOUT after 2 s. pump_source is only taken from the report. Other
writes are unaffected.

Measured on a RYUJIN III 360 (firmware AURJ2-S750-0108) with the pump
cable on AIO_PUMP and the header PWM set through nct6775 (pump rpm):

                                     header 50%  header 80%  pwm1_enable
  driver loaded, internal controller    2160        3105          2
  pwm1 = 40%                            1740        1740          1
  pwm1_enable = 2                       2130        3090          2
  pwm1_enable = 1                       1740        1740          1
  pwm1_enable = 2, then pwm1 = 60%      2475                      1
  driver reloaded, pump on USB          1740        1740          1

Written back to back, each source change took 0.94 to 1.11 s, and the
sequences ended as requested in 2 of 2 runs each: pwm1_enable = 2 then
pwm1 = 60% with the pump at 60% on USB, pwm1_enable = 1, 2, 1 on USB,
and pwm1 = 60% then pwm1_enable = 2 on the internal controller.

From power-on, with the header at 100%, pwm1_enable read 2, read 1
after pwm1 = 40% (pump at 1710 rpm), and writing 2 handed the pump back
to its internal controller (3585 rpm).

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Zac Lanzon <lanzonza@gmail.com>
---
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
index ba188e86793..c89d854b2ae 100644
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
+	u8 source = set_cmd[RYUJIN_SET_COOLER_CHANNEL_OFFSET];
+	unsigned long now, next, timeout;
+	int ret;
+
+	if (!priv->info->duty_channel || source == priv->pump_source)
+		return rog_ryujin_execute_cmd(priv, set_cmd, SET_CMD_LENGTH,
+					      &priv->cooler_duty_set);
+
+	now = jiffies;
+	next = priv->source_changed + msecs_to_jiffies(RYUJIN_SOURCE_CHANGE_INTERVAL);
+	if (time_before(now, next))
+		msleep(jiffies_to_msecs(next - now));
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

