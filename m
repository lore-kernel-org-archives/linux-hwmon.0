Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A426ECAAA2
	for <linux-hwmon@archiver.kernel.org>; Mon, 29 Aug 2022 02:44:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiH2Co3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 28 Aug 2022 22:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiH2Co2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 28 Aug 2022 22:44:28 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3593C8EF
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Aug 2022 19:44:27 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id z18-20020a170903019200b00172dd6da065so5332748plg.14
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Aug 2022 19:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc;
        bh=qjyzIwXVkUkDf0UkZRUU6V68vw5g1IkZe/Jh8oGPdDI=;
        b=U/94KM9NXpZmSc+hMYxHzYRtgMrfoxaVSJnIDlIjpVuok4Zafd/uo0FByTZzwm8ECh
         cQeGCS7/yGLJTTEjsItsDQuL3o2E/KwhruL7/3LlOtt05TFeyj26v/ULKaaa4q/XuUVY
         7Fhd2U5nFDMKGztQY9fys/FVlErdiHb8urBk4Ge5vbT8OfafJ4GhXK2nBS4E6nZl32TF
         giOmkMrtFvFrd+97rdjYqU5TVZEXNoDj7vhJ0tKB/ZOgSlWanSlI0qyVMBkMe0e/t7H6
         PKhGCjz4CpgJetSeM0BJCZoKrjCUFJYPRAbudlwYiTXei5veMJOuyvWl+sh5T56sOieD
         nN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc;
        bh=qjyzIwXVkUkDf0UkZRUU6V68vw5g1IkZe/Jh8oGPdDI=;
        b=OUoulEzEZPibkqixiPyU2RK59ovZi9OkJaiRPYrT7SE6M7xx5ErxKTLRGUNyOSR3ux
         AoeKV4ALarXiZVOcKhFqIriRwvGsMwiMHVLhLWFui7ZPa7XQ9XgYL53nsZ3vDBMIXgS5
         iRZJx42O1Z4gArPbCSfTk9A4MSvvMJ92BQrG9rmKkqr2/CPjwrbVyYdcZNBrUrotb8AS
         6Bx/6tikfaLDcSIAGZmemB0v3P1kPmDKfAr7F1k0Cz2oLYos7AdT/L8ZsUTkkozC9tse
         acCO0Dh+z57yKdr0J7KXs3NSFBP32j/Eyyu5FdcsYOFj8f48/JxvNmQlyi9E34U81857
         5YlQ==
X-Gm-Message-State: ACgBeo0zrRRm66hBm0/taYigH9MolcEjeYBTIH2EuXc4fa6eI9qu+Ewf
        3aaEGY+JJb4SzOEWVAskh3ehwmtFLnJ0DtawW4BU
X-Google-Smtp-Source: AA6agR7r5/L5GlvHoc8ZBtvWtojvBBJBXTNkhaXq8PbOl5fMYh4tW7cqCJv7wXyaphWAu0fbcTKiq/EP9RYMga8xn02b
X-Received: from jsl.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cdb])
 (user=justinledford job=sendgmr) by 2002:a05:6a00:1a44:b0:528:6af7:ff4a with
 SMTP id h4-20020a056a001a4400b005286af7ff4amr14728709pfv.78.1661741066972;
 Sun, 28 Aug 2022 19:44:26 -0700 (PDT)
Date:   Mon, 29 Aug 2022 02:43:51 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829024351.2415147-1-justinledford@google.com>
Subject: [PATCH] hwmon: (max31790) add fanN_enable
From:   Justin Ledford <justinledford@google.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Justin Ledford <justinledford@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The MAX31790 has a tach input enable bit in each fan's configuration
register. This is only enabled by the driver if RPM mode is selected,
but the driver doesn't provide a way to independently enable tachometer
input regardless of the regulator mode.

By adding the fanN_enable sysfs files, we can decouple the tach input
from the regulator mode. Also update the documentation.

Signed-off-by: Justin Ledford <justinledford@google.com>
---
 Documentation/hwmon/max31790.rst |  1 +
 drivers/hwmon/max31790.c         | 44 +++++++++++++++++++++++++++-----
 2 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31790.rst
index 7b097c3b9b90..33c5c7330efc 100644
--- a/Documentation/hwmon/max31790.rst
+++ b/Documentation/hwmon/max31790.rst
@@ -38,6 +38,7 @@ Sysfs entries
 fan[1-12]_input    RO  fan tachometer speed in RPM
 fan[1-12]_fault    RO  fan experienced fault
 fan[1-6]_target    RW  desired fan speed in RPM
+fan[1-6]_enable    RW  enable or disable the tachometer input
 pwm[1-6]_enable    RW  regulator mode, 0=disabled (duty cycle=0%), 1=manual mode, 2=rpm mode
 pwm[1-6]           RW  read: current pwm duty cycle,
                        write: target pwm duty cycle (0-255)
diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 7e9362f6dc29..3ae02be4b41e 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -118,6 +118,12 @@ static struct max31790_data *max31790_update_device(struct device *dev)
 					goto abort;
 				data->target_count[i] = rv;
 			}
+
+			rv = i2c_smbus_read_byte_data(client,
+					MAX31790_REG_FAN_CONFIG(i));
+			if (rv < 0)
+				goto abort;
+			data->fan_config[i] = rv;
 		}
 
 		data->last_updated = jiffies;
@@ -202,6 +208,9 @@ static int max31790_read_fan(struct device *dev, u32 attr, int channel,
 		}
 		mutex_unlock(&data->update_lock);
 		return 0;
+	case hwmon_fan_enable:
+		*val = !!(data->fan_config[channel] & MAX31790_FAN_CFG_TACH_INPUT_EN);
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -214,7 +223,7 @@ static int max31790_write_fan(struct device *dev, u32 attr, int channel,
 	struct i2c_client *client = data->client;
 	int target_count;
 	int err = 0;
-	u8 bits;
+	u8 bits, fan_config;
 	int sr;
 
 	mutex_lock(&data->update_lock);
@@ -243,6 +252,23 @@ static int max31790_write_fan(struct device *dev, u32 attr, int channel,
 					MAX31790_REG_TARGET_COUNT(channel),
 					data->target_count[channel]);
 		break;
+	case hwmon_fan_enable:
+		fan_config = data->fan_config[channel];
+		if (val == 0) {
+			fan_config &= ~MAX31790_FAN_CFG_TACH_INPUT_EN;
+		} else if (val == 1) {
+			fan_config |= MAX31790_FAN_CFG_TACH_INPUT_EN;
+		} else {
+			err = -EINVAL;
+			break;
+		}
+		if (fan_config != data->fan_config[channel]) {
+			err = i2c_smbus_write_byte_data(client, MAX31790_REG_FAN_CONFIG(channel),
+							fan_config);
+			if (!err)
+				data->fan_config[channel] = fan_config;
+		}
+		break;
 	default:
 		err = -EOPNOTSUPP;
 		break;
@@ -270,6 +296,10 @@ static umode_t max31790_fan_is_visible(const void *_data, u32 attr, int channel)
 		    !(fan_config & MAX31790_FAN_CFG_TACH_INPUT))
 			return 0644;
 		return 0;
+	case hwmon_fan_enable:
+		if (channel < NR_CHANNEL)
+			return 0644;
+		return 0;
 	default:
 		return 0;
 	}
@@ -423,12 +453,12 @@ static umode_t max31790_is_visible(const void *data,
 
 static const struct hwmon_channel_info *max31790_info[] = {
 	HWMON_CHANNEL_INFO(fan,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
-- 
2.37.2.672.g94769d06f0-goog

