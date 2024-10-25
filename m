Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A45D1859;
	Fri, 25 Oct 2024 00:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729816763; cv=none; b=SQ1NjryNze/lbnwLW2afdZq3yEnDvrISB2q63XLt2Bvt5KMRca0pNF2FlI3Y5+3ItbsWAkQZCNaeIIv51GipA06mZrT3iwVo0YCpleMf/qSoNV6qn1riWJ0vOKx1nSHZl9WlFLD9JNh62rTvn8f/j8HpJZ0O87HN6mdqyJGTumk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729816763; c=relaxed/simple;
	bh=AJ9cWc3plB/HySQcPetM8ER+Pvkxex868Y4NEhXM8Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNNKb52gAA5gJHXjcev500mHFVB3K6+4ITeGyBUPmY+8N6Lcr6K4CTfnXAYjMVm/8tKVJypaTqbXi4apXA/fpI7Y1r+MUV/JiYwr0o0jzbhWADB9IJ7tim1EOEG+D7iQzJzS9K5OzK1xNR86Cwwb+z8BaXsV/wttqmUZqXqdWW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnNa/rNf; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnNa/rNf"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5eb5be68c7dso838494eaf.0;
        Thu, 24 Oct 2024 17:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729816759; x=1730421559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QKuhBZKkQlAGEHQwNvixz7FRnmRacINU7s3ZlA3DnAU=;
        b=nnNa/rNfwvDL6mCtDmWEcMn0pOrkI2ia536ax3RbVYLlGAWHifOHMeait5VBwkulNV
         DjBtKEcdEYka7/5eeAnel1vgHh5/vLnrB0arq6vayZLZ/ZT7TB5JVAIabZdtcZ/i/rdM
         g3iHhJ7rpfACXjrNem8DQTO1RUAtlUL9N802kOWGz3oNZloPydUUl0oenVWD/3uw2Ncg
         LJOW6vlZp80lRg9llo9d9lddeuk1HcrpKVf0SDiUY4+x9+vfnD7sg9Rt6XBPoXX1Pjxp
         wD37t1qBCmsddDFs7nXUWOmu+Ax+6A/rPxAKkuw1cCq62RPntclfeI4S84zih1ZVH8Aa
         z20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729816759; x=1730421559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKuhBZKkQlAGEHQwNvixz7FRnmRacINU7s3ZlA3DnAU=;
        b=SyTqgCuQNzTmuxaD9MVtZ5d2YY9QsM0gkV5YOqQGMKH5g0gA9oF3nUZMwLM4KBJ44w
         YDpQDT8UVre0r3XeYSuCBvQdaH7qc7/caBAQMkJpjRKgJIyKWFz0wtFohSOJU8j3P2Mw
         ucJQTb7Yb86PYnr2xjJC/1CfhL9yRacsq/PE7PYfNfyx9qXIUVAFN7nXWdtsf8oL/Zln
         3Mgpu//5SITaxteCSbeo2lfalGk4ibFOhAfzxkWSSkM+8NW3MfB9bISzWEBr8j/NKJ47
         vYGFQzB0uGHaRyNU3jsadHCzexv4x9VIwY0n/pue0etGuLqOVMKK5ok36Fi4g9Ax5y8W
         J8zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIVVuRtuwgRj3rv43Ony4PSyHDQgiZFSPFNbMw94e/+Rny4xRO77LewNp98x2rjreXj5J1bvQc3Qj0@vger.kernel.org, AJvYcCWqjgg1LS9Mr00yvnekAusAkAcm9HlLb6PppggXrIKow3J37PsXmwG3Izvjmbtl+chycVAB3IlgPCVv6kY=@vger.kernel.org, AJvYcCXGnqVeuUhcF2YShreKv+Ls9y9txqVbW93CCZqI8iWSaV3TPqR/4R92HMrvUCvjl8+7nG8cl7JrCpRj@vger.kernel.org
