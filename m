Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBBD2DC783
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021901; cv=none; b=bHnYc5YDh/srhMhc/lOsuRIl1f/wtEe2IL48m6yTIEzNhGK3uer8x8BuXSAvhl6sLibX+LE8Yz9sgMJoyohxd7jP8ZGqOUgyfgt+AcH2wtgT63JmBP/RbTLhMd+0p4AAIDo2emff+v35WJDEpl0Ilgcf8YA51Y2T7XxhByOcJWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021901; c=relaxed/simple;
	bh=VzK4qojexuboL3VpoMnyV2AMCc5EduTmro1qeorD40k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tfZuraRsukcdgaVL/LBY9LEBeEYyme2kQ83NIkQjimj7hU9KmjVnPhpyUgyTE1D3p7Wd5UvUOjkQ1F9LUVm6sVeRrM2rqbFfB3qp45h+Oqzw9W1wCul7TS90oV6OR9eqpnVTOuuqGNfZ7Dzqp6lhgzP/M903llaBOx+V+Y2Aw9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFTScEiQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFTScEiQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495590dde14so24856695e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 06:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786021894; x=1786626694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0pHhJAEbxEB36DnJm18OBb6C/yvqHWmDNcJLgn/xIo=;
        b=dFTScEiQcb1UlHFWG6o8PUmplWmjlh22c9niTMp1TKvRLDUofXIdvwmo8JxpkTmENH
         veo9KQtOavb7soCCmd8DFFRvJKV5Xs5zmPdM6S/tycc1g+vlb13Ge0hFKEjpd9jzSSCR
         noLlmAWRuzOX39CstuwrlPROGuNCYHUE00669Kckk2cG9wpqW22IXhH8RW1pJO/571z8
         GZE6teHCduSSvF5Gvw0jane/s2zaiKUsukbrE6n121DNORqYfiOV7Uem7hEj66HdwBdz
         gtjy2V8UUmYi4QzEbnkBxlcGs2t8Ngt1HDd3esUjoY6JVTf8Zd5+eQuvrWLwCF6V9Z+c
         ejfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786021894; x=1786626694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0pHhJAEbxEB36DnJm18OBb6C/yvqHWmDNcJLgn/xIo=;
        b=P1u4l2sVKTIKrTp3FIMqWWsQHqcH0vfly0pA9GORmYHAzzEqVcN+4r8DBf2XmivwAh
         NxE25MFZgfwa3bo0LfVKvAwz93Y9xh1V9MHx190aylgnOWIVfNcyHwbVhCTdL/A7QBI+
         AMnlbto+984Q6JVhzZmUbte4yBob3ujQIFBhy/y/DEqDyE6GeWiXBhDOh76Vwsh/V3xh
         7MUOa27dO4WpoLz+uum9XDMj8qzjwmSPtp0ONXfvcTGnf3z7DTI6EcfZ8t60qp/q28yE
         3s3+EGWJ4pLR+uKkcPwrTaC7ty1uX3hygDqo7JWmqY++ZvRM/YHaUcyzkneePpzbjbFl
         LvSA==
X-Gm-Message-State: AOJu0YxHY0CBzg8jYPsuIq9jiJocx31MWq/nL2cGfMA8vP4MX+DsD3j5
	R/Uc3W4sn/7iOii58jYEOXSYJQvnUQOtRxzP3YoaKXmp+OZSptY9BzTR
