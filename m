Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052DEC47089
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1109613D3
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhEZPmS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 May 2021 11:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234282AbhEZPmN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 May 2021 11:42:13 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6063BC061574
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:41 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so1432266oto.0
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mf7rp2yxur4tzrYtSCdYs49YjVU5xM01obCPMruWP6c=;
        b=CoGeqg+QVY1bATKgfxXaoBeDhlb/QzOKcSUWn5lu6xdszLIS+9SeMnVeYm8EXnbTD6
         /efdoYMYbGtCD8Fm+kc35rX+TKCpLd1KQt/i4MOPui7iYlcSDo+F5VaW3aprDF+PhgQJ
         94rAhJO4azUxgg6ZRdW9Bcnkg4UYKW4lfl3hJnXEABJG6tEqWZYnWUTCM4V0nEnwB10+
         jL8YZFawSkjn0+x4G5AXMuUOBBpxrUC0C4myjYC0niytztXGBYKX7zgOqxr2xyljLA7u
         CEk3KCR7YmCRL7vgNd/H25MOuEamqTRPC18bwK22Bcu+S3Mu4em/qu1cC4kYENLaaPOH
         52yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=mf7rp2yxur4tzrYtSCdYs49YjVU5xM01obCPMruWP6c=;
        b=HGoHAj+UzSuWqQj79rQVix33W1PLBI0N1gtHE60LlIqN36LLcTAW6iK2p20Ms8V5JU
         Pksr4CuBrob+FM8YxJBb57MJZ8Zb+6haDy2Gb6GUnvkb2xFaBUUYzydOvBTuiufQkCPT
         DreZbELdQAvfroJNa3GkQMQW7Npy/0wN/pvzEFVR3bkPpQ21+jq3/9gw5q/9OXMQ23x5
         YeCPzcxr4fNBZLT611NDFwWZgB1wsl4AwRLZp/p9Xb0buSwH0+WSdWi4BkEP1k7hTL++
         bXJ1dpr79o4Fa8iM2gFfX8pxxQIcp8WezvJQgLpvMe+hY8EC09poBn0MszpIJBZV2X6V
         NfrQ==
X-Gm-Message-State: AOAM530WiNT6uIimnx9vx1hPM7ol0WW6ORTi19AqO8wd2gOIJFLaYfDD
        m3Ls19yvqxehVTIO2ShhgzOFGEK7BU4=
X-Google-Smtp-Source: ABdhPJxnq5HWi9sE7ZwaMtEn4LlDPiF3EozaReooZPhlLiHQe8o+oe94vQ1RpT65Fbn9HmdVjwOKaw==
X-Received: by 2002:a9d:4b9c:: with SMTP id k28mr2942839otf.183.1622043640420;
        Wed, 26 May 2021 08:40:40 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v8sm3833955oiv.5.2021.05.26.08.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 08:40:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, jan.kundrat@cesnet.cz,
        kubernat@cesnet.cz, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 7/7] hwmon: (max31790) Add support for fanX_min attributes
Date:   Wed, 26 May 2021 08:40:22 -0700
Message-Id: <20210526154022.3223012-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526154022.3223012-1-linux@roeck-us.net>
References: <20210526154022.3223012-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The minimum fan speed is closely correlated to the target fan speed.
The correlation depends on the pwm mode. It is essential to be able
to read and to set it to be able to control when a channel will report
a fan fault.

Since the minimum fan speed also applies to channels 7..12, make it
visible but read-only for those channels as well.

Cc: Jan Kundrát <jan.kundrat@cesnet.cz>
Cc: Václav Kubernát <kubernat@cesnet.cz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/max31790.rst |  9 ++++
 drivers/hwmon/max31790.c         | 70 ++++++++++++++++++++++++--------
 2 files changed, 61 insertions(+), 18 deletions(-)

diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31790.rst
index b43aa32813fd..9225c2a78b68 100644
--- a/Documentation/hwmon/max31790.rst
+++ b/Documentation/hwmon/max31790.rst
@@ -40,6 +40,15 @@ fan[1-12]_enable   RW  0=disable fan speed monitoring, 1=enable fan speed monito
                        channels, the value matches the value of the primary channel.
 fan[1-12]_input    RO  fan tachometer speed in RPM
 fan[1-12]_fault    RO  fan experienced fault
