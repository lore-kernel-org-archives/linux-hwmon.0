Return-Path: <SRS0=nJvH=AY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C1DC433DF
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jul 2020 19:32:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B20A12068F
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jul 2020 19:32:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UN+G+4bG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgGMTcq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Jul 2020 15:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgGMTcp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jul 2020 15:32:45 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61DE8C061755;
        Mon, 13 Jul 2020 12:32:45 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id o18so18679215eje.7;
        Mon, 13 Jul 2020 12:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=19x8MNwEHN9x5QRgLvfQAa5L6rMotMwU5KchkSUnZWg=;
        b=UN+G+4bGCqNu0Uc3Gy33gagbEqSXFVCeENKScn9wSAZDN8N59L8IA2qa1V+BRaFLvW
         wq/djS9u6u638unsHuNw4CG0dggHerYgc/VnwBbVD0AoMfhTh3K29YJzwb/hPFTg91nB
         /mIRmA6TF4h70+NM2wN85ocFZxIRW9wVYzO2sewHHTZ+s5c2b2Qv/OYdhg8fK7iJbWZo
         9p1z0auVsc6v0i03Bg3ONTlbNROjL22jdya+vMzjUYRnyJK3vPXu71adx436A18olNPN
         hqkt83Vfzmj4wvyqIAOOWxIk/05mn8UpXPKrhj9LIxdOb+nOc5sDZFY6ZqvB/dIF4kmU
         8c2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=19x8MNwEHN9x5QRgLvfQAa5L6rMotMwU5KchkSUnZWg=;
        b=kQG7TiuJ8TkgfqzT1clE4dg/nOJjj4Yk5Su29PtJr1z1WQ0pnrtrhytHtSOV7hFRNL
         OZDTQRTh09Nbq4Y7V9bBA7OvFwl/gldTgQTEtQFnK5Tvpns2O4aZy14tKH9sHS1GsG3o
         N0rv4RnZ5W/nc0x1IJ1C4BVSkUvWE9GA6F74lKNbriR5Ajt9esv8QDgXbHLlu/Cs/DoO
         nDhkZKLljTzVp7xDrx37kZ1MnJfh15Z1kwk29PFysxFfEHjUL/CR4YddslwpiQitm1oQ
         zu+sQvAHFjf7NPIkQ5mDUy0lIlAjgJxfpJgvBZ8ltL+dW3TECSEIzVxTri/zvNsWXXwS
         ub9g==
X-Gm-Message-State: AOAM531vgqwuhwfESh9zJJK1NEKUHS2Z2IrqUdMZFzdDnhsSZh7ZWOQJ
        R4pRXvpgyaHqkR3fFOFDZow=
X-Google-Smtp-Source: ABdhPJyCemh4KeMbIQmNplIDC1jSRXhzp5jCiC5AB7piPCzw6RpHT2gU7GTfLcgWtYBIhp26kTnOVg==
X-Received: by 2002:a17:906:6606:: with SMTP id b6mr1346182ejp.102.1594668764091;
        Mon, 13 Jul 2020 12:32:44 -0700 (PDT)
Received: from localhost.localdomain ([185.95.176.207])
        by smtp.googlemail.com with ESMTPSA id x10sm10454003ejc.46.2020.07.13.12.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 12:32:43 -0700 (PDT)
From:   jaap aarts <jaap.aarts1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     jaap aarts <jaap.aarts1@gmail.com>,
        Jaap Aarts <jaap.aarts1@example.com>
Subject: [PATCH 5/6] allow setting enable instead of mode, and support enable 2/3/4
Date:   Mon, 13 Jul 2020 21:32:26 +0200
Message-Id: <20200713193227.189751-5-jaap.aarts1@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713193227.189751-1-jaap.aarts1@gmail.com>
References: <20200713193227.189751-1-jaap.aarts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Signed-off-by: Jaap Aarts <jaap.aarts1@example.com>
---
 drivers/hwmon/asetek_gen6.c | 110 ++++++++++++++++++++++++++++++------
 1 file changed, 93 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/asetek_gen6.c b/drivers/hwmon/asetek_gen6.c
index d657ecc78908..19f50d5cd179 100644
--- a/drivers/hwmon/asetek_gen6.c
+++ b/drivers/hwmon/asetek_gen6.c
@@ -64,38 +64,100 @@ struct hwmon_data {
 	void **channel_data;
 };
 
