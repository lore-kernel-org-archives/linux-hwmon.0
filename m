Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292024;
	b=AUQgreVhDxji3V9py+OCNtUVWNYqYfaLMJTNeXKfl4/SgXFFOWjnC9k81ny+miu/qeDd
	 h69AGSqlJwFtVptHw5SHBLFEr35395WH+Qy1V6/MgJTb+KhY3oZLHOzsMCZgcM6sBjpdx
	 ccB77k/hemMBRi04E9d9zTtDdJxdAfRJA4LPc5hgMttAjNCb7RxBeyiReDcTI7t3uryUq
	 zUk+GlLMhMN2vqsTsRcgEhXFxezq+0C9FPE4UDtHjygQUQ7AB98MAoCU4J+tnPjUA6Sc4
	 s2YRaaItq77NnYSPwYFvQjO+dW6SRoBEvNm9i5LkarH2NDgZFMMnJq/t9S3eEaDKCyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yay1Lz5FDTqZjTYYlkX6TelXO/NAlu3nwD/lDLlliJM=;
	b=LQHizoCZnYlnnBln/76H/vXJBRDbuG+goA3+0EfEwNPmLFAL8pe8d+tSmh+AL/Le8/9u
	 JNU9jgijHoTNI+Yg2ukHQ3MJeTbcFG9BRyPN91v8RGr3MGpy/+Crkzk4IWEnLGZXHo9L9
	 Dl9TkDiauerZRCP1sLzj24C2LbSlf0LZwOjcB4xahBSPZS3RUL8wkf1BNsJ+DYhEwkTUz
	 fUQCyxQE5W6BOuqPFAQWGT0NYUexeKGSkq2IpuGmyUcrJg268I+Jk8ukl1Lni7efE5h8Z
	 oWV9U3trvACyORuxGZr727cD9aOKsLb2qBpLrMP57vRKEZB9ruLDXETovykZtEn68rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COsNLR5g;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9AD606A33F
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 16:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E9AD606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COsNLR5g
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a18fc7a38so4707953eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 09:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793292023; x=1793896823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yay1Lz5FDTqZjTYYlkX6TelXO/NAlu3nwD/lDLlliJM=;
        b=COsNLR5ghRxDJOfM+t/eRyM09DxePm/vL5RYAxxzfxIN/zjY1RIbswu9buA4u1k9LI
         EMFD8AgUx7v7z91UasI67U+Q0uuJsQThmPJO2NLJiSW15CpOMXQGzjRIwp5bmH3uFnKl
         MZ531k3kjgjiuvICoppFNW6Lugy7AcgFUbE9vRJSkQpShLBAPHpmvr2j1QYlDuuS8UhX
         bCtraLCG/OJFEXsPguvKJotMIT7FVWPVkQJWp++z+w2DDyLMp0JmwzSsvQOy/k/XJo41
         R7ySDoBuFlqxheO/t/Lpi4niApv+DDjBREJiajGlwZ2odbEWsbwtT0X5OLZr0fABWGPT
         QyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292023; x=1793896823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yay1Lz5FDTqZjTYYlkX6TelXO/NAlu3nwD/lDLlliJM=;
        b=OqaL0CJXwksGbES89FjW+rqA5Hox1wr0kNSlw42OJR8kkUU5GUvu+u/Aex8HRkrGns
         A+CQuAFwm/ao2qqhuuCT2hKvCdV6RAAZGXNlz+gjbnnxvA9ockRvGM/lO2rB/8519yem
         PJ3uPNzK4cEEGwfJeXGK1g27kVo2Et7Nbxdw8dVPG13NV0f9kZAJPrsZzB3E42cKp0rL
         QO1VcnFEss/bKMw3Dq2f/XlneJIQbVlbYuD3Y0u7+gymiWb9xNTDZlAVUfTWSkiN/ibf
         gcE6vSLwhs96fHc2HUiYcaPb0kdXhunedZ/ybusQ/3X7n48gCd4BblpkTRASjJU/1g1x
         sP7Q==
X-Gm-Message-State: AFq9FYIZQkOEpGOlURnJTIkh92aGspFWbwxKHHgZXgGr1epiGmGjOvbB
	hlUL7PXAkWJkQqstumdSIhDTd3GQrLKSCu3B1JHk5PzoMReh2EWq7fdd
