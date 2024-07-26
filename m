Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E852368
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 00:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721954621; cv=none; b=nm2fO7Y5TXp7DUVGD5DHin5dcq9oWdvrU6VpVbKY7t13OC63e5Lps9gEFzUUaaU9nXGognBmH/J4sbvKkOdRgxIi9rtsLc214e75h7B2l5xnkZ6AwqBBbVd7GwAIaAlQvWLnHoEuyg3LCxrgfeH6W12/rVMb/6rBO9D56PPRNzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721954621; c=relaxed/simple;
	bh=T0RsmXJPUlgEEvSy2H7bz0v+bSp3+bX61Je6KEq/+N0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z8foVkQNmbCrfCU2d4LxcmNUam0Wif1OTWQ2hI1L4QbLYtIz1gd1UWS9/P470u7ElEXg0YS9ww52gn/amKZy26Zcc4nvVwj4g0asyldNQNOqDzStpjTM4UFjzfZJYzpoXoQR59ZF6nSamKmGGYdXiTA0Y8pEs29tdvBjUeO7LWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIVggO3A; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIVggO3A"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fc6ee64512so1338815ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jul 2024 17:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721954619; x=1722559419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrVbaCcus6wpRkj9Yd4FLW6PkRhzF3be0RsLbmirXBI=;
        b=mIVggO3AOTPqD8G9LoydItM3JZiT0J1X7R8K5JULF32C8plgVkOHUQpdvwm70/ufcC
         rjaC8WndclX3/EdVrqOktdfOMkx8eoNF/2KhuAW3b05XQmjAQ0soScQ6XEuISyFDAFrG
         uJ3FXdUkBozHCaxqE1gAMvSwZW8ofDWQ73I2Zg2OTdOQOwHCcIstMkYxBOwwdeiO5Afj
         gasRCIYVxwhUCoOJUfjyLdYqyIgpIbsMAQ5i3Pv6tINq7sjm9TqqZI5fLKdfbsc1Ygjk
         4FtEvV9iMTh39A8fCL8sTVWx2Rc7oNL88f9P0BIFBlwXaFgA0nrvq8KLdkuCOgR7dv2G
         U3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721954619; x=1722559419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XrVbaCcus6wpRkj9Yd4FLW6PkRhzF3be0RsLbmirXBI=;
        b=KkfSkDZe3rEmZ5esPMXNEUa/8a38wI74LCdDq0hHuRyxFtJ2RcePQ0jxaD8yLgC83M
         17MlHFUBqe7KH8Uv5+lJAbfUO8XqOFwpD3fGil/lTTm5vAX0nnBI+rwSpH6Thaavbbtr
         0YQX/KRvxQaNhJ73oWxkhstZMkfr/BRlMK8zmMZjrH1LVrSMeK2gZfjV03tzViksEbPV
         q098ssfBstI4Mky5kgbFu8O3sjBWKQqyEAo0BxLK8dai8LRx56sqgMSZ76lNXYNBVvsI
         UtPQK+WDL3NU3zGUxkoGQLu66Sr3/uTYiSnpHYvUqaooin84svR/M4bbI1qLGKAyLx2x
         nVDw==
X-Gm-Message-State: AOJu0Yy7QK3uPF4U0kYN+T+PZEXcQzlpBuCUo68dW4Q79R5y1aikhplk
	VXwjpVCOqnMcuBaSLhy0G39aeLSLZR0AwUlTB1xK8tYf8GwkCTzOSWdupg==
X-Google-Smtp-Source: AGHT+IHkIPjSA5PrOMNSAtjGn2PX+3lJPmAW1mSTqEh3HKfqFewi92j8vWb2oxeTACHPT8eS/uudDA==
X-Received: by 2002:a17:902:e2d2:b0:1fd:7520:fea6 with SMTP id d9443c01a7336-1fed924271fmr31412285ad.23.1721954619354;
        Thu, 25 Jul 2024 17:43:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f9f43csm20078965ad.257.2024.07.25.17.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 17:43:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/5] hwmon: (max1668) Replace chip type with number of channels
Date: Thu, 25 Jul 2024 17:43:28 -0700
Message-Id: <20240726004329.934763-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240726004329.934763-1-linux@roeck-us.net>
References: <20240726004329.934763-1-linux@roeck-us.net>
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max1668.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/max1668.c b/drivers/hwmon/max1668.c
index 48f247ca5d85..071c17604131 100644
--- a/drivers/hwmon/max1668.c
+++ b/drivers/hwmon/max1668.c
@@ -49,12 +49,10 @@ static bool read_only;
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
@@ -393,11 +391,11 @@ static int max1668_probe(struct i2c_client *client)
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
@@ -406,9 +404,9 @@ static int max1668_probe(struct i2c_client *client)
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

