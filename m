Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B45FC433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Mar 2021 07:34:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4232B64FC0
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Mar 2021 07:34:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbhCKHeM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Mar 2021 02:34:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbhCKHdc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Mar 2021 02:33:32 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58D5C061762
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Mar 2021 23:33:10 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id r17-20020a4acb110000b02901b657f28cdcso460240ooq.6
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Mar 2021 23:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ySutCp6Bt7BUzzOcrwu7UfaAUGLBuBORpYLixw1mjHQ=;
        b=Cr4EuoaFx0LlDYHlZv8GJzW7ldF6cLY+SkJ0YdC3YtfYvVvVM/tQq6wXR7JyQRJNZk
         qsqFqvXjtiSCXOcRB2xlici7OE49JBqRKvKbmUalWssVTYoN8aZ7LobMVtcWNx1NWh2C
         kY4ndbyaA5JMiNN5dDRfSrEiTYUBX8TSGYpfTZWa+J9Cl8GmjbbnrQQsJ/Lo/G1AzlsA
         fT1aCxDZEd6JchBihO1ouk82zdGhpo9l4OSDN2+ANPwWQdKQ+ObsyJHjGiXWEYwK9A+5
         lyX74pTs+pk6uraaeTdXrk7/IGA9nqr69lhMC049CdSlWTmveNFUAvKsLhNO+8eYThDh
         R5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=ySutCp6Bt7BUzzOcrwu7UfaAUGLBuBORpYLixw1mjHQ=;
        b=cUozvm1A6pxzhQ9uzzWFXreR33G20VGHi5JdJdn7sma7ub4TYb2YdyHv2S15jf7qRf
         UPIFKQ2OaRlqlH/rnbe4p+Vd3yWcb7ziTeEm0sJLOpoiuQoH/Yh4xISqXiBMEs6+olhs
         jiA7lsRuO1y2RC+T3fS19V9dOgpb0AEz3QRHaV/Bos8X3LRLhYB9RmUqReWOt/cNMfTZ
         1l1I5uXEb0H79hNvNxK/AH/F58Btlmmbu3BApZvAtEdHrJb9OLBXrNXG4BT4kVj8wFHf
         VnUErNvJtx+cXWhHb97pGVOW0dxQBpi0yHt9glAQx9fJtLc92VRipxIiqv25XxhW7kDH
         4miQ==
X-Gm-Message-State: AOAM533CkX5Z67DXpXDvmX3x+R3DfLwfn/uMPn2KEqVUgdYDcZPrTpVl
        YS9CU66vJg9QQj6SY5Otgnrw6Xv6Eg0=
X-Google-Smtp-Source: ABdhPJy8T+/VhsuPPRSRcjNRZhfKYDwo5kWrxB76GWCbfoEM6I02xnNhRbROIAV0UBuB4qwSinc+WA==
X-Received: by 2002:a4a:bb14:: with SMTP id f20mr5647800oop.1.1615447989235;
        Wed, 10 Mar 2021 23:33:09 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y11sm418468oiv.19.2021.03.10.23.33.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 23:33:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: [PATCH 3/3] hwmon: (adm9240) Convert to devm_hwmon_device_register_with_info API
Date:   Wed, 10 Mar 2021 23:33:02 -0800
Message-Id: <20210311073302.221954-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311073302.221954-1-linux@roeck-us.net>
References: <20210311073302.221954-1-linux@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Also use regmap for register caching. This change reduces code and
data size by more than 40%.

While at it, fixed some warnings reported by checkpatch.

Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adm9240.c | 940 +++++++++++++++++++---------------------
 1 file changed, 445 insertions(+), 495 deletions(-)

diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index 7404082c7a3f..5677263bcf0d 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -28,6 +28,7 @@
  * LM81 extended temp reading not implemented
  */
 
+#include <linux/bits.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -37,7 +38,6 @@
 #include <linux/hwmon-vid.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
-#include <linux/jiffies.h>
 #include <linux/regmap.h>
 
 /* Addresses to scan */
@@ -126,29 +126,15 @@ struct adm9240_data {
 	struct device *dev;
 	struct regmap *regmap;
 	struct mutex update_lock;
-	char valid;
-	unsigned long last_updated_measure;
-	unsigned long last_updated_config;
-
-	u8 in[6];		/* ro	in0_input */
-	u8 in_max[6];		/* rw	in0_max */
-	u8 in_min[6];		/* rw	in0_min */
-	u8 fan[2];		/* ro	fan1_input */
-	u8 fan_min[2];		/* rw	fan1_min */
+
 	u8 fan_div[2];		/* rw	fan1_div, read-only accessor */
-	s16 temp;		/* ro	temp1_input, 9-bit sign-extended */
-	s8 temp_max[2];		/* rw	0 -> temp_max, 1 -> temp_max_hyst */
-	u16 alarms;		/* ro	alarms */
-	u8 aout;		/* rw	aout_output */
-	u8 vid;			/* ro	vid */
 	u8 vrm;			/* --	vrm set on startup, no accessor */
 };
 
 /* write new fan div, callers must hold data->update_lock */
