Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292022;
	b=RO4mzqTIeb9ft/sStFE3jDyeNicI1N4J7UuMv8Eiku9swSWa5FAuelrHv2WwZcnqngVE
	 EHWTa3YKjNL76WzOFNNpGvgTP/OAv5281XUeAXbShoV2n1KQ1brFvB5LxxxxYH/1aKsYV
	 eU/XWM3GcArJfjI4gfUEPgTihe100/Uoh+7p5lWV3AlnkyKDTEwuVsl60mENsSvVEK8q3
	 W6YAEwKMdYQ5GdZTF+/V0P8/RYJ3bC5ohDzdQM9OBvrIJZFv4+UqpvLCMYb8zJ/8ubJE2
	 2haWKbJFhkBdqyF4AVkt9BQcLNQkMKD6jeSMILn9mEW35Rb2S7quBGvWSPhKM1yQxnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WcmHvblESmvr3kgWLi3WJoBUGk49ybDEunYlRtQWhP0=;
	b=Ye4E0bV8//+/ZCbhHAYGybfOsGsN4d4WK/vGPfkjzthYRFgo9tt0uu9t7nhj8rsD9oO+
	 s/4f1JjoEzXZOn4ks7up0/JvwXjHDTSajwEH9j5Fa8ASiixcGasFgb5gNT9DNjabh3RwR
	 4213HvYGFXg8FzR6nidiLKBNTKSGsyR8Xh/5h9CigTRvhu8c8H4RrToUanCPOsAycmfTX
	 TsOtK6J6xLVxhmQ/o6ErMZ6PXOCehAS57sorR9OWSmroJ/tx3s48mnqV9uq9FV+T1VMYm
	 0zCPUg2KgWIXiIWF1aykD4FWas61d6ZEsxvkU87dkZe5SbirBD1+2e+x8UJkJ1Vp7kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=II4UMkmO;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E466606A327
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 16:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E466606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=II4UMkmO
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2264585eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 09:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793292021; x=1793896821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WcmHvblESmvr3kgWLi3WJoBUGk49ybDEunYlRtQWhP0=;
        b=II4UMkmOMd/xtuN6fqaeOOkoY3c6cv95sukENj370zdtkPRLzFWkvJPaM+Ca7O0ezK
         4zHsqHGBjYEinPaR1JQEQEB69zy6KONmEonYqpn0qonZiYtjjeoKZnkM0MrCAVqCusYJ
         Z98DHJ14ABZbng9DdaVuVbzhfAdwK8GsXJArbwItwDxHASB/gXXJ8OUjVXscLQJcFtjP
         nsq0N2HNAjoZsZYQeDVR3fVDIv2O0JkqUqJXicQNDEPxG8SqQWgF+TcoiB03GQUJbyan
         SNlVy9cVNpJA3og9OneGnYKmgpAMa3Iau/fdP/1RD6znPumBg56ye39+xaR9vJ85HmUj
         oCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292021; x=1793896821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WcmHvblESmvr3kgWLi3WJoBUGk49ybDEunYlRtQWhP0=;
        b=MOUCuLhIR+nCkJQer86apqXyJ8xF+P0QBUDGvDfYrfIWfCjdW0r+i+Vhbj2qkPhp+1
         fqVg2XwVcvcvMxE7xX2rJGwPwRUIg9rG7Dn7ROdSFr0twr0zQY0H0rmGkZPUZ8y/Ftay
         YjWyjL8DxoE97wBuA/Y1Hp5BiX+dz5HJ6kVnpCzwIDtlkLpBDoDjaHDy0f06blS6pcqk
         se5bhJh5OEE9lLi28VlOdn7TllPNuhSpFMQ7fjwWd8KQ2t/Yc5hVtQ4/HDkKyvbLFagn
         VAZBDvDr6rj7XC9yZ3hCC+VraRUs0n3Tst4n95o17B6H9EftPEke/zRHK7w9ZgWoal4/
         fm0Q==
X-Gm-Message-State: AFq9FYJowyHtsl+Pru1BC5c4+owOXmvXKh68OufyibcbhcqYWDkV6HsB
	IYlysrdaDZ4rT7Co4geuqutSNDw/0ZuqkO5ROqrCTrMM+qghSwjDW4mwNdUDdoJ9
