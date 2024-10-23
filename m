Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E63A13AA2B;
	Wed, 23 Oct 2024 20:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729716798; cv=none; b=TSeZ0KALeDCSnA+eL6C085bA33VYCbvOPUM1SjVOIUCE5sfTDZvgGleoVikdKgTydlxlJhjj7TEVlTIk9KJasjuSlqayoLO1e7SZ27MvDO13k0ai5irZG28c8UbPZSD/TK81iw7xU92me7vN6odvJ2X6xfGwf5fjQ/EkeDKOz9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729716798; c=relaxed/simple;
	bh=Mnw/s7bcwWRJJxv+CyNMILNDaoRTWFU7FMYPs4IrIRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+UCNoc39+4Uoc99M2sEF4zJmfreixfvF1+msNFjdpzxsQapKfgqvAjQLdL93Zb1Cuj3c/MOao9FjkkO0nbw5lXd1zxLJZzknHF9MtDwuTLylJ0nZgQQV//rbZsjvBqXRTvOgxMJblOq4rWlM5spBbVpCfgFs02EcKs0CDmzSAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dns8vujF; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dns8vujF"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-288a90e4394so188647fac.0;
        Wed, 23 Oct 2024 13:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729716795; x=1730321595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ITJ1VJH6IQ7GGQgfyemLH1sSX6G1fGHWHA+pv5ohzH0=;
        b=Dns8vujFOnj1KyLKmlUVB4r/9/hcR82oQwNKrGkzHO27HF2+2ePYHqSDjY4IumOJzE
         ndDGSnlVqcX3yfGZp/7C2xt5aJGTxuDpKuaNvIdYyMh33lWEU7XAJvxqByGezhqpL8Un
         rpnkYjpBDn5i56FQTuT2X6Z6liphR+2lAXzQmX+9hMdc7vTUBslTOCDHetNyu9ZozjgB
         XRbcb9iZNUUTmINJtaGvR9gWNxHU2KrVF9IOj7ViIFjPPAyJcYPAa70CRx9lVBQPXUxu
         I5c2vDmcvXMdEhc5uByojQuU5HYZpBHLPXVdk5vXhTRcNVtZ2ca/2CtPLL1oGge5slVq
         6dXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729716795; x=1730321595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITJ1VJH6IQ7GGQgfyemLH1sSX6G1fGHWHA+pv5ohzH0=;
        b=wNox6F7Bj+wRWKdV89YBll755tfTWZzbnxpO+ud3O0o9PItVRvS3Sqabuemr0W0fDK
         exBwmXygoFV588U37r6xlddBXJqTlezY9tDD5/Kqy53RPu2B43mi+yir9O+B/TJrWrm/
         WcYCymd9+D2KvjD1j5njhMUubd1koFKaWaTL6KF4WKKJBJ9oHYHIYJTBeBam/hyy0PGe
         iPmFHRB2tNJoe9f3Dh2RdcriY5pyYGm1qA+siYyxeeFEH4HkVo9JNLVKw/YA5xU9zkn3
         wA7yH41c6C77jNXjrcfYtCUlLADL7yEhz3VWsy5Kv9dGdHuXu9WSH+W+R9+mb3NkcuN4
         QgoA==
X-Forwarded-Encrypted: i=1; AJvYcCVtfb3AvQ4FltuAkg0WYr9WQoYu2yYX55MvpKrvYAK7X12vWuxuwCKDr8e94KPapOO9pdFWr5BE3WjN+Ok=@vger.kernel.org, AJvYcCWV49SAcY0SpS9b7txIx99hBkNGGktrwWEWmcbSlL5hLzjNZaDJuXtxFN7dDqe8cup8FbWS77P5fXP5@vger.kernel.org, AJvYcCXy218zFrIggWQOQeGgaF9tStZXXI9Om56YNkdKl2Hy4eqwhMVOC+uVKh7ZkBsQIs98ZThxh33bfFtg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0TnKVUXeXg/GqdpL31SKksqOAjUvCZQrtFmVhSyGwFNKWZF5Z
	aB85E+AHzRIEH11z4HO8TWypOhqlhGfWKGdM5NAVuPBGjQ6bYew4
X-Google-Smtp-Source: AGHT+IEz4/5DgTyW5EA0Ew5z5+cgccRvRpmFUat0xAxxtjdTyoJ3pNI3kWTgBjTkm76H1xEbra502A==
X-Received: by 2002:a05:6870:b493:b0:27a:a0b8:89d6 with SMTP id 586e51a60fabf-28ccb44c9d6mr4156694fac.4.1729716795373;
        Wed, 23 Oct 2024 13:53:15 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-28c792b0d19sm2651012fac.33.2024.10.23.13.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 13:53:14 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:53:11 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/2] hwmon: (pmbus/isl68137) add support for voltage
 divider on Vout