X-Gm-Message-State: AOJu0YxdcfY5rAYLx+GQeLHHxZH+M8YJhz3wq4EZN4Q3dfSqZBgyenTC
	u8KJGf2CySazPqLsiPYbv+yyO7SnbhUvyA8uQuJ+tolLutXhnRSk
X-Google-Smtp-Source: AGHT+IE5i7esEY4L0WQPd049JYwbeMK9PvsoRLC4qUQRx8WeTnxg1X5CIyEZ3Slpr3Z/jaTgpfCH7g==
X-Received: by 2002:a05:6820:1b8e:b0:5eb:758c:fa64 with SMTP id 006d021491bc7-5ebee8e4407mr5913333eaf.4.1729816759048;
        Thu, 24 Oct 2024 17:39:19 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ec1843d5f8sm43871eaf.8.2024.10.24.17.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 17:39:17 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:39:15 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 1/2] hwmon: (pmbus/isl68137) add support for voltage
 divider on Vout
Message-ID: <7138f3c551ce201ddc9b5e3889ce969d1cd0ac57.1729812789.git.grantpeltier93@gmail.com>
References: <cover.1729812789.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1729812789.git.grantpeltier93@gmail.com>

Some applications require Vout to be higher than the detectable voltage
range of the Vsense pin for a given rail. In such applications, a voltage
divider may be placed between Vout and the Vsense pin, but this results
in erroneous telemetry being read back from the part. This change adds
support for a voltage divider to be defined in the devicetree for a (or
multiple) specific rail(s) for a supported digital multiphase device and
for the applicable Vout telemetry to be scaled based on the voltage
divider configuration.

Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
---
 drivers/hwmon/pmbus/isl68137.c | 207 ++++++++++++++++++++++++++++++++-
 1 file changed, 202 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 7e53fb1d5ea3..c0bfa984102f 100644
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
@@ -163,6 +176,8 @@ static const struct attribute_group *isl68137_attribute_groups[] = {
 static int raa_dmpvr2_read_word_data(struct i2c_client *client, int page,
 				     int phase, int reg)
 {
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	const struct isl68137_data *data = to_isl68137_data(info);
 	int ret;
 
 	switch (reg) {
@@ -170,6 +185,22 @@ static int raa_dmpvr2_read_word_data(struct i2c_client *client, int page,
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
+			u64 temp = DIV_U64_ROUND_CLOSEST((u64)ret *
+				data->channel[page].vout_voltage_divider[1],
+				data->channel[page].vout_voltage_divider[0]);
+			ret = clamp_val(temp, 0, 0xffff);
+		}
+		break;
 	default:
 		ret = -ENODATA;
 		break;
@@ -178,6 +209,39 @@ static int raa_dmpvr2_read_word_data(struct i2c_client *client, int page,
 	return ret;
 }
 
+static int raa_dmpvr2_write_word_data(struct i2c_client *client, int page,
+				      int reg, u16 word)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	const struct isl68137_data *data = to_isl68137_data(info);
+	int ret;
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
+		u64 temp = DIV_U64_ROUND_CLOSEST((u64)word *
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
@@ -220,14 +284,91 @@ static struct pmbus_driver_info raa_dmpvr_info = {
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
@@ -242,6 +383,7 @@ static int isl68137_probe(struct i2c_client *client)
 	case raa_dmpvr2_1rail:
 		info->pages = 1;
 		info->read_word_data = raa_dmpvr2_read_word_data;
+		info->write_word_data = raa_dmpvr2_write_word_data;
 		break;
 	case raa_dmpvr2_2rail_nontc:
 		info->func[0] &= ~PMBUS_HAVE_TEMP3;
@@ -250,9 +392,11 @@ static int isl68137_probe(struct i2c_client *client)
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
@@ -263,11 +407,16 @@ static int isl68137_probe(struct i2c_client *client)
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
 
@@ -318,11 +467,59 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 
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