X-Gm-Gg: AYBFou3lkkRclkHCF91aClZStHzNUcerf7S3wXY0quvtCDGDbbzgiYSZ9AMcHkmwXZw
	6DwVh3Gp5cO+GFt3uAqYSVVcHxPvdtMYaOPKEUiziqxB+CIgjHK+VkoZ9RXaSSgBBjg3/qVCVjc
	tLMwywyFl7N4PmyrXFa64o9irujrnt8Fzl3fCgiwClvemjEEkAJPHCcpfwMKhViq/cMIL0m7Gj9
	fAz8uUKaSBaW/rOY/ifVqXfZ0ggchQPH7LJm2MGPYEi+QtKncPPqTXhLd1OB1eDUvmDBbjWRpPb
	caZVtO5HvHamm0zfwHGUeXcG3PYEVopAUTK+xh26O0znEgwwX5j+PMQf9UzqhbHBBVhWtpo3bTh
	I4TaSN4fwxSEs5MlisIOuVf3se76obO2YNTnhrA3xR6W6SAnI6B2P4hYPBPeEEwGbSPDmv19+NK
	m2UxDaLDMt4zYT1NmAd5SHgpKxarYBo4anIsz/tdcA7hs3YRG/dEYKKlE4ZU1e2GemTc3fgZRzP
	ORzhFtDkEVjXaM+DD8A27IFlP6O4F1ZP3aRlX919+W3DxWwaWmeG3AoVauv8dsmYMaRneZlJ6TT
	KGQfOndxV5iX6/+4bHvOFDD2hpMuvr8dgvomG83bOBLgW2Q=
X-Received: by 2002:a05:693c:639c:10b0:35c:8abb:b4ae with SMTP id 5a478bee46e88-36a203fec83mr8634646eec.25.1793292021009;
        Thu, 29 Oct 2026 09:40:21 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a410faa87sm264319eec.26.2026.10.29.09.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:40:20 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] hwmon: (lm87) Propagate sysfs write errors
Date: Fri, 30 Oct 2026 01:40:14 +0900
Message-ID: <20261029164016.338450-2-pocj8ur4in@gmail.com>
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

Check the I2C result before updating cached values for writable
attributes. Handle both writes in fan divider changes separately so a
failed second write does not hide the first one.

Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
 drivers/hwmon/lm87.c | 96 ++++++++++++++++++++++++++++----------------
 1 file changed, 61 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index c09074f44708..c118a7ff718b 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -305,6 +305,7 @@ static ssize_t in_min_store(struct device *dev, struct device_attribute *attr,
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
+	u8 reg;
 	long val;
 	int err;
 
@@ -312,12 +313,14 @@ static ssize_t in_min_store(struct device *dev, struct device_attribute *attr,
 	if (err)
 		return err;
 
+	reg = IN_TO_REG(val, data->in_scale[nr]);
 	mutex_lock(&data->update_lock);
-	data->in_min[nr] = IN_TO_REG(val, data->in_scale[nr]);
-	lm87_write_value(client, nr < 6 ? LM87_REG_IN_MIN(nr) :
-			 LM87_REG_AIN_MIN(nr - 6), data->in_min[nr]);
+	err = lm87_write_value(client, nr < 6 ? LM87_REG_IN_MIN(nr) :
+			       LM87_REG_AIN_MIN(nr - 6), reg);
+	if (!err)
+		data->in_min[nr] = reg;
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err < 0 ? err : count;
 }
 
 static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
@@ -326,6 +329,7 @@ static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
+	u8 reg;
 	long val;
 	int err;
 
@@ -333,12 +337,14 @@ static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
 	if (err)
 		return err;
 
+	reg = IN_TO_REG(val, data->in_scale[nr]);
 	mutex_lock(&data->update_lock);
-	data->in_max[nr] = IN_TO_REG(val, data->in_scale[nr]);
-	lm87_write_value(client, nr < 6 ? LM87_REG_IN_MAX(nr) :
-			 LM87_REG_AIN_MAX(nr - 6), data->in_max[nr]);
+	err = lm87_write_value(client, nr < 6 ? LM87_REG_IN_MAX(nr) :
+			       LM87_REG_AIN_MAX(nr - 6), reg);
+	if (!err)
+		data->in_max[nr] = reg;
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err < 0 ? err : count;
 }
 
 static SENSOR_DEVICE_ATTR_RO(in0_input, in_input, 0);