X-Gm-Gg: AYBFou010kcpbnyiXl9FX9aJ05bnD02swr93V0R+UDTSmRncVr39zl96qEdWY0z22FA
	LBvOYLIgmv2m4Q0dyIbsC54sduQDicqLr15K52UuSVz3o1hFlTXM98uXvb8AhpVUoWsdx4AMaIQ
	VktmSj85zwijev8cX4o+dIhrBVKwnMVAEc3+tM2t6kLVFminB9dNmOvVPvOyv+uhaHiNNRE2dit
	h8SH6d6Y5yUc5gjD3KUJVa0t4eyFoX/zTKOLGdqc5gu34S/PReto+zmkIETTD5q6Eho9UanMf3G
	GhEVotKVQcZp5CE9dthX8fNbprAzuRz8Ok/GpviLj5cAZmvmkybpCFMEM0f8qgzEh4dgHxOlZ1U
	JfvYi002GxcwAGOksz9U19bP9q+bPA2QMj8jIezMM+Yz6Rat47f3f4U7p2QtGX1TVV7ZCFJDrUu
	hMhEDHwjDupSYL/ErADkG/82jzHBS6womHgE7D/xBCrWjjzYLUqpnhxll2dxMWvciYM+Qy2eQ0/
	NqMeW3AcZ5VUWEOsT4sx0RCcy3X5FS/xSPh0MvBiEqAUK61GptOtfHI+193RQvKEgQU6aDddnQQ
	xOsGFx3PQAxuNN7haXaqaBMUwDRimz5HOe0/XWu9St3j2n7VjCgmrRq7GYe59TLv3Xk=
X-Received: by 2002:a05:7300:d402:b0:369:d6ed:f2b5 with SMTP id 5a478bee46e88-36a204cc914mr8073483eec.39.1793292022708;
        Thu, 29 Oct 2026 09:40:22 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a410faa87sm264319eec.26.2026.10.29.09.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:40:22 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] hwmon: (lm87) Propagate cached sensor read errors
Date: Fri, 30 Oct 2026 01:40:15 +0900
Message-ID: <20261029164016.338450-3-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029164016.338450-1-pocj8ur4in@gmail.com>
References: <74e00272-306d-4d83-b6f6-10059ad3a91f@roeck-us.net>
 <20261029164016.338450-1-pocj8ur4in@gmail.com>
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

Abort cache refresh when an I2C read fails and pass the error to
sysfs readers instead of returning stale or invalid sensor values.

Read the alarm registers last, since reading them can clear latched
alarms. Preserve the first alarm byte if reading the second fails,
so a retry can still report the captured alarm.

Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
 drivers/hwmon/lm87.c | 202 +++++++++++++++++++++++++++++++++----------
 1 file changed, 158 insertions(+), 44 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index c118a7ff718b..a66d486b314c 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -170,6 +170,7 @@ struct lm87_data {
 	u8 aout;		/* register value */
 
 	u16 alarms;		/* register values, combined */
+	u16 pending_alarms;	/* alarms read before an I2C error */
 	u8 vid;			/* register values, combined */
 	u8 vrm;
 
@@ -186,75 +187,138 @@ static inline int lm87_write_value(struct i2c_client *client, u8 reg, u8 value)
 	return i2c_smbus_write_byte_data(client, reg, value);
 }
 
