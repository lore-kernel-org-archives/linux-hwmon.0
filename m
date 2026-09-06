Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A967912C534
	for <linux-hwmon@vger.kernel.org>; Sun,  6 Sep 2026 02:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788660652; cv=none; b=nA8HzftXrwxKmx0lC1IIkCRu5Z47yHWG3se1uL/oYGISUKDjeLfSVavUTsw/c6fK6RjsqDLS40eK+ANcuj+XcYtFNfmsiaMXFoR4I0avn5nuMzhUb7KE6vMpQNTs5SpA7TzlbkNC/glZfOjtMtvAnZfQVtOV1g7vJUZkk2gXtsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788660652; c=relaxed/simple;
	bh=PI3OpK0RbeDTaOGVweNbV/yb5fjSgRXGRABwZhR4i7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O7Ep1kP4PQr09RTLmsJZX5FupxegurVyZzwBOy1u2YuMJbGNvusFGpJywtq5hfcdRmpHVELyQt+GZOkjMCpb2bkkSgcz6Edl/BDV4F+fKvMSIsY1ljul6NkaMu+NKKYyImiH/xNPBYFgLImC2WaOzDujYd35bSVpks2KPs/rSv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgfNDy9D; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgfNDy9D"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48442ea8f59so2787778f8f.1
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Sep 2026 19:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788660646; x=1789265446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7TlQz0vy4rkWHXqAoTVymcGJs73BqlZ2JynxSui4AI=;
        b=QgfNDy9DmuA/i2ZJunXG4EC18c6geR0jgzvE0kEzUHSsxAaPAWPaby4yPteknTeD3P
         qh/i0fbeaKj8FzujFQ93Wq31zlYkF83Rg9yclI9jrXzOpylArODr9vxgsWy8UKoJMQN6
         dOVDuDXzpXaT5fUbFR19jG7nGlr/KaeeEgzmuqimWHZh4lFkD8OGsnBWRnuqboxOcfqk
         9oHXav6yYZPdrB634yfE1zAu9cLDdMlQd/cvEBWJYH8Ks2Z8X5Z6JtLAch0ONVP1HRuf
         vrXn3RbQNLBUK8jf8+DiBBUQbvjiypii4GICyxWvnC6+2OIIAGt7dOrjj0pu4N5NDYgh
         Wg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788660646; x=1789265446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7TlQz0vy4rkWHXqAoTVymcGJs73BqlZ2JynxSui4AI=;
        b=pZPfwIF58wQdunqzs2WB7SO/Hi5WluCmZIy6uNpfF+gU4X1D/3jxAA1DzpH9bVMVMT
         BJPtmivK9viJVH9UhR6RW/StKHjjMio46EpCQylE6mZuMsCQSbJrv8Y6hKu5X62TUbKL
         7ZAtx+C4H2MOs2dQDQTjoJgwuGQMB4szrmtERx3jj90nPqZS3YY7UzFMa88o6kE2jE2P
         orK1ii0ZcBzKevVUGvQKCqhYIqmaUqd5SKQXACW+zCQHXat1G0ix61zeeI/OfuD9DxMk
         mGOrxTwy8Om3el8t7ybj/6SAPmBZJ8lN++AfbyQyaCG3X9lKKKz3Jp+M/8TPTNadNka+
         dPDQ==
X-Gm-Message-State: AFuF++lcpY3tASMrAD1q072idJXYpSAX2q8BVJUC36dnq5YARXwYgJ0u
	Hla3++hVQvkhKfS7ylwV4EYck/PQe3GX/MxMI0gPVYemtJBRo8IssJdX
