Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E48838AC68
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 07:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989795; cv=none; b=QPHk2QqnP7Z66xB+MlXGYbdU1C0KlGaX7Vq/DZIk4o7nBovVWWhLUnaf+MdIbcSZfm99EYBCdHKR3D3H4OeL3+r9vJjox8XsCj+PrHzGy3K295DUuaoBdKA6F+NAnqwuYCyX3OBHKLAJn9uzX2hfz6ek75+kfNKk71uRX7m2Jic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989795; c=relaxed/simple;
	bh=OSTcRbJhXYpTE4dXopQtkWfLzcKU1+YCkirLdYOrUWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r+GtZszJoJS5qy9zrB4ADgESzF+tojrUbU8nsNW+h0DrPvdyO45URUnrAr5NKBgekZrW4hTsJvlRGv2UhLZj3VoND6WPxNEbxXTsU8S3l/yvne6hpy4nskucttG6jWsxJJHPN4llyOw1w2ttDe+6QeEm+g0SdI9ssDtRQWMMnqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFOeya4e; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFOeya4e"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8423f52af13so3673961b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 00:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780989794; x=1781594594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4qyeEIjNravvJ2wkPh3Rq7srXxxjIJON8Fe7j2GxFw=;
        b=eFOeya4exGiwzMaNfNa2PdcODYS0oHopAiqJfFCQtFXBdmwqqvu2QJD9mMGk6A4DBc
         3ejlPbzzSvOS4W/LsrMuVbnk1Fvd51Mc6gwB9/uNpmF3sI58nLzUFEXYtD8w5zV6ZCqe
         mJAn5mjP2Wj9h7SWQ6O5yncyRIZtQ6jLK4u77dX2euQfmvwsTmdtJ+bN7lXt6ZkJI8fw
         FOMAwaahRMB2c68l1wq7dBnXuzXgkdDi6Ck4zgo2ZiAacM5LsuC/GmPR1vezHfcaKveH
         8fLy+ImiwqMppJP+n2rgP2wYpZekrtdwCkO9Cm7lvsnz5tflqBnspxjAFv+DSee5Gj8S
         U/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780989794; x=1781594594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/4qyeEIjNravvJ2wkPh3Rq7srXxxjIJON8Fe7j2GxFw=;
        b=OnJSctBc8FRq+kk5JXaVRhRNFyLi2j3d1jNwWmDkMCZn43XbXnZ5ri+lsNcra3wy4w
         iTwPengwmtmVyhODM76dxKfzg31iheuVkoWbM5CZupJb/g/KVeSdGKydl9dsfz/G8/5O
         O+nFfJefPflVWQPj7BJHbariXYfCoqTwHyM/rbJZuTqeE9YKQSCBlHMHcaYpjt1L77Yn
         bQWNzDULcV18dtjPHUe9lmcW9QQjtwLWOpR5dG8EezNyypdMhMpXS23gceKUVAnO06jT
         uBModwaYKQs9G8ovAwwtLwLOBah1/CeO1qL2/oCj32JBJPdOMg7Scr+8i62bqgsI6R+o
         BGxg==
X-Gm-Message-State: AOJu0YzhgYKupVi2I1BFBTt4CnooQHpyvalHkv+fpO2vniqZ8EmnTTSf
	cXiRWyDUN5mQszZKN8jPjmAJqny8iZ+zeaf05mzUmBmfGMS5d0rHw/BO
