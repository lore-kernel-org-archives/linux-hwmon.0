Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F43207E05;
	Fri, 10 Jan 2025 08:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736497598; cv=none; b=iM4HlPlHLzMlhjoXlUWPE/uXu3gFAfppy7NPanUoRZUert01O4gdWXBq1NmvMv7jSFgbJdUZAAZdxO6n9DlF5KKIO6PLJYZzVqXjHtxztAUyhtavJPnY2G8/ystmOBOfKMcVpaiQ+WBPwd5CWv6EinAc5GorObeZdcYM7jooBL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736497598; c=relaxed/simple;
	bh=1XLYiVsRsPfFfpG7SNo3sIZWzWA7YJarxnil+byVjBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IvowZa9pCVxBk5iPNxJ91koiXBuLCKxfgKKOnIFFwplBI1HWAfUVI1NXIho9E4nBElG6a/bSrwN/cXKrqFdYxMh5f0UikS8xSzw83dgMP4Vainf+z9sFcFuayo3kmpxUQXMA4wIxt/MQz/bQmoxRKW9LK5FpPPMDEoZVhGqR9q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kk4kt21v; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kk4kt21v"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2165cb60719so31281785ad.0;
        Fri, 10 Jan 2025 00:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736497595; x=1737102395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e54mojNAeBDJtX7z2gN2paaVxCE8evcj6sNhz7fGDI0=;
        b=Kk4kt21vz/NzxpeZJlbexP/jiG0+lNq7qZx/BDUAX1W4fbQfEWyIKZ7rbWEbjnlIT2
         nqTh5vmm6Wlwt/oC0QemY4CrHmYBGQuBBu2NXUuz20qFK5OLZtVECmPJ5iGtWJEXdXPm
         r8QWXVM97QB8TqWQyaPBzaAAggOqAlhh+2cjk08pQL88vX0bNgu2E7OlFRhRFQxZwEHr
         jKRLZfk1yGLGAwPq7ACVhdKPD23RdDPjekyrvbyV/YilntA8Cz5m6couu6q5nfCZ7hIQ
         pR6f505Tp5/NRXmRKl1YfGuu5/aw5pQFTQgEsh2pYeL7LKm4IpyYGWBoWduyIjVdg/Z8
         5yHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736497595; x=1737102395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e54mojNAeBDJtX7z2gN2paaVxCE8evcj6sNhz7fGDI0=;
        b=p4dml4+l2iS57PXgaqXhMM3h+sb1x+0qxLewWyYFW0Ec69R0Qfw+FaEfMGWNgP38GP
         fO54rQDVYcxsU2mLognVC3EUD50NUNS6TIWzPxsr0F6W0MwVh62f/h+UdnpT/Ah7nwyW
         vfhl7vQr09mN/oLT6rrAtyF93Xch6ezhLiA0W2nI5b+QquKTkpG77nMpeGQ3YYgJq2x8
         FGkZZqFNtrcq14mXxW1xhNPOd5eUsNdbhXyW8KYR0ZqSgRecM6v/2ItgScxw37weJa6+
         fAn4z6zFZgxoayDED0u4Lguuc/e5APV76FBp9SSGYwP9+svXanU/27xAy17TnnOPzhcP
         I3sQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7tpatOQrnXoxwkeBfGS9l+zsJ2jyHp71jWJe+BeqJiGFZHQmvLCPl4MCWv+PUDpA5krVtAPDQeFtK@vger.kernel.org, AJvYcCUgEcXAguwrGmwJQNtVVQPTZwTaguRsr12DYMu9YYMr30fdJpjLXw+Sp5vbd6CCG/j0700chMLSpqVK7rtz@vger.kernel.org, AJvYcCWtQq1aT5xbGDxWYWoOlX4YQmHSLfUmgN3sw3Na8uxdEOE7tdafoyc9gX5hhKEjGpV4UvRPRcX3Em1H@vger.kernel.org
X-Gm-Message-State: AOJu0YykItjQ13FFtIYK1d8xiH5KwGRCNQTgnTtz6MqTvyr4WUWXOKLO
	9I5njx1dplT/GG1s0+i2GYui/fVTtT+hJjNy2K9LFtRnqGlQuOwL
X-Gm-Gg: ASbGncscqNy/22uyFjSXLQTOUqVvATHhHcpoVmOiceBxjjFN9UhDLV639lWlNQSetOK
	S8ZDdV0vFJSAatj0XDlMeQtAVJf+uw1iHYGlPti0iiw3L6u/mVFjFqUiVlB3Wq/VoRHrh8VKoCE
	YcKEEcw771y4K5v4ZZjvgORhm52f7WfBxQJQmfVtWOb4kNTG18LhhPcy2MiOPsWDXn9mB+PleTq
	tcu7on7JIfsXVGZ/FEzPbO6DzZwUmJFAR+835y1sw1wLlRUzxKiVDTZL8SF15d3AUpR/aph9P+J
	ks0mhPOAR/TA2Xm/TEeQLJ2I
