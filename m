Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD458D517
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 15:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772918; cv=none; b=KH7BLrCeaSpNNXy35fbiG2Auyrsl0e22Zh1VQeXBS85hlPxDoqsuql5L4WYejxgUkxwc3RzyjW3kZcFraoug2HyaPQ/oA/S+bmFBurkTgN0JLC6Y2XSMDhpw33fxJtyygVkIZyCKUJH29n33MunC/K/oWxFpySS62ambx06izuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772918; c=relaxed/simple;
	bh=XQO3Rmkm+S4gRt7La26cSFiBzrxz/ZBym+BmQ8phmDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IeRh9+mYX60UUQdR260dEyBeDFuGj8ulU5wOCdl31r6hBhlQP9uwhM6mTFk9zlfSSvkv6aG+2JIUazU8gHzjX03kRw15TbfLBLiAC3IPyWZhdvpz1xiC0mugZ2wqJK24RIWiy83+94BGlNTaXjvQytsuh9kV/ioX/vyzElno5jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gb1kHDjf; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gb1kHDjf"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7142a30e3bdso5009380b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772916; x=1725377716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qxgALiIyn4/A9wzNTEgJfVRrvX/dgsmnGtGQ2hZWps=;
        b=Gb1kHDjfGCxcGBy5hcUTJaJJ4scQBK0rGTc//qvzh2Y1uNJrhsugUZqvlIyAZdOXWP
         EEecKm6mFZHlGfqIfjEp6MiHvWW7CLO8pFLvvxYQv45cRSM9Q1mB2a8Z8BFm7WpvKo0q
         3XxMvOmGgIST9PUtb76VjB/35s6EKpqMskH2GfiybtygxBXdbn9n8JOex6TpaPsjIF0S
         ph9yMBVeFqwt/G7teaCjStJiC5uJnjsuk6rMVoK7wd0kq54Dtu4BHpiO24rhLGw4aS7N
         f+OssgM4R2+NkDb/JPynfx/+rjNIU6n3pRp1UrSbemzCQuW5hlMsb0Tjws9b9djHvXw5
         FxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772916; x=1725377716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5qxgALiIyn4/A9wzNTEgJfVRrvX/dgsmnGtGQ2hZWps=;
        b=iBfV7ofsABBUjdNmgUYHjEaL/6zM6PyXVjhW8hK//hTLuggpSvuzR/ecRg4IaPllil
         Mnq2Nm4uTnCLwX5vj1jzq6yXDKL0cCFAkDnUzwq6KbtxcVTFD1crT1oDenNYSBSx/j+c
         RDb0cFNCKSLXn5du3T1dO8bKfmf2H9r4S2xyl3D1SQDsfPI82h235c2RCZ3CsxNHGMIN
         xBPB01V14XzNj6tKWtsPD7RzEoC3oOnIktU1j4f0NxcO1+kW7XcY9AYGBRXTufSgPbwl
         27KdwGghomRyRaryKA54DshfXP/vEg5qaJxJz/om/XaeIBeHB40Jy330xOoOjdLLSt87
         LmxQ==
X-Gm-Message-State: AOJu0YzVtDi3v41m8Y5ya7zjzWYodX9zoKqGyGN9eXR4POPftprC+KC5
	ynt3tMh4cuOpTqqNn/J9/LZUkt0piM+XTnpfePr6HkiGz9d61evp8J8OgQ==
X-Google-Smtp-Source: AGHT+IFZeNTz2Z0NY2AYtDxvpjxGAx9Dwaw9gdwpp7M7NpBZ1BfxTL6tkHZTf0F/d3iOs7U6oV+UGQ==
X-Received: by 2002:a05:6a20:bc83:b0:1c2:8a69:338f with SMTP id adf61e73a8af0-1ccc024c2admr4727667637.12.1724772915705;
        Tue, 27 Aug 2024 08:35:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342314a6sm8704429b3a.21.2024.08.27.08.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:35:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 10/11] hwmon: (ina2xx) Move ina2xx_get_value()
Date: Tue, 27 Aug 2024 08:34:54 -0700
Message-ID: <20240827153455.1344529-11-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240827153455.1344529-1-linux@roeck-us.net>
References: <20240827153455.1344529-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ina2xx_get_value() will be needed earlier in the next patch, so move it.
No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina2xx.c | 72 +++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index d1bd998645b6..14136c96533f 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -209,6 +209,42 @@ static u16 ina226_interval_to_reg(unsigned long interval)
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
@@ -262,42 +298,6 @@ static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
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
-		val = (regval >> data->config->bus_voltage_shift) *
-		  data->config->bus_voltage_lsb;
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

