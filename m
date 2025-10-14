Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D522FFDE8
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455547; cv=none; b=I3SQb5w/r9zfxg1FkxcAP6eRqKCTMaWQjLukH80pf08H+tkJYzzVjfvI1WpbC8zfzVfQDz9/8JMdgde7BZmMKRDaoPLLMOL4eVsf6vCR52JflvDSd6f2hzsS2bAfRkNLhzSoQ2F+qU1qdaqIvuYQePEeoDrOe9v3hBsoQGvq3zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455547; c=relaxed/simple;
	bh=Ov/6OFBzNxNrFNFLkcOhq+uKo1awdxOeoZGXArYGONg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mih7ce2icvq59SJ8HZB6lnLFT/rQd9OoNVTeWz7uqNU5g2DGefkA9HVFixuxRgy14weci0VPRkXZ/ue+EeDWY614QHzwV7aAw4fzK10Hnx9+GsFMOHXcsa1X5qmRfbgyHXzVP/hC/ddlbj+WUbwxg9iwZ6Ay/cbQbLyhNM34zB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bu3oTX76; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bu3oTX76"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7835321bc98so5264642b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455545; x=1761060345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a41BvpyexLcs/dt7tiF9cwgky5mYklUue8S7uW6p9RY=;
        b=bu3oTX761HpszzDvvLdaur3UO/vezdmK4wsT76mvFlrHZv5vLsSew4lF0a5plHkqzQ
         4MY+1MtI4cfWRLKpGrywsF4oJuglgWunBV+e33cht0pKOm4iqejRh1utNnV55+PNr1oV
         2kKIYPJU+FyQkMVTWBDz9RjUFRHgN6Hg3Y/eOU93UnVX79T4iTwS2ce8Z+RyPII6S2Yz
         igYUOM+HfQrPNUir8cY+80ql6qpo9h0Xzb0VAmTqv7UT2GHZq6fzvZWCUQPH2rCyA8e2
         fP+oab8DTW6OYEprYlY8TdfukonTpuSrQmrubXRZdfTMM7t4rjfMfovRxxC5z4t1r0Lf
         dYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455545; x=1761060345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a41BvpyexLcs/dt7tiF9cwgky5mYklUue8S7uW6p9RY=;
        b=qvY9rKW+YDhtt76dXgUrXffukXdWpMxyJ19wwVxpj9Hnh6eVKD9rH7rzoYlMYD4s6b
         Zoem2tFaba1erIjzpJC3Mb/cS1GyVsHmMa9Q9qKE0rorR1mtGsxeROYrV5c/jB5TZVh4
         pvvGgO1WB9o0IS4o1aCC8+hbLP4TT7kY2527jLizAXyWmNr1bXKKORO2J4cWgDLnfoaz
         qrgqRdJ3UgejQnYK+KMvxcPk4YfFbeT1bMBoMtuihpWLD4tcWLGxrcwFlHIhGNhM3k1E
         8ujFmuxsjMQTzT9lqUc+IKjDPodHdXZQ1CK2eG6vB1rrGhC5Wrn361qs+HbODAiIOSMz
         detA==
X-Gm-Message-State: AOJu0YyOKItQSbKgwghjKfDaenzb+1xwQ3YBEkJApoj2T7moA3CdVPqE
	UkfH8lHRRvnu9aRdLJIjAZgJPAu2Wj1oup3Mni8SuhXnUlkP1zf/swXih+FQYw==
X-Gm-Gg: ASbGncvR8Ef4rjKumHTNxs4RZf8FHw0h4+uSDfuo5CD92+5xihE6ou6UJJFU9dJAlut
	WV0ZjSbSQ3OnqTq8x5z7TFmyqRb2v4825zc2jfPiqihejXpeTrxQ5w0KQkUo+hBiuc15N8X2636
	mmC/FNTxx4+6e7vvkurU5xxz+aZr4HlkjRlY5+lqk6kOPjehBNrhhnR4uM2f0AOzEFE5t+B+56w
	nyRCflxBnFCbofLdOAk0Me+EF11g85QWmRqDFvkLBkpa7BSxO4Cjj3P+twLnMwhGzWw1Om51NYv
	msgJh1WfefTyAOgFZbagTZetAfPMMlhRBRsBdNPewLSqP37jorAPQ0BdrRBcKwjNs5k/Bx1k/Pc
	RaworKGB88qa/AtUwU/KVIKfP4HOUdvHRr8g9m52WUtJy9Jha8hk13bjZZORww7EIDGweOa05I3
	w=
X-Google-Smtp-Source: AGHT+IGPd+KjmIE0DjKdyzheqxx7V2tnWxXtRtvRxv3s2YSsuC/GdIoP1X8EadJnWfKAsiS7G6kDTg==
X-Received: by 2002:a05:6a20:2446:b0:2e5:655c:7f84 with SMTP id adf61e73a8af0-32da8508eb2mr32333187637.54.1760455544752;
        Tue, 14 Oct 2025 08:25:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b67d313e7f9sm4287858a12.12.2025.10.14.08.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 19/20] hwmon: (max6620) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:25:14 -0700
