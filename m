Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE71C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Dec 2021 20:52:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350246AbhLWUw0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Dec 2021 15:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245049AbhLWUwZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Dec 2021 15:52:25 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61BAC061401
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Dec 2021 12:52:25 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so8393034otu.10
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Dec 2021 12:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y/CqG/P+In031tedFgLkZQQdXMnHVlTZcnLwea9+0fE=;
        b=cEfirlX6NQhccghtAASu1oPtab6ELnLDZkx6Xs08bnK4+ruaFDGxeJC75g8zYolrbD
         Xvtimkt3WFvc5TgbS5xA1zussxX0+SDQT1gRLjUOk3CATzqtLzsSnhDiMjguaRhdkGL2
         wzcTPLjiCLS6xcmzzcki0rYz4GYtlFqSO63KqIEoKaM6JcLnF0JtpS6/bc0JYdnjYgNV
         Y9hMkdItC0R4FOvDSsD5FCxqaaceFJtG5KnEYW94/M9KaKCQU2NND9m5ECbvwoeuAnlS
         TB9o9Z2/3nzRywtPiFK5bne0WLzPWm2sJ3WUrC5F9oNBNd5pRAeDmnfK5p+lvAV6m7Um
         Y/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Y/CqG/P+In031tedFgLkZQQdXMnHVlTZcnLwea9+0fE=;
        b=QmTKkPHgK5BPaQSl+kh9bUs0cmXBGMX/1ND8IdeUc7Ds8gvOx65GZ8xghhjgQs4QP9
         9tz/cRdgwT3/U+yVrlanP7amAAoaAEUwhr5HtdqoV2q4I946EebJDDGVvcZ+0TDieU6l
         Lya+mGuo2ZFdRUBpkz1s5m1+ESjvBNpHEhq7g0/VomXxc9NiZpMtbDZHkhXgFCCpbLoz
         ujVz0j83iUCqYYKVJ2dQuru+s/9JnkvogmE3DaaJm5bmG1T9LvRHVvEo/3MtvEzre8VL
         DGjeFpmVgVodQcGc+yutxaP6v5rNne5yhz+EjBpHbiyMU7D8xEoVobLBiv4p5mB23bsP
         Fg8Q==
X-Gm-Message-State: AOAM5314h6pjJkcwD9/cXBr53KQYGoGhdfGYq1hVVHIpFReKz+h69pe4
        m4pJhHHnES5mRpg9BDPzUE0uarUNcOM=
X-Google-Smtp-Source: ABdhPJw28aZAxWr543eYgSmnnymqW8VoyL/ZI5dpr46EUCQGqLXbpYCdriqAJFbhrWtdqfqbyEAL1g==
X-Received: by 2002:a05:6830:4103:: with SMTP id w3mr2498842ott.207.1640292744510;
        Thu, 23 Dec 2021 12:52:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g22sm265707otj.0.2021.12.23.12.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 12:52:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Cosmin Tanislav <demonsingur@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 1/6] hwmon: adt7x10: Convert to use regmap
Date:   Thu, 23 Dec 2021 12:52:14 -0800
Message-Id: <20211223205219.2184104-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211223205219.2184104-1-linux@roeck-us.net>
References: <20211223205219.2184104-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Using regmap lets us use the regmap subsystem for SPI vs. I2C register
accesses. It lets us hide access differences in backend code and lets
the common code just access registers without knowing their size.
We can also use regmap for register caching.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/Kconfig   |   1 +
 drivers/hwmon/adt7310.c |  88 +++++++++++++---
 drivers/hwmon/adt7410.c |  77 ++++++++++----
 drivers/hwmon/adt7x10.c | 225 +++++++++++++++-------------------------
 drivers/hwmon/adt7x10.h |  10 +-
 5 files changed, 213 insertions(+), 188 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 64bd3dfba2c4..b33b6934eeb7 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -174,6 +174,7 @@ config SENSORS_ADM9240
 
 config SENSORS_ADT7X10
 	tristate
