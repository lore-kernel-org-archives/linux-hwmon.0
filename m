Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8C4C433DB
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Mar 2021 07:34:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 887AE64FC0
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Mar 2021 07:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbhCKHeP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Mar 2021 02:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbhCKHdc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Mar 2021 02:33:32 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31923C061761
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Mar 2021 23:33:08 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id o22so12434822oic.3
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Mar 2021 23:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LdNX2H9GDqWhqZJKhy5lxgTR0VNWqaadkM32szctxpE=;
        b=cbQRo6vDBOQTwvpt4uB56nzEvzBEFhLhJaJ5uAw2Qn68VHq4SzWUWzU2T1PN0lngsk
         cSl2EFWwQFj5pEL6PAM9PEzFk6h5bvrijhVDTrfoSyBMXsVy0e/b6sZbUXv0ds/AO8hU
         LGYqngZ2AeEEtKpzG49wkA5dVaO9fJ9TqD4D8H9Bd9NsgDW3gNyF50CGUSnUaSeuaNqJ
         8ZrAdADNn67dVPWrV8YqeioiaGOwMs66fsJgqM6wMnmn830rXSZJGZEr79Q0LVYRsyVD
         WUGpxv4CuhDbSPqUnVqmUM8Ah5Pr4ACmndko6jQyhVkIKi5M+esnwbL1fuhYms/L1rOi
         BT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=LdNX2H9GDqWhqZJKhy5lxgTR0VNWqaadkM32szctxpE=;
        b=p4KqBQgQ05UKBQRB3SQtuup2tXJBef2qHL+SZK2/GIyHiGQL7GXhxSuxJTFfJ4AtVH
         kqyNPL1IUigvwmDiypE70a0ohpQyrEq1OMsv9aiZMKvs18VaSNqezOduZRi8Xx4VFooY
         BkO49fXDHm2C/s37mBpzuEIZWv9zyaPIhahw/utZUidUV0dVTZK02z8O77iFyGj/ITl7
         JanWOiwJ5eCV+OSO/vUdOLvNHYd+uR103Ir+KW9QnxooeWwBtXWs/+oxuxQgDebmosKf
         vAsqJdS6WF2nEdZONmm1OjM3QBSEu4037iO3b2VHqnjlmWqwtGzH/Z0Txk5MrtmjK3M6
         rD1Q==
X-Gm-Message-State: AOAM533A4gCEEj0thdsDQgW/nDg3DuuEnYPq9mBMjv+3bWNTjrxDaTrL
        GwucP4XKcBOue96hF682PpQSh2vzSPo=
X-Google-Smtp-Source: ABdhPJzAaNIPCPJqRtbWNs3yfJ9Rb6unNSjN3ky1mXPcWJ44lG5Q39ux5qpbbo7fC47gQjO8wnZgbA==
X-Received: by 2002:a05:6808:341:: with SMTP id j1mr5409403oie.173.1615447987319;
        Wed, 10 Mar 2021 23:33:07 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x3sm432514oif.22.2021.03.10.23.33.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 23:33:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: [PATCH 2/3] hwmon: (adm9240) Store i2c device instead of client in local data
Date:   Wed, 10 Mar 2021 23:33:01 -0800
Message-Id: <20210311073302.221954-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311073302.221954-1-linux@roeck-us.net>
References: <20210311073302.221954-1-linux@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

