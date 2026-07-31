Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDAB3F8238
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497445; cv=none; b=s9Yw1fZQSro2iLLL4mxpSCfQCjI8Inyh63bOWT5U9p554djrbbqV1f5sJFxUSQadANVi/8qh5/g/w/e+9TQIi15Er0PtK5X0LSeD4yKT+Po/YHT4A172al1iSqgqFFg9Cnstto8Mw0aUbVxoW6ubQBGXVn5nDAPKdbvViYI6EBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497445; c=relaxed/simple;
	bh=gxL7KiVYuyQ+WBQ7itimHHbc/gK0nyv2aG47P7bsJn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FpjdWEb+WbHYUac6aAV7qbd000W7ceMpjUJQMc3OeYH8dOvRJWEKNG8J1/WTXv/Pf2EB1HdAuvAD6+WBLCzxP9SM70wTzd9GkuiNe024BmDMevv7JvxreSbtrUgD1MQm26OdPTUmfpjnvJuuDiBvCGhgFKPnu3n6ZrHqk0fTq6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLYQ8VQY; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLYQ8VQY"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4758bd3731bso867437f8f.0
        for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 04:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497438; x=1786102238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6MkhrXl+YCwODYjVYYcDB6PaHtllobFn/tSmynvwR4=;
        b=iLYQ8VQYZ2xmXonuPHHoKYtC0KFywenSLp+edG7IYA4jwYtuemhO1hkEQYUleD7pUS
         MKJGAAFp21zf2XpXi0cCKz0QhUoXrdExYUtpjPcwxwJrC/EBTK0xPRogofdkkx491j2N
         m6B1rKA1tY5vnmpPSJWOLNz6RKo5QdY3avpQ34j4crk3Yvi2yI3BtQvI2FQp+UwpkZ5P
         vgbYtwn96+OaaNcuw24sSYuWNhT6CP9EEf2R0o0tMFTLUQ1slLo6kkS6FpDKmRtWUKpr
         IPJyHvC7ujeUh4p8DxbfCsTUu7FS3WZ6iPmRNsEFwZ2pir0vHR5QbTCzGcLyOrI8qKx0
         RJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497438; x=1786102238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6MkhrXl+YCwODYjVYYcDB6PaHtllobFn/tSmynvwR4=;
        b=e/+ELwPKO9EDxh19PnHITRneBYYN/jtPj3RmJCFYgnzPAl10zdPSqHw2InAiNP3yeq
         DnMpw3qa09mqZ9c3b8HIeTcn21tbh17dnhaIfZHjeoprcLXcP7CrWMYQ+DlvSkJpu4fD
         oniLB8ssQ7L315ySqliRZEpZXepr4PMhEIKdPNcilPNvJzMLUOIRvUrufqtTI5QntYJN
         8WhwvEB9USK3amzGbAfzjy40NwqbAwtLi1zIBulBGEvclMTfWgrHuaSJK/lu910BH9Xw
         VsUkB/BdB7NmBYF24ERD4LWO2uB72CgMJtqKS9FnAjtUgrFigw7059C7wRskkJ2QRTQe
         i9tg==
X-Gm-Message-State: AOJu0YwY/YoENgDXBZQeTRexDQT8OJYVgjR8XUi4c781rK6K2FYxvGjv
	QN4151OQlMPWCnAqlYG2x8C9zJhphJarI8fI1jLMjWnnBcZCUzUYYNnd
X-Gm-Gg: AR+sD10zGdxKubSoWccZE9XEMpkQ4Y0jhcoolG4DqXH7HPcnHS5n4B8yxTrOgh8E+wQ
	+rsp6ZuedoecttgNSkR3LlC4D4QaP+2xIWbVn/ZsWplIQZoljQeMFQP8Cv7HHMAyi9L0lkFpD6Z
	0WJ9hzZFbnqme83dYs1javBs/fiucqql1nK2mCuyO6TySZwkdxwRhNWUrDS2zEkwJDagG5lnLMe
	SqSuCUZcrMzTN14CNwtgIXtBmpbqB/caUJn++nS5t2+XJB1aJ1ZztV/s7QqmplhWho7TNpM1xWm
	tX+iWOey7O7vtM6aAysLfGm1H+g5eYgWmOf/uUrW020WKAziDuhvenEarWChFXl52Hhx/2BYRH1
	q7zRDwqwBztFrv/lL9mDhsGvMDrLdWIF8CUPyF8AAcdlZzeEakWO3Z4SpawWpYBdJe0EdeMX+WA
	0FybqTFu+2Bkxa3B8bUiVz7mNGJl/Zz7y68K/i0ocmDvwZBbNbrfMNMWr6zXsHEFb31BOBXnbU+
	OHE7i/6rA==
X-Received: by 2002:a05:6000:41f1:b0:47f:96e3:5322 with SMTP id ffacd0b85a97d-47fd33839b4mr3064738f8f.7.1785497438291;
        Fri, 31 Jul 2026 04:30:38 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6besm3823656f8f.22.2026.07.31.04.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:30:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] hwmon: (emc1403) Add regulator support
Date: Fri, 31 Jul 2026 14:30:07 +0300
Message-ID: <20260731113007.145322-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731113007.145322-1-clamor95@gmail.com>
References: <20260731113007.145322-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for VDD power supply for this sensor. It is required on some
devices for the sensor to start up and work properly.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/hwmon/emc1403.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index 8b3173da25973..a0f8d29eb6c76 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -18,6 +18,7 @@
 #include <linux/err.h>
 #include <linux/sysfs.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/util_macros.h>
 
 #define THERMAL_PID_REG		0xfd
@@ -659,6 +660,12 @@ static int emc1403_probe(struct i2c_client *client)
 {
 	struct thermal_data *data;
 	struct device *hwmon_dev;
+	int ret;
+
+	ret = devm_regulator_get_enable(&client->dev, "vdd");
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to enable regulator\n");
 
 	data = devm_kzalloc(&client->dev, sizeof(struct thermal_data),
 			    GFP_KERNEL);
-- 
2.53.0

