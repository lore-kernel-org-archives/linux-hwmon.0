Return-Path: <SRS0=soNe=U5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED75C5B576
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Jun 2019 22:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A6FC208C3
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Jun 2019 22:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHZp+rcV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfF3W4k (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 Jun 2019 18:56:40 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39325 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbfF3W4k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Jun 2019 18:56:40 -0400
Received: by mail-pl1-f196.google.com with SMTP id b7so6283248pls.6
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Jun 2019 15:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=niVCAzyta3t7VVSaLMB8eye9CkQ2utJv17JSU6Rl7q4=;
        b=KHZp+rcVXcuwftHc2Ma+k4NvZt9/2BXMK32ZZagM0nqC7KV/7dTcZ1900+tVArtkGB
         LydxM+F0CcWprzbhh7m4Q4tUaCfKfpMe/uSwytMuIOnpn/A95FBqPix4ea/xvQKiUzeV
         y1Z/O50GZfytBMet30pVF6sbyaAVJme4z0Z5zlg7U6pM4Zhrp/eh1jXn2zkAg21uTnJ5
         kzP+YDEdBat9n1XhHSTWlrbNkkIQD8nwJA14fng6MdjK/6711XLgKmewppM1BwjuaPvB
         GWToZdidWTSgFfXgBDBGyb8N6UbU7vW9CXGphtjcCWsdRZ2B3WOUApp1C2YgSZxLMsih
         y+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=niVCAzyta3t7VVSaLMB8eye9CkQ2utJv17JSU6Rl7q4=;
        b=KBxaYY3xW2C0/HNXjcUiTut69M0r1kS/gxTdfrLnIUGqP/Gc9mRbcd3ZrFuZT0geya
         1F9B5VstORJ/f0+1VcqgkRibKgTixpy4hJ37S6boNgPOAluYEFwwPDxhKyPUUXeCq4Hm
         iDerOjdx9HfUe8rDN4cZeLvif8RzSOD88g7L3Y1TGJh8F1GTeFa9uMDn8w9azCfY2moW
         DcBr2W8PU7D02azjpz9XgHQDvcRJ2d0ZarQBrlU797BWMj2YQmIhv/HINXU+PFO/FC5m
         Fzyy3VhGmtMAQPucVvWPwdoWZWw2EZPmT0DuzgBP4s0sPH4NGiP/2dIUHdIhy8AkJJUr
         dJnw==
X-Gm-Message-State: APjAAAWfZvKIoXRdM/Go/QJT98vjlZhGz5NWHfMjy3cwu6CAxToMzr9B
        ZzgMSyz8PlfvIDtSZ7wZQXIDNY3m
X-Google-Smtp-Source: APXvYqx2PKgairFLLeLiNEhwynKu+bf+olVB5T3rAjfizhh2kFIo3ZEIfUNj+MZJXZ9ARYgOORAKDw==
X-Received: by 2002:a17:902:70c3:: with SMTP id l3mr25150854plt.248.1561935399351;
        Sun, 30 Jun 2019 15:56:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 191sm11144400pfu.177.2019.06.30.15.56.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Jun 2019 15:56:38 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, Boyang Yu <byu@arista.com>
Subject: [PATCH 1/2] hwmon: (lm90) Cache configuration register value
Date:   Sun, 30 Jun 2019 15:56:34 -0700
Message-Id: <1561935395-15093-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The configuration register does not change on its own. Yet, it is read
in various locations, modified, and written back. Simplify and optimize
the code by caching its value and by only writing it back when needed.

Cc: Boyang Yu <byu@arista.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 59 +++++++++++++++++++++++++---------------------------
 1 file changed, 28 insertions(+), 31 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 40bb308d8dd7..7f35ea0044fd 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -459,6 +459,7 @@ struct lm90_data {
 
 	unsigned int update_interval; /* in milliseconds */
 
+	u8 config;		/* Current configuration register value */
 	u8 config_orig;		/* Original configuration register value */
 	u8 convrate_orig;	/* Original conversion rate register value */
 	u16 alert_alarms;	/* Which alarm bits trigger ALERT# */
@@ -554,17 +555,20 @@ static inline int lm90_select_remote_channel(struct i2c_client *client,
 					     struct lm90_data *data,
 					     int channel)
 {
-	int config;
-
 	if (data->kind == max6696) {
-		config = lm90_read_reg(client, LM90_REG_R_CONFIG1);
-		if (config < 0)
-			return config;
-		config &= ~0x08;
+		u8 config = data->config & ~0x08;
+		int err;
+
 		if (channel)
 			config |= 0x08;
-		i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
-					  config);
+		if (data->config != config) {
+			err = i2c_smbus_write_byte_data(client,
+							LM90_REG_W_CONFIG1,
+							config);
+			if (err)
+				return err;
+			data->config = config;
+		}
 	}
 	return 0;
 }
@@ -572,19 +576,16 @@ static inline int lm90_select_remote_channel(struct i2c_client *client,
 static int lm90_write_convrate(struct i2c_client *client,
 			       struct lm90_data *data, int val)
 {
+	u8 config = data->config;
 	int err;
-	int config_orig, config_stop;
 
 	/* Save config and pause conversion */
 	if (data->flags & LM90_PAUSE_FOR_CONFIG) {
-		config_orig = lm90_read_reg(client, LM90_REG_R_CONFIG1);
-		if (config_orig < 0)
-			return config_orig;
-		config_stop = config_orig | 0x40;
-		if (config_orig != config_stop) {
+		config |= 0x40;
+		if (data->config != config) {
 			err = i2c_smbus_write_byte_data(client,
 							LM90_REG_W_CONFIG1,
-							config_stop);
+							config);
 			if (err < 0)
 				return err;
 		}
@@ -594,9 +595,9 @@ static int lm90_write_convrate(struct i2c_client *client,
 	err = i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE, val);
 
 	/* Revert change to config */
-	if (data->flags & LM90_PAUSE_FOR_CONFIG && config_orig != config_stop)
+	if (data->config != config)
 		i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
-					  config_orig);
+					  data->config);
 
 	return err;
 }
@@ -802,15 +803,12 @@ static int lm90_update_device(struct device *dev)
 		 */
 		if (!(data->config_orig & 0x80) &&
 		    !(data->alarms & data->alert_alarms)) {
-			val = lm90_read_reg(client, LM90_REG_R_CONFIG1);
-			if (val < 0)
-				return val;
-
-			if (val & 0x80) {
+			if (data->config & 0x80) {
 				dev_dbg(&client->dev, "Re-enabling ALERT#\n");
+				data->config &= ~0x80;
 				i2c_smbus_write_byte_data(client,
 							  LM90_REG_W_CONFIG1,
-							  val & ~0x80);
+							  data->config);
 			}
 		}
 
@@ -1648,6 +1646,7 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 	if (config < 0)
 		return config;
 	data->config_orig = config;
+	data->config = config;
 
 	lm90_set_convrate(client, data, 500); /* 500ms; 2Hz conversion rate */
 
@@ -1672,8 +1671,10 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 		config &= ~0x08;
 
 	config &= 0xBF;	/* run */
-	if (config != data->config_orig) /* Only write if changed */
+	if (config != data->config) {	/* Only write if changed */
 		i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1, config);
+		data->config = config;
+	}
 
 	return devm_add_action_or_reset(&client->dev, lm90_restore_conf, data);
 }
@@ -1907,14 +1908,10 @@ static void lm90_alert(struct i2c_client *client, enum i2c_alert_protocol type,
 
 		if ((data->flags & LM90_HAVE_BROKEN_ALERT) &&
 		    (alarms & data->alert_alarms)) {
-			int config;
-
 			dev_dbg(&client->dev, "Disabling ALERT#\n");
-			config = lm90_read_reg(client, LM90_REG_R_CONFIG1);
-			if (config >= 0)
-				i2c_smbus_write_byte_data(client,
-							  LM90_REG_W_CONFIG1,
-							  config | 0x80);
+			data->config |= 0x80;
+			i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
+						  data->config);
 		}
 	} else {
 		dev_info(&client->dev, "Everything OK\n");
-- 
2.7.4

