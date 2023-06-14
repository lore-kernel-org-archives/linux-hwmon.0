Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16132EB64DB
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jun 2023 16:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234236AbjFNQg1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Jun 2023 12:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234592AbjFNQgN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Jun 2023 12:36:13 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7872B2126
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jun 2023 09:36:11 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-651ffcc1d3dso5256290b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jun 2023 09:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686760570; x=1689352570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EK1z/y7wYuamEcPSnrEDV4M5+6fd4DxPguGO8XdJL6Y=;
        b=Mo6+dcw7lW/0kUPqBuJeC2xSUPk8psRgIAQt8ajfB9so0t8k397a0wfDAcgHoxZGvv
         DczIxYMPcheMK8JCLB5EP/gaYg9NTnyVbCRIbla7gfdo1az2JnH9z5zGFD+dbEuAwkQf
         RV+GN40scShmJ7fSUJ+YnzY831GE1BBXRMo0dFUQiCTKc5Y/FJbomCySZZWu5CDozMyO
         uDPUiX+ZNBPHwmqUCllopXDBuVIjPSFARuT6nVkPhmkQdkm+z+KOItucIsxo0I6AhzK+
         Ml8nfnMWyAV5rPuvyYcTT42EznfJuXGW9p3kzPVJa6RqAwTdu/PeGAKhpzyV4b/BDx+5
         qvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686760570; x=1689352570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EK1z/y7wYuamEcPSnrEDV4M5+6fd4DxPguGO8XdJL6Y=;
        b=WUMEMA2gnBzXGT3PgX1hJtIlkGF9FsUVYgakibgbQTnEADNrco+ENFgI8xDz5n5/MJ
         u+AHSk11nSZ/KpKdEIPI/QrfZeojWwpQfKN74YrNR/OzFYmFOjF1PgwDvmaOSDp6LPZA
         gQZ9lUOumfomaisPzA6y72gLCXeJ0hztjrCYZ8XDEQwJy4+TaNlAj9BsWm8k1p8uko6M
         o2AIyA52lLomdhImhgTTcBuzu050hJ1WVnZFMkOeNXc6I5+SxwfB7Je+Uk3N3vTER3yg
         SVZRmUacO2yiN+R/kR6yw6SbNHLgVCJwCTJgFOWm1PyiJB/oonlBLWVoBUxwwYwmPUdn
         dUnA==
X-Gm-Message-State: AC+VfDwoXXpAOpLABzc9zv2rX0L8Bh/biPLt2sJPgQ4sTXAo3C+X5k7/
        4v/usgzhPP92N0LX8VNSqFTkeG5i7CI=
X-Google-Smtp-Source: ACHHUZ4SIE2uqBeUlJK2lQYvL2RQZAawsopoggZoxoXre9b2TC4MbKR8b18KZYlh2KkwXJfJoIRXnA==
X-Received: by 2002:a05:6a21:7899:b0:118:95f1:5a78 with SMTP id bf25-20020a056a21789900b0011895f15a78mr2308315pzc.31.1686760570299;
        Wed, 14 Jun 2023 09:36:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r17-20020a63ec51000000b0051b8172fa68sm11430047pgj.38.2023.06.14.09.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 09:36:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Arthur Korn <akorn@google.com>, Guenter Roeck <linux@roeck-us.net>
Subject: [RFT PATCH 1/2] hwmon: (pmbus/adm1275) Prepare for protected write to PMON_CONFIG
Date:   Wed, 14 Jun 2023 09:36:04 -0700
Message-Id: <20230614163605.3688964-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614163605.3688964-1-linux@roeck-us.net>
References: <20230614163605.3688964-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

According to ADI, changing PMON_CONFIG while ADC is running can have
unexpected results. ADI recommends halting the ADC with PMON_CONTROL
before setting PMON_CONFIG and then resume after.

To prepare for this change, rename adm1275_read_pmon_config()
and adm1275_write_pmon_config() to adm1275_read_samples() and
adm1275_write_samples() to more accurately reflect the functionality
of the code. Introduce new function adm1275_write_pmon_config()
and use it for all code writing into the PMON_CONFIG register.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/adm1275.c | 56 +++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index b8543c06d022..eaa691b98c14 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -173,8 +173,8 @@ static const struct coefficients adm1293_coefficients[] = {
 	[18] = { 7658, 0, -3 },		/* power, 21V, irange200 */
 };
 
