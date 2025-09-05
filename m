Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1402D320E;
	Fri,  5 Sep 2025 20:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104928; cv=none; b=cu4w48E4u5KYucYyhH4/K0Fxj35Bw/oIkuXTBsItEtqEVnbknDfHmTaeF459ghgo2agpQ/JG+5KK2l1VF1burO2LaFbHtPB2rgJBr9aP0YSjGHRNI6mKCryoPMhkVp/jzmLKPwvFKEPCKGdqXF4CM0nV+RXlGqB2t8B7z/wqNpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104928; c=relaxed/simple;
	bh=9LhsD6lTzZxOWAg6kxgoBwoIdtk17JIcJc5rgfU3YRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xvu19cZNQrrqvcLHcxG1m2ca73aiPXXcpqJ5MNAepDbyMP/rmLqSiTDMxmirOM7oM+WsolVKS+s13bKJ2ltcygzNQTbBaYnZIRJsDLqruOHcHlV0+fj8y1g0mWUUGqCzIOvqqr/UtSj+9U1RULyfOEuGMsCHxd0e0V4ejJY3YKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnoU7yki; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnoU7yki"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b47175d02dcso2030431a12.3;
        Fri, 05 Sep 2025 13:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104926; x=1757709726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8fesGYR36HiXg9Hz0WNLOWLJqeZUuP7GLbcfwHz0cY=;
        b=bnoU7ykidJfgLzyz0v/aAUSmeoL2b4zbXy6Gy+PBD2QyXkgDxaBz0UUS0yY8JCaMU0
         LmZ3VOMGe3P8LpL44rVk1VLImRL9zZm744JZdmR8HMyquqvoP8I+Xm5+/qP/QetcehI8
         X1cY/QCXz8qia+SAS77IM1ojWx+rQiC9jMB63YmIKLjW6YN65IC25305Q/KG+Gy/VH/A
         AVkqbyDLukiCzLvt8cioJaGTP1CVaIoiebs+t9l56jH8vzys5ywVZfJ3tXkXA+sbFakg
         b1Z8wFl59t5RDyal1zNJduT1XC1cUFtlbTm1n5CMA5yZzpARhukUu/ZEaCQR8dybdkPe
         dBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104926; x=1757709726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8fesGYR36HiXg9Hz0WNLOWLJqeZUuP7GLbcfwHz0cY=;
        b=Mbz6DzIT4zey+Nv860n7wzcGUPwshS8DP2BtttGsJzGE6diH/80zYYqzNIENpJas2Y
         +2CBcPX0xnFDcI19Jq1K+XbZgIsjXSqELRud45hWjd0O7n95wYN89zBWyKWBZvaRsMqD
         OzeTe51//WQf07d8DqjFUatqfeb8CwSVECCAojO3rBIsMKssq294fNtHmp/YxYGdnGJj
         eoxzYWLEOIwJCwbrIdg1bXHESH1RqETR4FdA70Sy5Kt5Y3NYUSehmKB03PnsgRMhdzK/
         y3GHHr8VERco5d+/jg58lFL6w8+Y7o0hF4Uc+b/+LQf3/MKLqWcxBff+QwpGK36zjyQj
         YAlg==
X-Forwarded-Encrypted: i=1; AJvYcCWAjYyChRGbaNDapiIzbEKp6L53xhiN0vm1JlcozSzLDMqGD9mXkHdnRmAISOnmtddboDuD5lrr0BjW@vger.kernel.org
X-Gm-Message-State: AOJu0YyyyGrD+uHCpbQdwDmhkur0ERl6pgo9o+b0uAvgXJpoKpcn2a2B
	/Q2KnOxtQjHrvGqr2KSICg/ExwsbHhuRe/0mxg38vi7bNkXGtFWdJWkGFmdbtY3A
X-Gm-Gg: ASbGncssi322Qb3PzkfeW8+NRExemgbVrDAOEDImzeUH24oqWMragv/SfFBvhQ4VImu
	kYr7TRs5EsqARh6OQloQRiL+mftbZm+R8zK0UGO+nEPYHlNKlZ9yliQ/BKfCmsAsNpuN0DODjDp
	RPZjhZdqrHfKSmLbs6mLzVa6g16dT9rkoCfW7iA8k2ait7OJdbaA7pGdm4OLXTT359QccU9AUVy
	wxhGxPWOdr4dtzGql9BOdkkfbjczTBIFI39mh6KogHpfBOFeAoHT9oTyY9kLhnb48cRkyE64ba7
	28VwUYlFOs+CmScoUKPLd6vnX73p/oeOxTpbH3r/mTCWcUj1kYsaHBD7pGtRXg0fX3cp3vZFp3g
	RQGHt9eIPLYcFslmEHRR3kl8p7vTeuDVcJGw=
