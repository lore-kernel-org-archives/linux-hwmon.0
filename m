Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6489C42640B
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 20:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183688; cv=none; b=C50HOoCbHuBY5d8G0QhWx0Zo4EMzHfDdt9UCtLDGYPgooIG+87VxwRbUE8VPyUFhOuu9wGxBEvJ16wvfoOvYx+NcW1NSQhuKBVBrp7U/DxkdRUEUD3oN6tA/gDZ4ojWoyd8bibf7zrrR3k1QGYKaleQEPqu4j02rWhJ9IjAtm0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183688; c=relaxed/simple;
	bh=0Tyl0ZUv3LpVYDupST6Ozg9AcdkVLIK8TkSKICgjm/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HmzmWocsNaWD9EGE8jBWHG1DMK0O1D6+YeNVkBPi3Hs9rmzG2PWTyZ1zAcLnRTN5vM/EvyTkSgOLAWm6Dsf65Ubzot1+/zjV+CrQRvA0md5s15elmnEHOaUNGXc+Ec+E1Y4Gy7H/1sGFSiEeDHFAK/NQRNE8+zWyA+0FC1c1fW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FU542rMn; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FU542rMn"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so3184716b3a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 13:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785183684; x=1785788484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpNIKkt0URdaKrBEn1GhLKIqGqWBHB+iRFqA8HQeoVE=;
        b=FU542rMnAeQEESdLJwG4gwPgBXCH0Q6y5DBVCueB5L78Kg9czg44pZ+jrWkXJSAsIv
         GiQPH68SyqRHTVMfppFKzYOHCp9ECOrNql3WkkHm8wPijgKi2UrtXFh50aPpj9lacUbC
         8FGu44etDobpgjxG53rjaj2IWYjhXu1VsfKFIsTMmZzKNHhunxF0eGC+sFiNfWnr6foj
         fP6JdGa9/4WGZWNLp7CvXAdSwK/TYcuzerRKX/+DiRXyY0EoXwP3F3XLuvGkbR6hAAV2
         ph1HHh0+T4EgnW04FEeFpli4OLFap5LKUR6rkQVuy6p+mQVY/H83qOquCnF7baE3/4ZA
         YRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785183684; x=1785788484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpNIKkt0URdaKrBEn1GhLKIqGqWBHB+iRFqA8HQeoVE=;
        b=X1DsHa8qxcsojhHdi5z6uPJ5iep0LwC8lI8Jw8UiqatYLmyhjiuaZr7y7MAws38NsJ
         wMEoQ71e6Yrk+bag4S4xvyBT4uQsTKc2T5z9qKmlHS9saWuMRMmhx8jKocVD8DEdcD7L
         iWJ2q8E9D7EIr3mMRoOKrr4pOjV5Esqaxp1uJ+7jOze6jNd7N2l+ChN309UjDhOaK3KV
         VjDEKdEP4NfF9rU/BGUyFz/9dNXsQIcCy9z91+Y+R5C0jEXFmLBwdXWUBOKxApffo8Il
         Id43uN5mjND5Djb8Ubgnr8Zt14qkKMK06vv1bYmH7LiengqbvtKk/1z04bDAZZDCp7RZ
         V5zw==
X-Gm-Message-State: AOJu0Yyh/q5UtUlj7wAzlqq6k9qKy1ZGBw8laTvl4wRxRRuv73s8dxp7
	ZTjXf6KcXcgjzwZlukeOaPfuPlCMrmbRdogSKmQa/Z5lICbliP+8u3Ac9NWy1Q==
X-Gm-Gg: AR+sD11wLyB13S4hj+/hyZqKfkxBzlsSSNyMn1oJ/FmqWWRM4yDOVJFUCMM1qISLEsQ
	kagJP0trxYZfbqI3WcGJNhcyagON7YRkZLgloa7AXOMfEC98bD11FKxWCO6S0BhCANuiYiMhNWt
	tAcOZMPtz91K1wnv30KLdqXwOgXumlf4kXMgZFrnmIpburKye62uftSUlJgyaDON7ESf6NGEOn0
	g97qacY0XDdOLHd/VSK7MkYPUGVCR85bgR0AnijhtmtbKtjiXENhC55H2AqDZd9Mh7sJyuuZHyn
	Q7TZSH5wVmpRF8FOib+vshIfwQ4wMAAZ4HeLsi9eZlvlP6qgWa/uvkFLpBg5+fcRK+CMzZPIXH0
	H4R08WvZcKiThqQeeYso5G9MRz2I7DzUgRE7+EAeGB4BQv8Cm5AYxMlmDnWSyvLiqWp+43AzCAy
	3XtQ6yQtIY05xhnHNYXCqAZLhoqQ==
X-Received: by 2002:a05:6a00:1805:b0:848:7071:9856 with SMTP id d2e1a72fcca58-84e8d4ae28cmr688635b3a.61.1785183683968;
        Mon, 27 Jul 2026 13:21:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533ce57asm3558086b3a.28.2026.07.27.13.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:21:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] hwmon: (lm63) Clamp PWM frequency multiplier to [1, 31]
Date: Mon, 27 Jul 2026 13:21:20 -0700
Message-ID: <20260727202120.3710948-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko is concerned that reading a PWM frequency multiplier outside
the supported range of [1, 31] might result in bad PWM values written
to the chip. Technically, the chip should never return a value with
the upper 3 bits set, so this should never happen. However, it is
unknown if there are LM63 variants where the upper bits of the register
can be written.

Clamp the PWM frequency multiplier value to [1, 31] when reading it
from the chip to avoid the problem.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm63.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index e2a429e579ac..45a0efa8a39d 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -32,6 +32,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
 #include <linux/err.h>
+#include <linux/minmax.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/sysfs.h>
@@ -249,8 +250,7 @@ static struct lm63_data *lm63_update_device(struct device *dev)
 
 		data->pwm1_freq = i2c_smbus_read_byte_data(client,
 				  LM63_REG_PWM_FREQ);
-		if (data->pwm1_freq == 0)
-			data->pwm1_freq = 1;
+		data->pwm1_freq = clamp(data->pwm1_freq, 1, 31);
 		data->pwm1[0] = i2c_smbus_read_byte_data(client,
 				LM63_REG_PWM_VALUE);
 
@@ -1188,8 +1188,7 @@ static void lm63_init_client(struct lm63_data *data)
 
 	/* We may need pwm1_freq before ever updating the client data */
 	data->pwm1_freq = i2c_smbus_read_byte_data(client, LM63_REG_PWM_FREQ);
-	if (data->pwm1_freq == 0)
-		data->pwm1_freq = 1;
+	data->pwm1_freq = clamp(data->pwm1_freq, 1, 31);
 
 	switch (data->kind) {
 	case lm63:
-- 
2.45.2

