Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A29C47089
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 842DA613D2
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbhEZPmL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 May 2021 11:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233822AbhEZPmH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 May 2021 11:42:07 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD241C061756
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:33 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so1408548otg.2
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U8hedBk4yeetZrsoFkmz9iu/z3yP6GX2aslPIK8qua0=;
        b=KL0vu/LokOt2L+MCe8+kKLxRFsZZVZb/usZrnJCWirqMs320ZZCVhfwbG9iynJ9XSp
         1QjE5Z80TfjtT98Jf81ymjfRLfdl9XkaK8xWNUzh2DpeIfXEd2ilBqJyCZ0HMLCjVU0l
         d972lyoT5WM2bzpK7FhaOpRD7KKT3WLj6m1E682ZPwKRvjh1kWsWyQYxUHsTu7jT7EoI
         KzihCKxFUYf+wr2HMCXSTnDS1057MmoSGNLXWqREcJ95N51PTnIfvA4b8sG4wUDYAVVO
         aQlp0Wi2Z/rkQtq0Ov3+wRpInqYNtPOsTwBOy/4gJ+4pbSHTnS+Dn5rtcXp23lc6JgEw
         aJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=U8hedBk4yeetZrsoFkmz9iu/z3yP6GX2aslPIK8qua0=;
        b=evIuTuwO0xAsMG779BnpYY00HQASZFnx5eo5iQut2GbeRzmVvJWtm2M6TYge0H3q45
         tYtHKCkq8SAhsXMwRPHAWBEHTImngKH6RpHgor0p9EMFNZLQfLZ4dHKNX5ZHq/tTfOaQ
         aLcwec/hiHzFF1jwMNc/uYsTlp8cMifEpNtX+tZGX0oHoaRKRQ70lFjhJcMEsmD70GFa
         EjGyhH9+ebm/ZEQH3zvxhuQIsYyjOBTXrJXlLDQ3lWB8i/snwNC3zHcxmMAhKnrum/Kb
         b7kiTsU68alGONAXo2qzdiJlYA13VquzK0I/2XHOivP5ncdRRYrUflo8cDkkDWzzC+vD
         0iuQ==
X-Gm-Message-State: AOAM532Vo0OZLU2+/g4HLITCKhdjkjHkoHFUTz1i4bwWiKyjwyzafhfi
        TLZqmXXTxW3EvAvnS4DOI9Ar3wogFf0=
X-Google-Smtp-Source: ABdhPJxcR1gJDnUwXgNEoDdCE/M8Kisugu7NJkqlpR1IrQpKIxn2eNEvX7bTNNc7DM8ubfKfFFkQNg==
X-Received: by 2002:a9d:741a:: with SMTP id n26mr1136822otk.223.1622043632732;
        Wed, 26 May 2021 08:40:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f2sm4440259otp.77.2021.05.26.08.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 08:40:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, jan.kundrat@cesnet.cz,
        kubernat@cesnet.cz, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/7] hwmon: (max31790) Fix pwmX_enable attributes
Date:   Wed, 26 May 2021 08:40:18 -0700
Message-Id: <20210526154022.3223012-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526154022.3223012-1-linux@roeck-us.net>
References: <20210526154022.3223012-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

pwmX_enable supports three possible values:

0: Fan control disabled. Duty cycle is fixed to 0%
1: Fan control enabled, pwm mode. Duty cycle is determined by
   values written into Target Duty Cycle registers.
2: Fan control enabled, rpm mode
   Duty cycle is adjusted such that fan speed matches
   the values in Target Count registers

The current code does not do this; instead, it mixes pwm control
configuration with fan speed monitoring configuration. Worse, it
reports that pwm control would be disabled (pwmX_enable==0) when
it is in fact enabled in pwm mode. Part of the problem may be that
the chip sets the "TACH input enable" bit on its own whenever the
mode bit is set to RPM mode, but that doesn't mean that "TACH input
enable" accurately reflects the pwm mode.

Fix it up and only handle pwm control with the pwmX_enable attributes.
In the documentation, clarify that disabling pwm control (pwmX_enable=0)
sets the pwm duty cycle to 0%. In the code, explain why TACH_INPUT_EN
is set together with RPM_MODE.

While at it, only update the configuration register if the configuration
has changed, and only update the cached configuration if updating the
chip configuration was successful.

Cc: Jan Kundrát <jan.kundrat@cesnet.cz>
Cc: Václav Kubernát <kubernat@cesnet.cz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/max31790.rst |  2 +-
 drivers/hwmon/max31790.c         | 41 ++++++++++++++++++++------------
 2 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31790.rst
