Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837BDEB64DD
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Jun 2023 11:19:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbjFYLT5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Jun 2023 07:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbjFYLT4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Jun 2023 07:19:56 -0400
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 478CE189
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Jun 2023 04:19:50 -0700 (PDT)
IronPort-SDR: 649822d2_QFDbQY2vKEhzBFv3fIitL60L7d14CNsSSZv/Js4A/Nhk1Up
 Xf2b5DDdFertrqOTcrb05DhPxFJd9+75rTqGhVg==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2CkAwAAIphkjPQc8jxagRKGSrYVDwEPAQFEBAEBhQaGC?=
 =?us-ascii?q?CY4EwECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBBgQUAQEBAUBFhWgNhgcrC?=
 =?us-ascii?q?wENAQE3ASiBFQESgn6CXa9tM4EBgggBAQaCZa4wgV8JgUKMHYEZgzuBPD+BT?=
 =?us-ascii?q?oEVgTyBPm+LBo4thWIFAjKBS4oggShvgR45Z3oCCQIRZ4EICGCBcUACDVQLC?=
 =?us-ascii?q?2OBHIJSAgIROg8FU18ZGwMHA4EFEC8HBDIoBgkYLyUGUQcXFiQJExVBBINYC?=
 =?us-ascii?q?oEMPxUOEYJYIgIHNj8bUYJsCRdHAwkDBwVJQAMLGA1LESw1FB8sIIEHF2OBd?=
 =?us-ascii?q?gokJKQUB1o0gSfGE4QSgV2fI02BSqgOmB8go0KELwIKBxaBeoF+TR8ZgyJPA?=
 =?us-ascii?q?xkPjjkegXeRUWM7AgcLAQEDCYtIAQE?=
IronPort-Data: A9a23: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
 LnyIJEr0sSZmfmFndou28E=
IronPort-HdrOrdr: A9a23:eDEiAaiQ3oqGHt/UL6yotLUJinBQXuQji2hC6mlwRA09TyVXra
 GTdZMgpHjJYFR4YhsdcLW7VZVoLkmslqKdjbN/AV7AZniDhILLFvAB0WKK+VSJcEHDH4VmtZ
 uIHZIRNDV+YGIK6/oSmDPIdurIH+P3iZxBVI/lvg9QcT0=
X-Talos-CUID: 9a23:AKwcRW3ge+eaNpB0EVofBrxfEP4kMWL/zVfqeka2JVR0GJ6OE3Sc0fYx
X-Talos-MUID: 9a23:qJ0UAwqTYVTJtVjXv0Mezw19ZcZZ2f2HNGc2kZopksuVNnJIFQ7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 25 Jun 2023 20:49:46 +0930
Received: from bits.crawford.emu.id.au ([127.0.0.1])
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPS id 35PBJf5o3779768
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 25 Jun 2023 21:19:41 +1000
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 35PBJf5o3779768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1687691981; bh=DzW8PTI4FcUJt+rd137n2CQvBROGcxKN9ZyHwecseHY=;
        h=From:To:Cc:Subject:Date:From;
        b=FDUeJqMPsyGsOUP8ji5HFUTzAdPoJNqwP/o7GIanyctC+JtNLSNe9oO/3a9KjUFE5
         zp+iJclR4l3u+fkW+EVp3aLwT15nK+92bOnteg7DiRoCR0P4nQpUXMdGQuy9dooskl
         W8IkWNJSlouVwaNXxsF3aKqvUPMe2vuab9JKrxH1XMOohSf0LoSXXEBgzYRAUOxHpM
         WnV+cz7ZJ44SwOiYOeJwlmO04xRoOT91ymcNB6PRD4gESceOox0djn5PL9WZi3V9R2
         JumnZ8jtb03RP57/0EP8YSGinF/Vl7GQ3IVYFpvW73+KCVLQWxEgJFPMKumzHmCRZf
         0ePY4YgTWts/w==
Received: (from frank@localhost)
        by bits.crawford.emu.id.au (8.17.1/8.17.1/Submit) id 35PBJbTX3779767;
        Sun, 25 Jun 2023 21:19:37 +1000
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1] hwmon: (it87) Separate temperature type to separate funtion and detect AMDTSI
Date:   Sun, 25 Jun 2023 21:18:38 +1000
Message-ID: <20230625111838.3779678-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [0.0.0.0]); Sun, 25 Jun 2023 21:19:41 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.1 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The temperature sensor type needs to be used in multiple places, so
split it out into its own function.  It is used both in show_temp_type
attribute and testing if the attribute should be visible (i.e. is
defined).

