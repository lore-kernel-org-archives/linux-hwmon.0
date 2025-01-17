Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF471FECDB;
	Fri, 17 Jan 2025 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737108561; cv=none; b=Arb+tqDcylz5+Xcrl6b5Dfpq3upoS/9DqiVjXqtB354zQyz2RdKY+kJ5UREvj4zfMp2LBE9WNRRJEi40hbZSB6jEkDC5BQnxtqKEQtCfqP0OdT5QdvnLBqkqcr8ygYX36V2e5i06driujD85MLBdr9rM5CKUMNAZSj9LRR4zGhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737108561; c=relaxed/simple;
	bh=N3Vdu4JCVA4/njgcGjUcpHpe3JHz825F4WeDWdgG1Pk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SoT5bqZPgbsevNeGJkZLDtHVw3rNJj8wzRBukJ8ba45eftCZ0nKC6mTZSKG1jEkVP0iJYQ58NJkUXPFptSe3C+b1m9P/4KmHrQMDqv39gTPWsdz3QxbtVtFtxn/50620VkYCqpqaUDJZk7DFJRcJ8kQ5lTC/Zfz9Oa+BoF1fO5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDYO41w1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDYO41w1"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21680814d42so30336975ad.2;
        Fri, 17 Jan 2025 02:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737108559; x=1737713359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O696l+7X/qgbiUygZs6A5wWWXRqNhKVgG1Gl/z3U3f0=;
        b=LDYO41w1Q9TS01rlPaAfmhAynajx9CgJE6PMX3OQ2gN8Cc0NV5mky9ZLa+4I2hogXv
         vbGumxYar/sCsD7nqJuvYcvo9isWSqe/A6GxQ/W7UiO9TPBeSRnBz1mt3AANJpdZLT1u
         kl//t7ky2kikmZyyvJAWVTeL9IDKJmp1krMwthS+g+m0nt1DbOTsW5AkV/WnMeXjBVam
         V17kVnqpHhF6PAmoyZJ1Sry75yYs+Oow1JzR3lTyEZrVNR7p+WE51OznJHYN4sNNcj6h
         spDSLdom6fruy7dTLAv0hI4iDgXyNktNl1HefGNPqMQrcQfSU9eqdan3SCQ7MWXjj6RB
         raMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737108559; x=1737713359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O696l+7X/qgbiUygZs6A5wWWXRqNhKVgG1Gl/z3U3f0=;
        b=PcXxB4XDkLdadJnJ8khBWFlJgM2qBC4+vEmHCDCpDoA051CkSwHcYz+o6yPNmB0bKL
         SwHqiT8bEPcpHRQY1J7Ai6mQ5Ni0rF/oXVyAqthdiDkKnWzyxSdmIoAYRCQmztanb88S
         VRERlsZSSnDmMmfGafH1dZo98RsWlfQZyOSk6YLDBjkoViRR1IydKehclmi0GXCXXQVi
         QtxCPaikGRy3O6lHLT6pejvaV+agBGFJlAM0wxgsz2BgUKngsOu8fWsPOsCw8JkMBL6P
         NSW+JPPTzdIPNmpDgtdID6ZXBlSFNx5zIYreJz3hhMSMsC3O56YLfRBpX8YLb3cqEpU4
         Gn0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRldM3VTHUf9hmTmz9PjWIt5OIn5Pnj4XP9nUfyyz6MJc0kpIt6eRxZReH08geQfwegJ4YAiPvT9YMIy9H@vger.kernel.org, AJvYcCWPnodwqO+Cw/1WMsHgMWEu+zAfK2CVKi7QwSAIwDMowfPlc/5gCJoNfRtt7jNmZmNToGB1Sm+3nazH@vger.kernel.org, AJvYcCX6uf4GFqX6kN9dCCAVKuRSjN7Yu+9pLAug2sJ3E7YcBENPXeNAW8x8LQ9G/r02o37Bp0PwOec03M49@vger.kernel.org
X-Gm-Message-State: AOJu0YwNUvHzuyOzt7Jyf8yn5cdftPjwDWQ2nY+cKvWoYlOWSsma141B
	DSt5ktvyKyPf59YeM1zyL3O4YrksJ3iUXy5AHNgcmZEsRVpDkC/v