@@ -402,6 +408,7 @@ static ssize_t temp_low_store(struct device *dev,
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
+	u8 reg;
 	long val;
 	int err;
 
@@ -409,11 +416,13 @@ static ssize_t temp_low_store(struct device *dev,
 	if (err)
 		return err;
 
+	reg = TEMP_TO_REG(val);
 	mutex_lock(&data->update_lock);
-	data->temp_low[nr] = TEMP_TO_REG(val);
-	lm87_write_value(client, LM87_REG_TEMP_LOW[nr], data->temp_low[nr]);
+	err = lm87_write_value(client, LM87_REG_TEMP_LOW[nr], reg);
+	if (!err)
+		data->temp_low[nr] = reg;
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err < 0 ? err : count;
 }
 
 static ssize_t temp_high_store(struct device *dev,
@@ -423,6 +432,7 @@ static ssize_t temp_high_store(struct device *dev,
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
+	u8 reg;
 	long val;
 	int err;
 
@@ -430,11 +440,13 @@ static ssize_t temp_high_store(struct device *dev,
 	if (err)
 		return err;
 
+	reg = TEMP_TO_REG(val);
 	mutex_lock(&data->update_lock);
-	data->temp_high[nr] = TEMP_TO_REG(val);
-	lm87_write_value(client, LM87_REG_TEMP_HIGH[nr], data->temp_high[nr]);
+	err = lm87_write_value(client, LM87_REG_TEMP_HIGH[nr], reg);
+	if (!err)
+		data->temp_high[nr] = reg;
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err < 0 ? err : count;
 }
 
 static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_input, 0);
@@ -502,6 +514,7 @@ static ssize_t fan_min_store(struct device *dev,
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
+	u8 reg;
 	long val;
 	int err;
 
@@ -510,11 +523,12 @@ static ssize_t fan_min_store(struct device *dev,
 		return err;
 
 	mutex_lock(&data->update_lock);
-	data->fan_min[nr] = FAN_TO_REG(val,
-			    FAN_DIV_FROM_REG(data->fan_div[nr]));
-	lm87_write_value(client, LM87_REG_FAN_MIN(nr), data->fan_min[nr]);
+	reg = FAN_TO_REG(val, FAN_DIV_FROM_REG(data->fan_div[nr]));
+	err = lm87_write_value(client, LM87_REG_FAN_MIN(nr), reg);
+	if (!err)
+		data->fan_min[nr] = reg;
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err < 0 ? err : count;
 }
 
 /*
@@ -533,7 +547,7 @@ static ssize_t fan_div_store(struct device *dev,
 	long val;
 	int err;
 	unsigned long min;
-	u8 reg;
+	u8 reg, div, fan_min;
 
 	err = kstrtol(buf, 10, &val);
 	if (err)
@@ -545,39 +559,47 @@ static ssize_t fan_div_store(struct device *dev,
 
 	switch (val) {
 	case 1:
-		data->fan_div[nr] = 0;
+		div = 0;
 		break;
 	case 2:
-		data->fan_div[nr] = 1;
+		div = 1;
 		break;
 	case 4:
-		data->fan_div[nr] = 2;
+		div = 2;
 		break;
 	case 8:
-		data->fan_div[nr] = 3;
+		div = 3;
 		break;
 	default:
 		mutex_unlock(&data->update_lock);
 		return -EINVAL;
 	}
 
-	reg = lm87_read_value(client, LM87_REG_VID_FAN_DIV);
+	err = lm87_read_value(client, LM87_REG_VID_FAN_DIV);
+	if (err < 0)
+		goto out;
+	reg = err;
 	switch (nr) {
 	case 0:
-	    reg = (reg & 0xCF) | (data->fan_div[0] << 4);
+	    reg = (reg & 0xCF) | (div << 4);
 	    break;
 	case 1:
-	    reg = (reg & 0x3F) | (data->fan_div[1] << 6);
+	    reg = (reg & 0x3F) | (div << 6);
 	    break;
 	}
-	lm87_write_value(client, LM87_REG_VID_FAN_DIV, reg);
-
-	data->fan_min[nr] = FAN_TO_REG(min, val);
-	lm87_write_value(client, LM87_REG_FAN_MIN(nr),
-			 data->fan_min[nr]);
+	err = lm87_write_value(client, LM87_REG_VID_FAN_DIV, reg);
+	if (err < 0)
+		goto out;
+	data->fan_div[nr] = div;
+
+	fan_min = FAN_TO_REG(min, val);
+	err = lm87_write_value(client, LM87_REG_FAN_MIN(nr), fan_min);
+	if (!err)
+		data->fan_min[nr] = fan_min;
+out:
 	mutex_unlock(&data->update_lock);
 
-	return count;
+	return err < 0 ? err : count;
 }
 
 static SENSOR_DEVICE_ATTR_RO(fan1_input, fan_input, 0);
@@ -640,6 +662,7 @@ static ssize_t aout_output_store(struct device *dev,
 {
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
+	u8 reg;
 	long val;
 	int err;
 
@@ -647,11 +670,14 @@ static ssize_t aout_output_store(struct device *dev,
 	if (err)
 		return err;
 
+	reg = AOUT_TO_REG(val);
+
 	mutex_lock(&data->update_lock);
-	data->aout = AOUT_TO_REG(val);
-	lm87_write_value(client, LM87_REG_AOUT, data->aout);
+	err = lm87_write_value(client, LM87_REG_AOUT, reg);
+	if (!err)
+		data->aout = reg;
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err < 0 ? err : count;
 }
 static DEVICE_ATTR_RW(aout_output);
 
-- 
2.55.0