X-Gm-Gg: AR+sD10S0O8SxineAld7JDu2EfpbJjMyA8uHjRPWg5WH7DSr08rv8zh8H7Ovoi35f/a
	04HM4Y0zXNeDCmCDxWzcW/gjftPtOVCAG+iDdq085dtrxmAMf9L6EjEDuRiiUpH6F5zMNeK4cEW
	cSI5N/P4I0CVJxnN/kN8FYuDEmiJ6a6gehqGp72bjsZD3PsHrwCLmFaEbeGKdqqx+HiHT/3RqqS
	QoTDx2gdSWTcSzHOnKySDpXbGl5CH3h2he6EI0ekQrq1bYPt+iAeZmVX6cPXIJ4noDtgZ840pHC
	AlGdxY2sEKQkTnVmk/s4TWuZL13Wfpn93VNVJodHl3eNHiIVTTHx+YU95G5Q50xhsI2TpUrAitv
	JWfaHOXeTq0Y+FGTfnDSd7J82nHoQMSLsQqwn9fnduDQrclnjuqJGvABaPuxaYmmoVFXmoztpDU
	Ds9Dr6mv940fD4bi0OLVcNkeRDrQUn4rFGGC2KV8glFqUwxUFAV0vabqQ1qMFzpnfMkZS1DKteF
	FY=
X-Received: by 2002:a05:600c:354a:b0:496:c249:dd9b with SMTP id 5b1f17b1804b1-4994e7c594dmr197099245e9.13.1786021893973;
        Thu, 06 Aug 2026 06:11:33 -0700 (PDT)