Message-ID: <20251014152515.785203-20-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6620.c | 43 ++++++++++++-----------------------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
index 13201fb755c9..4316dcdd03fc 100644
--- a/drivers/hwmon/max6620.c
+++ b/drivers/hwmon/max6620.c
@@ -130,7 +130,6 @@ static const u8 target_reg[] = {
 
 struct max6620_data {
 	struct i2c_client *client;
-	struct mutex update_lock;
 	bool valid; /* false until following fields are valid */
 	unsigned long last_updated; /* in jiffies */
 
@@ -161,39 +160,36 @@ static int max6620_update_device(struct device *dev)
 {
 	struct max6620_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	int i;
-	int ret = 0;
-
-	mutex_lock(&data->update_lock);
+	int i, ret;
 
 	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
 		for (i = 0; i < 4; i++) {
 			ret = i2c_smbus_read_byte_data(client, config_reg[i]);
 			if (ret < 0)
-				goto error;
+				return ret;
 			data->fancfg[i] = ret;
 
 			ret = i2c_smbus_read_byte_data(client, dyn_reg[i]);
 			if (ret < 0)
-				goto error;
+				return ret;
 			data->fandyn[i] = ret;
 
 			ret = i2c_smbus_read_byte_data(client, tach_reg[i]);
 			if (ret < 0)
-				goto error;
+				return ret;
 			data->tach[i] = (ret << 3) & 0x7f8;
 			ret = i2c_smbus_read_byte_data(client, tach_reg[i] + 1);
 			if (ret < 0)
-				goto error;
+				return ret;
 			data->tach[i] |= (ret >> 5) & 0x7;
 
 			ret = i2c_smbus_read_byte_data(client, target_reg[i]);
 			if (ret < 0)
-				goto error;
+				return ret;
 			data->target[i] = (ret << 3) & 0x7f8;
 			ret = i2c_smbus_read_byte_data(client, target_reg[i] + 1);
 			if (ret < 0)
-				goto error;
+				return ret;
 			data->target[i] |= (ret >> 5) & 0x7;
 		}
 
@@ -204,16 +200,13 @@ static int max6620_update_device(struct device *dev)
 		 */
 		ret = i2c_smbus_read_byte_data(client, MAX6620_REG_FAULT);
 		if (ret < 0)
-			goto error;
+			return ret;
 		data->fault |= (ret >> 4) & (ret & 0x0F);
 
 		data->last_updated = jiffies;
 		data->valid = true;
 	}
-
-error:
-	mutex_unlock(&data->update_lock);
-	return ret;
+	return 0;
 }
 
 static umode_t
@@ -261,7 +254,6 @@ max6620_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_fan:
 		switch (attr) {
 		case hwmon_fan_alarm:
-			mutex_lock(&data->update_lock);
 			*val = !!(data->fault & BIT(channel));
 
 			/* Setting TACH count to re-enable fan fault detection */
@@ -270,21 +262,15 @@ max6620_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 				val2 = (data->target[channel] << 5) & 0xe0;
 				ret = i2c_smbus_write_byte_data(client,
 								target_reg[channel], val1);
-				if (ret < 0) {
-					mutex_unlock(&data->update_lock);
+				if (ret < 0)
 					return ret;
-				}
 				ret = i2c_smbus_write_byte_data(client,
 								target_reg[channel] + 1, val2);
-				if (ret < 0) {
-					mutex_unlock(&data->update_lock);
+				if (ret < 0)
 					return ret;
-				}
 
 				data->fault &= ~BIT(channel);
 			}
-			mutex_unlock(&data->update_lock);
-
 			break;
 		case hwmon_fan_div:
 			*val = max6620_fan_div_from_reg(data->fandyn[channel]);
@@ -334,7 +320,6 @@ max6620_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return ret;
 	data = dev_get_drvdata(dev);
 	client = data->client;
-	mutex_lock(&data->update_lock);
 
 	switch (type) {
 	case hwmon_fan:
@@ -360,8 +345,7 @@ max6620_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 				div = 5;
 				break;
 			default:
-				ret = -EINVAL;
-				goto error;
+				return -EINVAL;
 			}
 			data->fandyn[channel] &= 0x1F;
 			data->fandyn[channel] |= div << 5;
@@ -396,8 +380,6 @@ max6620_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		break;
 	}
 
-error:
-	mutex_unlock(&data->update_lock);
 	return ret;
 }
 
@@ -478,7 +460,6 @@ static int max6620_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->client = client;
-	mutex_init(&data->update_lock);
 
 	err = max6620_init_client(data);
 	if (err)
-- 
2.45.2

