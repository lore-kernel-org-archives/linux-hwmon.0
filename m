Return-Path: <SRS0=IYsF=UG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A111C2BCA1
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F57B207E0
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="paDBpRpx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729539AbfFGRXa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jun 2019 13:23:30 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39464 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbfFGRXa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jun 2019 13:23:30 -0400
Received: by mail-pl1-f195.google.com with SMTP id g9so1073281plm.6
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Jun 2019 10:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VUVs7rW5hvBJX675uRYB6Ey/3oz5wc3Sh5Y4aofo72E=;
        b=paDBpRpxWaXhpVd53vdyS6doUMy/YVgjZ9rzWw6VumEEWEiBJsAPUGE70YmBbobBcm
         EcoA1E87rw+ldg01INo9y99Gq6T09WhT6PnBPhif6HTPjzlCfw11EbrZEUhuagPShrbC
         HlzJcC36TNpKyE9aLtE0pwgUOtTEN1ayu6PnY/rRf+0HHzbrujUgwlUSiLSO6CcC7Bai
         QTH9KjufxgimXEyzlQmszD8CC+uenjwdTpdcMTvoKojZAvx8RC6NVrqgqmp+gLwwDVzY
         Zp/qX1RMTKbhmeSPk6ewA1YnpUZ4VVePKR19/bDe2XRjUNRVf60bPs6myjhig1uyGuZv
         7dpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=VUVs7rW5hvBJX675uRYB6Ey/3oz5wc3Sh5Y4aofo72E=;
        b=kpT4b5MuRJ+T1MIQ3Pp008CX7I4I7HNDZYyHyfPZi9C2bIfISslRwm2udnuq4w94A7
         Hne7/eIqfW4iRHIzUaS4t3MA5Eygki2BQYqVOrxtwYlcXHiihJDMvpqMfV0nuRdwTdxK
         cXr8knRLGzpy8E/ahdq3NEET561GSrFhUm2k5Km5TXZoGpJ7KvsAXlIlWHwxcPRuserk
         0y0Y1jTwk+L01H94DtDzMcKjL6/WlNoqB1gRYZY18haAl5Nu2X69y6Huz9et3mKvwPrV
         f8Gi/N1ZRRhnRX438eGrCdxmPclt/rIM6r+MlgpcNHQffqJdu9hpy3XoH+xb95hgvfRk
         C/Mg==
X-Gm-Message-State: APjAAAW4sV8hI6BkZwKQWDMqSFFDUYnTLxpNhOa+I4WdjZV2vJ2pJmiu
        8sA4V5UXQqpkCMiI9+f/DUR+LPGo
X-Google-Smtp-Source: APXvYqyemTd6OW05pMnPQhbpp+6d2TxZr+OK0WTN8/hPKJf7rApfpRSiF2bxMyaC+nW5e4HM3b8Ljg==
X-Received: by 2002:a17:902:b102:: with SMTP id q2mr47421169plr.149.1559928209925;
        Fri, 07 Jun 2019 10:23:29 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n32sm2708320pji.29.2019.06.07.10.23.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 10:23:29 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH v2 02/10] hwmon: (max6650) Introduce pwm_to_dac and dac_to_pwm
Date:   Fri,  7 Jun 2019 10:23:17 -0700
Message-Id: <1559928205-14030-2-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
References: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Consolidate conversion from pwm value to dac value and from dac value
to pwm value into helper functions.

While doing this, only update the cached dac value if writing it
to the chip was successful after an update. Also, put macro argument
of DIV_FROM_REG() into (), and simplify return statement of
max6650_set_cur_state().

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: simplify return statement of max6650_set_cur_state()

 drivers/hwmon/max6650.c | 55 ++++++++++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index e540d0b0145e..461484e7828a 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -92,7 +92,8 @@ module_param(clock, int, 0444);
 #define FAN_RPM_MIN 240
 #define FAN_RPM_MAX 30000
 