-static int adm9240_write_fan_div(struct adm9240_data *data, int nr,
-		u8 fan_div)
+static int adm9240_write_fan_div(struct adm9240_data *data, int channel, u8 fan_div)
 {
-	unsigned int reg, old, shift = (nr + 2) * 2;
+	unsigned int reg, old, shift = (channel + 2) * 2;
 	int err;
 
 	err = regmap_read(data->regmap, ADM9240_REG_VID_FAN_DIV, &reg);
@@ -161,335 +147,12 @@ static int adm9240_write_fan_div(struct adm9240_data *data, int nr,
 	if (err < 0)
 		return err;
 	dev_dbg(data->dev,
-		"fan%d clock divider changed from %u to %u\n",
-		nr + 1, 1 << old, 1 << fan_div);
+		"fan%d clock divider changed from %lu to %lu\n",
+		channel + 1, BIT(old), BIT(fan_div));
 
 	return 0;
 }
 
-static int adm9240_update_measure(struct adm9240_data *data)
-{
-	unsigned int val;
-	u8 regs[2];
-	int err;
-	int i;
-
-	err = regmap_bulk_read(data->regmap, ADM9240_REG_IN(0), &data->in[0], 6);
-	if (err < 0)
-		return err;
-	err = regmap_bulk_read(data->regmap, ADM9240_REG_INT(0), &regs, 2);
-	if (err < 0)
-		return err;
-
-	data->alarms = regs[0] | regs[1] << 8;
-
-	/*
-	 * read temperature: assume temperature changes less than
-	 * 0.5'C per two measurement cycles thus ignore possible
-	 * but unlikely aliasing error on lsb reading. --Grant
-	 */
-	err = regmap_read(data->regmap, ADM9240_REG_TEMP, &val);
-	if (err < 0)
-		return err;
-	data->temp = val << 8;
-	err = regmap_read(data->regmap, ADM9240_REG_TEMP_CONF, &val);
-	if (err < 0)
-		return err;
-	data->temp |= val;
-
-	err = regmap_bulk_read(data->regmap, ADM9240_REG_FAN(0),
-			       &data->fan[0], 2);
-	if (err < 0)
-		return err;
-
-	for (i = 0; i < 2; i++) { /* read fans */
-		/* adjust fan clock divider on overflow */
-		if (data->valid && data->fan[i] == 255 &&
-				data->fan_div[i] < 3) {
-
-			err = adm9240_write_fan_div(data, i,
-					++data->fan_div[i]);
-			if (err < 0)
-				return err;
-
-			/* adjust fan_min if active, but not to 0 */
-			if (data->fan_min[i] < 255 &&
-					data->fan_min[i] >= 2)
-				data->fan_min[i] /= 2;
-		}
-	}
-
-	return 0;
-}
-
-static int adm9240_update_config(struct adm9240_data *data)
-{
-	unsigned int val;
-	int i;
-	int err;
-
-	for (i = 0; i < 6; i++) {
-		err = regmap_raw_read(data->regmap, ADM9240_REG_IN_MIN(i),
-				      &data->in_min[i], 1);
-		if (err < 0)
-			return err;
-		err = regmap_raw_read(data->regmap, ADM9240_REG_IN_MAX(i),
-				      &data->in_max[i], 1);
-		if (err < 0)
-			return err;
-	}
-	err = regmap_bulk_read(data->regmap, ADM9240_REG_FAN_MIN(0),
-				      &data->fan_min[0], 2);
-	if (err < 0)
-		return err;
-	err = regmap_bulk_read(data->regmap, ADM9240_REG_TEMP_MAX(0),
-				      &data->temp_max[0], 2);
-	if (err < 0)
-		return err;
-
-	/* read fan divs and 5-bit VID */
-	err = regmap_read(data->regmap, ADM9240_REG_VID_FAN_DIV, &val);
-	if (err < 0)
-		return err;
-	data->fan_div[0] = (val >> 4) & 3;
-	data->fan_div[1] = (val >> 6) & 3;
-	data->vid = val & 0x0f;
-	err = regmap_read(data->regmap, ADM9240_REG_VID4, &val);
-	if (err < 0)
-		return err;
-	data->vid |= (val & 1) << 4;
-	/* read analog out */
-	err = regmap_raw_read(data->regmap, ADM9240_REG_ANALOG_OUT,
-			      &data->aout, 1);
-
-	return err;
-}
-
-static struct adm9240_data *adm9240_update_device(struct device *dev)
-{
-	struct adm9240_data *data = dev_get_drvdata(dev);
-	int err;
-
-	mutex_lock(&data->update_lock);
-
-	/* minimum measurement cycle: 1.75 seconds */
-	if (time_after(jiffies, data->last_updated_measure + (HZ * 7 / 4))
-			|| !data->valid) {
-		err = adm9240_update_measure(data);
-		if (err < 0) {
-			data->valid = 0;
-			mutex_unlock(&data->update_lock);
-			return ERR_PTR(err);
-		}
-		data->last_updated_measure = jiffies;
-	}
-
-	/* minimum config reading cycle: 300 seconds */
-	if (time_after(jiffies, data->last_updated_config + (HZ * 300))
-			|| !data->valid) {
-		err = adm9240_update_config(data);
-		if (err < 0) {
-			data->valid = 0;
-			mutex_unlock(&data->update_lock);
-			return ERR_PTR(err);
-		}
-		data->last_updated_config = jiffies;
-		data->valid = 1;
-	}
-	mutex_unlock(&data->update_lock);
-	return data;
-}
-
-/*** sysfs accessors ***/
-
-/* temperature */
-static ssize_t temp1_input_show(struct device *dev,
-				struct device_attribute *dummy, char *buf)
-{
-	struct adm9240_data *data = adm9240_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", data->temp / 128 * 500); /* 9-bit value */
-}
-
-static ssize_t max_show(struct device *dev, struct device_attribute *devattr,
-			char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct adm9240_data *data = adm9240_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", data->temp_max[attr->index] * 1000);
-}
-
-static ssize_t max_store(struct device *dev, struct device_attribute *devattr,
-			 const char *buf, size_t count)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct adm9240_data *data = dev_get_drvdata(dev);
-	long val;
-	int err;
-
-	err = kstrtol(buf, 10, &val);
-	if (err)
-		return err;
-
-	mutex_lock(&data->update_lock);
-	data->temp_max[attr->index] = TEMP_TO_REG(val);
-	err = regmap_write(data->regmap, ADM9240_REG_TEMP_MAX(attr->index),
-			   data->temp_max[attr->index]);
-	mutex_unlock(&data->update_lock);
-	return err < 0 ? err : count;
-}
-
-static DEVICE_ATTR_RO(temp1_input);
-static SENSOR_DEVICE_ATTR_RW(temp1_max, max, 0);
-static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, max, 1);
-
-/* voltage */
-static ssize_t in_show(struct device *dev, struct device_attribute *devattr,
-		       char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct adm9240_data *data = adm9240_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", IN_FROM_REG(data->in[attr->index],
-				attr->index));
-}
-
-static ssize_t in_min_show(struct device *dev,
-			   struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct adm9240_data *data = adm9240_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", IN_FROM_REG(data->in_min[attr->index],
-				attr->index));
-}
-
-static ssize_t in_max_show(struct device *dev,
-			   struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct adm9240_data *data = adm9240_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", IN_FROM_REG(data->in_max[attr->index],
-				attr->index));
-}
-
-static ssize_t in_min_store(struct device *dev,
-			    struct device_attribute *devattr, const char *buf,
-			    size_t count)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct adm9240_data *data = dev_get_drvdata(dev);
-	unsigned long val;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
-
-	mutex_lock(&data->update_lock);
-	data->in_min[attr->index] = IN_TO_REG(val, attr->index);
-	err = regmap_write(data->regmap, ADM9240_REG_IN_MIN(attr->index),
-			   data->in_min[attr->index]);
-	mutex_unlock(&data->update_lock);
-	return err < 0 ? err : count;
-}
-
-static ssize_t in_max_store(struct device *dev,
-			    struct device_attribute *devattr, const char *buf,
-			    size_t count)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct adm9240_data *data = dev_get_drvdata(dev);
-	unsigned long val;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
-
-	mutex_lock(&data->update_lock);
-	data->in_max[attr->index] = IN_TO_REG(val, attr->index);
-	err = regmap_write(data->regmap, ADM9240_REG_IN_MAX(attr->index),
-			   data->in_max[attr->index]);
-	mutex_unlock(&data->update_lock);
-	return err < 0 ? err : count;
-}
-
-static SENSOR_DEVICE_ATTR_RO(in0_input, in, 0);
-static SENSOR_DEVICE_ATTR_RW(in0_min, in_min, 0);
-static SENSOR_DEVICE_ATTR_RW(in0_max, in_max, 0);
-static SENSOR_DEVICE_ATTR_RO(in1_input, in, 1);
-static SENSOR_DEVICE_ATTR_RW(in1_min, in_min, 1);
-static SENSOR_DEVICE_ATTR_RW(in1_max, in_max, 1);
-static SENSOR_DEVICE_ATTR_RO(in2_input, in, 2);
-static SENSOR_DEVICE_ATTR_RW(in2_min, in_min, 2);
-static SENSOR_DEVICE_ATTR_RW(in2_max, in_max, 2);
-static SENSOR_DEVICE_ATTR_RO(in3_input, in, 3);
-static SENSOR_DEVICE_ATTR_RW(in3_min, in_min, 3);
-static SENSOR_DEVICE_ATTR_RW(in3_max, in_max, 3);
-static SENSOR_DEVICE_ATTR_RO(in4_input, in, 4);
-static SENSOR_DEVICE_ATTR_RW(in4_min, in_min, 4);
-static SENSOR_DEVICE_ATTR_RW(in4_max, in_max, 4);
-static SENSOR_DEVICE_ATTR_RO(in5_input, in, 5);
-static SENSOR_DEVICE_ATTR_RW(in5_min, in_min, 5);
-static SENSOR_DEVICE_ATTR_RW(in5_max, in_max, 5);
-
-/* fans */
-static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
-			char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct adm9240_data *data = adm9240_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[attr->index],
-				1 << data->fan_div[attr->index]));
-}
-
-static ssize_t fan_min_show(struct device *dev,
-			    struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct adm9240_data *data = adm9240_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[attr->index],
-				1 << data->fan_div[attr->index]));
-}
-
-static ssize_t fan_div_show(struct device *dev,
-			    struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct adm9240_data *data = adm9240_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", 1 << data->fan_div[attr->index]);
-}
-
 /*
  * set fan speed low limit:
  *
@@ -501,37 +164,25 @@ static ssize_t fan_div_show(struct device *dev,
  * - otherwise: select fan clock divider to suit fan speed low limit,
  *   measurement code may adjust registers to ensure fan speed reading
  */
