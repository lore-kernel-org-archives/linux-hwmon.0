Return-Path: <SRS0=HBTv=UM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49B8C31E4A
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Jun 2019 15:22:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 810722054F
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Jun 2019 15:22:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mjh0zhin"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732121AbfFMPWW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 Jun 2019 11:22:22 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40337 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731986AbfFMMmo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Jun 2019 08:42:44 -0400
Received: by mail-pl1-f193.google.com with SMTP id a93so8113701pla.7
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Jun 2019 05:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=qJWUL7OI/yIasiQ/tlnZ4Tg9l3ZhNwzvYa3O3KrUySE=;
        b=Mjh0zhin3ryAPhnxXIOmQDnZreSQlbod3JMLxOVjaDvse46DurnZJpwc8FVnzQC09V
         j4x5TdWO8XDk7ep5AAKR1GpHWm12ATv1/BqDgpyCaLAFFZ6ikpH+bhDs396mnQvHxj0m
         7KjtDEGSZ0L4qMyOgNP5rJbR6Q/ieYw50U/N4hzLoJ8aVf3wDKe+6PYfgIXiWuDenSXE
         yP0VYVmZR0XZvtdNHlCAzoav1jFz2tBedylsXbiE/y8CZjxPVvqLLqw1yF0a2pBiI24k
         UHtWzB1nM67zG8UPKlSVOaXwcBb7PAv99MFTVoTBxmwiUKYCPHzGB7eln17ENXa0VQt3
         MAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=qJWUL7OI/yIasiQ/tlnZ4Tg9l3ZhNwzvYa3O3KrUySE=;
        b=dg3KusXlrWRz/Y8CSMaPc6ohssjxIoSWlH+KIWP2/n0S1jZ+0oLNkv6/V4MzpNwRIw
         0V+n4DS8CQRIsWmLQx9sj0zxFdtJXiKH7pXnZkoOCCQCL9Qv0vm6ntz/JMUhULdDSYJU
         i/Z275axsLvZVBSsbZRVHpb2rilmMKxDLr8umBgXGhLOk4GzS29zhnDa7Mbt00e+DKs8
         X+LM7b7D+P6NmfgK1bZHe+rXnQN/X6yXA4sEs/l+iT75FPcz3GertI/wj9Pc0hkrcbw6
         nET02XXcsPvZmiYEW0asR8sfQGzCuQoK0IQhNcFBfGXe7jXp3eGpwPPViAOu7Oie//cm
         mWbg==
X-Gm-Message-State: APjAAAV0FJEJqi1OsqrA21mgpYgUCYJhvmuaRfVwBRn9v9+11v++h01Z
        9zY/+WSRg2KtOh4eFBA1JiW98cYu
X-Google-Smtp-Source: APXvYqwcR7JksV9q7qXRs90GSGZvapMzLYLLV2kXKu/cAkrx5opoY388dLZPo36CdvtUtrNb20GL6A==
X-Received: by 2002:a17:902:f089:: with SMTP id go9mr18466752plb.81.1560429763541;
        Thu, 13 Jun 2019 05:42:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g8sm2856104pfi.8.2019.06.13.05.42.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 05:42:42 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Alexander Sverdlin <alexander.sverdlin@nokia.com>
Subject: [PATCH v2] hwmon: (pmbus/adm1275) Fix power sampling support
Date:   Thu, 13 Jun 2019 05:42:34 -0700
Message-Id: <1560429754-17510-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Not every chip supported by this driver supports setting the number
of samples for power averaging. Also, the power monitoring register
is not always a 16-bit register, and the configuration bits used for
voltage sampling are different depending on the register width.
Some conditional code is needed to fix the problem.

On top of all that, the compiler complains about problems with
FIELD_GET and FIELD_PREP macros if the file is built with W=1.
Avoid using those macros to silence the warning.

Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: s/PRW/PWR/g
    Drop inline from function declarations

 drivers/hwmon/pmbus/adm1275.c | 84 +++++++++++++++++++++++++++++++++----------
 1 file changed, 65 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index a477ce0474bb..5caa37fbfc18 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -71,9 +71,17 @@ enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294 };
 #define ADM1075_VAUX_OV_WARN		BIT(7)
 #define ADM1075_VAUX_UV_WARN		BIT(6)
 