X-Gm-Gg: ASbGncuSdbv1NgiHV9neywX+B/sgpXvBv/Gz9725X0puoZepokqWTBx92xbFR1r10mA
	7YxLYUtWVXt4tz3miu+wbHD/UUIHK8G4oOrL5cBFATwFk36Rl2RTKnTlP+3s9lEYZRpkQ8ZylL2
	XI0l0rK+SglUqLPiPBhY08U9OudArlj/4e7pyAzAlE02HqZHeBBoOFa/7cReLkkV0eTlTa3+Vi+
	B1qwkFrtPtfoBmvY8tM/k68QHaFoJe6+vFZNjvZspNvUDQ7eiWyIqEvoBYsNXts70lVOxPg2r6j
	chsk9h4JgICEFea4pUr65snW
X-Google-Smtp-Source: AGHT+IEh9o8VJz8ojvMHLfjAr5gUxV3N/zAFxtiDazqfaHVIcB5NdN9qbmiCUiRfIDW3hFixo6xDGw==
X-Received: by 2002:a17:903:32c1:b0:21b:d126:6d30 with SMTP id d9443c01a7336-21c355c433amr28964475ad.33.1737108559125;
        Fri, 17 Jan 2025 02:09:19 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb9af5sm12756925ad.82.2025.01.17.02.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 02:09:18 -0800 (PST)
From: Ming Yu <a0282524688@gmail.com>
To: tmyu0@nuvoton.com,
	jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v2 1/2] hwmon: (lm90): Add support for NCT7716, NCT7717 and NCT7718
Date: Fri, 17 Jan 2025 18:07:43 +0800
Message-Id: <20250117100744.1571385-2-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117100744.1571385-1-a0282524688@gmail.com>
References: <20250117100744.1571385-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NCT7716 is similar to NCT7717 but has one more address support,
both of them only have a 8 bit resolution local thermal sensor.

NCT7718 has 11 bit resoulution remote thermal sensor.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
 Documentation/hwmon/lm90.rst | 43 +++++++++++++++++++
 drivers/hwmon/Kconfig        |  2 +-
 drivers/hwmon/lm90.c         | 82 +++++++++++++++++++++++++++++++++++-
 3 files changed, 124 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/lm90.rst b/Documentation/hwmon/lm90.rst
index 23af17a0ab44..98452eed16d5 100644
--- a/Documentation/hwmon/lm90.rst
+++ b/Documentation/hwmon/lm90.rst
@@ -365,6 +365,34 @@ Supported chips:
 
     Datasheet: Not publicly available, can be requested from Nuvoton
 
+  * Nuvoton NCT7716
+
+    Prefix: 'nct7716'
+
+    Addresses scanned: I2C 0x48, 0x49
+
+    Datasheet: Not publicly available, can be requested from Nuvoton
+
+  * Nuvoton NCT7717
+
+    Prefix: 'nct7717'
+
+    Addresses scanned: I2C 0x48
+
+    Datasheet: Publicly available at Nuvoton website
+
+               https://www.nuvoton.com/resource-files/Nuvoton_NCT7717U_Datasheet_V111.pdf
+
+  * Nuvoton NCT7718
+
+    Prefix: 'nct7718'
+
+    Addresses scanned: I2C 0x4c
+
+    Datasheet: Publicly available at Nuvoton website
+
+               https://www.nuvoton.com/resource-files/Nuvoton_NCT7718W_Datasheet_V11.pdf
+
   * Philips/NXP SA56004X
 
     Prefix: 'sa56004'
@@ -573,6 +601,21 @@ W83L771AWG/ASG
   * The AWG and ASG variants only differ in package format.
   * Diode ideality factor configuration (remote sensor) at 0xE3
 
