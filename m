Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558DE30EF64
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 10:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783764721; cv=none; b=mLZuEHExRoEaPfeJXSmZnpKFvJ+Txs5qB0HzQT1vDVprGmT2ypfRjXXaC9VtOZtArMdmbRZJffQSJWdm19VvED3iKsSCHp4kPGo+shJnWiv4WZgLI6Mt3c0iYrRpxmKkaecm7bF0V7nvHnw9jQ1DIV6npsJES43LJ4pGFkmvFCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783764721; c=relaxed/simple;
	bh=YeXB66LyHA9WuYJHkK+4fvrWzKAtRnRDL9RW/CpAP44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ey8A2bODdhVl7KszsVNeIF6Xp5qWApji7F0zfpM9bZfVjX1BXAAMNqDwPZTOWAMe/fWAPTelCxT8xIf6otd0GeIPPduRNJBEUl3E/yduwEVGo1VPjIrsqJq9ve3EVvsKzjA0U11/JmCL+JXiPzFnS44JmSEWPawW6+O6FKlMzXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/7udHnu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/7udHnu"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-476a130c138so2066503f8f.0
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 03:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783764719; x=1784369519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKz13cUq/LFu+ymb8n550lCqXs8k435JXzHI+8bHkyU=;
        b=b/7udHnuJq1wYf/BJp7Wu83uZr3AUAtd01oRpQ5eF1N1nL43qxMFK2/aQoI8cQSywn
         CGOY9M5LHqfLRcajQclV4PhDVnsQOBujqUw1CI5fIh4pnaREvS7VXhgabzK1+nkn+Zvt
         qyefa5dN/OArvYt4OZsKy6GObatgmRPAQ++DAW55o6FfOsCW+exXBLylDMmp4vXZeQgf
         9fL+SRT7Z5pSYRXOf2j2EcQYMnoIjljrUXBfmy0sL7ZVoM6HSE2Zo/tFALnHtbznnJQW
         0PNRJ8BVnGWBxMzB+kkGjxthPrA3dMdK3xwVGPDf7QJuxlxjQYL+zsYrE3vwnFeKDzv3
         KABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783764719; x=1784369519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKz13cUq/LFu+ymb8n550lCqXs8k435JXzHI+8bHkyU=;
        b=EAGdqWIjgl3IYUJLCPtWyOzGPqKcYaaFPb9rarHs8S4zV2D+CrN0gLpEFv/MCsbyKY
         HX/MJf2bN0HF4v8zGdeSRtAym3Q0Sri6kU0ceKVGuGEbEXWkplk/kMp5R5BZyniQvlyF
         q4DFLCZ7/uH1TMOHvcTl37Qr3b1Rlqi6pcdx02ZY0AY2E+u8YQwfIs34EKq8pnsnZWdC
         fz7UgmoBgTM2SWOQA1TmuPKVi49cwmh85qc901YfO6bxYERojOCleDwKlKnLKB+1saEI
         Z0mrqiLyOqB/OkKfL6CdS4eYcQeslHITopYMGm2MjMmZM7GYWg4YaLV7tj2o/V/IB8b9
         bsyw==
X-Forwarded-Encrypted: i=1; AHgh+Rou5OUnv1W/vHoyk5i7nI+z2c++yLSHTmOlBnbOAt/Qabtox6j2pgaZm9X9Usm+a1xYU8AQuB4E04/Z1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf8AJTq29cBgJTs2YxmM/j+py7NuQnpu1yuxolYoEPIYf1Fr85
	+73+Me1kIlyskmGbrTgg3IsI7Qbp7niMmVRUD2/Lp6Kq726iHPsN2xCG
X-Gm-Gg: AfdE7cmr7JnNNEhzH9HUHovIwSGL+wjW7TQDiGL3zNUUCt5YcHg+cM5dDx4r4BjCPWY
	Rk4PZH4j9kLILhwDKL0upUOKkII5ehZkhPcpjxeLoGrcflCabUUZ9fYbZM0AuA7uxqq9WIpcOgZ
	Jkn2TMVde3MywtuStlHga7WSwa2W540ZkhPde5fnhhTaIxelKkp2U2b62fYMeO2bB/6lJc+XzZ6
	Q08SN6XoZVAYWtm/EhKc7WN0WkhHWZ2CRYg+jzaLlWvNItMkujEX9j87bCkx95xaA7RLb8qVs7O
	E1R1f0zrKWRRVuTTsvzqY+opX8m4xNSQEDcwM2/ZtUoJnHFHyPUwtHq+746BQyVaQHlNx4Cjjjp
	ltPOrIrSam4yGwb0UzPmbL8EdnAtW0fz8u778S1KXa71R06G+k6VRy/T7rdZVcjw9ydbXive7Hh
	gwPx1nGUfOQd3rrD8stvFQWsYBUQ7OAzX9aNIFmHMgJg==
X-Received: by 2002:a05:6000:4b0d:b0:46d:8169:bb39 with SMTP id ffacd0b85a97d-47f2dd1f302mr2037730f8f.37.1783764718620;
        Sat, 11 Jul 2026 03:11:58 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6e4csm63962740f8f.10.2026.07.11.03.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 03:11:58 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/1] hwmon: (asus-ec-sensors) detect unconnected physical sensors
Date: Sat, 11 Jul 2026 12:10:36 +0200
Message-ID: <20260711101143.571191-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260711101143.571191-1-eugene.shalygin@gmail.com>
References: <20260711101143.571191-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When there is no temperature sensor connected, reading EC register
returns one of the special values (-62, -60, -40). Test for them
and return -ENODATA to hwmon.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 29a23484cbe7..d805de5da7b2 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -67,6 +67,13 @@ static char *mutex_path_override;
 /* Moniker for the ACPI global lock (':' is not allowed in ASL identifiers) */
 #define ACPI_GLOBAL_LOCK_PSEUDO_PATH	":GLOBAL_LOCK"
 
+/*
+ * The values for temperature sensor readings without physical sensors connected.
+ * The value varies across generations and is seemingly defined by the EC chip
+ * used in the given board.
+ */
+static const s32 temperature_blank_values[] = {-62, -60, -40};
+
 typedef union {
 	u32 value;
 	struct {
@@ -1291,6 +1298,17 @@ static int get_cached_value_or_update(const struct device *dev,
 	return 0;
 }
 
+static bool is_blank_temperature_value(s32 value)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(temperature_blank_values); ++i) {
+		if (value == temperature_blank_values[i])
+			return true;
+	}
+	return false;
+}
+
 /*
  * Now follow the functions that implement the hwmon interface
  */
@@ -1298,6 +1316,7 @@ static int get_cached_value_or_update(const struct device *dev,
 static int asus_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long *val)
 {
+	const struct ec_sensor_info *sensor_info;
 	int ret;
 	s32 value = 0;
 
@@ -1310,8 +1329,12 @@ static int asus_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 
 	ret = get_cached_value_or_update(dev, sidx, state, &value);
 	if (!ret) {
-		*val = scale_sensor_value(value,
-					  get_sensor_info(state, sidx)->type);
+		sensor_info = get_sensor_info(state, sidx);
+		if (sensor_info->type == hwmon_temp &&
+		    is_blank_temperature_value(value)) {
+			return -ENODATA;
+		}
+		*val = scale_sensor_value(value, sensor_info->type);
 	}
 
 	return ret;
-- 
2.55.0

