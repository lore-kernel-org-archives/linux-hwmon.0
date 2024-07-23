Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9AC131BAF
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 00:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721695936; cv=none; b=hOwSjJKyKOM4Jr6V+MtXTgUQnMKbqd/o1DImmwArIsprQ+uHYWwq+UrqxoU3qLzHqshh0AZGWLvyUAITaNMdrGdfK4MKp9jV2rSEzSRwV0gL2xomUjqpsOiR/fp0OVDF0DzS5fQZVmy/K+36qjmn01VP+4g8D3Sxfm4bDqtuEIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721695936; c=relaxed/simple;
	bh=BHZB4L5lNzrboAlkDVv/pos9dKkQxocz+wUb+KT8Pto=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ewh+Z+WjMTJJZblWxlGDm7QQvJUhzUDQwI3fk6MsjrXJbjN7KdvzPgIA6YIzVkA7EotabBepjod+LuSjITDB73MF40MnRNTX40td90dYLtPXxBhRyGApB7Esa6sp6zvMtk3GlRJ1Cuk+Qa3KN80NsEw4YBJfPsdrFVlx69966vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANIW2Ib5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANIW2Ib5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fc56fd4de1so2113985ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 17:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721695934; x=1722300734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHQEhT1ez21e4J803kL8dmYORJYup/GJSKEllK+ooms=;
        b=ANIW2Ib5dW6QSZ9eisQDRSkKcX1bBYC4qrphC2+YXIJnI2EwqN38AmcDDytw9ChHcJ
         zoyBLiSoOEglXZkqAmzBZWtjFrLnmViinGRghCPCYS6QyDM5c8ZPAKkzKMsaHAxWbvuZ
         aGsaz4j9loJvZW9fc0psA8SF1LRDkMoTJG/ohAhRkEhLqVfP6j1m7vNkKdysQtWnKHNN
         0ok6QsqMia7gFcA3GWqhJ5xdu4GR8xSyFYQe1907I6Xql1Nh1Ms8Byc75JC5xHqP4i+/
         iAEYtnbGT3IsexI30lW6aCUPs0J5Y8+Ty0rcYZ8MJ87K8UmC7fZhGUazF/MIHBF9pqsZ
         dSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721695934; x=1722300734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KHQEhT1ez21e4J803kL8dmYORJYup/GJSKEllK+ooms=;
        b=ZZQyfHn5gz0hulihkFJXftvsJ0j4WI/liKZx1+kjrte/ke0KF/T2p9fxQPBLOixpIG
         nMG2tlMzZ+kUliNEHETxZQdJgmyhSaTnqaUtP038GgKD0BqVyRcGBDYrjojiFadhH14z
         kprtmu0hhVyHhVMtKoRx6OfJcA8FrU9vo7bXbMQ3NnvzOu1v4mTt13qeeo6d/h7eMYX9
         axZmwwbmMZMH+Rym8fhLwTs3micC5+UJsjmlgTsIPeRZsbQXBAGr+ssAVZHd5kjqhMFo
         lOZ2FhnxgZv8VHn0EicPNk8Zt7apx9EgfsuCuCJn8zUaT45z05egWWt8RQ2vmlA6VMSK
         /TzQ==
X-Gm-Message-State: AOJu0YzVdqoe54BIR2cj9o7eyeZC10Cef/vskh6PeV84SBOvZJt7CDjt
	+zhYA0Rhfz4wwMJ5RzeGcJbFdxAj2zJ+E7sAeNdWIYZpz4ZGXqS7cE1TOQ==
X-Google-Smtp-Source: AGHT+IF7pca+cse6X2CzenFwWiiS9YVtc3CBOSxC58E2GOsl06+sipzJMNCuV0LCkU46+AqZo7FA7A==
X-Received: by 2002:a17:903:41cd:b0:1fb:a38b:c5b7 with SMTP id d9443c01a7336-1fdb94d1959mr9012245ad.1.1721695933643;
        Mon, 22 Jul 2024 17:52:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f4479a1sm61371105ad.207.2024.07.22.17.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 17:52:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/6] hwmon: (max6697) Use bit operations where possible
Date: Mon, 22 Jul 2024 17:52:01 -0700
Message-Id: <20240723005204.1356501-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240723005204.1356501-1-linux@roeck-us.net>
References: <20240723005204.1356501-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use bit operations to improve code maintainability.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6697.c | 43 +++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index 1ad4bf31cd24..d03881ea90b8 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -6,6 +6,8 @@
  * Copyright (c) 2011 David George <david.george@ska.ac.za>
  */
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
@@ -32,20 +34,31 @@ static const u8 MAX6697_REG_CRIT[] = {
 			0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27 };
 
 /*
- * Map device tree / platform data register bit map to chip bit map.
+ * Map device tree / internal register bit map to chip bit map.
  * Applies to alert register and over-temperature register.
  */
+
+#define MAX6697_EXTERNAL_MASK_DT	GENMASK(7, 1)
+#define MAX6697_LOCAL_MASK_DT		BIT(0)
+#define MAX6697_EXTERNAL_MASK_CHIP	GENMASK(6, 0)
+#define MAX6697_LOCAL_MASK_CHIP		BIT(7)
+
+/* alert - local channel is in bit 6 */
 #define MAX6697_ALERT_MAP_BITS(reg)	((((reg) & 0x7e) >> 1) | \
 				 (((reg) & 0x01) << 6) | ((reg) & 0x80))