-static ssize_t fan_min_store(struct device *dev,
-			     struct device_attribute *devattr,
-			     const char *buf, size_t count)
+static int adm9240_fan_min_write(struct adm9240_data *data, int channel, long val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct adm9240_data *data = dev_get_drvdata(dev);
-	int nr = attr->index;
 	u8 new_div;
-	unsigned long val;
+	u8 fan_min;
 	int err;
 
-	err = kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
-
 	mutex_lock(&data->update_lock);
 
 	if (!val) {
-		data->fan_min[nr] = 255;
-		new_div = data->fan_div[nr];
-
-		dev_dbg(data->dev, "fan%u low limit set disabled\n",
-				nr + 1);
+		fan_min = 255;
+		new_div = data->fan_div[channel];
 
+		dev_dbg(data->dev, "fan%u low limit set disabled\n", channel + 1);
 	} else if (val < 1350000 / (8 * 254)) {
 		new_div = 3;
-		data->fan_min[nr] = 254;
+		fan_min = 254;
 
 		dev_dbg(data->dev, "fan%u low limit set minimum %u\n",
-				nr + 1, FAN_FROM_REG(254, 1 << new_div));
-
+			channel + 1, FAN_FROM_REG(254, BIT(new_div)));
 	} else {
 		unsigned int new_min = 1350000 / val;
 
@@ -543,87 +194,55 @@ static ssize_t fan_min_store(struct device *dev,
 		if (!new_min) /* keep > 0 */
 			new_min++;
 
-		data->fan_min[nr] = new_min;
+		fan_min = new_min;
 
 		dev_dbg(data->dev, "fan%u low limit set fan speed %u\n",
-				nr + 1, FAN_FROM_REG(new_min, 1 << new_div));
+			channel + 1, FAN_FROM_REG(new_min, BIT(new_div)));
 	}
 
