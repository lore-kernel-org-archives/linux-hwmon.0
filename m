Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3065B3AA50B
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438261; cv=none; b=KEb4tYky7JSgPYIYrf4cSCdEjR+vmwOx2glcSg7IMP+777vRP1SgkuDogitjy0d5Df4CJ/KcnfP8KohRqW7HfhwWnBBejvXRocc0bQnh6B6hwQhfVX3xLgO7dUBZn/OQAXk+b2c5Bw6/dxNcaJI4yS6T3KLLf5+XwPdmvVMZs+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438261; c=relaxed/simple;
	bh=nvoZzgLKNXyyA9Qu+BYUaw0xIV5oHjJo4xG/UZBMSUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cPrFp66hlOmDrtlVQQ/FIavczFSCgu67skvAaz058BjHQhApHXG0dbLnvZkyOcBEIOBl6G7TPrzTmJgG0lsJmvyRijS5nHhJUgwvEBrG6tGoZvHyACjAzLArXE+tZiIkHi/15SmUPsT8htEHRWzABPIwLwc9r0q8ywcDJ2M+Tx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AbxvUWpp; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AbxvUWpp"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so5430264f8f.0
        for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 01:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779438258; x=1780043058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajkpOnllBA6VWst7K0wBn9ryhYnCMIs37638sf6d/vg=;
        b=AbxvUWppdP5P0d+4gGDx0lziNxJqIJdIz+W8+57Xg5rkV7OPXse9lIJchlVwYttu42
         pruByG38vxeH6IbDfify+MvXDHvl8QeW0MOrkn9RT7KPLneBErQb6sZbwyrsac9IN3DA
         RJrmOuuKYpZE45/x3jNPmoZIZNdIqiL53m3Eb/pKq3M5CPee2yQvnZvov4gaH8O2wcbN
         J8WE4Gg7lOsf5fayKWjpfdgHYODbvPfnCCN0Q/H822MhytKa/hg02pfFNrLpKHqfdIh5
         r0WlIInBemjeGQhJjndPNk1hD2x9wx+owcHtkuWRlZw/vRnjG6MYHEQdEjU0uQECHebW
         mBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438258; x=1780043058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ajkpOnllBA6VWst7K0wBn9ryhYnCMIs37638sf6d/vg=;
        b=ZUF4O9yJmJoNLVLgjds9ElSzIAJiTePMY10hv4gPQM/J/Zz2NKsRmfGTf4JNB7NhVP
         rnAKU9UtFdZB0RX5l5wH6OKmXKMfw+uQgOZEvpfKloBRXyI+6iG6IJhiqOd+JYNsGEms
         J7qbgpE5Cm6Roj41IlQNC8HX7UBk0fRWz8WvQnfvh1ffFkk3hzhv7QIa8P7Wjcw2hAiH
         QeFUc7/shKIpAe88ZJubPYccybPhU9FrFI9vn4SoL96MDJjMHeYkjTMNQqAum9W/yLzw
         5aTprCenTyKyd/031Jtf5bp4W9veOWMIjZQ/8ayzH/Ics4qcJjn1IueJzxYC9fjfu9WH
         ijqw==
X-Gm-Message-State: AOJu0Yx46J08M8nKz8OvJNNa0YJa5Fvl8p4e3DNDZjaMD3s7PeUBVKO3
	ets0BMOSVI7L1op4tQPgQXldcfXqCaoEdtuq1/vWwGTaSpxaUcZEehh8Qg1ih6BmIxttJSmKVI/
	8r6ahHhW7Ig==
