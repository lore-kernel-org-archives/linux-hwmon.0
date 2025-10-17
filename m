Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609CB2E6CD8
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706161; cv=none; b=A3Mdznv+dAGwCUmx3qeCEe0BEXFI3shn3FJ4qOlq89oj8WPZaPHNkmLB/B3SB2uNMzCwhPKkRA7LzNmDIJ1eXc1qi737rMmXZbFHynPFf2BzxKWXBjbiLoF2AGmQNu4lkkhWMVugRBO0KGFARE9Wgocp/P8XZsUQWGFC3D0864Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706161; c=relaxed/simple;
	bh=XMtLA7byB4h5oYrgrErCYzApYxz7G4msQvib1t1ovko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOJk4vK31cKOVghfei6zhCRmm5iD/Bdq7ldYM5ijeR0ljh7HXCZBU/lUta7m2aI8aXMpMVndrzSJ54Y6Ek75iIiZYe/njkYfVb1j7p1xlmowTO6sDxacmFoSKHAyqXwC9+AGPox9wPDgQr5oPiawdSwYdwUSkg22NxjqUwG4clk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJm75p0P; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJm75p0P"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-273a0aeed57so39113465ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706159; x=1761310959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vzw/IZffxrrFS+a00DJ/v9R/LiR/1OI63z4W+kVwnEY=;
        b=RJm75p0Pyc6toocoF16A4VU/M7ARHhAlFR2wx4M9+oyjtTh+CMdPE4K3xUr4/zC3xb
         tn0iBodn7e3QbzFMFwYOwU+uq0mP7cS3kInLu0kjd7Hkox/dbW7k+YzLK5A92U71OLLn
         iMIBqJRz9xpvdtVgZ92oIqm1TTs2nOx+lOqBuYLt685tDIWsZZA3yOGVPbiyTvab5c4n
         3RVyHVSpyeg+KVPIUdLJNOn8uDbSK1jkdJaarQ9thZMG2UeRqbKykE0ykrwtT5/9OhmZ
         YpPWfFRfaKtMKeDJHjXZgRBNpaSQqbp22dDtI93dnlusn0v5hoIUYIz//eQjnV7Tw9yP
         igGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706159; x=1761310959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vzw/IZffxrrFS+a00DJ/v9R/LiR/1OI63z4W+kVwnEY=;
        b=HTKC8o0ITZKDZP7joz7j3j2NQJR/ivnnmf/zcHSI+CyLhmE0F8VYYsaDyJex398qYI
         Gyz7vUTK5jIBykSixVceFD5spXvDxYhzRUMr1I/hcGiRelgVtsoPw55aY8zfuT/mb3BY
         AjqVrCyhotV3qfnddLluPy63SGu/PsUeaKJo8/7nQeJmD1LSk6zPXicWbQ9xijte+NWc
         iNBkcQBoQ5NG0EYPGEGApylpvj/kXnsxx3PdxVDIDF32XtMA+9AL7zm8IGxeejDxQl9M
         iC12q2+wbf7lRS5/5e/zrTkFlzzWUriQI0QrK+ukSDGyL+nXDiAS0vPEVY3ugKqCHubn
         PFGg==
X-Gm-Message-State: AOJu0YzefXgge/Il4B7zlhINknf+aRANiuLbszl0/4bXh5L4MVtObOI3
	1o/0eBPBh9t2WiuOPPe92BTRf4ox0UTqvxtzt5WL7j0zd69HtGdhFHI9eCOrBg==
