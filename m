Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FAC331A52
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706198; cv=none; b=Ic6sor69pda9dZDjERrG8yDqhek7uOxuilLJXS/LatEHH18qokRF+d+QAN3NmvGtUdreShOxKiReC7qAF62ZaCeYdiX+7N60n1OwHxxAhutu++7GAQkOW5xcxX8alJHybrF9cS6931nEM4fsdzZ77tilRyBzhdN1UykJ+d/70LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706198; c=relaxed/simple;
	bh=xQJ7vqJlM95z0EvaEnyTit2RvZnp16UUSUD+VcoWZdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vu+GeiWduY6bjVPup1dzPBGgKTdh6vVmbRGJH4QXOtcw09SY+wcWjjZeQShx2PGcDcIbBj33iXTPg3cTgaIsEnwQ8dzUzyk43OLt+gDGeGRpoBk7JOrKIy43M4t6fzKxYJ2N1Na9O0noTVC+FKituKhyrkJZS9zazNMOoMGPAcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lygPoGzY; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lygPoGzY"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b62ed9c3e79so1295148a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706196; x=1761310996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRd7vQfoAwgnTa5ItQNq4wFD9foi08taWg1wgfAGB2Q=;
        b=lygPoGzYj5kDw/lpZGNnM/aSrr0+VrT+Iw1bwBNv6QPWw3dSFZ/W/+481RPa7kEtLN
         cK0ENydoDcBJ32tqzW2LRCW8+poO/cxrCAhZRnabd3VBRe8RBTwZw0r2Q91Ci96xtvf2
         ul+Uh2Xc0ButwtGO7PBf+gVwGbDIP6WSve0U6GVHluGpudEcTdu94iMBdQSXEMkF1ktg
         49FvOZUwTexixbEgXyfBuYhgm4/tAwLO9eNsHvjBsHlPdDSkx8PbSEZi1daAOOkWP17p
         uokb3VC3jh8Vr0uFlmqx11mXnb9uYnKbeLRH62jEzUCqniySli0oZTGG3bcu4eRljyVf
         DFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706196; x=1761310996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IRd7vQfoAwgnTa5ItQNq4wFD9foi08taWg1wgfAGB2Q=;
        b=czwyyE5IlgdryNQaQokcKGfQY8zzJR2O00D+NWJi8KbZT68y6IOHDw5sAR5Xvp7VY/
         76yzPT75/8/oQomEIQdtX7KmoDrhKbs03fdav2blzyyP24TqlDXBaaxOny8vHBLhtjbS
         rJtzGvndA2HRXbJQEXA5W51zjuFp2sibk+o+YoE/9FQj69pnel0hSj3RS/rSANd9sGMN
         sJhI3YLfxXYF8fLrrJfLlQprcWE659a3pHd5TP/czq2lNieOaacuP5XJnC1jQ3mJo/o1
         s+1bwWuqzl+avJC14iqCRfo/WmpRo+/vwxUyHop/EYgRSf8xPKJrJnOLnGjEzZdQvjiP
         cEsA==
X-Gm-Message-State: AOJu0YxRGb+DdVbyt0EHprE0ZAlHYXUJj05FTTPLC2TvNxTSz4gR0BYl
	XfbeJ6tu2AGYk9g26oF7oKIOtBh2fQCEu9Zz0p44HeI7qYHiywOO5WtJRRdnyQ==
X-Gm-Gg: ASbGncuWVH4GaJtcr0mQBYkXyhMhlBZqlFiJz7Gcegd9K0W/gGvGldxVssd8mpq6MBl
	wk8hiAtxGoJNWCzF/S+V4Q0cfyLY/EQxDfw/a6lsz4UX4Fmfc2pJ3caOh6u0sx//+cT7F/sJ+4L
	fsuyxt5dktM6FujeycZglyy/5xqbVt/ggwUeHxIpYrVW5N7gWUl8WnIJajj2vQqBHHJStckYU0T
	USQH85cIydC+AiWjhEL1BPwZ7akHMHz0aMyFzYoajKQus+EBbynzDD83/7Wv8tVMmk/X7f/klCc
	EOzEVvik2+tIeBBzMLwhdqR2M8fprXId9eySEyic6YSyBu2xLmqrXKLHaYgtB134Mj77KmzAGzT
	Unky/8QuHXpXlmy8WWGSk9MrysBx0N4fgHxTn+KD+p1lWwQfAwOcsOc1Tdlcta8+2UwCL0WtaMM
	0299JT7lC8SnrgCvjRQYfScrE=
