Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAE01F7070
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Dec 2024 14:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321883; cv=none; b=AGdUM6oNAoahOHqhQTqAyawGF/t5AvMC90h/j/Vzz92TwPEtOiDT8h7e4VZE/3CeB7AMh8e52aolSfXiO6Y1doC+sTzBPlZXYnmV0aTZHk8moZlMh/RMsAf6z1O1a1qIKzeScAdiw/9m2KGbysJSb9T4q4a9+RuUjwz1DXRkPKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321883; c=relaxed/simple;
	bh=UwRahdqbde6Qnf1D4GC7R+OsYwHfqtJ36Z5ECriMpJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SODqN4Pk+7KPpKUukhfjPPHWRZLol+ErSPgza77TPtP/hC5FtYzK48jJ6rCuiAt1Vv8a9Xx0Lcr2OKL0VgbNbs/FtGRW067yQ/PjkgZvpTGHK66/QoeMzQ10oFHyieSNG+HQZzUGo4cpmbK2v2NuQ6yPnrKbdzF5Halu1XUZpUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsAgffSI; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsAgffSI"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee74291415so3355862a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Dec 2024 06:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733321881; x=1733926681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvPg2aB7a8x3iMJ9za/f0ZhmqjMO1TeH+F7iZzpjx2w=;
        b=LsAgffSIJe8gtqXiREDlEwdvrkg68RjG4EWC6A3CR5ExUkIwnfA2ngmW4/qVuSg1W0
         s63Zowio8+gNEPIa/YXE9TOeeS2sn8JHmZFhg//YMvzifdhtoTDj39msXqwOyU4DftCi
         i7cCve56ZyLQro3wajEQnheoYLj9eTGMdi4MB5Nm0MKzgi0Dzgt2iWBPuBVtUI3ujlyp
         vzxCNGFERWGfcy8VJrc97SKhhuHP7c2u+pwpZppNnt5hf4RcHgUt40TZlUib9ykcL6Ew
         tNpmt69KZaoTaI5Dlr4zW952CJmK28RYEWhg8/sLmXcVHKYTBsxKQOqUTv9z+oPEqXsZ
         cITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733321881; x=1733926681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvPg2aB7a8x3iMJ9za/f0ZhmqjMO1TeH+F7iZzpjx2w=;
        b=ieMmx2Li4J6kflQ1PyIDRXGlBvhblx7JmXe/WbheI4oPhiqhGRn2qdS3MXyIja72Na
         JjsvggLcLnyD8mf56AqKkquk1d/qUf9UFFZUdbmlX29gcCJCX1OSRijT8jNJaPH2b7jQ
         YlaCkb97xNdwg30Z7bMn6QaVolX1oLGj4Q+NCZE7TiU8/esscfbdp9Dznuch6/thViV7
         xsfYvsm1UOtZSCRtJ+qZP7pvEm/3rKV8GO0ZuoMCkb5mBt8PzQL0A9bWw0Pozto572nh
         Crma41W8+YAt74extCsCxGSrvE7ZRyBNaHTWejQJgt/SfLphorQOtJHIoTdv7BI9Im32
         pBgQ==
X-Gm-Message-State: AOJu0YwcRQcszeJY0YT+90RcmVbZWVW6MPpuNq4r8O3Q+W9KbYNGkHwS
	ORh8dh0PydnBIP0Uf39l03PsCVMq8eQEzAzAFf5qXysTsR6LHnLZWTF4AA==
X-Gm-Gg: ASbGncv1TA7VZChpON7ESXnIHQI7VVbhHboqEW/W5J7QpJEhQoqvmLybtDVez+MB3pD
	J3HsYRZmEIdOvMzcpR1GgprYYJtc8VuMwyyyy6WtylKK37dQxwKCeS1rSALF6htUBKiqAuLiSOP
	b8cSQJW3ReMVFy6oSDm9YbHrlMEObAO0nglMzE5M+6RwA0sSkcNvSwWFTcNeYTU5ZL1iupCQT0X
	w79eVM+W2YjA4GFkPF7t2wdxAA2moPLSJO3/6aaR24Cjabo6hVygq60FuiOYe4=
X-Google-Smtp-Source: AGHT+IF3gTYSlZhI2lBvzyuErwrELX7s1ScQCJ1O0e8D1fPyw+LiDcnqQpdG+dWlVpEnzxbty9byOQ==
X-Received: by 2002:a17:90b:38c4:b0:2ee:b2fe:eeee with SMTP id 98e67ed59e1d1-2ef1ce8380cmr6848194a91.15.1733321880452;
        Wed, 04 Dec 2024 06:18:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef27031f64sm1441653a91.24.2024.12.04.06.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:17:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH] hwmon: (tmp108) Drop of_match_ptr() protection
Date: Wed,  4 Dec 2024 06:17:54 -0800
Message-ID: <20241204141754.4051186-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Limiting the scope of devicetree support to CONFIG_OF prevents use of this
driver with ACPI via PRP0001. Drop the dependency.

While at it,
- Switch of.h for mod_devicetable.h include given the use of struct
  of_device_id which is defined in that header
- Add I2C device ID for p3t1085
- Drop the unnecessary include of hwmon-sysfs.h.

Cc: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp108.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
index fbe673009126..8110601263bb 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -8,10 +8,9 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/of.h>
 #include <linux/i2c.h>
 #include <linux/i3c/device.h>
 #include <linux/init.h>
@@ -417,25 +416,24 @@ static int tmp108_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume);
 
 static const struct i2c_device_id tmp108_i2c_ids[] = {
+	{ "p3t1085" },
 	{ "tmp108" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
 
-#ifdef CONFIG_OF
 static const struct of_device_id tmp108_of_ids[] = {
 	{ .compatible = "nxp,p3t1085", },
 	{ .compatible = "ti,tmp108", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, tmp108_of_ids);
-#endif
 
 static struct i2c_driver tmp108_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
 		.pm	= pm_sleep_ptr(&tmp108_dev_pm_ops),
-		.of_match_table = of_match_ptr(tmp108_of_ids),
+		.of_match_table = tmp108_of_ids,
 	},
 	.probe		= tmp108_probe,
 	.id_table	= tmp108_i2c_ids,
-- 
2.45.2