+	select REGMAP
 	help
 	  This module contains common code shared by the ADT7310/ADT7320 and
 	  ADT7410/ADT7420 temperature monitoring chip drivers.
diff --git a/drivers/hwmon/adt7310.c b/drivers/hwmon/adt7310.c
index c40cac16af68..a83092470bce 100644
--- a/drivers/hwmon/adt7310.c
+++ b/drivers/hwmon/adt7310.c
@@ -8,6 +8,7 @@
 
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/regmap.h>
 #include <linux/spi/spi.h>
 #include <asm/unaligned.h>
 
@@ -38,16 +39,13 @@ static const u8 adt7310_reg_table[] = {
 
 #define AD7310_COMMAND(reg) (adt7310_reg_table[(reg)] << ADT7310_CMD_REG_OFFSET)
 
-static int adt7310_spi_read_word(struct device *dev, u8 reg)
+static int adt7310_spi_read_word(struct spi_device *spi, u8 reg)
 {
-	struct spi_device *spi = to_spi_device(dev);
-
 	return spi_w8r16be(spi, AD7310_COMMAND(reg) | ADT7310_CMD_READ);
 }
 
-static int adt7310_spi_write_word(struct device *dev, u8 reg, u16 data)
+static int adt7310_spi_write_word(struct spi_device *spi, u8 reg, u16 data)
 {
-	struct spi_device *spi = to_spi_device(dev);
 	u8 buf[3];
 
 	buf[0] = AD7310_COMMAND(reg);
@@ -56,17 +54,13 @@ static int adt7310_spi_write_word(struct device *dev, u8 reg, u16 data)
 	return spi_write(spi, buf, sizeof(buf));
 }
 
-static int adt7310_spi_read_byte(struct device *dev, u8 reg)
+static int adt7310_spi_read_byte(struct spi_device *spi, u8 reg)
 {
-	struct spi_device *spi = to_spi_device(dev);
-
 	return spi_w8r8(spi, AD7310_COMMAND(reg) | ADT7310_CMD_READ);
 }
 
-static int adt7310_spi_write_byte(struct device *dev, u8 reg,
-	u8 data)
+static int adt7310_spi_write_byte(struct spi_device *spi, u8 reg, u8 data)
 {
-	struct spi_device *spi = to_spi_device(dev);
 	u8 buf[2];
 
 	buf[0] = AD7310_COMMAND(reg);
@@ -75,17 +69,77 @@ static int adt7310_spi_write_byte(struct device *dev, u8 reg,
 	return spi_write(spi, buf, sizeof(buf));
 }
 
-static const struct adt7x10_ops adt7310_spi_ops = {
-	.read_word = adt7310_spi_read_word,
-	.write_word = adt7310_spi_write_word,
-	.read_byte = adt7310_spi_read_byte,
-	.write_byte = adt7310_spi_write_byte,
+static bool adt7310_regmap_is_volatile(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ADT7X10_TEMPERATURE:
+	case ADT7X10_STATUS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int adt7310_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct spi_device *spi = context;
+	int regval;
+
+	switch (reg) {
+	case ADT7X10_TEMPERATURE:
+	case ADT7X10_T_ALARM_HIGH:
+	case ADT7X10_T_ALARM_LOW:
+	case ADT7X10_T_CRIT:
+		regval = adt7310_spi_read_word(spi, reg);
+		break;
+	default:
+		regval = adt7310_spi_read_byte(spi, reg);
+		break;
+	}
+	if (regval < 0)
+		return regval;
+	*val = regval;
+	return 0;
+}
+
+static int adt7310_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct spi_device *spi = context;
+	int ret;
+
+	switch (reg) {
+	case ADT7X10_TEMPERATURE:
+	case ADT7X10_T_ALARM_HIGH:
+	case ADT7X10_T_ALARM_LOW:
+	case ADT7X10_T_CRIT:
+		ret = adt7310_spi_write_word(spi, reg, val);
+		break;
+	default:
+		ret = adt7310_spi_write_byte(spi, reg, val);
+		break;
+	}
+	return ret;
+}
+
+static const struct regmap_config adt7310_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.cache_type = REGCACHE_RBTREE,
+	.volatile_reg = adt7310_regmap_is_volatile,
+	.reg_read = adt7310_reg_read,
+	.reg_write = adt7310_reg_write,
 };
 
 static int adt7310_spi_probe(struct spi_device *spi)
 {
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init(&spi->dev, NULL, spi, &adt7310_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
 	return adt7x10_probe(&spi->dev, spi_get_device_id(spi)->name, spi->irq,
-			&adt7310_spi_ops);
+			     regmap);
 }
 
 static int adt7310_spi_remove(struct spi_device *spi)
diff --git a/drivers/hwmon/adt7410.c b/drivers/hwmon/adt7410.c
index 973db057427b..b1f4497dca05 100644
--- a/drivers/hwmon/adt7410.c
+++ b/drivers/hwmon/adt7410.c
@@ -9,43 +9,82 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/i2c.h>
+#include <linux/regmap.h>
 
 #include "adt7x10.h"
 
-static int adt7410_i2c_read_word(struct device *dev, u8 reg)
+static bool adt7410_regmap_is_volatile(struct device *dev, unsigned int reg)
 {
-	return i2c_smbus_read_word_swapped(to_i2c_client(dev), reg);
+	switch (reg) {
+	case ADT7X10_TEMPERATURE:
+	case ADT7X10_STATUS:
+		return true;
+	default:
+		return false;
+	}
 }
 
-static int adt7410_i2c_write_word(struct device *dev, u8 reg, u16 data)
+static int adt7410_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
-	return i2c_smbus_write_word_swapped(to_i2c_client(dev), reg, data);
-}
+	struct i2c_client *client = context;
+	int regval;
 
