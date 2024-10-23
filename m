Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9D81798C;
	Wed, 23 Oct 2024 01:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729648687; cv=none; b=JPgH+k2mo6D8AhNLAndkEiMIFTw4DdFi5E73PkAJpB0izPAViwXSlHZ5g/vj96fKSFhtps8iFb2G5U9T7U/rAaEhe+ISc6TeQu+ApPgpVWTbL/WKiPZmydPw/WVaG7CWzgqktgFlMmPW0IFoFSn2FNcjdmN1R9HP67BcIXIphBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729648687; c=relaxed/simple;
	bh=850rvw7O/1GX+FiHe7vwj7JtR43NJxm6BdesL2k7fac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3/T1PraeaXm30xAb7VDBSn4q37SGZT/smkkHdCtzE2RqqIXHTluQU+sitV7CfFnh4ujwO0gxBx3qMaHXTuq0QSrCGHb7IsJAaveAvNDGt/Lgv+4bFvJ797Ip1nOS3kLBY6dB5ouaBC9ZiznmBYZsM9e68uFOh2u2nEX/DRQJM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/rUoTBx; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/rUoTBx"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5ebc0992560so1649660eaf.0;
        Tue, 22 Oct 2024 18:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729648685; x=1730253485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FzjuMQ4Y37ixtdKphYc2fIpp6I1M0+rkXWHNEiTaw8Y=;
        b=V/rUoTBxYiG2D7zsvdQdmsmxHSYgiTsHKTZswvbFKDImfhL3RAGShd5ZywXNvm+QqZ
         HNRZAkE+xq16823XvdGIRldje57zUqSjFxtBiFvKS3GGDn5WHv56uhcVITCpmflTRZ05
         NugGc3cX/pVKlrjzdonM+zLRdGiWhwRAD3F4imT/UvmUGOHnDZqITIfGixEMdkBbMZyv
         yf3CqqdGDkm6K+6lpMMLVV8RBfzwEN3cWzewnc6umrcUxIAmBQD+EQ7/vGjnewmUX3l8
         /NHHPckfieOgbHJhTeHgOk8H93xZkhubUZPbApz/dD5I+FaVo/WgbhqnEmYzahdCyx8S
         qGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729648685; x=1730253485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzjuMQ4Y37ixtdKphYc2fIpp6I1M0+rkXWHNEiTaw8Y=;
        b=fqsprTNYpWcSx9/ubP8lwU8pQsvv/vD18woQZCRMfzfMAljN/ZZbjc5yZJPDUjg08D
         Y7UppHmkW9wGl7cdMqr8Dhw7EHP6z+8kaLb2rIaef1HphESrQnLWzuMH7Z8CfEjmn1ye
         fusfyVy1GfHQkIsrCf8lTOkxGqQGdlyicW+xHgaebrkoHHjHMLqaatH7uZ0JuPd1shKR
         g5K5Yh+BbNF77QDhaUAyX1xzETHsYBllS8lvIuPsIT2XCGSxAz0F5fkJBDtwV2uCH0EL
         416A2fTk6IidtwxA0LwALYt11cPEnp1qu/6rkzTOLa+lzYFM2txHRb/meSo62tMgmZTt
         1svg==
X-Forwarded-Encrypted: i=1; AJvYcCVejUylsWhbg/D0R/Qay9YxHbJ3hMeVoPqz89nUsoM1FsRW2+dzmDSiELD810G0DJv/Ig84KLr5PwnV@vger.kernel.org, AJvYcCWnlMfdZrubF3BgIcrxsI6GhGzWbX6rpUJmOXjZlIaVCNjc0ruw4DSS6ULE4qwyfrkQkU4LN3HyTZC8rhw=@vger.kernel.org, AJvYcCX4BwnOkgTbMpoW0LSudtWNkJv5k1RuSrv3IsxQBjY1yOlrzAkvdtwzRVygrnGRgQYwLeppHXBiLSX7@vger.kernel.org
X-Gm-Message-State: AOJu0YwkGYyPeOM3k6YtBwPm5zDlfbOi+clm81VMusql8yH2vNelYZIe
	NRcJtLVes6K9OI7MEawX/yWiLYT91KqPM5yngqGJpDzMXo2E52g3
X-Google-Smtp-Source: AGHT+IGzMGD3U9IigmmqYRTxjbvVqIywkqsDkan0D2gfIPY1Z62QQylIzmmlQ8HpCr9AJamx1+603w==
X-Received: by 2002:a05:6820:60e:b0:5e1:ba38:86e7 with SMTP id 006d021491bc7-5ebee90299amr790107eaf.5.1729648684685;
        Tue, 22 Oct 2024 18:58:04 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ebb7adfa17sm1622424eaf.36.2024.10.22.18.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 18:58:03 -0700 (PDT)
Date: Tue, 22 Oct 2024 20:58:01 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: robh@kernel.org, linux@roeck-us.net, geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/2] hwmon: (pmbus/isl68137) add support for voltage
 divider on Vout
Message-ID: <422a40e992e047e250a3b1295503e3b81b5515ae.1729646466.git.grantpeltier93@gmail.com>
References: <cover.1729646466.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1729646466.git.grantpeltier93@gmail.com>

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
 drivers/hwmon/pmbus/isl68137.c | 199 ++++++++++++++++++++++++++++++++-
 1 file changed, 194 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 7e53fb1d5ea3..b4f581e1d560 100644
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
+			u64 temp = DIV_ROUND_CLOSEST_ULL((u64)ret *
+				(data->channel[page].vout_voltage_divider[0]
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
+			u64 temp = DIV_ROUND_CLOSEST_ULL((u64)word *
+				data->channel[page].vout_voltage_divider[1],
+				(data->channel[page].vout_voltage_divider[0] +
+				 data->channel[page].vout_voltage_divider[1]));
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
@@ -220,14 +298,67 @@ static struct pmbus_driver_info raa_dmpvr_info = {
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
+	of_property_read_u32_array(child, "renesas,vout-voltage-divider",
+				data->channel[channel].vout_voltage_divider,
+				ARRAY_SIZE(data->channel[channel].vout_voltage_divider));
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
+	for (i = 0; i < MAX_CHANNELS; i++)
+		memset(data->channel[i].vout_voltage_divider,
+			0,
+			sizeof(data->channel[i].vout_voltage_divider));
+
+	memcpy(&data->info, &raa_dmpvr_info, sizeof(data->info));
+	info = &data->info;
 
 	switch (i2c_match_id(raa_dmpvr_id, client)->driver_data) {
 	case raa_dmpvr1_2rail:
@@ -242,6 +373,7 @@ static int isl68137_probe(struct i2c_client *client)
 	case raa_dmpvr2_1rail:
 		info->pages = 1;
 		info->read_word_data = raa_dmpvr2_read_word_data;
+		info->write_word_data = raa_dmpvr2_write_word_data;
 		break;
 	case raa_dmpvr2_2rail_nontc:
 		info->func[0] &= ~PMBUS_HAVE_TEMP3;
@@ -250,9 +382,11 @@ static int isl68137_probe(struct i2c_client *client)
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
@@ -263,11 +397,18 @@ static int isl68137_probe(struct i2c_client *client)
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
 
@@ -318,11 +459,59 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 
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