-#define DIV_FROM_REG(reg) (1 << (reg & 7))
+#define DIV_FROM_REG(reg)	(1 << ((reg) & 7))
+#define DAC_LIMIT(v12)		((v12) ? 180 : 76)
 
 /*
  * Client data (each client gets its own)
@@ -136,6 +137,22 @@ static const struct of_device_id __maybe_unused max6650_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, max6650_dt_match);
 
+static int dac_to_pwm(int dac, bool v12)
+{
+	/*
+	 * Useful range for dac is 0-180 for 12V fans and 0-76 for 5V fans.
+	 * Lower DAC values mean higher speeds.
+	 */
+	return clamp_val(255 - (255 * dac) / DAC_LIMIT(v12), 0, 255);
+}
+
+static u8 pwm_to_dac(unsigned int pwm, bool v12)
+{
+	int limit = DAC_LIMIT(v12);
+
+	return limit - (limit * pwm) / 255;
+}
+
 static struct max6650_data *max6650_update_device(struct device *dev)
 {
 	struct max6650_data *data = dev_get_drvdata(dev);
@@ -343,22 +360,10 @@ static ssize_t fan1_target_store(struct device *dev,
 static ssize_t pwm1_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
-	int pwm;
 	struct max6650_data *data = max6650_update_device(dev);
 
-	/*
-	 * Useful range for dac is 0-180 for 12V fans and 0-76 for 5V fans.
-	 * Lower DAC values mean higher speeds.
-	 */
-	if (data->config & MAX6650_CFG_V12)
-		pwm = 255 - (255 * (int)data->dac)/180;
-	else
-		pwm = 255 - (255 * (int)data->dac)/76;
-
-	if (pwm < 0)
-		pwm = 0;
-
-	return sprintf(buf, "%d\n", pwm);
+	return sprintf(buf, "%d\n", dac_to_pwm(data->dac,
+					       data->config & MAX6650_CFG_V12));
 }
 
 static ssize_t pwm1_store(struct device *dev,
@@ -369,6 +374,7 @@ static ssize_t pwm1_store(struct device *dev,
 	struct i2c_client *client = data->client;
 	unsigned long pwm;
 	int err;
+	u8 dac;
 
 	err = kstrtoul(buf, 10, &pwm);
 	if (err)
@@ -377,13 +383,10 @@ static ssize_t pwm1_store(struct device *dev,
 	pwm = clamp_val(pwm, 0, 255);
 
 	mutex_lock(&data->update_lock);
-
-	if (data->config & MAX6650_CFG_V12)
-		data->dac = 180 - (180 * pwm)/255;
-	else
-		data->dac = 76 - (76 * pwm)/255;
-	err = i2c_smbus_write_byte_data(client, MAX6650_REG_DAC, data->dac);
-
+	dac = pwm_to_dac(pwm, data->config & MAX6650_CFG_V12);
+	err = i2c_smbus_write_byte_data(client, MAX6650_REG_DAC, dac);
+	if (!err)
+		data->dac = dac;
 	mutex_unlock(&data->update_lock);
 
 	return err < 0 ? err : count;
@@ -714,11 +717,7 @@ static int max6650_set_cur_state(struct thermal_cooling_device *cdev,
 
 	mutex_lock(&data->update_lock);
 
-	if (data->config & MAX6650_CFG_V12)
-		data->dac = 180 - (180 * state)/255;
-	else
-		data->dac = 76 - (76 * state)/255;
-
+	data->dac = pwm_to_dac(state, data->config & MAX6650_CFG_V12);
 	err = i2c_smbus_write_byte_data(client, MAX6650_REG_DAC, data->dac);
 
 	if (!err) {
@@ -730,7 +729,7 @@ static int max6650_set_cur_state(struct thermal_cooling_device *cdev,
 
 	mutex_unlock(&data->update_lock);
 
-	return err < 0 ? err : 0;
+	return err;
 }
 
 static const struct thermal_cooling_device_ops max6650_cooling_ops = {
-- 
2.7.4

