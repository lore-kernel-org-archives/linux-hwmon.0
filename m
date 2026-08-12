Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4101922F5
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 02:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786501915; cv=none; b=J0ZbMCCDgtGZF15LSY4NWsRrM3dzXflT5PDfMheW1xlvpkvfc50ufpgOsHbw2wYH2Y+cKLvs1QWVFXxv5C7r6APl789OHA161ulTNkLFzhtHm7K1bb5J0yWjGolBL44k0F1Jp8QvZOPWTWQdidyQeyoamE/dDCT+A+yL6rx8ATw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786501915; c=relaxed/simple;
	bh=MCIYIz8jWjV7Oh/lD4/mlpKd2DDdEW3cdYPQ9pt+9tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGY58T1U0I3ye8YrPmrY9tnPQOvt4bprNYEzAVaudlma4oxwH043B6cj3uW7O3C2XoVNDY4fgB9gzlAPRqXTRCP44MZugPFLxU7R4HFypE/zVVz1QrdfpS7NtjOOvvL5NsUliwBQTEA4jVRRg6RY+mepAJ9J6CbCOwfLS1hIj5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdAqQkAP; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdAqQkAP"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-669944f60b3so450485d50.1
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 19:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786501912; x=1787106712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YnBOyaJ7RfQWcRqCm6u7W4rZlsumtYGwRX9hxxus1LI=;
        b=VdAqQkAPSsbvYQYO2d8owuVVAaQOOQVeh9YN/NOYlb8YHSI9KZhjhYKkX6cRI1ZZ7+
         inuzAaNL/IqxBIxOEESUr6wa2+tONr4JMKFcFE+6EkEPPKSULpRphYs/hCdhJ+On6rl1
         20NcVhFehc8yx1tqDxVcrzaJ45A3HUmALej4/GvCpeFNcph2H5tq9lPiQL6Z5OmMyz1d
         UmxESCISQ/YG+2tvL6dCQK27lfOZLMODy2Zqv2W5pQgbNSP/JX5p385Owza8tkTq09Vy
         cwekuHrxd84KNaH+yVAzLqFecWQrOZy1CGYsksIyK0lMwmY6wkB9iVpzAdcxQL19nUHd
         diGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786501912; x=1787106712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YnBOyaJ7RfQWcRqCm6u7W4rZlsumtYGwRX9hxxus1LI=;
        b=rnGJmyi4w24OMPn9oGtSdlnS5xAKM6EbFOkj2eTfX02qiypou44xLWZ2RERl/GFZp4
         SHCI2khiNBziOO3rTj9SxjTnifhWYde+7lmf+5Mc/w03SDf9ZwMc8oYY4DwmHoqUE7M9
         UdinrePk2903NUmNA0x3dCaiWHJKIy2J5ozK8o7NIlWFRZ8UboyDkSev36BiPQD2Ycul
         sDocas42AGjeFCTK5eSziQHqXw3KB3qCqSkkPa1mHYfVSM/clcTsypQH/2ADjcm5USpG
         4mCb8U8Ntw46tre5Zmm+01es3AypNbuUROVscbHzJezXX5xL6W+ZNF2IfIttAG7HCcbs
         lX7Q==
X-Gm-Message-State: AOJu0Yxpzjsl0JCqC5uHT+CddGOKKePYXPgGnKeF3egFVmJ0g9tWK8Iw
	6L2Qlx+kL5Vo3DMd0Rt8ZkQZnbnUPFYsDLord3KMcEcso4qsUdyqNiQU97ZH2tf01Mc=
