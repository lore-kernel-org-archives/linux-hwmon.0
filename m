Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925A21BD9EB;
	Wed, 30 Oct 2024 22:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730328065; cv=none; b=IY6AwYmgFqZLMggErXvwzKzd+z8zoF5zvJFcFih5mPEv50RsHfLMRZ2O0K0XdJ7WRD0XpvHkNbOXk6L0YtwSUlh+SbVAPQc7MBxLGKjx7NlDevAtHf4fmW45OhyPI30OZZRzhMmARZamqUln+BKWs8yxWGRfM4uw+6JtRGWmsc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730328065; c=relaxed/simple;
	bh=HSY4QFx4H2RKFrb4+AwGYoJidZl3g7aMM9z8fHlk2L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uD+ENd6EWL5uStstfRBPqy1pHidXDL6IQ1J/e7+MaqZZiDPd2Hu1DKcrQ3uDp7OhfktPfnopLhPWXbe+AmWZSeKwczcE9XPcJc3+01jUKTlccFSdMWgGXhvIoukvY6tP3whNBB6EN4AG07VSrhBm1KW/xnBbU5C3D/u3LwqYpUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCP7aDcm; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCP7aDcm"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5eb60f6b4a7so144256eaf.0;
        Wed, 30 Oct 2024 15:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730328061; x=1730932861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NeW30jfrwUohCRmAQNXhpS4+Q2CX5xqoGyIMowFcCh8=;
        b=TCP7aDcmEc30ogIxQCwKgimQKQDCZALQeJeok1U7Fh1aMjAoG4XGceyGz4V3/CUkFl
         rgoonrWMXLGAcHiBRm3c2pU5dw+odT8aZSlYnEUKmAXYwpEnroq6FQh6iWe4kKQQoCD6
         yk5rhGmHztxH/vimQ7u+KTaQF5W8nYylBs7jAQUdei+mL2gZ2E/1MG2p4hbJiQS5fuGp
         lCynhOkJDXyrUcnLD+2jjxCsZgcJsR39wMbmM227hJQpwL0xdyMtXA0fg43GkrBN0/WU
         OCLLJuAfEwp7gLZkqMcZ5A7JqVD8YV2Rxgbbtpe1UaGzw3oXgKvTOgWyIUYyEAXeIo2I
         j7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730328061; x=1730932861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeW30jfrwUohCRmAQNXhpS4+Q2CX5xqoGyIMowFcCh8=;
        b=Qe9w7DCLAmyhpzOVjKgkFWH/J82EuxSwDMWdoUJl2bvaOFch/MKfwiq6XN9npBz9Ed
         uOfN68C62qUQbYbU/jaHfkM+oFf5BQxwrg6/HbJLKFFcBzOPTXgFIr6dVEdlKVz+82OD
         j9ELN6bhHKH59fq6KB8Cl52fbgBCWSxJa5iM0HMcgkfaAnP45yCsWPwH5CVGaOJNnWnK
         /LPXLOHfEotZIelTdawp0ACwL4/NjI20SpvZ7ZjbgCG8ahUi2BT/F1IVL2h34Y459Scc
         vLADKfVmcBHrzCV5mZXGnEF6CBBCkDEevovGnIU5xJzpqU1WN0haIPKnLKUVHQG9Ucbn
         4PDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtq++lYrIOpGhx9idmhQozDqqSn9Lse7RRGXJ4FMzauUfeEOV/fDIeM17rnwUbRuVFC83/KaE4Zmy5@vger.kernel.org, AJvYcCW2ncdMnFORyr7OJZd0daP7SCBnLYurKzHanONAUQ8Sh0Ybw0x8Nz1Tgc+WhYFv3QVTD3e+deY2M7JBw1M=@vger.kernel.org, AJvYcCXr7HGtRqKZWhGH/t9xMyUw7Ch02ObfiihCstV14bLY5QCQiAHaYMjij/Fcw3QmnXnS6Dxllz65n0qU@vger.kernel.org
X-Gm-Message-State: AOJu0YzrezXLvO0RbF2Oy31fI4JTyjUKaF9RHgC+cO2HT6j2OoutKF+M
	4qMWVQhLT7lpEl83cCSWVOZ5zkUS4nySJmLY7BZVE5Hc6zkkvg+25j6eOOQf