+NCT7716:
+  * 8 bit sensor resolution
+  * Selectable address
+  * Configurable conversion rate
+
+NCT7717:
+  * 8 bit sensor resolution
+  * Configurable conversion rate
+
+NCT7718:
+  * Temperature offset register for remote temperature sensor
+  * 11 bit resolution for remote temperature sensor
+  * Low temperature limits
+  * Configurable conversion rate
+
 SA56004X:
   * Better local resolution
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index dd376602f3f1..70c4717b37b4 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1517,7 +1517,7 @@ config SENSORS_LM90
 	  MAX6657, MAX6658, MAX6659, MAX6680, MAX6681, MAX6692, MAX6695,
 	  MAX6696,
 	  ON Semiconductor NCT1008, NCT210, NCT72, NCT214, NCT218,
-	  Winbond/Nuvoton W83L771W/G/AWG/ASG,
+	  Winbond/Nuvoton W83L771W/G/AWG/ASG, NCT7716, NCT7717 and NCT7718,
 	  Philips NE1618, SA56004, GMT G781, Texas Instruments TMP451 and TMP461
 	  sensor chips.
 
diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 511d95a0efb3..75f09553fd67 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -90,6 +90,9 @@
  * This driver also supports NE1618 from Philips. It is similar to NE1617
  * but supports 11 bit external temperature values.
  *
+ * This driver also supports NCT7716, NCT7717 and NCT7718 from Nuvoton.
+ * The NCT7716 is similar to NCT7717 but has one more address support.
+ *
  * Since the LM90 was the first chipset supported by this driver, most
  * comments will refer to this chipset, but are actually general and
  * concern all supported chipsets, unless mentioned otherwise.
@@ -119,13 +122,15 @@
  * Address is fully defined internally and cannot be changed except for
  * MAX6659, MAX6680 and MAX6681.
  * LM86, LM89, LM90, LM99, ADM1032, ADM1032-1, ADT7461, ADT7461A, MAX6649,
- * MAX6657, MAX6658, NCT1008 and W83L771 have address 0x4c.
+ * MAX6657, MAX6658, NCT1008, NCT7718 and W83L771 have address 0x4c.
  * ADM1032-2, ADT7461-2, ADT7461A-2, LM89-1, LM99-1, MAX6646, and NCT1008D
  * have address 0x4d.
  * MAX6647 has address 0x4e.
  * MAX6659 can have address 0x4c, 0x4d or 0x4e.
  * MAX6654, MAX6680, and MAX6681 can have address 0x18, 0x19, 0x1a, 0x29,
  * 0x2a, 0x2b, 0x4c, 0x4d or 0x4e.
+ * NCT7716 can have address 0x48 or 0x49.
+ * NCT7717 has address 0x48.
  * SA56004 can have address 0x48 through 0x4F.
  */
 