-#define MAX6697_OVERT_MAP_BITS(reg) (((reg) >> 1) | (((reg) & 0x01) << 7))
+
+/* over-temperature - local channel is in bit 7 */
+#define MAX6697_OVERT_MAP_BITS(reg)	\
+	(FIELD_PREP(MAX6697_EXTERNAL_MASK_CHIP, FIELD_GET(MAX6697_EXTERNAL_MASK_DT, reg)) | \
+	 FIELD_PREP(MAX6697_LOCAL_MASK_CHIP, FIELD_GET(MAX6697_LOCAL_MASK_DT, reg)))
 
 #define MAX6697_REG_STAT(n)		(0x44 + (n))
 
 #define MAX6697_REG_CONFIG		0x41
-#define MAX6581_CONF_EXTENDED		(1 << 1)
-#define MAX6693_CONF_BETA		(1 << 2)
-#define MAX6697_CONF_RESISTANCE		(1 << 3)
-#define MAX6697_CONF_TIMEOUT		(1 << 5)
+#define MAX6581_CONF_EXTENDED		BIT(1)
+#define MAX6693_CONF_BETA		BIT(2)
+#define MAX6697_CONF_RESISTANCE		BIT(3)
+#define MAX6697_CONF_TIMEOUT		BIT(5)
 #define MAX6697_REG_ALERT_MASK		0x42
 #define MAX6697_REG_OVERT_MASK		0x43
 
@@ -193,7 +206,7 @@ static struct max6697_data *max6697_update_device(struct device *dev)
 		goto abort;
 
 	for (i = 0; i < data->chip->channels; i++) {
-		if (data->chip->have_ext & (1 << i)) {
+		if (data->chip->have_ext & BIT(i)) {
 			val = i2c_smbus_read_byte_data(client,
 						       MAX6697_REG_TEMP_EXT[i]);
 			if (unlikely(val < 0)) {
@@ -217,7 +230,7 @@ static struct max6697_data *max6697_update_device(struct device *dev)
 		}
 		data->temp[i][MAX6697_TEMP_MAX] = val;
 
-		if (data->chip->have_crit & (1 << i)) {
+		if (data->chip->have_crit & BIT(i)) {
 			val = i2c_smbus_read_byte_data(client,
 						       MAX6697_REG_CRIT[i]);
 			if (unlikely(val < 0)) {
@@ -291,7 +304,7 @@ static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 	if (data->chip->alarm_map)
 		index = data->chip->alarm_map[index];
 
-	return sprintf(buf, "%u\n", (data->alarms >> index) & 0x1);
+	return sprintf(buf, "%u\n", !!(data->alarms & BIT(index)));
 }
 
 static ssize_t temp_store(struct device *dev,
@@ -342,20 +355,20 @@ static ssize_t offset_store(struct device *dev, struct device_attribute *devattr
 		ret = select;
 		goto abort;
 	}
-	channel_enabled = (select & (1 << (index - 1)));
+	channel_enabled = (select & BIT(index - 1));
 	temp = clamp_val(temp, MAX6581_OFFSET_MIN, MAX6581_OFFSET_MAX);
 	val = DIV_ROUND_CLOSEST(temp, 250);
 	/* disable the offset for channel if the new offset is 0 */
 	if (val == 0) {
 		if (channel_enabled)
 			ret = i2c_smbus_write_byte_data(data->client, MAX6581_REG_OFFSET_SELECT,
-							select & ~(1 << (index - 1)));
+							select & ~BIT(index - 1));
 		ret = ret < 0 ? ret : count;
 		goto abort;
 	}
 	if (!channel_enabled) {
 		ret = i2c_smbus_write_byte_data(data->client, MAX6581_REG_OFFSET_SELECT,
-						select | (1 << (index - 1)));
+						select | BIT(index - 1));
 		if (ret < 0)
 			goto abort;
 	}
@@ -378,7 +391,7 @@ static ssize_t offset_show(struct device *dev, struct device_attribute *devattr,
 	select = i2c_smbus_read_byte_data(data->client, MAX6581_REG_OFFSET_SELECT);
 	if (select < 0)
 		ret = select;
-	else if (select & (1 << (index - 1)))
+	else if (select & BIT(index - 1))
 		ret = i2c_smbus_read_byte_data(data->client, MAX6581_REG_OFFSET);
 	else
 		ret = 0;
@@ -467,9 +480,9 @@ static umode_t max6697_is_visible(struct kobject *kobj, struct attribute *attr,
 	if (channel >= chip->channels)
 		return 0;
 
-	if ((nr == 3 || nr == 4) && !(chip->have_crit & (1 << channel)))
+	if ((nr == 3 || nr == 4) && !(chip->have_crit & BIT(channel)))
 		return 0;
-	if (nr == 5 && !(chip->have_fault & (1 << channel)))
+	if (nr == 5 && !(chip->have_fault & BIT(channel)))
 		return 0;
 	/* offset reg is only supported on max6581 remote channels */
 	if (nr == 6)
-- 
2.39.2

