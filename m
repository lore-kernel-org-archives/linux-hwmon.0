Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C1D432E8E
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 18:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782589; cv=none; b=ORBGNQnXrn3KagXDgi/O0a++hSQFJVUDC/Z34DgKJzF98A8jgk0/EoRvKgRxOP2ZImG3ycAt+9K9bIX6yjztyuaoOokuf1fNhK6cUifipt9Xk8xdul2sIvYElK8+HUCf4uVlIHhT5ELsLjlzy2dDUchpqRPBL+fySv9E7ezfb+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782589; c=relaxed/simple;
	bh=1Ox/xe8+SRn49r5rpvCiGEWRrkDfLpylpGxA4gLrzfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VM4FrRHm9ldhTQ46LInrI/Xbzuf5nUZN7zEerCLk0YMCILOChUqc2oeaVG+bALVd9/M9X12NPxHJPeWm2wnirM67cqosvVJC9V+bQTgxpDKEZ1N+afr5JodaIT8SaY0WrC9rxMndC0Go7ybKFhwIGwREzirx4JlBCyvTJikHDlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQz37+i1; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQz37+i1"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8486672f03cso4211824b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 11:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782587; x=1786387387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzV9LqSPsWUTKa0jJuV+URQvZLn1UunvRAwjzwkLz/s=;
        b=jQz37+i1UB1NbcKPoA/qhDL8iNV+gszINjrIpwuJ3uoBWi7RaWbRNj2wzQ2wk6hXrZ
         VLMGpCsH/Vj6Re3ced1R5z0t2YX+l2kbDBHyRfiE9JJECH+j8TS8rOC9DMTdsQu9GbMH
         zU0uuIY7Den9061LKDojrvylM6/FqRAmsrIzKzJkpb6XWdhm3kmUcadP1c4hiHpUeAsl
         fIpTKP26DCHbvia56eWdaebfeKPJfJko3LbjzqDkuJ7CBI+OWlRKyy41hzqGbIC2xvAv
         2chJhxZk4KS1MLTVgMD6ujArE+yfUtc933rY+H5286CZFmKCJvTWrrFO5yF8Zdvq54mC
         jY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782587; x=1786387387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzV9LqSPsWUTKa0jJuV+URQvZLn1UunvRAwjzwkLz/s=;
        b=Kag7YKNeGwnq2B4SyM9IAgR0MiXem9JYlPj57jifwqsNiE23fqNGWw23SnoSO8p+5C
         9PPxYol3s/0Al9RjO5zLQCYZnQuvVKTL7xsWUbSiZaeGazTpw7tkuKbeucWAicXwQs1l
         G4wVkKMZAhXKAcQQDMYHCkJfgVzObTaQORraDxTa/hyM3JcQnMSBtR7Eyxbofey+nH7O
         pFd4S6sIUKMX4IGtoUqmlDAM7iOjrFFyRs5Pu9mvsp0uwnRKboLHRnIeHrARWp4zxuM4
         JjsX5lf69tjlK05C9A9kasivDDL0GQzTV2NaxIwPFjq4Hkkjfl42C6AMk2FzHOc64rF2
         zl4Q==
X-Gm-Message-State: AOJu0YwRKiQq1Qvy0lx1J2eDI0DAYvFh1yxRnF2DFnnU4IjSl1sT5wDa
	5hRASJvYjBWD+CCXMo5yOiOaBtXkXQhO1KRmnBP92zL5dmXDOOIU/d69
X-Gm-Gg: AR+sD11uYTnGYnVXxMShRCi0KhHUF1GdcPNfxnOO/w3HNcYLbtWysMJFuFE2nznyz+o
	auBH3/T2eY+N/eQw3pCVH8ZLqeVXePDlcQdKQNGUKXD9Ajh/SQ2BIGtQuO9/etDtE5H/h9qHlnj
	skWmNjDnEzy/5e9BeN5XnIYt0gmLid98tWlg3CbdX8IWfXY9w5QtL7JpSjtQbU2vrg+P5GLVBqS
	Q1K/crrfx/w8UHMadQqRySLk6JzWqi/E3k3jUE4yXGxRsGdHSYTzkvosokR2ZiqsCYSTu5dYKv5
	6DhmB057AX58cFN33ErzJpIHBBBUk76hY7OMVNlZp0lJcsmQ9MrCXPCuGCBcyDzH/BkI7WdeTr/
	263IREAV/whZJ9qc4oIx3DGetA6CWYjpyq5cp+QWaK53WUCpMlKRIc9WgDgmH/5pNRXWrfP1Xhg
	5P18YPmFbcNprCwCsdFi6PEbhJstx0mxaJX0jjrfxBFk7C38dazR22q8/KiYRFK8D+zOPi/D5rI
	A==
X-Received: by 2002:a05:6a20:160e:b0:3c3:e411:418a with SMTP id adf61e73a8af0-3c92a9098a2mr11520244637.70.1785782586975;
        Mon, 03 Aug 2026 11:43:06 -0700 (PDT)
