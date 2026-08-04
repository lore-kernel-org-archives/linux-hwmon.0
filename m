Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B1040C5AE
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 21:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785879391; cv=none; b=XJHRswFDXsqLx7F37HVr4kXDVBj56a3G/JWV8sNxSmboEcic+gKPOHHLVuNfCx5bplQG6LSueZb2pGpdCk6aDz4U7htt3Cn2Jc4ZinG8iFJacfLsZnxnM54ckyeX5MQbtBMsotGpmZyDH/4lo6naA9FCxCyUjP9c7xlzNtRCtsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785879391; c=relaxed/simple;
	bh=/ffgo7l9DAfFAj2pKbEZg4UfVKgGs61WLQgDMg0UJJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jtEAeev2bs7/0bX9EMph1HNNbQXCCLvTqq9p+nKMZinwZUJOialZBz7OHgRIcrfIfu8ylMvGSJx0/dLkmWwYLLAhv1gDa/8adjBszlDEw9hdY4QmfVaCWgdeW98JkHDbHu55wKthP/i2sbyunUMbC2YDnUVsFRPo/8Nkku3mG+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2Pu9q3k; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2Pu9q3k"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so289777a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 14:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785879389; x=1786484189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKrNxiC7XW8YCLy/rfgvAzRcGrofB3mIcwpSBJE2qzA=;
        b=m2Pu9q3k7XKds2cdtwjd6LIVhZ6hUKks7wXR+RlwdYRbren0HdTVDq1c62jJ+14nCw
         /IzIn8dm2S5qd/DXSQwIqEXt3i1GxrlBjCapMs+VBAm2VYz8+V6tjDZxX4mwOc84doqY
         UdfRj6MIow9abDalevPdw03nYtBgY13DQ4QMY3ajbbXHK2X0hV1urH2napiON1T7Jl+r
         pdwE7WRZDRr/9AQFEwHI9qWhRf3A6x9N9IMrx4nGni9bR59y+5gSpJysPYWeD+uBf6/S
         jS18UVtpjAGgHrhrBjoPS91nIAsvK1nnUjZx5qjaDz+ab7ESNa8VZFhaXreM+9pdHpl6
         N5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785879389; x=1786484189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKrNxiC7XW8YCLy/rfgvAzRcGrofB3mIcwpSBJE2qzA=;
        b=h+WmkO/rRxp1TL4o8WFKBaIW8ZLgL6lkTELcnUHQUUb5602ZIQneS2hrdtygbZ493r
         /T4t+cItfzxqDjBgCDZx0caYsz/nGMvpVMM+O5UTEqw1FcWzRED/OH+zN8Cf9h2gqjg1
         aEQzX9hykfKYrXGDecPPZvTegtsaFIqIfWL0wpzb3EO6ednH0ylbaWbu1BYA/cCPd/VC
         ON+mPV6aEeqWZvsxY2Tw97iuLiZLjzoE+DZfi1Oju3U9MvbtjF9AO7sb6Vh8/I+28bvy
         5r0CqupYfMvPm1G7/nkuPqpaYqq2CcBwHmFwrbjA6vqn6sezPkNb8P7of7vdJ5Qr/yxY
         dGMw==
X-Gm-Message-State: AOJu0YyOm6cL7Hv6d7DCMJKQECl7cmrHv6/wbC3UWr3aEWYf3sF5ZQzM
	JoMz14/yWStxgEJwaAmmh6M0d7uVAeEa+V1xnaRGp7mxJ0NNWXtw6Bdvdk3q+w==
X-Gm-Gg: AR+sD13Cxlhpa2rNvApIF1wnRqAd0yws4+xE6c5qbKmWlFrpaDdyr5xoW767U8Vb3uI
	nw5tOnXgwDp39vxav1Xy4Emyp+CZ2LpPdUdaqe7FooFSGPYefur1EaJ1JRwi0RsFjIlOTKgX4Zj
	KLUd5QdJrPDamHh7kuClZZooWIZOsIrzGKxmPvFJ6z4BOlGcWJilMNmD5AEiYZCBUus4KfOVqxN
	ut2DAESS6K0XRQdDeHXjqKf2/TGH2rioNesj6HhhVb7ndLBcrcyhSofXS5L2XhjJ9OWT6Sy9Lq8
	hkggwUREQsP5Fj4piULRfeEN1304rUhyqGPTiGUI/DOH7O65Kk5hreprWAdw6DZmXZ/BPR4BRTM
	vbWWthCTcWtP0gjRGLrfafqflFFcGvxQlUvx9tPt+GDr51brndeIvQ7Wxudib9Z+NruKpJ1s4x0
	kq4P52k/UqTL/gIeVLl1oI7ZBFMFZWKFUMJmAjT4TxhLBTKfNzeuKGGkho2tt3prNAaQxvA0tni
	A==
X-Received: by 2002:a17:90b:4d8c:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3903c544f17mr1468140a91.6.1785879389177;
        Tue, 04 Aug 2026 14:36:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390392aee23sm551480a91.15.2026.08.04.14.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:36:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] hwmon: (pmbus/lm25066) Fix PMBus coefficient calculations
Date: Tue,  4 Aug 2026 14:36:27 -0700
Message-ID: <20260804213627.1522664-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In lm25066_probe(), the PMBus coefficients for current and power are
scaled based on the shunt resistor value. The calculation evaluates the
multiplication using 32-bit arithmetic because info->m is an int and
shunt is a u32:

static int lm25066_probe(struct i2c_client *client) {
    ...
    info->m[PSC_CURRENT_IN] = info->m[PSC_CURRENT_IN] * shunt / 1000;
    info->m[PSC_POWER] = info->m[PSC_POWER] * shunt / 1000;
    ...
}

For large coefficients like 26882 (LM25056) or 15076 (LM5066i), a device
tree shunt-resistor-micro-ohms value exceeding approximately 159,000
(159 mOhm, which is physically valid for low-current applications) causes
the intermediate product to exceed UINT_MAX (4,294,967,295). This results
in a silent wraparound before the division by 1000.

Furthermore, if the wrapped value has the most significant bit set,
converting it back to the signed int info->m results in negative
coefficients. This logic error leads to drastically corrupted current and
power readings, which can cause erratic thermal or power management
behavior in the system.

Fix the problem by using 64-bit operations for the multiply/divide
operations. This can still overflow, but only for unreasonably large
shunt resistor values.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 94ee5fcc240fe ("hwmon: (pmbus/lm25066) Support configurable sense resistor values")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/lm25066.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index f20991001727..497802c646e9 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/log2.h>
+#include <linux/math.h>
 #include <linux/of.h>
 #include "pmbus.h"
 
@@ -579,8 +580,8 @@ static int lm25066_probe(struct i2c_client *client)
 	if (of_property_read_u32(client->dev.of_node, "shunt-resistor-micro-ohms", &shunt))
 		shunt = 1000;
 
-	info->m[PSC_CURRENT_IN] = info->m[PSC_CURRENT_IN] * shunt / 1000;
-	info->m[PSC_POWER] = info->m[PSC_POWER] * shunt / 1000;
+	info->m[PSC_CURRENT_IN] = DIV_ROUND_CLOSEST_ULL((u64)info->m[PSC_CURRENT_IN] * shunt, 1000);
+	info->m[PSC_POWER] = DIV_ROUND_CLOSEST_ULL((u64)info->m[PSC_POWER] * shunt, 1000);
 
 #if IS_ENABLED(CONFIG_SENSORS_LM25066_REGULATOR)
 	/* LM25056 doesn't support OPERATION */
-- 
2.45.2

