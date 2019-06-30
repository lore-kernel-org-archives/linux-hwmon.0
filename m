Return-Path: <SRS0=soNe=U5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBC9C5B57F
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Jun 2019 22:56:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B3F3208C3
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Jun 2019 22:56:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWqg5H+l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfF3W4m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 Jun 2019 18:56:42 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45822 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbfF3W4m (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Jun 2019 18:56:42 -0400
Received: by mail-pg1-f195.google.com with SMTP id o13so547109pgp.12
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Jun 2019 15:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oL4bIjT1wTNrR/rfmEp2M4N0dmssgONvXZEAb0qR+dU=;
        b=BWqg5H+lFkDII1/xPYRhoj4RgnohNnRG/mpX8pVM9n46DkkHmOz6IokCA6YwsG4TD+
         IEOx5UmdlTt5izq3CuhsUjPaTQqii/QuzMQshjZPKpY8zfr5ADDh3GpQDk8QAqxMW7tB
         Q8JqpV+LGPWnHDchy5AUmlHLZ+BBpvwKb8zU2ymKYG4LRh4UlWLToBSeB9o2ha8SVYAw
         7YUo/r2nG+WTBEdL4J4BJaSU+m0DZUoPc8I1FyAqvyg2UzaGPSuccV1gEUsnsYv9p5eT
         Qw/CS+9Wffj8pIdYf2NJMikmOAbbBLqmTvLwsjilEOfP/jl28hY55PhB+QgNtt+h4wDL
         4AGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=oL4bIjT1wTNrR/rfmEp2M4N0dmssgONvXZEAb0qR+dU=;
        b=lniRzVdhKj37DGCP7fFuEzV1QcDf3cQHbkLluOhJJwOXnIWlWJsh0OyJC6fKn1dtmX
         A2myVbHRALsxnVLPdkmF43Ggd1j1nQipX0orLISmO1+PYafWM2651lH497lnHrxubppa
         bGkH9q2+JuZ055c/qFglvJ/5HWltm00FhZqJTNmnjIGPGqO7Dc4XTnbnqs7bzVycXp8o
         pwgo91+sQQblruh44TW2JRaPq4iDty1lClzoFjOTduM9bkHYqLCbmCJ4hYMKXT3bZ6oY
         n/96/tYXxfYceYfAFrKBcU85AMEAkKIOrEM8MlsSyH/mwaZ0a/rdbn7SdCONPthEhaSy
         tRBA==
X-Gm-Message-State: APjAAAWGIswQKIVbxnnY2IcHfwqr1hRiuX5TK9IGVMMqiod0xaaTeJRg
        ecUN4vlP7BfC5SDXfUeSEW5ffjOr
X-Google-Smtp-Source: APXvYqz6k2sTA+52wQS6npR93u2P73TNogq5dwdIeQvb3MJPUixC2HheQBwKUkOkL2WrDqUU9w6SPA==
X-Received: by 2002:a63:4803:: with SMTP id v3mr7283207pga.347.1561935400725;
        Sun, 30 Jun 2019 15:56:40 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 3sm9115766pfp.114.2019.06.30.15.56.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Jun 2019 15:56:40 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, Boyang Yu <byu@arista.com>
Subject: [PATCH 2/2] hwmon: (lm90) Introduce function to update configuration register
Date:   Sun, 30 Jun 2019 15:56:35 -0700
Message-Id: <1561935395-15093-2-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561935395-15093-1-git-send-email-linux@roeck-us.net>
References: <1561935395-15093-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The code to update the configuration register is repeated several times.
Move it into a separate function. At the same time, un-inline
lm90_select_remote_channel() and leave it up to the compiler to decide
what to do with it. Also remove the 'client' argument from
lm90_select_remote_channel() and from lm90_write_convrate() and take
it from struct lm90_data instead where needed.

This patch reduces code size by more than 800 bytes on x86_64.

Cc: Boyang Yu <byu@arista.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 89 +++++++++++++++++++++++-----------------------------
 1 file changed, 40 insertions(+), 49 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 7f35ea0044fd..9b3c9f390ef8 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -543,6 +543,21 @@ static int lm90_read16(struct i2c_client *client, u8 regh, u8 regl)
 	return (newh << 8) | l;
 }
 
