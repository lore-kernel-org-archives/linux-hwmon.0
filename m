Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F422BAE9
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jul 2024 14:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720363664; cv=none; b=X6kNseWqwuxdTgQaFlRzdCA+37baNYQYdNccN/XXXY1+W9auThgU0FRxhDAEBB09R1GyTp/znpVdXjfXRsGFEsPqCk8XL2QznKJ+e81wxPT8KrRf68Cipwg/p6t7gz1/Gp/iXXHhDn5kdIRhliYo25uuaIz4Ii8OUXUNrrryKNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720363664; c=relaxed/simple;
	bh=JyUXSmcWXRmr74TVanMDnIjVO8uLxqaxJ6dHRkFVQdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qv13tN7/8K1JJYACNVrX6xi6ntdEnzbdprCTOw+NnCeqVFKEx5WvFRkD+eeesWfdp510J7jQUfKlXIoUzeHXJirUPBcYmAXCq9cyDh8Cf3CYuezgUKFvtynrO/SZv3Py+GS46dU0AcUQD78poe4tIPQ6FOEupF7E06Lyi7RnkqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8Y1mMS+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8Y1mMS+"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70af81e8439so2581944b3a.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jul 2024 07:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720363662; x=1720968462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fytkPyetvofip46m/hlgw8/3Snawnk4ucvawG1atrYM=;
        b=G8Y1mMS+SyiE2b5u6WiG5QI3J/ZYX90lydWj8e21Uh3ghduv7lCBfU9LyuSWwH7dS0
         Kw5AKrT+bkozdwJ0Wc0KnST+XCzEnsjSgF8NsUSdBC3CBuQMIgBhOUx9l0Yp5BAH0+fc
         0BwFO690V0ZDC8/46feWzZkRl5scC485A7Df7bsaY1/2mKuVROqR/trmZvDvDHXtKIfT
         cN7y9SKofE69zs1lq51zh6Hbt0PUdrC6psZy2xUHv+T/VvmURznoQR3BnXoG3Dft//S+
         qRzF1qyC2CDlCBI+dd0ElwFzy//+QDLYQyNOKCg0/2wyZUySnHwVRRrUwXYsiRthFQwi
         DQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720363662; x=1720968462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fytkPyetvofip46m/hlgw8/3Snawnk4ucvawG1atrYM=;
        b=oLq3lA5Y9JJfRkyZcTe9hLNQiDTA2vgsMnxPhua0WtKRaI3JeLwRzLZxzp9f5UU0p9
         m1YOSO33qseg1BrfBHCjBf6ZNeMoh+CFjQnLg5aN7Xf4wM3nyrPWYFlAxxJkYNBuxO4z
         7T+93Q4CZPmG/OEB1ZVcV9i9vKYiNYT29AQ16JaZ7v2IK7Uvyk7CxxZV3EO+3Nd2Ga0X
         c6l8n0LBqq/0Ng4U4q8TIIIWGPkus6qI5UODjUlGdZpSuLqYNvdk7flnXdTZ1Z6v1X4C
         gim4hNrg/kMzbzsh7yLvAiVLXlGQ65g8edSqicMfNc6InH3Q5GucH02mbI8Up47A7WSA
         Ex0Q==
X-Gm-Message-State: AOJu0YzYp9DzsaBw5ql4aay+0O/0xGEMR5lXkYwR+I8eWeGIRSmmWUrT
	VxA8S1N/9Qt+Oe1bfvo31bv8IR60rrTxz68snEotoV/y8qPiDq7gf1aKnA==
X-Google-Smtp-Source: AGHT+IHXHNVXB2lXPXA2O91GBU3oIJ1yZ9ETBD+2Z2MCVpLYY/XXJD0hL4PtJcbXNUl1QpK9GJr4nQ==
X-Received: by 2002:a05:6a20:12d5:b0:1be:c929:e269 with SMTP id adf61e73a8af0-1c0cc74f803mr12879175637.34.1720363661819;
        Sun, 07 Jul 2024 07:47:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1e50f63asm76907205ad.138.2024.07.07.07.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 07:47:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/4] hwmon: (nct6775-core) Fix underflows seen when writing limit attributes
Date: Sun,  7 Jul 2024 07:47:29 -0700
Message-Id: <20240707144730.1490208-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240707144730.1490208-1-linux@roeck-us.net>
References: <20240707144730.1490208-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DIV_ROUND_CLOSEST() after kstrtol() results in an underflow if a large
negative number such as -9223372036854775808 is provided by the user.
Fix it by reordering clamp_val() and DIV_ROUND_CLOSEST() operations.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 9fbab8f02334..934fed3dd586 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -2262,7 +2262,7 @@ store_temp_offset(struct device *dev, struct device_attribute *attr,
 	if (err < 0)
 		return err;
 
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), 1000);
 
 	mutex_lock(&data->update_lock);
 	data->temp_offset[nr] = val;
-- 
2.39.2