X-Gm-Gg: Acq92OHTskRL7svFzS6c/yXbTJiqY95d0SQi/uYLiB6ZhOZm5XYHtmB1uZ1Hjwl0HQt
	ZPqzUcPUTM0wQOe3kqN8NtcUhbTixKFXMd/V2YE69/LrQ1IdJwkL+iGkI13N5XUjx9wBW3TXRDV
	Vj+2fx3AFCTrVeXx7kQjN23+k0GxjSSwCPphrbPAi2XeFYsLIfxmXo9FSL2tOGRWqwOnJ7C+CFg
	nnfQFnUMgLtvBlhvkyHtjd9FfUfVqYPkyTyvxo0bpbrAqtwVhn+SZAKlJWus9FrNjpP4p9pc7YF
	vSdFoB+olF17lZMAhEtjyF3IL/DyMHWjML7MPhmwLZY0wreld1qhOiGg0Kkvw7QIKr7ZYFWi98J
	R/mgzTvjKr5ygLlje0PuOR+D6m/pb379uj6F2vQeFLpi2gDLnlMMH9QMX+Df7dJVo+2yCXLQAKp
	MlTNARBNEiJOwYpz7Y6Pt/c3JckPKdS8qf/q3bXsAS3XEca/BuDaSzQdE463x24qUbJ9U=
X-Received: by 2002:a05:6a00:ab8b:b0:842:57e8:1bdb with SMTP id d2e1a72fcca58-842b0e95864mr19035030b3a.20.1780989793622;
        Tue, 09 Jun 2026 00:23:13 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:c919:66b5:f0e5:3e9c:92e5:3878])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221671sm21702448b3a.4.2026.06.09.00.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:23:13 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v5 2/3] hwmon:(pmbus/xdp720) Add support for efuse xdp730
Date: Tue,  9 Jun 2026 12:52:30 +0530
Message-Id: <20260609072231.15486-3-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260609072231.15486-1-Ashish.Yadav@infineon.com>
References: <20260609072231.15486-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Adds support for the Infineon XDP730 Digital eFuse Controller by
updating the existing XDP720 driver.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
XDP720/XDP730 Digital eFuse Controllers provides accurate system telemetry
(V, I, P, T) and reports analog current at the IMON pin for post-processing.

Both parts share the same PMBus register map and direct-format
coefficients; they differ in the GIMON gain step exposed via the
TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
(XDP720: pin 9, XDP730: pin 20).

The Current and Power measurement depends on the RIMON and GIMON values.
The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Register.
The value of RIMON (kohm) can be provided by the user through device tree using
infineon,rimon-micro-ohms  property.
---
 drivers/hwmon/pmbus/Kconfig  |  2 +-
 drivers/hwmon/pmbus/xdp720.c | 76 +++++++++++++++++++++++++-----------
 2 files changed, 54 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 8f4bff375ecb..a9e86d92b044 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -715,7 +715,7 @@ config SENSORS_XDP720
 	tristate "Infineon XDP720 family"
 	help
 	  If you say yes here you get hardware monitoring support for Infineon
-	  XDP720.
+	  XDP720 and XDP730 Digital eFuse Controllers.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called xdp720.
diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
index 8729a771f216..0f106c13e7ca 100644
--- a/drivers/hwmon/pmbus/xdp720.c
+++ b/drivers/hwmon/pmbus/xdp720.c
@@ -1,6 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Hardware monitoring driver for Infineon XDP720 Digital eFuse Controller
+ * Hardware monitoring driver for Infineon XDP720 / XDP730 Digital
+ * eFuse Controllers.
+ *
+ * Both parts share the same PMBus register map and direct-format
+ * coefficients; they differ in the GIMON gain step exposed via
+ * the TELEMETRY_AVG register and in the VDD_VIN pin number.
  *
  * Copyright (c) 2026 Infineon Technologies. All rights reserved.
  */
@@ -20,6 +25,18 @@
  */
 #define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
 #define XDP720_TELEMETRY_AVG 0xE9