X-Gm-Gg: Acq92OFRzvmJifENYCRqCtkFqRK3VrXj/Re1kGDlbO1a5ixO08yWL4++1hYCAUhba09
	ci0gTKjcji/9bkpcaFRRTHXIadGhO+/gxJuMOGreSjSpA7VY8QzCmahWR4V/ae8x5K3jMzfbpnG
	+PNAkH9VI1pX9nhmHJy4pJGWM12BOyyGegMXt2YlLbDqXBlqZhgFTG0ikzvtKYZ1juPWM79z7eD
	bnOq3KmZTOq8TRrQB3vLY8eq+FPgMaychKbm0QsT8gTC16kXRIQNLWDAYEUwGJO3jXZ4Likixw5
	r2Fhqx4HNGBUYuX+szrwlInjvSCOyYLqbBPmFQL160WEaaOQr/tLIfs+i9qMyKn17TU4eHih6QS
	pwUybVEV7NQExruC1xFyoHJIEK2U6EmzQFVlxETlxBjeUuEqY4b0eiJ/x34EzbjH0TLS/i2IHF+
	AdeAgaZa4KcOeR1KlrqJuC9L7zaTV/mJLUtv+f0ZoGBKkGsyb9vz14GoqElDPQoGx/WmA4Btbzi
	LzlOE+Li21E9i00Aa7Nxg==
X-Received: by 2002:a05:6000:1889:b0:45e:8edc:dacc with SMTP id ffacd0b85a97d-45ea31ce398mr10002323f8f.27.1779438257542;
        Fri, 22 May 2026 01:24:17 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f58dsm2398471f8f.5.2026.05.22.01.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:24:17 -0700 (PDT)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v4 4/4] hwmon: (pmbus/tps25990): Add TPS1689 support
Date: Fri, 22 May 2026 11:23:39 +0300
Message-ID: <20260522082349.2749970-5-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522082349.2749970-1-sbogdanov@baylibre.com>
References: <20260522082349.2749970-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the existing TPS25990 driver to support the TPS1689 eFuse,
as both devices share the same command interface and functionality.

Update the documentation to include TPS1689 support.

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 Documentation/hwmon/tps25990.rst | 15 +++++---
 drivers/hwmon/pmbus/tps25990.c   | 66 +++++++++++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps25990.rst
index 04faec780d26..e8bc9a550bda 100644
--- a/Documentation/hwmon/tps25990.rst
+++ b/Documentation/hwmon/tps25990.rst
@@ -9,26 +9,31 @@ Supported chips:
 
     Prefix: 'tps25990'
 
-  * Datasheet
+    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
 
-    Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
+  * TI TPS1689
+
+    Prefix: 'tps1689'
+
+    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps1689
 
 Author:
 
 	Jerome Brunet <jbrunet@baylibre.com>
+	Stoyan Bogdanov <sbogdanov@baylibre.com>
 
 Description
 -----------
 
-This driver implements support for TI TPS25990 eFuse.
+This driver implements support for TI TPS25990 and TI TPS1689 eFuse chips.
 This is an integrated, high-current circuit protection and power
 management device with PMBUS interface
 
-Device compliant with:
+Devices are compliant with:
 
 - PMBus rev 1.3 interface.
 
-Device supports direct format for reading input voltages,
+Devices supports direct format for reading input voltages,
 output voltage, input current, input power and temperature.
 
 Due to the specificities of the chip, all history reset attributes
diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
index 1e252844217b..720e134f1892 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -42,6 +42,7 @@
 					 PK_MIN_AVG_RST_MIN)
 
 enum chips {
+	tps1689,
 	tps25990,
 };
 