X-Google-Smtp-Source: AGHT+IFFn0Nk860biVolgWGFhLVE4FHknRY0i9XVI8UdRKjqK5zzvo8TW2/S/nhVsv6aS9BVgD4mgg==
X-Received: by 2002:a05:6820:1501:b0:5e7:caf5:ae1f with SMTP id 006d021491bc7-5ec238a7adcmr10998214eaf.2.1730328061648;
        Wed, 30 Oct 2024 15:41:01 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::3b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ec70532d1dsm39502eaf.27.2024.10.30.15.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 15:41:01 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:40:58 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v6 1/2] hwmon: (pmbus/isl68137) add support for voltage
 divider on Vout
Message-ID: <2189696bf68e64e8f8e41e71f11194c1f8a2889f.1730326916.git.grantpeltier93@gmail.com>
References: <cover.1730326915.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1730326915.git.grantpeltier93@gmail.com>

Some applications require Vout to be higher than the detectable voltage
range of the Vsense pin for a given rail. In such applications, a voltage
divider may be placed between Vout and the Vsense pin, but this results
in erroneous telemetry being read back from the part. This change adds
support for a voltage divider to be defined in the devicetree for a (or
multiple) specific rail(s) for a supported digital multiphase device and
for the applicable Vout telemetry to be scaled based on the voltage
divider configuration.

This change copies the implementation of the vout-voltage-divider
devicetree property defined in the maxim,max20730 bindings schema since
it is the best fit for the use case of scaling hwmon PMBus telemetry. The
generic voltage-divider property used by many iio drivers was determined
to be a poor fit because that schema is tied directly to iio and the
isl68137 driver is not an iio driver.

Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
---
 drivers/hwmon/pmbus/isl68137.c | 209 ++++++++++++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 7e53fb1d5ea3..cd0cc82c18e7 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
 
@@ -20,6 +21,7 @@
 
 #define ISL68137_VOUT_AVS	0x30
 #define RAA_DMPVR2_READ_VMON	0xc8
