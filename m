Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B2518EB0
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 07:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778918236; cv=none; b=WvCL2/ezH/ItmYhG0A9JN17QVh0mo5CDasSGWWHmfoWGOvVtYv5A/0LvY2dgnFSWGrqYyBA152BlVxLcs5gkxG5QXhAQQNJ5vh/gIKGn1ZVQ1+wrmNEdghZS+B5RvgHWK7BtncGZP3YimQodIL7H//ZFnpwNZs6mEKd2ydDElGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778918236; c=relaxed/simple;
	bh=XnvFvE2NxfNYSWePwNZxwD8M2o7IapgO3O4qUY/nUHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VwYFKIthCM+owyBkpuoROGRsQPN5kBqORAasxHCamB3D/Gvd/WYAfukcPG/W+7Y/x7DABBCQbCr0aCwxK2RGfKgPnvZcXWC6ZeGRq/FGjKEhcl7j2gwVFuq4lRdcXu68rZu6GAqtOCbz8Cap/acU386v11KbzTBjm78bfICdOiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNJyKKYC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNJyKKYC"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso6856935e9.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 00:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778918232; x=1779523032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZDD45ZMggWfTmYRIqeHT/QgETcJhRX5fns6ydT5F/s=;
        b=BNJyKKYCWWTWt4G9xgtaRi92oJkpWUqxMaRFUiQ5NqJuy+CMerX+UQukxpjbCwFOAq
         YhjopkTfeqOgYJLtGMSp47N801vh85UKrZF06qFJLLhyZ3Bmcky40ubA/sl2g0KFKvFO
         xhfa0HY2T1ZheLWGIoqPw0buzNBak5GSloxMTk9pqHc2rWUYOjSgLzvoKhQSyYOMHOU0
         fsAfx0KYuHCj/qgUd3OeLxNkbTIGjQu5fBfJUjSxPSTzrbeA2NjkdjGFJ3wWXmCZERfp
         9dF/WnAzcYDzvVZcLUcycQhJ+OOHvk2a0GmCvD3iglVKT2KTU0sN+ysCuUJxmWLPSyBF
         WARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778918232; x=1779523032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZDD45ZMggWfTmYRIqeHT/QgETcJhRX5fns6ydT5F/s=;
        b=BGhqb6mdVW/YrqgGjCVRvVN0EdW+3J4nI9r30xxcR67/e9EsJtwG9+/XmZFkN/ik0S
         /vbOidHJP3aSJqYH1UWmxUTBqSfWEIW/6rPBvVY2jRpGtPucH7s18EuD9ILM1Qpq5q1u
         kj9F2TzKT6AFAAHlETQhvMGFZ5/WfaR58GWDhAIFGTeOzCybU/UUfKv3NHSMQAfRh+Mw
         O8kqzI7r6jiorG+1/Hfw2/H0vg2bFmnRf+fW9yCuDGVUEkQYLz3lQ+WJ8PIuWGl1lBfM
         h42mLlI+1buy0e1uPJLa7F51w2SEz5gd/pdChwakDVi+hpD7v/duvdJp0J5dWSHGkFWr
         Urcw==
X-Forwarded-Encrypted: i=1; AFNElJ880g4+Iau87nPvEEIpX0+cpfrRK6pH6l4w9yHjJqJM5cm3KObABVeIv8U+aGA7dxD16uN4dwZJj9OZGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGEuIxEVHPIQW+t2Taz4hHkqh2MBibvHBozCpIBiSt1yrjzVVl
	5rb3Pf8Oo2pKgDYs4mi/CBNupV9lzZ/jzqxqkepZkwLbwnbi2yoOmSEe
X-Gm-Gg: Acq92OEdl5++DrvulL9WuV1alWEmooBloRvDE76dMVSAkjEEQO9LjNVCAeCwomyk+Sq
	0leaDIOMvT5ohApdpuL8koq/Of9ZQh3rS01gY4trLoPMSQzccIpCfA2yzXi3xDBmGmkP7gVk2lP
	YsPZuPAkNBocIB6ENm79RkgcUyIFJwlBlA7JL5KA/zfXJWhrpRLcMDzmMqK+lGG4v9dirv6oi+4
	Xv37y9uoNoblFt5JPM+T0bdhaXw1PN6pbD1bPUJbtOXyPn0YoKg5hrIB8WK95xE+XLhEVVXt+lQ
	m8co4SSN6lsVwhIWcoHG7GAgZjywAhOuzWkgPenKMHFldfl05r+wNFWOEDU7IWsrCJ5qM2/UKhW
	uUzsCKSHxPIPdnWaKafgBGCrU+BEaS9PO5+aD7OKiJpr1cgM+6W0iOQ0zu+l5Ziu68W/VOQlm3C
	kc0JsDGHa1koPFGrK/ZDOlMImEySUIiYGFoeRiVaDxPyjuALSLw8lysEzkUpeka5Nalr47uv4XA
	d/xAglzluzn6c6MZTdllg==
X-Received: by 2002:a05:600c:848c:b0:48f:d0f1:ed28 with SMTP id 5b1f17b1804b1-48fe60e4e32mr96678295e9.1.1778918231600;
        Sat, 16 May 2026 00:57:11 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c90b27sm118479145e9.8.2026.05.16.00.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 00:57:11 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (lm75) Add explicit header include
Date: Sat, 16 May 2026 10:57:08 +0300
Message-ID: <20260516075708.6682-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since device_property_read_string() is used in the
probe function add explicit include for
linux/mod_devicetable.h and linux/property.h rather
than having implicit inclusions.
Header linux/of.h can be removed and also of_match_ptr()
improving non-Device Tree compatibility of the driver.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/hwmon/lm75.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 845a0e09ea9f..32279049d44c 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -14,7 +14,8 @@
 #include <linux/i3c/device.h>
 #include <linux/hwmon.h>
 #include <linux/err.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/util_macros.h>
 #include <linux/regulator/consumer.h>
@@ -1152,7 +1153,7 @@ static struct i2c_driver lm75_i2c_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "lm75",
-		.of_match_table = of_match_ptr(lm75_of_match),
+		.of_match_table = lm75_of_match,
 		.pm	= LM75_DEV_PM_OPS,
 	},
 	.probe		= lm75_i2c_probe,
-- 
2.34.1

