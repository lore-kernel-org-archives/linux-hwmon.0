Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553DFC4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 02:25:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 270E061183
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 02:25:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349691AbhIUC1L (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Sep 2021 22:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238452AbhIUB51 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Sep 2021 21:57:27 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C765C09395F
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 17:47:19 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id e8-20020a0cf348000000b0037a350958f2so207424889qvm.7
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 17:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=cxHqMv/xmH2A4IGCtQVmbzxv9A9Lg5o0aBc9WPPWrvU=;
        b=Tpxn5y2GMCg6OKD5WI+opZ8WdUOe50WnXxyeD1x7kmaWudH3H6qIBar58ZOT0V5UOJ
         +RkHPldF5C91jHxvFEkcOn/VfiPxVjEGdi9wUbjUYAprDJEKLXiIJQRE9hgr0gaxr+Qr
         DOJnX/BpineH9bTh97BvSQbO+gSrhegJyCCDKRDtGg1cFDVMEs+Xs8sFbHfeU7Wj6i5o
         NlDLxJWpVKuNX0/5SpCjKJYWmDGQMHMki6SMwNz2/IVRp0mXc4yn4TQ5CnSWBMp1RWIQ
         0padWYY3z3jJQmrNvgjDk/VDgBGEH4A94QEZN4f+El2pJdoXQkkwqU0P4Bbws+pSCBW7
         iIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cxHqMv/xmH2A4IGCtQVmbzxv9A9Lg5o0aBc9WPPWrvU=;
        b=bv0xlf/BdQxTPDZKgH/M+ZLuHkzm/FoghrVZ/2VN7PzcRQdcgEZL3+YFu3J3oJ9ZEE
         +1hhO59ZxnQMuv11DKADgzVR71lqgSLlbG7kUaoqjUH0oYm+5MpkI/snJyNGEDqbv/Si
         js80Leh1mVkV9J093iFudWejswUhjYB6ucECtJOlP4Pajxxri01X3GKWBkxuP+SWDZOG
         Absk5/xv2Jb4wFDvCQ6KIXoKwIG+7cbnmRejfAob65MUrj8+kO68P8HFwnP7Kveu+UfU
         XhB8YJ+HJ39HETmCxd0qaRpZrtb0V7EZsW6/IkS5lZ8XRxZ+5nEW75LRmgixXPPTeZJj
         oHmA==
X-Gm-Message-State: AOAM531wqcVKWrXlwaeSH+4io2dz0qOSnzpSTMfycj3yQInUl6H87Izl
        HTZM04ooadU7Wrx4vvmpb8i5Lno=
X-Google-Smtp-Source: ABdhPJwjqvGz6Y9hHdUlqAs36jTgcQLSWWQwN+zOjHhudpZlYXT6w96aacKPwRhCSm3dez/hWTZlhqc=
X-Received: from osk.cam.corp.google.com ([2620:0:1004:1a:fbed:324c:ca6c:1142])
 (user=osk job=sendgmr) by 2002:a05:6214:490:: with SMTP id
 ay16mr28416084qvb.25.1632185238549; Mon, 20 Sep 2021 17:47:18 -0700 (PDT)
Date:   Mon, 20 Sep 2021 20:46:27 -0400
In-Reply-To: <20210921004627.2786132-1-osk@google.com>
Message-Id: <20210921004627.2786132-2-osk@google.com>
Mime-Version: 1.0
References: <20210921004627.2786132-1-osk@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v2 2/2] hwmon: (nct7802) Make temperature sensors configurable.
From:   Oskar Senft <osk@google.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Oskar Senft <osk@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This change allows the temperature sensors (both LTD and RTD) to be
configurable via device tree bindings. When the new settings are not
present, the driver defaults to the previous behavior where the RTDs
are left alone and LTD is explicitly enabled.

Signed-off-by: Oskar Senft <osk@google.com>
---
 drivers/hwmon/nct7802.c | 141 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 127 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