Received: from sergio-82n7.fritz.box ([23.162.40.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb51asm52785544c88.9.2026.08.03.11.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:43:06 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH v12] hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring
Date: Mon,  3 Aug 2026 20:42:06 +0200
Message-ID: <20260803184206.18465-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver provides fan speed monitoring for modern Lenovo consumer
laptops by interfacing with the Embedded Controller (EC) via ACPI.

To address low-resolution sampling in Lenovo EC firmware, a Rate-Limited
Lag (RLLag) filter is implemented. The filter ensures a consistent physical
curve regardless of userspace polling frequency.

Hardware identification is performed via DMI-based quirk tables, which
map specific ACPI object paths and register widths (8-bit vs 16-bit)
deterministically. This patch introduces specific quirks for the Lenovo
LOQ 15IAX9, IdeaPad 3 15ALC6, Legion Pro 7 16AFR10H, Yoga Pro 7 14IAH10,
and Yoga 7 16ARP8.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
v12:
  - Reordered yogafan_quirks table so exact model matches are evaluated
    before generic family fallbacks, preventing DMI shadowing.
  - Added support and proper DMI/ACPI mappings for Lenovo LOQ 15IAX9,
    IdeaPad 3 15ALC6, Legion Pro 7 16AFR10H, Yoga Pro 7 14IAH10, and
    Yoga 7 16ARP8 (with thanks to community DSDT contributors).
  - Updated Documentation/hwmon/yogafan.rst reference database and credits.
v11.1:
  - Fixed Documentation formatting (0-day robot warnings).
  - Fixed yogafan.c header comment
v11:
  - Mapped ACPI paths directly via DMI quirks.
  - Fixed Documentation formatting (0-day robot warnings).
  - Implemented 100ms MIN_SAMPLING to address rapid polling concerns.
  - Removed redundant platform_set_drvdata() in probe.
  - Explicitly defined platform device ID as -1 for cleaner sysfs naming.
v9/10:
  - Implement ACPI handle resolution during probe for better performance (O(1) read).
  - Add MODULE_DEVICE_TABLE(dmi, ...) to enable module autoloading.
  - Refine RLLag filter documentation and suspend/resume logic.
  - Include comprehensive EC architecture research database (8-bit vs 16-bit).
  - Validated efficiency on kernels 6.18, 6.19, and 7.0-rc5: 'perf top'
    confirms negligible CPU overhead (<0.01%) during active polling.
v8:
  - Replaced heuristic multiplier with deterministic DMI Quirk Table.
  - Added 'depends on DMI' to Kconfig.
  - Verified FOPTD model (1000ms TAU / 1500 RPM/s slew) against hardware traces.
  - Increased filter precision to 12-bit fixed-point.
v7:
  - Fixed Kconfig: Removed non-existent 'select MATH64'.
  - Fixed unused macro: Utilized RPM_FLOOR_LIMIT to implement an
    immediate 0-RPM bypass in the filter.
  - Clarification: Previous "unified structure" comment meant that all
    6 files (driver, docs, metadata) are now in this single atomic patch.
v6:
  - Unified patch structure (6 files changed).
  - Verified FOPTD (First-Order Plus Time Delay) model against hardware
      traces (Yoga 14c) to ensure physical accuracy of the 1000ms time constant.
  - Fixed a rounding stall: added a +/- 1 RPM floor to the step calculation
    to ensure convergence even at high polling frequencies.
  - Set MAX_SLEW_RPM_S to 1500 to match physical motor inertia.
  - Documentation: Updated to clarify 100-RPM hardware step resolution.
  - 32-bit safety: Implemented div64_s64 for coefficient precision.
v5:
  - Fixed 32-bit build failures by using div64_s64 for 64-bit division.
  - Extracted magic numbers into constants (RPM_UNIT_THRESHOLD, etc.).
  - Fixed filter stall by ensuring a minimum slew limit (limit = 1).
  - Refined RPM floor logic to trigger only when hardware reports 0 RPM.
  - Resolved 255/256 unit-jump bug by adjusting heuristic thresholds.
v4:
  - Rebased on groeck/hwmon-next branch for clean application.
  - Corrected alphabetical sorting in Kconfig and Makefile.
  - Technical Validation & FOPTD Verification:
    - Implemented RLLag (Rate-Limited Lag) first-order modeling.
    - Used 10-bit fixed-point math for alpha calculation to avoid
      floating point overhead in the kernel.
    - Added 5000ms filter reset for resume/long-polling sanitation.
v3:
  - Added MAINTAINERS entry and full Documentation/hwmon/yogafan.rst.
  - Fixed integer overflow in filter math.
  - Added support for secondary fan paths (FA2S) for Legion laptops.
v2:
  - Migrated from background worker to passive multirate filtering.
  - Implemented dt-based scaling to maximize CPU sleep states.
  - Restricted driver to Lenovo hardware via DMI matching.
v1:
  - Initial submission with basic ACPI fan path support.
---
---
 Documentation/hwmon/yogafan.rst | 27 ++++++++++++-
 drivers/hwmon/yogafan.c         | 71 +++++++++++++++++++++++++++++----
 2 files changed, 89 insertions(+), 9 deletions(-)

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
index 0a41b8672..371e35895 100644
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
@@ -176,6 +189,56 @@ static const struct hwmon_chip_info yoga_fan_chip_info = {
 };
 
 static const struct dmi_system_id yogafan_quirks[] = {
+	/* 1. Particular first  */
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
+	/* 2. Generic Family Fallbacks LAST */
 	{
 		.ident = "Lenovo Yoga",
 		.matches = {
@@ -200,14 +263,6 @@ static const struct dmi_system_id yogafan_quirks[] = {
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