Message-ID: <67e4b3843fd276e8ed417aa181a605346bc5edc4.1729715599.git.grantpeltier93@gmail.com>
References: <cover.1729715599.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1729715599.git.grantpeltier93@gmail.com>

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
 drivers/hwmon/pmbus/isl68137.c | 204 ++++++++++++++++++++++++++++++++-
 1 file changed, 199 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 7e53fb1d5ea3..24b5adffb526 100644
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
@@ -170,6 +185,25 @@ static int raa_dmpvr2_read_word_data(struct i2c_client *client, int page,
 		ret = pmbus_read_word_data(client, page, phase,
 					   RAA_DMPVR2_READ_VMON);
 		break;
+	case PMBUS_READ_POUT:
+		/*
+		 * In cases where a voltage divider is attached to the target
+		 * rail between Vout and the Vsense pin, both Vout and Pout
+		 * should be scaled by the voltage divider scaling factor.
+		 * I.e. Vout = Vsense * (R1 + R2) / R2
+		 */
+		fallthrough;
+	case PMBUS_READ_VOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret > 0 && data->channel[page].vout_voltage_divider[0]
+			&& data->channel[page].vout_voltage_divider[1]) {
+			u64 temp = DIV_U64_ROUND_CLOSEST((u64)ret *
+				((u64)data->channel[page].vout_voltage_divider[0]
+				+ data->channel[page].vout_voltage_divider[1]),
+				data->channel[page].vout_voltage_divider[1]);
+			ret = clamp_val(temp, 0, 0xffff);
+		}
+		break;
 	default:
 		ret = -ENODATA;
 		break;
@@ -178,6 +212,50 @@ static int raa_dmpvr2_read_word_data(struct i2c_client *client, int page,
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
+		/*
+		 * In cases where a voltage divider is attached to the target
+		 * rail between Vout and the Vsense pin, Vout related PMBus
+		 * commands should be scaled based on the expected voltage
+		 * at the Vsense pin.
+		 * I.e. Vsense = Vout * R2 / (R1 + R2)
+		 */
+		fallthrough;
+	case PMBUS_VOUT_MARGIN_HIGH:
+		fallthrough;
+	case PMBUS_VOUT_MARGIN_LOW:
+		fallthrough;
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+		fallthrough;
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		fallthrough;
+	case PMBUS_VOUT_COMMAND:
+		if (data->channel[page].vout_voltage_divider[0]
+			&& data->channel[page].vout_voltage_divider[1]) {
+			u64 temp = DIV64_U64_ROUND_CLOSEST((u64)word *
+				data->channel[page].vout_voltage_divider[1],
+				((u64)data->channel[page].vout_voltage_divider[0]
+				 + data->channel[page].vout_voltage_divider[1]));
+			ret = clamp_val(temp, 0, 0xffff);
+		} else {
+			ret = -ENODATA;
+		}
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
@@ -220,14 +298,72 @@ static struct pmbus_driver_info raa_dmpvr_info = {
 	    | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
 };
 
+static int isl68137_probe_child_from_dt(struct device *dev,
+					struct device_node *child,
+					struct isl68137_data *data)
+{
+	u32 channel;
+	int err;
+
+	err = of_property_read_u32(child, "reg", &channel);
+	if (err) {
+		dev_err(dev, "missing reg property of %pOFn\n", child);
+		return err;
+	}
+	if (channel >= MAX_CHANNELS) {
+		dev_err(dev, "invalid reg %d of %pOFn\n", channel, child);
+		return -EINVAL;
+	}
+
+	err = of_property_read_u32_array(child, "renesas,vout-voltage-divider",
+				data->channel[channel].vout_voltage_divider,
+				ARRAY_SIZE(data->channel[channel].vout_voltage_divider));
+	if (err && err != -EINVAL) {
+		dev_err(dev,
+			"malformed renesas,vout-voltage-divider value for channel %d\n",
+			channel);
+		return err;
+	}
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
+	for (i = 0; i < MAX_CHANNELS; i++)
+		memset(data->channel[i].vout_voltage_divider,
+			0,
+			sizeof(data->channel[i].vout_voltage_divider));
+
+	memcpy(&data->info, &raa_dmpvr_info, sizeof(data->info));
+	info = &data->info;
 
 	switch (i2c_match_id(raa_dmpvr_id, client)->driver_data) {
 	case raa_dmpvr1_2rail:
@@ -242,6 +378,7 @@ static int isl68137_probe(struct i2c_client *client)
 	case raa_dmpvr2_1rail:
 		info->pages = 1;
 		info->read_word_data = raa_dmpvr2_read_word_data;
+		info->write_word_data = raa_dmpvr2_write_word_data;
 		break;
 	case raa_dmpvr2_2rail_nontc:
 		info->func[0] &= ~PMBUS_HAVE_TEMP3;
@@ -250,9 +387,11 @@ static int isl68137_probe(struct i2c_client *client)
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
@@ -263,11 +402,18 @@ static int isl68137_probe(struct i2c_client *client)
 		info->m[PSC_POWER] = 2;
 		info->R[PSC_POWER] = -1;
 		info->read_word_data = raa_dmpvr2_read_word_data;
+		info->write_word_data = raa_dmpvr2_write_word_data;
 		break;
 	default:
 		return -ENODEV;
 	}
 
+	if (dev->of_node) {
+		err = isl68137_probe_from_dt(dev, data);
+		if (err)
+			return err;
+	}
+
 	return pmbus_do_probe(client, info);
 }
 
@@ -318,11 +464,59 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 
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

