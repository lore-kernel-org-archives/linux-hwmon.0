Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725452F83CB
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764156975; cv=none; b=qtga2hzcXjiJq6EQeOmLoeB2lMP6TDKTKDQEX5pSlZIBgzBocH6G8wLjMBhJTI/wkkxrouqu6yb8O+kg5FvcQJVMkhzLbanEvAlY+CU492HWfRzkGnp7B5duYSn4P7j57lfmfORkQv8xcpeFVcPIWWEAOS1plst4h4wdhlUwRkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764156975; c=relaxed/simple;
	bh=PeVvTjCmd4Oc1oHakedkbqLO4HGKb2i1noZCpUoiAjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZctVogw6lwAe1wxHW11U4Ap734a3WDdKHUgYFO2DfavjmNgN5JFr68St5ZsOlOG7L62m1Vv3kH9ClIuP8rUKt3OaDDYRZ9dF4m8fZrorE/lOLNXtA2u7eMybKpQ74YTBqXr+ghIfsYgFgbS7JchIac+CHkeSjaL8eMDVmdUH+WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIfI2aFP; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIfI2aFP"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso7655353b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 03:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764156974; x=1764761774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uil2Il4w5CQBlSAGS/bzpb35w7uNI01Ta2KYtAr1mdw=;
        b=QIfI2aFPzcb6+1MeZ/+O6EXKzR6S01AWLQ8EOp1+6Slj0WyOC00QkmBEPy6oBTyOwh
         j6Jnz7mp/dscrG+yvkTSPvD0d4ncryX9eFXj2Pi3fBW1llSqmFSoSUKhVsepCIYy06z6
         J+QRuKEX3niVX1Xr7hvAV4fDySs4jjLwvbqzZMc+fOgzSFWIC0/ixjLz1z8JIR6Nj+zp
         z8v1xac0g3NtsOiX5U3/6Ga4xbr+OjEfP488C4OpnEOfjFyV/Aeq2iyuH/lxaKG4oNZ5
         l+KrcaKcuF7JkHTtzPsH6CxK/thdR4Eu2XbNhqpkquPuGjcFaq27WE21rGmIdY4/grbn
         cxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764156974; x=1764761774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uil2Il4w5CQBlSAGS/bzpb35w7uNI01Ta2KYtAr1mdw=;
        b=F2teoW/kEzlgwWgVleEG6S4g3DmH6gp6rX7in6SAHBsoylCsDDCUxjwHC4btThYT+G
         U7sdK5y1FiOzo99k31tIWyifxoMPK2A9X1V56cfO4rmJFpQEMqhNb0AaP8GmhyOMIEYP
         K4iTixUeR89pLmueFXBZOHW4BCGA6rC2ZB6/1oFQNS04lO2tTTxq2kFssZW0ub06+XPJ
         DWY+umfzX6A1YCkJpzKf9Hc0Gmyvu0lG1L0S6BFzvpoQDTSwHlmBdyf6KbFeu+nQ59L7
         94radki+Lomc/zEIi/q3w/83XT4mrRKee0S+9o17GY5Ck3l/ce5vfSNHjoljSORBc4na
         4b8A==
X-Gm-Message-State: AOJu0Yz7XoqJUyKmh82X9k4aoKHatkbHSxkExyQWLhvhyvX/Q0rXh/Jx
	fvYYZ8Px833VjVYXvlygFGlF9kJcPfkGkriW4QmXgJr0coUHWerxgYH5