-	if (new_div != data->fan_div[nr]) {
-		data->fan_div[nr] = new_div;
-		adm9240_write_fan_div(data, nr, new_div);
+	if (new_div != data->fan_div[channel]) {
+		data->fan_div[channel] = new_div;
+		adm9240_write_fan_div(data, channel, new_div);
 	}
-	err = regmap_write(data->regmap, ADM9240_REG_FAN_MIN(nr),
-			   data->fan_min[nr]);
+	err = regmap_write(data->regmap, ADM9240_REG_FAN_MIN(channel), fan_min);
 
 	mutex_unlock(&data->update_lock);
-	return err < 0 ? err : count;
-}
-
-static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
-static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
-static SENSOR_DEVICE_ATTR_RO(fan1_div, fan_div, 0);
-static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
-static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
-static SENSOR_DEVICE_ATTR_RO(fan2_div, fan_div, 1);
-
-/* alarms */
-static ssize_t alarms_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
-{
-	struct adm9240_data *data = adm9240_update_device(dev);
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%u\n", data->alarms);
+	return err;
 }
-static DEVICE_ATTR_RO(alarms);
-
-static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
-{
-	int bitnr = to_sensor_dev_attr(attr)->index;
-	struct adm9240_data *data = adm9240_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
 
-	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
-}
-static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
-static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 1);
-static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 2);
-static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
-static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 8);
-static SENSOR_DEVICE_ATTR_RO(in5_alarm, alarm, 9);
-static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 4);
-static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 6);
-static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 7);
-
-/* vid */
 static ssize_t cpu0_vid_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
