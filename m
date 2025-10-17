Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A068330321
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706175; cv=none; b=ZhHE4SeaeCzPuUc8/yVl6wsnfpqnBD7WLaKe/KWhk4LpVkEB6zoF73g5G9jK1LOt5vI3wXMLs0I58UAb0Zypm/afnxx8n4zghH6onHDi2Au/6jijOBLvt0hGbyNxIu+sxwGGGHoZIe3U0F70NulZAFgg4AtuCZzucd6bNzzI0G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706175; c=relaxed/simple;
	bh=8Sf8D36ZLaWJrQxwKgGtTbraIQ4mqNJZMpaRAv9+6T4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qmgN3V+f6BTuIcsH6WNxZBFV+sCbnQkd6uF8Y99FpSSFYskar1ry5TlEhfdSx5HvLRbqQv4dokuzwzhEPZykFK4Qlt5DtJBJYXQO61HixElfg4h80pHdy1E37bfAPqN9cmrIrgbib/HtEUl3rt5jz3hEMJvNwstjlf6Uu49V6yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhCnbFW1; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhCnbFW1"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33c4252c3c5so460374a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706173; x=1761310973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+eetnSJdNq/Jy+XVIRFj+LNmAlWyhcd7FgKjqOeq5c=;
        b=FhCnbFW1LtFodoK4Irzhil4nfnH7axzWzS4tb+29nCiIw3FXYAY4MDOs+r1BHr1GiD
         eqQPmaafse2PzxmDqxg8P5I6ZInq7U7vi2AjCXuYc4eDtSmAxQHWKgGbMRGQUUIlQoYf
         Ge7skOd39/yy40XuFZHietKybH/ZQZ/OVyC3mk6+srFmnEQOAlf1NdV9TXTrg8RjWXHm
         CPM8ojOQte6y91B86pj4lV8XGLALfOcz4cZ/+2FALXkqjSk+iL95wb1DGocbOlujUNdr
         ewQaO17x5ynYjj1Uo5B711yOqBZkFvoNTRnhBiXjF8/AgTtx2HGd93RF5l5pOZVViVNT
         H+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706173; x=1761310973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2+eetnSJdNq/Jy+XVIRFj+LNmAlWyhcd7FgKjqOeq5c=;
        b=co41q5n1SJFBDYeWlxSNe0nkh4Th2UHPTOk6abcdc+Ys7oYGZ2XTdLYGQu0/q20Ruz
         7XPgH7cHvb4NO7CxoraYS9ekFZpI7PLMvB1OWO70ixofKpuHscV9zfbMlZ5OpryyETER
         1bqatzLIRrkdtPEN6IC/y+88zeMxUhgJqaE61TLpLnaMCt8T6RI2DAPDr/t+ETpHJudo
         MQPX4YcmsR+7PvLCRL+xXoWum/ydpzAwjfmvTnpvqfqAkUT60DUbG/zWYtPKk79laqI9
         nTM8RVxYBbwXfgUkPplByzlyHwJgTi9pukqm+vy3JY2eFtACThqEpwrXZRVmqV+dxC13
         PDZA==
X-Gm-Message-State: AOJu0YyAo+t1P5zvQaAa90a8TCH8CtDm+fFOMY+/wSnQCLY5zurwasgt
	gvkP8eaH5INWzEuABCGBD82srcMW37Imk3LZ0kAT12ofK9yMS5r+f8cW+SKn9A==
X-Gm-Gg: ASbGncut08AHH9W6LekarTgxrMRpoe53/mUDitsEwojweDlQC3SijdsjG9eICerjmBC
	zETfQhP0HvbTTuOZQrS++iQAPYLax/wlICp1IOSe7aoWsph/7OxOmth0H3Wiy4QYSESOePlxRcU
	UzkGqgYVq5r2LXepcd2tRU55mOtdLTGLGct3c3xa3qt6K6Acmf0R/yy+PkE5RG0ZI1TdbMNDZ30
	UMhYXbfZ97qrn7UQy2eFaJ003I4XSuP5S42J8+eahVZ6x8KfXMo2VQkGU/XQLAwfqMiJOTVEmW3
	dfW6iuLya3nACXZueihNgw/VMTUyRbOraoZwwhE+aSh0WLv2A1JBsdPt9PcrT7vQLHKSP7W/U6/
	13PHIQdju7ZCPTKii0yImXWhqmsU0WtmLtJnqaP0sNRepc7vwkht32R/12skULs5Yf6Df6fzjIq
	Twzsgwejf9Ojx3BZfMPO4qsOw=