-#define ADM1275_PWR_AVG_MASK		GENMASK(13, 11)
-#define ADM1275_VI_AVG_MASK		GENMASK(10, 8)
-#define ADM1275_SAMPLES_AVG_MAX	128
+#define ADM1275_VI_AVG_SHIFT		0
+#define ADM1275_VI_AVG_MASK		GENMASK(ADM1275_VI_AVG_SHIFT + 2, \
+						ADM1275_VI_AVG_SHIFT)
+#define ADM1275_SAMPLES_AVG_MAX		128
+
+#define ADM1278_PWR_AVG_SHIFT		11
+#define ADM1278_PWR_AVG_MASK		GENMASK(ADM1278_PWR_AVG_SHIFT + 2, \
+						ADM1278_PWR_AVG_SHIFT)
+#define ADM1278_VI_AVG_SHIFT		8
+#define ADM1278_VI_AVG_MASK		GENMASK(ADM1278_VI_AVG_SHIFT + 2, \
+						ADM1278_VI_AVG_SHIFT)
 
 struct adm1275_data {
 	int id;
@@ -86,6 +94,7 @@ struct adm1275_data {
 	bool have_pin_min;
 	bool have_pin_max;
 	bool have_temp_max;
+	bool have_power_sampling;
 	struct pmbus_driver_info info;
 };
 
@@ -161,28 +170,58 @@ static const struct coefficients adm1293_coefficients[] = {
 	[18] = { 7658, 0, -3 },		/* power, 21V, irange200 */
 };
 
-static inline int adm1275_read_pmon_config(struct i2c_client *client, u16 mask)
+static int adm1275_read_pmon_config(const struct adm1275_data *data,
+				    struct i2c_client *client, bool is_power)
 {
-	int ret;
-
-	ret = i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
+	int shift, ret;
+	u16 mask;
+
+	/*
+	 * The PMON configuration register is a 16-bit register only on chips
+	 * supporting power average sampling. On other chips it is an 8-bit
+	 * register.
+	 */
+	if (data->have_power_sampling) {
+		ret = i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
+		mask = is_power ? ADM1278_PWR_AVG_MASK : ADM1278_VI_AVG_MASK;
+		shift = is_power ? ADM1278_PWR_AVG_SHIFT : ADM1278_VI_AVG_SHIFT;
+	} else {
+		ret = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
+		mask = ADM1275_VI_AVG_MASK;
+		shift = ADM1275_VI_AVG_SHIFT;
+	}
 	if (ret < 0)
 		return ret;
 
-	return FIELD_GET(mask, (u16)ret);
+	return (ret & mask) >> shift;
 }
 
-static inline int adm1275_write_pmon_config(struct i2c_client *client, u16 mask,
-					    u16 word)
+static int adm1275_write_pmon_config(const struct adm1275_data *data,
+				     struct i2c_client *client,
+				     bool is_power, u16 word)
 {
-	int ret;
-
-	ret = i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
+	int shift, ret;
+	u16 mask;
+
+	if (data->have_power_sampling) {
+		ret = i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
+		mask = is_power ? ADM1278_PWR_AVG_MASK : ADM1278_VI_AVG_MASK;
+		shift = is_power ? ADM1278_PWR_AVG_SHIFT : ADM1278_VI_AVG_SHIFT;
+	} else {
+		ret = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
+		mask = ADM1275_VI_AVG_MASK;
+		shift = ADM1275_VI_AVG_SHIFT;
+	}
 	if (ret < 0)
 		return ret;
 
-	word = FIELD_PREP(mask, word) | (ret & ~mask);
-	ret = i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG, word);
+	word = (ret & ~mask) | ((word << shift) & mask);
+	if (data->have_power_sampling)
+		ret = i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG,
+						word);
+	else
+		ret = i2c_smbus_write_byte_data(client, ADM1275_PMON_CONFIG,
+						word);
 
 	return ret;
 }
@@ -266,14 +305,16 @@ static int adm1275_read_word_data(struct i2c_client *client, int page, int reg)
 			return -ENXIO;
 		break;
 	case PMBUS_VIRT_POWER_SAMPLES:
-		ret = adm1275_read_pmon_config(client, ADM1275_PWR_AVG_MASK);
+		if (!data->have_power_sampling)
+			return -ENXIO;
+		ret = adm1275_read_pmon_config(data, client, true);
 		if (ret < 0)
 			break;
 		ret = BIT(ret);
 		break;
 	case PMBUS_VIRT_IN_SAMPLES:
 	case PMBUS_VIRT_CURR_SAMPLES:
-		ret = adm1275_read_pmon_config(client, ADM1275_VI_AVG_MASK);
+		ret = adm1275_read_pmon_config(data, client, false);
 		if (ret < 0)
 			break;
 		ret = BIT(ret);
@@ -323,14 +364,16 @@ static int adm1275_write_word_data(struct i2c_client *client, int page, int reg,
 		ret = pmbus_write_word_data(client, 0, ADM1278_PEAK_TEMP, 0);
 		break;
 	case PMBUS_VIRT_POWER_SAMPLES:
+		if (!data->have_power_sampling)
+			return -ENXIO;
 		word = clamp_val(word, 1, ADM1275_SAMPLES_AVG_MAX);
-		ret = adm1275_write_pmon_config(client, ADM1275_PWR_AVG_MASK,
+		ret = adm1275_write_pmon_config(data, client, true,
 						ilog2(word));
 		break;
 	case PMBUS_VIRT_IN_SAMPLES:
 	case PMBUS_VIRT_CURR_SAMPLES:
 		word = clamp_val(word, 1, ADM1275_SAMPLES_AVG_MAX);
-		ret = adm1275_write_pmon_config(client, ADM1275_VI_AVG_MASK,
+		ret = adm1275_write_pmon_config(data, client, false,
 						ilog2(word));
 		break;
 	default:
@@ -528,6 +571,7 @@ static int adm1275_probe(struct i2c_client *client,
 		data->have_vout = true;
 		data->have_pin_max = true;
 		data->have_temp_max = true;
+		data->have_power_sampling = true;
 
 		coefficients = adm1272_coefficients;
 		vindex = (config & ADM1275_VRANGE) ? 1 : 0;
@@ -613,6 +657,7 @@ static int adm1275_probe(struct i2c_client *client,
 		data->have_vout = true;
 		data->have_pin_max = true;
 		data->have_temp_max = true;
+		data->have_power_sampling = true;
 
 		coefficients = adm1278_coefficients;
 		vindex = 0;
@@ -648,6 +693,7 @@ static int adm1275_probe(struct i2c_client *client,
 		data->have_pin_min = true;
 		data->have_pin_max = true;
 		data->have_mfr_vaux_status = true;
+		data->have_power_sampling = true;
 
 		coefficients = adm1293_coefficients;
 
-- 
2.7.4