X-Gm-Gg: ASbGnctx2v+u1RrIkoIrXmFF3CEujBYMI9aLEFFj/mSn/MYgfVE00ovI8k2URNcAz6y
	/A/kxjY70soaILvxWexN6E1PMoxcnicor1x05xz+igyaqvC9UNClk9OuqZHIwVpMPjOdqX1mNH7
	9NKIeptJdYr2ogCLuXQFrt2rd8RHEHAFNC9g7yLz1+vaiayx97zGQ1wNWA9/BJQX+g1JFNX0rFP
	jnv9rWk5tTz9ueXhkKl0Shnmoi9rXl0PAmVh9sgdw2VwohVy6jXi8bGlFxkWHLMxEgKWfdCbW9u
	cykqltoa/9l+A7wY28RbygCdXxBYdOnS6aigl571DFijdPPRs87z8ybBRFr3BGAp/JjVZeqUGXd
	V0rhlRuvqI57dNh6EpsoMYoc/4FmGAh+TUJEf5tSLj7m80qpCZXRicj1a1ozK9wk77J716B+Wy9
	mwJ7exBVLRsMl2QVqAZbQJtiQY0iUP624shzbr6peBOflHadoNbdl20TjEMg+hnoS4EorBFOqOq
	300
X-Google-Smtp-Source: AGHT+IFXIlKZSAs2PXMs0uvPOZ0ATWHglXb4Ps0dtinZPMgyKJ9GTPxDWoMXoCehTfNwNvHv8hb3rQ==
X-Received: by 2002:a05:6a00:2183:b0:7b9:d7c2:fdf9 with SMTP id d2e1a72fcca58-7c58e113a7cmr22727111b3a.15.1764156973529;
        Wed, 26 Nov 2025 03:36:13 -0800 (PST)
Received: from 2045D.localdomain (128.sub-75-221-107.myvzw.com. [75.221.107.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471f8dsm21593159b3a.23.2025.11.26.03.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 03:36:13 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH] hwmon: (lm87) Convert macros to functions to avoid TOCTOU
Date: Wed, 26 Nov 2025 19:35:42 +0800
Message-ID: <20251126113542.9968-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro FAN_FROM_REG evaluates its arguments multiple times. When used
in lockless contexts involving shared driver data, this causes
Time-of-Check to Time-of-Use (TOCTOU) race conditions.

Convert the macro to a static function. This guarantees that arguments
are evaluated only once (pass-by-value), preventing the race
conditions.

Adhere to the principle of minimal changes by only converting macros
that evaluate arguments multiple times and are used in lockless
contexts.

Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
Based on the discussion in the link, I will submit a series of patches to
address TOCTOU issues in the hwmon subsystem by converting macros to
functions or adjusting locking where appropriate.
---
 drivers/hwmon/lm87.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index d2d970e73c61..37bf2d1d3d09 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -116,8 +116,14 @@ static u8 LM87_REG_TEMP_LOW[3] = { 0x3A, 0x38, 0x2C };
 				 (((val) < 0 ? (val) - 500 : \
 				   (val) + 500) / 1000))
 
-#define FAN_FROM_REG(reg, div)	((reg) == 255 || (reg) == 0 ? 0 : \
-				 (1350000 + (reg)*(div) / 2) / ((reg) * (div)))
+static int fan_from_reg(int reg, int div)
+{
+	if (reg == 255 || reg == 0)
+		return 0;
+
+	return (1350000 + reg * div / 2) / (reg * div);
+}
+
 #define FAN_TO_REG(val, div)	((val) * (div) * 255 <= 1350000 ? 255 : \
 				 (1350000 + (val)*(div) / 2) / ((val) * (div)))
 
@@ -465,7 +471,7 @@ static ssize_t fan_input_show(struct device *dev,
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
 
-	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
+	return sprintf(buf, "%d\n", fan_from_reg(data->fan[nr],
 		       FAN_DIV_FROM_REG(data->fan_div[nr])));
 }
 
@@ -475,7 +481,7 @@ static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
 
-	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[nr],
+	return sprintf(buf, "%d\n", fan_from_reg(data->fan_min[nr],
 		       FAN_DIV_FROM_REG(data->fan_div[nr])));
 }
 
@@ -534,7 +540,7 @@ static ssize_t fan_div_store(struct device *dev,
 		return err;
 
 	mutex_lock(&data->update_lock);
-	min = FAN_FROM_REG(data->fan_min[nr],
+	min = fan_from_reg(data->fan_min[nr],
 			   FAN_DIV_FROM_REG(data->fan_div[nr]));
 
 	switch (val) {
-- 
2.43.0

