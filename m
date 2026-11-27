Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757326;
	b=Gl+62oOmliFbBZJxW0HX/TiZJ53iyBKXcfAMZgYuw49DLDgOVP966q7TyBNq6kKgsiu+
	 rXcLm1RaZB5NIupOoexIgmxP2sa4HnqYboXkcjI4ghzlvajFovDRyMvEiYl8PKKfMwenM
	 xrt+e1MFikA6HEiUgkB7w/8R4CoBxbPkICn3sUguSXoFjlI+wVpeERPHS+Q3VOn2Rcwve
	 mYgvyhHnR35NTJhw0n2TXKflbgyT5I0QJusZI2UOIVvg1Vz/zi4cgbfmlaOOutyUBPF1T
	 UVz4GDye0HsMXUZTKTt9HY+ye4jVV0IskgjBIwoPiN31AbwHeKBO59vqiejUAzSTuxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w8EUKxgy8isR+4iZykOwKlAUWeY78/o5o1zpI3srpDI=;
	b=jVoB1qyNysFBzd/doUURUZRnIaQmKCMe1Rwo0tgJAvNJIpNf/V3NS2ID6GCj/zCGpDgU
	 ZyQ0bausZ/3lQF2xA8lhdXRF9Nel2RrDarwQ8Wt8O5cvhTESSKjbUWA7ud6rMR/r57KEZ
	 z+4kwCN4zQhLDTDjulCU05z1b7PgdlnNxFa+dD4Fn+na2tiN8AQEj4PY73OgKu8Kh71j2
	 2Xej5Czw2vhSqGLnWoYnAXce0opQ5Xzax5/1/aAmOck5y+RCzI7DEY2I0bSjbCGk4KAIa
	 osYYf7enJzHoaEinS4WF26oMJFjSGFzICygIKjxpelEDfv1ppZzDDg1vKAzR0WfVeNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vugNU3NP;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9062D606A330
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 05:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9062D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vugNU3NP
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so72343005e9.2
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 21:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795757325; x=1796362125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8EUKxgy8isR+4iZykOwKlAUWeY78/o5o1zpI3srpDI=;
        b=vugNU3NPpTyM1pnBnSgatOXTc9YUa6YChLuqCQeWJh+T4DFQLqWqnpL8j4L/Ji7d7u
         PZDFq/VXus2WVVB9eOa3VWzZt2yhF6SuTu5tcwqf9hQD231Vy4iFlfCeIcHt3exf7gIZ
         fmmWGT8bM7sp+QclQK8kMXo4UR/YByXh1qj4fuTRcHCSK9PLaeRej4K9J9gWu690UIQD
         QoreWZWUjZ4Xm0okvWxmrOmlfiMkh+SoT9MX4v8mFi0IK760EW/M3eB5dJIq5jXU4TJX
         CKQYctADbiC8HXL+plwrbqXB7e22uWSvognWQ8C6F43PWeNLKT+1JjnefWE8CgD/WlPw
         Ervg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757325; x=1796362125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w8EUKxgy8isR+4iZykOwKlAUWeY78/o5o1zpI3srpDI=;
        b=v62kOlbUJIjIOva3MumwEY4HMLcSZPPry9QscGAx0y6KnX4lsyiS6YEuKpEaX1KFc7
         ZqCyVyqvnjCLczgUA4sqb4BKj0QiwnAJL19nKGmyTvsD8dzVLuBF+ZC4ULM3rMiO/Gdw
         xi7KhaMI4Y6eKPaxhyy5cxOQp08NJTX8GiSCrT5FFk2duX15E6+sBSux9nkeqzkGo8wL
         01CsaHVEOKfsu28ZqmJ+u7c81/WVEUYLsSL+WzuRFtkmdI11n4+Ytvfkccv1j1zebLm/
         xMVVtv3DlR+xt3+QDvpBMUNIC6Rxo8KNGj/eftVaucmxsX4Hu9oDyFjODZTzYooRVJr8
         ZGzQ==
X-Gm-Message-State: APuU4Z/+mLOGJcUAgA5HsVZBmduFtUDhvjvp9rBz18gG6k6PcaqQqWpz
	DIoxvhjsx0wtQEtBbLNx5mxWfAGNfz9b9r9h73CiEHhrUxlVNkFdCp5+Wbh8MyUm9K4=