-static int adt7410_i2c_read_byte(struct device *dev, u8 reg)
-{
-	return i2c_smbus_read_byte_data(to_i2c_client(dev), reg);
+	switch (reg) {
+	case ADT7X10_TEMPERATURE:
+	case ADT7X10_T_ALARM_HIGH:
+	case ADT7X10_T_ALARM_LOW:
+	case ADT7X10_T_CRIT:
+		regval = i2c_smbus_read_word_swapped(client, reg);
+		break;
+	default:
+		regval = i2c_smbus_read_byte_data(client, reg);
+		break;
+	}
+	if (regval < 0)
+		return regval;
+	*val = regval;
+	return 0;
 }
 
-static int adt7410_i2c_write_byte(struct device *dev, u8 reg, u8 data)
+static int adt7410_reg_write(void *context, unsigned int reg, unsigned int val)
 {
-	return i2c_smbus_write_byte_data(to_i2c_client(dev), reg, data);
+	struct i2c_client *client = context;
+	int ret;
+
+	switch (reg) {
+	case ADT7X10_TEMPERATURE:
+	case ADT7X10_T_ALARM_HIGH:
+	case ADT7X10_T_ALARM_LOW:
+	case ADT7X10_T_CRIT:
+		ret = i2c_smbus_write_word_swapped(client, reg, val);
+		break;
+	default:
+		ret = i2c_smbus_write_byte_data(client, reg, val);
+		break;
+	}
+	return ret;
 }
 
