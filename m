Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0139C47089
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Dec 2022 17:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiLERhQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Dec 2022 12:37:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbiLERhF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2022 12:37:05 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E9DDB7
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 09:36:53 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id jn7so11475946plb.13
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Dec 2022 09:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=02Cxsd68sg4HVyXmlBW0gr0pnDWYNbGXuPlnysQaoHY=;
        b=eQ6V4wvGWfQmBvD5qQEvew4byJnJvPsAmpWWVbvqk5yLwhNqEQyp1USSdjHx3cB/t+
         QIwiyWLFJmrgPfgof+jFFMzXEdy11L+6psdoPLTwDSMJB+M6gFYA7DtsIldTjAy4bJ+S
         ZMaJedhOzkMzvpcaPnxTTkyWmq6wrEb+Kr/YgqECVY6BzNbueBikuYMYUWQvNELKrFoE
         W0h+ltVeAcVIE4N5zudCBLoBgA2Hq+B3HpO9B3wMZIYY+tcEmcMxdBjx75OE9TAwX7qk
         nRaddHjdIMpqyCT9Jd0EIEfS+FODGRgrfkUBY3q0ZK4nNyICBlkVn/5bLMIdbYabIu8h
         ACQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02Cxsd68sg4HVyXmlBW0gr0pnDWYNbGXuPlnysQaoHY=;
        b=tQXavDTZxVP9cI8aGstWjJ1BqMoPC+Zrcrxaqw6z7QkbFzPf8RtnFMjvx6Rn/xeALO
         4VxAzr5doflVZpo+Rq6nXeSLr9lSFVxIxf0mYcT3FvwWiRk5u3rQXo/JD3MgxyXCeQrB
         FTJukaUkapg/KMke+NzjqyuRu14Kp5ei+KEym5Vrot1UqsDpWqoMXie5qH1ScX/karoq
         4RI9k+E2Oo1n3G/S0Zk4QBytqUpEtcX4mqiv1IQJrqdiUCZOU9nHdKk/X/93xuF+gOLc
         CJL92XdKvHoZqnmoeGEkElENBMyalaERJ0GvwOob4cpTSWQLZqMiHHlxBhzfow237WSP
         LAbA==
X-Gm-Message-State: ANoB5plD1eENN6eAorazmVLDgRwnzpM+jkWjJWifP6xpIOtYfm8xHF16
        zvI8Dx3e4Ogi2jdqMupKnno=
X-Google-Smtp-Source: AA0mqf6QfC/TBr2+S2ECFkFjKXL/QLdQCs0hrbPfW1zR68K36IXb2XcN0K1mx98NWYxFZFMPtVZw5w==
X-Received: by 2002:a17:90a:7881:b0:219:f1a2:b641 with SMTP id x1-20020a17090a788100b00219f1a2b641mr1168605pjk.97.1670261812713;
        Mon, 05 Dec 2022 09:36:52 -0800 (PST)
Received: from localhost.localdomain ([193.122.98.110])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b001869f2120a4sm10851081pli.94.2022.12.05.09.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 09:36:52 -0800 (PST)
From:   Xingjiang Qiao <nanpuyue@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Michael Shych <michaelsh@nvidia.com>,
        Xingjiang Qiao <nanpuyue@gmail.com>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (emc2305) fix unable to probe emc2301/2/3/4
Date:   Tue,  6 Dec 2022 01:36:10 +0800
Message-Id: <20221205173611.145571-1-nanpuyue@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The definitions of 'EMC2305_REG_PRODUCT_ID' and 'EMC2305_REG_DEVICE' are
both '0xfd', they actually return the same value, but the values returned
by emc2301/2/3/4/5 are different, so probe emc2301/2/3/4 will fail, This
patch fixes that.

The second parameter of 'emc2305_probe' is actually useless, it is more
appropriate to use 'probe_new' instead of 'probe' here.

Signed-off-by: Xingjiang Qiao <nanpuyue@gmail.com>
---
 drivers/hwmon/emc2305.c | 58 ++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 39 deletions(-)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index aa1f25add0b6..4df84065cbfb 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -21,9 +21,7 @@ emc2305_normal_i2c[] = { 0x27, 0x2c, 0x2d, 0x2e, 0x2f, 0x4c, 0x4d, I2C_CLIENT_EN
 #define EMC2305_FAN_MAX			0xff
 #define EMC2305_FAN_MIN			0x00
 #define EMC2305_FAN_MAX_STATE		10
-#define EMC2305_DEVICE			0x34
 #define EMC2305_VENDOR			0x5d
-#define EMC2305_REG_PRODUCT_ID		0xfd
 #define EMC2305_TACH_REGS_UNUSE_BITS	3
 #define EMC2305_TACH_CNT_MULTIPLIER	0x02
 #define EMC2305_TACH_RANGE_MIN		480
@@ -488,43 +486,14 @@ static const struct hwmon_chip_info emc2305_chip_info = {
 	.info = emc2305_info,
 };
 
-static int emc2305_identify(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct emc2305_data *data = i2c_get_clientdata(client);
-	int ret;
-
-	ret = i2c_smbus_read_byte_data(client, EMC2305_REG_PRODUCT_ID);
-	if (ret < 0)
-		return ret;
-
-	switch (ret) {
-	case EMC2305:
-		data->pwm_num = 5;
-		break;
-	case EMC2303:
-		data->pwm_num = 3;
-		break;
-	case EMC2302:
-		data->pwm_num = 2;
-		break;
-	case EMC2301:
-		data->pwm_num = 1;
-		break;
-	default:
-		return -ENODEV;
-	}
-
-	return 0;
-}
-
-static int emc2305_probe(struct i2c_client *client, const struct i2c_device_id *id)
+static int emc2305_probe(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
 	struct device *dev = &client->dev;
 	struct emc2305_data *data;
 	struct emc2305_platform_data *pdata;
 	int vendor, device;
+	int pwm_num;
 	int ret;
 	int i;
 
@@ -536,20 +505,31 @@ static int emc2305_probe(struct i2c_client *client, const struct i2c_device_id *
 		return -ENODEV;
 
 	device = i2c_smbus_read_byte_data(client, EMC2305_REG_DEVICE);
-	if (device != EMC2305_DEVICE)
+	switch (device) {
+	case EMC2305:
+		pwm_num = 5;
+		break;
+	case EMC2303:
+		pwm_num = 3;
+		break;
+	case EMC2302:
+		pwm_num = 2;
+		break;
+	case EMC2301:
+		pwm_num = 1;
+		break;
+	default:
 		return -ENODEV;
+	}
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
 	i2c_set_clientdata(client, data);
+	data->pwm_num = pwm_num;
 	data->client = client;
 
-	ret = emc2305_identify(dev);
-	if (ret)
-		return ret;
-
 	pdata = dev_get_platdata(&client->dev);
 	if (pdata) {
 		if (!pdata->max_state || pdata->max_state > EMC2305_FAN_MAX_STATE)
@@ -604,10 +584,10 @@ static void emc2305_remove(struct i2c_client *client)
 
 static struct i2c_driver emc2305_driver = {
 	.class  = I2C_CLASS_HWMON,
+	.probe_new = emc2305_probe,
 	.driver = {
 		.name = "emc2305",
 	},
-	.probe    = emc2305_probe,
 	.remove	  = emc2305_remove,
 	.id_table = emc2305_ids,
 	.address_list = emc2305_normal_i2c,
-- 
2.38.1