X-Gm-Gg: AYBFou33G17Z2PloAqdZLQ1QdUiFFrADXL8gJBa4pOnWW6tPsWWA2od3+5hX4gSt+wi
	9taTTU5hRLi1CofK9yEHwonfpxMr7/voWtALZEeNOjb5TXO8AMPOIISF/3MzmBc/dK6s0XeUjmw
	fgosvkgf1OubMxJErAQK7UASi/A7/cScfAQwkLOmypJgyHaR6Z3C94WDoPE/rfuPOd6+yFjYypH
	Ln/EDbGJrc/Xp4n2a6jYkq9/+1BYVRn+sqHyzSuk8feUTYljgvbn8ppKFPYm2iLJXqeJDfjEJ6c
	A2qgurE5qSs87SIJc7HuGW2r3qv06Ag63/ioo4t55FWKXCd9T3PuQpL7Nx1di+T+mQ1+yZjiMpa
	7bJKi01rrhfio5cf5C3Hp6M5lRwKbaHOSsoEeq1Ywy/94NvbATk371C0mbpsySQXzTCsUivoMvU
	CWHmmsBnnZDyD1IAjp2xUugOhu8JUepMwe4Pq/XAoCdj6pdWX6EFB7RGi0Ji/h2DgBQbBfq+rVM
	LxLG4/bu/Gce+bpKtE+kQsYVbQLxqDfmSmfzop6yqrEWCHS
X-Received: by 2002:a05:600c:1d07:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49cf86f4fe4mr131951315e9.10.1788660646406;
        Sat, 05 Sep 2026 19:10:46 -0700 (PDT)