The sensor type also reports the type AMDTSI on certain chipsets.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 78 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 65 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 5deff5e5f693..ba75f33301ce 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -221,6 +221,10 @@ static bool fix_pwm_polarity;
  * Super-I/O configuration space.
  */
 #define IT87_REG_VID           0x0a
+
+/* Interface Selection register on other chips */
+#define IT87_REG_IFSEL         0x0a
+
 /*
  * The IT8705F and IT8712F earlier than revision 0x08 use register 0x0b
  * for fan divisors. Later IT8712F revisions must use 16-bit tachometer
@@ -1159,28 +1163,68 @@ static SENSOR_DEVICE_ATTR_2(temp4_input, S_IRUGO, show_temp, NULL, 3, 0);
 static SENSOR_DEVICE_ATTR_2(temp5_input, S_IRUGO, show_temp, NULL, 4, 0);
 static SENSOR_DEVICE_ATTR_2(temp6_input, S_IRUGO, show_temp, NULL, 5, 0);
 
+static int get_temp_type(struct it87_data *data, int index)
+{
+	/*
+	 * 2 is deprecated;
+	 * 3 = thermal diode;
+	 * 4 = thermistor;
+	 * 5 = AMDTSI;
+	 * 6 = Intel PECI;
+	 * 0 = disabled
+	 */
+	u8 reg, extra;
+	int ttype, type = 0;
+
+	/* Detect PECI vs. AMDTSI */
+	ttype = 6;
+	if ((has_temp_peci(data, index)) || data->type == it8721 ||
+	    data->type == it8720) {
+		extra = it87_read_value(data, IT87_REG_IFSEL);
+		if ((extra & 0x70) == 0x40)
+			ttype = 5;
+	}
+
+	reg = it87_read_value(data, IT87_REG_TEMP_ENABLE);
+
+	/* Per chip special detection */
+	switch (data->type) {
+	case it8622:
+		if (!(reg & 0xc0) && index == 3)
+			type = ttype;
+		break;
+	default:
+		break;
+	}
+
+	if (type || index >= 3)
+		return type;
+
+	extra = it87_read_value(data, IT87_REG_TEMP_EXTRA);
+
+	if ((has_temp_peci(data, index) && (reg >> 6 == index + 1)) ||
+	    (has_temp_old_peci(data, index) && (extra & 0x80)))
+		type = ttype;	/* Intel PECI or AMDTSI */
+	else if (reg & BIT(index))
+		type = 3;	/* thermal diode */
+	else if (reg & BIT(index + 3))
+		type = 4;	/* thermistor */
+
+	return type;
+}
+
 static ssize_t show_temp_type(struct device *dev, struct device_attribute *attr,
 			      char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
-	int nr = sensor_attr->index;
 	struct it87_data *data = it87_update_device(dev);
-	u8 reg, extra;
+	int type;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	reg = data->sensor;	/* In case value is updated while used */
-	extra = data->extra;
-
-	if ((has_temp_peci(data, nr) && (reg >> 6 == nr + 1)) ||
-	    (has_temp_old_peci(data, nr) && (extra & 0x80)))
-		return sprintf(buf, "6\n");  /* Intel PECI */
-	if (reg & (1 << nr))
-		return sprintf(buf, "3\n");  /* thermal diode */
-	if (reg & (8 << nr))
-		return sprintf(buf, "4\n");  /* thermistor */
-	return sprintf(buf, "0\n");      /* disabled */
+	type = get_temp_type(data, sensor_attr->index);
+	return sprintf(buf, "%d\n", type);
 }
 
 static ssize_t set_temp_type(struct device *dev, struct device_attribute *attr,
@@ -2313,6 +2357,14 @@ static umode_t it87_temp_is_visible(struct kobject *kobj,
 	if (!(data->has_temp & BIT(i)))
 		return 0;
 
+	if (a == 3) {
+		int type = get_temp_type(data, i);
+
+		if (type == 0)
+			return 0;
+		return attr->mode;
+	}
+
 	if (a == 5 && !has_temp_offset(data))
 		return 0;
 
-- 
2.41.0