-static const struct adt7x10_ops adt7410_i2c_ops = {
-	.read_word = adt7410_i2c_read_word,
-	.write_word = adt7410_i2c_write_word,
-	.read_byte = adt7410_i2c_read_byte,
-	.write_byte = adt7410_i2c_write_byte,
+static const struct regmap_config adt7410_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = ADT7X10_ID,
+	.cache_type = REGCACHE_RBTREE,
+	.volatile_reg = adt7410_regmap_is_volatile,
+	.reg_read = adt7410_reg_read,
+	.reg_write = adt7410_reg_write,
 };
 
 static int adt7410_i2c_probe(struct i2c_client *client)
 {
-	if (!i2c_check_functionality(client->adapter,
-			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
-		return -ENODEV;
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init(&client->dev, NULL, client,
+				  &adt7410_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
-	return adt7x10_probe(&client->dev, NULL, client->irq, &adt7410_i2c_ops);
+	return adt7x10_probe(&client->dev, NULL, client->irq, regmap);
 }
 
 static int adt7410_i2c_remove(struct i2c_client *client)
diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
index e9d33aa78a19..05dd48b707b4 100644
--- a/drivers/hwmon/adt7x10.c
+++ b/drivers/hwmon/adt7x10.c
@@ -18,6 +18,7 @@
 #include <linux/mutex.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/regmap.h>
 
 #include "adt7x10.h"
 
@@ -53,46 +54,15 @@
 
 /* Each client has this additional data */
 struct adt7x10_data {
-	const struct adt7x10_ops *ops;
+	struct regmap		*regmap;
 	const char		*name;
 	struct device		*hwmon_dev;
 	struct mutex		update_lock;
 	u8			config;
 	u8			oldconfig;
-	bool			valid;		/* true if registers valid */
-	unsigned long		last_updated;	/* In jiffies */
-	s16			temp[4];	/* Register values,
-						   0 = input
-						   1 = high
-						   2 = low
-						   3 = critical */
-	u8			hyst;		/* hysteresis offset */
+	bool			valid;		/* true if temperature valid */
 };
 
-static int adt7x10_read_byte(struct device *dev, u8 reg)
-{
-	struct adt7x10_data *d = dev_get_drvdata(dev);
-	return d->ops->read_byte(dev, reg);
-}
-
-static int adt7x10_write_byte(struct device *dev, u8 reg, u8 data)
-{
-	struct adt7x10_data *d = dev_get_drvdata(dev);
-	return d->ops->write_byte(dev, reg, data);
-}
-
-static int adt7x10_read_word(struct device *dev, u8 reg)
-{
-	struct adt7x10_data *d = dev_get_drvdata(dev);
-	return d->ops->read_word(dev, reg);
-}
-
-static int adt7x10_write_word(struct device *dev, u8 reg, u16 data)
-{
-	struct adt7x10_data *d = dev_get_drvdata(dev);
-	return d->ops->write_word(dev, reg, data);
-}
-
 static const u8 ADT7X10_REG_TEMP[4] = {
 	ADT7X10_TEMPERATURE,		/* input */
 	ADT7X10_T_ALARM_HIGH,		/* high */
@@ -103,10 +73,12 @@ static const u8 ADT7X10_REG_TEMP[4] = {
 static irqreturn_t adt7x10_irq_handler(int irq, void *private)
 {
 	struct device *dev = private;
-	int status;
+	struct adt7x10_data *d = dev_get_drvdata(dev);
+	unsigned int status;
+	int ret;
 
-	status = adt7x10_read_byte(dev, ADT7X10_STATUS);
-	if (status < 0)
+	ret = regmap_read(d->regmap, ADT7X10_STATUS, &status);
+	if (ret < 0)
 		return IRQ_HANDLED;
 
 	if (status & ADT7X10_STAT_T_HIGH)
@@ -119,14 +91,15 @@ static irqreturn_t adt7x10_irq_handler(int irq, void *private)
 	return IRQ_HANDLED;
 }
 
-static int adt7x10_temp_ready(struct device *dev)
+static int adt7x10_temp_ready(struct regmap *regmap)
 {
-	int i, status;
+	unsigned int status;
+	int i, ret;
 
 	for (i = 0; i < 6; i++) {
-		status = adt7x10_read_byte(dev, ADT7X10_STATUS);
-		if (status < 0)
-			return status;
+		ret = regmap_read(regmap, ADT7X10_STATUS, &status);
+		if (ret < 0)
+			return ret;
 		if (!(status & ADT7X10_STAT_NOT_RDY))
 			return 0;
 		msleep(60);
@@ -134,71 +107,10 @@ static int adt7x10_temp_ready(struct device *dev)
 	return -ETIMEDOUT;
 }
 
-static int adt7x10_update_temp(struct device *dev)
-{
-	struct adt7x10_data *data = dev_get_drvdata(dev);
-	int ret = 0;
-
-	mutex_lock(&data->update_lock);
-
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
-	    || !data->valid) {
-		int temp;
-
-		dev_dbg(dev, "Starting update\n");
-
-		ret = adt7x10_temp_ready(dev); /* check for new value */
-		if (ret)
-			goto abort;
-
-		temp = adt7x10_read_word(dev, ADT7X10_REG_TEMP[0]);
-		if (temp < 0) {
-			ret = temp;
-			dev_dbg(dev, "Failed to read value: reg %d, error %d\n",
-				ADT7X10_REG_TEMP[0], ret);
-			goto abort;
-		}
-		data->temp[0] = temp;
-		data->last_updated = jiffies;
-		data->valid = true;
-	}
-
-abort:
-	mutex_unlock(&data->update_lock);
-	return ret;
-}
-
-static int adt7x10_fill_cache(struct device *dev)
-{
-	struct adt7x10_data *data = dev_get_drvdata(dev);
-	int ret;
-	int i;
-
-	for (i = 1; i < ARRAY_SIZE(data->temp); i++) {
-		ret = adt7x10_read_word(dev, ADT7X10_REG_TEMP[i]);
-		if (ret < 0) {
-			dev_dbg(dev, "Failed to read value: reg %d, error %d\n",
-				ADT7X10_REG_TEMP[i], ret);
-			return ret;
-		}
-		data->temp[i] = ret;
-	}
-
-	ret = adt7x10_read_byte(dev, ADT7X10_T_HYST);
-	if (ret < 0) {
-		dev_dbg(dev, "Failed to read value: reg %d, error %d\n",
-				ADT7X10_T_HYST, ret);
-		return ret;
-	}
-	data->hyst = ret;
-
-	return 0;
-}
-
 static s16 ADT7X10_TEMP_TO_REG(long temp)
 {
 	return DIV_ROUND_CLOSEST(clamp_val(temp, ADT7X10_TEMP_MIN,
-					       ADT7X10_TEMP_MAX) * 128, 1000);
+					   ADT7X10_TEMP_MAX) * 128, 1000);
 }
 
 static int ADT7X10_REG_TO_TEMP(struct adt7x10_data *data, s16 reg)
@@ -222,18 +134,26 @@ static ssize_t adt7x10_temp_show(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct adt7x10_data *data = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
 
-
-	if (attr->index == 0) {
-		int ret;
-
-		ret = adt7x10_update_temp(dev);
-		if (ret)
+	mutex_lock(&data->update_lock);
+	if (attr->index == 0 && !data->valid) {
+		/* wait for valid temperature */
+		ret = adt7x10_temp_ready(data->regmap);
+		if (ret) {
+			mutex_unlock(&data->update_lock);
 			return ret;
+		}
+		data->valid = true;
 	}
+	mutex_unlock(&data->update_lock);
 
-	return sprintf(buf, "%d\n", ADT7X10_REG_TO_TEMP(data,
-		       data->temp[attr->index]));
+	ret = regmap_read(data->regmap, ADT7X10_REG_TEMP[attr->index], &val);
+	if (ret)
+		return ret;
+
+	return sprintf(buf, "%d\n", ADT7X10_REG_TO_TEMP(data, val));
 }
 
 static ssize_t adt7x10_temp_store(struct device *dev,
@@ -251,12 +171,10 @@ static ssize_t adt7x10_temp_store(struct device *dev,
 		return ret;
 
 	mutex_lock(&data->update_lock);
-	data->temp[nr] = ADT7X10_TEMP_TO_REG(temp);
-	ret = adt7x10_write_word(dev, ADT7X10_REG_TEMP[nr], data->temp[nr]);
-	if (ret)
-		count = ret;
+	ret = regmap_write(data->regmap, ADT7X10_REG_TEMP[nr],
+			   ADT7X10_TEMP_TO_REG(temp));
 	mutex_unlock(&data->update_lock);
-	return count;
+	return ret ? : count;
 }
 
 static ssize_t adt7x10_t_hyst_show(struct device *dev,
@@ -265,9 +183,21 @@ static ssize_t adt7x10_t_hyst_show(struct device *dev,
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct adt7x10_data *data = dev_get_drvdata(dev);
 	int nr = attr->index;
-	int hyst;
+	int hyst, temp, ret;
+
+	mutex_lock(&data->update_lock);
+	ret = regmap_read(data->regmap, ADT7X10_T_HYST, &hyst);
+	if (ret) {
+		mutex_unlock(&data->update_lock);
+		return ret;
+	}
+
+	ret = regmap_read(data->regmap, ADT7X10_REG_TEMP[nr], &temp);
+	mutex_unlock(&data->update_lock);
+	if (ret)
+		return ret;
 
-	hyst = (data->hyst & ADT7X10_T_HYST_MASK) * 1000;
+	hyst = (hyst & ADT7X10_T_HYST_MASK) * 1000;
 
 	/*
 	 * hysteresis is stored as a 4 bit offset in the device, convert it
@@ -275,8 +205,8 @@ static ssize_t adt7x10_t_hyst_show(struct device *dev,
 	 */
 	if (nr == 2)	/* min has positive offset, others have negative */
 		hyst = -hyst;
-	return sprintf(buf, "%d\n",
-		       ADT7X10_REG_TO_TEMP(data, data->temp[nr]) - hyst);
+
+	return sprintf(buf, "%d\n", ADT7X10_REG_TO_TEMP(data, temp) - hyst);
 }
 
 static ssize_t adt7x10_t_hyst_store(struct device *dev,
@@ -284,35 +214,45 @@ static ssize_t adt7x10_t_hyst_store(struct device *dev,
 				    const char *buf, size_t count)
 {
 	struct adt7x10_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
 	int limit, ret;
 	long hyst;
 
 	ret = kstrtol(buf, 10, &hyst);
 	if (ret)
 		return ret;
+
+	mutex_lock(&data->update_lock);
+
 	/* convert absolute hysteresis value to a 4 bit delta value */
-	limit = ADT7X10_REG_TO_TEMP(data, data->temp[1]);
-	hyst = clamp_val(hyst, ADT7X10_TEMP_MIN, ADT7X10_TEMP_MAX);
-	data->hyst = clamp_val(DIV_ROUND_CLOSEST(limit - hyst, 1000),
-				   0, ADT7X10_T_HYST_MASK);
-	ret = adt7x10_write_byte(dev, ADT7X10_T_HYST, data->hyst);
-	if (ret)
-		return ret;
+	ret = regmap_read(data->regmap, ADT7X10_T_ALARM_HIGH, &regval);
+	if (ret < 0)
+		goto abort;
 
-	return count;
+	limit = ADT7X10_REG_TO_TEMP(data, regval);
+
+	hyst = clamp_val(hyst, ADT7X10_TEMP_MIN, ADT7X10_TEMP_MAX);
+	regval = clamp_val(DIV_ROUND_CLOSEST(limit - hyst, 1000), 0,
+			   ADT7X10_T_HYST_MASK);
+	ret = regmap_write(data->regmap, ADT7X10_T_HYST, regval);
+abort:
+	mutex_unlock(&data->update_lock);
+	return ret ? : count;
 }
 
 static ssize_t adt7x10_alarm_show(struct device *dev,
 				  struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	struct adt7x10_data *data = dev_get_drvdata(dev);
+	unsigned int status;
 	int ret;
 
-	ret = adt7x10_read_byte(dev, ADT7X10_STATUS);
+	ret = regmap_read(data->regmap, ADT7X10_STATUS, &status);
 	if (ret < 0)
 		return ret;
 
-	return sprintf(buf, "%d\n", !!(ret & attr->index));
+	return sprintf(buf, "%d\n", !!(status & attr->index));
 }
 
 static ssize_t name_show(struct device *dev, struct device_attribute *da,
@@ -357,28 +297,29 @@ static const struct attribute_group adt7x10_group = {
 };
 
 int adt7x10_probe(struct device *dev, const char *name, int irq,
-		  const struct adt7x10_ops *ops)
+		  struct regmap *regmap)
 {
 	struct adt7x10_data *data;
+	unsigned int config;
 	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->ops = ops;
+	data->regmap = regmap;
 	data->name = name;
 
 	dev_set_drvdata(dev, data);
 	mutex_init(&data->update_lock);
 
 	/* configure as specified */
-	ret = adt7x10_read_byte(dev, ADT7X10_CONFIG);
+	ret = regmap_read(regmap, ADT7X10_CONFIG, &config);
 	if (ret < 0) {
 		dev_dbg(dev, "Can't read config? %d\n", ret);
 		return ret;
 	}
-	data->oldconfig = ret;
+	data->oldconfig = config;
 
 	/*
 	 * Set to 16 bit resolution, continous conversion and comparator mode.
@@ -389,16 +330,12 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
 	data->config |= ADT7X10_FULL | ADT7X10_RESOLUTION | ADT7X10_EVENT_MODE;
 
 	if (data->config != data->oldconfig) {
-		ret = adt7x10_write_byte(dev, ADT7X10_CONFIG, data->config);
+		ret = regmap_write(regmap, ADT7X10_CONFIG, data->config);
 		if (ret)
 			return ret;
 	}
 	dev_dbg(dev, "Config %02x\n", data->config);
 
-	ret = adt7x10_fill_cache(dev);
-	if (ret)
-		goto exit_restore;
-
 	/* Register sysfs hooks */
 	ret = sysfs_create_group(&dev->kobj, &adt7x10_group);
 	if (ret)
@@ -439,7 +376,7 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
 exit_remove:
 	sysfs_remove_group(&dev->kobj, &adt7x10_group);
 exit_restore:
-	adt7x10_write_byte(dev, ADT7X10_CONFIG, data->oldconfig);
+	regmap_write(regmap, ADT7X10_CONFIG, data->oldconfig);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(adt7x10_probe);
@@ -456,7 +393,7 @@ void adt7x10_remove(struct device *dev, int irq)
 		device_remove_file(dev, &dev_attr_name);
 	sysfs_remove_group(&dev->kobj, &adt7x10_group);
 	if (data->oldconfig != data->config)
-		adt7x10_write_byte(dev, ADT7X10_CONFIG, data->oldconfig);
+		regmap_write(data->regmap, ADT7X10_CONFIG, data->oldconfig);
 }
 EXPORT_SYMBOL_GPL(adt7x10_remove);
 
@@ -466,15 +403,15 @@ static int adt7x10_suspend(struct device *dev)
 {
 	struct adt7x10_data *data = dev_get_drvdata(dev);
 
-	return adt7x10_write_byte(dev, ADT7X10_CONFIG,
-		data->config | ADT7X10_PD);
+	return regmap_write(data->regmap, ADT7X10_CONFIG,
+			    data->config | ADT7X10_PD);
 }
 
 static int adt7x10_resume(struct device *dev)
 {
 	struct adt7x10_data *data = dev_get_drvdata(dev);
 
-	return adt7x10_write_byte(dev, ADT7X10_CONFIG, data->config);
+	return regmap_write(data->regmap, ADT7X10_CONFIG, data->config);
 }
 
 SIMPLE_DEV_PM_OPS(adt7x10_dev_pm_ops, adt7x10_suspend, adt7x10_resume);
diff --git a/drivers/hwmon/adt7x10.h b/drivers/hwmon/adt7x10.h
index a1ae682eb32e..55ff08bfe946 100644
--- a/drivers/hwmon/adt7x10.h
+++ b/drivers/hwmon/adt7x10.h
@@ -17,15 +17,9 @@
 
 struct device;
 
-struct adt7x10_ops {
-	int (*read_byte)(struct device *, u8 reg);
-	int (*write_byte)(struct device *, u8 reg, u8 data);
-	int (*read_word)(struct device *, u8 reg);
-	int (*write_word)(struct device *, u8 reg, u16 data);
-};
-
 int adt7x10_probe(struct device *dev, const char *name, int irq,
-	const struct adt7x10_ops *ops);
+		  struct regmap *regmap);
+
 void adt7x10_remove(struct device *dev, int irq);
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.33.0

