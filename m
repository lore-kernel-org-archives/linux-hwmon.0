Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE83157487
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721749498; cv=none; b=X8ojRwBXvD9oQn220UaG3aNGwL3vGXY04DZG0dK0XI0Rp2GHBcpssXhJDezldiibobCUca5i6DQUoLbQF4foLixEKYvbrlPGg0b9kI7gNF8+OWhyXkbXnqh7pWZLCbxweC+6a1DpYARoybzgafJlbdFv0p3RkNcx31SMPxage0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721749498; c=relaxed/simple;
	bh=DzySiCwphLvmVOP8RP/f2FS9L31YOneT5MH1Sdxg/YM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HpRSjQD8dRQEA1VzkGm/jXL/evJuv7MLn0bnoY3EGAK/it7yp9m5HJ+7P9Iz7kTPqrAou29AUnWZdxwRRd/ynIqC4M8HKW3izPzOW0KiNKPYjg5Y6OBZH1EKIYNsM1r2Sd+wQT1vr1GYVHMgRmyqjzaiuAYstJ9hM2zOG0Iy0iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSRo9DoA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSRo9DoA"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fc5296e214so678405ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721749495; x=1722354295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGKZyr9lzcfWEJHtO2yVQk/yOkEJHDixhjesPJPm9bs=;
        b=mSRo9DoAzrRxLktICjEfSPxukn6RevE7n2e1Py6RnTKtlEJZTIlS8+7Z0vxiQ0XeU7
         OWwe/FvRSg61uEJuQEnQfFVgS/y7cwVZnIWQQOH8+m6hXsU9a+bDxPvmwanIIOOzBw3a
         ormAywaVs68fBnJRXtdGvQsjNOrlbkQjuZlEXCfunkOy5ATkYkVB+w0dErUlGAeoMuvp
         k234pben6kfK3kzMUMXBZYIuQwLoHOZv7sS5WQht0xBNY2+i+DSVmY5pWWczWyEeZfsQ
         aVePEXCllM6bP4Q/745/U4EnYs+nCh/tUkvoyDgTnpi+gITWyiowH42P9qI1IlHwmHVA
         RBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721749495; x=1722354295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KGKZyr9lzcfWEJHtO2yVQk/yOkEJHDixhjesPJPm9bs=;
        b=FLs6Uk0tR+o1SjyWhCQ5Ll+cLlMWcxfQyn4doG3oYB/nu71vFgzaOwxrccCvcSSY6L
         5OHGw3HOG8YRo+aooyiKtmvGdB6W4P8CdlInXm1VGFnd1kIcwAFKMoPMBnxrOvkQQcxE
         TGUVMyrIGnZCDfCxcy4SryeB3u6Q5sIHHerwUQTMHxX9z996fKKDw+8CXykDv59yHWsm
         UgtFYqfnA0JzfSvtDbEzvtD1XZn3YH2IwrR8stBGkahZ3jqk6+MyKdmoaLs0sH9cEqWX
         IGOls27lvrbUi23i0a1FbjqgTWgIPRhMjPm2DNlY34wkzGLsPfv6uJXq2lPcObqD3Scf
         T+3A==
X-Gm-Message-State: AOJu0Yw+q2doFp3YWIZMAx6J6wZBhrTx+YsD4xEHcpPdmdWBq7YDpY83
	EI5cZbh9Bpvk6EoG/kNpr7svDBJsEZCMo4H/y0iQkZo+zH8A0ZAEzquA4A==
X-Google-Smtp-Source: AGHT+IFIUsqQ0DaOkFjOURDhN9anpi0VUJMRsS+As/uz52QfnsQTRPkdBcvg37V389ag/2p7FxWDHw==
X-Received: by 2002:a17:902:c946:b0:1fd:6bfa:f59 with SMTP id d9443c01a7336-1fd74552586mr95973685ad.19.1721749495224;
        Tue, 23 Jul 2024 08:44:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d24a0bf3asm4050758b3a.179.2024.07.23.08.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 08:44:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 3/6] hwmon: (max6697) Use bit operations where possible
Date: Tue, 23 Jul 2024 08:44:44 -0700
Message-Id: <20240723154447.2669995-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240723154447.2669995-1-linux@roeck-us.net>
References: <20240723154447.2669995-1-linux@roeck-us.net>
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
v2: No change

 drivers/hwmon/max6697.c | 43 +++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index 62b03c79c039..1e7c549ef090 100644
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