+static int lm90_update_confreg(struct lm90_data *data, u8 config)
+{
+	if (data->config != config) {
+		int err;
+
+		err = i2c_smbus_write_byte_data(data->client,
+						LM90_REG_W_CONFIG1,
+						config);
+		if (err)
+			return err;
+		data->config = config;
+	}
+	return 0;
+}
+
 /*
  * client->update_lock must be held when calling this function (unless we are
  * in detection or initialization steps), and while a remote channel other
@@ -551,53 +566,37 @@ static int lm90_read16(struct i2c_client *client, u8 regh, u8 regl)
  * various registers have different meanings as a result of selecting a
  * non-default remote channel.
  */
-static inline int lm90_select_remote_channel(struct i2c_client *client,
-					     struct lm90_data *data,
-					     int channel)
+static int lm90_select_remote_channel(struct lm90_data *data, int channel)
 {
+	int err = 0;
+
 	if (data->kind == max6696) {
 		u8 config = data->config & ~0x08;
-		int err;
 
 		if (channel)
 			config |= 0x08;
-		if (data->config != config) {
-			err = i2c_smbus_write_byte_data(client,
-							LM90_REG_W_CONFIG1,
-							config);
-			if (err)
-				return err;
-			data->config = config;
-		}
+		err = lm90_update_confreg(data, config);
 	}
-	return 0;
+	return err;
 }
 
-static int lm90_write_convrate(struct i2c_client *client,
-			       struct lm90_data *data, int val)
+static int lm90_write_convrate(struct lm90_data *data, int val)
 {
 	u8 config = data->config;
 	int err;
 
 	/* Save config and pause conversion */
 	if (data->flags & LM90_PAUSE_FOR_CONFIG) {
-		config |= 0x40;
-		if (data->config != config) {
-			err = i2c_smbus_write_byte_data(client,
-							LM90_REG_W_CONFIG1,
-							config);
-			if (err < 0)
-				return err;
-		}
+		err = lm90_update_confreg(data, config | 0x40);
+		if (err < 0)
+			return err;
 	}
 
 	/* Set conv rate */
-	err = i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE, val);
+	err = i2c_smbus_write_byte_data(data->client, LM90_REG_W_CONVRATE, val);
 
 	/* Revert change to config */
-	if (data->config != config)
-		i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
-					  data->config);
+	lm90_update_confreg(data, config);
 
 	return err;
 }
@@ -622,7 +621,7 @@ static int lm90_set_convrate(struct i2c_client *client, struct lm90_data *data,
 		if (interval >= update_interval * 3 / 4)
 			break;
 
-	err = lm90_write_convrate(client, data, i);
+	err = lm90_write_convrate(data, i);
 	data->update_interval = DIV_ROUND_CLOSEST(update_interval, 64);
 	return err;
 }
@@ -693,7 +692,7 @@ static int lm90_update_limits(struct device *dev)
 	}
 
 	if (data->kind == max6696) {
-		val = lm90_select_remote_channel(client, data, 1);
+		val = lm90_select_remote_channel(data, 1);
 		if (val < 0)
 			return val;
 
@@ -717,7 +716,7 @@ static int lm90_update_limits(struct device *dev)
 			return val;
 		data->temp11[REMOTE2_HIGH] = val << 8;
 
-		lm90_select_remote_channel(client, data, 0);
+		lm90_select_remote_channel(data, 0);
 	}
 
 	return 0;
