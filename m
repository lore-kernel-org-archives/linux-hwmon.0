Return-Path: <SRS0=mQrJ=RR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309FCC43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Mar 2019 18:38:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7AA82077B
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Mar 2019 18:38:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXnYMwM2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfCNSiX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Mar 2019 14:38:23 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36325 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfCNSiX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Mar 2019 14:38:23 -0400
Received: by mail-pg1-f196.google.com with SMTP id r124so4587919pgr.3
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Mar 2019 11:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TbEWpo/3ryxSxkaqX8Sw49oVqpkjsBlO/9ID/CljCNU=;
        b=WXnYMwM2Sqo4FDLOcQl6FZrIkB0lCKN4woxrEze9DMlhJNVnto2+teQC8WjZ4wRvsH
         XEdpdaq3YlZUxnOBZ8lb7x/d9f/gLu1Gmi5kT0//vIQJCd0r38Wbf6nE4/9kV4klmJHI
         I21thWHqLNWGmQZJVER//Ncl7ZUCzdhQ9ou7eJHQ/gaHJ1U5juiyQpguYUvggY+BmH51
         2EGhexXFJdjj+yWF+ITbwmRjLk/nvYfFMY+zENZgbAuK8Chy9wvGW3lal4L6hZW20mLS
         GKLlF8xQWARyUct3TljCtqIDzfMZtyJ0oBe+Objd5n7cpU129J+8C905jnw0Sjqud5Vz
         VCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=TbEWpo/3ryxSxkaqX8Sw49oVqpkjsBlO/9ID/CljCNU=;
        b=e5+lSXqd44x825JM5zn20Ab/lIfSILmYc7jn7VCVMOT4Zw8GLb7+gKVDxhlqf9SMEO
         f1U8FEThypyNjFBBX37ZuoI6PUg3BqlcGQmWS6SLumFH69kqE2tpm1bsU89oA548GziS
         PKhCe7gkfBGBW4pMmZqDUqVvxg8LtFVYRRMvrr5Hj60owrAjvwxHkTl4PUIcIMZ81Dj8
         DkXRp9ez2MXkt5bB4YftSKcF4nPUpXTfOJVY4trv09y7STrAxjQS96v/HVW2/Q7X9eUf
         sbb7WrSEYcPK08jJHfpqPLI6/DFDPUNiMB1nzJY7VsNKWhea48ICcJbRRLeocvx/LWOj
         /zUQ==
X-Gm-Message-State: APjAAAV1KYrldextnBfOIhlt5kUk+6xeCnr7Luxj/I9qUBOG6MUAGOfQ
        WWm4khs4ncAJwXaxygi07E+RG/4k
X-Google-Smtp-Source: APXvYqxDzX7/Z2EFe4Fzv8bI0hYyqyRSqbI2a8ahonHr5a4U0LWKOFEpFbLAwh/4RBBMs1zmiG7wFA==
X-Received: by 2002:a62:7993:: with SMTP id u141mr4429633pfc.252.1552588701769;
        Thu, 14 Mar 2019 11:38:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e131sm34168300pfc.62.2019.03.14.11.38.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Mar 2019 11:38:20 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?q?Christian=20Gr=C3=B6nke?= <C.Groenke@infodas.de>
Subject: [PATCH] hwmon: (pmbus) Add IEEE 754 half precision support to PMBus core
Date:   Thu, 14 Mar 2019 11:38:19 -0700
Message-Id: <1552588699-1199-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PMBus v1.3.1 adds IEEE 754 half precision as additional data format.
Add support for it.

Cc: Christian Grönke <C.Groenke@infodas.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus.h      |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 142 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 139 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 1d24397d36ec..6477eb433790 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -374,7 +374,7 @@ enum pmbus_sensor_classes {
 
 #define PMBUS_PAGE_VIRTUAL	BIT(31)
 
-enum pmbus_data_format { linear = 0, direct, vid };
+enum pmbus_data_format { linear = 0, ieee754, direct, vid };
 enum vrm_version { vr11 = 0, vr12, vr13 };
 
 struct pmbus_driver_info {
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 2e2b5851139c..e1be5ebed57f 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -619,6 +619,66 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
 }
 
 /*
+ * Convert ieee754 sensor values to milli- or micro-units
+ * depending on sensor type.
+ *
+ * ieee754 data format:
+ *	bit 15:		sign
+ *	bit 10..14:	exponent
+ *	bit 0..9:	mantissa
+ * exponent=0:
+ *	v=(−1)^signbit * 2^(−14) * 0.significantbits
+ * exponent=1..30:
+ *	v=(−1)^signbit * 2^(exponent - 15) * 1.significantbits
+ * exponent=31:
+ *	v=NaN
+ *
+ * Add the number mantissa bits into the calculations for simplicity.
+ * To do that, add '10' to the exponent. By doing that, we can just add
+ * 0x400 to normal values and get the expected result.
+ */
+static long pmbus_reg2data_ieee754(struct pmbus_data *data,
+				   struct pmbus_sensor *sensor)
+{
+	int exponent;
+	bool sign;
+	long val;
+
+	/* only support half precision for now */
+	sign = sensor->data & 0x8000;
+	exponent = (sensor->data >> 10) & 0x1f;
+	val = sensor->data & 0x3ff;
+
+	if (exponent == 0) {			/* subnormal */
+		exponent = -(14 + 10);
+	} else if (exponent ==  0x1f) {		/* NaN, convert to min/max */
+		exponent = 0;
+		val = 65504;
+	} else {
+		exponent -= (15 + 10);		/* normal */
+		val |= 0x400;
+	}
+
+	/* scale result to milli-units for all sensors except fans */
+	if (sensor->class != PSC_FAN)
+		val = val * 1000L;
+
+	/* scale result to micro-units for power sensors */
+	if (sensor->class == PSC_POWER)
+		val = val * 1000L;
+
+	if (exponent >= 0)
+		val <<= exponent;
+	else
+		val >>= -exponent;
+
+	if (sign)
+		val = -val;
+
+	return val;
+}
+
+/*
  * Convert linear sensor values to milli- or micro-units
  * depending on sensor type.
  */
@@ -740,6 +800,9 @@ static long pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
 	case vid:
 		val = pmbus_reg2data_vid(data, sensor);
 		break;
+	case ieee754:
+		val = pmbus_reg2data_ieee754(data, sensor);
+		break;
 	case linear:
 	default:
 		val = pmbus_reg2data_linear(data, sensor);
@@ -748,8 +811,72 @@ static long pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
 	return val;
 }
 
