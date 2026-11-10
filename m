Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336112;
	b=iOJH9XbWcCf5SBLdcODKQ45btJUw+XalamxJ6GvJmr5Ut6O1kjLh9szD68U8fpvhKg12
	 /lPiVp4sMdZp9bMw8Mxpcs1Vk4Uc14ZMinqzhLB8AQKqH+VE2B9Sgf4qvE1gg4orHwIip
	 E5lb52rBua6KKMMRib5c4zfk0iZYGN0wdeRgmCboLzI7KzVE9DiNhSjW1KSnUMcZPssQi
	 GTHQa7RFa6LZY5A1Vraco1lJjRHx0BDH4YnxjwrHGMbyt9I24XjylMWl/DH2CMvYM6b/s
	 U+0A+Si3MXX1NOu3C8N4Aj3vPPL9SdlgA5eUrCt45QasudGCanpstnu9jB1iFCTAYBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336112;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=tvYBZcsHCPKJUtSpgggvuKHeeI+9lsmPB5BLHqiOR8M=;
	b=l+MfwI+023yZtI2JXzFlM/KmGFnB5ej4PMbtUeyulrdnZG+MTGZDoKZXb4x9wA5CnCFz
	 yNHnwekFV3z70WFoUUHSajI0G4VdIZgIePpraO4q4ppr4FKqJUZLv7FmRlv7wyj/D2cIT
	 M2PG1u3xUJKkThjZq4131bKxD85g6qVlkPkSj3vYekBtVxQhDAQu5NoY1onJD/VfVOg4k
	 nQQ0AHQ1iPbt2ENvaD5neMTlro93jg3cn+OBeLwAN/if/1/7RS1NPMM408TeZ3WyIRSEy
	 YdRXBbbiC9bnXZN6QiQrjcPy26qcEwCbZQze7m646pGVxo9Z2uJHTcONvgCc+gU9ctw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=BInuGOdj;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B464606A32D
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 18:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B464606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=BInuGOdj
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id QmFSxG3vsyb4YQqn2x12U1; Tue, 10 Nov 2026 18:41:52 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Qqg8xgfHC8cn4Qqg9xd4qS; Tue, 10 Nov 2026 18:34:45 +0000
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6af363c5
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=AgWW5FNtAAAA:8 a=_jlGtV7tAAAA:8
 a=VwQbUJbxAAAA:8 a=GYR7VeAFDjvgWpLPay8A:9 a=8DkScU8FlKhdH4yH5W0q:22
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=tvYBZcsHCPKJUtSpgggvuKHeeI+9lsmPB5BLHqiOR8M=; b=BInuGOdjuate
	wjZtIHVvhjI2joigS8vUBMcIuvYCS89pgdVNzdzVVaWCXz44gvvCb+suGbNIlrz62ktJZq65oj19V
	Fg/3Pl7Kov+VRgpDG2K1BW+0behEatWgV+3hSAKsGiSiIguNkszys3HfDlPZqt8qOHutnDTeiebG+
	r6vdxY4fnT2S1RtKzSYCsRdtF7Bw8kkGE34TyRQIefOL8sp14Ks0t6Qv1H89X7m7eD/1508LR/dtR
	3llFaK56XQn0QehG3gjmoKNcgDcTcxsn6b+In12FhY5cHOCcFrlh+ftS1hg2UudFPvj6XKZx4rCxh
	0WWx8Mxnk9i/XTuuFeSHkA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:56188 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQqg8-00000003Pcp-1xMb;
	Wed, 11 Nov 2026 00:04:44 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH 04/10] hwmon: (gsc-hwmon) Drop platform data support
Date: Tue, 10 Nov 2026 10:34:27 -0800
Message-ID: <20261110183434.181711-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110183434.181711-1-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQqg8-00000003Pcp-1xMb
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:56188
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 14
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfICigdHl/CsDxTWKmO5ZfjYd82x5RdhyloUeKIqhh289DonNJ9cTJzSX66SkLFltOo2jft9Rfzv/5isTV8zVA7tmOqfHZl1KNU4iNNAz0G56NYitiSAA
 rleZ0sQAPetSq42+7YPJon8e/+4pcZpSoF2G7YTljcaU4x5NmiPHEoy6H2tst3gmAEC2n8lp3fKNwDLi41Tfo7LKgeQFZAfgLYFZ4sZKmw1Q75C07o9tcj1q

There are no in-tree users providing gsc_hwmon_platform_data. Channel
descriptions and the fan controller base address are already obtained
from devicetree / fwnode properties.

Move enum gsc_hwmon_mode and struct gsc_hwmon_channel into the driver,
fold the channel array and fan_base into struct gsc_hwmon_data, drop
platform data support, and remove the unused platform_data header file.

Cc: Tim Harvey <tharvey@gateworks.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 MAINTAINERS                             |  1 -
 drivers/hwmon/gsc-hwmon.c               | 72 +++++++++++++++----------
 include/linux/platform_data/gsc_hwmon.h | 45 ----------------
 3 files changed, 45 insertions(+), 73 deletions(-)
 delete mode 100644 include/linux/platform_data/gsc_hwmon.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 476bcd5d0e1c..15d70b72d9a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11169,7 +11169,6 @@ F:	Documentation/hwmon/gsc-hwmon.rst
 F:	drivers/hwmon/gsc-hwmon.c
 F:	drivers/mfd/gateworks-gsc.c
 F:	include/linux/mfd/gsc.h