X-Google-Smtp-Source: AGHT+IF+Tm0BNOQ+Xt921vfuIPptDbgopp3XZC4/fbLhUQQCt+wFBN4iOsfYVYYhzmTWPjnrQwLkdQ==
X-Received: by 2002:a17:902:cccb:b0:216:4e9f:4ebe with SMTP id d9443c01a7336-21a83fd2936mr148218535ad.42.1736497595527;
        Fri, 10 Jan 2025 00:26:35 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22d0eesm9346815ad.169.2025.01.10.00.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 00:26:35 -0800 (PST)
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
Subject: [PATCH v1 1/2] hwmon: (lm90): Add support for NCT7716, NCT7717 and NCT7718
Date: Fri, 10 Jan 2025 16:26:11 +0800
Message-Id: <20250110082612.4107571-2-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110082612.4107571-1-a0282524688@gmail.com>
References: <20250110082612.4107571-1-a0282524688@gmail.com>
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
 Documentation/hwmon/lm90.rst | 43 +++++++++++++++++++++++
 drivers/hwmon/Kconfig        |  2 +-
 drivers/hwmon/lm90.c         | 67 ++++++++++++++++++++++++++++++++----
 3 files changed, 105 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/lm90.rst b/Documentation/hwmon/lm90.rst
index 23af17a0ab44..a53c82a8c15e 100644
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
+    Addresses scanned: I2C 04xc
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
index 511d95a0efb3..266998c6fd1e 100644
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
 
@@ -136,7 +141,8 @@ static const unsigned short normal_i2c[] = {
 enum chips { adm1023, adm1032, adt7461, adt7461a, adt7481,
 	g781, lm84, lm90, lm99,
 	max1617, max6642, max6646, max6648, max6654, max6657, max6659, max6680, max6696,
-	nct210, nct72, ne1618, sa56004, tmp451, tmp461, w83l771,
+	nct210, nct72, nct7716, nct7717, nct7718, ne1618, sa56004, tmp451, tmp461,
+	w83l771,
 };
 
 /*
@@ -275,6 +281,9 @@ static const struct i2c_device_id lm90_id[] = {
 	{ "nct214", nct72 },
 	{ "nct218", nct72 },
 	{ "nct72", nct72 },
+	{ "nct7716", nct7716 },
+	{ "nct7717", nct7717 },
+	{ "nct7718", nct7718 },
 	{ "ne1618", ne1618 },
 	{ "w83l771", w83l771 },
 	{ "sa56004", sa56004 },
@@ -382,6 +391,18 @@ static const struct of_device_id __maybe_unused lm90_of_match[] = {
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
@@ -593,6 +614,26 @@ static const struct lm90_params lm90_params[] = {
 		.max_convrate = 10,
 		.resolution = 10,
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
 	[nct210] = {
 		.flags = LM90_HAVE_ALARMS | LM90_HAVE_BROKEN_ALERT
 		  | LM90_HAVE_REM_LIMIT_EXT | LM90_HAVE_LOW | LM90_HAVE_CONVRATE
@@ -2288,7 +2329,19 @@ static const char *lm90_detect_nuvoton(struct i2c_client *client, int chip_id,
 	if (config2 < 0)
 		return NULL;
 
-	if (address == 0x4c && !(config1 & 0x2a) && !(config2 & 0xf8)) {
+	if (address == 0x48 && !(config1 & 0x30) && !(config2 & 0xfe) &&
+	    convrate <= 0x08) {
+		if (chip_id == 0x90)
+			name = "nct7717";
+		else if (chip_id == 0x91)
+			name = "nct7716";
+	} else if (address == 0x49 && !(config1 & 0x30) && !(config2 & 0xfe) &&
+		   convrate <= 0x08) {
+		name = "nct7716";
+	} else if (address == 0x4c && !(config1 & 0x18) && !(config2 & 0xf8) &&
+		   convrate <= 0x08) {
+		name = "nct7718";
+	} else if (address == 0x4c && !(config1 & 0x2a) && !(config2 & 0xf8)) {
 		if (chip_id == 0x01 && convrate <= 0x09) {
 			/* W83L771W/G */
 			name = "w83l771";
@@ -2297,6 +2350,7 @@ static const char *lm90_detect_nuvoton(struct i2c_client *client, int chip_id,
 			name = "w83l771";
 		}
 	}
+
 	return name;
 }
 
@@ -2484,6 +2538,10 @@ static int lm90_detect(struct i2c_client *client, struct i2c_board_info *info)
 		name = lm90_detect_maxim(client, common_address, chip_id,
 					 config1, convrate);
 		break;
+	case 0x50:	/* Nuvoton */
+	case 0x5c:	/* Winbond/Nuvoton */
+		name = lm90_detect_nuvoton(client, chip_id, config1, convrate);
+		break;
 	case 0x54:	/* ON MC1066, Microchip TC1068, TCM1617 (originally TelCom) */
 		if (common_address && !(config1 & 0x3f) && !(convrate & 0xf8))
 			name = "mc1066";
@@ -2491,9 +2549,6 @@ static int lm90_detect(struct i2c_client *client, struct i2c_board_info *info)
 	case 0x55:	/* TI */
 		name = lm90_detect_ti(client, chip_id, config1, convrate);
 		break;
-	case 0x5c:	/* Winbond/Nuvoton */
-		name = lm90_detect_nuvoton(client, chip_id, config1, convrate);
-		break;
 	case 0xa1:	/*  NXP Semiconductor/Philips */
 		name = lm90_detect_nxp(client, common_address, chip_id, config1, convrate);
 		break;
-- 
2.34.1

