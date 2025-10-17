Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9787D33031A
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706178; cv=none; b=fWhyfnurVVGjBLeh0VV4MHTAdK2XMqPsCOdf/fI6dVL5YjyF88k4ZWVA68vSrd2Yj06/ISqLPqBwVk0OmRncv9SGn4EqA7QTRkkmIQACWe0coHrZkt+A69a2c73XSXJwQeCdsEQb6P+qjG8v3XfVjxVKzAqrM+sIQi0udPKBkFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706178; c=relaxed/simple;
	bh=l76COyJtbwlzqr92ckcHfVUPBKNbj4IVuiwhag1jao8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fmbgK4g9i4gzqBQj9/o66HxdOAZnDr5w9yWVDXKwOR1IAw4Nk/272w9tAej55xNgrfuIPWVDVddfSCAwvN8bOLmK9R5CLS1/PxIVZ4DMzW+j0nZuDbWwYGBtEY965xsG1nNfObR8iuckRTsqjJ9BeZK3k44aHYtTQJnz5Hg56IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kytulJ/J; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kytulJ/J"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7835321bc98so1836334b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706175; x=1761310975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/3M4r1uVuF01TT9kaJp0vYBZzTZMEuTDO1kBW8/94Y=;
        b=kytulJ/JIsPHeN62f+o3PTZIze+uWL+kuGeGP7cmLAYmBvBWYLEG0vHIFiusSrifgq
         eZmHOWpa/gVd8K0R2MIDsCA6/gqgfdt2i3XyXsL/1wsPD7Uk90o7jtknmR98KHpJ4zkn
         R0kTKDKS+lT5EJK4IguciGr7VfuSM4Yx/60v/yeNlF0BxiSOTylTQnDt7atOVPyopnFd
         o+bjXv+fQfkL9FrYGFDD5SYaL9813k9ly6hGyUCKYZxlX9oly0yr1WRjOpZl3d2i+WJm
         LN/9kFq7yjmm+IyHIKoCq6GTgznmeO75y+1ErFiuYIAViQn6AxRN6ltjHoCRbeM7+IKf
         FwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706175; x=1761310975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/3M4r1uVuF01TT9kaJp0vYBZzTZMEuTDO1kBW8/94Y=;
        b=UpSZ5fMWEqDvIeDict/zX697rTVMIyxdDuNUbfbNx3R+iSkvi9yhOlMUj7oGNNYebc
         cYCAmbpoRYOafnFg1y1vIYNmqD8JAIM8mG8UpaOJZIlKskI7G7+93x8heqhszzF5F9j9
         8TVSxtLH8VqI0nzxQJMAQZL178z3NLpB+jl3Dqw1lYT+BE8iVBLHURNmLOrODSWjFBxu
         eY7p7demG++pZjlekI5fVtlu8oQUWSPxYAn/iVeJXOhS3FXT/TA40jPs7soVN8/2kUa7
         T7pLOjaKNPcg71e69opVi+ETfLRe8A/ecvsetbRBGD+ZmYe9wzVlwUBMDZOgFyaZGYMK
         WtIw==
X-Gm-Message-State: AOJu0YykuADB/pLtzBj5epanvBDnjC+bwI8zaRaZwFC9AmMhw9XQbtnx
	V99Voxzm7xm19vBc5fZfURcvCAQyHITD6tRzJbAcnygfWa+cxq07y1sTbS+RIQ==
X-Gm-Gg: ASbGncvjYxV9jTf9Q8Oup9mANZCzGy9U/Px1Z5N3PqE6Suc0m2Ppx+QYooYtjk0l1qz
	6U8w51qeRa4NDS610leiMu7NSFM6FucHTblQwGjO8Apu3h3yS+Zu9xX7Q2DX5HUxFYv0basfAdn
	s7NA7pP2OGqavknIr21JPlxnl6IItm3DyYH5qhjzdwSvlAjVykoqsl6qtwWnaBYMfcl4ksYA7t7
	n+wL16YdX9aSGaQsnQ+zUJlr2a34mG88oTFG/HZENppJCLEfPYMrcKxTRqtN1Wb92l96urUdyC3
	jwE62WBRe/7XqeT0hRSkWR1IzsCMOUmFjAclRc+P6N6zoQA0qCITj1x1NjKt7D3iZqee7Mwu4Ja
	sMmLNqsS3x0Jllo/PL0wEIifbWE90CS9ZkSHtCqcgmzR0tcY4IUg4KwWMR1frDQm2nFWvibJvU9
	3taoUp8CyZ4YUEArdVyw69pt4=
X-Google-Smtp-Source: AGHT+IHkn34rUUFZ8sY89SrKvCrMR1gygn7pAt++E4XmG3a0YOaK4ceZgw4gtygN9OTTKYuoXYQSzQ==
X-Received: by 2002:a05:6a00:1808:b0:78a:f45f:8740 with SMTP id d2e1a72fcca58-7a220b16a0cmr4491258b3a.19.1760706174649;
        Fri, 17 Oct 2025 06:02:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bc12a8asm25667370b3a.34.2025.10.17.06.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 13/29] hwmon: (ina238) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:05 -0700
Message-ID: <20251017130221.1823453-14-linux@roeck-us.net>
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
 drivers/hwmon/ina238.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 356d19b7675c..ff67b03189f7 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -117,7 +117,6 @@ struct ina238_config {
 struct ina238_data {
 	const struct ina238_config *config;
 	struct i2c_client *client;
-	struct mutex config_lock;
 	struct regmap *regmap;
 	u32 rshunt;
 	int gain;
@@ -607,31 +606,18 @@ static int ina238_read(struct device *dev, enum hwmon_sensor_types type,
 static int ina238_write(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long val)
 {
-	struct ina238_data *data = dev_get_drvdata(dev);
-	int err;
-
-	mutex_lock(&data->config_lock);
-
 	switch (type) {
 	case hwmon_in:
-		err = ina238_write_in(dev, attr, channel, val);
-		break;
+		return ina238_write_in(dev, attr, channel, val);
 	case hwmon_curr:
-		err = ina238_write_curr(dev, attr, val);
-		break;
+		return ina238_write_curr(dev, attr, val);
 	case hwmon_power:
-		err = ina238_write_power_max(dev, val);
-		break;
+		return ina238_write_power_max(dev, val);
 	case hwmon_temp:
-		err = ina238_write_temp_max(dev, val);
-		break;
+		return ina238_write_temp_max(dev, val);
 	default:
-		err = -EOPNOTSUPP;
-		break;
+		return -EOPNOTSUPP;
 	}
-
-	mutex_unlock(&data->config_lock);
-	return err;
 }
 
 static umode_t ina238_is_visible(const void *drvdata,
@@ -757,8 +743,6 @@ static int ina238_probe(struct i2c_client *client)
 	/* set the device type */
 	data->config = &ina238_config[chip];
 
-	mutex_init(&data->config_lock);
-
 	data->regmap = devm_regmap_init_i2c(client, &ina238_regmap_config);
 	if (IS_ERR(data->regmap)) {
 		dev_err(dev, "failed to allocate register map\n");
-- 
2.45.2