X-Gm-Gg: AZFdTZe/dkl4ZhFl925I/ePP+y73hky6KOMRzkV4d93ICdNQVJyyjPEPKR6rOZXfoQS
	f3K23jibUun4tbUpan2JaEPkuoUm+Y0wpAs++q0dQKBD0SSp8VlGwvHwZ+zXE9HIJWPUX29NH3q
	SLX55fj2P3CizAK/uo7Y5BlaAdrwU4sIe6GRvYIwATgBQRilF9EE4TKItrckZ3StvWzS5dvMsi9
	flbLowJmEknkHdoaUVyqBwYI47Posi1TNAIowVX6wX3YTmI4Y9n+VO/u/b93NnKnF6kF7kFkH6d
	3pGhMZ3+cQdIX4EaPmsar/bMiUf1+XgmC1+c13poKN1SOCgPobgX/L3LrbnU//PJvDuwF9fxEqh
	2UN/fh6ySsJIy2EGmEZE1yB4XPWwXw+ZHmOLyXSOYhj1jyG/NiNLvvz9tRUr3cLaI0uW6OXW/s3
	H2dzLEmHGHSoZPmeN3CUw/dQQZvDdaubLdoiT3SCpzoASO2UB7GnV+6h28ut1yuwszI2RgqV+R/
	5/84WbkYH25h/jPlI7pCv6RisBRG/FSZ1+rVCtaX/IZ2mUHBZm0c81PFmRhB+/7W38y+FHy0FhJ
	2oSjFUjNKGx0zmgSZnmBCCLZfe2qqW+T4AL+z5ac/0O0/XGfSpEMQlOY4tMFB5lIyOIN7I7Hjqn
	Rl8pyzZbLvh2XmfAkTQjxqVSdteSKa3qQdIy379AttvBL47olPjfx51YFSvh6urv6F+hvU+DSHU
	nHmOt7bsqPTXODPC2dmPuINJ0bZuMzFOGvpW/qWrDsLqCM8I1IMw3lkrR9EefQ+aU=
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr474016545e9.18.1795757324728;
        Thu, 26 Nov 2026 21:28:44 -0800 (PST)