X-Google-Smtp-Source: AGHT+IHDZ1Z98xaW1eVtaImrW3+8YnXMOMcTmKbn3RS2v/I0rObwg1QUs99/x/frcqGng2Ru9wWd3A==
X-Received: by 2002:a17:903:320a:b0:248:79d4:93a9 with SMTP id d9443c01a7336-2517408dcdcmr177995ad.55.1757104926190;
        Fri, 05 Sep 2025 13:42:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cd5092951sm45459425ad.18.2025.09.05.13.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/17] hwmon: (ina238) Update documentation and Kconfig entry
Date: Fri,  5 Sep 2025 13:41:44 -0700
Message-ID: <20250905204159.2618403-3-linux@roeck-us.net>
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

Update driver documentation and Kconfig entry to list all chips supported
by the driver.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/ina238.rst | 39 ++++++++++++++++++++++++++--------
 drivers/hwmon/Kconfig          |  9 ++++----
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/Documentation/hwmon/ina238.rst b/Documentation/hwmon/ina238.rst
index 9b830e37c986..1ac4e2c419ac 100644
--- a/Documentation/hwmon/ina238.rst
+++ b/Documentation/hwmon/ina238.rst
@@ -5,6 +5,24 @@ Kernel driver ina238
 
 Supported chips:
 
+  * Texas Instruments INA228
+
+    Prefix: 'ina228'
+
+    Addresses: I2C 0x40 - 0x4f
+
+    Datasheet:
+	https://www.ti.com/lit/gpn/ina228
+
+  * Texas Instruments INA237
+
+    Prefix: 'ina237'
+
+    Addresses: I2C 0x40 - 0x4f
+
+    Datasheet:
+	https://www.ti.com/lit/gpn/ina237
+
   * Texas Instruments INA238
 
     Prefix: 'ina238'
@@ -34,6 +52,13 @@ platform code or from device tree data. Please refer to
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml for bindings if
 device tree is used.
 
+INA237 is a functionally equivalent variant of INA238 with slightly
+different accuracy. INA228 is another variant of INA238 with higher ADC
+resolution. This chip also reports the energy.
+
+SQ52206 is a mostly compatible chip from Sylergy. It reports the energy
+as well as the peak power consumption.
+
 Sysfs entries
 -------------
 
@@ -53,19 +78,15 @@ in1_max_alarm		Maximum shunt voltage alarm
 power1_input		Power measurement (uW)
 power1_max		Maximum power threshold (uW)
 power1_max_alarm	Maximum power alarm
+power1_input_highest	Peak Power (uW)
+				(SQ52206 only)
 
 curr1_input		Current measurement (mA)
 
+energy1_input		Energy measurement (uJ)
+				(SQ52206 and INA237 only)
+
 temp1_input		Die temperature measurement (mC)
 temp1_max		Maximum die temperature threshold (mC)
 temp1_max_alarm		Maximum die temperature alarm
 ======================= =======================================================
-
-Additional sysfs entries for sq52206
-------------------------------------
-
-======================= =======================================================
-energy1_input		Energy measurement (uJ)
-
-power1_input_highest	Peak Power (uW)
-======================= =======================================================
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 9d28fcf7cd2a..23d51e61d993 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2252,13 +2252,14 @@ config SENSORS_INA2XX
 	  will be called ina2xx.
 
 config SENSORS_INA238
-	tristate "Texas Instruments INA238"
+	tristate "Texas Instruments INA238 and compatibles"
 	depends on I2C
 	select REGMAP_I2C
 	help
-	  If you say yes here you get support for the INA238 power monitor
-	  chip. This driver supports voltage, current, power and temperature
-	  measurements as well as alarm configuration.
+	  If you say yes here you get support for INA228, INA237, INA238, and
+	  SQ52206 power monitor chips. This driver supports voltage, current,
+	  power, energy, and temperature measurements as well as alarm
+	  configuration.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called ina238.
-- 
2.45.2