We only use the pointer to i2c_client to access &client->dev.
Store the device pointer directly instead of retrieving it
from i2c_client.

Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adm9240.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index 3bbdd662c9e4..7404082c7a3f 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -123,7 +123,7 @@ static inline unsigned int AOUT_FROM_REG(u8 reg)
 
 /* per client data */
 struct adm9240_data {
-	struct i2c_client *client;
+	struct device *dev;
 	struct regmap *regmap;
 	struct mutex update_lock;
 	char valid;
@@ -160,7 +160,7 @@ static int adm9240_write_fan_div(struct adm9240_data *data, int nr,
 	err = regmap_write(data->regmap, ADM9240_REG_VID_FAN_DIV, reg);
 	if (err < 0)
 		return err;
-	dev_dbg(&data->client->dev,
+	dev_dbg(data->dev,
 		"fan%d clock divider changed from %u to %u\n",
 		nr + 1, 1 << old, 1 << fan_div);
 
@@ -507,7 +507,6 @@ static ssize_t fan_min_store(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm9240_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
 	int nr = attr->index;
 	u8 new_div;
 	unsigned long val;
@@ -523,14 +522,14 @@ static ssize_t fan_min_store(struct device *dev,
 		data->fan_min[nr] = 255;
 		new_div = data->fan_div[nr];
 
-		dev_dbg(&client->dev, "fan%u low limit set disabled\n",
+		dev_dbg(data->dev, "fan%u low limit set disabled\n",
 				nr + 1);
 
 	} else if (val < 1350000 / (8 * 254)) {
 		new_div = 3;
 		data->fan_min[nr] = 254;
 
-		dev_dbg(&client->dev, "fan%u low limit set minimum %u\n",
+		dev_dbg(data->dev, "fan%u low limit set minimum %u\n",
 				nr + 1, FAN_FROM_REG(254, 1 << new_div));
 
 	} else {
@@ -546,7 +545,7 @@ static ssize_t fan_min_store(struct device *dev,
 
 		data->fan_min[nr] = new_min;
 
-		dev_dbg(&client->dev, "fan%u low limit set fan speed %u\n",
+		dev_dbg(data->dev, "fan%u low limit set fan speed %u\n",
 				nr + 1, FAN_FROM_REG(new_min, 1 << new_div));
 	}
 
@@ -663,7 +662,7 @@ static ssize_t alarm_store(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&data->update_lock);
 	if (err < 0)
 		return err;
-	dev_dbg(&data->client->dev, "chassis intrusion latch cleared\n");
+	dev_dbg(data->dev, "chassis intrusion latch cleared\n");
 
 	return count;
 }
@@ -755,7 +754,7 @@ static int adm9240_detect(struct i2c_client *new_client,
 	return 0;
 }
 
-static int adm9240_init_client(struct i2c_client *client, struct adm9240_data *data)
+static int adm9240_init_client(struct adm9240_data *data)
 {
 	u8 conf, mode;
 	int err;
@@ -770,13 +769,13 @@ static int adm9240_init_client(struct i2c_client *client, struct adm9240_data *d
 
 	data->vrm = vid_which_vrm(); /* need this to report vid as mV */
 
-	dev_info(&client->dev, "Using VRM: %d.%d\n", data->vrm / 10,
-			data->vrm % 10);
+	dev_info(data->dev, "Using VRM: %d.%d\n", data->vrm / 10,
+		 data->vrm % 10);
 
 	if (conf & 1) { /* measurement cycle running: report state */
 
-		dev_info(&client->dev, "status: config 0x%02x mode %u\n",
-				conf, mode);
+		dev_info(data->dev, "status: config 0x%02x mode %u\n",
+			 conf, mode);
 
 	} else { /* cold start: open limits before starting chip */
 		int i;
@@ -809,7 +808,7 @@ static int adm9240_init_client(struct i2c_client *client, struct adm9240_data *d
 		if (err < 0)
 			return err;
 
-		dev_info(&client->dev,
+		dev_info(data->dev,
 			 "cold start: config was 0x%02x mode %u\n", conf, mode);
 	}
 
@@ -834,13 +833,13 @@ static int adm9240_probe(struct i2c_client *new_client)
 	if (!data)
 		return -ENOMEM;
 
-	data->client = new_client;
+	data->dev = dev;
 	mutex_init(&data->update_lock);
 	data->regmap = devm_regmap_init_i2c(new_client, &adm9240_regmap_config);
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
 
-	err = adm9240_init_client(new_client, data);
+	err = adm9240_init_client(data);
 	if (err < 0)
 		return err;
 
-- 
2.17.1