index 54ff0f49e28f..7b097c3b9b90 100644
--- a/Documentation/hwmon/max31790.rst
+++ b/Documentation/hwmon/max31790.rst
@@ -38,7 +38,7 @@ Sysfs entries
 fan[1-12]_input    RO  fan tachometer speed in RPM
 fan[1-12]_fault    RO  fan experienced fault
 fan[1-6]_target    RW  desired fan speed in RPM
-pwm[1-6]_enable    RW  regulator mode, 0=disabled, 1=manual mode, 2=rpm mode
+pwm[1-6]_enable    RW  regulator mode, 0=disabled (duty cycle=0%), 1=manual mode, 2=rpm mode
 pwm[1-6]           RW  read: current pwm duty cycle,
                        write: target pwm duty cycle (0-255)
 ================== === =======================================================
diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 693497e09ac0..67677c437768 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -27,6 +27,7 @@
 
 /* Fan Config register bits */
 #define MAX31790_FAN_CFG_RPM_MODE	0x80
+#define MAX31790_FAN_CFG_CTRL_MON	0x10
 #define MAX31790_FAN_CFG_TACH_INPUT_EN	0x08
 #define MAX31790_FAN_CFG_TACH_INPUT	0x01
 
@@ -271,12 +272,12 @@ static int max31790_read_pwm(struct device *dev, u32 attr, int channel,
 		*val = data->pwm[channel] >> 8;
 		return 0;
 	case hwmon_pwm_enable:
-		if (fan_config & MAX31790_FAN_CFG_RPM_MODE)
+		if (fan_config & MAX31790_FAN_CFG_CTRL_MON)
+			*val = 0;
+		else if (fan_config & MAX31790_FAN_CFG_RPM_MODE)
 			*val = 2;
-		else if (fan_config & MAX31790_FAN_CFG_TACH_INPUT_EN)
-			*val = 1;
 		else
-			*val = 0;
+			*val = 1;
 		return 0;
 	default:
 		return -EOPNOTSUPP;
@@ -307,23 +308,33 @@ static int max31790_write_pwm(struct device *dev, u32 attr, int channel,
 	case hwmon_pwm_enable:
 		fan_config = data->fan_config[channel];
 		if (val == 0) {
-			fan_config &= ~(MAX31790_FAN_CFG_TACH_INPUT_EN |
-					MAX31790_FAN_CFG_RPM_MODE);
+			fan_config |= MAX31790_FAN_CFG_CTRL_MON;
+			/*
+			 * Disable RPM mode; otherwise disabling fan speed
+			 * monitoring is not possible.
+			 */
+			fan_config &= ~MAX31790_FAN_CFG_RPM_MODE;
 		} else if (val == 1) {
-			fan_config = (fan_config |
-				      MAX31790_FAN_CFG_TACH_INPUT_EN) &
-				     ~MAX31790_FAN_CFG_RPM_MODE;
+			fan_config &= ~(MAX31790_FAN_CFG_CTRL_MON | MAX31790_FAN_CFG_RPM_MODE);
 		} else if (val == 2) {
-			fan_config |= MAX31790_FAN_CFG_TACH_INPUT_EN |
-				      MAX31790_FAN_CFG_RPM_MODE;
+			fan_config &= ~MAX31790_FAN_CFG_CTRL_MON;
+			/*
+			 * The chip sets MAX31790_FAN_CFG_TACH_INPUT_EN on its
+			 * own if MAX31790_FAN_CFG_RPM_MODE is set.
+			 * Do it here as well to reflect the actual register
+			 * value in the cache.
+			 */
+			fan_config |= (MAX31790_FAN_CFG_RPM_MODE | MAX31790_FAN_CFG_TACH_INPUT_EN);
 		} else {
 			err = -EINVAL;
 			break;
 		}
-		data->fan_config[channel] = fan_config;
-		err = i2c_smbus_write_byte_data(client,
-					MAX31790_REG_FAN_CONFIG(channel),
-					fan_config);
+		if (fan_config != data->fan_config[channel]) {
+			err = i2c_smbus_write_byte_data(client, MAX31790_REG_FAN_CONFIG(channel),
+							fan_config);
+			if (!err)
+				data->fan_config[channel] = fan_config;
+		}
 		break;
 	default:
 		err = -EOPNOTSUPP;
-- 
2.25.1