X-Google-Smtp-Source: AGHT+IH0/lnoano87npodZujFKd21Z//Fg1fcY67z7shiWYfbJTvXAopBnNPgn7yyrjAPmEXTQqVMQ==
X-Received: by 2002:a17:903:244f:b0:261:e1c0:1c44 with SMTP id d9443c01a7336-290cc2f83a5mr46216235ad.40.1760706195649;
        Fri, 17 Oct 2025 06:03:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a90csm64098075ad.19.2025.10.17.06.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 24/29] hwmon: (gpd-fan) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:16 -0700
Message-ID: <20251017130221.1823453-25-linux@roeck-us.net>
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
 drivers/hwmon/gpd-fan.c | 56 ++++++++++-------------------------------
 1 file changed, 13 insertions(+), 43 deletions(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 644dc3ca9df7..57caae9a23eb 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -26,9 +26,6 @@
 static char *gpd_fan_board = "";
 module_param(gpd_fan_board, charp, 0444);
 
-// EC read/write locker, protecting a sequence of EC operations
-static DEFINE_MUTEX(gpd_fan_sequence_lock);
-
 enum gpd_board {
 	win_mini,
 	win4_6800u,
@@ -507,87 +504,60 @@ static int gpd_fan_hwmon_read(__always_unused struct device *dev,
 {
 	int ret;
 
-	ret = mutex_lock_interruptible(&gpd_fan_sequence_lock);
-	if (ret)
-		return ret;
-
 	if (type == hwmon_fan) {
 		if (attr == hwmon_fan_input) {
 			ret = gpd_read_rpm();
 
 			if (ret < 0)
-				goto OUT;
+				return ret;
 
 			*val = ret;
-			ret = 0;
-			goto OUT;
+			return 0;
 		}
 	} else if (type == hwmon_pwm) {
 		switch (attr) {
 		case hwmon_pwm_enable:
 			*val = gpd_driver_priv.pwm_enable;
-			ret = 0;
-			goto OUT;
+			return 0;
 		case hwmon_pwm_input:
 			ret = gpd_read_pwm();
 
 			if (ret < 0)
-				goto OUT;
+				return ret;
 
 			*val = ret;
-			ret = 0;
-			goto OUT;
+			return 0;
 		}
 	}
 
-	ret = -EOPNOTSUPP;
-
-OUT:
-	mutex_unlock(&gpd_fan_sequence_lock);
-	return ret;
+	return -EOPNOTSUPP;
 }
 
 static int gpd_fan_hwmon_write(__always_unused struct device *dev,
 			       enum hwmon_sensor_types type, u32 attr,
 			       __always_unused int channel, long val)
 {
-	int ret;
-
-	ret = mutex_lock_interruptible(&gpd_fan_sequence_lock);
-	if (ret)
-		return ret;
-
 	if (type == hwmon_pwm) {
 		switch (attr) {
 		case hwmon_pwm_enable:
-			if (!in_range(val, 0, 3)) {
-				ret = -EINVAL;
-				goto OUT;
-			}
+			if (!in_range(val, 0, 3))
+				return -EINVAL;
 
 			gpd_driver_priv.pwm_enable = val;
 
 			gpd_set_pwm_enable(gpd_driver_priv.pwm_enable);
-			ret = 0;
-			goto OUT;
+			return 0;
 		case hwmon_pwm_input:
-			if (!in_range(val, 0, 256)) {
-				ret = -ERANGE;
-				goto OUT;
-			}
+			if (!in_range(val, 0, 256))
+				return -EINVAL;
 
 			gpd_driver_priv.pwm_value = val;
 
-			ret = gpd_write_pwm(val);
-			goto OUT;
+			return gpd_write_pwm(val);
 		}
 	}
 
-	ret = -EOPNOTSUPP;
-
-OUT:
-	mutex_unlock(&gpd_fan_sequence_lock);
-	return ret;
+	return -EOPNOTSUPP;
 }
 
 static const struct hwmon_ops gpd_fan_ops = {
-- 
2.45.2

