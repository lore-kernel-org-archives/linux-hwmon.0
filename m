Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96F42D12EF
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Dec 2025 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765479541; cv=none; b=aaWYYMHhWF0na38YlGm361stcemRL883Q98IbL6cBdqLnw2er9FPlru59GzqFJS0Yje/kqLfgxi0bn6azZMu54ak/imE0EVnuvWDoyqqGPQBeil7vnw5Xe0+kcC1b1ToD3DuknqLFgwDJZFYU+DvseI1eJJvptWMPxnTGQBA4PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765479541; c=relaxed/simple;
	bh=MsOIIXRZXWInpi+6YrWnzz4Og0s5+tzlQfpch+ids+E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WI4rpmGl+vmrFC3dDbnpUH7RrQoycpjC0KbKU1h6WmDSXn021gn+ruxTpl7atsAPwPol2LRTGzrRa5EoLd3Nz8PA9Yb5nqmWNbhXvzBrNQSmsMHbEaPhHY/12TrReUZE+T9LQeCuyBvvGFDE1Dq727kP8q5YChY/R3gXrKAIYAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnSaAxad; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnSaAxad"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so25964f8f.1
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Dec 2025 10:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765479538; x=1766084338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yXm/1fe23tTgVaqZTTxGSrbclEuIKybaqnfjNM/NaT0=;
        b=mnSaAxadJ0gejGrMkg0tXv9lCMjomHQCZYz4CMWvg2PI+SUheYYpQVggvBSISGOWrJ
         7s6F8uNuSfd8+NbT4AQUbjxRjVfka4k6RLlhbxq3HAAh9O8hGYimWgb1UAyyuc7wmhlv
         5EZNn869xyRiSneyRisJg/o2yJaLB4jqh20XtXjrL7v61TORXHf2XRLDWwBL7qshHNbE
         jzrQentaHA50nsarqtuU6KqSk5PI0hy62Q+5N8H0MZ3cXjcuxixcevwSFRls/jSkktou
         QVPE84Z+3nf7Vvj52lD+dTX8ZeII7FwuWPSpodiF0Adt2NLu8U/CfR9PmcvtZ4InMelA
         extg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765479538; x=1766084338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXm/1fe23tTgVaqZTTxGSrbclEuIKybaqnfjNM/NaT0=;
        b=rV73n/jxpVbsIPhpV2Nn/RF04/tprwXCH/nTi4AIzegzmK1fx7v8sMEo3xt9+apnmW
         I/FVRAFy6oc8MgBiM0pH7cGAtmUeXx4h3K4+3KLFKnMivB1Z/G7pDYgny2MtLG0+v6Qj
         emeanRdP1/qMWfWmkW5yENQsZB+YOterP2kzMVsqbXv9FN2IX/qhTsjJLVZKYMFcz1Sj
         58knhIYr42N8TcvSFo6jdfU/fZbaj/SiCt5nubNCr9hXSs4BxqTwzyqMK+b17ppU8rmv
         apxrb5k82tVHSxs/fETav52m+bNc7yTHpdVNJB6zsXhNPyCizEOGbhMK+BD4SNjWuL5z
         MIOQ==
X-Gm-Message-State: AOJu0YxUUe6xLGIv2IKoiCM13OYkyP0px0IecHAbHN2bA3WxTz3kdIts
	DV8UrIeGfsK9LYofrZBLIUvaoNYOSyKr+WxI39FQO3X+TnSt0/SXJ+DU
X-Gm-Gg: AY/fxX5IZjGcidlNzIIGoqpJgxN4O801kzx0p/IYfVCL74te/P/aIksA6rVtaR07B12
	GAXFBRinY7vuX7mAgT6WO+f4Qw0H3w81yvq5UiwM9JDgfPtz2lY8I7FqdIIcVcu8veKvHIQthRF
	jwxTmLqSzHGtSreXcabSeOkt0qcjmEGKAMV3crjtPMPN8B2Ef9aYoNuSR4o2T8QrKE/O4Tehnav
	//iQEXFJWculiNYv2Fk1Wf3uJeNP0CYmxj6l4SGXXYDgJhiAwH7Gxueh98Yubtfd9uuirVGqvLr
	mcjmMotlZ/R/gv9XueNUBkX5X6zjZ/y6CEWMsSRhgd05tGbN0PBI+13//QsHRBGu5k/+AtHuE4A
	GQEe5QQXFOCLfB/GPVVGn4Q1Wr8kiYNgwsVtVd1fcuhcWrIVv1+g/43g/Pn49gCGz6lynSoan2c
	J31Mh5JWS8BvcXf9/L6pYTdNXue9EQ
