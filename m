Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B9924BD1A
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Dec 2025 22:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766787607; cv=none; b=IYigV+9aHOgGMnrJH2S5OA5kOrjRgmbbND8svGo6Av9khmGTykAbNGvD8x0TinjXi8j1epG17qOP1Ic3JJzD78+qN5/ELmWe5q7BUpUB2P0M2SA3hoxtdpJAiLQ2ukBgM8PI8Jn/sQ9wAFbJkzHmPRpC/+Js5urpsBZX924pK4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766787607; c=relaxed/simple;
	bh=uLXmu+Bz9vHtv4KmcPQFbu1wlU7Z7qZ1GKxfEIdc2TY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eu7Rlhs0z7Xr61caVpEX8dOv3yMpEFkVSyNSvwWYTpPQn+DsMZbRDuXRFb4LMDzgAiYpYL7zTNtN7QypZ9URA4kMGDFe1uiGi4OSaRu4qhfWgVo1X/lyLVsBswLpng/303PBsGDVfxoXA727DabpWbVFtOfiVwV1sbMQ3LaUrVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=qJxt8XNC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="qJxt8XNC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso47334535e9.3
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Dec 2025 14:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1766787602; x=1767392402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8NVY+5EI1kKLr7cLyAGHn3PAbDsBLYNdL+yfvbhJFY=;
        b=qJxt8XNC3D2F3w5BC0w3zhg5HUhIvYRu6L1vmNQpgX/3bgacOIFlNs6FvEe/KFNsXS
         suWJznbykRXnnkEoRNM2T5c6+as9J1XnmUlNr8CxtPls0tcm1tjKw9tALortlM/gaReM
         UOX3gRLRt46mgPcfGfnsPq16bfmpesvbXUxV4obcyqyG1ELOQlZFOR5/WOLye8hhD1I+
         XteqP7TdTbCGaFxWYDtgJ/RyUglYbDpXpIZzYphK/l3jJk+X2FU0pblsk0I9YnWhZebn
         TC6w+TDv0e/aBRoOkSbo7pB/QiXwdjc8P3Qtd4pp6l7cbntGl7j+dzIB+srTXW+ZNL50
         Hs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766787602; x=1767392402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8NVY+5EI1kKLr7cLyAGHn3PAbDsBLYNdL+yfvbhJFY=;
        b=KDMV2RRz2AhcXucYMHQ1jCXb76GAVbkuCGaPdynGv3iD9MkFuf+FqOeY8sE64Pn7Oj
         ZrKXbrNZckhP6VTFcXRe6NEAoWjcwSyOtzrkuUZMKSq0gajyY9NSgwtoiGCNIYpqnpmt
         mTpkrTeAZ5ZRyc8OwJgntOJlVirFl5EQEMe4CUzpNEge7YhkWEOEK2Msvnp+R9Qy/xBG
         i6fkaDQB48ZSu2GcYW7Q0xXGkrf4ekOTs/2s+kEtwbPgXOHgTpQgKjBe9K00UeRjW+k/
         7pZYxlYTkZ1BdVt1kxMd1cH3NuUY/83aGi1WDGd8u8meyNWrNg9KNcDLDRuwgvyFhjNV
         ipBg==
X-Gm-Message-State: AOJu0YxWWOFHfJ06yDamQTuExgocCTbOCI9F7SzVXDWj0W7F/Hb58d24
	NyEtZz+3V3uyNQzQsmQxFVfWSw4D+k6gXY9lUVj/+M711LH0xoACQVzw2E1lummo2w==
