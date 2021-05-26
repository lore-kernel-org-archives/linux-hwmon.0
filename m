Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A395FC47082
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EB2F613D3
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 15:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbhEZPmQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 May 2021 11:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233869AbhEZPmK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 May 2021 11:42:10 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA777C061574
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:35 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id z3so1907395oib.5
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 08:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BBj9NClBcqXHysiSl1PnhElCZCyKHyP2g6naC5gjE64=;
        b=PAFjoKYFMBVIhkA8/W0yNBv0RapqHTrCz4r8d2kShGkahoQ84EnhiHcYQKS7UBGxf0
         Ox1gC9Z0HR+9oGVhmltnZaWltw29ckLtwQFL+x5hDK+yKZzlxjTEKT59lOu7ECCoVSfy
         5K7HKsGEgQhupPklWhG8pSU44WIbv/CGF9uFyrNoCMReq9Qx+wptwn3keYRclE02JTMw
         fzh+3UApS5aoMK0GM7qD6uApCGTQX4JKR864KhoBFV4Zv1i/z/sxpHdrVJN3LLcHnHaR
         EwTzLc5tchPWe2gLUpfq9IvPqECirWAqaspFMbSI7PqA8wBFo6UQgBMwNXweLLB2jAB8
         iyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=BBj9NClBcqXHysiSl1PnhElCZCyKHyP2g6naC5gjE64=;
        b=cbkN4E0QTqrZCoH0NpVx74zJdWxiTy3kHLA49ncU9ZwFwm+Ryzj6QCGyZ0xcOH43xa
         g71Gvc/30QA4/ZAjKfFmwDDuBSh/YmFBpLipW7oH2Ayi/xaa/2MtlYFa9Qw3Tvc0FZvu
         lliYwiWl90V/Huj+h9zohUsh8CRrHQrpWoWNUgHXmXOhoOPMq5Y9sS42F1QVMCj59UO5
         KGv5+rcT5xnLpx4zXE5T05nOA7N3Dc/LRRa3Y/2ToJVMK1pD0dGERdOPn9qlHCy2qm/+
         NNCq6m2Ye8WWKIKPlIBOT3Sm8i9+icPWkkiTdq4THEnUR0dXyXC+ghgdRBDWQPZgNTox
         DVCQ==
X-Gm-Message-State: AOAM533VqMzTvKZiZvoRkkLJOKTn5cMGQSUWXPUhbhXXA6f7Jip3UPtV
        cvI4SgW/muk40lRVc6cQi46wJ7HJqKg=
X-Google-Smtp-Source: ABdhPJw/VmZiAr+70HfgpskUH6nj3fcOieXHcTO0JQaYF1qwjNGM3Y6V0Vwcm4me555jTf+gXtp0WA==
X-Received: by 2002:a05:6808:1404:: with SMTP id w4mr2438415oiv.53.1622043634833;
        Wed, 26 May 2021 08:40:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f13sm4660002ote.46.2021.05.26.08.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 08:40:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, jan.kundrat@cesnet.cz,
        kubernat@cesnet.cz, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/7] hwmon: (max31790) Add support for fanX_enable attributes
Date:   Wed, 26 May 2021 08:40:19 -0700
Message-Id: <20210526154022.3223012-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526154022.3223012-1-linux@roeck-us.net>
References: <20210526154022.3223012-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Since pwmX_enable is now fixed and only handles pwm support instead
of also enabling/disabling fan tachometers, we need an explicit means
to do that.

For fan channels 7..12, display the enable status if the channel
is configured for fan speed reporting. The displayed status matches
the value of the companion channel but is read-only.

Cc: Jan Kundrát <jan.kundrat@cesnet.cz>
Cc: Václav Kubernát <kubernat@cesnet.cz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/max31790.rst |  3 ++
 drivers/hwmon/max31790.c         | 55 ++++++++++++++++++++++++--------
 2 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31790.rst
index 7b097c3b9b90..b43aa32813fd 100644
--- a/Documentation/hwmon/max31790.rst
+++ b/Documentation/hwmon/max31790.rst
@@ -35,6 +35,9 @@ Sysfs entries
 -------------
 
 ================== === =======================================================
+fan[1-12]_enable   RW  0=disable fan speed monitoring, 1=enable fan speed monitoring
+                       The value is RO for companion channels (7-12). For those
+                       channels, the value matches the value of the primary channel.
 fan[1-12]_input    RO  fan tachometer speed in RPM
 fan[1-12]_fault    RO  fan experienced fault
 fan[1-6]_target    RW  desired fan speed in RPM
diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 67677c437768..19651feb40fb 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -170,6 +170,9 @@ static int max31790_read_fan(struct device *dev, u32 attr, int channel,
 		return PTR_ERR(data);
 
 	switch (attr) {
+	case hwmon_fan_enable:
+		*val = !!(data->fan_config[channel % NR_CHANNEL] & MAX31790_FAN_CFG_TACH_INPUT_EN);
+		return 0;
 	case hwmon_fan_input:
 		sr = get_tach_period(data->fan_dynamics[channel % NR_CHANNEL]);
 		rpm = RPM_FROM_REG(data->tach[channel], sr);
@@ -195,12 +198,32 @@ static int max31790_write_fan(struct device *dev, u32 attr, int channel,
 	struct i2c_client *client = data->client;
 	int target_count;
 	int err = 0;
-	u8 bits;
+	u8 bits, config;
 	int sr;
 
 	mutex_lock(&data->update_lock);
 
 	switch (attr) {
+	case hwmon_fan_enable:
+		config = data->fan_config[channel];
+		if (val == 0) {
+			/* Disabling TACH_INPUT_EN has no effect in RPM_MODE */
+			if (!(config & MAX31790_FAN_CFG_RPM_MODE))
+				config &= ~MAX31790_FAN_CFG_TACH_INPUT_EN;
+		} else if (val == 1) {
+			config |= MAX31790_FAN_CFG_TACH_INPUT_EN;
+		} else {
+			err = -EINVAL;
+			break;
+		}
+		if (config != data->fan_config[channel]) {
+			err = i2c_smbus_write_byte_data(client,
+							MAX31790_REG_FAN_CONFIG(channel),
+							config);
+			if (!err)
+				data->fan_config[channel] = config;
+		}
+		break;
 	case hwmon_fan_target:
 		val = clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
 		bits = bits_for_tach_period(val);
@@ -240,6 +263,12 @@ static umode_t max31790_fan_is_visible(const void *_data, u32 attr, int channel)
 	u8 fan_config = data->fan_config[channel % NR_CHANNEL];
 
 	switch (attr) {
+	case hwmon_fan_enable:
+		if (channel < NR_CHANNEL)
+			return 0644;
+		if (fan_config & MAX31790_FAN_CFG_TACH_INPUT)
+			return 0444;
+		return 0;
 	case hwmon_fan_input:
 	case hwmon_fan_fault:
 		if (channel < NR_CHANNEL ||
@@ -404,18 +433,18 @@ static umode_t max31790_is_visible(const void *data,
 
 static const struct hwmon_channel_info *max31790_info[] = {
 	HWMON_CHANNEL_INFO(fan,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT),
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT),
 	HWMON_CHANNEL_INFO(pwm,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-- 
2.25.1

