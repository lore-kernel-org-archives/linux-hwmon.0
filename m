Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FB72C2361;
	Fri,  5 Sep 2025 20:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104927; cv=none; b=ZuSNi0kKrer9NLFEFfKH4dTLD8HUAEi/xUV9LChfTIkRMN8LaKINv6IJcLpqET7oTrCMm5Y8zy79AJ47+TxxDIZSOeMPqf1Jrsfzq5mOXBnkjaBpFPJlBh+XjNLMywKACU/uUobeuqE1dJ76wWEBO5HxtKlQu8xUWYA+C0HfFC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104927; c=relaxed/simple;
	bh=EP2Tc59p6Ncb1/OGCCUDI9p4/7a+Y0h8hprDu4OZL8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7WOk8/ELX94fMMIMKRtrhmj4e6T1BPu/AH2sEp8ikBvg8uAx9AclzPEneQMd2i//pXUQQ1IM7wTjFk0kJ0rotsw8Aw05sNcq5+LB+XxohyVx4xCa7GPyajPvxctOWQoA991BQ+i+r0hspUtnIa2EP3WVTtZzLMO0W5PnUdomiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnPUjTic; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnPUjTic"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24a9cc916b3so26382085ad.0;
        Fri, 05 Sep 2025 13:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104925; x=1757709725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXBiGXmBXElDzspHqL+B7/TRQHRnTqrXU4hnBefqjpc=;
        b=DnPUjTicG3KI/n+tHBs/RhV8FpvXUyHqHJR8SdBtpdl8V4OgmQm4kSQ5krxQbLM6As
         DHBKYfCGhQ4fp//592wpKGbRIneiXymtYfWptUNMVgvLgKV0BcdxOXR3/11aEKGNg7Uq
         f/tG4NSKJQHb4iuVxWPXP7UFFccRN6hHGHDlZ/w6kkvcEvZq22m9KDzUxh2obU8Fi+2+
         ePwBrsFwlXs8lU1eADG+EhwGimevbGTcEM0JgOUYdT5BL2nMtLiKC/Fz49JnuJf+HsrS
         6pS/21/Babm+PUYu4o+cnyjeyx7XHNYcLkCL+9i6lWjumIaAptTlMn9P0ZwHgkNEItVU
         DQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104925; x=1757709725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CXBiGXmBXElDzspHqL+B7/TRQHRnTqrXU4hnBefqjpc=;
        b=iJ037CgI/oSOC9G5LExOCb4AXlyejdBVi9zosQtLCInH09Nwp+CZkTzdb37qFAz7JT
         jxiVOKcu7vt5OqdCIYTNBo5s5Vqa3vYo4AuAY4pZ4jUf/3CHMMt8b34LLul89r2xcSub
         ic7JD/KLvor1n17hOFKBlmz0JlHltQG+J1NLVW3W8HPfCbE900D3KiRjsHFNO5E+q1Rd
         bEvGCYnxGyl7ZBE92dl71aFEUyDkMcrzSKxDnCE7AZSlGb5LEDhSNrn5ModXpNOfwY2m
         SEM9GEcr3tMrsq3C9o3ZUxUYIezuSlL3Za+kgw9OdroojtDnBnk+nRFWSsfiwZxKPJPg
         GMiA==
X-Forwarded-Encrypted: i=1; AJvYcCXVqr61cYjrx5vMHHKP7GmNk7Byzm/mlO79zziJyr3ehG+OWICZSLvCQUF+a8UvmMAYrjcx8rAYCczn@vger.kernel.org
X-Gm-Message-State: AOJu0YytiwPgp3AZAiZG7uT+3nWhiD3sYit4DPNcdjOohIy23um4hNhG
	0far5x4Q/xznuEFCRQ93PM+QEiNTk1++aIJXUUP3NMgJgYUJCcqljhcvc2HfS8W4