X-Gm-Gg: AY/fxX6gKoLJNdG8ZPN6ehLA5f92yEuLPT/rG3NGwEMfJe1hnmyCXAePgB+FReIAy1e
	ckw1C7qAU1Pbm4MXM7Cw9Zsu+yzcwrlR8ndde3S2L53JQSpTvzIMnIBMg1HQMEb4HyOOFd93UYy
	dG0gCmugwv5ROkV4QDsPU57Q9MIHDaVovPUyuExryGjh62i6+AHzRtcpSMsuaoss/Z0hg5rthOR
	YD4fmSLzMUOHvkApGW8Kps8wjZNOoxnBLI3wd0yW2uYMDUn838fLESwGAh0UI43iLIikCLqLZNm
	oe3lNdGCQJKKOjX6/4XDU/9oWhJTv8pK6QIhtrdnGBg4LI4HtRk+p3TRQ1dmRCe2YcjQAzyfaGo
	c9o1A4x3zWN/Fbmw83Zbzrl40oUtkIVyhYnuHd+ggsfoHGu56G0q3xRFRjZ9diWQUvWP4MDzKn9
	F1veeT1MxfjD2AqmCCzhofU13ii/qa
X-Google-Smtp-Source: AGHT+IFAoRtZWg9y9OwSHRs1BbVxiTBqizdeW2Wsay8CteURMJUw/v+E8EPEtwdfIO9Exr+/Fdm/Tg==
X-Received: by 2002:a05:600c:c494:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-47d19582aacmr270256265e9.30.1766787602418;
        Fri, 26 Dec 2025 14:20:02 -0800 (PST)
Received: from mac.net ([2001:861:8b92:2c50:e0be:8639:3d60:4c9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm472599915e9.7.2025.12.26.14.20.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Dec 2025 14:20:02 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH] hwmon: it87: expose additional temperature limits
Date: Fri, 26 Dec 2025 23:20:01 +0100
Message-ID: <20251226222001.41914-1-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: benoit.masson <yahoo@perenite.com>
---
 drivers/hwmon/it87.c | 91 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 76 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 1107039d2b6a..d50c40f8607f 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -246,7 +246,9 @@ static const u8 IT87_REG_FAN[]         = { 0x0d, 0x0e, 0x0f, 0x80, 0x82, 0x4c };
 static const u8 IT87_REG_FAN_MIN[]     = { 0x10, 0x11, 0x12, 0x84, 0x86, 0x4e };
 static const u8 IT87_REG_FANX[]        = { 0x18, 0x19, 0x1a, 0x81, 0x83, 0x4d };
 static const u8 IT87_REG_FANX_MIN[]    = { 0x1b, 0x1c, 0x1d, 0x85, 0x87, 0x4f };
-static const u8 IT87_REG_TEMP_OFFSET[] = { 0x56, 0x57, 0x59 };
+static const u8 IT87_REG_TEMP_OFFSET[] = { 0x56, 0x57, 0x59, 0x5a, 0x90, 0x91 };
+static const u8 IT87_REG_TEMP_OFFSET_8686[] =
+	{ 0x56, 0x57, 0x59, 0x90, 0x91, 0x92 };
 
 #define IT87_REG_FAN_MAIN_CTRL 0x13
 #define IT87_REG_FAN_CTL       0x14
@@ -260,8 +262,12 @@ static const u8 IT87_REG_VIN[]	= { 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
 
 #define IT87_REG_VIN_MAX(nr)   (0x30 + (nr) * 2)
 #define IT87_REG_VIN_MIN(nr)   (0x31 + (nr) * 2)
-#define IT87_REG_TEMP_HIGH(nr) (0x40 + (nr) * 2)
-#define IT87_REG_TEMP_LOW(nr)  (0x41 + (nr) * 2)
+static const u8 IT87_REG_TEMP_HIGH[]   = { 0x40, 0x42, 0x44, 0x46, 0xb4, 0xb6 };
+static const u8 IT87_REG_TEMP_HIGH_8686[] =
+	{ 0x40, 0x42, 0x44, 0xb4, 0xb6, 0xb8 };
+static const u8 IT87_REG_TEMP_LOW[]    = { 0x41, 0x43, 0x45, 0x47, 0xb5, 0xb7 };
+static const u8 IT87_REG_TEMP_LOW_8686[] =
+	{ 0x41, 0x43, 0x45, 0xb5, 0xb7, 0xb9 };
 
 #define IT87_REG_VIN_ENABLE    0x50
 #define IT87_REG_TEMP_ENABLE   0x51
@@ -610,6 +616,9 @@ struct it87_data {
 	u16 fan[NUM_FAN][2];	/* Register values, [nr][0]=fan, [1]=min */
 	u8 has_temp;		/* Bitfield, temp sensors enabled */
 	s8 temp[NUM_TEMP][4];	/* [nr][0]=temp, [1]=min, [2]=max, [3]=offset */
+	const u8 *reg_temp_low;
+	const u8 *reg_temp_high;
+	const u8 *reg_temp_offset;
 	u8 sensor;		/* Register value (IT87_REG_TEMP_ENABLE) */
 	u8 extra;		/* Register value (IT87_REG_TEMP_EXTRA) */
 	u8 fan_div[NUM_FAN_DIV];/* Register encoding, shifted right */
@@ -1011,15 +1020,15 @@ static struct it87_data *it87_update_device(struct device *dev)
 			    i < data->num_temp_offset)
 				data->temp[i][3] =
 				  it87_read_value(data,
-						  IT87_REG_TEMP_OFFSET[i]);
+						  data->reg_temp_offset[i]);
 
 			if (i >= data->num_temp_limit)
 				continue;
 
 			data->temp[i][1] =
-				it87_read_value(data, IT87_REG_TEMP_LOW(i));
+				it87_read_value(data, data->reg_temp_low[i]);
 			data->temp[i][2] =
-				it87_read_value(data, IT87_REG_TEMP_HIGH(i));
+				it87_read_value(data, data->reg_temp_high[i]);
 		}
 
 		/* Newer chips don't have clock dividers */