-static int adm1275_read_pmon_config(const struct adm1275_data *data,
-				    struct i2c_client *client, bool is_power)
+static int adm1275_read_samples(const struct adm1275_data *data,
+				struct i2c_client *client, bool is_power)
 {
 	int shift, ret;
 	u16 mask;
@@ -200,8 +200,23 @@ static int adm1275_read_pmon_config(const struct adm1275_data *data,
 }
 
 static int adm1275_write_pmon_config(const struct adm1275_data *data,
-				     struct i2c_client *client,
-				     bool is_power, u16 word)
+				     struct i2c_client *client, u16 word)
+{
+	int ret;
+
+	if (data->have_power_sampling)
+		ret = i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG,
+						word);
+	else
+		ret = i2c_smbus_write_byte_data(client, ADM1275_PMON_CONFIG,
+						word);
+
+	return ret;
+}
+
+static int adm1275_write_samples(const struct adm1275_data *data,
+				 struct i2c_client *client,
+				 bool is_power, u16 word)
 {
 	int shift, ret;
 	u16 mask;
@@ -219,14 +234,8 @@ static int adm1275_write_pmon_config(const struct adm1275_data *data,
 		return ret;
 
 	word = (ret & ~mask) | ((word << shift) & mask);
-	if (data->have_power_sampling)
-		ret = i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG,
-						word);
-	else
-		ret = i2c_smbus_write_byte_data(client, ADM1275_PMON_CONFIG,
-						word);
 
-	return ret;
+	return adm1275_write_pmon_config(data, client, word);
 }
 
 static int adm1275_read_word_data(struct i2c_client *client, int page,
@@ -321,14 +330,14 @@ static int adm1275_read_word_data(struct i2c_client *client, int page,
 	case PMBUS_VIRT_POWER_SAMPLES:
 		if (!data->have_power_sampling)
 			return -ENXIO;
-		ret = adm1275_read_pmon_config(data, client, true);
+		ret = adm1275_read_samples(data, client, true);
 		if (ret < 0)
 			break;
 		ret = BIT(ret);
 		break;
 	case PMBUS_VIRT_IN_SAMPLES:
 	case PMBUS_VIRT_CURR_SAMPLES:
-		ret = adm1275_read_pmon_config(data, client, false);
+		ret = adm1275_read_samples(data, client, false);
 		if (ret < 0)
 			break;
 		ret = BIT(ret);
@@ -381,14 +390,12 @@ static int adm1275_write_word_data(struct i2c_client *client, int page, int reg,
 		if (!data->have_power_sampling)
 			return -ENXIO;
 		word = clamp_val(word, 1, ADM1275_SAMPLES_AVG_MAX);
-		ret = adm1275_write_pmon_config(data, client, true,
-						ilog2(word));
+		ret = adm1275_write_samples(data, client, true, ilog2(word));
 		break;
 	case PMBUS_VIRT_IN_SAMPLES:
 	case PMBUS_VIRT_CURR_SAMPLES:
 		word = clamp_val(word, 1, ADM1275_SAMPLES_AVG_MAX);
-		ret = adm1275_write_pmon_config(data, client, false,
-						ilog2(word));
+		ret = adm1275_write_samples(data, client, false, ilog2(word));
 		break;
 	default:
 		ret = -ENODATA;
@@ -466,13 +473,14 @@ static const struct i2c_device_id adm1275_id[] = {
 MODULE_DEVICE_TABLE(i2c, adm1275_id);
 
 /* Enable VOUT & TEMP1 if not enabled (disabled by default) */
-static int adm1275_enable_vout_temp(struct i2c_client *client, int config)
+static int adm1275_enable_vout_temp(struct adm1275_data *data,
+				    struct i2c_client *client, int config)
 {
 	int ret;
 
 	if ((config & ADM1278_PMON_DEFCONFIG) != ADM1278_PMON_DEFCONFIG) {
 		config |= ADM1278_PMON_DEFCONFIG;
-		ret = i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG, config);
+		ret = adm1275_write_pmon_config(data, client, config);
 		if (ret < 0) {
 			dev_err(&client->dev, "Failed to enable VOUT/TEMP1 monitoring\n");
 			return ret;
@@ -634,7 +642,7 @@ static int adm1275_probe(struct i2c_client *client)
 			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 
-		ret = adm1275_enable_vout_temp(client, config);
+		ret = adm1275_enable_vout_temp(data, client, config);
 		if (ret)
 			return ret;
 
@@ -694,7 +702,7 @@ static int adm1275_probe(struct i2c_client *client)
 			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 
-		ret = adm1275_enable_vout_temp(client, config);
+		ret = adm1275_enable_vout_temp(data, client, config);
 		if (ret)
 			return ret;
 
@@ -766,8 +774,7 @@ static int adm1275_probe(struct i2c_client *client)
 				"Invalid number of power samples");
 			return -EINVAL;
 		}
-		ret = adm1275_write_pmon_config(data, client, true,
-						ilog2(avg));
+		ret = adm1275_write_samples(data, client, true, ilog2(avg));
 		if (ret < 0) {
 			dev_err(&client->dev,
 				"Setting power sample averaging failed with error %d",
@@ -784,8 +791,7 @@ static int adm1275_probe(struct i2c_client *client)
 				"Invalid number of voltage/current samples");
 			return -EINVAL;
 		}
-		ret = adm1275_write_pmon_config(data, client, false,
-						ilog2(avg));
+		ret = adm1275_write_samples(data, client, false, ilog2(avg));
 		if (ret < 0) {
 			dev_err(&client->dev,
 				"Setting voltage and current sample averaging failed with error %d",
-- 
2.39.2