@@ -286,7 +287,6 @@ static int tps25990_write_word_data(struct i2c_client *client,
 		value = clamp_val(value, 0, 0xff);
 		ret = pmbus_write_word_data(client, page, reg, value);
 		break;
-
 	case PMBUS_VIN_OV_FAULT_LIMIT:
 		value = tps25990_data2reg_direct(client, TPS25990_VIN_OVF, value);
 		value = clamp_val(value, 0, 0xf);
@@ -376,6 +376,14 @@ static const struct regulator_desc tps25990_reg_desc[] = {
 #endif
 
 static struct tps25990_local_direct_value tps25990_local_info[] = {
+	[tps1689] = {
+		.m[TPS25990_VIN_OVF] = 3984,
+		.b[TPS25990_VIN_OVF] = -63750,
+		.R[TPS25990_VIN_OVF] = -3,
+		.m[TPS25990_IIN_OCF] = 7111,
+		.b[TPS25990_IIN_OCF] = -2133,
+		.R[TPS25990_IIN_OCF] = -2,
+	},
 	[tps25990] = {
 		.m[TPS25990_VIN_OVF] = 10163,
 		.b[TPS25990_VIN_OVF] = -30081,
@@ -387,6 +395,59 @@ static struct tps25990_local_direct_value tps25990_local_info[] = {
 };
 
 static struct pmbus_driver_info tps25990_base_info[] = {
+	[tps1689] = {
+		.pages = 1,
+		.format[PSC_VOLTAGE_IN] = direct,
+		.m[PSC_VOLTAGE_IN] = 1166,
+		.b[PSC_VOLTAGE_IN] = 0,
+		.R[PSC_VOLTAGE_IN] = -2,
+		.format[PSC_VOLTAGE_OUT] = direct,
+		.m[PSC_VOLTAGE_OUT] = 1166,
+		.b[PSC_VOLTAGE_OUT] = 0,
+		.R[PSC_VOLTAGE_OUT] = -2,
+		.format[PSC_TEMPERATURE] = direct,
+		.m[PSC_TEMPERATURE] = 140,
+		.b[PSC_TEMPERATURE] = 32103,
+		.R[PSC_TEMPERATURE] = -2,
+		/*
+		 * Current and Power measurement depends on the ohm value
+		 * of Rimon. m is multiplied by 1000 below to have an integer
+		 * and -3 is added to R to compensate.
+		 */
+		.format[PSC_CURRENT_IN] = direct,
+		.m[PSC_CURRENT_IN] = 9548,
+		.b[PSC_CURRENT_IN] = 0,
+		.R[PSC_CURRENT_IN] = -6,
+		.format[PSC_CURRENT_OUT] = direct,
+		.m[PSC_CURRENT_OUT] = 24347,
+		.b[PSC_CURRENT_OUT] = 0,
+		.R[PSC_CURRENT_OUT] = -3,
+		.format[PSC_POWER] = direct,
+		.m[PSC_POWER] = 2775,
+		.b[PSC_POWER] = 0,
+		.R[PSC_POWER] = -4,
+		.func[0] = (PMBUS_HAVE_VIN |
+			    PMBUS_HAVE_VOUT |
+			    PMBUS_HAVE_VMON |
+			    PMBUS_HAVE_IIN |
+			    PMBUS_HAVE_PIN |
+			    PMBUS_HAVE_TEMP |
+			    PMBUS_HAVE_STATUS_VOUT |
+			    PMBUS_HAVE_STATUS_IOUT |
+			    PMBUS_HAVE_STATUS_INPUT |
+			    PMBUS_HAVE_STATUS_TEMP |
+			    PMBUS_HAVE_SAMPLES),
+
+		.read_word_data = tps25990_read_word_data,
+		.write_word_data = tps25990_write_word_data,
+		.read_byte_data = tps25990_read_byte_data,
+		.write_byte_data = tps25990_write_byte_data,
+
+#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
+		.reg_desc = tps25990_reg_desc,
+		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
+#endif
+		},
 	[tps25990] = {
 		.pages = 1,
 		.format[PSC_VOLTAGE_IN] = direct,
@@ -429,7 +490,6 @@ static struct pmbus_driver_info tps25990_base_info[] = {
 		.write_word_data = tps25990_write_word_data,
 		.read_byte_data = tps25990_read_byte_data,
 		.write_byte_data = tps25990_write_byte_data,
-
 #if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
 		.reg_desc = tps25990_reg_desc,
 		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
@@ -438,12 +498,14 @@ static struct pmbus_driver_info tps25990_base_info[] = {
 };
 
 static const struct i2c_device_id tps25990_i2c_id[] = {
+	{ "tps1689", tps1689 },
 	{ "tps25990", tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
 
 static const struct of_device_id tps25990_of_match[] = {
+	{ .compatible = "ti,tps1689", .data = (void *)tps1689 },
 	{ .compatible = "ti,tps25990", .data = (void *)tps25990 },
 	{}
 };
-- 
2.43.0

