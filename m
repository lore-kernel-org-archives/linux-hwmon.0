Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09781C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jan 2022 16:35:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243419AbiANQfX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jan 2022 11:35:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243411AbiANQfW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jan 2022 11:35:22 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E56C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:22 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id t4-20020a05683022e400b00591aaf48277so10619157otc.13
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xUFzKGCbx4IN3SnL4u9eeBwHx5SXWvqbx0m3iWgkCH0=;
        b=WUDvAWwx/WvB0DxSq/V3ME49tkCqJppyr7ZCzFkttsm+ixyO9+pxzNsRfnECg6oJum
         gQ2NfGht06bm9/QzRxapAe9M/0wUvuShkat3jM6j+DvuiX0Q63NhKdwZKaowprOqsO6n
         KNuA7oKRTSc1DCHd/zyrOzOg3an6LwlJi+rs+G2tOOt5FUHQRjVYpHQpslDkrUXm3sYg
         cCPt5P7vgTS5N0m4v7ux7HK4x0/WClORvLUcNIzK3dNMlZ61Nxc0m3lgYPXBlPTXo2zL
         ZyunRQiMNkTY4Ycb98N2p41/aof7d846ruUyzg9HWmz5/6iW7X9rJX6DHe/J2pyJN8Id
         3Itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=xUFzKGCbx4IN3SnL4u9eeBwHx5SXWvqbx0m3iWgkCH0=;
        b=BViYlb1fuIeTn184S7LXqJeJ6OSTxjeJR9jzEjpjcXP5vGmW17aKLNVDcuTopgvLVB
         /baaF0IideSAfPVYOTrsMxYSE8yPuYIXIHes8W/1lvF+PknYot/Y43yIJqIZG0SAiMeq
         Cdpkxvq6H9KcrKAp4MwXhvEYhhu9Ox2Yk8zvY6gG88cbdpEO2EWvarjqXApn0LC+WCRI
         oWFU1fJq/pV8VRko6/z4BsI/e76cqgFFVm/zKQIb34XwUDrpuirHWvoIHI9FQJy2syiT
         J9+lDZ8qg+aC4t2o6utolqh25lKpk+6NhLj0sCV6TU8DFUqooTiRk+dHXUN0d03Y+PMP
         hMcg==
X-Gm-Message-State: AOAM5315ltJV/34CUr9PMEomeqrl8o198MpL45Onc0G4s+gyqyddimos
        n85wvNCsjNihy83wDhuH+qmLe+/Qztw=
X-Google-Smtp-Source: ABdhPJzUWUghzQjCPz2YbVM1vdmpO9yIv1s+mzM8VaakoLxcHZYDbErdiynepxfQVjQVoDcE911rXQ==
X-Received: by 2002:a05:6830:2424:: with SMTP id k4mr5475790ots.241.1642178121700;
        Fri, 14 Jan 2022 08:35:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bb20sm2190480oob.4.2022.01.14.08.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 08:35:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/8] hwmon: (lm83) Replace new_client with client
Date:   Fri, 14 Jan 2022 08:35:07 -0800
Message-Id: <20220114163512.1094472-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220114163512.1094472-1-linux@roeck-us.net>
References: <20220114163512.1094472-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

It has no value to name a variable 'new_client' in probe and detect
functions; it is obvious that the client is new. Use 'client' as
variable name instead.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm83.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/lm83.c b/drivers/hwmon/lm83.c
index 2bb4bceef551..fdd89cc481fa 100644
--- a/drivers/hwmon/lm83.c
+++ b/drivers/hwmon/lm83.c
@@ -272,10 +272,10 @@ static const struct attribute_group lm83_group_opt = {
  */
 
 /* Return 0 if detection is successful, -ENODEV otherwise */
-static int lm83_detect(struct i2c_client *new_client,
+static int lm83_detect(struct i2c_client *client,
 		       struct i2c_board_info *info)
 {
-	struct i2c_adapter *adapter = new_client->adapter;
+	struct i2c_adapter *adapter = client->adapter;
 	const char *name;
 	u8 man_id, chip_id;
 
@@ -283,20 +283,20 @@ static int lm83_detect(struct i2c_client *new_client,
 		return -ENODEV;
 
 	/* Detection */
-	if ((i2c_smbus_read_byte_data(new_client, LM83_REG_R_STATUS1) & 0xA8) ||
-	    (i2c_smbus_read_byte_data(new_client, LM83_REG_R_STATUS2) & 0x48) ||
-	    (i2c_smbus_read_byte_data(new_client, LM83_REG_R_CONFIG) & 0x41)) {
+	if ((i2c_smbus_read_byte_data(client, LM83_REG_R_STATUS1) & 0xA8) ||
+	    (i2c_smbus_read_byte_data(client, LM83_REG_R_STATUS2) & 0x48) ||
+	    (i2c_smbus_read_byte_data(client, LM83_REG_R_CONFIG) & 0x41)) {
 		dev_dbg(&adapter->dev, "LM83 detection failed at 0x%02x\n",
-			new_client->addr);
+			client->addr);
 		return -ENODEV;
 	}
 
 	/* Identification */
-	man_id = i2c_smbus_read_byte_data(new_client, LM83_REG_R_MAN_ID);
+	man_id = i2c_smbus_read_byte_data(client, LM83_REG_R_MAN_ID);
 	if (man_id != 0x01)	/* National Semiconductor */
 		return -ENODEV;
 
-	chip_id = i2c_smbus_read_byte_data(new_client, LM83_REG_R_CHIP_ID);
+	chip_id = i2c_smbus_read_byte_data(client, LM83_REG_R_CHIP_ID);
 	switch (chip_id) {
 	case 0x03:
 		name = "lm83";
@@ -324,17 +324,17 @@ static const struct i2c_device_id lm83_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm83_id);
 
-static int lm83_probe(struct i2c_client *new_client)
+static int lm83_probe(struct i2c_client *client)
 {
 	struct device *hwmon_dev;
 	struct lm83_data *data;
 
-	data = devm_kzalloc(&new_client->dev, sizeof(struct lm83_data),
+	data = devm_kzalloc(&client->dev, sizeof(struct lm83_data),
 			    GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->client = new_client;
+	data->client = client;
 	mutex_init(&data->update_lock);
 
 	/*
@@ -344,11 +344,11 @@ static int lm83_probe(struct i2c_client *new_client)
 	 * declare 1 and 3 common, and then 2 and 4 only for the LM83.
 	 */
 	data->groups[0] = &lm83_group;
-	if (i2c_match_id(lm83_id, new_client)->driver_data == lm83)
+	if (i2c_match_id(lm83_id, client)->driver_data == lm83)
 		data->groups[1] = &lm83_group_opt;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(&new_client->dev,
-							   new_client->name,
+	hwmon_dev = devm_hwmon_device_register_with_groups(&client->dev,
+							   client->name,
 							   data, data->groups);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
-- 
2.33.0