@@ -777,19 +776,19 @@ static int lm90_update_device(struct device *dev)
 		data->alarms = val;	/* lower 8 bit of alarms */
 
 		if (data->kind == max6696) {
-			val = lm90_select_remote_channel(client, data, 1);
+			val = lm90_select_remote_channel(data, 1);
 			if (val < 0)
 				return val;
 
 			val = lm90_read16(client, LM90_REG_R_REMOTE_TEMPH,
 					  LM90_REG_R_REMOTE_TEMPL);
 			if (val < 0) {
-				lm90_select_remote_channel(client, data, 0);
+				lm90_select_remote_channel(data, 0);
 				return val;
 			}
 			data->temp11[REMOTE2_TEMP] = val;
 
-			lm90_select_remote_channel(client, data, 0);
+			lm90_select_remote_channel(data, 0);
 
 			val = lm90_read_reg(client, MAX6696_REG_R_STATUS2);
 			if (val < 0)
@@ -805,10 +804,7 @@ static int lm90_update_device(struct device *dev)
 		    !(data->alarms & data->alert_alarms)) {
 			if (data->config & 0x80) {
 				dev_dbg(&client->dev, "Re-enabling ALERT#\n");
-				data->config &= ~0x80;
-				i2c_smbus_write_byte_data(client,
-							  LM90_REG_W_CONFIG1,
-							  data->config);
+				lm90_update_confreg(data, data->config & ~0x80);
 			}
 		}
 
@@ -1026,7 +1022,7 @@ static int lm90_set_temp11(struct lm90_data *data, int index, long val)
 	else
 		data->temp11[index] = temp_to_s8(val) << 8;
 
-	lm90_select_remote_channel(client, data, index >= 3);
+	lm90_select_remote_channel(data, index >= 3);
 	err = i2c_smbus_write_byte_data(client, regp->high,
 				  data->temp11[index] >> 8);
 	if (err < 0)
@@ -1035,7 +1031,7 @@ static int lm90_set_temp11(struct lm90_data *data, int index, long val)
 		err = i2c_smbus_write_byte_data(client, regp->low,
 						data->temp11[index] & 0xff);
 
-	lm90_select_remote_channel(client, data, 0);
+	lm90_select_remote_channel(data, 0);
 	return err;
 }
 
@@ -1084,9 +1080,9 @@ static int lm90_set_temp8(struct lm90_data *data, int index, long val)
 	else
 		data->temp8[index] = temp_to_s8(val);
 
-	lm90_select_remote_channel(client, data, index >= 6);
+	lm90_select_remote_channel(data, index >= 6);
 	err = i2c_smbus_write_byte_data(client, reg[index], data->temp8[index]);
-	lm90_select_remote_channel(client, data, 0);
+	lm90_select_remote_channel(data, 0);
 
 	return err;
 }
@@ -1625,7 +1621,7 @@ static void lm90_restore_conf(void *_data)
 	struct i2c_client *client = data->client;
 
 	/* Restore initial configuration */
-	lm90_write_convrate(client, data, data->convrate_orig);
+	lm90_write_convrate(data, data->convrate_orig);
 	i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
 				  data->config_orig);
 }
@@ -1671,10 +1667,7 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 		config &= ~0x08;
 
 	config &= 0xBF;	/* run */
-	if (config != data->config) {	/* Only write if changed */
-		i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1, config);
-		data->config = config;
-	}
+	lm90_update_confreg(data, config);
 
 	return devm_add_action_or_reset(&client->dev, lm90_restore_conf, data);
 }
@@ -1909,9 +1902,7 @@ static void lm90_alert(struct i2c_client *client, enum i2c_alert_protocol type,
 		if ((data->flags & LM90_HAVE_BROKEN_ALERT) &&
 		    (alarms & data->alert_alarms)) {
 			dev_dbg(&client->dev, "Disabling ALERT#\n");
-			data->config |= 0x80;
-			i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
-						  data->config);
+			lm90_update_confreg(data, data->config | 0x80);
 		}
 	} else {
 		dev_info(&client->dev, "Everything OK\n");
-- 
2.7.4