+static int lm87_read_reg(struct i2c_client *client, u8 reg, u8 *value)
+{
+	int ret = lm87_read_value(client, reg);
+
+	if (ret < 0)
+		return ret;
+	*value = ret;
+	return 0;
+}
+
+static int lm87_read_temp(struct i2c_client *client, u8 reg, s8 *value)
+{
+	int ret = lm87_read_value(client, reg);
+
+	if (ret < 0)
+		return ret;
+	*value = ret;
+	return 0;
+}
+
 static struct lm87_data *lm87_update_device(struct device *dev)
 {
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
+	int i, j, ret;
+	u8 first, second;
 
 	mutex_lock(&data->update_lock);
 
 	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
-		int i, j;
-
 		dev_dbg(&client->dev, "Updating data.\n");
 
 		i = (data->channel & CHAN_TEMP3) ? 1 : 0;
 		j = (data->channel & CHAN_TEMP3) ? 5 : 6;
 		for (; i < j; i++) {
-			data->in[i] = lm87_read_value(client,
-				      LM87_REG_IN(i));
-			data->in_min[i] = lm87_read_value(client,
-					  LM87_REG_IN_MIN(i));
-			data->in_max[i] = lm87_read_value(client,
-					  LM87_REG_IN_MAX(i));
+			ret = lm87_read_reg(client, LM87_REG_IN(i), &data->in[i]);
+			if (ret < 0)
+				goto error;
+			ret = lm87_read_reg(client, LM87_REG_IN_MIN(i),
+					    &data->in_min[i]);
+			if (ret < 0)
+				goto error;
+			ret = lm87_read_reg(client, LM87_REG_IN_MAX(i),
+					    &data->in_max[i]);
+			if (ret < 0)
+				goto error;
 		}
 
 		for (i = 0; i < 2; i++) {
 			if (data->channel & CHAN_NO_FAN(i)) {
-				data->in[6+i] = lm87_read_value(client,
-						LM87_REG_AIN(i));
-				data->in_max[6+i] = lm87_read_value(client,
-						    LM87_REG_AIN_MAX(i));
-				data->in_min[6+i] = lm87_read_value(client,
-						    LM87_REG_AIN_MIN(i));
-
+				ret = lm87_read_reg(client, LM87_REG_AIN(i),
+						    &data->in[6 + i]);
+				if (ret < 0)
+					goto error;
+				ret = lm87_read_reg(client, LM87_REG_AIN_MAX(i),
+						    &data->in_max[6 + i]);
+				if (ret < 0)
+					goto error;
+				ret = lm87_read_reg(client, LM87_REG_AIN_MIN(i),
+						    &data->in_min[6 + i]);
+				if (ret < 0)
+					goto error;
 			} else {
-				data->fan[i] = lm87_read_value(client,
-					       LM87_REG_FAN(i));
-				data->fan_min[i] = lm87_read_value(client,
-						   LM87_REG_FAN_MIN(i));
+				ret = lm87_read_reg(client, LM87_REG_FAN(i),
+						    &data->fan[i]);
+				if (ret < 0)
+					goto error;
+				ret = lm87_read_reg(client, LM87_REG_FAN_MIN(i),
+						    &data->fan_min[i]);
+				if (ret < 0)
+					goto error;
 			}
 		}
 
 		j = (data->channel & CHAN_TEMP3) ? 3 : 2;
 		for (i = 0 ; i < j; i++) {
-			data->temp[i] = lm87_read_value(client,
-					LM87_REG_TEMP[i]);
-			data->temp_high[i] = lm87_read_value(client,
-					     LM87_REG_TEMP_HIGH[i]);
-			data->temp_low[i] = lm87_read_value(client,
-					    LM87_REG_TEMP_LOW[i]);
+			ret = lm87_read_temp(client, LM87_REG_TEMP[i],
+					     &data->temp[i]);
+			if (ret < 0)
+				goto error;
+			ret = lm87_read_temp(client, LM87_REG_TEMP_HIGH[i],
+					     &data->temp_high[i]);
+			if (ret < 0)
+				goto error;
+			ret = lm87_read_temp(client, LM87_REG_TEMP_LOW[i],
+					     &data->temp_low[i]);
+			if (ret < 0)
+				goto error;
 		}
 
-		i = lm87_read_value(client, LM87_REG_TEMP_HW_INT_LOCK);
-		j = lm87_read_value(client, LM87_REG_TEMP_HW_INT);
-		data->temp_crit_int = min(i, j);
-
-		i = lm87_read_value(client, LM87_REG_TEMP_HW_EXT_LOCK);
-		j = lm87_read_value(client, LM87_REG_TEMP_HW_EXT);
-		data->temp_crit_ext = min(i, j);
-
-		i = lm87_read_value(client, LM87_REG_VID_FAN_DIV);
-		data->fan_div[0] = (i >> 4) & 0x03;
-		data->fan_div[1] = (i >> 6) & 0x03;
-		data->vid = (i & 0x0F)
-			  | (lm87_read_value(client, LM87_REG_VID4) & 0x01)
-			     << 4;
-
-		data->alarms = lm87_read_value(client, LM87_REG_ALARMS1)
-			     | (lm87_read_value(client, LM87_REG_ALARMS2)
-				<< 8);
-		data->aout = lm87_read_value(client, LM87_REG_AOUT);
+		ret = lm87_read_reg(client, LM87_REG_TEMP_HW_INT_LOCK,
+				    &first);
+		if (ret < 0)
+			goto error;
+		ret = lm87_read_reg(client, LM87_REG_TEMP_HW_INT, &second);
+		if (ret < 0)
+			goto error;
+		data->temp_crit_int = min(first, second);
+
+		ret = lm87_read_reg(client, LM87_REG_TEMP_HW_EXT_LOCK,
+				    &first);
+		if (ret < 0)
+			goto error;
+		ret = lm87_read_reg(client, LM87_REG_TEMP_HW_EXT, &second);
+		if (ret < 0)
+			goto error;
+		data->temp_crit_ext = min(first, second);
+
+		ret = lm87_read_reg(client, LM87_REG_VID_FAN_DIV, &first);
+		if (ret < 0)
+			goto error;
+		data->fan_div[0] = (first >> 4) & 0x03;
+		data->fan_div[1] = (first >> 6) & 0x03;
+		ret = lm87_read_reg(client, LM87_REG_VID4, &second);
+		if (ret < 0)
+			goto error;
+		data->vid = (first & 0x0F) | (second & 0x01) << 4;
+
+		ret = lm87_read_reg(client, LM87_REG_AOUT, &data->aout);
+		if (ret < 0)
+			goto error;
+
+		ret = lm87_read_reg(client, LM87_REG_ALARMS1, &first);
+		if (ret < 0)
+			goto error;
+		ret = lm87_read_reg(client, LM87_REG_ALARMS2, &second);
+		if (ret < 0) {
+			data->pending_alarms |= first;
+			goto error;
+		}
+		data->alarms = data->pending_alarms | first | second << 8;
+		data->pending_alarms = 0;
 
 		data->last_updated = jiffies;
 		data->valid = true;
@@ -263,6 +327,11 @@ static struct lm87_data *lm87_update_device(struct device *dev)
 	mutex_unlock(&data->update_lock);
 
 	return data;
+
+error:
+	data->valid = false;
+	mutex_unlock(&data->update_lock);
+	return ERR_PTR(ret);
 }
 
 /*
@@ -275,6 +344,9 @@ static ssize_t in_input_show(struct device *dev,
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%u\n", IN_FROM_REG(data->in[nr],
 		       data->in_scale[nr]));
 }
@@ -285,6 +357,9 @@ static ssize_t in_min_show(struct device *dev, struct device_attribute *attr,
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_min[nr],
 		       data->in_scale[nr]));
 }
@@ -295,6 +370,9 @@ static ssize_t in_max_show(struct device *dev, struct device_attribute *attr,
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_max[nr],
 		       data->in_scale[nr]));
 }
@@ -378,6 +456,9 @@ static ssize_t temp_input_show(struct device *dev,
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr]));
 }
 
@@ -387,6 +468,9 @@ static ssize_t temp_low_show(struct device *dev,
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n",
 		       TEMP_FROM_REG(data->temp_low[nr]));
 }
@@ -397,6 +481,9 @@ static ssize_t temp_high_show(struct device *dev,
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n",
 		       TEMP_FROM_REG(data->temp_high[nr]));
 }
@@ -463,6 +550,9 @@ static ssize_t temp1_crit_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_crit_int));
 }
 
@@ -470,6 +560,9 @@ static ssize_t temp2_crit_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_crit_ext));
 }
 
@@ -483,6 +576,9 @@ static ssize_t fan_input_show(struct device *dev,
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", fan_from_reg(data->fan[nr],
 		       FAN_DIV_FROM_REG(data->fan_div[nr])));
 }
@@ -493,6 +589,9 @@ static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", fan_from_reg(data->fan_min[nr],
 		       FAN_DIV_FROM_REG(data->fan_div[nr])));
 }
@@ -503,6 +602,9 @@ static ssize_t fan_div_show(struct device *dev, struct device_attribute *attr,
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n",
 		       FAN_DIV_FROM_REG(data->fan_div[nr]));
 }
@@ -613,6 +715,9 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->alarms);
 }
 static DEVICE_ATTR_RO(alarms);
@@ -621,6 +726,9 @@ static ssize_t cpu0_vid_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
 static DEVICE_ATTR_RO(cpu0_vid);
@@ -654,6 +762,9 @@ static ssize_t aout_output_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", AOUT_FROM_REG(data->aout));
 }
 static ssize_t aout_output_store(struct device *dev,
@@ -686,6 +797,9 @@ static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 {
 	struct lm87_data *data = lm87_update_device(dev);
 	int bitnr = to_sensor_dev_attr(attr)->index;
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
 }
 static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
-- 
2.55.0

