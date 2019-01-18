Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDD3C5AC81
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25B5D20850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cG7tJ+fD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbfARRPp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:45 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34137 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbfARRPo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:44 -0500
Received: by mail-pf1-f193.google.com with SMTP id h3so6917352pfg.1
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BHaRAgB1LSH6PvAYmWA+UnFo7Boqbo0zej2XZxnQK6M=;
        b=cG7tJ+fD3y2X0n9hAc0jgr/P0X8frIc2HRaJAkhQYWCW4mrnmT4VMXLX+9LOLii07G
         U6X4eGZlvIEPgGPe8G7L4M3ugS7LIQDkpCxXwL73sLNPNqrMi7exD14SwX9OCUv9nb6B
         aTbnnXgJ5RbyH7JYnuxaaxZieDvvltZU3ICTTSAtYz7QS+2EzSI4OK2XTOmsV7CTxMcI
         HDm4zmOcU0+XA+QjyINBVD99P0qJuPI53JycShVLO42sSqIk18MuqT8OHEHcsQDtwXxn
         MV8JuRFgahM6pBxOaFtq0wLEVkjtaPzOt+MPKwBeDGa+xDNpT+O2uP6/wJDHJ9D8dybE
         S/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=BHaRAgB1LSH6PvAYmWA+UnFo7Boqbo0zej2XZxnQK6M=;
        b=gbKAX3ImXzJd9znvWbg1CHY2WdMIDt8hdNpSJZwiuTRxylfgfElJozH1M/svlOhKE9
         tTzRDgL0L2avsLEigmnrkte2ckzmEsnbjKutea+TMQUhn8AHmYUi0Rjtys57xVvFS0jE
         YGov2m4ioCmSE6HhCskoun3xScQTDAmnBYItQVqKDaTdd6p0uhv2oOz92GkRct+/jLBX
         06ecQIT2/WZxf6c5ldVtUe7be8cd3zMsGE0pCmUf93+7QrjJDU8PIrAH4b9cGHlNo0VJ
         QscK6/2/Zid9ihLKeCsQM3ohNFFd6V5pzXiCZPry1hGmu3sPiLmgJmkKW692Z+93GKm6
         7/qg==
X-Gm-Message-State: AJcUukfcSN9pRI7v+3vCeBJWup/CO2HikV4/jB6SdudroipFsIOX2ENj
        XgEGA59UAMFHrk1CRtU3xRHk/RXM
X-Google-Smtp-Source: ALg8bN798cbQlWuzuhUsM1AnQ5jY6MouaYyp7rb5ORX3LydtRHaLKQOh/4yYBY5Dh68e1XU7lmqv3g==
X-Received: by 2002:a63:e5c:: with SMTP id 28mr11029595pgo.369.1547831743483;
        Fri, 18 Jan 2019 09:15:43 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h69sm6338071pge.4.2019.01.18.09.15.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:42 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 24/30] hwmon: (tc654) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:54 -0800
Message-Id: <1547831700-15865-25-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the driver with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tc654.c | 60 +++++++++++++++++++++++----------------------------
 1 file changed, 27 insertions(+), 33 deletions(-)

diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
index 18136e1f95fd..81dd229d7db4 100644
--- a/drivers/hwmon/tc654.c
+++ b/drivers/hwmon/tc654.c
@@ -200,7 +200,7 @@ static struct tc654_data *tc654_update_client(struct device *dev)
  * sysfs attributes
  */
 
