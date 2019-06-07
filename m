Return-Path: <SRS0=IYsF=UG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6ECAC2BCA1
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8FEEC207E0
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImtApv4f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729653AbfFGRXc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jun 2019 13:23:32 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37528 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbfFGRXc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jun 2019 13:23:32 -0400
Received: by mail-pf1-f194.google.com with SMTP id 19so726583pfa.4
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Jun 2019 10:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=c5LeBqZr5bSzZQuzWyz7yfRastEkz+LRKsZYYj1xzik=;
        b=ImtApv4fvx3X3MHyy4qWnjYc8VTYSBNLVDeU9nvbTcHmzGEeICJT5s3PzZCO/QDhXd
         tR7uUaNkguEzCN4VHLGr2FfVvPY5KitiDChZnemsy7iwWYpIfRH2ZCQK9lEGVmm0utsu
         MZ/LPEvfJEB94/WJ7ZUsE0sDL9YWBb4MTVHnQhN8Bcb8CUYlyMPp5RPqZ3gMtfpfM2U+
         UfmdavNvj1rUydZbTzjTTxAsnsHfjOYY3+9uNu1wGwyZMr0+A6fM5vn4SiXxsph+OVBo
         TgMfbdW1W6RRwNZwCdUbgfPxROYz0EeaIh3NKkH+8JcOeJmhwpbAdHEainmCqVb+lLE8
         w0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=c5LeBqZr5bSzZQuzWyz7yfRastEkz+LRKsZYYj1xzik=;
        b=QlFZW92p4ftS+Xj7O34iZswCY0YRHTl2r1fhhklqfxK8TgxQVbbmI3INEfPaciWiBx
         kcJKpW5kOzSGIF6R6WUuuHAxpvssos/Ee4YMBM6XwFJMFFWJze/SHw/68JB0Q12B93H/
         kEx0UFmQAxucYlyAl1lz3uBv0D7LEH7XlQlhDKmH8Db5BOapNrg2A+O/Ch6O8URHmPnD
         dtDXW23WTkP0zR3otkIJZkZiHd6Lvw1WKTv20ga3SjgpLYbWwOq+qCu4+uz/+F2AJHsn
         EizVqZ61j8Dzv9ddKFNne7uXLpSnZNXF3jHzXCtIEgdQbC55BaXTd2VgLfNyI3+4HFTa
         42LQ==
X-Gm-Message-State: APjAAAVCnRs4FuL1N1jIvyQdJhKVRwnw5s3jG0M4slv1kmybcQFTHKze
        S8wpndcvzC6HICQgWqMrr6N5GeX3
X-Google-Smtp-Source: APXvYqy7TAtO/IyTGK7E2Jo1IrWAMA8vlb45XlyUyxiTYHDBfBWH5KbLGnfGzGyRe8HuIbr2PkXraw==
X-Received: by 2002:a65:62ca:: with SMTP id m10mr732644pgv.57.1559928211241;
        Fri, 07 Jun 2019 10:23:31 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b15sm3421352pfi.141.2019.06.07.10.23.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 10:23:30 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH v2 03/10] hwmon: (max6650) Improve error handling in max6650_init_client
Date:   Fri,  7 Jun 2019 10:23:18 -0700
Message-Id: <1559928205-14030-3-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
References: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Do not overwrite errors reported from i2c functions, and don't ignore
any errors.

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 drivers/hwmon/max6650.c | 43 ++++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 461484e7828a..caede4d3e21a 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -604,8 +604,8 @@ static int max6650_init_client(struct max6650_data *data,
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
@@ -619,21 +619,20 @@ static int max6650_init_client(struct max6650_data *data,
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
@@ -643,22 +642,22 @@ static int max6650_init_client(struct max6650_data *data,
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
@@ -666,16 +665,22 @@ static int max6650_init_client(struct max6650_data *data,
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