-struct curve_point default_curve[] = {
+struct curve_point quiet_curve[] = {
 	{
-		.temp = 0x10,
-		.pwm = 0x19,
+		.temp = 0x1F,
+		.pwm = 0x15,
 	},
 	{
-		.temp = 0x14,
-		.pwm = 0x19,
+		.temp = 0x21,
+		.pwm = 0x1E,
+	},
+	{
+		.temp = 0x24,
+		.pwm = 0x25,
+	},
+	{
+		.temp = 0x27,
+		.pwm = 0x2D,
+	},
+	{
+		.temp = 0x29,
+		.pwm = 0x38,
+	},
+	{
+		.temp = 0x2C,
+		.pwm = 0x4A,
+	},
+	{
+		.temp = 0x2F,
+		.pwm = 0x64,
+	},
+};
+
+struct curve_point balanced_curve[] = {
+	{
+		.temp = 0x1C,
+		.pwm = 0x15,
+	},
+	{
+		.temp = 0x1E,
+		.pwm = 0x1B,
 	},
 	{
 		.temp = 0x20,
-		.pwm = 0x27,
+		.pwm = 0x23,
 	},
 	{
-		.temp = 0x28,
-		.pwm = 0x32,
+		.temp = 0x22,
+		.pwm = 0x28,
 	},
 	{
-		.temp = 0x32,
-		.pwm = 0x4b,
+		.temp = 0x24,
+		.pwm = 0x32,
 	},
 	{
-		.temp = 0x37,
-		.pwm = 0x5a,
+		.temp = 0x27,
+		.pwm = 0x48,
 	},
 	{
-		.temp = 0x3c,
+		.temp = 0x29,
 		.pwm = 0x64,
 	},
+};
 
+struct curve_point extreme_curve[] = {
+	{
+		.temp = 0x19,
+		.pwm = 0x28,
+	},
+	{
+		.temp = 0x1B,
+		.pwm = 0x2E,
+	},
+	{
+		.temp = 0x1D,
+		.pwm = 0x37,
+	},
+	{
+		.temp = 0x1E,
+		.pwm = 0x41,
+	},
+	{
+		.temp = 0x1F,
+		.pwm = 0x4C,
+	},
+	{
+		.temp = 0x20,
+		.pwm = 0x56,
+	},
+	{
+		.temp = 0x21,
+		.pwm = 0x64,
+	},
 };
 
+#define default_curve quiet_curve
 static const char SUCCESS[2] = { 0x12, 0x34 };
 
 #define SUCCES_LENGTH 3
@@ -347,7 +409,7 @@ static int write_func(struct device *dev, enum hwmon_sensor_types type,
 				return retval;
 
 			goto cleanup;
-		case hwmon_pwm_mode:
+		case hwmon_pwm_enable:
 			fan_data = data->channel_data[channel];
 
 			retval = usb_autopm_get_interface(cdev->interface);
@@ -360,10 +422,12 @@ static int write_func(struct device *dev, enum hwmon_sensor_types type,
 			}
 			fan_data->mode = val;
 
-			if (val == 0) {
+			switch (val) {
+			case 0:
 				set_fan_rpm_curve(cdev, fan_data,
 						  default_curve);
-			} else if (val == 1) {
+				break;
+			case 1:
 				if (fan_data->fan_target != 0) {
 					retval = set_fan_target_rpm(
 						cdev, fan_data,
@@ -377,6 +441,18 @@ static int write_func(struct device *dev, enum hwmon_sensor_types type,
 					if (retval)
 						goto cleanup;
 				}
+				break;
+			case 2:
+				set_fan_rpm_curve(cdev, fan_data, quiet_curve);
+				break;
+			case 3:
+				set_fan_rpm_curve(cdev, fan_data,
+						  balanced_curve);
+				break;
+			case 4:
+				set_fan_rpm_curve(cdev, fan_data,
+						  extreme_curve);
+				break;
 			}
 			goto cleanup;
 		default:
@@ -465,7 +541,7 @@ int read_func(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	return retval;
 }
 #define fan_config HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN
-#define pwm_config HWMON_PWM_INPUT | HWMON_PWM_MODE
+#define pwm_config HWMON_PWM_INPUT | HWMON_PWM_ENABLE
 
 static const struct hwmon_ops asetek_6_ops = {
 	.is_visible = is_visible_func,
-- 
2.27.0