-static ssize_t show_fan(struct device *dev, struct device_attribute *da,
+static ssize_t fan_show(struct device *dev, struct device_attribute *da,
 			char *buf)
 {
 	int nr = to_sensor_dev_attr(da)->index;
@@ -218,7 +218,7 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", val);
 }
 
-static ssize_t show_fan_min(struct device *dev, struct device_attribute *da,
+static ssize_t fan_min_show(struct device *dev, struct device_attribute *da,
 			    char *buf)
 {
 	int nr = to_sensor_dev_attr(da)->index;
@@ -231,8 +231,8 @@ static ssize_t show_fan_min(struct device *dev, struct device_attribute *da,
 		       TC654_FAN_FAULT_FROM_REG(data->fan_fault[nr]));
 }
 
-static ssize_t set_fan_min(struct device *dev, struct device_attribute *da,
-			   const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev, struct device_attribute *da,
+			     const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(da)->index;
 	struct tc654_data *data = dev_get_drvdata(dev);
@@ -255,7 +255,7 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute *da,
 	return ret < 0 ? ret : count;
 }
 
-static ssize_t show_fan_alarm(struct device *dev, struct device_attribute *da,
+static ssize_t fan_alarm_show(struct device *dev, struct device_attribute *da,
 			      char *buf)
 {
 	int nr = to_sensor_dev_attr(da)->index;
@@ -275,8 +275,8 @@ static ssize_t show_fan_alarm(struct device *dev, struct device_attribute *da,
 
 static const u8 TC654_FAN_PULSE_SHIFT[] = { 1, 3 };
 
-static ssize_t show_fan_pulses(struct device *dev, struct device_attribute *da,
-			       char *buf)
+static ssize_t fan_pulses_show(struct device *dev,
+			       struct device_attribute *da, char *buf)
 {
 	int nr = to_sensor_dev_attr(da)->index;
 	struct tc654_data *data = tc654_update_client(dev);
@@ -289,8 +289,9 @@ static ssize_t show_fan_pulses(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", val);
 }
 
-static ssize_t set_fan_pulses(struct device *dev, struct device_attribute *da,
-			      const char *buf, size_t count)
+static ssize_t fan_pulses_store(struct device *dev,
+				struct device_attribute *da, const char *buf,
+				size_t count)
 {
 	int nr = to_sensor_dev_attr(da)->index;
 	struct tc654_data *data = dev_get_drvdata(dev);
@@ -329,8 +330,8 @@ static ssize_t set_fan_pulses(struct device *dev, struct device_attribute *da,
 	return ret < 0 ? ret : count;
 }
 
-static ssize_t show_pwm_mode(struct device *dev,
-			     struct device_attribute *da, char *buf)
+static ssize_t pwm_mode_show(struct device *dev, struct device_attribute *da,
+			     char *buf)
 {
 	struct tc654_data *data = tc654_update_client(dev);
 
@@ -340,9 +341,8 @@ static ssize_t show_pwm_mode(struct device *dev,
 	return sprintf(buf, "%d\n", !!(data->config & TC654_REG_CONFIG_DUTYC));
 }
 
-static ssize_t set_pwm_mode(struct device *dev,
-			    struct device_attribute *da,
-			    const char *buf, size_t count)
+static ssize_t pwm_mode_store(struct device *dev, struct device_attribute *da,
+			      const char *buf, size_t count)
 {
 	struct tc654_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -371,7 +371,7 @@ static ssize_t set_pwm_mode(struct device *dev,
 static const int tc654_pwm_map[16] = { 77,  88, 102, 112, 124, 136, 148, 160,
 				      172, 184, 196, 207, 219, 231, 243, 255};
 
-static ssize_t show_pwm(struct device *dev, struct device_attribute *da,
+static ssize_t pwm_show(struct device *dev, struct device_attribute *da,
 			char *buf)
 {
 	struct tc654_data *data = tc654_update_client(dev);
@@ -388,8 +388,8 @@ static ssize_t show_pwm(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", pwm);
 }
 
-static ssize_t set_pwm(struct device *dev, struct device_attribute *da,
-		       const char *buf, size_t count)
+static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
+			 const char *buf, size_t count)
 {
 	struct tc654_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -423,22 +423,16 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *da,
 	return ret < 0 ? ret : count;
 }
 
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, show_fan, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, show_fan, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan1_min, S_IWUSR | S_IRUGO, show_fan_min,
-			  set_fan_min, 0);
-static SENSOR_DEVICE_ATTR(fan2_min, S_IWUSR | S_IRUGO, show_fan_min,
-			  set_fan_min, 1);
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_fan_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_fan_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan1_pulses, S_IWUSR | S_IRUGO, show_fan_pulses,
-			  set_fan_pulses, 0);
-static SENSOR_DEVICE_ATTR(fan2_pulses, S_IWUSR | S_IRUGO, show_fan_pulses,
-			  set_fan_pulses, 1);
-static SENSOR_DEVICE_ATTR(pwm1_mode, S_IWUSR | S_IRUGO,
-			  show_pwm_mode, set_pwm_mode, 0);
-static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, show_pwm,
-			  set_pwm, 0);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, fan_alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, fan_alarm, 1);
+static SENSOR_DEVICE_ATTR_RW(fan1_pulses, fan_pulses, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_pulses, fan_pulses, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm1_mode, pwm_mode, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
 
 /* Driver data */
 static struct attribute *tc654_attrs[] = {
-- 
2.7.4

