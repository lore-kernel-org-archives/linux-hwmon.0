Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCED33031A
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706174; cv=none; b=by3IzY5uQdrxIm+N58esbQ+NdUwJ8aIYbXPO8FR8+WLvsp+2KmRI1ZW8n67P9VfcoyQ4xa9nX0D951mz2f5JD9REYOPb/d9WGGMfhAWFvrr/Jofi20YGOR9mxh7lHK/86KDKK8j3qmJoffAbdIo99xTS5NB47yt3hKayphszL9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706174; c=relaxed/simple;
	bh=Xm/77fTnQu8LN0m5JhnzYdb7UvNjfkexhsG/fEHngFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQlaD/JwukC3aCZ+wegbSZg9wBFB3H7bb3x0WCrkUvGb6VijZSM75rIcwSmO9JLQ2Sy7aZSD4ruvPSS3dTZu5s3Nf4WcnqHjAdv1g45UM3sb279y13ASornQUUpuDF9H66+RQ8Hfcd0Xe1QI4yom17O5FSaEu2lDhl6QP4HHe/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arUZ5kJT; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arUZ5kJT"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b5a631b9c82so1258985a12.1
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706172; x=1761310972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtrrzjSr1dpzfnpTAC9wcY27uSluZFbux5Ldi3YLkQk=;
        b=arUZ5kJT97t6hMO6D5j2LTruCOf3ULxldA6sKWAbK7KTlIAnZPWDK++jmoUYVbkQtu
         4QNXX+Yw+flkY16wsrlotdMLmJxS0zcq282g+wZHH4I0A7gEpwI7vwJbOjsIOu13fp0X
         31cquvevlJpS4CplkNc1IPlz3E5VRd2i4/BvfbtvzZjNR3STCFw5+CUTCufue4a20qKx
         O64Z8s/lHxHwHzEjXfCoGRHZtte2IeqTfhMsjE6jqypC6XIIxopCmpigBcKlNNthDcmV
         GPFQIjVfUbuYnjbEpN3Ck/a4IYeVJXjxT8ItYs75ENGRJGCCXN1ToaXgQd5naCqQuf0J
         NV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706172; x=1761310972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UtrrzjSr1dpzfnpTAC9wcY27uSluZFbux5Ldi3YLkQk=;
        b=ZxOc89RX28z5Rn8mg85fSbdpmclYmKoP5wE1Vl8rrdxfzy9Sift/j60P5hh7EwM8k0
         RTTyJD1OhChPaBJBZVHG/bbsOPuKahor6o+XqZBXTAqdaw0u2WuJdnLfj/MkTM4t5D3Z
         AlEh8adWwKWU6OY9Px2AqeCyHwMoYZy2IXzRElZzhlqulBqYfdzr1/k4e/s8jK4LVRrB
         /7BL+nJHOS+tU73trXvxiXryiSAw6H4W/ELot7cjwM7FDTselclqhsaRtlLAz73qB2l7
         CaNk2GPtwoGXKfJYnxbOC3t6YfAjTIEHBZOVlOhkBKgjld1uSt1BHE5SAL5YNF8k1nzB
         TbYA==
X-Gm-Message-State: AOJu0Yzu+6mmv9HZoWOiMfnVqlv1WhVKcnj+2K54c93205LskXq3IVtm
	BhEFG8wy/2vQ11WVYm6sz+8eRPqxtVIlkMYNjMZHVhur/oQyjmMsL65pmsenGg==
X-Gm-Gg: ASbGncvcMTsRgJEYr3UNej1JwMyeDrT39Qc/PSD070SfCdzCKcrtrZU+W7f6ZC6k8v2
	IwXjaFYBhuchOqbj0EKWlvteNfUxqXFhAxB8PfMlfh0ExwN2p21hvzpnw7ege1Yd8dd7RpH0jmo
	3R8DsT5BTi6uJlp7Y6bMCFbJ106C4cKbJbup782fDJih9yKbQ8HmU2ZQ/l1x3VrB5bSGquBE5pa
	LExniYMYMKS6GuGk42M/e6DnskoiaVKzkBY3NdYPfAw9bwxOHzoUKREGKpXmRWgWe9a8ZQ9VtZw
	WpKPPgnbMfa+d19C8ussFyESvgOsAPDIEjQDPKUl51HgnHrNivmH+qEV9AXNl/syA3PPFdhJX5z
	OvqDl7TcDWHhmg4RREhnHTnAog5oWez0FK12vet+lsCkhbS2G6O2MCfMGozkiGfk+1v2LOFJEua
	m/xgaHgRtT6+0cMU8DurWj7UA=
X-Google-Smtp-Source: AGHT+IGoJIlYZFe7DJ6YWxomwrdXzfeMHe7rMcMsN8ORrEm5ik9MA5cybA7jj8oNRRs1DixfKbirqg==
X-Received: by 2002:a17:902:ef4f:b0:27d:6f49:feb8 with SMTP id d9443c01a7336-290c9cb51f9mr48625545ad.16.1760706171523;
        Fri, 17 Oct 2025 06:02:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099314ceesm63824525ad.16.2025.10.17.06.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/29] hwmon: (powr1220) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:03 -0700
Message-ID: <20251017130221.1823453-12-linux@roeck-us.net>
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
 drivers/hwmon/powr1220.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
index 5f9ca6543530..06a2c56016d1 100644
--- a/drivers/hwmon/powr1220.c
+++ b/drivers/hwmon/powr1220.c
@@ -16,7 +16,6 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
-#include <linux/mutex.h>
 #include <linux/delay.h>
 
 #define ADC_STEP_MV			2
@@ -75,7 +74,6 @@ enum powr1220_adc_values {
 
 struct powr1220_data {
 	struct i2c_client *client;
-	struct mutex update_lock;
 	u8 max_channels;
 	bool adc_valid[MAX_POWR1220_ADC_VALUES];
 	 /* the next value is in jiffies */
@@ -111,8 +109,6 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 	int result;
 	int adc_range = 0;
 
-	mutex_lock(&data->update_lock);
-
 	if (time_after(jiffies, data->adc_last_updated[ch_num] + HZ) ||
 	    !data->adc_valid[ch_num]) {
 		/*
@@ -128,8 +124,8 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 		/* set the attenuator and mux */
 		result = i2c_smbus_write_byte_data(data->client, ADC_MUX,
 						   adc_range | ch_num);
-		if (result)
-			goto exit;
+		if (result < 0)
+			return result;
 
 		/*
 		 * wait at least Tconvert time (200 us) for the
@@ -140,14 +136,14 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 		/* get the ADC reading */
 		result = i2c_smbus_read_byte_data(data->client, ADC_VALUE_LOW);
 		if (result < 0)
-			goto exit;
+			return result;
 
 		reading = result >> 4;
 
 		/* get the upper half of the reading */
 		result = i2c_smbus_read_byte_data(data->client, ADC_VALUE_HIGH);
 		if (result < 0)
-			goto exit;
+			return result;
 
 		reading |= result << 4;
 
@@ -163,10 +159,6 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
 	} else {
 		result = data->adc_values[ch_num];
 	}
-
-exit:
-	mutex_unlock(&data->update_lock);
-
 	return result;
 }
 
@@ -302,7 +294,6 @@ static int powr1220_probe(struct i2c_client *client)
 		break;
 	}
 
-	mutex_init(&data->update_lock);
 	data->client = client;
 
 	hwmon_dev = devm_hwmon_device_register_with_info(&client->dev,
-- 
2.45.2

