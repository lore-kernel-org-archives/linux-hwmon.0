Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9821C2FFDF4
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455532; cv=none; b=I7yAqh/CUi2sMGTYBJMZiT7ngk0NAwX9r2IIw/696JtzXmd3tQ1hmxTzVMu7Og/xwNZbtkbzlwJAwWEYSY4FAt3ahpkXudNuCbGLp5seFirk1nQ7A0fYn9IsiyUZa4eIw9w+KK3I1bCLKi4VRVCr4ac0MvLz6jXO1fohQPfC7Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455532; c=relaxed/simple;
	bh=hULZreSVZdWhtXH0eXkF9SeXBllPLvBNQHPYHI6Kl/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tWBzBPZgfC0vldM7ePU4CuLU5P6FDiI/6EedjMS4DY7w6B4o2x/F3DyFsE2K8eiHo6px9ZBtNmdy8S0NEzOle+8GK/nnLxFZeobcZf6buFthpkSa+A+H2SF3coAbauf246rblwrWBIuWsj8t8bxfTouzIakCu5Tgv7KinrXAMZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2KanDjf; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2KanDjf"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33226dc4fc9so4929106a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455530; x=1761060330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIf6QpXQI9QrYrpYIf55tb5UoI8otxbV+ilctupX1WY=;
        b=U2KanDjf/a6b166NbdECrMqDStWI9fAKWDWOHbfDBS+yvbdoThvG8Fiq5R8OljHcog
         AjQtyLH2Pkt2FURVKGrcnx+beG2eOU3YkSfNuaUcvwqfwLTy0ljEID9b2Mk3JlGQMom+
         5Dn2+Fsq6NeWZwwWkXRHUx/pigx/pbICJXuS3LOvku2V3W69geKM4UAHC1dFI+IoZ958
         uTwIa8ScQhbUHoWAI7vFbzYdF4CW42aE+1yflJNwQLyKjpstXEin3Y4nEHuUAOoavlor
         cHibUsQyc+9nfFsAoznRPcnE0U28vmxhRa2nXQHX84nXUypNy/3tIH7aKF00QX54sb+w
         bnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455530; x=1761060330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VIf6QpXQI9QrYrpYIf55tb5UoI8otxbV+ilctupX1WY=;
        b=QWxJhAZnfx/fXh9srYeYGrvT5bBaVk+ks8jjP/eRGbhcD604lPLCgUynoQzXeKzQsQ
         Mu1Cr/Kh2/DMdlJscj1rgf1ELn3PHiwkJj0uQwspQ6kQkJVIyaeaZwNDSsgDSKT+xvZp
         alsbO4ONJaLlDRlRtvSPjF8fuFSVX1ZM545eiN461CQDdJ7U0RkQUal9tC2KwCRRaqUk
         g7UIqgYaehffIRFzxiYKfOpCdRV+2POZNnZZa5BeCNk9RVdCU6Py0oo5aqWeVGsseVo9
         VsIUjDlW/k1YTPxiPeLgxZpEhFGk2zYtJwvD4c3cFWjRyhjTA3lHlBlmzJm+JQSENUMW
         Muhw==
X-Gm-Message-State: AOJu0YzLApkD8WuDRA4dzS8Lgkpz66cSEMdEGw8NeM7t1xjbqmwPC+Si
	nljkdW6JMXc/2B9kNhaK19ezbk3BM5PCnQG5f7nbHo5X0j0bSawwc9YZaHuTPw==
X-Gm-Gg: ASbGncsfjy65XD8xmTzNRFg0MKvr2zFA/J/ua77DlDWNep624uSzfYbgp1r4m8RJl43
	NkSiu+l/rU6wsWE0ym3bhf/0kmTiBDfbSk7O1+bN+iX6v6z9t2vwfMO6Tap3R4+5PWsGZdV543m
	pEBc7k6eEOv7KATSvh7WxUE4gOdbC03bMpGIHncHS8APozbcvK+qJuK8suYvGRHP5fcIrPUJA2D
	mCi6WlXg4Lf/GlaRhY25+WUsgN/VuAeEPUCu09FPJ9nm+fFPIpCxN3tRMV7wr6gAC5G6avke6U5
	7Uz8tOW76DVDxz77eY9hqua8P27CLemrAg6CZtdcRMxATJAz9TENlLLAjMAg+eTj46XbYfHnisE
	DWIp6EPUqgH+QN3Xu/zh5Sb5DVpgnF7bo4lUg4WpUDAxtQQw5Crl+yA==
X-Google-Smtp-Source: AGHT+IHZQA2SImX5CzPefa39dHUxRcvqO89QiV7M8aVHE85z2Lrnq39eo4TuJHArQIiSKz1Dc4Ie/w==
X-Received: by 2002:a17:90b:3148:b0:327:e59d:2cc2 with SMTP id 98e67ed59e1d1-33b51148bcbmr33563940a91.10.1760455529475;
        Tue, 14 Oct 2025 08:25:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b679509b3a9sm12496479a12.4.2025.10.14.08.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/20] hwmon: (tmp401) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:25:02 -0700
Message-ID: <20251014152515.785203-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
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
 drivers/hwmon/tmp401.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index 02c5a3bb1071..fbaa34973694 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -24,7 +24,6 @@
 #include <linux/hwmon.h>
 #include <linux/init.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -107,7 +106,6 @@ MODULE_DEVICE_TABLE(i2c, tmp401_id);
 struct tmp401_data {
 	struct i2c_client *client;
 	struct regmap *regmap;
-	struct mutex update_lock;
 	enum chips kind;
 
 	bool extended_range;
@@ -357,7 +355,6 @@ static int tmp401_temp_write(struct device *dev, u32 attr, int channel,
 	unsigned int regval;
 	int reg, ret, temp;
 
-	mutex_lock(&data->update_lock);
 	switch (attr) {
 	case hwmon_temp_min:
 	case hwmon_temp_max:
@@ -386,7 +383,6 @@ static int tmp401_temp_write(struct device *dev, u32 attr, int channel,
 		ret = -EOPNOTSUPP;
 		break;
 	}
-	mutex_unlock(&data->update_lock);
 	return ret;
 }
 
@@ -436,7 +432,6 @@ static int tmp401_chip_write(struct device *dev, u32 attr, int channel, long val
 	struct regmap *regmap = data->regmap;
 	int err;
 
-	mutex_lock(&data->update_lock);
 	switch (attr) {
 	case hwmon_chip_update_interval:
 		err = tmp401_set_convrate(regmap, val);
@@ -456,8 +451,6 @@ static int tmp401_chip_write(struct device *dev, u32 attr, int channel, long val
 		err = -EOPNOTSUPP;
 		break;
 	}
-	mutex_unlock(&data->update_lock);
-
 	return err;
 }
 
@@ -685,7 +678,6 @@ static int tmp401_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->client = client;
-	mutex_init(&data->update_lock);
 	data->kind = (uintptr_t)i2c_get_match_data(client);
 
 	data->regmap = devm_regmap_init(dev, NULL, data, &tmp401_regmap_config);
-- 
2.45.2

