Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED31143888
	for <linux-hwmon@vger.kernel.org>; Thu,  4 Jul 2024 21:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720129045; cv=none; b=LLM3O6l6plMB/n23lTAJapZMiDdUAQC2npAWgsYlHh5tLdbil7gPUGtOokNR+KvIY86kMKOCZkuHlQisiQjL40jHdRb3m4QviuRSWDQH31vurWIOD8zBDZmJGmkEx3/8TTwZA375oubp1I3wJqm2G4y0gkvjI51p5+Mnc2ON+d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720129045; c=relaxed/simple;
	bh=RPHBgDZxfcAB6HPPQzxHs4E1QEJkQXRPY/aZ5bC3glg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SpfVzQofVQ5EGV4NFPJJrJAIMCUlYbbxKXcomdXstm2Uwad72tVS0V272iAgVeZd2Idn/LMbtkSdAJ1mxR4UZrXQCo81S63PfjKPLSx/8B/KOrMPdnkcsKOdPlRgFM7feAikzj62Ctq9AELAfrLaiScst2lzcjp764zvpzdpxts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dpr7Aj23; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dpr7Aj23"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fb1c918860so13580185ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Jul 2024 14:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720129042; x=1720733842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cfcj/kKnCMp1UHLZbqSv0iOiyGovljmsk2n2/55swXc=;
        b=Dpr7Aj2355YgcDdX5akDS07aldeC8o7rTITZvBlF9jKdbcLNK5hpQTFkpQyH1Wr+kA
         i6J0qkNM/w4S/fakQkkYHwDuqGV3wJ5J3Z0NS/gLoMzDm4rZhR+51gZBQ6B0/3C96KQu
         e8ygiRQLmNh9PHgve5LoxIYbIqgHv1ufs1U+0gE2F9oUIEWVau11yY+E69rytIkngar6
         XRtrOUzcoI+o1CDky8Hgfx9Di8Vp4E1oHYb2re6CeNGASECxspzPdMvvqbLogBeFHbPW
         gBf2Q8UL+DaWMKb6sFxM0eG45FQLqy6PFx2JfBsOFycbHHElU1hfZpUKkEjpiU1DKswR
         gpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720129042; x=1720733842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cfcj/kKnCMp1UHLZbqSv0iOiyGovljmsk2n2/55swXc=;
        b=KhkEtkG1Vue/hcZub6QvjnudT3DPTcmNEE38lroochUtT7MI7lk+Ay9UrfMjPbeA6i
         9SE6Y72PS8J7s0riE5ImeVMt+QvLd71jLoebWhDvQ86oDLKzj/x0Ymou1Cwcf1bX6661
         ogkJkwZ3yXj32nIAIJZb5irwLqlcZ0qd7CO/HNsow9Kw3EpJPyKuKVuTgzEZq1u3cx/9
         OBAbasXDQ/s0S5R7a/YMGjYMrYgT1XnruTRZq94fnnsXZisPKhIkQzA/RJMZg96SobBW
         456Xu26ISnRcm1sgz2GlW0e7U5aNWxIU2OcyaA070C9JgizqbhjsLTGdoBE5gZVc2EFe
         4tiA==
X-Gm-Message-State: AOJu0YwLRT+7dSWztkb2EW+MzgovQ6HvOXLpQe8HQ+mXuWt3LNif34or
	EIiyVQuMwLHMHUNZiAJJuzV+u2pUP+waXISvBy2Y+uB94qB9/dyXtHERWA==
X-Google-Smtp-Source: AGHT+IHZd9z5rqWgJmibnPwNP1D5Zu34eCsLESbHkt2d3em4ng/PsWme4biMMMNvrD0KYygv2GhZsQ==
X-Received: by 2002:a17:902:e84a:b0:1f6:6a94:76c5 with SMTP id d9443c01a7336-1fb3705f98emr36455795ad.20.1720129041931;
        Thu, 04 Jul 2024 14:37:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1353sm127704715ad.11.2024.07.04.14.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 14:37:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/7] hwmon: (g762) Drop platform data support
