Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3E333031A
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706188; cv=none; b=GNzT/KcKJKxc3p+L/RDo1PEQ4aG8I2p6mbmompFPTGtNsiBXH5+4+CAz1WXBKvzO+SIMy4Fq29TrTcRphOZ18KhybxpC7Ng6RFdeovcPJ6rSaFARTB+K5a3qtC2V/ZFmhS6Vfyxi4eJHfhGFaJiZYwGvm6F0plR3XTLMvO0KDBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706188; c=relaxed/simple;
	bh=U2O8/q/g/QyNlXNHnUFKVxifBfdumZM1+ixrQHh/xj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnlwV0oSP4C8GLuviQmNf0PyvDZoh+VFj/Xef7+PHcSZwTtjs0SDzBAZLf3yl0ZUydpgerEBOb0e5C33keo6fAPb8TFKJ7FmNJqA9RWBK0G7h9o+9TdzVekHevdZW8chF7mQUYJybT2raTNQe6sRe/DZ2BP/SRllsxnfqpu0a8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUDolY7h; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUDolY7h"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7835321bc98so1836522b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706186; x=1761310986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgtYvp8tIqdiLUM0tHatcALpZ+WXPf9Psdjq0FO3MdY=;
        b=lUDolY7hC/VFkr4K603U/hhxRzwKaLtPcGcHzAvsB3zas9YsquewO6OZcDfATcR+JZ
         iAD8QPOPZffzDV8352YXZ80w6TwZ+wlWjV0AtQkGqMZ93iybw9fvOxVDQggvyPbSejLz
         +dFoO9aOueCVbwivms4hCqyPA7DJe8BTqGxuI9vkWdwMrCswLmuWDMMxGWwRimcGmgXP
         aNXc+Ly05C5OCxMhr75oeWqdboM3WDMVXgnsKZWehlwYq/w9v8uXhKqX79Rlb0otTBBo
         +uGTfhQnTIHZgY4C8GnOjn056FefruchDe+fKlsOpf74BPHSaZmiceBz/NUo39TyBcBo
         vBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706186; x=1761310986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WgtYvp8tIqdiLUM0tHatcALpZ+WXPf9Psdjq0FO3MdY=;
        b=HFbjlZwZbvQVly1zUG0yqm1gjN2qDB6DyQ4n90mvDnKt8WkM9TdK4YG8IW/Re3xGSg
         7loIRfnQLTInE+Ig4j7YHgTiCOy0xM77eX1grqaVQd4EzDHXBWiMW3wejEyse2ZWyv2n
         L0dtJXl8ZvDqD3R0ltvK0cZkwQEmV1cTHairThQ90DK5xiEzzyXI8+uEM37L0ZpE3r6p
         A8Nuw1633h95c6gCkBoCziHOnZrWHpfP/TPIdXu0Mv0abXY0+A4zshPD3wnp/XS+DAvd
         G5FvsH0nhkNrLE3FY+Fi6drsY+7rXHgEso+l3N8xP8EbL5GIaGH8/EYmmfVHSIP8RaRJ
         PRPA==
X-Gm-Message-State: AOJu0YzhhBetc7Bv0+FX9RYDgGCO9l3rarnA7DIRYQwmAzT6zBU+4iUX
	QyTVEMAjJfv+UimSQyDCUbXOOCETkg7FWsE6hS76T2bxx5Pu5Sq5SZwm7sF9FQ==
X-Gm-Gg: ASbGncvA2Sq95U4p4QzOAtQ+i84Im7J5Lw22BRe4cY6T8tfXflWvrU2sjRxSzEZ75hO
	L6Q2OF8iysxKezh7zQWJsLcrAooWYHbo19CFFgWLyTr2qXgDMSuQi/TViWWRYNc3EuynMonrHVX
	aSFqXNWm0QrpZhThwiUDFwmetQ361tFb0JzoD8x+eoL1kIR7swYBm6MCGvBUmy7rZ+9CaKTZ3cN
	Vc4H9JrHtx9qaka3KqvO+o5nhMIbYWaiXK1kpl7ZHMJi9C1ue9+/MGkkcl/7PwgwhinlXFSsd7N
	f4T8bWwcPuaG5wFnGdndHmWmBHlx6xmJNXTra7t7XXzo+f5+/8wfFjz3NVTR0lpdnkgWsop8V4f
	KrE2of9bPbgyaOZQdExNiDLdVhBvq43WCvk/t0IAZiZ5OvDcR/F3wzhbUxOLXG5uCy/T8SA7izs
	foAYoCxhyio7xXiZxNsQSGIK4=