X-Google-Smtp-Source: AGHT+IFcczgkOxeor7A1URfI25Qap6o13No4BkgGksfGSUGnQy/xiymwhzjZEFZyZuxnu8flIaDyzw==
X-Received: by 2002:a17:90b:3f0c:b0:334:e020:2f16 with SMTP id 98e67ed59e1d1-33bcf8800e9mr3972027a91.11.1760706173009;
        Fri, 17 Oct 2025 06:02:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bcfc12f82sm1269678a91.12.2025.10.17.06.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 12/29] hwmon: (ftsteutates) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:04 -0700
Message-ID: <20251017130221.1823453-13-linux@roeck-us.net>
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
 drivers/hwmon/ftsteutates.c | 84 +++++++++++--------------------------
 1 file changed, 25 insertions(+), 59 deletions(-)

diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
index 8aeec16a7a90..08dcc6a7fb62 100644
--- a/drivers/hwmon/ftsteutates.c
+++ b/drivers/hwmon/ftsteutates.c
@@ -12,7 +12,6 @@
 #include <linux/jiffies.h>
 #include <linux/math.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/watchdog.h>
 
@@ -62,10 +61,6 @@ enum WATCHDOG_RESOLUTION {
 
 struct fts_data {
 	struct i2c_client *client;
-	/* update sensor data lock */
-	struct mutex update_lock;
-	/* read/write register lock */
-	struct mutex access_lock;
 	unsigned long last_updated; /* in jiffies */
 	struct watchdog_device wdd;
 	enum WATCHDOG_RESOLUTION resolution;
@@ -98,21 +93,15 @@ static int fts_read_byte(struct i2c_client *client, unsigned short reg)
 {
 	int ret;
 	unsigned char page = reg >> 8;
-	struct fts_data *data = dev_get_drvdata(&client->dev);
-
-	mutex_lock(&data->access_lock);
 
 	dev_dbg(&client->dev, "page select - page: 0x%.02x\n", page);
 	ret = i2c_smbus_write_byte_data(client, FTS_PAGE_SELECT_REG, page);
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	reg &= 0xFF;
 	ret = i2c_smbus_read_byte_data(client, reg);
 	dev_dbg(&client->dev, "read - reg: 0x%.02x: val: 0x%.02x\n", reg, ret);
-
-error:
-	mutex_unlock(&data->access_lock);
 	return ret;
 }
 
@@ -121,22 +110,16 @@ static int fts_write_byte(struct i2c_client *client, unsigned short reg,
 {
 	int ret;
 	unsigned char page = reg >> 8;
-	struct fts_data *data = dev_get_drvdata(&client->dev);
-
-	mutex_lock(&data->access_lock);
 
 	dev_dbg(&client->dev, "page select - page: 0x%.02x\n", page);
 	ret = i2c_smbus_write_byte_data(client, FTS_PAGE_SELECT_REG, page);
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	reg &= 0xFF;
 	dev_dbg(&client->dev,
 		"write - reg: 0x%.02x: val: 0x%.02x\n", reg, value);
 	ret = i2c_smbus_write_byte_data(client, reg, value);
-
-error:
-	mutex_unlock(&data->access_lock);
 	return ret;
 }
 
@@ -145,44 +128,40 @@ static int fts_write_byte(struct i2c_client *client, unsigned short reg,
 /*****************************************************************************/
 static int fts_update_device(struct fts_data *data)
 {
-	int i;
-	int err = 0;
+	int i, err;
 
-	mutex_lock(&data->update_lock);
 	if (!time_after(jiffies, data->last_updated + 2 * HZ) && data->valid)
-		goto exit;
+		return 0;
 
 	err = fts_read_byte(data->client, FTS_DEVICE_STATUS_REG);
 	if (err < 0)
-		goto exit;
+		return err;
 
 	data->valid = !!(err & 0x02); /* Data not ready yet */
-	if (unlikely(!data->valid)) {
-		err = -EAGAIN;
-		goto exit;
-	}
+	if (unlikely(!data->valid))
+		return -EAGAIN;
 
 	err = fts_read_byte(data->client, FTS_FAN_PRESENT_REG);
 	if (err < 0)
-		goto exit;
+		return err;
 	data->fan_present = err;
 
 	err = fts_read_byte(data->client, FTS_FAN_EVENT_REG);
 	if (err < 0)
-		goto exit;
+		return err;
 	data->fan_alarm = err;
 
 	for (i = 0; i < FTS_NO_FAN_SENSORS; i++) {
 		if (data->fan_present & BIT(i)) {
 			err = fts_read_byte(data->client, FTS_REG_FAN_INPUT(i));
 			if (err < 0)
-				goto exit;
+				return err;
 			data->fan_input[i] = err;
 
 			err = fts_read_byte(data->client,
 					    FTS_REG_FAN_SOURCE(i));
 			if (err < 0)
-				goto exit;
+				return err;
 			data->fan_source[i] = err;
 		} else {
 			data->fan_input[i] = 0;
@@ -192,27 +171,24 @@ static int fts_update_device(struct fts_data *data)
 
 	err = fts_read_byte(data->client, FTS_SENSOR_EVENT_REG);
 	if (err < 0)
-		goto exit;
+		return err;
 	data->temp_alarm = err;
 
 	for (i = 0; i < FTS_NO_TEMP_SENSORS; i++) {
 		err = fts_read_byte(data->client, FTS_REG_TEMP_INPUT(i));
 		if (err < 0)
-			goto exit;
+			return err;
 		data->temp_input[i] = err;
 	}
 
 	for (i = 0; i < FTS_NO_VOLT_SENSORS; i++) {
 		err = fts_read_byte(data->client, FTS_REG_VOLT(i));
 		if (err < 0)
-			goto exit;
+			return err;
 		data->volt[i] = err;
 	}
 	data->last_updated = jiffies;
-	err = 0;
-exit:
-	mutex_unlock(&data->update_lock);
-	return err;
+	return 0;
 }
 
 /*****************************************************************************/
@@ -470,18 +446,14 @@ static int fts_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			if (val)
 				return -EINVAL;
 
-			mutex_lock(&data->update_lock);
 			ret = fts_read_byte(data->client, FTS_REG_TEMP_CONTROL(channel));
-			if (ret >= 0)
-				ret = fts_write_byte(data->client, FTS_REG_TEMP_CONTROL(channel),
-						     ret | 0x1);
-			if (ret >= 0)
-				data->valid = false;
-
-			mutex_unlock(&data->update_lock);
 			if (ret < 0)
 				return ret;
-
+			ret = fts_write_byte(data->client, FTS_REG_TEMP_CONTROL(channel),
+					     ret | 0x1);
+			if (ret < 0)
+				return ret;
+			data->valid = false;
 			return 0;
 		default:
 			break;
@@ -493,18 +465,14 @@ static int fts_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			if (val)
 				return -EINVAL;
 
-			mutex_lock(&data->update_lock);
 			ret = fts_read_byte(data->client, FTS_REG_FAN_CONTROL(channel));
-			if (ret >= 0)
-				ret = fts_write_byte(data->client, FTS_REG_FAN_CONTROL(channel),
-						     ret | 0x1);
-			if (ret >= 0)
-				data->valid = false;
-
-			mutex_unlock(&data->update_lock);
 			if (ret < 0)
 				return ret;
-
+			ret = fts_write_byte(data->client, FTS_REG_FAN_CONTROL(channel),
+					     ret | 0x1);
+			if (ret < 0)
+				return ret;
+			data->valid = false;
 			return 0;
 		default:
 			break;
@@ -648,8 +616,6 @@ static int fts_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	mutex_init(&data->update_lock);
-	mutex_init(&data->access_lock);
 	data->client = client;
 	dev_set_drvdata(&client->dev, data);
 
-- 
2.45.2

