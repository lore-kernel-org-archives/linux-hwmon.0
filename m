Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB851E1A3D
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706157; cv=none; b=u33SHq6QSQIxAB6XF4AJLpnh245RBjdU9/ciz7RMzQeba63po3HU7wxsk/Ie0AQKJD3mBxuFyMoaPAqVBs87WUa4YLA7tPGnIVHZVeU3IL3E/ZpMHhHKVAYiJ3oqoLXf6PNse2qcOqAnfK/Y+m3YtmK6ue5Qgz492QcOU9EbL6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706157; c=relaxed/simple;
	bh=33g1+5CyOReUkzLDupt86bJLUVS4WS09c1ehQPCOHEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ziogwtxfy8kvlJbxhTErzosFrqkPPcPKuqv4HxNMOFK7dG88it3NIGFKj1PkHyIBQ1pMVK32c1308TeEVF8vmG7u+7kLKK09PvJc/e/ACvhhRXpkm7E2MgWVTIx5G4QipnwVDxdKC4l4AJREqG4PM7cZXqjBiF3QObQJCYGHdW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+Y+2EtX; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+Y+2EtX"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b553412a19bso1274651a12.1
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706155; x=1761310955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bSP9GQt7FORwrA+J8Ois4dTCuC1ORD3sY+7G7RdZis=;
        b=l+Y+2EtXzCyAtRMK9tWZzdkz4Y4bcBk4xdxWbiLU3yeoDubfNRVfLRdzSCAENVsKKe
         bt/EOYAd4HN80ztD6rfYKSfU2nT/vy/P/Hfa3dqfnnRC45O1IXdrKYKiNsbY/9UH7VJF
         Wx3EGxJXrsyrK4wc/6u9N8inRt3dvFTVamaCpdYleX9NbIVuAmIOb+ke95O4FfGDUAtk
         Zltx8fPlo8BUM+pK8H9tnzALH+sdi4COJm+V+/9RP0/C6Q7Fw1ZQmIy/Ob5q/GpQCq9o
         uAM7ZfNNXKQXQOyMFFFDRcEE/vW9efRr1MSfcS7xA8lFzHJF0H2MVE6kT3+6SnJwrZEJ
         Psqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706155; x=1761310955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4bSP9GQt7FORwrA+J8Ois4dTCuC1ORD3sY+7G7RdZis=;
        b=BLJshXA/TY0l8d8jiAqC1/SO9eIlv+OGeAUKQFfI+30SmrhY8a7j8QLXKtWq68J5Qr
         8xcNCi0bmWtknFwJnCbgMcYpsiGKbrVbludl3tAsfIvWzfkgJcc/5EPS2XAmI3R8w5kJ
         2Yuw6pW+xjM9cbUTIu110+Jj+v1V8NCc3n8tXX5IgnHsECCFX881EdbZ32HX2yv3MIRX
         EEjJaPnF5HYlVXdjhU2LltXhr90xRX9eXo0csy8X7COmFqX+xm3RT/BD3czqwhHj9yjx
         SZsOMsTYo+OXoKUAUkpzZB4tpzUvk6DHzP/8Tt2zeuhJU8tPN6fY7ZC19Gonrk8uwU4Q
         8DsA==
X-Gm-Message-State: AOJu0YweDJ8rHo0DfUCJ/dyQKZBj5Ga10ZPJbnZQ0h+vqHqBiQlBHueG
	dECDdcpY/i5JdSJEEUKwNCXu+ekJgx0wkpK4c/OKJmImSO0FohshWYUhy2hFGw==
X-Gm-Gg: ASbGnctXFny/zGcz1xlk7W2Hw2rfJ0PRiDG5MitW90O1fNrNP5HTCWcPZmkHr5Qt6yd
	H/jZip4g9WsbFiEMrkXioB13OZUaxc6dLfUd7Qp9K+M6xJlAH+JnEfc3wEseBvzNjyhLEeVChw2
	HnrByBgM4SaRI9MK08NsXF9jEcQqrvua/5QuG4o3qJT3jMAFE5G0uzS3Ftwg6mkkcM9q0nQmYoo
	FvGWFcS9XDZHkZBuPG8i8KQM0ZbnWunQXHOPuD4aXm/I1AtdJY6w3nM1hahYByatDNCPmer9AK5
	Rkt9KVqTY+gDvQ8cu9CjxczrcZB7xp8arymbvdICUO+cxxJOzN5kDwk1HhtPejfq54hsB/80EVh
	uR6A4T6sxasZFuU05IRrSaZK7nygxa1dksofZxZheXoLXYeFpF1Vl/HUx2FD5pwbFBSX5hqnnW3
	9p51xSHGQspSat
X-Google-Smtp-Source: AGHT+IGfAHPdE6psiiXsQ/iCTk1X/lB8Du+lcdDd7IsfXjbFF6M7bwgzzecHBlzNKPsMyKduz3U+Qw==
X-Received: by 2002:a17:903:19cb:b0:262:4878:9dff with SMTP id d9443c01a7336-290c9c89fb5mr44548485ad.12.1760706154509;
        Fri, 17 Oct 2025 06:02:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7d19dsm63973925ad.71.2025.10.17.06.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 03/29] hwmon: (lm92) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:01:55 -0700
Message-ID: <20251017130221.1823453-4-linux@roeck-us.net>
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
 drivers/hwmon/lm92.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
index 0be439b38ee1..91a6b7525bb6 100644
--- a/drivers/hwmon/lm92.c
+++ b/drivers/hwmon/lm92.c
@@ -32,7 +32,6 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -78,7 +77,6 @@ static inline u8 ALARMS_FROM_REG(s16 reg)
 /* Client data (each client gets its own) */
 struct lm92_data {
 	struct regmap *regmap;
-	struct mutex update_lock;
 	int resolution;
 };
 
@@ -199,15 +197,11 @@ static int lm92_temp_write(struct lm92_data *data, u32 attr, long val)
 		break;
 	case hwmon_temp_crit_hyst:
 		val = clamp_val(val, -120000, 220000);
-		mutex_lock(&data->update_lock);
 		err = regmap_read(regmap, LM92_REG_TEMP_CRIT, &temp);
 		if (err)
-			goto unlock;
+			return err;
 		val = TEMP_TO_REG(TEMP_FROM_REG(temp) - val, data->resolution);
-		err = regmap_write(regmap, LM92_REG_TEMP_HYST, val);
-unlock:
-		mutex_unlock(&data->update_lock);
-		return err;
+		return regmap_write(regmap, LM92_REG_TEMP_HYST, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -396,7 +390,6 @@ static int lm92_probe(struct i2c_client *client)
 
 	data->regmap = regmap;
 	data->resolution = (unsigned long)i2c_get_match_data(client);
-	mutex_init(&data->update_lock);
 
 	/* Initialize the chipset */
 	err = lm92_init_client(regmap);
-- 
2.45.2

