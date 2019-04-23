Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63B0C10F14
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 91BB12077C
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncISTZJk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbfDWNdT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:33:19 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40712 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDWNdT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 09:33:19 -0400
Received: by mail-pg1-f193.google.com with SMTP id d31so7627582pgl.7
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 06:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6QuEQC8Acwq8/ngaLvJIOqLJtRqH5NI3hqsDkpN460U=;
        b=ncISTZJkfIwvinlfT6VScODaUlDMqbT4hWSAvtk4ynD0o+ioFz1abhI3WBPKqz97kZ
         ZPGURM7I3WMpoho/DsaXtqAAQrf8Wns7GDxMCuVIijAa2fKBwZJ09sfVp7bl4iwFk1rs
         6SChtPU4j9PC4nb7EVRoHSgcEe8QcjxYLFL86h0hzkhSM6e+SK+Z6eQzfa+JmOeu6/3c
         V+UkBcCv53Hu/xAkncPRiCKyvSz5JKOIgw5M3iNXuUBPhnN/clslOVqZOKL6J9b8QniE
         g6apDEA27gmr8wyGBsAyvZlbGuQX2+1qB7RAPHDiu+G8cgBRwqn2AZ75ssy4DIc45Onl
         A0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=6QuEQC8Acwq8/ngaLvJIOqLJtRqH5NI3hqsDkpN460U=;
        b=mQotPE7ebkUv/U7d/nPlcGCY7F9mg04C4yQ7bdPWMSHKRddsOdJQ+dfSSHwaQUsKVG
         NxT8oWoavhD5/sb3kE3JLSHNTSgiicvhs2p6gD10Xf+Kzz3fjgbe/eG1zYcpZJGEzPfT
         Y4O2YenGOFsRlOk0hy91DFn/Lfl3jR5EEMhpGd7hfFKu8YO/+Y0VBsQ2gfMwLz0adzsy
         QnkNiN2twHvAdbi9BUYamOeukXrSWVlHUjSZ8foNBw/ZqE446Q/SxsVhhVAqO4cpsN2l
         UDiCo1qIQnxM7J4oW3hUAqx4z616nWsIAqeU8lBW5MBs7WpKwHowOAlgc/moKGN4NJb+
         /Rbg==
X-Gm-Message-State: APjAAAX5V6HGKpS21vdqbsLo36nRukhfALhKsN5douoGFbcuKL7kSnoV
        ozQebpEOIbV04ML/axIuxU09kwTE
X-Google-Smtp-Source: APXvYqyP/q3mt1VZJeLp6Pqd2nFYAvNIHAznxKkIlKd6ETRaFhU2efZRDhpSb9rWAWKzMGjKHJXF0A==
X-Received: by 2002:a63:7444:: with SMTP id e4mr25042992pgn.261.1556026398235;
        Tue, 23 Apr 2019 06:33:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b14sm20724368pfi.92.2019.04.23.06.33.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 06:33:17 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 02/11] hwmon: (max6650) Introduce pwm_to_dac and dac_to_pwm
Date:   Tue, 23 Apr 2019 06:33:02 -0700
Message-Id: <1556026391-15360-2-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
References: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Consolidate conversion from pwm value to dac value and from dac value
to pwm value into helper functions.

While doing this, only update the cached dac value if writing it to
the chip was successful after an update. Also, put macro argument of
DIV_FROM_REG() into ().

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6650.c | 53 ++++++++++++++++++++++++-------------------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 6cce199dab6a..b6b8f8edc1b0 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -105,7 +105,8 @@ module_param(clock, int, 0444);
 #define FAN_RPM_MIN 240
 #define FAN_RPM_MAX 30000
 
-#define DIV_FROM_REG(reg) (1 << (reg & 7))
+#define DIV_FROM_REG(reg)	(1 << ((reg) & 7))
+#define DAC_LIMIT(v12)		((v12) ? 180 : 76)
 
 /*
  * Client data (each client gets its own)
@@ -150,6 +151,22 @@ static const struct of_device_id __maybe_unused max6650_dt_match[] = {
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
@@ -357,22 +374,10 @@ static ssize_t fan1_target_store(struct device *dev,
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
@@ -383,6 +388,7 @@ static ssize_t pwm1_store(struct device *dev,
 	struct i2c_client *client = data->client;
 	unsigned long pwm;
 	int err;
+	u8 dac;
 
 	err = kstrtoul(buf, 10, &pwm);
 	if (err)
@@ -391,13 +397,10 @@ static ssize_t pwm1_store(struct device *dev,
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
@@ -728,11 +731,7 @@ static int max6650_set_cur_state(struct thermal_cooling_device *cdev,
 
 	mutex_lock(&data->update_lock);
 
-	if (data->config & MAX6650_CFG_V12)
-		data->dac = 180 - (180 * state)/255;
-	else
-		data->dac = 76 - (76 * state)/255;
-
+	data->dac = pwm_to_dac(state, data->config & MAX6650_CFG_V12);
 	err = i2c_smbus_write_byte_data(client, MAX6650_REG_DAC, data->dac);
 
 	if (!err) {
-- 
2.7.4

