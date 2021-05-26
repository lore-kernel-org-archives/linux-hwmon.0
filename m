Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19F2C47082
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72080613D3
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233940AbhEZPmI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 May 2021 11:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233118AbhEZPmC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 May 2021 11:42:02 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480A7C061574
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:31 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id i14-20020a9d624e0000b029033683c71999so1401305otk.5
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=watCmo8fCeuLjsloSdMLMz/4TONEMVWv4McrOuHPx84=;
        b=Ss096A0X8DDg3U1oX0KIrCnuVu5FOjcRP58hndthBu/rcxUwuMPdbber12udYUb7l8
         fy9+m10g8MHkTLqR1eWEpvGavwkuC9SW6XuXX3lR+weS8R9MR4OXRJWguuLrylzh5aM8
         s3hHPLhKtRThIzApQkpUSrhmeuE+GIaet74sQF0Ly1Qoy/kHAsc++sM4PvqXhGPfeVa/
         X3L+d9twcxTANPfiSoFBjSzljhrvmLT1YesPaiCnua8JH2l7sqLhr8j1irfUG8fgvd0p
         63QKLzndzB8RLXe/s1DFF++L4AhyyblcSmr0qG9pFj+WIpCvHVFF8H9a9Xxj5TR17vdA
         1SUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=watCmo8fCeuLjsloSdMLMz/4TONEMVWv4McrOuHPx84=;
        b=hNJFHB820MQ4YyLwzfklJsy3HiL9rGVQ+qbMnVao/HZWH7QRLQ9CqAKXcvdg7gu0IQ
         DnC71J7axtukhMdwsWSnXjJVS6Lunju8YPWM/ZoUR7JHB22oAcoPHz5LJrRwtkYhKPq0
         n9SSdKxuCWASS05Lewi/J1B1olwIbmz0SI3zjdeDfTqLATiiFkdZAA7//np29hPTGxiy
         c/qSnG8ZScNohtZx5jh5fXjzDvHrGiduQO2rAmDY2OMCTNYFTcdWSsH6yaE9D/TGzD2L
         eOKQiVG4kiDVH7DE1/vq0KJsPCCWawXmTQ2a+to52oVly3zzWk/+VAbT2kEoDI0mZXVt
         Qsfg==
X-Gm-Message-State: AOAM532CT8dGyKA1vP9jOlUkqpsWktS74v+NpZcoFPSEnK0Zu07zBSAQ
        ll+YraDi1GwCGhYtScZizkdey3wOxCg=
X-Google-Smtp-Source: ABdhPJwopoN0SJKzMYHPfawmxvT3S9xeHhB5rznN1jKS8a97ICUAjkRBMgYMKN+iECl33pcNCZzSlw==
X-Received: by 2002:a9d:7852:: with SMTP id c18mr2787034otm.115.1622043630333;
        Wed, 26 May 2021 08:40:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x5sm4349019otg.76.2021.05.26.08.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 08:40:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, jan.kundrat@cesnet.cz,
        kubernat@cesnet.cz, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/7] hwmon: (max31790) Report correct current pwm duty cycles
Date:   Wed, 26 May 2021 08:40:17 -0700
Message-Id: <20210526154022.3223012-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526154022.3223012-1-linux@roeck-us.net>
References: <20210526154022.3223012-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The MAX31790 has two sets of registers for pwm duty cycles, one to request
a duty cycle and one to read the actual current duty cycle. Both do not
have to be the same.

When reporting the pwm duty cycle to the user, the actual pwm duty cycle
from pwm duty cycle registers needs to be reported. When setting it, the
pwm target duty cycle needs to be written. Since we don't know the actual
pwm duty cycle after a target pwm duty cycle has been written, set the
valid flag to false to indicate that actual pwm duty cycle should be read
from the chip instead of using cached values.

Cc: Jan Kundrát <jan.kundrat@cesnet.cz>
Cc: Václav Kubernát <kubernat@cesnet.cz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/max31790.rst | 3 ++-
 drivers/hwmon/max31790.c         | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31790.rst
index f301385d8cef..54ff0f49e28f 100644
--- a/Documentation/hwmon/max31790.rst
+++ b/Documentation/hwmon/max31790.rst
@@ -39,5 +39,6 @@ fan[1-12]_input    RO  fan tachometer speed in RPM
 fan[1-12]_fault    RO  fan experienced fault
 fan[1-6]_target    RW  desired fan speed in RPM
 pwm[1-6]_enable    RW  regulator mode, 0=disabled, 1=manual mode, 2=rpm mode
-pwm[1-6]           RW  fan target duty cycle (0-255)
+pwm[1-6]           RW  read: current pwm duty cycle,
+                       write: target pwm duty cycle (0-255)
 ================== === =======================================================
diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index f6d4fc0a2f13..693497e09ac0 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -104,7 +104,7 @@ static struct max31790_data *max31790_update_device(struct device *dev)
 				data->tach[NR_CHANNEL + i] = rv;
 			} else {
 				rv = i2c_smbus_read_word_swapped(client,
-						MAX31790_REG_PWMOUT(i));
+						MAX31790_REG_PWM_DUTY_CYCLE(i));
 				if (rv < 0)
 					goto abort;
 				data->pwm[i] = rv;
@@ -299,10 +299,10 @@ static int max31790_write_pwm(struct device *dev, u32 attr, int channel,
 			err = -EINVAL;
 			break;
 		}
-		data->pwm[channel] = val << 8;
+		data->valid = false;
 		err = i2c_smbus_write_word_swapped(client,
 						   MAX31790_REG_PWMOUT(channel),
-						   data->pwm[channel]);
+						   val << 8);
 		break;
 	case hwmon_pwm_enable:
 		fan_config = data->fan_config[channel];
-- 
2.25.1