+#define XDP720_TELEMETRY_AVG_GIMON BIT(10) /* high/low GIMON select */
+
+/* Chip identifiers carried in OF match-data and i2c_device_id->driver_data. */
+enum xdp720_chip_id {
+	CHIP_XDP720 = 0,
+	CHIP_XDP730,
+};
+
+struct xdp720_data {
+	enum xdp720_chip_id	 id;
+	struct pmbus_driver_info info;
+};
 
 static struct pmbus_driver_info xdp720_info = {
 	.pages = 1,
@@ -56,16 +73,18 @@ static struct pmbus_driver_info xdp720_info = {
 
 static int xdp720_probe(struct i2c_client *client)
 {
-	struct pmbus_driver_info *info;
+	struct xdp720_data *data;
 	int ret;
 	u32 rimon;
 	int gimon;
 
-	info = devm_kmemdup(&client->dev, &xdp720_info, sizeof(*info),
-			    GFP_KERNEL);
-	if (!info)
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
 		return -ENOMEM;
 
+	data->id = (enum xdp720_chip_id)(uintptr_t)i2c_get_match_data(client);
+	data->info = xdp720_info;
+
 	ret = devm_regulator_get_enable(&client->dev, "vdd-vin");
 	if (ret)
 		return dev_err_probe(&client->dev, ret,
@@ -77,36 +96,47 @@ static int xdp720_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret >>= 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
-	ret &= GENMASK(0, 0);
-	if (ret == 1)
-		gimon = 18200; /* output gain 18.2 microA/A */
-	else
-		gimon = 9100; /* output gain 9.1 microA/A */
+	/* Bit 10 of TELEMETRY_AVG selects the GIMON gain step in microA/A */
+	switch (data->id) {
+	case CHIP_XDP720:
+		gimon = (ret & XDP720_TELEMETRY_AVG_GIMON) ? 18200 : 9100;
+		dev_info(&client->dev, "Initialised XDP720 instance\n");
+		break;
+	case CHIP_XDP730:
+		gimon = (ret & XDP720_TELEMETRY_AVG_GIMON) ? 20000 : 10000;
+		dev_info(&client->dev, "Initialised XDP730 instance\n");
+		break;
+	default:
+		return -EINVAL;
+	}
 
-	if (of_property_read_u32(client->dev.of_node,
-				 "infineon,rimon-micro-ohms", &rimon))
-		rimon = XDP720_DEFAULT_RIMON; /* Default if not set via DT */
+	if (device_property_read_u32(&client->dev,
+				     "infineon,rimon-micro-ohms", &rimon))
+		rimon = XDP720_DEFAULT_RIMON;	/* Default if not in FW */
 	if (rimon == 0)
 		return -EINVAL;
 
 	/* Adapt the current and power scale for each instance */
-	info->m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
-		info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000ULL);
-	info->m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
-		info->m[PSC_POWER] * rimon * gimon, 1000000000000000ULL);
-
-	return pmbus_do_probe(client, info);
+	data->info.m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
+		data->info.m[PSC_CURRENT_OUT] * rimon * gimon,
+		1000000000000ULL);
+	data->info.m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
+		data->info.m[PSC_POWER] * rimon * gimon,
+		1000000000000000ULL);
+
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct of_device_id xdp720_of_match[] = {
-	{ .compatible = "infineon,xdp720" },
+	{ .compatible = "infineon,xdp720", .data = (void *)CHIP_XDP720 },
+	{ .compatible = "infineon,xdp730", .data = (void *)CHIP_XDP730 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, xdp720_of_match);
 
 static const struct i2c_device_id xdp720_id[] = {
-	{ "xdp720" },
+	{ "xdp720", CHIP_XDP720 },
+	{ "xdp730", CHIP_XDP730 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, xdp720_id);
@@ -123,6 +153,6 @@ static struct i2c_driver xdp720_driver = {
 module_i2c_driver(xdp720_driver);
 
 MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
-MODULE_DESCRIPTION("PMBus driver for Infineon XDP720 Digital eFuse Controller");
+MODULE_DESCRIPTION("PMBus driver for Infineon XDP720/XDP730 Digital eFuse Controllers");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("PMBUS");
-- 
2.39.5