-#define MAX_MANTISSA	(1023 * 1000)
-#define MIN_MANTISSA	(511 * 1000)
+#define MAX_IEEE_MANTISSA	(0x7ff * 1000)
+#define MIN_IEEE_MANTISSA	(0x400 * 1000)
+
+static u16 pmbus_data2reg_ieee754(struct pmbus_data *data,
+				  struct pmbus_sensor *sensor, long val)
+{
+	u16 exponent = (15 + 10);
+	long mantissa;
+	u16 sign = 0;
+
+	/* simple case */
+	if (val == 0)
+		return 0;
+
+	if (val < 0) {
+		sign = 0x8000;
+		val = -val;
+	}
+
+	/* Power is in uW. Convert to mW before converting. */
+	if (sensor->class == PSC_POWER)
+		val = DIV_ROUND_CLOSEST(val, 1000L);
+
+	/*
+	 * For simplicity, convert fan data to milli-units
+	 * before calculating the exponent.
+	 */
+	if (sensor->class == PSC_FAN)
+		val = val * 1000;
+
+	/* Reduce large mantissa until it fits into 10 bit */
+	while (val > MAX_IEEE_MANTISSA && exponent < 30) {
+		exponent++;
+		val >>= 1;
+	}
+	/*
+	 * Increase small mantissa to generate valid 'normal'
+	 * number
+	 */
+	while (val < MIN_IEEE_MANTISSA && exponent > 1) {
+		exponent--;
+		val <<= 1;
+	}
+
+	/* Convert mantissa from milli-units to units */
+	mantissa = DIV_ROUND_CLOSEST(val, 1000);
+
+	/*
+	 * Ensure that the resulting number is within range.
+	 * Valid range is 0x400..0x7ff, where bit 10 reflects
+	 * the implied high bit in normalized ieee754 numbers.
+	 * Set the range to 0x400..0x7ff to reflect this.
+	 * The upper bit is then removed by the mask against
+	 * 0x3ff in the final assignment.
+	 */
+	if (mantissa > 0x7ff)
+		mantissa = 0x7ff;
+	else if (mantissa < 0x400)
+		mantissa = 0x400;
+
+	/* Convert to sign, 5 bit exponent, 10 bit mantissa */
+	return sign | (mantissa & 0x3ff) | ((exponent << 10) & 0x7c00);
+}
+
+#define MAX_LIN_MANTISSA	(1023 * 1000)
+#define MIN_LIN_MANTISSA	(511 * 1000)
 
 static u16 pmbus_data2reg_linear(struct pmbus_data *data,
 				 struct pmbus_sensor *sensor, long val)
@@ -795,12 +922,12 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
 		val = val * 1000;
 
 	/* Reduce large mantissa until it fits into 10 bit */
-	while (val >= MAX_MANTISSA && exponent < 15) {
+	while (val >= MAX_LIN_MANTISSA && exponent < 15) {
 		exponent++;
 		val >>= 1;
 	}
 	/* Increase small mantissa to improve precision */
-	while (val < MIN_MANTISSA && exponent > -15) {
+	while (val < MIN_LIN_MANTISSA && exponent > -15) {
 		exponent--;
 		val <<= 1;
 	}
@@ -878,6 +1005,9 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
 	case vid:
 		regval = pmbus_data2reg_vid(data, sensor, val);
 		break;
+	case ieee754:
+		regval = pmbus_data2reg_ieee754(data, sensor, val);
+		break;
 	case linear:
 	default:
 		regval = pmbus_data2reg_linear(data, sensor, val);
@@ -1967,6 +2097,10 @@ static int pmbus_identify_common(struct i2c_client *client,
 			if (data->info->format[PSC_VOLTAGE_OUT] != direct)
 				return -ENODEV;
 			break;
+		case 3:	/* ieee 754 half precision */
+			if (data->info->format[PSC_VOLTAGE_OUT] != ieee754)
+				return -ENODEV;
+			break;
 		default:
 			return -ENODEV;
 		}
-- 
2.7.4

