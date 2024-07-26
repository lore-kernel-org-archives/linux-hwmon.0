Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E592143C6A
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 22:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722032176; cv=none; b=ft9Zj1KSQXLdOv5rMuBFG0WWYMEdwh/q3k/4Ncbjx9jBu+4/PpoQuLPV+CA3HhVHmEn+ti/Pmh/5hQigS2owm3J4tHJNxOZp3rn3yhz0a3xemZegO+mvobWrvzi2PJ95hBAalefk/fy3HVX1RbGcrxhNXUu118kEhcfK2eN/VeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722032176; c=relaxed/simple;
	bh=5Eb/dktSz2cEBHHZtJSYuDYfeV+KYI18S2QFetkCMGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tDWR3MIC89lHoScVZ0k/PUgav2t5tRg6rwPbJ+7xbBssqDdfazMbQZUTv/4/V+fyNWYwJKV0X3V8UO+IE7QOxF2mwEExtTddSo+519DwoisRj9STgigIh+piGu5+MlUQoXppbteMk+cXKBT/L5iJFh16+qIsYQw5fBe8KG1MmgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SllzHeb4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SllzHeb4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fda7fa60a9so10421835ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 15:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722032174; x=1722636974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0W6/TSHCMutZOKNlnhzgug6EeVBwor+VPANFIfSeEQ4=;
        b=SllzHeb4DEFI9zr7IOGcPhPbryGXg/pJ7SkAI4cmDE197K6528RQ9NYARkECDXyA7f
         IkhztcwEtKchoYG4/1RmrXZUhST3bB3rIyV6r0yP90vm1NZ+a+w3NrE4D5aoJMZ2HEen
         XM3KMKg3c2eH/pe24ZN7sL3KmdVLADLEADXWSDLEkzoH50ktcJhupVhHmzDEe2Ynzqh2
         czIJSDlVExIrWAGCbuLoUZHqfSKoC7kWsEdOJaZK1Jb2zkCgG4EH5uICuEokulke1SOt
         KeQIC80shDsQJzHHlpa8q2l3Od8aaKbizJCADOgyLuIxyEOQ1M1mNw9XYh4rqVNQ7iVE
         BKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722032174; x=1722636974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0W6/TSHCMutZOKNlnhzgug6EeVBwor+VPANFIfSeEQ4=;
        b=pW1bKII8tIaOg+a8828z38RGBbh2A0KlZJck2pyRS5QPEqE5fCet1BQvFNz+hZvFni
         TuoXS8Xvaisoc1ruL8Qj7z2svDG7Ns09+XZnSHpQ71DyFKXFuGRpW3MMK59EoXbv4OHX
         sHGJWthw056xyxc8dFVNolMQBin4IVhzGGNd9pMfEQPlO2eGBlzbjuclVahgxObkj42t
         NXOR3UVP4kkR3ABbeCehlVRqZysTvfRSQTqHc2RV0cWjcUVd0MIxBf4x2RqvZ88QxKYk
         2L8VN9knCL7XXrVuPHRDhLByjFzCa67HRmE51kLI9N3mnTWlFTMG5w2NAn4HwnUYqxXq
         ro5w==
X-Gm-Message-State: AOJu0YwS8Tw33XMltqoqUjnGCp6h8ZGpMUbH4nwzvVlqMquMVRLLeFeH
	npoBW/Fbf9z1meRNLPcFj44wU3fhKv6cO/aeF6ofKvGNUD2SCVoldzO+9g==
X-Google-Smtp-Source: AGHT+IFmaeJiJDJ4fiVgcgCCN57U0IvzPMrAvsD8KKxR8aw5aDe3XwGrrmWBm0DMLkarQrkNVM35ZA==
X-Received: by 2002:a17:902:ea05:b0:1fc:58fc:caf7 with SMTP id d9443c01a7336-1ff04808f6cmr12328655ad.14.1722032173963;
        Fri, 26 Jul 2024 15:16:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ffaa10sm37810645ad.303.2024.07.26.15.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 15:16:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 4/5] hwmon: (max1668) Replace chip type with number of channels
Date: Fri, 26 Jul 2024 15:16:02 -0700
Message-Id: <20240726221603.1190437-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240726221603.1190437-1-linux@roeck-us.net>
References: <20240726221603.1190437-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only difference between supported chips is the number of channels.
Drop enum chips and list the number of channels in struct i2c_device_id
directly.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/max1668.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/max1668.c b/drivers/hwmon/max1668.c
index c7eae28c0b01..f8180a8597c0 100644
--- a/drivers/hwmon/max1668.c
+++ b/drivers/hwmon/max1668.c
@@ -47,12 +47,10 @@ static bool read_only;
 module_param(read_only, bool, 0);
 MODULE_PARM_DESC(read_only, "Don't set any values, read only mode");
 
-enum chips { max1668, max1805, max1989 };
-
 struct max1668_data {
 	struct regmap *regmap;
 	const struct attribute_group *groups[3];
-	enum chips type;
+	int channels;
 };
 
 static ssize_t show_temp(struct device *dev,
@@ -391,11 +389,11 @@ static int max1668_probe(struct i2c_client *client)
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
 
-	data->type = (uintptr_t)i2c_get_match_data(client);
+	data->channels = (uintptr_t)i2c_get_match_data(client);
 
 	/* sysfs hooks */
 	data->groups[0] = &max1668_group_common;
-	if (data->type == max1668 || data->type == max1989)
+	if (data->channels == 5)
 		data->groups[1] = &max1668_group_unique;
 
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
@@ -404,9 +402,9 @@ static int max1668_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max1668_id[] = {
-	{ "max1668", max1668 },
-	{ "max1805", max1805 },
-	{ "max1989", max1989 },
+	{ "max1668", 5 },
+	{ "max1805", 3 },
+	{ "max1989", 5 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max1668_id);
-- 
2.39.2