@@ -136,7 +141,7 @@ static const unsigned short normal_i2c[] = {
 enum chips { adm1023, adm1032, adt7461, adt7461a, adt7481,
 	g781, lm84, lm90, lm99,
 	max1617, max6642, max6646, max6648, max6654, max6657, max6659, max6680, max6696,
-	nct210, nct72, ne1618, sa56004, tmp451, tmp461, w83l771,
+	nct210, nct72, nct7716, nct7717, nct7718, ne1618, sa56004, tmp451, tmp461, w83l771,
 };
 
 /*
@@ -191,6 +196,9 @@ enum chips { adm1023, adm1032, adt7461, adt7461a, adt7481,
 #define ADT7481_REG_MAN_ID		0x3e
 #define ADT7481_REG_CHIP_ID		0x3d
 
+/* NCT7716/7717/7718 registers */
+#define NCT7716_REG_CHIP_ID		0xFD
+
 /* Device features */
 #define LM90_HAVE_EXTENDED_TEMP	BIT(0)	/* extended temperature support	*/
 #define LM90_HAVE_OFFSET	BIT(1)	/* temperature offset register	*/
@@ -275,6 +283,9 @@ static const struct i2c_device_id lm90_id[] = {
 	{ "nct214", nct72 },
 	{ "nct218", nct72 },
 	{ "nct72", nct72 },
+	{ "nct7716", nct7716 },
+	{ "nct7717", nct7717 },
+	{ "nct7718", nct7718 },
 	{ "ne1618", ne1618 },
 	{ "w83l771", w83l771 },
 	{ "sa56004", sa56004 },
@@ -382,6 +393,18 @@ static const struct of_device_id __maybe_unused lm90_of_match[] = {
 		.compatible = "onnn,nct72",
 		.data = (void *)nct72
 	},
+	{
+		.compatible = "nuvoton,nct7716",
+		.data = (void *)nct7716
+	},
+	{
+		.compatible = "nuvoton,nct7717",
+		.data = (void *)nct7717
+	},
+	{
+		.compatible = "nuvoton,nct7718",
+		.data = (void *)nct7718
+	},
 	{
 		.compatible = "winbond,w83l771",
 		.data = (void *)w83l771
@@ -601,6 +624,26 @@ static const struct lm90_params lm90_params[] = {
 		.resolution = 11,
 		.max_convrate = 7,
 	},
+	[nct7716] = {
+		.flags = LM90_HAVE_ALARMS | LM90_HAVE_CONVRATE,
+		.alert_alarms = 0x40,
+		.resolution = 8,
+		.max_convrate = 8,
+	},
+	[nct7717] = {
+		.flags = LM90_HAVE_ALARMS | LM90_HAVE_CONVRATE,
+		.alert_alarms = 0x40,
+		.resolution = 8,
+		.max_convrate = 8,
+	},
+	[nct7718] = {
+		.flags = LM90_HAVE_OFFSET | LM90_HAVE_REM_LIMIT_EXT | LM90_HAVE_CRIT
+		  | LM90_HAVE_ALARMS | LM90_HAVE_LOW | LM90_HAVE_CONVRATE
+		  | LM90_HAVE_REMOTE_EXT,
+		.alert_alarms = 0x7c,
+		.resolution = 11,
+		.max_convrate = 8,
+	},
 	[ne1618] = {
 		.flags = LM90_PAUSE_FOR_CONFIG | LM90_HAVE_BROKEN_ALERT
 		  | LM90_HAVE_LOW | LM90_HAVE_CONVRATE | LM90_HAVE_REMOTE_EXT,
@@ -2300,6 +2343,38 @@ static const char *lm90_detect_nuvoton(struct i2c_client *client, int chip_id,
 	return name;
 }
 
+static const char *lm90_detect_nuvoton_50(struct i2c_client *client, int chip_id,
+					  int config1, int convrate)
+{
+	int chip_id2 = i2c_smbus_read_byte_data(client, NCT7716_REG_CHIP_ID);
+	int config2 = i2c_smbus_read_byte_data(client, LM90_REG_CONFIG2);
+	int address = client->addr;
+	const char *name = NULL;
+
+	if (chip_id2 < 0 || config2 < 0)
+		return NULL;
+
+	if (chip_id2 != 0x50 || convrate > 0x08)
+		return NULL;
+
+	switch (chip_id) {
+	case 0x90:
+		if (address == 0x48 && !(config1 & 0x3e) && !(config2 & 0xfe))
+			name = "nct7717";
+		break;
+	case 0x91:
+		if ((address == 0x48 || address == 0x49) && !(config1 & 0x3e) &&
+		    !(config2 & 0xfe))
+			name = "nct7716";
+		else if (address == 0x4c && !(config1 & 0x38) && !(config2 & 0xf8))
+			name = "nct7718";
+		break;
+	default:
+		break;
+	}
+	return name;
+}
+
 static const char *lm90_detect_nxp(struct i2c_client *client, bool common_address,
 				   int chip_id, int config1, int convrate)
 {
@@ -2484,6 +2559,9 @@ static int lm90_detect(struct i2c_client *client, struct i2c_board_info *info)
 		name = lm90_detect_maxim(client, common_address, chip_id,
 					 config1, convrate);
 		break;
+	case 0x50:
+		name = lm90_detect_nuvoton_50(client, chip_id, config1, convrate);
+		break;
 	case 0x54:	/* ON MC1066, Microchip TC1068, TCM1617 (originally TelCom) */
 		if (common_address && !(config1 & 0x3f) && !(convrate & 0xf8))
 			name = "mc1066";
-- 
2.34.1