-	struct adm9240_data *data = adm9240_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	struct adm9240_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int err;
+	u8 vid;
 
-	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
+	err = regmap_read(data->regmap, ADM9240_REG_VID_FAN_DIV, &regval);
+	if (err < 0)
+		return err;
+	vid = regval & 0x0f;
+	err = regmap_read(data->regmap, ADM9240_REG_VID4, &regval);
+	if (err < 0)
+		return err;
+	vid |= (regval & 1) << 4;
+	return sprintf(buf, "%d\n", vid_from_reg(vid, data->vrm));
 }
 static DEVICE_ATTR_RO(cpu0_vid);
 
-/* analog output */
 static ssize_t aout_output_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
-	struct adm9240_data *data = adm9240_update_device(dev);
+	struct adm9240_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int err;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	err = regmap_read(data->regmap, ADM9240_REG_ANALOG_OUT, &regval);
+	if (err)
+		return err;
 
-	return sprintf(buf, "%d\n", AOUT_FROM_REG(data->aout));
+	return sprintf(buf, "%d\n", AOUT_FROM_REG(regval));
 }
 
 static ssize_t aout_output_store(struct device *dev,
@@ -638,76 +257,13 @@ static ssize_t aout_output_store(struct device *dev,
 	if (err)
 		return err;
 
-	mutex_lock(&data->update_lock);
-	data->aout = AOUT_TO_REG(val);
-	err = regmap_write(data->regmap, ADM9240_REG_ANALOG_OUT, data->aout);
-	mutex_unlock(&data->update_lock);
+	err = regmap_write(data->regmap, ADM9240_REG_ANALOG_OUT, AOUT_TO_REG(val));
 	return err < 0 ? err : count;
 }
 static DEVICE_ATTR_RW(aout_output);
 
-static ssize_t alarm_store(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
-{
-	struct adm9240_data *data = dev_get_drvdata(dev);
-	unsigned long val;
-	int err;
-
-	if (kstrtoul(buf, 10, &val) || val != 0)
-		return -EINVAL;
-
-	mutex_lock(&data->update_lock);
-	err = regmap_write(data->regmap, ADM9240_REG_CHASSIS_CLEAR, 0x80);
-	data->valid = 0;		/* Force cache refresh */
-	mutex_unlock(&data->update_lock);
-	if (err < 0)
-		return err;
-	dev_dbg(data->dev, "chassis intrusion latch cleared\n");
-
-	return count;
-}
-static SENSOR_DEVICE_ATTR_RW(intrusion0_alarm, alarm, 12);
-
 static struct attribute *adm9240_attrs[] = {
-	&sensor_dev_attr_in0_input.dev_attr.attr,
-	&sensor_dev_attr_in0_min.dev_attr.attr,
-	&sensor_dev_attr_in0_max.dev_attr.attr,
-	&sensor_dev_attr_in0_alarm.dev_attr.attr,
-	&sensor_dev_attr_in1_input.dev_attr.attr,
-	&sensor_dev_attr_in1_min.dev_attr.attr,
-	&sensor_dev_attr_in1_max.dev_attr.attr,
-	&sensor_dev_attr_in1_alarm.dev_attr.attr,
-	&sensor_dev_attr_in2_input.dev_attr.attr,
-	&sensor_dev_attr_in2_min.dev_attr.attr,
-	&sensor_dev_attr_in2_max.dev_attr.attr,
-	&sensor_dev_attr_in2_alarm.dev_attr.attr,
-	&sensor_dev_attr_in3_input.dev_attr.attr,
-	&sensor_dev_attr_in3_min.dev_attr.attr,
-	&sensor_dev_attr_in3_max.dev_attr.attr,
-	&sensor_dev_attr_in3_alarm.dev_attr.attr,
-	&sensor_dev_attr_in4_input.dev_attr.attr,
-	&sensor_dev_attr_in4_min.dev_attr.attr,
-	&sensor_dev_attr_in4_max.dev_attr.attr,
-	&sensor_dev_attr_in4_alarm.dev_attr.attr,
-	&sensor_dev_attr_in5_input.dev_attr.attr,
-	&sensor_dev_attr_in5_min.dev_attr.attr,
-	&sensor_dev_attr_in5_max.dev_attr.attr,
-	&sensor_dev_attr_in5_alarm.dev_attr.attr,
-	&dev_attr_temp1_input.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_alarm.dev_attr.attr,
-	&sensor_dev_attr_fan1_input.dev_attr.attr,
-	&sensor_dev_attr_fan1_div.dev_attr.attr,
-	&sensor_dev_attr_fan1_min.dev_attr.attr,
-	&sensor_dev_attr_fan1_alarm.dev_attr.attr,
-	&sensor_dev_attr_fan2_input.dev_attr.attr,
-	&sensor_dev_attr_fan2_div.dev_attr.attr,
-	&sensor_dev_attr_fan2_min.dev_attr.attr,
-	&sensor_dev_attr_fan2_alarm.dev_attr.attr,
-	&dev_attr_alarms.attr,
 	&dev_attr_aout_output.attr,
-	&sensor_dev_attr_intrusion0_alarm.dev_attr.attr,
 	&dev_attr_cpu0_vid.attr,
 	NULL
 };
@@ -749,13 +305,14 @@ static int adm9240_detect(struct i2c_client *new_client,
 		 man_id == 0x23 ? "ADM9240" :
 		 man_id == 0xda ? "DS1780" : "LM81", die_rev);
 
-	strlcpy(info->type, name, I2C_NAME_SIZE);
+	strscpy(info->type, name, I2C_NAME_SIZE);
 
 	return 0;
 }
 
 static int adm9240_init_client(struct adm9240_data *data)
 {
+	unsigned int regval;
 	u8 conf, mode;
 	int err;
 
@@ -792,13 +349,13 @@ static int adm9240_init_client(struct adm9240_data *data)
 		}
 		for (i = 0; i < 2; i++) {
 			err = regmap_write(data->regmap,
-					ADM9240_REG_FAN_MIN(i), 255);
+					   ADM9240_REG_FAN_MIN(i), 255);
 			if (err < 0)
 				return err;
 		}
 		for (i = 0; i < 2; i++) {
 			err = regmap_write(data->regmap,
-					ADM9240_REG_TEMP_MAX(i), 127);
+					   ADM9240_REG_TEMP_MAX(i), 127);
 			if (err < 0)
 				return err;
 		}