index 604af2f6103a..ac2299b110a1 100644
--- a/drivers/hwmon/nct7802.c
+++ b/drivers/hwmon/nct7802.c
@@ -51,6 +51,20 @@ static const u8 REG_VOLTAGE_LIMIT_MSB_SHIFT[2][5] = {
 #define REG_CHIP_ID		0xfe
 #define REG_VERSION_ID		0xff
 
+/*
+ * Resistance temperature detector (RTD) modes according to 7.2.32 Mode
+ * Selection Register
+ */
+
+#define MODE_RTD_MASK		0x3
+#define MODE_LTD_EN		0x40
+
+/*
+ * Bit offset for sensors modes in REG_MODE.
+ * Valid for index 0..2, indicating RTD1..3.
+ */
+#define MODE_BIT_OFFSET_RTD(index) ((index) * 2)
+
 /*
  * Data structures and manipulation thereof
  */
@@ -74,7 +88,9 @@ static ssize_t temp_type_show(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	return sprintf(buf, "%u\n", (mode >> (2 * sattr->index) & 3) + 2);
+	return sprintf(buf, "%u\n",
+			((mode >> MODE_BIT_OFFSET_RTD(sattr->index)) &
+				MODE_RTD_MASK) + 2);
 }
 
 static ssize_t temp_type_store(struct device *dev,
@@ -94,7 +110,8 @@ static ssize_t temp_type_store(struct device *dev,
 	if (type < 3 || type > 4)
 		return -EINVAL;
 	err = regmap_update_bits(data->regmap, REG_MODE,
-			3 << 2 * sattr->index, (type - 2) << 2 * sattr->index);
+			MODE_RTD_MASK << MODE_BIT_OFFSET_RTD(sattr->index),
+			(type - 2) << MODE_BIT_OFFSET_RTD(sattr->index));
 	return err ? : count;
 }
 
@@ -688,18 +705,18 @@ static umode_t nct7802_temp_is_visible(struct kobject *kobj,
 	if (err < 0)
 		return 0;
 
-	if (index < 10 &&
-	    (reg & 03) != 0x01 && (reg & 0x03) != 0x02)		/* RD1 */
+	if (index >= 0 && index < 20 &&				/* RD1, RD 2*/
+	    ((reg >> MODE_BIT_OFFSET_RTD(index / 10)) & MODE_RTD_MASK) != 0x01 &&
+	    ((reg >> MODE_BIT_OFFSET_RTD(index / 10)) & MODE_RTD_MASK) != 0x02)
 		return 0;
 
-	if (index >= 10 && index < 20 &&
-	    (reg & 0x0c) != 0x04 && (reg & 0x0c) != 0x08)	/* RD2 */
-		return 0;
-	if (index >= 20 && index < 30 && (reg & 0x30) != 0x20)	/* RD3 */
+	if (index >= 20 && index < 30 &&			/* RD3 */
+	    (reg >> MODE_BIT_OFFSET_RTD(index / 10) & MODE_RTD_MASK != 0x02))
 		return 0;
 
-	if (index >= 30 && index < 38)				/* local */
-		return attr->mode;
+	if (index >= 30 && index < 38 &&			/* local */
+	    (reg & MODE_LTD_EN) != MODE_LTD_EN)
+		return 0;
 
 	err = regmap_read(data->regmap, REG_PECI_ENABLE, &reg);
 	if (err < 0)
@@ -1038,8 +1055,97 @@ static const struct regmap_config nct7802_regmap_config = {
 	.volatile_reg = nct7802_regmap_is_volatile,
 };
 
-static int nct7802_init_chip(struct nct7802_data *data)
+static bool nct7802_configure_temperature_sensors_from_device_tree(
+	struct device *dev, unsigned char *mode_mask, unsigned char *mode_val)
 {
+	struct device_node *sensors, *sensor;
+	int err;
+	u8 idx;
+	u32 type;
+
+	if (!dev->of_node)
+		return false;
+
+	sensors = of_get_child_by_name(dev->of_node, "temperature-sensors");
+	if (!sensors)
+		return false;
+
+	for_each_child_of_node(sensors, sensor) {
+		if (!strcmp(sensor->name, "ltd")) {
+			if (!of_device_is_available(sensor)) {
+				*mode_val &= ~MODE_LTD_EN;
+				*mode_mask |= MODE_LTD_EN;
+			} else {
+				*mode_val |= MODE_LTD_EN;
+				*mode_mask |= MODE_LTD_EN;
+			}
+			continue;
+		}
+
+		/* Check for rtdX, with X being the sensor number */
+		if (strcmp(sensor->name, "rtd") > 0) {
+			err = kstrtou8(
+				sensor->name + strlen("rdt"), 10, &idx);
+			if (err) {
+				dev_err(dev,
+					"Unparseable sensor number in '%s'\n",
+					sensor->name);
+				continue;
+			}
+
+			if (idx < 1 || idx > 3) {
+				dev_err(dev,
+					"Invalid sensor number in '%s'\n",
+					sensor->name);
+				continue;
+			}
+
+			if (!of_device_is_available(sensor)) {
+				*mode_val &= ~(MODE_RTD_MASK
+					<< MODE_BIT_OFFSET_RTD(idx-1));
+				*mode_mask |= MODE_RTD_MASK
+					<< MODE_BIT_OFFSET_RTD(idx-1);
+				continue;
+			}
+
+			if (idx == 3) {
+				/* RTD3 only supports thermistor mode */
+				type = 4;
+			} else if (of_property_count_u32_elems(sensor, "type")
+				> 0) {
+				if (of_property_read_u32_index(
+					sensor, "type", 0, &type)) {
+					dev_err(dev,
+						"Could not read type property for '%s'\n",
+						sensor->name);
+					continue;
+				}
+
+				/* Only current and thermistor modes are valid
+				 * for temperature sensors.
+				 */
+				if (type < 3 || type > 4) {
+					dev_err(dev,
+						"Type %u not supported for '%s'\n",
+						type, sensor->name);
+					continue;
+				}
+			}
+
+			/* Everything ok, so write sensor configuration */
+			*mode_val |= ((type - 2) & MODE_RTD_MASK)
+				<< MODE_BIT_OFFSET_RTD(idx-1);
+			*mode_mask |= MODE_RTD_MASK
+				<< MODE_BIT_OFFSET_RTD(idx-1);
+		}
+	}
+
+	return true;
+}
+
+static int nct7802_init_chip(struct device *dev, struct nct7802_data *data)
+{
+	unsigned char mode_val = 0, mode_mask = 0;
 	int err;
 
 	/* Enable ADC */
@@ -1047,8 +1153,15 @@ static int nct7802_init_chip(struct nct7802_data *data)
 	if (err)
 		return err;
 
-	/* Enable local temperature sensor */
-	err = regmap_update_bits(data->regmap, REG_MODE, 0x40, 0x40);
+	if (!nct7802_configure_temperature_sensors_from_device_tree(dev,
+			&mode_mask, &mode_val)) {
+		/* Enable local temperature sensor by default */
+		mode_val |= MODE_LTD_EN;
+		mode_mask |= MODE_LTD_EN;
+	}
+
+	err = regmap_update_bits(data->regmap, REG_MODE, mode_mask,
+		mode_val);
 	if (err)
 		return err;
 
@@ -1074,7 +1187,7 @@ static int nct7802_probe(struct i2c_client *client)
 	mutex_init(&data->access_lock);
 	mutex_init(&data->in_alarm_lock);
 
-	ret = nct7802_init_chip(data);
+	ret = nct7802_init_chip(dev, data);
 	if (ret < 0)
 		return ret;
 
-- 
2.33.0.464.g1972c5931b-goog