+fan[1-12]_min      RW  minimum fan speed in RPM. Equivalent to target fan speed
+                       in PWM mode and if PWM support is disabled for a channel.
+                       Equivalent to half the target fan speed in RPM mode.
+                       The value is RO for companion channels (7-12). For those
+                       channels, the value matches the value of the primary channel.
+                       Note: In RPM mode, if the pwm duty cycle is 100%, the
+                       minimum fan speed is equivalent to the target fan speed,
+                       and the chip will report a fault condition if the fan
+                       speed is below the target fan speed.
 fan[1-6]_target    RW  desired fan speed in RPM
 pwm[1-6]_enable    RW  regulator mode, 0=disabled (duty cycle=0%), 1=manual mode, 2=rpm mode
 pwm[1-6]           RW  read: current pwm duty cycle,
diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 91fe419b596c..db97ee99515a 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -111,13 +111,11 @@ static struct max31790_data *max31790_update_device(struct device *dev)
 				if (rv < 0)
 					goto abort;
 				data->pwm[i] = rv;
-
-				rv = i2c_smbus_read_word_swapped(client,
-						MAX31790_REG_TARGET_COUNT(i));
-				if (rv < 0)
-					goto abort;
-				data->target_count[i] = rv;
 			}
+			rv = i2c_smbus_read_word_swapped(client, MAX31790_REG_TARGET_COUNT(i));
+			if (rv < 0)
+				goto abort;
+			data->target_count[i] = rv;
 		}
 
 		data->last_updated = jiffies;
@@ -183,6 +181,21 @@ static int max31790_read_fan(struct device *dev, u32 attr, int channel,
 			rpm = RPM_FROM_REG(data->tach[channel], sr);
 		*val = rpm;
 		return 0;
+	case hwmon_fan_min:
+		channel %= NR_CHANNEL;
+		sr = get_tach_period(data->fan_dynamics[channel]);
+		if (!(data->fan_config[channel] & MAX31790_FAN_CFG_RPM_MODE) ||
+		    (data->fan_config[channel] & MAX31790_FAN_CFG_TACH_INPUT)) {
+			/* pwm mode: target == min */
+			rpm = RPM_FROM_REG(data->target_count[channel], sr);
+		} else {
+			/* rpm mode: min tach count is twice target count */
+			u16 tach = min(data->target_count[channel] * 2, FAN_COUNT_REG_MAX);
+
+			rpm = RPM_FROM_REG(tach, sr);
+		}
+		*val = rpm;
+		return 0;
 	case hwmon_fan_target:
 		sr = get_tach_period(data->fan_dynamics[channel]);
 		rpm = RPM_FROM_REG(data->target_count[channel], sr);
@@ -243,6 +256,20 @@ static int max31790_write_fan(struct device *dev, u32 attr, int channel,
 				data->fan_config[channel] = config;
 		}
 		break;
+	case hwmon_fan_min:
+		/*
+		 * The minimum fan speed is the same as the target fan speed in
+		 * PWM mode and if a PWM channel is disabled, or it is half the
+		 * target fan speed in RPM mode.
+		 */
+		if (!(data->fan_config[channel] & MAX31790_FAN_CFG_TACH_INPUT) &&
+		    (data->fan_config[channel] & MAX31790_FAN_CFG_RPM_MODE)) {
+			/* partial clamp to avoid overflow */
+			if (val > FAN_RPM_MAX / 2)
+				val = FAN_RPM_MAX / 2;
+			val *= 2;
+		}
+		fallthrough;
 	case hwmon_fan_target:
 		val = clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
 		bits = bits_for_tach_period(val);
@@ -282,6 +309,7 @@ static umode_t max31790_fan_is_visible(const void *_data, u32 attr, int channel)
 	u8 fan_config = data->fan_config[channel % NR_CHANNEL];
 
 	switch (attr) {
+	case hwmon_fan_min:
 	case hwmon_fan_enable:
 		if (channel < NR_CHANNEL)
 			return 0644;
@@ -452,18 +480,24 @@ static umode_t max31790_is_visible(const void *data,
 
 static const struct hwmon_channel_info *max31790_info[] = {
 	HWMON_CHANNEL_INFO(fan,
-			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT),
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_TARGET |
+				HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_TARGET |
+				HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_TARGET |
+				HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_TARGET |
+				HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_TARGET |
+				HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_TARGET |
+				HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_FAULT),
 	HWMON_CHANNEL_INFO(pwm,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-- 
2.25.1