Date: Thu,  4 Jul 2024 14:37:07 -0700
Message-Id: <20240704213712.2699553-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704213712.2699553-1-linux@roeck-us.net>
References: <20240704213712.2699553-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no in-tree user (or at least not anymore), so drop platform data
to simplify the code.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/g762.rst       |  4 +---
 drivers/hwmon/g762.c               | 33 ------------------------------
 include/linux/platform_data/g762.h | 24 ----------------------
 3 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 include/linux/platform_data/g762.h

diff --git a/Documentation/hwmon/g762.rst b/Documentation/hwmon/g762.rst
index 0371b3365c48..3dc5294b2181 100644
--- a/Documentation/hwmon/g762.rst
+++ b/Documentation/hwmon/g762.rst
@@ -17,9 +17,7 @@ done via a userland daemon like fancontrol.
 Note that those entries do not provide ways to setup the specific
 hardware characteristics of the system (reference clock, pulses per
 fan revolution, ...); Those can be modified via devicetree bindings
-documented in Documentation/devicetree/bindings/hwmon/g762.txt or
-using a specific platform_data structure in board initialization
-file (see include/linux/platform_data/g762.h).
+documented in Documentation/devicetree/bindings/hwmon/g762.txt.
 
   fan1_target:
 	    set desired fan speed. This only makes sense in closed-loop
diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index da43a26f558d..8573865a8989 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -39,7 +39,6 @@
 #include <linux/kernel.h>
 #include <linux/clk.h>
 #include <linux/of.h>
-#include <linux/platform_data/g762.h>
 
 #define DRVNAME "g762"
 
@@ -648,34 +647,6 @@ static int g762_of_clock_enable(struct device *dev)
 }
 #endif
 
-/*
- * Helper to import hardware characteristics from .dts file and push
- * those to the chip.
- */
-
-static int g762_pdata_prop_import(struct i2c_client *client)
-{
-	struct g762_platform_data *pdata = dev_get_platdata(&client->dev);
-	int ret;
-
-	if (!pdata)
-		return 0;
-
-	ret = do_set_fan_gear_mode(&client->dev, pdata->fan_gear_mode);
-	if (ret)
-		return ret;
-
-	ret = do_set_pwm_polarity(&client->dev, pdata->pwm_polarity);
-	if (ret)
-		return ret;
-
-	ret = do_set_fan_startv(&client->dev, pdata->fan_startv);
-	if (ret)
-		return ret;
-
-	return do_set_clk_freq(&client->dev, pdata->clk_freq);
-}
-
 /*
  * sysfs attributes
  */
@@ -1026,10 +997,6 @@ static int g762_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 	ret = g762_of_prop_import(client);
-	if (ret)
-		return ret;
-	/* ... or platform_data */
-	ret = g762_pdata_prop_import(client);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/platform_data/g762.h b/include/linux/platform_data/g762.h
deleted file mode 100644
index 249257ee2132..000000000000
--- a/include/linux/platform_data/g762.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Platform data structure for g762 fan controller driver
- *
- * Copyright (C) 2013, Arnaud EBALARD <arno@natisbad.org>
- */
-#ifndef __LINUX_PLATFORM_DATA_G762_H__
-#define __LINUX_PLATFORM_DATA_G762_H__
-
-/*
- * Following structure can be used to set g762 driver platform specific data
- * during board init. Note that passing a sparse structure is possible but
- * will result in non-specified attributes to be set to default value, hence
- * overloading those installed during boot (e.g. by u-boot).
- */
-
-struct g762_platform_data {
-	u32 fan_startv;
-	u32 fan_gear_mode;
-	u32 pwm_polarity;
-	u32 clk_freq;
-};
-
-#endif /* __LINUX_PLATFORM_DATA_G762_H__ */
-- 
2.39.2

