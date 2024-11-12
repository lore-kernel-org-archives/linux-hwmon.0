Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D32217472;
	Tue, 12 Nov 2024 20:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442173; cv=none; b=HhY99F2RE4Xfn/A+eWsjKZ+P3zRI91UT+LBFAQkR092GZLj5MvI7/6f/5gyokNkjBA6Zb6+b096zvaFIrhTlkIr3d+CyScdgPgZujk2p8j9ebHoBhEbLE41UJdmnFz6dBJuiYBWk8SoX4SORzT05zAe5oqSrcfPtD/OWDugQCmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442173; c=relaxed/simple;
	bh=0NUxq/gGaXjb17hIjFnhDTrdltKpFNdhlU6m+AA7E8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDqE8N2HmtD6ss7zSH85/7zjn6chCh+27pn8cHG7VkuvmOmo1JN5dipR6m1DH5/jksV/VSbKKgddx1nZg773myrbmwc+1uvIlBfra3KuQcykl/k/2+WwSmEhJ20DutSx5pnV5YuHicZZtXsLIXHleR6q+59QQGmZl9wUYKqOeDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLD9USJ6; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLD9USJ6"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-288916b7fceso3104469fac.3;
        Tue, 12 Nov 2024 12:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731442171; x=1732046971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8uJq0Du4rqp6q8MnkfQL3y7/Gdb34NR8DXejlN7qrL8=;
        b=YLD9USJ6iBmLbNjpquyM80AIXffQIqZfbqp1R9tHd2D+SqVFAKtCX7L2TtCez62z26
         oe1ZvI3b7iaN3s2m2lDnZBPXP0vw5qn2gmNfuksYJs1gtyIMuU+yZw2Mf/OOqhF+mA1o
         vrDZjmteP2za4Q1t6frMSzc+2/IZeluDNSWRjWxoWV2K2WNwX0lYcjyXQEMjav3tL/W6
         qLVecFNY4IpOf5d+A8beMid/RvFIG8ya5NfT+VxFpxtfWxJDPwgcRZ3/nXRBZHxEiJ98
         apeXtqYYp3n48eIJ+X5U2JD7jMCUXG6hyQxCmBqqvQ4LEZn7tiB0bWUf/2ri0rq9Wky1
         lakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442171; x=1732046971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uJq0Du4rqp6q8MnkfQL3y7/Gdb34NR8DXejlN7qrL8=;
        b=h/CFRM6Z2USIG6DEvDM7ActRqu58jY1J+4t/0ox8S8+evl+jq6Iv6G7sUnXb/6Jjxw
         Nj5DiFVv397OVjUjPwLWpfhB/sjpkZSeaFBbeP5LrlsZ1D57OCZzQhho+IjoeqU94BGO
         LmHJG5UWTCewoTvqAsqFn3BiHd9+RI1nJKsCHckZXuCu2GNuZ9Wzsll4c3iVKBLIf+P9
         OzmuFBBSI9Mwfm2tf5skRBRyQLc8qZnxOwh3nTdt3Bn160kRwPbq+2Vkc0JPB2IELHQo
         ZurlJduicmdGJz1gITqrb62/FZtoXDKGBl8TUjkJ8Xl9105AE40sd4Y+/v2JJcsvSJ2Q
         rFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJSabh/OQ9doLAcQ9t5uC+O6bMZmusOO0vJYuqMzTd6srw2cBN74TSeuq8N62fi73/7XGn7X8viWIk@vger.kernel.org, AJvYcCWX80KbcOYipwMhH0d9rXNehTiHZinsuhL+IpIzwAbfQ2LVwJA3fBeO5F87QD7oudO1x20vq8LctVGpVEg=@vger.kernel.org, AJvYcCXg5Elij4xEm0KQcKn98GEPXsUNhBNbAE85/Y3fL2HDIw9YifHW+6LRi3ZvnFmNzo76Gvcsll77LI/v@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/84x8U1XA8To9wKGgge916Mzeas/EMBkY1VvoJLCQfDXVdAbS
	iy/gGk/lOXEkjrcKc1SEiDYedgLlm2XQvknd4MT28D+iVIIPe+BQ/pWYTHg1
X-Google-Smtp-Source: AGHT+IGGN416Kl54mfU8omFPFmxwyaSOQAvIuqBrXk7rttMt/O8EIclf5sdN5kdOIsiZC82LQQoxeg==
X-Received: by 2002:a05:6870:80cc:b0:277:df58:1647 with SMTP id 586e51a60fabf-295e903e1bcmr367764fac.35.1731442170857;
        Tue, 12 Nov 2024 12:09:30 -0800 (PST)
Received: from raspberrypi ([2600:1700:90:4c80::3b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a600a2af3sm42372a34.67.2024.11.12.12.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 12:09:30 -0800 (PST)
Date: Tue, 12 Nov 2024 14:09:28 -0600
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 1/2] hwmon: (pmbus/isl68137) add support for voltage
 divider on Vout
Message-ID: <8c2d048f87282bcf66313afbf5e923d8fc17b4d7.1731439797.git.grantpeltier93@gmail.com>
References: <cover.1731439797.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1731439797.git.grantpeltier93@gmail.com>

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
 drivers/hwmon/pmbus/isl68137.c | 210 ++++++++++++++++++++++++++++++++-
 1 file changed, 205 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 7e53fb1d5ea3..97cc951a13a4 100644
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
@@ -220,14 +286,90 @@ static struct pmbus_driver_info raa_dmpvr_info = {
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
+					 data->channel[channel].vout_voltage_divider,
+					 ARRAY_SIZE(data->channel[channel].vout_voltage_divider));
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
+		       1,
+		       sizeof(data->channel[i].vout_voltage_divider));
+
+	memcpy(&data->info, &raa_dmpvr_info, sizeof(data->info));
+	info = &data->info;
 
 	switch (i2c_match_id(raa_dmpvr_id, client)->driver_data) {
 	case raa_dmpvr1_2rail:
@@ -237,11 +379,14 @@ static int isl68137_probe(struct i2c_client *client)
 		info->func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
 		    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
 		    | PMBUS_HAVE_POUT;
+		info->read_word_data = raa_dmpvr2_read_word_data;
+		info->write_word_data = raa_dmpvr2_write_word_data;
 		info->groups = isl68137_attribute_groups;
 		break;
 	case raa_dmpvr2_1rail:
 		info->pages = 1;
 		info->read_word_data = raa_dmpvr2_read_word_data;
+		info->write_word_data = raa_dmpvr2_write_word_data;
 		break;
 	case raa_dmpvr2_2rail_nontc:
 		info->func[0] &= ~PMBUS_HAVE_TEMP3;
@@ -250,9 +395,11 @@ static int isl68137_probe(struct i2c_client *client)
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
@@ -263,11 +410,16 @@ static int isl68137_probe(struct i2c_client *client)
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
 
@@ -318,11 +470,59 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, raa_dmpvr_id);
 
+static const struct of_device_id isl68137_of_match[] = {
+	{ .compatible = "isil,isl68137", .data = (void *)raa_dmpvr1_2rail },
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
+	{ .compatible = "isil,isl69260", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,isl69268", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "isil,isl69269", .data = (void *)raa_dmpvr2_3rail },
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

