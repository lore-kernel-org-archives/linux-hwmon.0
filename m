Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50312BAE8
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jul 2024 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720363663; cv=none; b=f7SFUbG91T7eG22RpDrlyqBkdfKe583/8m7+xOXWjGPBUkucAaH8+yNvSoaVbXeG3A/KV0bm7/glwDe9teetCY9U7AVUSVuLe2aU+oGnHT1r5HNXdwCepqwWIktXVZEC8vFMB/Rk+dd4JXGv9FVixgyRvnwT97hQLwuINEzsFhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720363663; c=relaxed/simple;
	bh=OwotWA2iEZm9EHtic7oOoo/bz6skHoHRlN6LPZFvBxw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DefVYLUo/ph0f2S7WM5UHt9EZ5aUdEMOhenyYfmJlUdO16K/Uci0kqMzQwtfIfL9XDIjMooncD+xP9rt/P3TFxmJnSYJcJpahJ0noCsjlZ6w+2sIxsTF/kncZLbnfEsw5d7+/zdgxYHQIz78W0ul66wOwkuqSUr3Ruome3naGe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7BT3wDQ; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7BT3wDQ"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-375af3538f2so13416505ab.3
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jul 2024 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720363660; x=1720968460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64fBQHR2i8u9oR3UY62ZgTI2mEitUHDWKavLr8Dpk18=;
        b=e7BT3wDQKXD8Q1ZvMcxPBcqwqADymwc+SZbdo3cOmscmhZZ70k4nAaannIdORAC+7t
         okwRrmDB0rrU/SXF52lz1l+TqJsvhnkuWFS0xHnC5wCKbOG3adUs+Auak9B7vtYXlLnB
         49FCOkKwi5dDE6bC7yp0JAMAlyyWSvhakr0TeQjqjC+F20f6kgJ1pziHQDM0xEicmri3
         pcCyLsS+NmBi/HEp0sbaAeYqvMtlECODbuOh9wbam7/N8XhU8m8o2VjdWEj2HV8xrPRk
         090tBTzWutv0+2aE6cMepVX1R1vjSwv8h/gtD9VU6RG4OQkL1ZuCVckY+rl6r5xF4Dyn
         fF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720363660; x=1720968460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=64fBQHR2i8u9oR3UY62ZgTI2mEitUHDWKavLr8Dpk18=;
        b=kjjuRnYQ5ZGb8vfZFEjWbm3R8zNcP4NXxrt4AEgmO6rfSZW7/lHc6BqNsIXwuGRvG4
         CoTk3A+LDQvdwEIo7/vJBb/fVuZJdJxNghvs57/z8X7hpO+pdHYGPP/+KMCECeQkKx4s
         mtBLhgnA9Of3kBvY+4IIkkgpS5UH2xHq+hOmBr4KYFm/hMsblXh97oK070oc9wMQS06B
         92xKTGqHyqwRqb2K1qmDMLSOkpDwhMT2UkG/isfynDGeFTRhpvpL1dBaLrp2YusRa3G4
         mm/B/2P3RXao6v9Kzzr85wAVrhNc7B4kEMDYjaZghNaP+fB3yHU6ru7mEDTqe4HaWx+P
         NBJg==
X-Gm-Message-State: AOJu0Yyjg7K29dwtqgGcauN9LleyhbUUHEcLEa225X5JH7l8f8thHxOw
	t7qttD9hQgHV/bC8+8uD5t1vpfTcrKt3DUWNydnkqhCtG6gUE98puf6k9g==
X-Google-Smtp-Source: AGHT+IH04wBcsepKQWIhjRmN5DDXUnwFdHQNyNwGndvu3r6YH9QVYqe1vv/IWrmImB52MezDXl4CKg==
X-Received: by 2002:a05:6e02:1ca8:b0:382:64aa:d8d2 with SMTP id e9e14a558f8ab-3839acbc2cemr133887395ab.25.1720363660049;
        Sun, 07 Jul 2024 07:47:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99aa895ecsm6467655a91.47.2024.07.07.07.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 07:47:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/4] hwmon: (lm95234) Fix underflows seen when writing limit attributes
Date: Sun,  7 Jul 2024 07:47:28 -0700
Message-Id: <20240707144730.1490208-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240707144730.1490208-1-linux@roeck-us.net>
References: <20240707144730.1490208-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DIV_ROUND_CLOSEST() after kstrtol() results in an underflow if a large
negative number such as -9223372036854775808 is provided by the user.
Fix it by reordering clamp_val() and DIV_ROUND_CLOSEST() operations.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95234.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
index 67b9d7636ee4..37e8e9679aeb 100644
--- a/drivers/hwmon/lm95234.c
+++ b/drivers/hwmon/lm95234.c
@@ -301,7 +301,8 @@ static ssize_t tcrit2_store(struct device *dev, struct device_attribute *attr,
 	if (ret < 0)
 		return ret;
 
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 0, index ? 255 : 127);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, 0, (index ? 255 : 127) * 1000),
+				1000);
 
 	mutex_lock(&data->update_lock);
 	data->tcrit2[index] = val;
@@ -350,7 +351,7 @@ static ssize_t tcrit1_store(struct device *dev, struct device_attribute *attr,
 	if (ret < 0)
 		return ret;
 
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 0, 255);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, 0, 255000), 1000);
 
 	mutex_lock(&data->update_lock);
 	data->tcrit1[index] = val;
@@ -391,7 +392,7 @@ static ssize_t tcrit1_hyst_store(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	val = DIV_ROUND_CLOSEST(val, 1000);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, -255000, 255000), 1000);
 	val = clamp_val((int)data->tcrit1[index] - val, 0, 31);
 
 	mutex_lock(&data->update_lock);
@@ -431,7 +432,7 @@ static ssize_t offset_store(struct device *dev, struct device_attribute *attr,
 		return ret;
 
 	/* Accuracy is 1/2 degrees C */
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 500), -128, 127);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, -64000, 63500), 500);
 
 	mutex_lock(&data->update_lock);
 	data->toffset[index] = val;
-- 
2.39.2

