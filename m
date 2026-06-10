Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142DE42883B
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781107058; cv=none; b=cx2C0pxEUGGCUwUjoQ0PH7nO9Q0E6+9QNsMFGgsYaaechpZ0NCvAgerofqiv9mvgTrCG5dHCcLLtUJ8QRDq+ztdlMagzN3YJhhHEi1rMDTrUQBUr9zuQk8TSvQQcJVvhH8/iAtyQnqK9UuI+/hbTo+WXokdHLrYE+Nk53jMSGTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781107058; c=relaxed/simple;
	bh=oTSaQY+9D5qhLcY1Wf9pqn6FEBc7ivW9+Td1eoJV7gM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hcfl+i030i9WfYudCvE6+pY5UcYEaCNKcgLDz9DpmOaSqAus6651WHu2nMFm7UMnoZFPuDevD/qgM+DC8DdtkT2aNWIxXO9NTr6/eQXkZ3UTkv1SEvaOEg9HTp093Bqrwzvpez6ah5U8lIo8wz+timvo7xtsmcCEjmOki/9cMY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tpqg89JO; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tpqg89JO"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304d8362a58so3103eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781107056; x=1781711856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=j3Y+Zhn4vDDB0roEdMHVYjzPSRem/jkfPJO2WcDGHXM=;
        b=Tpqg89JOV0ME1frJaUh6d91V4QSFq/yKgUkSgl0/9a9/5bzgyPM55qdhonYiWX9IIl
         Bdd9e0dhw85qJykHSDApWxPuDmpv3tkmCXertAlVjKNWN1d86Qg2QXcZnzPAAGkzTZcm
         iCoUky8O3ITyKuT6MmTgQuXgwhRH0g9dleomiBx6hpL0G3TcGRHkTOeSPKn41H0y/t3i
         daQog69vorVzRgqO/YxPbxLrPx54bq6pygVNl/nMnzauaofuYUmSt7X3FSu3j1gllw8z
         CbtRzdhkm4AwuNNhNu0DZPhpraqm+y1bnw9wprmDPXUZrE6nfaJc8+r+oIEJu38dgdhh
         zRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781107056; x=1781711856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3Y+Zhn4vDDB0roEdMHVYjzPSRem/jkfPJO2WcDGHXM=;
        b=mzcy2ac6QxuAZmGpc5Q651l/SOpVo0/5UrfNIQ8uHtFhV5884dGSvPFZGmxy3AZftM
         AJNi4ROgkBt3vj2NgDlCARf4isZlStbFdyUcjzt8dpsZS5KWCfw4wW8htQs2DmVz28wZ
         pD6EbBIIPERf5XZFSOc86V5cBFAq6r5dKGpfvxFiCjz8vkP+xblIJjKZ8vatC0cdnpDh
         mw7N+P28vOXBqnCFDnUeHdXqo0mAqGm3N6VjWzH5+pwhozkIft9QgjmgoiTw2h/g4ryn
         zev3cfQyOBazYBCzX26HRqoNILLr5Ns9dNcXh+HTHozI6aC+PoHcL2qW3+W0jOEGehRP
         yfSA==
X-Gm-Message-State: AOJu0Yx/Z+AtbVBgnOqNrMYaza93V1DIFRSdnmBgPYLkFh9iy14K2Ct3
	uS5HFetYF/gAJiTecnboFuT+Zez8sv9oK9uj2/DL6Go4uJNg5FmqmqbrT9P+6oaf
X-Gm-Gg: Acq92OHLblqDjwybAWJ4Qp2EnrXghv5B+bR8bDOVbPAllLP7EFfHQjdphg7omM/uELF
	fWsuVe751SO7DWzuUTceIk8zqbs9jEScWAtguChB8SlLzdYXxQXpug341WhaEjX6mAgCn5lbr7w
	ouishH6B+Rd6YnVSXKGwWegES6mvUBnYHhKkH/HMJxqKPkXD+db4HTqAQxCZzQ7YUR3p6/GAhyv
	9+3Zj+5okLM4G1db4UgYuDRqtDuhKoBMNGUbZ3Pzg3LxHr5nQUncXrG6LdgS3yB6pPbeveiw7iI
	W/cWYo5+/N6HbXjX4P/bhFn1ZuAPICFQIsMkU3/R5vpBJdcc0KfqilYa1wOjfNIMTcyx7zRW/eu
	QYu4cZabNhYhwTxdd+R4wkOR2epzPKvrc9xk6W3k5hmhwD0r86h+fjCHOSgVaZOjss6nvR8mi3K
	oVb89dGlhV0cx76pHC5BHPSmiWtQc37Q3vJ5ax6w6wtlhvViQ=