X-Gm-Gg: ASbGncvLJt2AIcpd7uQkX2fzsq5ybLgH/B3ymHRyIvDCVLj1fTn7kGN6UA3MNqpbGb6
	n8ZCtSdX1ica2Pa8Qkd5cx2kh8FTnc7lpwW30ncssH+ZGMC5SHDO9+wr8vQSX1A4oNPBTS+vpzh
	zsum4MVTGqrbrufHQnTR5ftvDvaDFxQYl/uT+Jna24Hfl3B5OX+gMwwQd75TQ0FOsYrgnBrdCV0
	VGE0T1F/3TDz41blVxGHKyjlTVlwuZvzH2+a2sh26lnr4/wmggkprcFJNV+hE8bL+wLv5fdbCTH
	Nwgyc4AOLE7GZELTzD9pxwND/IOa2Y6h9JpqeqzGLfe7t/kwn4LPBiyWiVWDkO2vDV2xpDZzwuJ
	s9xz9KXFMLmSCQLIH4BgsJQulmCCib1/bxZLKiroAfspEtkFCOPzBSPgN/pmTiXkrmZOdb+oiyu
	yWWtTvLyON8/NZYm9y4XGwZlk=
X-Google-Smtp-Source: AGHT+IEveGbPBLn+Vs/VMqcU/aiAM7tx0j/iufks0KTXSN8Lm2L1Zs4s6DjGSrWrWjdaqT1c8e5V6A==
X-Received: by 2002:a17:902:dacd:b0:282:2c52:508e with SMTP id d9443c01a7336-290c67e981cmr53658905ad.8.1760706159128;
        Fri, 17 Oct 2025 06:02:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099aba99asm63295235ad.87.2025.10.17.06.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/29] hwmon: (sbtsi_temp) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:01:57 -0700
Message-ID: <20251017130221.1823453-6-linux@roeck-us.net>
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
 drivers/hwmon/sbtsi_temp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
index a6c439e376ff..c5b2488c4c7f 100644
--- a/drivers/hwmon/sbtsi_temp.c
+++ b/drivers/hwmon/sbtsi_temp.c
@@ -12,7 +12,6 @@
 #include <linux/init.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/bitfield.h>
 
@@ -52,7 +51,6 @@
 /* Each client has this additional data */
 struct sbtsi_data {
 	struct i2c_client *client;
-	struct mutex lock;
 	bool ext_range_mode;
 	bool read_order;
 };
@@ -94,7 +92,6 @@ static int sbtsi_read(struct device *dev, enum hwmon_sensor_types type,
 
 	switch (attr) {
 	case hwmon_temp_input:
-		mutex_lock(&data->lock);
 		if (data->read_order) {
 			temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_DEC);
 			temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_INT);
@@ -102,19 +99,14 @@ static int sbtsi_read(struct device *dev, enum hwmon_sensor_types type,
 			temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_INT);
 			temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_DEC);
 		}
-		mutex_unlock(&data->lock);
 		break;
 	case hwmon_temp_max:
-		mutex_lock(&data->lock);
 		temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_HIGH_INT);
 		temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_HIGH_DEC);
-		mutex_unlock(&data->lock);
 		break;
 	case hwmon_temp_min:
-		mutex_lock(&data->lock);
 		temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_LOW_INT);
 		temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_LOW_DEC);
-		mutex_unlock(&data->lock);
 		break;
 	default:
 		return -EINVAL;
@@ -158,15 +150,11 @@ static int sbtsi_write(struct device *dev, enum hwmon_sensor_types type,
 	val = clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX);
 	sbtsi_mc_to_reg(val, &temp_int, &temp_dec);
 
-	mutex_lock(&data->lock);
 	err = i2c_smbus_write_byte_data(data->client, reg_int, temp_int);
 	if (err)
-		goto exit;
+		return err;
 
-	err = i2c_smbus_write_byte_data(data->client, reg_dec, temp_dec);
-exit:
-	mutex_unlock(&data->lock);
-	return err;
+	return i2c_smbus_write_byte_data(data->client, reg_dec, temp_dec);
 }
 
 static umode_t sbtsi_is_visible(const void *data,
@@ -219,7 +207,6 @@ static int sbtsi_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->client = client;
-	mutex_init(&data->lock);
 
 	err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
 	if (err < 0)
-- 
2.45.2

