Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B302233CEBB
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 09:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783763970; cv=none; b=FM5q5vjqsr0HBrfLHOwar6y73UEhrEQSbQ4Q/hWYWc1Ahmb9ijVx/e5lj3Yqds1ws3oSdIO6Mc1kGgtbF75TYRB5wBNo87S+wt2DxrXRvhLMYLkNtq3etJ3ohxU5k0s30U9BGQpgdif0AXXU2lEyjoRij+51xmJaCuujDLU9630=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783763970; c=relaxed/simple;
	bh=MQv1Im6q1ZDIoGs634gs2OJhyDreY1op9/i7+Nm/sg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b4S362pE6M6fiYs2qloJefoYQ4p4WGLx6yi3Fvf6gGZ+puupQs0sUBLs4T9AfY8cjpP9EgMcxczocF3N/6YxhJwUhugVHXp9/Uqdatme6GdkC/zn4BltiSBOoNe/zcGKygVsD9YARzgC0ytrCR7eK2NuRJt8sXBzu+Fjg8KbK4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=swmnLsmf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="swmnLsmf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso15784355e9.3
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 02:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783763967; x=1784368767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVaPeTyfcpBJhAAXDO8eOHgGRk03bxxebt8a54R0GGE=;
        b=swmnLsmfGGJDXmaQnm1pCyM1V2QJ2tvt75Onr1uvDAm0MB0Mkkfmdlw8L/UsnNS/Kf
         HZn8CkYUu1dJWIzhY6dasQx3Tp0xM5AbF+T1cVr5Xc5SpSVTT5onxwK1r5bqYW5Dbh9M
         /1vXbQKwJjsJM/dFhVMK508DtGNKLEtp3NAhl1N+u0qPm1YNVYYcNBF5te9ODhGx8BM7
         znStFx9pUekj7SiBiWuAybbRp1YlMgvQU1aZKBtU9ZipQ5P6nzBkjzS6U+QIPp2q7sx5
         Rltx9Soi+lRZ1hDBHMoJaSbV2Yn3J1EDrcHFCrpvHdfP8KAE/JL8BaOBjPV7yY+bB6dJ
         M9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783763967; x=1784368767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVaPeTyfcpBJhAAXDO8eOHgGRk03bxxebt8a54R0GGE=;
        b=NB11qdcBcDeGIQtjVODP9V1XrLy2u7pNqkZeEF7r9GZOPknp88qpTtK2k7osyrXjNe
         P1SyLn3mPjo9Vf+VN+BnRMWbpF8aBvzbqxqd61hvsx5ZP3hyQFD4wiEDLOptOJTjWXvs
         yzRfiFjBGWPgNv3hpjqAMIiJw20olQ2GK9mt919VpTh8GP95BBKdH0wBXwWgjUJnQoZd
         Qxw8jd8e+5iw6KLt/MYUWcG6ZB5iwdT483LEr0vLCEdUshtXLDsdyoBcb9OZ2he2MaxN
         18gMX+yKct9SnOPTxiNU4Sj6ECIzvk8sqPJYQUjM/YeQ+/K157rNRg+cCP8sSrFsuEG8
         qIiA==
X-Forwarded-Encrypted: i=1; AHgh+RrqwS+NNGEA4mZx9pRI7PSmZEzTo5WCDq3XGQuVHTr94ZiAiieaaVLJ8iKgpvRLITlA6riGhwAtTApQYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi/5VMZOboVX7t/XluGRxgGkpOE7bhvU+MSrMdnoA/HzGza/tu
	DRewH01ns5h7G+Tm96WbqYVQ8cQ+51hxze2lfFE18CW4nQreexelx7KHHulPaQ==
X-Gm-Gg: AfdE7ckd0Gu6S3MJ9SV/DGxZaTjgk4r2LaKk6EyBmf2m1ojk/BAY0DhWGfzLJf4oiH8
	A8/sN90Rx57OHrA+HAyQsJLOIkFHa26YkfBaEejCWAbCdCo62oxK5K/8dRK1WIhEGBcZzlC7e6h
	7V86HSMJkczUTQaNyS96tbh1W2sXjnxOWfRa7wJU/hYkuEFfwq+soVDjwk70t8/Lf5zD9FXoifn
	7jXl79ouv83/vFjOWnfCMToxCgAF70xMIkQ0oqJoRGktDo44P0IijY6y4UfEjLU8k/tD816FjOK
	8egnrXVSiEw0GkuyneqGE+G5PJ4cpUvA2vrX8L792qYl9MbTF42KoGcANwKml5FDB7oIf7gPDIf
	8KmLGbIt9cyZOmElrIVBR6nxYKeFRABAkzkHT9g1aQZlXbCyYvgT/tZLWbP75E/p4F6W+qMOeyI
	duyxz8e5qHun89lA0cUspks8ruoI5Tz64=
X-Received: by 2002:a05:600c:8b52:b0:493:fa66:4839 with SMTP id 5b1f17b1804b1-493fa6649e4mr13652245e9.3.1783763966892;
        Sat, 11 Jul 2026 02:59:26 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm67464937f8f.5.2026.07.11.02.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 02:59:26 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) detect unconnected physical sensors
Date: Sat, 11 Jul 2026 11:59:04 +0200
Message-ID: <20260711095917.568925-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
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
index 29a23484cbe7..f178570110c1 100644
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
+static s32 temperature_blank_values[] = {-62, -60, -40};
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