X-Google-Smtp-Source: AGHT+IG013pfGbuA8PrYyUUTrBZvvlebxD1waVn4TsP9vOtX3ooXAsQ6AFa0OenHcPr1qqKLDtJBaA==
X-Received: by 2002:a05:6000:1acf:b0:42b:30f9:7998 with SMTP id ffacd0b85a97d-42fa39dbe32mr7690463f8f.27.1765479537785;
        Thu, 11 Dec 2025 10:58:57 -0800 (PST)
Received: from localhost.localdomain ([78.208.202.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a70394sm7613731f8f.14.2025.12.11.10.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 10:58:57 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v2] hwmon: (sht3x) add support for SHT85
Date: Thu, 11 Dec 2025 19:58:42 +0100
Message-Id: <20251211185842.66084-1-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SHT85 is a temperature and humidity sensor with the same interface
as SHT3x.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
Changes since v1:
* sht3x.c - dropped all changes, added {"sht85", sht3x} to i2c_device_id[]
* Kconfig - added information about SHT85 support
* Documentation: changed "Datasheets" -> "Datasheet"
* Documentation: added information about SHT85 address == 0x44
---
 Documentation/hwmon/sht3x.rst | 18 +++++++++++++-----
 drivers/hwmon/Kconfig         |  4 ++--
 drivers/hwmon/sht3x.c         |  1 +
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/sht3x.rst b/Documentation/hwmon/sht3x.rst
index 9585fa7c5a5d..ea1642920295 100644
--- a/Documentation/hwmon/sht3x.rst
+++ b/Documentation/hwmon/sht3x.rst
@@ -23,6 +23,14 @@ Supported chips:
         - https://sensirion.com/media/documents/1DA31AFD/61641F76/Sensirion_Temperature_Sensors_STS3x_Datasheet.pdf
         - https://sensirion.com/media/documents/292A335C/65537BAF/Sensirion_Datasheet_STS32_STS33.pdf
 
+  * Sensirion SHT85
+
+    Prefix: 'sht85'
+
+    Addresses scanned: none
+
+    Datasheet: https://sensirion.com/media/documents/4B40CEF3/640B2346/Sensirion_Humidity_Sensors_SHT85_Datasheet.pdf
+
 Author:
 
   - David Frey <david.frey@sensirion.com>
@@ -31,15 +39,15 @@ Author:
 Description
 -----------
 
-This driver implements support for the Sensirion SHT3x-DIS and STS3x-DIS
+This driver implements support for the Sensirion SHT3x-DIS, STS3x-DIS and SHT85
 series of humidity and temperature sensors. Temperature is measured in degrees
 celsius, relative humidity is expressed as a percentage. In the sysfs interface,
 all values are scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
 
-The device communicates with the I2C protocol. Sensors can have the I2C
-addresses 0x44 or 0x45 (0x4a or 0x4b for sts3x), depending on the wiring. See
-Documentation/i2c/instantiating-devices.rst for methods to instantiate the
-device.
+The device communicates with the I2C protocol. SHT3x sensors can have the I2C
+addresses 0x44 or 0x45 (0x4a or 0x4b for sts3x), depending on the wiring. SHT85
+address is 0x44 and is fixed. See Documentation/i2c/instantiating-devices.rst for
+methods to instantiate the device.
 
 Even if sht3x sensor supports clock-stretch (blocking mode) and non-stretch
 (non-blocking mode) in single-shot mode, this driver only supports the latter.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 720e8491ae97..955f6b4208ba 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1931,8 +1931,8 @@ config SENSORS_SHT3x
 	depends on I2C
 	select CRC8
 	help
-	  If you say yes here you get support for the Sensiron SHT30 and SHT31
-	  humidity and temperature sensors.
+	  If you say yes here you get support for the Sensiron SHT30, SHT31 and
+	  SHT85 humidity and temperature sensors.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called sht3x.
diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index f36c0229328f..08306ccb6d0b 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -933,6 +933,7 @@ static int sht3x_probe(struct i2c_client *client)
 static const struct i2c_device_id sht3x_ids[] = {
 	{"sht3x", sht3x},
 	{"sts3x", sts3x},
+	{"sht85", sht3x},
 	{}
 };
 
-- 
2.25.1