Received: from sergio-82n7.fritz.box (host27-7-217-213.cgnat.broadband.ehiweb.it. [213.217.7.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm90386105e9.0.2026.09.05.19.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 19:10:45 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
Date: Sun,  6 Sep 2026 04:10:23 +0200
Message-ID: <20260906021023.766992-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMI quirk entries and map correct ACPI paths and configurations for
additional Lenovo laptop models: Yoga 14cACN 2021, IdeaPad 3 15ALC6 Ub
and Yoga 740-15IML.

DMI product family matching is finally preferred over product name to
reliably distinguish identical model numbers with different internal
fan layouts:
MODEL (DMI PN) | FAMILY / SERIES    | FULL ACPI OBJECT PATH
82KU           | IdeaPad 3 15ALC6   | \_SB.PCI0.LPC0.EC0.FAN0
82KU           | IdeaPad 3 15ALC6 ub| \_SB.PCI0.LPC0.EC0.FANS/FA2S

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
 Documentation/hwmon/yogafan.rst | 40 +++++++++++------------
 drivers/hwmon/yogafan.c         | 58 +++++++++++++++++++++------------
 2 files changed, 57 insertions(+), 41 deletions(-)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index 9ff5db5dc..a7e628bc3 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -85,27 +85,26 @@ immediately to ensure the user knows the fan has stopped.
 
 ::
 
- MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
+ MODEL (DMI PN) | FAMILY / SERIES    | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
  ----------------------------------------------------------------------------------------------------
- 82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
- 80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 83E2           | Yoga Pro 7       | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
- 83DN           | Yoga Pro 9 16IMH9 | 0x06/0xFE | \_SB.PC00.LPCB.EC0.FANS/FA2S  |  8-bit | 100
- 82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
- 81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
- 82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
- 82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
- 82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
- 82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS /FA2S  | 16-bit | 1
- 83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 83KF           | XiaoXinPro 13ARE | 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
- 82KU           | IdeaPad 3 15ALC6 | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 83RU           | Legion Pro 7 16  | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
- 83KF           | Yoga Pro 7 14IAH | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
- 83BS           | Yoga 7 16ARP8    | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
- *Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
+ 82N7           | Yoga 14cACN        | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 80V2 / 81C3    | Yoga 710/720       | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 83E2 / 83DN    | Yoga Pro 7/9       | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 82A2 / 82A3    | Yoga Slim 7        | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 81YM / 82FG    | IdeaPad 5          | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 82JW / 82JU    | Legion 5 (AMD)     | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS/FA2S   | 16-bit | 1
+ 82WQ           | Legion 7i (Int)    | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS/FA2S   | 16-bit | 1
+ 82XV / 83DV    | LOQ 15/16          | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS/FA2S   | 16-bit | 1
+ 83AK           | ThinkBook G6       | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 81TD           | Yoga 740-15IML     | 0x06      | \_SB.PCI0.LPCB.EC0.FANS        |  8-bit | 100
+ 81X1           | Flex 5             | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 83KF           | XiaoXinPro 13ARE   | 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 82KU           | IdeaPad 3 15ALC6   | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 82KU           | IdeaPad 3 15ALC6 ub| 0x06      | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 83RU           | Legion Pro 7 16    | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 83KF           | Yoga Pro 7 14IAH   | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
+ 83BS           | Yoga 7 16ARP8      | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ *Legacy*       | Pre-2020 Models    | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
  ----------------------------------------------------------------------------------------------------
 
 METHODOLOGY & IDENTIFICATION:
@@ -159,6 +158,7 @@ Contributors & DSDT Providers:
 - **Sarbajit Sarkar** (Lenovo LOQ 15IAX9)
 - **HinataKato** (XiaoXin Pro 13ARE 2020 - 83KF)
 - **PenPenIsGod** (IdeaPad 3 15ALC6 - 82KU & Legion Pro 7 16AFR10H - 83RU)
+- **wizard-28** (IdeaPad 3 15ALC6 Ub - 82KU)
 - **unlockxiaom** (Legion Pro 7 16AFR10H - 83RU, Yoga Pro 7 14IAH10 - 83KF, ThinkCentre M80q)
 - **Phani Pavan K** (Yoga Pro 7 14IAH10 - 83KF)
 - **Splarkszter** (Yoga 7 16ARP8 - 83BS)
diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 413ddc721..2ce358c74 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/*
- * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
+/**
+ * yogafan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
  *
  * Provides fan speed monitoring for Lenovo Yoga, Legion, and IdeaPad
  * laptops by interfacing with the Embedded Controller (EC) via ACPI.
@@ -53,6 +53,17 @@ struct yoga_fan_data {
 };
 
 /* Specific configurations mapped via DMI */
+static const struct yogafan_config yoga_740_15iml_cfg = {
+	.multiplier = 100,
+	.fan_count = 1,
+	.paths = { "\\_SB.PCI0.LPCB.EC0.FANS", NULL }
+};
+
+static const struct yogafan_config ideapad_3_15alc6_82ku_cfg = {
+	.multiplier = 100,
+	.fan_count = 2,
+	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" },
+};
 
 static const struct yogafan_config yoga_8bit_fans_cfg = {
 	.multiplier = 100,
@@ -90,17 +101,6 @@ static const struct yogafan_config yoga_pro_7_14iah10_cfg = {
 	.paths = { "\\_SB.PC00.LPCB.EC0.FANS", NULL }
 };
 
-/*
- * Lenovo Yoga Pro 9 16IMH9 (83DN) uses the PC00 namespace and has two
- * 8-bit fan tachometer fields.
- */
-static const struct yogafan_config yoga_pro_83dn_cfg = {
-	.multiplier = 100,
-	.fan_count = 2,
-	.paths = { "\\_SB.PC00.LPCB.EC0.FANS",
-		   "\\_SB.PC00.LPCB.EC0.FA2S" }
-};
-
 static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
 {
 	ktime_t now = ktime_get_boottime();
@@ -200,6 +200,30 @@ static const struct hwmon_chip_info yoga_fan_chip_info = {
 };
 
 static const struct dmi_system_id yogafan_quirks[] = {
+	{
+		.ident = "Lenovo Yoga 740-15IML",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 740-15IML"),
+		},
+		.driver_data = (void *)&yoga_740_15iml_cfg,
+	},
+	{
+		.ident = "Lenovo IdeaPad 3 15ALC6 Ub",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad 3 15ALC6 Ub"),
+		},
+		.driver_data = (void *)&ideapad_3_15alc6_82ku_cfg,
+	},
+	{
+		.ident = "Yoga 14cACN 2021",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 14cACN 2021"),
+		},
+		.driver_data = (void *)&yoga_8bit_fans_cfg,
+	},
 	{
 		.ident = "Lenovo LOQ 15IAX9",
 		.matches = {
@@ -248,14 +272,6 @@ static const struct dmi_system_id yogafan_quirks[] = {
 		},
 		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
 	},
-	{
-		.ident = "Lenovo Yoga Pro 9 16IMH9 (83DN)",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "83DN"),
-		},
-		.driver_data = (void *)&yoga_pro_83dn_cfg,
-	},
 	{
 		.ident = "Lenovo Yoga",
 		.matches = {
-- 
2.55.0

