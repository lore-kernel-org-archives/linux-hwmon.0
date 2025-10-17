Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B414331A6B
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706182; cv=none; b=kASTXgMHNB6Fi+Yvp23mxgqOOHRKYaZM+lx3z5RupEgEdnWDVWWNqmMaxc7G5pNISYjtBcBwKQAIpyyNm1YRc+CLLmF7asW2W5YNdwX/qgOIm7+5cTud7OjRngA6b4khCOb6ITlqrRy7IoyUYt/o6uO5ax1eY8f7yGQOm5Lr0GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706182; c=relaxed/simple;
	bh=P+jVcgKSG/42NFrlsS9ssGvamxQssuXbpPPULx51/kI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UhLB1kE+WlVYto1mC9QrRBZCLfKD8oY114hqbSx50F+xRkwJ+iTa1zwkhM177b1ZWK9wcmy+IcJ8oUJJA5LlCDaig32mPPGghzHy16Ftd1NgVCru8ZkvTfG8cNvcxyYg8/gSDpWRKx/QoKe++2XeeJeUrJjV11skuHyQSEQScKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDb+9leq; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDb+9leq"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33badfbbc48so2485285a91.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706179; x=1761310979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gC9gFIFTWjAF5Zu2VBwoSOkqxLbZk0j7OPMVkRRwFHI=;
        b=UDb+9leqIEQZJI2Kfsc0KblNXugWbO5xCLerZEwVVvL28WYhNQgLOZ9rM2uaUoGA+H
         dKHISgt6QBnlkC8fq8rYpZjIn7PJ2IZDF3gSDxZVQ0gPJSGOVs0HHWTTSjDth3nTHK7a
         E/W+M1ViDDG5p6PLxkF8XiX+EK9EMIWWwBNhUgyn9QR6BO2P/b6OfFpqZP0J3T92Y09W
         nG/WWCjfUCQGbd53vVntFMYR74a14BdgdQKU2BWP+20ZYJZblxiiPUCBv1itq0lav6zE
         +EaxKhGj1LJuMlbB6gE9QMcvYX9Idxp7nNeF2Djd7HRxOluQn5qqTCV4zRYxWtJwf0sA
         2QTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706179; x=1761310979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gC9gFIFTWjAF5Zu2VBwoSOkqxLbZk0j7OPMVkRRwFHI=;
        b=eFrPcETnQRgjpX6DsH0t8HxSLcKhYhftJGPP8TvjE3asLsplcQ7big/vlnAJj3b2lK
         TIWx37dlYiFobq48Vih/KS9QwsUxmJfVlPldYRQw2CNyFgpuZ2cGgky/wDjUkNWzOr2r
         Em6KHMB+8ZpOBeeI8im99ldkQY4iiBwwLjzouzG0G0cchUCMIb9mWhYlfVA0OC2yLrvV
         rKdhs5GBD2/zYpSz3sqdW+9XEWiBmQ1b6zuFCQGQDr8QE6ZDhsCqYFeBFYTKzgX4cEZ6
         EqNrjaY/hF0pnfSfCHAyg222jQfl4TzL73iqVkvoFmf/SGKWgEclsaTHE9LJtn/Q8MUm
         AIqQ==
X-Gm-Message-State: AOJu0YxLALK+NdQMg/71A4HoiEWWxWa62+5KEoHQ+UExTZjPYYuIUFNT
	2Q6xJTsuD8b5KSFohw52FEFNXwnQ7P2iRnh59vry2hWIC6rzw316fHT6XDJlTg==
X-Gm-Gg: ASbGnctkoRaTG74yCT2GqUly4cLCQLyHh9xlYKOjlRgKMXjFJCd0XhvTeJZ3gFrvl4m
	v1FPzoYagup1BabPO9C7Wgz2FEKKdX2PXBQk5RrH+La+sUcQBQ4rWCvWwhxS6K9V0kpruDnlGAn
	6Ua1VKsFLAfJUhMKPNHxOidUZgvbfl/J8+KI5q3kwLcRPNtZ0/PzlgWaF6R9lJ+nx7ewhF2vfVN
	QXklzP0cGO8pBozpgCbboUZydwEDiHZytdT2sh9CB7cD02O3p4BwsmpCMJqm1lw7XpU02b7pwo9
	JxSYhwn9IFsPeo8KwTuheDKfuLlVv3QDq1IQA/9AIcuRyy7QBiW1Y5TvXgF9I3KpjlHTW9j0TSJ
	k8GsfXtkEPHlb2JzTxzAt7O6Wens/Z1xkVjQbH6Pn1WJLbnv7hQ2DW0ivWYGREVbYpYCimG7ytO
	gjRgyxcAhk9DL1
X-Google-Smtp-Source: AGHT+IENPL6/++vgFxB2e3zqHs1DJF/5Q6YUWouAPZ1riGNFlOCd5lU+t3IPl5+poGv02y0d79ICBA==
X-Received: by 2002:a17:902:f64c:b0:270:4964:ad7c with SMTP id d9443c01a7336-290c9cf8e73mr49662845ad.2.1760706179184;
        Fri, 17 Oct 2025 06:02:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099aba062sm63652665ad.98.2025.10.17.06.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 16/29] hwmon: (adt7411) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:08 -0700
Message-ID: <20251017130221.1823453-17-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7411.c | 59 +++++++++++------------------------------
 1 file changed, 16 insertions(+), 43 deletions(-)

diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
index 08d0effd97f7..b9991a69e6c6 100644
--- a/drivers/hwmon/adt7411.c
+++ b/drivers/hwmon/adt7411.c
@@ -11,7 +11,6 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/err.h>
-#include <linux/mutex.h>
 #include <linux/jiffies.h>
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
@@ -99,8 +98,6 @@ static const u8 adt7411_in_alarm_bits[] = {
 };
 
 struct adt7411_data {
-	struct mutex device_lock;	/* for "atomic" device accesses */
-	struct mutex update_lock;
 	unsigned long next_update;
 	long vref_cached;
 	struct i2c_client *client;
@@ -110,55 +107,41 @@ struct adt7411_data {
 /*
  * When reading a register containing (up to 4) lsb, all associated
  * msb-registers get locked by the hardware. After _one_ of those msb is read,
- * _all_ are unlocked. In order to use this locking correctly, reading lsb/msb
- * is protected here with a mutex, too.
+ * _all_ are unlocked.
  */
 static int adt7411_read_10_bit(struct i2c_client *client, u8 lsb_reg,
-				u8 msb_reg, u8 lsb_shift)
+			       u8 msb_reg, u8 lsb_shift)
 {
-	struct adt7411_data *data = i2c_get_clientdata(client);
 	int val, tmp;
 
-	mutex_lock(&data->device_lock);
-
 	val = i2c_smbus_read_byte_data(client, lsb_reg);
 	if (val < 0)
-		goto exit_unlock;
+		return val;
 
 	tmp = (val >> lsb_shift) & 3;
 	val = i2c_smbus_read_byte_data(client, msb_reg);
+	if (val < 0)
+		return val;
 
-	if (val >= 0)
-		val = (val << 2) | tmp;
-
- exit_unlock:
-	mutex_unlock(&data->device_lock);
-
+	val = (val << 2) | tmp;
 	return val;
 }
 
 static int adt7411_modify_bit(struct i2c_client *client, u8 reg, u8 bit,
-				bool flag)
+			      bool flag)
 {
-	struct adt7411_data *data = i2c_get_clientdata(client);
 	int ret, val;
 
-	mutex_lock(&data->device_lock);
-
 	ret = i2c_smbus_read_byte_data(client, reg);
 	if (ret < 0)
-		goto exit_unlock;
+		return ret;
 
 	if (flag)
 		val = ret | bit;
 	else
 		val = ret & ~bit;
 
-	ret = i2c_smbus_write_byte_data(client, reg, val);
-
- exit_unlock:
-	mutex_unlock(&data->device_lock);
-	return ret;
+	return i2c_smbus_write_byte_data(client, reg, val);
 }
 
 static ssize_t adt7411_show_bit(struct device *dev,
@@ -186,12 +169,11 @@ static ssize_t adt7411_set_bit(struct device *dev,
 	if (ret || flag > 1)
 		return -EINVAL;
 
+	hwmon_lock(dev);
 	ret = adt7411_modify_bit(client, s_attr2->index, s_attr2->nr, flag);
-
 	/* force update */
-	mutex_lock(&data->update_lock);
 	data->next_update = jiffies;
-	mutex_unlock(&data->update_lock);
+	hwmon_unlock(dev);
 
 	return ret < 0 ? ret : count;
 }
@@ -294,10 +276,9 @@ static int adt7411_read_in_chan(struct device *dev, u32 attr, int channel,
 	int reg, lsb_reg, lsb_shift;
 	int nr = channel - 1;
 
-	mutex_lock(&data->update_lock);
 	ret = adt7411_update_vref(dev);
 	if (ret < 0)
-		goto exit_unlock;
+		return ret;
 
 	switch (attr) {
 	case hwmon_in_input:
@@ -307,7 +288,7 @@ static int adt7411_read_in_chan(struct device *dev, u32 attr, int channel,
 					  ADT7411_REG_EXT_TEMP_AIN1_MSB + nr,
 					  lsb_shift);
 		if (ret < 0)
-			goto exit_unlock;
+			return ret;
 		*val = ret * data->vref_cached / 1024;
 		ret = 0;
 		break;
@@ -318,7 +299,7 @@ static int adt7411_read_in_chan(struct device *dev, u32 attr, int channel,
 			: ADT7411_REG_IN_HIGH(channel);
 		ret = i2c_smbus_read_byte_data(client, reg);
 		if (ret < 0)
-			goto exit_unlock;
+			return ret;
 		*val = ret * data->vref_cached / 256;
 		ret = 0;
 		break;
@@ -329,8 +310,6 @@ static int adt7411_read_in_chan(struct device *dev, u32 attr, int channel,
 		ret = -EOPNOTSUPP;
 		break;
 	}
- exit_unlock:
-	mutex_unlock(&data->update_lock);
 	return ret;
 }
 
@@ -457,10 +436,9 @@ static int adt7411_write_in_chan(struct device *dev, u32 attr, int channel,
 	struct i2c_client *client = data->client;
 	int ret, reg;
 
-	mutex_lock(&data->update_lock);
 	ret = adt7411_update_vref(dev);
 	if (ret < 0)
-		goto exit_unlock;
+		return ret;
 	val = clamp_val(val, 0, 255 * data->vref_cached / 256);
 	val = DIV_ROUND_CLOSEST(val * 256, data->vref_cached);
 
@@ -472,13 +450,10 @@ static int adt7411_write_in_chan(struct device *dev, u32 attr, int channel,
 		reg = ADT7411_REG_IN_HIGH(channel);
 		break;
 	default:
-		ret = -EOPNOTSUPP;
-		goto exit_unlock;
+		return -EOPNOTSUPP;
 	}
 
 	ret = i2c_smbus_write_byte_data(client, reg, val);
- exit_unlock:
-	mutex_unlock(&data->update_lock);
 	return ret;
 }
 
@@ -679,8 +654,6 @@ static int adt7411_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, data);
 	data->client = client;
-	mutex_init(&data->device_lock);
-	mutex_init(&data->update_lock);
 
 	ret = adt7411_init_device(data);
 	if (ret < 0)
-- 
2.45.2

