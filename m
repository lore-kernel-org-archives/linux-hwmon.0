Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D141356A0D
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639686; cv=none; b=VXCVwJLHTd+kpH9IZ6pzTMej4lnrODZ1niZ9ck8ymuiDeLJSZR4oKVUowZe87kSwN0kpvPxrouVhhlPXwCrZvqreIEZiQD0Pl5lWYbsnJWBCI2p4dlO87taMvr3yu/YrCBMOdXW8SThgod//FQ+srPcTIckJ0lsZmDJUDNPBvVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639686; c=relaxed/simple;
	bh=G0cIN2ypk/2JOdVgqTU1fPCUVJpmgyY5Dd2VkMVn9Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FqrOpE/gr+WxH3yZ8lHDltT4TiOxkN3PfcfkU6EwpyJbwHyK43WTswo5FAnCe9OJ2BgAmEmFZ5+k6oatDrkhyEJk3OPNtAljhzMLGsO6SJT1uzAodv+W9AKLRoWxEO4uXLk5HEsDl8nIUsCgmDc6s2ulwhJ/T5/4M7cV37V+5gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4h3BWxD; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4h3BWxD"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-836d2861a39so958737b3.2
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 09:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786639684; x=1787244484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUvMeXCnltXSf3UOGsXyoJ69OLdyuYHQV82PaZb4pfY=;
        b=U4h3BWxD+kr5fj1jJkx5yaDohIDJbIJ/S4Pq6Uf84vBGIpMIZ5g+wvTnucFA1ddHMH
         jiKArB/vKxOeNdQvP2naAnAK1x9biiWfv0J8V0FxeFGmlW3fb2WTNapBjC7iksr15HvW
         txqhJahQqcIAcqK12Fi8ty2EeKYP224mAAcu+hOjBIu9oPvAFIBvIzK/OdJ6033+BV+K
         GMoyVSFqju6pvvQ2IIXoEA28xThXeh99kJQ3yFH/AVmn4zouiYLhrK2BSwJKINXr1mqp
         Zhje3wwNXv8yIpqSoQ1h0au0N8lH3qmSdHwFwSNKcA9xCGpKcDxagzk/eBeyUJ0DIdH9
         QEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786639684; x=1787244484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BUvMeXCnltXSf3UOGsXyoJ69OLdyuYHQV82PaZb4pfY=;
        b=hPpn0tTkny1pt6rDZ7GfAaBtHu8st/xYKHdiSHCyhtTAEKuOVPclKA+Ycoak8ZB9JQ
         w/MtgzwSpEw5DEWbkPew9ieFhBZT7V/Dsk42hZsBWUPpchraVJ3Y93brutNUeoEY1bZ0
         LBYAhue9X0+SsVG4SWBWzNhMJO+TWViPn53ybwuBGDtvSAPBrsmH/9nDDN+787k0VfNL
         S5pGlY4QD6scCZ0TNKxGthasGlFUz8qdZqsgQKizN2HnT7yrNco3+LmcIcIZM1QRIMXb
         SpeJ6BuFCgZ5RNDw8YZ9iAYvFnIlExF4fgaw1kDMJrTZjzA23U9dyDpwWwegmjOB/Fld
         AWFg==
X-Gm-Message-State: AOJu0YwI7TL6gRTEdzuijXpBb/NiqNQqMNVJ2SWlM+EKDQhhTetBdrzO
	i2pGuiBlAxPUBzCpoEzoESgnSTCldwJ1m8K0JQ+r3nfQxQptHrbFnE8KUmWM9pvsAHHK2Q==
X-Gm-Gg: AR+sD11GJpKLu/QrbanJmwu2cLZ5bvGNNpYor7+BO7gRcTgQTwqXmWuZHbMZAnSBmkx
	CHH9MAv6ZGkIYUJZnhUkpL6cJXuJh9GAdCBBkg2jHwvlcbcxrWk1nIACvSk93+c8lXf5j28skZW
	AQLYakDOScKnNJKJfBD0ep62TBLu8fumBleYP0WOs7zy9c+f77BE9WacY6lToEVB3XczE4wEuO7
	kAer/GV7Bbd0KCdo8fvbWrrIyj7XZcz5XLu14BuPyiU7E3L9qYJez0Xd3HmXuFb3qlDLWGETd3i
	R0E3ERDA3xruMaEtNNrGU1MmaPg7w6tgoa/Nv+9UAk0BmAGQAtCBuP+fVaT68Yf9MV1ZPoq9av/
	0rSigRp2oSJXflMNU1YJginLfsEOy33S7YtjQXAMKCDR/GIA60U0Kqce9bOrFVyINV+5o2EOqAg
	BQT1yzKS24gaTCJoGe+K8IGOSQ9nxj8czSN3yi2wlpPi1A6rGSwtlxHZVXRbLHR/zj6uOyEfr1
X-Received: by 2002:a05:690c:a60f:b0:821:e0a:6cd9 with SMTP id 00721157ae682-83474fa5e5emr27389407b3.17.1786639684563;
        Thu, 13 Aug 2026 09:48:04 -0700 (PDT)
Received: from yogaman.home.lan ([24.99.5.57])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-836bbdc0ac1sm1765247b3.12.2026.08.13.09.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:48:04 -0700 (PDT)
From: rahlquist <rahlquist@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	sergiomelas@gmail.com,
	rahlquist <rahlquist@gmail.com>
Subject: [PATCH] hwmon: yogafan: add Lenovo Yoga Pro 9 16IMH9
Date: Thu, 13 Aug 2026 12:47:46 -0400
Message-ID: <20260813164746.105154-1-rahlquist@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <68b8866c-72d5-4ae7-9a41-ba8985d672a2@roeck-us.net>
References: <68b8866c-72d5-4ae7-9a41-ba8985d672a2@roeck-us.net>
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

Signed-off-by: Richard Ahlquist <rahlquist@gmail.com>
---
 Documentation/hwmon/yogafan.rst |  3 ++-
 drivers/hwmon/yogafan.c         | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index 6395c94f4a6b..9ff5db5dc08c 100644
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
index 48fa5148d9e2..154a33458d8c 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -90,6 +90,17 @@ static const struct yogafan_config yoga_pro_7_14iah10_cfg = {
 	.paths = { "\\_SB.PC00.LPCB.EC0.FANS", NULL }
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
@@ -237,6 +248,14 @@ static const struct dmi_system_id yogafan_quirks[] = {
 		},
 		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
 	},
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

