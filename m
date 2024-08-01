Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394291A617F
	for <linux-hwmon@vger.kernel.org>; Thu,  1 Aug 2024 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523776; cv=none; b=Qi/SWc/Fyv2XpQ3jY/29SAZq7qRaEIMELGd3cPk17B7wjPKeC4qm5VOOddg0jhi4cHkicZTh9seuFo8vihchVOkmxTzfozhUmUR+wD516GyeC9hdEouePFbgX5yjdpqXvdN3JhaeoCqAmaaFaU03JnovRC6qFYAumdp9ARPal0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523776; c=relaxed/simple;
	bh=JH5lYA7VqCTKZ3DK03YwyhZf0ymRT4+TdtYv8tuo1Vs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z0vjYxtaMgjy60C/NgCVZXxko91LDb0VZ35RMciiH75u6oJw6Y9Qlz/lfchR/s1nLHh7n+k6ECzRIEdjTtOqg6i5R2Wgg/HWxp8AddKVGBY7bpPDoPoH7Ew2ho/ZbMIZPsGCuEYC3x0TeE9Tc8GqBBpGnVfLvo4iYxplfdza9xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYpUPeN7; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYpUPeN7"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70d1fb6c108so5164981b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Aug 2024 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722523774; x=1723128574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuytEM3n0tgnd9qbXK4VEid7SLNyto6RStRQXDeGveY=;
        b=fYpUPeN7WCWLAV7J6lHwV0RToT1EKTWeXauVSbfwg4oG0bhRnVX/0g2NN9zD1ohqD6
         Ca0LvKeMxdbTqLJj7LLJexbbKWO35wb5hnOQ5jXngQ/6pczKem2fpAbrs0TqUu6j/w+s
         w71V0UvXA/CqX3JN5GTv0EsG+gsoUhGOOe8inzk6mXjKtVsjCE4HStNpJUO8eerNGO5M
         /81f3YVQX/Lfyh7xrUlGjfOxzvAZmqPACzns1SMcurF+zk1aCG8JllqioClC9VphOXJY
         IjpnOrb5v8WGUAveHuNjIoQcmaoB2se63wk8LGHHZnuhumsd9dQDOm4CahvLPA215J6p
         KihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722523774; x=1723128574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MuytEM3n0tgnd9qbXK4VEid7SLNyto6RStRQXDeGveY=;
        b=NKqNdl4ACnuJx7PRHzGgrX+WQoQz1dY1/l1fO8NTl0oPAoVnAGC+G0DzfjqTGxTNMw
         NCLomENvrhGx5P3m3QYfwrrMMMG+Ocim2we5Br8JjuupsOX0Dv+AJ+7/uv0rR91Ema4X
         W8VrMhGTLEKip7flb1RpyKVgAfudO4lOjoJysZDCQPb2yRi9HsaAYmJtSeIdaCo2XlYK
         Z7SXYc9i1XiBcvoGr9ycXXreVtnuK8ukBHcqJVtaB4TUjg3dohJWSHhPCHft9izmd9tb
         LKSK4xkasx4N7nNJxQMGC3Z7Xu04baII46E1DWjuejmcpx1+oTKbbrTMQMbSkcVpZYPr
         qIYw==
X-Gm-Message-State: AOJu0YykgYfyzTyCEVz2Yj9wVPV4Le9LEiJuBsXezJCjciY7yiTe7prR
	qekfeRtSnSXwjNsVOFPy3zYzbIUyyh9mZCMMvAIQctAq4+RXG6y+rPYY/Q==
X-Google-Smtp-Source: AGHT+IF0udbaolj31iVADJnZu5xGJFrvXVzl/nLqJlPIdzhqFBUTGzwv30PTr3/fsqBR+xoqMyXLWw==
X-Received: by 2002:a05:6a00:3d56:b0:710:66ca:5e83 with SMTP id d2e1a72fcca58-7106cfa1e9emr568883b3a.5.1722523773843;
        Thu, 01 Aug 2024 07:49:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead72b7easm11624556b3a.89.2024.08.01.07.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:49:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/6] hwmon: (lm92) Update documentation
Date: Thu,  1 Aug 2024 07:49:18 -0700
Message-Id: <20240801144918.6156-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240801144918.6156-1-linux@roeck-us.net>
References: <20240801144918.6156-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update datasheet references. Replace misleading 'force parameter needed'
with 'must be instantiated explicitly'. Explain the reason for the missing
auto-detection. Mention all supported chips in Kconfig.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/lm92.rst | 26 +++++++++++++-------------
 drivers/hwmon/Kconfig        |  2 +-
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/hwmon/lm92.rst b/Documentation/hwmon/lm92.rst
index c131b923ed36..d71cdb2af339 100644
--- a/Documentation/hwmon/lm92.rst
+++ b/Documentation/hwmon/lm92.rst
@@ -3,29 +3,29 @@ Kernel driver lm92
 
 Supported chips:
 
-  * National Semiconductor LM92
+  * National Semiconductor / Texas Instruments LM92
 
     Prefix: 'lm92'
 
     Addresses scanned: I2C 0x48 - 0x4b
 
-    Datasheet: http://www.national.com/pf/LM/LM92.html
+    Datasheet: https://www.ti.com/lit/gpn/LM92
 
-  * National Semiconductor LM76
+  * National Semiconductor / Texas Instruments LM76
 
     Prefix: 'lm92'
 
-    Addresses scanned: none, force parameter needed
+    Addresses scanned: none, must be instantiated explicitly
 
-    Datasheet: http://www.national.com/pf/LM/LM76.html
+    Datasheet: https://www.ti.com/lit/gpn/LM76
 
-  * Maxim MAX6633/MAX6634/MAX6635
+  * Maxim /Analog Devices MAX6633/MAX6634/MAX6635
 
     Prefix: 'max6635'
 
-    Addresses scanned: none, force parameter needed
+    Addresses scanned: none, must be instantiated explicitly
 
-    Datasheet: http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3074
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6633-max6635.pdf
 
 
 Authors:
@@ -36,13 +36,13 @@ Authors:
 Description
 -----------
 
-This driver implements support for the National Semiconductor LM92
-temperature sensor.
+This driver implements support for the National Semiconductor / Texas
+Instruments LM92 temperature sensor.
 
 Each LM92 temperature sensor supports a single temperature sensor. There are
 alarms for high, low, and critical thresholds. There's also an hysteresis to
 control the thresholds for resetting alarms.
 
-Support was added later for the LM76 and Maxim MAX6633/MAX6634/MAX6635,
-which are mostly compatible. They have not all been tested, so you
-may need to use the force parameter.
+The driver also supports LM76 and Maxim MAX6633/MAX6634/MAX6635, which are
+mostly compatible but do not have a vendor ID register and therefore must be
+instantiated explicitly.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index b2ace4857130..702ed8502aa2 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1514,7 +1514,7 @@ config SENSORS_LM92
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for National Semiconductor LM92
-	  and Maxim MAX6635 sensor chips.
+	  and LM76 as well as Maxim MAX6633/6634/6635 sensor chips.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called lm92.
-- 
2.39.2