Received: from sergio-82n7.homenet.telecomitalia.it ([95.236.10.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm649073745e9.1.2026.11.26.21.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:28:44 -0800 (PST)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (yogafan) Add support for additional Lenovo laptops
Date: Fri, 27 Nov 2026 06:28:41 +0100
Message-ID: <20261127052841.492895-3-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261127052841.492895-1-sergiomelas@gmail.com>
References: <20261127052841.492895-1-sergiomelas@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMI quirks and ACPI fan tachometer configurations for nine
user-reported Lenovo laptops:

- IdeaPad 3 15ADA6 (82KR): 1 fan, 8-bit x100 (LPC0.EC0.FANS)
- IdeaPad 5 15ARE05 (81YQ): 1 fan, 8-bit x100 (LPC0.EC0.FANS)
- Legion 7 16ACHg6 (82N6): 2 fans, 8-bit x100 (LPC0.EC0.FANS/FA2S)
- Legion Slim 5 14APH8 (82Y5): 2 fans, 8-bit x100 (LPC0.EC0.FANS/FA2S)
- Legion Pro 7 16IAX10H (83F5): 3 fans, 8-bit x100 (PC00 FANS/FA2S/FASF)
- Yoga 7 16IAH7 (82UF): 2 fans, 8-bit x100 (PC00.LPCB.EC0.FANS/FA2S)
- Yoga 730-15IWL (81JS): 1 fan, 8-bit x100 (PCI0.LPCB.EC0.ERPM)
- Yoga Slim 7 15ILL9 (83HM): 2 fans, 16-bit x1 (PC00.LPCB.EC0.FANS/FA2S)
- Yoga Pro 9 16IAH10 (83L0): 2 fans, 16-bit x1 (PC00.LPCB.H_EC.FANS/FA2S)

Reuse existing yogafan_config structures where identical and update
Documentation/hwmon/yogafan.rst with the new models and contributors.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
 Documentation/hwmon/yogafan.rst |  19 ++++++
 drivers/hwmon/yogafan.c         | 100 ++++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index c30cd9c81..62992293b 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -108,6 +108,16 @@ immediately to ensure the user knows the fan has stopped.
  83KF           | Yoga Pro 7 14IAH    | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
  83BS           | Yoga 7 16ARP8       | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
  83RU           | Legion Pro 7 16     | 0x04      | \_SB.PCI0.LPC0.EC0.FASF (Fan3) |  8-bit | 100
+ 82KR           | IdeaPad 3 15ADA6    | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 81YQ           | IdeaPad 5 15ARE05   | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 82N6           | Legion 7 16ACHg6    | 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 82Y5           | Legion Slim 5 14APH8| 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 83F5           | Legion Pro 7 16IAX10| 0x03/0x06 | \_SB.PC00.LPCB.EC0.FANS/FA2S   |  8-bit | 100
+ 83F5           | Legion Pro 7 16IAX10| 0x04      | \_SB.PC00.LPCB.EC0.FASF (Fan3) |  8-bit | 100
+ 82UF           | Yoga 7 16IAH7       | 0x06/0xFE | \_SB.PC00.LPCB.EC0.FANS/FA2S   |  8-bit | 100
+ 81JS           | YOGA 730-15IWL      | 0x06      | \_SB.PCI0.LPCB.EC0.ERPM        |  8-bit | 100
+ 83HM           | Yoga Slim 7 15ILL9  | 0x06/0xFE | \_SB.PC00.LPCB.EC0.FANS/FA2S   | 16-bit | 1
+ 83L0           | Yoga Pro 9 16IAH10  | 0x5A4     | \_SB.PC00.LPCB.H_EC.FANS/FA2S  | 16-bit | 1
  *Legacy*       | Pre-2020 Models     | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
  -------------------------------------------------------------------------------------------------------
 
@@ -167,3 +177,12 @@ Contributors & DSDT Providers:
 - **Phani Pavan K** (Yoga Pro 7 14IAH10 - 83KF)
 - **Splarkszter** (Yoga 7 16ARP8 - 83BS)
 - **GabboRocchia** (Legion Pro 7 16AFR10H - 83RU 3rd fan)
+- **dubhater** (IdeaPad 3 15ADA6 - 82KR)
+- **Voltair88** (IdeaPad 5 15ARE05 - 81YQ)
+- **magnumsolo** (Legion 7 16ACHg6 - 82N6)
+- **Dolik64** (Legion Slim 5 14APH8 - 82Y5)
+- **rzsn** (Legion Pro 7 16IAX10H - 83F5)
+- **slap2572** (Yoga 7 16IAH7 - 82UF)
+- **Lassebq** (YOGA 730-15IWL - 81JS)
+- **msourada** (Yoga Slim 7 15ILL9 - 83HM)
+- **geniusss87** (Yoga Pro 9 16IAH10 - 83L0)
diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 172fdc198..632eb0a8b 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -114,6 +114,34 @@ static const struct yogafan_config legion_8bit_triple_cfg = {
 		   "\\_SB.PCI0.LPC0.EC0.FASF" }
 };
 
+static const struct yogafan_config yoga_8bit_erpm_cfg = {
+	.multiplier = 100,
+	.fan_count = 1,
+	.paths = { "\\_SB.PCI0.LPCB.EC0.ERPM", NULL }
+};
+
+static const struct yogafan_config legion_pc00_8bit_triple_cfg = {
+	.multiplier = 100,
+	.fan_count = 3,
+	.paths = { "\\_SB.PC00.LPCB.EC0.FANS",
+		   "\\_SB.PC00.LPCB.EC0.FA2S",
+		   "\\_SB.PC00.LPCB.EC0.FASF" }
+};
+
+static const struct yogafan_config yoga_pc00_16bit_dual_cfg = {
+	.multiplier = 1,
+	.fan_count = 2,
+	.paths = { "\\_SB.PC00.LPCB.EC0.FANS",
+		   "\\_SB.PC00.LPCB.EC0.FA2S" }
+};
+
+static const struct yogafan_config yoga_pc00_hec_16bit_dual_cfg = {
+	.multiplier = 1,
+	.fan_count = 2,
+	.paths = { "\\_SB.PC00.LPCB.H_EC.FANS",
+		   "\\_SB.PC00.LPCB.H_EC.FA2S" }
+};
+
 static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
 {
 	ktime_t now = ktime_get_boottime();
@@ -229,6 +257,78 @@ static const struct dmi_system_id yogafan_quirks[] = {
 		},
 		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
 	},
+	{
+		.ident = "Lenovo IdeaPad 3 15ADA6",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad 3 15ADA6"),
+		},
+		.driver_data = (void *)&yoga_8bit_fans_cfg,
+	},
+	{
+		.ident = "Lenovo IdeaPad 5 15ARE05",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad 5 15ARE05"),
+		},
+		.driver_data = (void *)&yoga_8bit_fans_cfg,
+	},
+	{
+		.ident = "Lenovo Legion 7 16ACHg6",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Legion 7 16ACHg6"),
+		},
+		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
+	},
+	{
+		.ident = "Lenovo Legion Slim 5 14APH8",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Legion Slim 5 14APH8"),
+		},
+		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
+	},
+	{
+		.ident = "Lenovo Legion Pro 7 16IAX10H",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Legion Pro 7 16IAX10H"),
+		},
+		.driver_data = (void *)&legion_pc00_8bit_triple_cfg,
+	},
+	{
+		.ident = "Lenovo Yoga 7 16IAH7",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 7 16IAH7"),
+		},
+		.driver_data = (void *)&yoga_pro_83dn_cfg,
+	},
+	{
+		.ident = "Lenovo Yoga 730-15IWL",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "YOGA 730-15IWL"),
+		},
+		.driver_data = (void *)&yoga_8bit_erpm_cfg,
+	},
+	{
+		.ident = "Lenovo Yoga Slim 7 15ILL9",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga Slim 7 15ILL9"),
+		},
+		.driver_data = (void *)&yoga_pc00_16bit_dual_cfg,
+	},
+	{
+		.ident = "Lenovo Yoga Pro 9 16IAH10",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga Pro 9 16IAH10"),
+		},
+		.driver_data = (void *)&yoga_pc00_hec_16bit_dual_cfg,
+	},
 	{
 		.ident = "Yoga 14cACN 2021",
 		.matches = {
-- 
2.55.0