Received: from sergio-82n7.fritz.box ([149.22.91.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49954213479sm59344035e9.6.2026.08.06.06.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:11:33 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
Date: Thu,  6 Aug 2026 15:11:03 +0200
Message-ID: <20260806131103.19104-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMI quirk entries and map correct ACPI paths and configurations for
additional Lenovo laptop models including the LOQ 15IAX9, 
XiaoXin Pro 13ARE 2020, IdeaPad 3 15ALC6, Legion Pro 7 16AFR10H, 
Yoga Pro 7 14IAH10, and Yoga 7 16ARP8.

Reorder the DMI quirk table to evaluate specific model matches before
generic family fallbacks, preventing DMI shadowing.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
 Documentation/hwmon/yogafan.rst | 27 ++++++++++++-
 drivers/hwmon/yogafan.c         | 69 +++++++++++++++++++++++++++++----
 2 files changed, 87 insertions(+), 9 deletions(-)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index 68761947a..6395c94f4 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -99,6 +99,11 @@ immediately to ensure the user knows the fan has stopped.
  82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS /FA2S  | 16-bit | 1
  83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
  81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 83KF           | XiaoXinPro 13ARE | 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 82KU           | IdeaPad 3 15ALC6 | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 83RU           | Legion Pro 7 16  | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 83KF           | Yoga Pro 7 14IAH | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
+ 83BS           | Yoga 7 16ARP8    | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
  *Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
  ----------------------------------------------------------------------------------------------------
 
@@ -117,7 +122,6 @@ METHODOLOGY & IDENTIFICATION:
    - 8-bit (Multiplier 100): Standard for Yoga/IdeaPad. Raw values (0-255).
    - 16-bit (Multiplier 1): Standard for Legion/LOQ. Two registers (0xFE/0xFF).
 
-
 References
 ----------
 
@@ -136,3 +140,24 @@ References
 4. **Lenovo IdeaPad Laptop Driver:** Reference for DMI-based hardware
    feature gating in Lenovo laptops.
    https://github.com/torvalds/linux/blob/master/drivers/platform/x86/lenovo/ideapad-laptop.c
+
+5. **Lenovo Product Specifications Reference (PSREF):** Official hardware layout index
+   and spec sheets for active and withdrawn Lenovo laptop models.
+   https://psref.lenovo.com/l/withdrawn/
+
+6. **Yogafan Master Quirk Database:** Master spreadsheet mapping Lenovo Product
+   Specifications Reference (PSREF) to explicit EC offsets, register widths, paths, and multipliers.
+   https://github.com/sergiomelas/lenovo-linux-drivers/blob/main/Lenovo_Drivers/Prototype/PSREF/yogafan_v3_quirks_database.ods
+
+7. **Yogafan ACPI DSDT Repository:** Central repository containing user-contributed raw
+   and decompiled ACPI DSDT firmware dumps used for path verification and hardware expansions.
+   https://github.com/sergiomelas/lenovo-linux-drivers/tree/main/Lenovo_Drivers/Prototype/DSDT
+
+Contributors & DSDT Providers:
+------------------------------
+- **Sarbajit Sarkar** (Lenovo LOQ 15IAX9)
+- **HinataKato** (XiaoXin Pro 13ARE 2020 - 83KF)
+- **PenPenIsGod** (IdeaPad 3 15ALC6 - 82KU & Legion Pro 7 16AFR10H - 83RU)
+- **unlockxiaom** (Legion Pro 7 16AFR10H - 83RU, Yoga Pro 7 14IAH10 - 83KF, ThinkCentre M80q)
+- **Phani Pavan K** (Yoga Pro 7 14IAH10 - 83KF)
+- **Splarkszter** (Yoga 7 16ARP8 - 83BS)
diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 0a41b8672..48fa5148d 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -53,6 +53,7 @@ struct yoga_fan_data {
 };
 
 /* Specific configurations mapped via DMI */
+
 static const struct yogafan_config yoga_8bit_fans_cfg = {
 	.multiplier = 100,
 	.fan_count = 1,
@@ -77,6 +78,18 @@ static const struct yogafan_config loq_15iax9_8bit_dual_cfg = {
 	.paths = { "\\_SB.PC00.LPCB.EC0.FA1S", "\\_SB.PC00.LPCB.EC0.FA2S" }
 };
 
+static const struct yogafan_config xiaoxin_8bit_dual_cfg = {
+	.multiplier = 100,
+	.fan_count = 2,
+	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" }
+};
+
+static const struct yogafan_config yoga_pro_7_14iah10_cfg = {
+	.multiplier = 100,
+	.fan_count = 1,
+	.paths = { "\\_SB.PC00.LPCB.EC0.FANS", NULL }
+};
+
 static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
 {
 	ktime_t now = ktime_get_boottime();
@@ -176,6 +189,54 @@ static const struct hwmon_chip_info yoga_fan_chip_info = {
 };
 
 static const struct dmi_system_id yogafan_quirks[] = {
+	{
+		.ident = "Lenovo LOQ 15IAX9",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "LOQ 15IAX9"),
+		},
+		.driver_data = (void *)&loq_15iax9_8bit_dual_cfg,
+	},
+	{
+		.ident = "Lenovo XiaoXin Pro 13ARE 2020",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "XiaoXinPro-13ARE 2020"),
+		},
+		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
+	},
+	{
+		.ident = "Lenovo IdeaPad 3 15ALC6",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad 3 15ALC6"),
+		},
+		.driver_data = (void *)&ideapad_8bit_fan0_cfg,
+	},
+	{
+		.ident = "Lenovo Legion Pro 7 16AFR10H",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Legion Pro 7 16AFR10H"),
+		},
+		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
+	},
+	{
+		.ident = "Lenovo Yoga Pro 7 14IAH10",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga Pro 7 14IAH10"),
+		},
+		.driver_data = (void *)&yoga_pro_7_14iah10_cfg,
+	},
+	{
+		.ident = "Lenovo Yoga 7 16ARP8",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 7 16ARP8"),
+		},
+		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
+	},
 	{
 		.ident = "Lenovo Yoga",
 		.matches = {
@@ -200,14 +261,6 @@ static const struct dmi_system_id yogafan_quirks[] = {
 		},
 		.driver_data = (void *)&ideapad_8bit_fan0_cfg,
 	},
-	{
-		.ident = "Lenovo LOQ 15IAX9",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "LOQ 15IAX9"),
-		},
-		.driver_data = (void *)&loq_15iax9_8bit_dual_cfg,
-	},
 	{ }
 };
 MODULE_DEVICE_TABLE(dmi, yogafan_quirks);
-- 
2.55.0