X-Google-Smtp-Source: AGHT+IEYeDQbhEjwBisk0UIF/XF1ES+ZLEydXvf6OpXCyEpkVET5ifSJ5T/YdF4AUVR1Qc1cOoJUJw==
X-Received: by 2002:a05:6a00:4614:b0:78c:984b:7a92 with SMTP id d2e1a72fcca58-7a220a859eemr4861551b3a.12.1760706185660;
        Fri, 17 Oct 2025 06:03:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09ace5sm25881017b3a.53.2025.10.17.06.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 19/29] hwmon: (adt7x10) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:11 -0700
Message-ID: <20251017130221.1823453-20-linux@roeck-us.net>
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
 drivers/hwmon/adt7x10.c | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
index 2d329391ed3f..d003ee3ebf06 100644
--- a/drivers/hwmon/adt7x10.c
+++ b/drivers/hwmon/adt7x10.c
@@ -15,7 +15,6 @@
 #include <linux/jiffies.h>
 #include <linux/hwmon.h>
 #include <linux/err.h>
-#include <linux/mutex.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/regmap.h>
@@ -55,7 +54,6 @@
 /* Each client has this additional data */
 struct adt7x10_data {
 	struct regmap		*regmap;
-	struct mutex		update_lock;
 	u8			config;
 	u8			oldconfig;
 	bool			valid;		/* true if temperature valid */
@@ -137,17 +135,13 @@ static int adt7x10_temp_read(struct adt7x10_data *data, int index, long *val)
 	unsigned int regval;
 	int ret;
 
-	mutex_lock(&data->update_lock);
 	if (index == adt7x10_temperature && !data->valid) {
 		/* wait for valid temperature */
 		ret = adt7x10_temp_ready(data->regmap);
-		if (ret) {
-			mutex_unlock(&data->update_lock);
+		if (ret)
 			return ret;
-		}
 		data->valid = true;
 	}
-	mutex_unlock(&data->update_lock);
 
 	ret = regmap_read(data->regmap, ADT7X10_REG_TEMP[index], &regval);
 	if (ret)
@@ -159,13 +153,8 @@ static int adt7x10_temp_read(struct adt7x10_data *data, int index, long *val)
 
 static int adt7x10_temp_write(struct adt7x10_data *data, int index, long temp)
 {
-	int ret;
-
-	mutex_lock(&data->update_lock);
-	ret = regmap_write(data->regmap, ADT7X10_REG_TEMP[index],
-			   ADT7X10_TEMP_TO_REG(temp));
-	mutex_unlock(&data->update_lock);
-	return ret;
+	return regmap_write(data->regmap, ADT7X10_REG_TEMP[index],
+			    ADT7X10_TEMP_TO_REG(temp));
 }
 
 static int adt7x10_hyst_read(struct adt7x10_data *data, int index, long *val)
@@ -197,22 +186,17 @@ static int adt7x10_hyst_write(struct adt7x10_data *data, long hyst)
 	unsigned int regval;
 	int limit, ret;
 
-	mutex_lock(&data->update_lock);
-
 	/* convert absolute hysteresis value to a 4 bit delta value */
 	ret = regmap_read(data->regmap, ADT7X10_T_ALARM_HIGH, &regval);
 	if (ret < 0)
-		goto abort;
+		return ret;
 
 	limit = ADT7X10_REG_TO_TEMP(data, regval);
 
 	hyst = clamp_val(hyst, ADT7X10_TEMP_MIN, ADT7X10_TEMP_MAX);
 	regval = clamp_val(DIV_ROUND_CLOSEST(limit - hyst, 1000), 0,
 			   ADT7X10_T_HYST_MASK);
-	ret = regmap_write(data->regmap, ADT7X10_T_HYST, regval);
-abort:
-	mutex_unlock(&data->update_lock);
-	return ret;
+	return regmap_write(data->regmap, ADT7X10_T_HYST, regval);
 }
 
 static int adt7x10_alarm_read(struct adt7x10_data *data, int index, long *val)
@@ -344,7 +328,6 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
 	data->regmap = regmap;
 
 	dev_set_drvdata(dev, data);
-	mutex_init(&data->update_lock);
 
 	/* configure as specified */
 	ret = regmap_read(regmap, ADT7X10_CONFIG, &config);
-- 
2.45.2