-F:	include/linux/platform_data/gsc_hwmon.h
 
 GCC PLUGINS
 M:	Kees Cook <kees@kernel.org>
diff --git a/drivers/hwmon/gsc-hwmon.c b/drivers/hwmon/gsc-hwmon.c
index 83005d8ae47e..9424deb98590 100644
--- a/drivers/hwmon/gsc-hwmon.c
+++ b/drivers/hwmon/gsc-hwmon.c
@@ -10,11 +10,10 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
-#include <linux/platform_data/gsc_hwmon.h>
-
 #define GSC_HWMON_MAX_TEMP_CH	16
 #define GSC_HWMON_MAX_IN_CH	16
 #define GSC_HWMON_MAX_FAN_CH	16
@@ -22,10 +21,35 @@
 #define GSC_HWMON_RESOLUTION	12
 #define GSC_HWMON_VREF		2500
 
+enum gsc_hwmon_mode {
+	mode_temperature,
+	mode_voltage_24bit,
+	mode_voltage_raw,
+	mode_voltage_16bit,
+	mode_fan,
+	mode_max,
+};
+
+/**
+ * struct gsc_hwmon_channel - configuration parameters
+ * @reg:  I2C register offset
+ * @mode: channel mode
+ * @name: channel name
+ * @mvoffset: voltage offset
+ * @vdiv: voltage divider array (2 resistor values in milli-ohms)
+ */
+struct gsc_hwmon_channel {
+	unsigned int reg;
+	unsigned int mode;
+	const char *name;
+	unsigned int mvoffset;
+	unsigned int vdiv[2];
+};
+
 struct gsc_hwmon_data {
 	struct gsc_dev *gsc;
-	struct gsc_hwmon_platform_data *pdata;
 	struct regmap *regmap;
+	u32 fan_base;
 	const struct gsc_hwmon_channel *temp_ch[GSC_HWMON_MAX_TEMP_CH];
 	const struct gsc_hwmon_channel *in_ch[GSC_HWMON_MAX_IN_CH];
 	const struct gsc_hwmon_channel *fan_ch[GSC_HWMON_MAX_FAN_CH];
@@ -37,6 +61,8 @@ struct gsc_hwmon_data {
 	struct hwmon_channel_info fan_info;
 	const struct hwmon_channel_info *info[4];
 	struct hwmon_chip_info chip;
+	int nchannels;
+	struct gsc_hwmon_channel channels[] __counted_by(nchannels);
 };
 
 static const struct regmap_bus gsc_hwmon_regmap_bus = {
@@ -55,7 +81,7 @@ static ssize_t pwm_auto_point_temp_show(struct device *dev,
 {
 	struct gsc_hwmon_data *hwmon = dev_get_drvdata(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	u8 reg = hwmon->pdata->fan_base + (2 * attr->index);
+	u8 reg = hwmon->fan_base + (2 * attr->index);
 	u8 regs[2];
 	int ret;
 
@@ -73,7 +99,7 @@ static ssize_t pwm_auto_point_temp_store(struct device *dev,
 {
 	struct gsc_hwmon_data *hwmon = dev_get_drvdata(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	u8 reg = hwmon->pdata->fan_base + (2 * attr->index);
+	u8 reg = hwmon->fan_base + (2 * attr->index);
 	u8 regs[2];
 	long temp;
 	int err;
@@ -236,10 +262,9 @@ static const struct hwmon_ops gsc_hwmon_ops = {
 	.read_string = gsc_hwmon_read_string,
 };
 
-static struct gsc_hwmon_platform_data *
-gsc_hwmon_get_devtree_pdata(struct device *dev)
+static struct gsc_hwmon_data *gsc_hwmon_get_devtree_data(struct device *dev)
 {
-	struct gsc_hwmon_platform_data *pdata;
+	struct gsc_hwmon_data *hwmon;
 	struct gsc_hwmon_channel *ch;
 	struct device_node *fan;
 	int nchannels;
@@ -248,15 +273,15 @@ gsc_hwmon_get_devtree_pdata(struct device *dev)
 	if (nchannels == 0)
 		return ERR_PTR(-ENODEV);
 
-	pdata = devm_kzalloc_flex(dev, *pdata, channels, nchannels);
-	if (!pdata)
+	hwmon = devm_kzalloc_flex(dev, *hwmon, channels, nchannels);
+	if (!hwmon)
 		return ERR_PTR(-ENOMEM);
-	pdata->nchannels = nchannels;
+	hwmon->nchannels = nchannels;
 
 	/* fan controller base address */
 	of_node_get(dev->parent->of_node);
 	fan = of_find_compatible_node(dev->parent->of_node, NULL, "gw,gsc-fan");
-	if (fan && of_property_read_u32(fan, "reg", &pdata->fan_base)) {
+	if (fan && of_property_read_u32(fan, "reg", &hwmon->fan_base)) {
 		of_node_put(fan);
 		dev_err(dev, "fan node without base\n");
 		return ERR_PTR(-EINVAL);
@@ -264,7 +289,7 @@ gsc_hwmon_get_devtree_pdata(struct device *dev)
 
 	of_node_put(fan);
 
-	ch = pdata->channels;
+	ch = hwmon->channels;
 	/* allocate structures for channels and count instances of each type */
 	device_for_each_child_node_scoped(dev, child) {
 		if (fwnode_property_read_string(child, "label", &ch->name)) {
@@ -294,7 +319,7 @@ gsc_hwmon_get_devtree_pdata(struct device *dev)
 		ch++;
 	}
 
-	return pdata;
+	return hwmon;
 }
 
 static int gsc_hwmon_probe(struct platform_device *pdev)
@@ -302,22 +327,15 @@ static int gsc_hwmon_probe(struct platform_device *pdev)
 	struct gsc_dev *gsc = dev_get_drvdata(pdev->dev.parent);
 	struct device *dev = &pdev->dev;
 	struct device *hwmon_dev;
-	struct gsc_hwmon_platform_data *pdata = dev_get_platdata(dev);
 	struct gsc_hwmon_data *hwmon;
 	const struct attribute_group **groups;
 	int i, i_in, i_temp, i_fan;
 
-	if (!pdata) {
-		pdata = gsc_hwmon_get_devtree_pdata(dev);
-		if (IS_ERR(pdata))
-			return PTR_ERR(pdata);
-	}
+	hwmon = gsc_hwmon_get_devtree_data(dev);
+	if (IS_ERR(hwmon))
+		return PTR_ERR(hwmon);
 
-	hwmon = devm_kzalloc_obj(dev, *hwmon);
-	if (!hwmon)
-		return -ENOMEM;
 	hwmon->gsc = gsc;
-	hwmon->pdata = pdata;
 
 	hwmon->regmap = devm_regmap_init(dev, &gsc_hwmon_regmap_bus,
 					 gsc->i2c_hwmon,
@@ -325,8 +343,8 @@ static int gsc_hwmon_probe(struct platform_device *pdev)
 	if (IS_ERR(hwmon->regmap))
 		return PTR_ERR(hwmon->regmap);
 
-	for (i = 0, i_in = 0, i_temp = 0, i_fan = 0; i < hwmon->pdata->nchannels; i++) {
-		const struct gsc_hwmon_channel *ch = &pdata->channels[i];
+	for (i = 0, i_in = 0, i_temp = 0, i_fan = 0; i < hwmon->nchannels; i++) {
+		const struct gsc_hwmon_channel *ch = &hwmon->channels[i];
 
 		switch (ch->mode) {
 		case mode_temperature:
@@ -380,7 +398,7 @@ static int gsc_hwmon_probe(struct platform_device *pdev)
 	hwmon->fan_info.type = hwmon_fan;
 	hwmon->fan_info.config = hwmon->fan_config;
 
-	groups = pdata->fan_base ? gsc_hwmon_groups : NULL;
+	groups = hwmon->fan_base ? gsc_hwmon_groups : NULL;
 	hwmon_dev = devm_hwmon_device_register_with_info(dev,
 							 KBUILD_MODNAME, hwmon,
 							 &hwmon->chip, groups);
diff --git a/include/linux/platform_data/gsc_hwmon.h b/include/linux/platform_data/gsc_hwmon.h
deleted file mode 100644
index 70e8a6bec0f6..000000000000
--- a/include/linux/platform_data/gsc_hwmon.h
+++ /dev/null
@@ -1,45 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _GSC_HWMON_H
-#define _GSC_HWMON_H
-
-enum gsc_hwmon_mode {
-	mode_temperature,
-	mode_voltage_24bit,
-	mode_voltage_raw,
-	mode_voltage_16bit,
-	mode_fan,
-	mode_max,
-};
-
-/**
- * struct gsc_hwmon_channel - configuration parameters
- * @reg:  I2C register offset
- * @mode: channel mode
- * @name: channel name
- * @mvoffset: voltage offset
- * @vdiv: voltage divider array (2 resistor values in milli-ohms)
- */
-struct gsc_hwmon_channel {
-	unsigned int reg;
-	unsigned int mode;
-	const char *name;
-	unsigned int mvoffset;
-	unsigned int vdiv[2];
-};
-
-/**
- * struct gsc_hwmon_platform_data - platform data for gsc_hwmon driver
- * @nchannels:	number of elements in @channels array
- * @vreference: voltage reference (mV)
- * @resolution: ADC bit resolution
- * @fan_base: register base for FAN controller
- * @channels:	array of gsc_hwmon_channel structures describing channels
- */
-struct gsc_hwmon_platform_data {
-	int nchannels;
-	unsigned int resolution;
-	unsigned int vreference;
-	unsigned int fan_base;
-	struct gsc_hwmon_channel channels[] __counted_by(nchannels);
-};
-#endif
-- 
2.45.2