X-Gm-Gg: AR+sD10nmU2/YK1NsqoKJ6gF1gNrJ/QklM2cDeAWmsxmlsdoJr8uPTtUcujKpjZw73/
	ujP/Tb3WghGtgdovFB5d9L0HjZxFsgCYWVhLAncdW4DyUnJnD6JWe3/T+7ItvN4DChoZ+nqMYZb
	krYIDP/gA3vpIL9mjtL5t9QEWGD4iouwhQq9cfw5AC2rei7u+Hje/619rNKVfayB3YsCUbCVdVA
	Mp4tzRgoS1eV6MPP+r0y5dfQ2g2fugmSIzljtL1gqxeIEG2eO4MB+T5B3zqnaNwYH7wo4v7Yv3P
	PaI0A15XcLLJRbtKCYIn8uzBjxN6jmE47zELF7YJkEnKkuXRqSgZLCp2Rg/NB15oyVXjGbFHZ2t
	rPj6Oyr1KxFHWnCeYTBwNTaJ1+KEIy6p8pMyyAFD3UtUv31ttuwJZ6ZYxompOi9JNjD9No1keZQ
	+39qQZ7KiYhe4iJXqSrTrhTr6R0cN3V4ZnF0jVHuXFoGo5S0XvDHQgJzWzvLT55TRK1ehZ4aOc3
	w==
X-Received: by 2002:a53:bb01:0:b0:669:48b0:326c with SMTP id 956f58d0204a3-66b3434960emr738197d50.36.1786501912412;
        Tue, 11 Aug 2026 19:31:52 -0700 (PDT)
Received: from yogaman.home.lan ([24.99.5.57])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-830a414e953sm7014297b3.14.2026.08.11.19.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 19:31:50 -0700 (PDT)
From: rahlquist <rahlquist@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: sergiomelas@gmail.com,
	linux@roeck-us.net,
	rahlquist <rahlquist@gmail.com>
Subject: [PATCH v2] hwmon: yogafan: add Lenovo Yoga Pro 9 16IMH9
Date: Tue, 11 Aug 2026 22:31:14 -0400
Message-ID: <20260812023114.131005-1-rahlquist@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0b6f2990-9ad4-4977-9b28-287f6dd65911@roeck-us.net>
References: <0b6f2990-9ad4-4977-9b28-287f6dd65911@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Pro 9 16IMH9 (83DN) exposes its fan tachometers at
ACPI paths different from the generic Yoga configuration. Add a
model-specific two-fan configuration for the PC00.LPCB.EC0 namespace
and document the corrected mapping.

Tested on a Lenovo Yoga Pro 9 16IMH9 (83DN) with BIOS NKCN35WW: the
patched module registers fan1_input and fan2_input, both reporting 1800
RPM at idle.

---

Changes from v1:
- Wrap the new comment in kernel block-comment style.
- Wrap the commit message to 75 columns.

Signed-off-by: rahlquist <rahlquist@gmail.com>
---
 Documentation/hwmon/yogafan.rst |  3 ++-
 drivers/hwmon/yogafan.c         | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index 6876194..cd7206b 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -89,7 +89,8 @@ immediately to ensure the user knows the fan has stopped.
  ----------------------------------------------------------------------------------------------------
  82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
  80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 83E2 / 83DN    | Yoga Pro 7/9     | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 83E2           | Yoga Pro 7       | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 83DN           | Yoga Pro 9 16IMH9 | 0x06/0xFE | \_SB.PC00.LPCB.EC0.FANS/FA2S  |  8-bit | 100
  82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
  81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
  82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 605cc92..6cfbad3 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -71,6 +71,17 @@ static const struct yogafan_config legion_16bit_dual_cfg = {
 	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" }
 };
 
+/*
+ * Lenovo Yoga Pro 9 16IMH9 (83DN) uses the PC00 namespace and has two
+ * 8-bit fan tachometer fields.
+ */
+static const struct yogafan_config yoga_pro_83dn_cfg = {
+	.multiplier = 100,
+	.fan_count = 2,
+	.paths = { "\\_SB.PC00.LPCB.EC0.FANS",
+		   "\\_SB.PC00.LPCB.EC0.FA2S" }
+};
+
 static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
 {
 	ktime_t now = ktime_get_boottime();
@@ -170,6 +181,14 @@ static const struct hwmon_chip_info yoga_fan_chip_info = {
 };
 
 static const struct dmi_system_id yogafan_quirks[] = {
+	{
+		.ident = "Lenovo Yoga Pro 9 16IMH9 (83DN)",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83DN"),
+		},
+		.driver_data = (void *)&yoga_pro_83dn_cfg,
+	},
 	{
 		.ident = "Lenovo Yoga",
 		.matches = {
-- 
2.55.0

