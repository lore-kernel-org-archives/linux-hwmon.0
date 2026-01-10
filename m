Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B023126FD9B
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Jan 2026 17:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768065641; cv=none; b=tUAaybkpS3OTdFEAGqcaXB83ZPoFm2YgSSmMX4eWNcl8BraUELeHL1EnI1GVFnY+9uI7N9E7m1l7nAQoljeEw6LX09WhTdEr9fxqXypRrCfMAzeCjGDLoytBWI3YkI9N3rLEDiCAhqlDnMjR/yTavL2911RVUMjGjc7DrYarLtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768065641; c=relaxed/simple;
	bh=zoyufa2G73dTOI6iqLDEAxRD81TxEKQDgY/15JnxVMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gan2fBrjmr4I3TIzztW5v/r0R1981keebEa9e0zdyfAuZLT7SVZusG/KKgjKzVViqF+m+rlRhHSOa5h23oTJo3mM6dsJZRSuwLIwp7ziVZeg/6wnryWfViRHj2lx4q9eATwSdN7jPNZC3T7pz6Mm4wjzyql8sDZ+Cn9h1s6DbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRwyoJ4t; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRwyoJ4t"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b870283ce75so35201366b.3
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Jan 2026 09:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768065638; x=1768670438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJn/6pk7m8c+76UeIa2+VSwLjuas98h5PZhN24o+k/k=;
        b=RRwyoJ4tzeWaZcAt6OjPRpsByV5N4WEB3f0LE8ffI0vjL/KPneTmHt8nbT6scVjw2L
         r+T6RhZ7WOKTIbNQ9t2seYFnxuJVr5OtpqiiAcHDeTOaUJJOvn1WQoIqXN/pYCsTOTVU
         vtYgmoPC0wZgaOsFNnNme0WNFgh3myJq8l4AihbsQcB0gKvZkSSk3Owwv5vTjlgfnACG
         RifUyrEWFClXEo0P00wkKrXRd6/Jbs1ksI6LNo5hcXJGDomUoGyGsANPOnPGP3Hdkxr/
         iAqWNJBAMtbnngmdxUaGb5YaVizsikyzmG5yNJbmB783r4P+ZeLAmgB433hFioWbP1wJ
         X/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768065638; x=1768670438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pJn/6pk7m8c+76UeIa2+VSwLjuas98h5PZhN24o+k/k=;
        b=PnIBifC471Mo8RYi+2ylsP9cynIZiGxfEF5piSb+QG5aEcvAueG+w3nGaqwkILGMf5
         o+oGEWs9RvrAws3uwr/U0D56V8X02Kqz/3L8UR86ih7Ei3pMOfj2yRn4NAjDjzB3OYn0
         blxvaF2yWtdsojpYMOJVNhPkD20g8+5uBgdyMsxUqG7dxfHopwqYuK2YksD3vnZr6gyM
         zmzEzmDeBQb+NRSWZ/k3wK0YWTZE41B1Bir0FhbIX3WG62SVbXDg1o3m8T9y0hUNOJMp
         6si6de1YwM1yrBKhZCOKZcUvJMIdTYlDGRgnDwpvTKeWiyLWqoRprLhdoTAQLLubNtHx
         3ZOg==
X-Forwarded-Encrypted: i=1; AJvYcCVp5QyYB6PIGFdRR/eIq/7YxlAPeR2vnVx2AJieUqHN1fTdwoMXGQBpJp6EA/W6rSkbJ4kTQE8M0KTGeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT/z4Ujx8+0ifsSzMpA5wM66xjtTyW1Nd1+XqILoawWFaavqt1
	4TSzBdAnaDhhxKl95IgkVKM6vcdo7ADp2QDVskufpFofGncka8Cwwj3b