X-Received: by 2002:a05:7301:b0b:b0:304:e587:50b8 with SMTP id 5a478bee46e88-3078011bbd5mr8472835eec.18.1781107055967;
        Wed, 10 Jun 2026 08:57:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcbe995sm33570077eec.13.2026.06.10.08.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 08:57:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] hwmon: (ina2xx) Fix overflow issues
Date: Wed, 10 Jun 2026 08:57:31 -0700
Message-ID: <20260610155732.12686-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports the following overflow problems:

In ina2xx_get_value(), the INA2XX_POWER calculation is:
    val = regval * data->power_lsb_uW;
The result is returned as a signed 32-bit int. For the INA232 with a common
2mOhm shunt, power_lsb_uW becomes 40,000. When the 16-bit regval exceeds
53,687, the product exceeds INT_MAX. This overflows the 32-bit signed math,
wrapping to a negative integer and reporting erroneous negative power
readings to userspace.

For INA2XX_POWER, the upper bound is clamped:
    val = clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
clamp_val() implicitly casts the upper bound to a 32-bit signed long on
32-bit platforms. This results in a negative number, meaning any valid
power limit is clamped to a negative value and ultimately programmed as 0.
Similarly, for INA2XX_SHUNT_VOLTAGE, the initial clamp uses SHRT_MAX *
shunt_div instead of division. The subsequent multiplication:
    val *= data->config->shunt_div;
overflows LONG_MAX on 32-bit platforms for high inputs, wrapping to a
negative value and also programming the hardware limit to 0.

For INA2XX_BUS_VOLTAGE on parts with bus_voltage_shift > 0, the calculation
(val * 1000) << shift can exceed LONG_MAX for limits over ~134V, wrapping
to negative and setting the limit to 0.

Have ina2xx_get_value() return a long variable to improve the supported
value range on 64-bit systems and to match the type os values returned
to the hwmon core.

Clamp the result of 'regval * data->power_lsb_uW' to LONG_MAX to fix the
INA2XX_POWER calculation overflow.

Change the initial clamp for INA2XX_SHUNT_VOLTAGE to SHRT_MAX / shunt_div
to fix the shunt limit overflow.

For INA2XX_BUS_VOLTAGE, limit the initial clamp to 130V instead of 200V
to avoid the overflow.

Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>
Fixes: ab7fbee452be ("hwmon: (ina2xx) Fix various overflow issues")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina2xx.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index c4742e84b999..0615666e430e 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -16,6 +16,7 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -266,10 +267,10 @@ static u16 ina226_interval_to_reg(long interval)
 	return FIELD_PREP(INA226_AVG_RD_MASK, avg_bits);
 }
 
-static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
-			    unsigned int regval)
+static long ina2xx_get_value(struct ina2xx_data *data, u8 reg,
+			     unsigned int regval)
 {
-	int val;
+	long val;
 
 	switch (reg) {
 	case INA2XX_SHUNT_VOLTAGE:
@@ -283,7 +284,7 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
 		val = DIV_ROUND_CLOSEST(val, 1000);
 		break;
 	case INA2XX_POWER:
-		val = regval * data->power_lsb_uW;
+		val = clamp_val((u64)regval * data->power_lsb_uW, 0, LONG_MAX);
 		break;
 	case INA2XX_CURRENT:
 		/* signed register, result in mA */
@@ -380,17 +381,17 @@ static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, long val)
 {
 	switch (reg) {
 	case INA2XX_SHUNT_VOLTAGE:
-		val = clamp_val(val, 0, SHRT_MAX * data->config->shunt_div);
+		val = clamp_val(val, 0, DIV_ROUND_CLOSEST(SHRT_MAX, data->config->shunt_div));
 		val *= data->config->shunt_div;
 		val <<= data->config->shunt_voltage_shift;
 		return clamp_val(val, 0, SHRT_MAX);
 	case INA2XX_BUS_VOLTAGE:
-		val = clamp_val(val, 0, 200000);
+		val = clamp_val(val, 0, 130000);
 		val = (val * 1000) << data->config->bus_voltage_shift;
 		val = DIV_ROUND_CLOSEST(val, data->config->bus_voltage_lsb);
 		return clamp_val(val, 0, USHRT_MAX);
 	case INA2XX_POWER:
-		val = clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
+		val = clamp_val(val, 0, LONG_MAX - data->power_lsb_uW);
 		val = DIV_ROUND_CLOSEST(val, data->power_lsb_uW);
 		return clamp_val(val, 0, USHRT_MAX);
 	case INA2XX_CURRENT:
-- 
2.45.2