@@ -1199,10 +1208,10 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *attr,
 	switch (index) {
 	default:
 	case 1:
-		reg = IT87_REG_TEMP_LOW(nr);
+		reg = data->reg_temp_low[nr];
 		break;
 	case 2:
-		reg = IT87_REG_TEMP_HIGH(nr);
+		reg = data->reg_temp_high[nr];
 		break;
 	case 3:
 		regval = it87_read_value(data, IT87_REG_BEEP_ENABLE);
@@ -1211,7 +1220,7 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *attr,
 			it87_write_value(data, IT87_REG_BEEP_ENABLE, regval);
 		}
 		data->valid = false;
-		reg = IT87_REG_TEMP_OFFSET[nr];
+		reg = data->reg_temp_offset[nr];
 		break;
 	}
 
@@ -1243,8 +1252,26 @@ static SENSOR_DEVICE_ATTR_2(temp3_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
 static SENSOR_DEVICE_ATTR_2(temp3_offset, S_IRUGO | S_IWUSR, show_temp,
 			    set_temp, 2, 3);
 static SENSOR_DEVICE_ATTR_2(temp4_input, S_IRUGO, show_temp, NULL, 3, 0);
+static SENSOR_DEVICE_ATTR_2(temp4_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    3, 1);
+static SENSOR_DEVICE_ATTR_2(temp4_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    3, 2);
+static SENSOR_DEVICE_ATTR_2(temp4_offset, S_IRUGO | S_IWUSR, show_temp,
+			    set_temp, 3, 3);
 static SENSOR_DEVICE_ATTR_2(temp5_input, S_IRUGO, show_temp, NULL, 4, 0);
+static SENSOR_DEVICE_ATTR_2(temp5_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    4, 1);
+static SENSOR_DEVICE_ATTR_2(temp5_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    4, 2);
+static SENSOR_DEVICE_ATTR_2(temp5_offset, S_IRUGO | S_IWUSR, show_temp,
+			    set_temp, 4, 3);
 static SENSOR_DEVICE_ATTR_2(temp6_input, S_IRUGO, show_temp, NULL, 5, 0);
+static SENSOR_DEVICE_ATTR_2(temp6_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    5, 1);
+static SENSOR_DEVICE_ATTR_2(temp6_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    5, 2);
+static SENSOR_DEVICE_ATTR_2(temp6_offset, S_IRUGO | S_IWUSR, show_temp,
+			    set_temp, 5, 3);
 
 static int get_temp_type(struct it87_data *data, int index)
 {
@@ -2415,24 +2442,46 @@ static umode_t it87_temp_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct it87_data *data = dev_get_drvdata(dev);
-	int i = index / 7;	/* temperature index */
-	int a = index % 7;	/* attribute index */
+	int i, a;
 
-	if (index >= 21) {
+	if (index < 21) {
+		i = index / 7;	/* temperature index */
+		a = index % 7;	/* attribute index */
+	} else if (index < 24) {
 		i = index - 21 + 3;
 		a = 0;
+	} else {
+		int off = index - 24;
+
+		i = 3 + off / 3;
+		switch (off % 3) {
+		case 0:
+			a = 1;
+			break;
+		case 1:
+			a = 2;
+			break;
+		default:
+			a = 5;
+			break;
+		}
 	}
 
 	if (!(data->has_temp & BIT(i)))
 		return 0;
 
+	if ((a == 1 || a == 2 || a == 4) &&
+	    i >= data->num_temp_limit)
+		return 0;
+
 	if (a == 3) {
 		if (get_temp_type(data, i) == 0)
 			return 0;
 		return attr->mode;
 	}
 
-	if (a == 5 && !has_temp_offset(data))
+	if (a == 5 &&
+	    (!has_temp_offset(data) || i >= data->num_temp_offset))
 		return 0;
 
 	if (a == 6 && !data->has_beep)
@@ -2467,8 +2516,17 @@ static struct attribute *it87_attributes_temp[] = {
 	&sensor_dev_attr_temp3_beep.dev_attr.attr,
 
 	&sensor_dev_attr_temp4_input.dev_attr.attr,	/* 21 */
+	&sensor_dev_attr_temp4_max.dev_attr.attr,
+	&sensor_dev_attr_temp4_min.dev_attr.attr,
+	&sensor_dev_attr_temp4_offset.dev_attr.attr,
 	&sensor_dev_attr_temp5_input.dev_attr.attr,
+	&sensor_dev_attr_temp5_max.dev_attr.attr,
+	&sensor_dev_attr_temp5_min.dev_attr.attr,
+	&sensor_dev_attr_temp5_offset.dev_attr.attr,
 	&sensor_dev_attr_temp6_input.dev_attr.attr,
+	&sensor_dev_attr_temp6_max.dev_attr.attr,
+	&sensor_dev_attr_temp6_min.dev_attr.attr,
+	&sensor_dev_attr_temp6_offset.dev_attr.attr,
 	NULL
 };
 
@@ -3277,9 +3335,9 @@ static void it87_check_limit_regs(struct it87_data *data)
 			it87_write_value(data, IT87_REG_VIN_MIN(i), 0);
 	}
 	for (i = 0; i < data->num_temp_limit; i++) {
-		reg = it87_read_value(data, IT87_REG_TEMP_HIGH(i));
+		reg = it87_read_value(data, data->reg_temp_high[i]);
 		if (reg == 0xff)
-			it87_write_value(data, IT87_REG_TEMP_HIGH(i), 127);
+			it87_write_value(data, data->reg_temp_high[i], 127);
 	}
 }
 
@@ -3514,6 +3572,9 @@ static int it87_probe(struct platform_device *pdev)
 		data->num_temp_offset = 0;
 	data->num_temp_map = chip->num_temp_map ?
 			     chip->num_temp_map : IT87_TEMP_MAP_DEFAULT;
+	data->reg_temp_low = IT87_REG_TEMP_LOW;
+	data->reg_temp_high = IT87_REG_TEMP_HIGH;
+	data->reg_temp_offset = IT87_REG_TEMP_OFFSET;
 	if (has_new_tempmap(data)) {
 		data->pwm_temp_map_mask = 0x07;
 		data->pwm_temp_map_shift = 3;
-- 
2.50.1 (Apple Git-155)

