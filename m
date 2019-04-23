Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88376C10F14
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B7882077C
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQQQ/VhE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbfDWNdV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:33:21 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45368 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDWNdU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 09:33:20 -0400
Received: by mail-pg1-f194.google.com with SMTP id y3so7613222pgk.12
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=n9qvVHdLoiJgCQaY7R3RnCVk3RBwDzs7n8e2FDJaOvU=;
        b=XQQQ/VhEc0VOXakBO/OMR4tfQFVNtDy34DylzJn3vXYeAAyYAAXQdT391Xf0NuSrNp
         WP50C9D7qmNQhPUxqU9FKUQi/ZEq3rCgkfTcdNWYEvAWaC+eNmQO7F4GOOrkqaZweEk8
         h78mev2kfEJww0syWUNjwM7FSYhZ5raLtNKejpguBEFqe9kiwBK0G7Bprjzv7tuHV2Pb
         LcqCPySGva02c/L2FXVsM4DeByT10EZ0PzLIj+Osb3EMxmLlBwKfr6+kVop08tc+I73o
         9Adgg9YEzJaBIv70TEKHrJK30RrhiZIm9wNuO1UzOyn5+qJRzL1C0g/WG+XNMKkzF4Xm
         WO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=n9qvVHdLoiJgCQaY7R3RnCVk3RBwDzs7n8e2FDJaOvU=;
        b=aEqdZ4udyhFX9QSb2OWOWdNkhA+2TzG6qSBpLHKDUw33QZRz/MEFPeTq1oFjGr4c8m
         bmPIraVTDDP+BnJidvfGEc1rEP0gmvITtph9qfy2dW8A+7TiWM9/dWa56qh9IXXxX0fl
         XirXO9fbDrMpF7xw3ioEKQZKdd7V11hlwvcEvK1nP1an7oiFfCrq23t0So5EHeHSwsVS
         tfd5W/7/fZuSSNL/BevlmU4ba/rhiE4msPPLhHtQ60h8+UYaflsxbpS71+miTLX4bFfx
         RN5GIEuJZeO8AimVBAZfDIbGeRcsd1x2lyU1fR6m+llYNJR8x/PNQsTqP+M5R/iVG8eb
         mAtw==
X-Gm-Message-State: APjAAAWLuXU4jXTWncmfVMJ4UADD5zSMLrJX2EZll7/eWfLvxqNijNbF
        nP5TbcOnqK8/VrA7/uVKg+GrY9t3
X-Google-Smtp-Source: APXvYqyA59NsGgh3xr3wZC6HW9Im87pZsiL+rlzQmdOM4z/YikGYHiU5fMZ0c8h2MwVFY0/1kDAhDQ==
X-Received: by 2002:a63:c61:: with SMTP id 33mr25261243pgm.293.1556026399974;
        Tue, 23 Apr 2019 06:33:19 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f27sm2788230pfk.111.2019.04.23.06.33.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 06:33:19 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 03/11] hwmon: (max6650) Improve error handling in max6650_init_client
Date:   Tue, 23 Apr 2019 06:33:03 -0700
Message-Id: <1556026391-15360-3-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
References: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Do not overwrite errors reported from i2c functions, and don't ignore
any errors.

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6650.c | 43 ++++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index b6b8f8edc1b0..ac05cc5627d7 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -618,8 +618,8 @@ static int max6650_init_client(struct max6650_data *data,
 			       struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	int config;
-	int err = -EIO;
+	int reg;
+	int err;
 	u32 voltage;
 	u32 prescale;
 	u32 target_rpm;
@@ -633,21 +633,20 @@ static int max6650_init_client(struct max6650_data *data,
 				 &prescale))
 		prescale = prescaler;
 
-	config = i2c_smbus_read_byte_data(client, MAX6650_REG_CONFIG);
-
-	if (config < 0) {
-		dev_err(dev, "Error reading config, aborting.\n");
-		return err;
+	reg = i2c_smbus_read_byte_data(client, MAX6650_REG_CONFIG);
+	if (reg < 0) {
+		dev_err(dev, "Error reading config register, aborting.\n");
+		return reg;
 	}
 
 	switch (voltage) {
 	case 0:
 		break;
 	case 5:
-		config &= ~MAX6650_CFG_V12;
+		reg &= ~MAX6650_CFG_V12;
 		break;
 	case 12:
-		config |= MAX6650_CFG_V12;
+		reg |= MAX6650_CFG_V12;
 		break;
 	default:
 		dev_err(dev, "illegal value for fan_voltage (%d)\n", voltage);
@@ -657,22 +656,22 @@ static int max6650_init_client(struct max6650_data *data,
 	case 0:
 		break;
 	case 1:
-		config &= ~MAX6650_CFG_PRESCALER_MASK;
+		reg &= ~MAX6650_CFG_PRESCALER_MASK;
 		break;
 	case 2:
-		config = (config & ~MAX6650_CFG_PRESCALER_MASK)
+		reg = (reg & ~MAX6650_CFG_PRESCALER_MASK)
 			 | MAX6650_CFG_PRESCALER_2;
 		break;
 	case  4:
-		config = (config & ~MAX6650_CFG_PRESCALER_MASK)
+		reg = (reg & ~MAX6650_CFG_PRESCALER_MASK)
 			 | MAX6650_CFG_PRESCALER_4;
 		break;
 	case  8:
-		config = (config & ~MAX6650_CFG_PRESCALER_MASK)
+		reg = (reg & ~MAX6650_CFG_PRESCALER_MASK)
 			 | MAX6650_CFG_PRESCALER_8;
 		break;
 	case 16:
-		config = (config & ~MAX6650_CFG_PRESCALER_MASK)
+		reg = (reg & ~MAX6650_CFG_PRESCALER_MASK)
 			 | MAX6650_CFG_PRESCALER_16;
 		break;
 	default:
@@ -680,16 +679,22 @@ static int max6650_init_client(struct max6650_data *data,
 	}
 
 	dev_info(dev, "Fan voltage: %dV, prescaler: %d.\n",
-		 (config & MAX6650_CFG_V12) ? 12 : 5,
-		 1 << (config & MAX6650_CFG_PRESCALER_MASK));
+		 (reg & MAX6650_CFG_V12) ? 12 : 5,
+		 1 << (reg & MAX6650_CFG_PRESCALER_MASK));
 
-	if (i2c_smbus_write_byte_data(client, MAX6650_REG_CONFIG, config)) {
+	err = i2c_smbus_write_byte_data(client, MAX6650_REG_CONFIG, reg);
+	if (err) {
 		dev_err(dev, "Config write error, aborting.\n");
 		return err;
 	}
 
-	data->config = config;
-	data->count = i2c_smbus_read_byte_data(client, MAX6650_REG_COUNT);
+	data->config = reg;
+	reg = i2c_smbus_read_byte_data(client, MAX6650_REG_COUNT);
+	if (reg < 0) {
+		dev_err(dev, "Failed to read count register, aborting.\n");
+		return reg;
+	}
+	data->count = reg;
 
 	if (!of_property_read_u32(client->dev.of_node, "maxim,fan-target-rpm",
 				  &target_rpm)) {
-- 
2.7.4

