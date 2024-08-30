Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD39AF9E4
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979978; cv=none; b=LJa7r+q2efYpGEogS1/70m4O8Ot2+WpvYYQvY/nDIwIapyx+sczUOJOjEWj7DnRGgBqTwXZ0D0FLAmLZHSQn6YO5M2BJSIJ+nsDibnyH0mAKdX1MeWV6C3uGRt/JFH84FaK/If9tMoln7QnIJcr+/tthfl/hJg+LuF5XuX/yzCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979978; c=relaxed/simple;
	bh=QY8MYHljwpjS3z8M7Wm1IQnqvAiK1GgQcR2lFkFPcME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3ZsBNMsAdiPJHjoWCqLW35zig1MIjiFE18s19Y/A++2TJ8uvF5CJ6SUeyNctwo7Vo1YUNpU7dW8bcrA7fIBsDYB17Jtu/AqLMcK0OTyv/4CIRiZRnnJ/4Q14nnmgK5FwgosE+ay87c1DnaF8YmcdfIjvkiwP+9MNXkeAiSAPuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7RZjpN1; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7RZjpN1"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7142448aaf9so926368b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979975; x=1725584775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8FryLLHfKyK6h+OkcsV6zljseFi7Hl3EvfagubRt50=;
        b=Z7RZjpN1cOBracGGBCVCmm14grB7JCE/fH6SXUowyowDqUgz9APiC2svrjJ0t8NK5N
         2qQ/CQ1VHrdzYGCJw8SiEOWG+QLjrLBi5mILtBykK/kRAwl+0D+6jD8WdUy24YovLizt
         mUoRtNmaluSA0IP+e6MUMAsZxCgOs1ye4g558tIR1zv6bipXVbn5ZKanM9TXqxzcslq7
         Di79YGZE+ZcVymUplE+7TOj7LVdxji3nv7DZTjZqZzv4INY6Zq7IgKx4prRh3wkCs8aS
         wXECQF8AboB0HZMg3DYQ35mPl90KjVSyXa0ZW8kkW/iJx/YHuVyZAOAqrtTqflDGRhAV
         NKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979975; x=1725584775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t8FryLLHfKyK6h+OkcsV6zljseFi7Hl3EvfagubRt50=;
        b=YYoW3Vma1m01+eHFuoAOFENRdKLYpxGuG+0D5FvBbZtobfc3JAnHLkEllka5GGeiYd
         kyx0VqdXawOftCe6DiXcBFUJRAf29UdGSY9gZXAJzIy5t/xdlIzZb65Z5InMzsykPhF5
         x+i812PvCBNrgqFRAWlwTw6yd1fb+DfU6lkw/K+GEisHaR4jjwikatqvWwv0y1/5OsVV
         YIiNdcG7YguyQXEwQYj0oDibbGWPuKMlG+Xv8dLae8LkZ4poBLuVFQaNtRqwLnxrIo+L
         tK42ReoJKQ1441NfGXb/WkHy4QrS7QFWqRgL+HgdtO4+LV+5nNYjowSYP2/hk4AJw6vr
         y6Bg==
X-Gm-Message-State: AOJu0YyfWvLpkq3SdHkCCi+MobyA85Jpay97MJUYOB+j4Q3Gsy1QvSkx
	YkET1MJX3nSOHbxwqWwZzafVsa6rLYeC9K1r3KmtQMdm0C5ey+crlbLwWQ==
X-Google-Smtp-Source: AGHT+IGEwlq0u16Guvd0lFyRX6n1yqd6I8OHuBSWG8MEYJ17KNpOlh1x4Aca9EO9iZXwomE6R63eIw==
X-Received: by 2002:a05:6a00:80f:b0:704:151d:dcce with SMTP id d2e1a72fcca58-7170672410bmr1033831b3a.5.1724979975246;
        Thu, 29 Aug 2024 18:06:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9d5150sm1848070a12.85.2024.08.29.18.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:06:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 10/14] hwmon: (ina2xx) Move ina2xx_get_value()
Date: Thu, 29 Aug 2024 18:05:50 -0700
Message-ID: <20240830010554.1462861-11-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830010554.1462861-1-linux@roeck-us.net>
References: <20240830010554.1462861-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ina2xx_get_value() will be needed earlier in the next patch, so move it.
No functional change.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/ina2xx.c | 72 +++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 98338b7e7437..fe850ee06024 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -211,6 +211,42 @@ static u16 ina226_interval_to_reg(unsigned long interval)
 	return FIELD_PREP(INA226_AVG_RD_MASK, avg_bits);
 }
 
+static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
+			    unsigned int regval)
+{
+	int val;
+
+	switch (reg) {
+	case INA2XX_SHUNT_VOLTAGE:
+		/* signed register */
+		val = DIV_ROUND_CLOSEST((s16)regval, data->config->shunt_div);
+		break;
+	case INA2XX_BUS_VOLTAGE:
+		val = (regval >> data->config->bus_voltage_shift) *
+		  data->config->bus_voltage_lsb;
+		val = DIV_ROUND_CLOSEST(val, 1000);
+		break;
+	case INA2XX_POWER:
+		val = regval * data->power_lsb_uW;
+		break;
+	case INA2XX_CURRENT:
+		/* signed register, result in mA */
+		val = (s16)regval * data->current_lsb_uA;
+		val = DIV_ROUND_CLOSEST(val, 1000);
+		break;
+	case INA2XX_CALIBRATION:
+		val = regval;
+		break;
+	default:
+		/* programmer goofed */
+		WARN_ON_ONCE(1);
+		val = 0;
+		break;
+	}
+
+	return val;
+}
+
 static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
 {
 	struct ina2xx_data *data = dev_get_drvdata(dev);
@@ -264,42 +300,6 @@ static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
 	return -ENODEV;
 }
 
-static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
-			    unsigned int regval)
-{
-	int val;
-
-	switch (reg) {
-	case INA2XX_SHUNT_VOLTAGE:
-		/* signed register */
-		val = DIV_ROUND_CLOSEST((s16)regval, data->config->shunt_div);
-		break;
-	case INA2XX_BUS_VOLTAGE:
-		val = (regval >> data->config->bus_voltage_shift)
-		  * data->config->bus_voltage_lsb;
-		val = DIV_ROUND_CLOSEST(val, 1000);
-		break;
-	case INA2XX_POWER:
-		val = regval * data->power_lsb_uW;
-		break;
-	case INA2XX_CURRENT:
-		/* signed register, result in mA */
-		val = (s16)regval * data->current_lsb_uA;
-		val = DIV_ROUND_CLOSEST(val, 1000);
-		break;
-	case INA2XX_CALIBRATION:
-		val = regval;
-		break;
-	default:
-		/* programmer goofed */
-		WARN_ON_ONCE(1);
-		val = 0;
-		break;
-	}
-
-	return val;
-}
-
 static ssize_t ina2xx_value_show(struct device *dev,
 				 struct device_attribute *da, char *buf)
 {
-- 
2.45.2