@@ -812,19 +369,413 @@ static int adm9240_init_client(struct adm9240_data *data)
 			 "cold start: config was 0x%02x mode %u\n", conf, mode);
 	}
 
+	/* read fan divs */
+	err = regmap_read(data->regmap, ADM9240_REG_VID_FAN_DIV, &regval);
+	if (err < 0)
+		return err;
+	data->fan_div[0] = (regval >> 4) & 3;
+	data->fan_div[1] = (regval >> 6) & 3;
+	return 0;
+}
+
+static int adm9240_chip_read(struct device *dev, u32 attr, long *val)
+{
+	struct adm9240_data *data = dev_get_drvdata(dev);
+	u8 regs[2];
+	int err;
+
+	switch (attr) {
+	case hwmon_chip_alarms:
+		err = regmap_bulk_read(data->regmap, ADM9240_REG_INT(0), &regs, 2);
+		if (err < 0)
+			return err;
+		*val = regs[0] | regs[1] << 8;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int adm9240_intrusion_read(struct device *dev, u32 attr, long *val)
+{
+	struct adm9240_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int err;
+
+	switch (attr) {
+	case hwmon_intrusion_alarm:
+		err = regmap_read(data->regmap, ADM9240_REG_INT(1), &regval);
+		if (err < 0)
+			return err;
+		*val = !!(regval & BIT(4));
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int adm9240_intrusion_write(struct device *dev, u32 attr, long val)
+{
+	struct adm9240_data *data = dev_get_drvdata(dev);
+	int err;
+
+	switch (attr) {
+	case hwmon_intrusion_alarm:
+		if (val)
+			return -EINVAL;
+		err = regmap_write(data->regmap, ADM9240_REG_CHASSIS_CLEAR, 0x80);
+		if (err < 0)
+			return err;
+		dev_dbg(data->dev, "chassis intrusion latch cleared\n");
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int adm9240_in_read(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct adm9240_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int reg;
+	int err;
+
+	switch (attr) {
+	case hwmon_in_input:
+		reg = ADM9240_REG_IN(channel);
+		break;
+	case hwmon_in_min:
+		reg = ADM9240_REG_IN_MIN(channel);
+		break;
+	case hwmon_in_max:
+		reg = ADM9240_REG_IN_MAX(channel);
+		break;
+	case hwmon_in_alarm:
+		if (channel < 4) {
+			reg = ADM9240_REG_INT(0);
+		} else {
+			reg = ADM9240_REG_INT(1);
+			channel -= 4;
+		}
+		err = regmap_read(data->regmap, reg, &regval);
+		if (err < 0)
+			return err;
+		*val = !!(regval & BIT(channel));
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+	err = regmap_read(data->regmap, reg, &regval);
+	if (err < 0)
+		return err;
+	*val = IN_FROM_REG(regval, channel);
 	return 0;
 }
 
+static int adm9240_in_write(struct device *dev, u32 attr, int channel, long val)
+{
+	struct adm9240_data *data = dev_get_drvdata(dev);
+	int reg;
+
+	switch (attr) {
+	case hwmon_in_min:
+		reg = ADM9240_REG_IN_MIN(channel);
+		break;
+	case hwmon_in_max:
+		reg = ADM9240_REG_IN(channel);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return regmap_write(data->regmap, reg, IN_TO_REG(val, channel));
+}
+
+static int adm9240_fan_read(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct adm9240_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int err;
+
+	switch (attr) {
+	case hwmon_fan_input:
+		err = regmap_read(data->regmap, ADM9240_REG_FAN(channel), &regval);
+		if (err < 0)
+			return err;
+		if (regval == 255 && data->fan_div[channel] < 3) {
+			/* adjust fan clock divider on overflow */
+			err = adm9240_write_fan_div(data, channel,
+						    ++data->fan_div[channel]);
+			if (err)
+				return err;
+		}
+		*val = FAN_FROM_REG(regval, BIT(data->fan_div[channel]));
+		break;
+	case hwmon_fan_div:
+		*val = BIT(data->fan_div[channel]);
+		break;
+	case hwmon_fan_min:
+		err = regmap_read(data->regmap, ADM9240_REG_FAN_MIN(channel), &regval);
+		if (err < 0)
+			return err;
+		*val = FAN_FROM_REG(regval, BIT(data->fan_div[channel]));
+		break;
+	case hwmon_fan_alarm:
+		err = regmap_read(data->regmap, ADM9240_REG_INT(0), &regval);
+		if (err < 0)
+			return err;
+		*val = !!(regval & BIT(channel + 6));
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int adm9240_fan_write(struct device *dev, u32 attr, int channel, long val)
+{
+	struct adm9240_data *data = dev_get_drvdata(dev);
+	int err;
+
+	switch (attr) {
+	case hwmon_fan_min:
+		err = adm9240_fan_min_write(data, channel, val);
+		if (err < 0)
+			return err;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int adm9240_temp_read(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct adm9240_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int err, temp;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		err = regmap_read(data->regmap, ADM9240_REG_TEMP, &regval);
+		if (err < 0)
+			return err;
+		temp = regval << 1;
+		err = regmap_read(data->regmap, ADM9240_REG_TEMP_CONF, &regval);
+		if (err < 0)
+			return err;
+		temp |= regval >> 7;
+		*val = sign_extend32(temp, 8) * 500;
+		break;
+	case hwmon_temp_max:
+		err = regmap_read(data->regmap, ADM9240_REG_TEMP_MAX(0), &regval);
+		if (err < 0)
+			return err;
+		*val = (s8)regval * 1000;
+		break;
+	case hwmon_temp_max_hyst:
+		err = regmap_read(data->regmap, ADM9240_REG_TEMP_MAX(1), &regval);
+		if (err < 0)
+			return err;
+		*val = (s8)regval * 1000;
+		break;
+	case hwmon_temp_alarm:
+		err = regmap_read(data->regmap, ADM9240_REG_INT(0), &regval);
+		if (err < 0)
+			return err;
+		*val = !!(regval & BIT(4));
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int adm9240_temp_write(struct device *dev, u32 attr, int channel, long val)
+{
+	struct adm9240_data *data = dev_get_drvdata(dev);
+	int reg;
+
+	switch (attr) {
+	case hwmon_temp_max:
+		reg = ADM9240_REG_TEMP_MAX(0);
+		break;
+	case hwmon_temp_max_hyst:
+		reg = ADM9240_REG_TEMP_MAX(1);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return regmap_write(data->regmap, reg, TEMP_TO_REG(val));
+}
+
+static int adm9240_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+			int channel, long *val)
+{
+	switch (type) {
+	case hwmon_chip:
+		return adm9240_chip_read(dev, attr, val);
+	case hwmon_intrusion:
+		return adm9240_intrusion_read(dev, attr, val);
+	case hwmon_in:
+		return adm9240_in_read(dev, attr, channel, val);
+	case hwmon_fan:
+		return adm9240_fan_read(dev, attr, channel, val);
+	case hwmon_temp:
+		return adm9240_temp_read(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int adm9240_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+			 int channel, long val)
+{
+	switch (type) {
+	case hwmon_intrusion:
+		return adm9240_intrusion_write(dev, attr, val);
+	case hwmon_in:
+		return adm9240_in_write(dev, attr, channel, val);
+	case hwmon_fan:
+		return adm9240_fan_write(dev, attr, channel, val);
+	case hwmon_temp:
+		return adm9240_temp_write(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t adm9240_is_visible(const void *_data, enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	umode_t mode = 0;
+
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_alarms:
+			mode = 0444;
+			break;
+		default:
+			break;
+		}
+		break;
+	case hwmon_intrusion:
+		switch (attr) {
+		case hwmon_intrusion_alarm:
+			mode = 0644;
+			break;
+		default:
+			break;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp:
+		case hwmon_temp_alarm:
+			mode = 0444;
+			break;
+		case hwmon_temp_max:
+		case hwmon_temp_max_hyst:
+			mode = 0644;
+			break;
+		default:
+			break;
+		}
+		break;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+		case hwmon_fan_div:
+		case hwmon_fan_alarm:
+			mode = 0444;
+			break;
+		case hwmon_fan_min:
+			mode = 0644;
+			break;
+		default:
+			break;
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_alarm:
+			mode = 0444;
+			break;
+		case hwmon_in_min:
+		case hwmon_in_max:
+			mode = 0644;
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return mode;
+}
+
+static const struct hwmon_ops adm9240_hwmon_ops = {
+	.is_visible = adm9240_is_visible,
+	.read = adm9240_read,
+	.write = adm9240_write,
+};
+
+static const struct hwmon_channel_info *adm9240_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_ALARMS),
+	HWMON_CHANNEL_INFO(intrusion, HWMON_INTRUSION_ALARM),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST | HWMON_T_ALARM),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_DIV | HWMON_F_ALARM,
+			   HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_DIV | HWMON_F_ALARM),
+	NULL
+};
+
+static const struct hwmon_chip_info adm9240_chip_info = {
+	.ops = &adm9240_hwmon_ops,
+	.info = adm9240_info,
+};
+
+static bool adm9240_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ADM9240_REG_IN(0) ... ADM9240_REG_IN(5):
+	case ADM9240_REG_FAN(0) ... ADM9240_REG_FAN(1):
+	case ADM9240_REG_INT(0) ... ADM9240_REG_INT(1):
+	case ADM9240_REG_TEMP:
+	case ADM9240_REG_TEMP_CONF:
+	case ADM9240_REG_VID_FAN_DIV:
+	case ADM9240_REG_VID4:
+	case ADM9240_REG_ANALOG_OUT:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static const struct regmap_config adm9240_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.use_single_read = true,
 	.use_single_write = true,
+	.volatile_reg = adm9240_volatile_reg,
 };
 
-static int adm9240_probe(struct i2c_client *new_client)
+static int adm9240_probe(struct i2c_client *client)
 {
-	struct device *dev = &new_client->dev;
+	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct adm9240_data *data;
 	int err;
@@ -835,7 +786,7 @@ static int adm9240_probe(struct i2c_client *new_client)
 
 	data->dev = dev;
 	mutex_init(&data->update_lock);
-	data->regmap = devm_regmap_init_i2c(new_client, &adm9240_regmap_config);
+	data->regmap = devm_regmap_init_i2c(client, &adm9240_regmap_config);
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
 
@@ -843,10 +794,9 @@ static int adm9240_probe(struct i2c_client *new_client)
 	if (err < 0)
 		return err;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
-							   new_client->name,
-							   data,
-							   adm9240_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
+							 &adm9240_chip_info,
+							 adm9240_groups);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.17.1