+#define MAX_CHANNELS            4
 
 enum chips {
 	isl68137,
@@ -72,6 +74,17 @@ enum variants {
 	raa_dmpvr2_hv,
 };
 
+struct isl68137_channel {
+	u32 vout_voltage_divider[2];
+};
+
+struct isl68137_data {
+	struct pmbus_driver_info info;
+	struct isl68137_channel channel[MAX_CHANNELS];
+};
+
+#define to_isl68137_data(x)	container_of(x, struct isl68137_data, info)
+
 static const struct i2c_device_id raa_dmpvr_id[];
 
 static ssize_t isl68137_avs_enable_show_page(struct i2c_client *client,
@@ -163,13 +176,32 @@ static const struct attribute_group *isl68137_attribute_groups[] = {
 static int raa_dmpvr2_read_word_data(struct i2c_client *client, int page,
 				     int phase, int reg)
 {
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	const struct isl68137_data *data = to_isl68137_data(info);
 	int ret;
+	u64 temp;
 
 	switch (reg) {
 	case PMBUS_VIRT_READ_VMON:
 		ret = pmbus_read_word_data(client, page, phase,
 					   RAA_DMPVR2_READ_VMON);
 		break;
+	case PMBUS_READ_POUT:
+	case PMBUS_READ_VOUT:
+		/*
+		 * In cases where a voltage divider is attached to the target
+		 * rail between Vout and the Vsense pin, both Vout and Pout
+		 * should be scaled by the voltage divider scaling factor.
+		 * I.e. Vout = Vsense * Rtotal / Rout
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret > 0) {
+			temp = DIV_U64_ROUND_CLOSEST((u64)ret *
+				data->channel[page].vout_voltage_divider[1],
+				data->channel[page].vout_voltage_divider[0]);
+			ret = clamp_val(temp, 0, 0xffff);
+		}
+		break;
 	default:
 		ret = -ENODATA;
 		break;
@@ -178,6 +210,40 @@ static int raa_dmpvr2_read_word_data(struct i2c_client *client, int page,
 	return ret;
 }
 
+static int raa_dmpvr2_write_word_data(struct i2c_client *client, int page,
+				      int reg, u16 word)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	const struct isl68137_data *data = to_isl68137_data(info);
+	int ret;
+	u64 temp;
+
+	switch (reg) {
+	case PMBUS_VOUT_MAX:
+	case PMBUS_VOUT_MARGIN_HIGH:
+	case PMBUS_VOUT_MARGIN_LOW:
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+	case PMBUS_VOUT_COMMAND:
+		/*
+		 * In cases where a voltage divider is attached to the target
+		 * rail between Vout and the Vsense pin, Vout related PMBus
+		 * commands should be scaled based on the expected voltage
+		 * at the Vsense pin.
+		 * I.e. Vsense = Vout * Rout / Rtotal
+		 */
+		temp = DIV_U64_ROUND_CLOSEST((u64)word *
+				data->channel[page].vout_voltage_divider[0],
+				data->channel[page].vout_voltage_divider[1]);
+		ret = clamp_val(temp, 0, 0xffff);
+		break;
+	default:
+		ret = -ENODATA;
+		break;
+	}
+	return ret;
+}
+
 static struct pmbus_driver_info raa_dmpvr_info = {
 	.pages = 3,
 	.format[PSC_VOLTAGE_IN] = direct,
@@ -220,14 +286,91 @@ static struct pmbus_driver_info raa_dmpvr_info = {
 	    | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
 };
 
+static int isl68137_probe_child_from_dt(struct device *dev,
+					struct device_node *child,
+					struct isl68137_data *data)
+{
+	u32 channel, rout, rtotal;
+	int err;
+
+	err = of_property_read_u32(child, "reg", &channel);
+	if (err) {
+		dev_err(dev, "missing reg property of %pOFn\n", child);
+		return err;
+	}
+	if (channel >= data->info.pages) {
+		dev_err(dev, "invalid reg %d of %pOFn\n", channel, child);
+		return -EINVAL;
+	}
+
+	err = of_property_read_u32_array(child, "vout-voltage-divider",
+				data->channel[channel].vout_voltage_divider,
+				ARRAY_SIZE(data->channel[channel].vout_voltage_divider));
+	if (err && err != -EINVAL) {
+		dev_err(dev,
+			"malformed vout-voltage-divider value for channel %d\n",
+			channel);
+		return err;
+	}
+
+	rout = data->channel[channel].vout_voltage_divider[0];
+	rtotal = data->channel[channel].vout_voltage_divider[1];
+	if (rout == 0) {
+		dev_err(dev,
+			"Voltage divider output resistance must be greater than 0\n");
+		return -EINVAL;
+	}
+	if (rtotal < rout) {
+		dev_err(dev,
+			"Voltage divider total resistance is less than output resistance\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int isl68137_probe_from_dt(struct device *dev,
+				  struct isl68137_data *data)
+{
+	const struct device_node *np = dev->of_node;
+	struct device_node *child;
+	int err;
+
+	for_each_child_of_node(np, child) {
+		if (strcmp(child->name, "channel"))
+			continue;
+
+		err = isl68137_probe_child_from_dt(dev, child, data);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static int isl68137_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
+	struct isl68137_data *data;
+	int i, err;
 
-	info = devm_kzalloc(&client->dev, sizeof(*info), GFP_KERNEL);
-	if (!info)
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
 		return -ENOMEM;
-	memcpy(info, &raa_dmpvr_info, sizeof(*info));
+
+	/*
+	 * Initialize all voltage dividers to Rout=1 and Rtotal=1 to simplify
+	 * logic in PMBus word read/write functions
+	 */
+	for (i = 0; i < MAX_CHANNELS; i++)
+		memset(data->channel[i].vout_voltage_divider,
+			1,
+			sizeof(data->channel[i].vout_voltage_divider));
+
+
+	memcpy(&data->info, &raa_dmpvr_info, sizeof(data->info));
+	info = &data->info;
 
 	switch (i2c_match_id(raa_dmpvr_id, client)->driver_data) {
 	case raa_dmpvr1_2rail:
@@ -242,6 +385,7 @@ static int isl68137_probe(struct i2c_client *client)
 	case raa_dmpvr2_1rail:
 		info->pages = 1;
 		info->read_word_data = raa_dmpvr2_read_word_data;
+		info->write_word_data = raa_dmpvr2_write_word_data;
 		break;
 	case raa_dmpvr2_2rail_nontc:
 		info->func[0] &= ~PMBUS_HAVE_TEMP3;
@@ -250,9 +394,11 @@ static int isl68137_probe(struct i2c_client *client)
 	case raa_dmpvr2_2rail:
 		info->pages = 2;
 		info->read_word_data = raa_dmpvr2_read_word_data;
+		info->write_word_data = raa_dmpvr2_write_word_data;
 		break;
 	case raa_dmpvr2_3rail:
 		info->read_word_data = raa_dmpvr2_read_word_data;
+		info->write_word_data = raa_dmpvr2_write_word_data;
 		break;
 	case raa_dmpvr2_hv:
 		info->pages = 1;
@@ -263,11 +409,16 @@ static int isl68137_probe(struct i2c_client *client)
 		info->m[PSC_POWER] = 2;
 		info->R[PSC_POWER] = -1;
 		info->read_word_data = raa_dmpvr2_read_word_data;
+		info->write_word_data = raa_dmpvr2_write_word_data;
 		break;
 	default:
 		return -ENODEV;
 	}
 
+	err = isl68137_probe_from_dt(dev, data);
+	if (err)
+		return err;
+
 	return pmbus_do_probe(client, info);
 }
 
@@ -318,11 +469,59 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, raa_dmpvr_id);
 
+static const struct of_device_id isl68137_of_match[] = {
+	{ .compatible = "renesas,isl68137", .data = (void *)raa_dmpvr1_2rail },
+	{ .compatible = "renesas,isl68220", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl68221", .data = (void *)raa_dmpvr2_3rail },
+	{ .compatible = "renesas,isl68222", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl68223", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl68224", .data = (void *)raa_dmpvr2_3rail },
+	{ .compatible = "renesas,isl68225", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl68226", .data = (void *)raa_dmpvr2_3rail },
+	{ .compatible = "renesas,isl68227", .data = (void *)raa_dmpvr2_1rail },
+	{ .compatible = "renesas,isl68229", .data = (void *)raa_dmpvr2_3rail },
+	{ .compatible = "renesas,isl68233", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl68239", .data = (void *)raa_dmpvr2_3rail },
+
+	{ .compatible = "renesas,isl69222", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69223", .data = (void *)raa_dmpvr2_3rail },
+	{ .compatible = "renesas,isl69224", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69225", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69227", .data = (void *)raa_dmpvr2_3rail },
+	{ .compatible = "renesas,isl69228", .data = (void *)raa_dmpvr2_3rail },
+	{ .compatible = "renesas,isl69234", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69236", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69239", .data = (void *)raa_dmpvr2_3rail },
+	{ .compatible = "renesas,isl69242", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69243", .data = (void *)raa_dmpvr2_1rail },
+	{ .compatible = "renesas,isl69247", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69248", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69254", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69255", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69256", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69259", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69260", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69268", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69269", .data = (void *)raa_dmpvr2_3rail },
+	{ .compatible = "renesas,isl69298", .data = (void *)raa_dmpvr2_2rail },
+
+	{ .compatible = "renesas,raa228000", .data = (void *)raa_dmpvr2_hv },
+	{ .compatible = "renesas,raa228004", .data = (void *)raa_dmpvr2_hv },
+	{ .compatible = "renesas,raa228006", .data = (void *)raa_dmpvr2_hv },
+	{ .compatible = "renesas,raa228228", .data = (void *)raa_dmpvr2_2rail_nontc },
+	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, isl68137_of_match);
+
 /* This is the driver that will be inserted */
 static struct i2c_driver isl68137_driver = {
 	.driver = {
-		   .name = "isl68137",
-		   },
+		.name = "isl68137",
+		.of_match_table = isl68137_of_match,
+	},
 	.probe = isl68137_probe,
 	.id_table = raa_dmpvr_id,
 };
-- 
2.39.5