X-Gm-Gg: AY/fxX7w64EiuN0e3wBD6Dd8vadqz+Zcg2mS0IP8Q5XhmGPmD50Yp7NkMyGjYMIGObf
	KZmCJPdsVO3EoZ7fzIsborbezaJ9HvYqWA4TuV5VO07Mj/QK5opgm1910QuuAQKeqvYQoYGEaJG
	Rz40hcv79zy/c0YjYkhW3TD/v9JlQKjzPkEfO+I5aFQv/KFxVNQLeoVVwECBD4kdWnygZYZ1xi0
	9/4rWW/uwKHoLcR8WBdQLXB2LGXRvrKRLjz/pWOckV/JZOnq8cgNDSVBEKr4Crxrt4OGeqS2bTS
	qvtlury3iGEWOpnz1BrgpT2HcSSV481ho+kiNMPvslXflCs0/BVW2Q+vQkZ13eUztx+se7ByNvZ
	WeU9v/2XaUlQqgFMu6JvAmIuWTAPhAKzW2ZBA5Ri+3dUTfbp4ZVkn/w97QJZMqfC8zQSmcj3uiD
	Q7MLvbLjqt0O2U9eWuU8j9u+T4kIuga9efIpYr
X-Google-Smtp-Source: AGHT+IH9/fEmcp10wkkQwIBC/GOjOv/vis4ocXPoGuA09D40/LVaLXKImkkABDThhNtVYeTS8qZqNg==
X-Received: by 2002:a17:907:8691:b0:b86:e9f4:e88 with SMTP id a640c23a62f3a-b86e9f4284bmr271913366b.29.1768065637831;
        Sat, 10 Jan 2026 09:20:37 -0800 (PST)
Received: from localhost.localdomain ([196.188.252.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f88f90a4sm173367866b.37.2026.01.10.09.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 09:20:37 -0800 (PST)
From: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
To: linux@roeck-us.net
Cc: Tinsae Tadesse <tinsaetadesse2015@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] hwmon: spd5118: Avoid hardware access during suspend and resume
Date: Sat, 10 Jan 2026 20:19:25 +0300
Message-ID: <20260110172003.13969-3-tinsaetadesse2015@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPD5118 hub may be inaccessible during suspend/resume.
Avoid updating/writing hardware in PM callbacks by switching the regmap
to cache-only mode during suspend and deferring synchronization
until first access.

This prevents the below I2C errors and async resume failures.

spd5118 ...: Failed to write b = 0: -6
spd5118 ...: PM: dpm_run_callback(): spd5118_resume returns -6
spd5118 ...: PM: failed to resume async: error -6

Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
---
 drivers/hwmon/spd5118.c | 36 ++++++++++--------------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 63f798991363..a8afde7f47b2 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -494,25 +494,12 @@ static const struct regmap_config spd5118_regmap16_config = {
 static int spd5118_suspend(struct device *dev)
 {
 	struct spd5118_data *data = dev_get_drvdata(dev);
-	struct regmap *regmap = data->regmap;
-	u32 regval;
-	int err;
 
 	/*
-	 * Make sure the configuration register in the regmap cache is current
-	 * before bypassing it.
+	 * The SPD5118 hub may be inaccessible; avoid hardware access.
 	 */
-	err = regmap_read(regmap, SPD5118_REG_TEMP_CONFIG, &regval);
-	if (err < 0)
-		return err;
-
-	regcache_cache_bypass(regmap, true);
-	regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE,
-			   SPD5118_TS_DISABLE);
-	regcache_cache_bypass(regmap, false);
-
-	regcache_cache_only(regmap, true);
-	regcache_mark_dirty(regmap);
+	regcache_cache_only(data->regmap, true);
+	regcache_mark_dirty(data->regmap);
 
 	return 0;
 }
@@ -520,16 +507,13 @@ static int spd5118_suspend(struct device *dev)
 static int spd5118_resume(struct device *dev)
 {
 	struct spd5118_data *data = dev_get_drvdata(dev);
-	struct regmap *regmap = data->regmap;
-	int ret;
-
-	regcache_cache_only(regmap, false);
-	ret = regcache_sync(regmap);
-	if(ret == -ENXIO || ret == -EIO) {
-		dev_warn(dev, "SPD hub not responding on resume (%d), deferring init\n", ret);
-		return 0;
-	}
-	return ret;
+	
+	/* 
+	 * Re-enable hardware access; sync is deferred until first read.
+	 */
+	regcache_cache_only(data->regmap, false);
+	
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);
-- 
2.47.3