X-Gm-Gg: ASbGnctqPBzIPMrjj/JfWhAMW8pom9Oj1hBeo375rz2IOOqyzq2cKPAHOq/45M4z4li
	8Tn7c2ZfIrnNskNh1phdKBqUX4B/ZrHrWrXGEVnh35Xt3aEOgWh0sN3gAyO42JIT9MlSBKs+Bs/
	P9YCsraOQdZggTOn97xoOmsiq5Bdl+tX+KUHNYRoERgiKZJ9odspE8PouTn7SgXfoqxb8Mkufeg
	Nw439+0jAJSdicWxBSyGvH7NTSvWGGDYMxN5gZoXPLZ05aaviPkx6W5IH2P0G2Czobv8aWNMxD8
	KR0rA88jNFHSOePckHuAP88JEouXz+SqnkY1CF0pD6EdxR2Q7b0zUTM+ZfYSaf9d6G0y2UWtL43
	dNLRheiv5JdiQyYMhXle1sY8dBELYJ58yUbuOdNBb2fUytA==
X-Google-Smtp-Source: AGHT+IHfZj4Xjg4icZLbm9PEEpIqnQ5x3R4s0dY1cig8rCm3lXAsCjNN1HHvbY9GMB5wWlpbY/Vp5A==
X-Received: by 2002:a17:903:2ac5:b0:24e:3cf2:2450 with SMTP id d9443c01a7336-2516c895cc2mr483575ad.2.1757104924901;
        Fri, 05 Sep 2025 13:42:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccd655823sm47472865ad.114.2025.09.05.13.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/17] hwmon: (ina238) Drop platform data support
Date: Fri,  5 Sep 2025 13:41:43 -0700
Message-ID: <20250905204159.2618403-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250905204159.2618403-1-linux@roeck-us.net>
References: <20250905204159.2618403-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no in-tree users of ina2xx platform data. Drop
support for it. The driver already supports device properties
which can be used as alternative if needed.

Also remove reference to the non-existing shunt_resistor sysfs
attribute from the driver documentation.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/ina238.rst | 8 ++++----
 drivers/hwmon/ina238.c         | 8 ++------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/Documentation/hwmon/ina238.rst b/Documentation/hwmon/ina238.rst
index 9a24da4786a4..9b830e37c986 100644
--- a/Documentation/hwmon/ina238.rst
+++ b/Documentation/hwmon/ina238.rst
@@ -29,10 +29,10 @@ The INA238 is a current shunt, power and temperature monitor with an I2C
 interface. It includes a number of programmable functions including alerts,
 conversion rate, sample averaging and selectable shunt voltage accuracy.
 
-The shunt value in micro-ohms can be set via platform data or device tree at
-compile-time or via the shunt_resistor attribute in sysfs at run-time. Please
-refer to the Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml for bindings
-if the device tree is used.
+The shunt value in micro-ohms can be set via device properties, either from
+platform code or from device tree data. Please refer to
+Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml for bindings if
+device tree is used.
 
 Sysfs entries
 -------------
diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 59a2c8889fa2..22e2b862fb33 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -16,8 +16,6 @@
 #include <linux/of.h>
 #include <linux/regmap.h>
 
-#include <linux/platform_data/ina2xx.h>
-
 /* INA238 register definitions */
 #define INA238_CONFIG			0x0
 #define INA238_ADC_CONFIG		0x1
@@ -745,7 +743,6 @@ ATTRIBUTE_GROUPS(ina238);
 
 static int ina238_probe(struct i2c_client *client)
 {
-	struct ina2xx_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct ina238_data *data;
@@ -772,9 +769,8 @@ static int ina238_probe(struct i2c_client *client)
 	}
 
 	/* load shunt value */
-	data->rshunt = INA238_RSHUNT_DEFAULT;
-	if (device_property_read_u32(dev, "shunt-resistor", &data->rshunt) < 0 && pdata)
-		data->rshunt = pdata->shunt_uohms;
+	if (device_property_read_u32(dev, "shunt-resistor", &data->rshunt) < 0)
+		data->rshunt = INA238_RSHUNT_DEFAULT;
 	if (data->rshunt == 0) {
 		dev_err(dev, "invalid shunt resister value %u\n", data->rshunt);
 		return -EINVAL;
-- 
2.45.2

