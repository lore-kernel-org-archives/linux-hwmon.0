Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28672C0F7F
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 00:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786494772; cv=none; b=Iw8kb/vXwKCKu4w5vxpcJ4LHznkkn17OdgsLk6gyeAzXKb0SnSmW1ksF3ckrVDJhY0fiaqdexK/CQ6Q7tr3cHXGsHH++UViGZumK7WdV+ni48CqW39rWjiiliI27jqHb1Tx2BPjKuJAj17e8nL43cGRwEPJSi9tKBMzzgIvab4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786494772; c=relaxed/simple;
	bh=1svFroBzlnpIoKJ65upMZgogmSp2TnVbtX2Yign+mfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eBJuPBm2XQIcoiw7DHujBRix7gKVZbKhQt4eM+u4tt4+/gSK3jltAKsjjNnGODn0RfSiM8RSBH4yAb7HlHNL9oMyr5sfCYGBF7c3tfyJXM2zm2IG86MtW9VOgGIti4in3Kkmj3wbd7eei+KFXwDcbFA4Kg1NWze+YTE6NDYf2yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiL6BIG2; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiL6BIG2"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81dfdbd86d1so3951767b3.1
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 17:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786494770; x=1787099570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XoZo0qCAmdwl/oyEFbKGWeoRRgH5eHq9HVp5BTzrDw=;
        b=RiL6BIG2ppGzL7MSDO1FnLwCH7SHrRwEHBUuqSCHAbFRMegYC4uIePAuSeZ89B8PrZ
         +UNQmqzZnzUn7haLFQfNWPa/FexvikEIW0GHgHRZyanDzH4C+xnwoXsesY+2JULCiGM1
         Twuq7raSPXFmBD05dulrD0aOkXh5qqaWCqOyOeHYaMFlP+fOdlVvSzEOMtbPU4UBDsXx
         JPDqeP4chKzX1v/kd/uqFqubLpPT1U7gKM7Eg/oWopkgzHLK837LfOyHdo9/MuvaFrV/
         M8jIlTm8glIkE77D4lAGfrSzMJpDYIs7Qjzenw06VgMDNMO2hHd6gncieQ4Ha+F2hfin
         2/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786494770; x=1787099570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XoZo0qCAmdwl/oyEFbKGWeoRRgH5eHq9HVp5BTzrDw=;
        b=GytzIMUxenHhJHB3bykDLp8LYectpRyiwH2Nl9BFuKgf0qL6XAK/WFeGyxud01FiqY
         i+Q/TllGv6/+/7/gLUQFzWCPHVCk4386TNJ9xxpWlZavZhtGyGW2m6hMnexWny+985fq
         Lu8bXr9m0m97GeFkhEXkSIsdCNgDd/BZAnNhx7WIqtkfnmjPdmFS1E9TCtazg4HZioq/
         Rxpt07bg2zkVR3JTM7P6mlgZAULypy8gU2uOs6uzkKjXYAm839XvqmGRdYWFjHro49w4
         ZgzB6GnHvKYcjNlty0oEAyI3YpxpOmtl3WyM6qeooyGYb4LzoLOp3qxDfEp23GVu7VSu
         qOTg==
X-Gm-Message-State: AOJu0Yy/4npUglQe6OqzuhbZzxSSXjQlWvBfvXmWejf/ZNHpu0BwPXIC
	1JHuzZIqCL+14yr/B0NwXGGXxMueDqIry+m8OAVg0JUPIZqX5Xc1tl69Hd5tdfol
X-Gm-Gg: AR+sD12vg0E44vJZkh/HShJcpijHvpQAjHtKlXWO46wo1iySU04unyHWjUvBiM8y6BN
	gwEJ0X6xF0fuDdBSPeP3KKxpg5SGYYuPsk/asHvhFN1B2O36LXL3YPFPyzaufnLr5jkwz+2sEkw
	1oXQaGU7ceEKDg7hKguRr1nIJpVaPR9GcmHkpuYJ9oYBAgYkFEcg8a86e+Zkf077ewaFFMWJALh
	mlHsHH8S246vXlbe/H8xEfTaoM4PxIEm80MqSIId9FSdCC6aP9q53GQjCAmhH7qgItI5W31e6zj
	7A/EnUbH5iAuqXmVTkSmQlNAO2hauhX1u4K87fUSwlgDBK4dIOge28dQcI77cWPLL6V0A/fSVhV
	1b2X+wjmXYnltjaN+dbQ78WVg0pYKHt4EZ1w00qbILygPw7dWvwiX/LfAkr1CoYWgullsKHcbrE
	QPyjfbUKnjYjA6E46uVgv0oCjUJZ+pHkHDpi4P4Ei5auZZn5k1xX5o5qhYUM0JhQ==
X-Received: by 2002:a05:690c:c501:b0:823:2ad3:d392 with SMTP id 00721157ae682-8310c3f452amr7810077b3.31.1786494769644;
        Tue, 11 Aug 2026 17:32:49 -0700 (PDT)
Received: from yogaman.home.lan ([24.99.5.57])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-830aa9aec32sm5690927b3.38.2026.08.11.17.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 17:32:48 -0700 (PDT)
From: rahlquist <rahlquist@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: sergiomelas@gmail.com,
	rahlquist <rahlquist@gmail.com>
Subject: [PATCH] hwmon: yogafan: add Lenovo Yoga Pro 9 16IMH9
Date: Tue, 11 Aug 2026 20:32:34 -0400
Message-ID: <20260812003234.93924-1-rahlquist@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Pro 9 16IMH9 (83DN) exposes its fan tachometers at different ACPI paths from the generic Yoga configuration. Add a model-specific two-fan configuration for the PC00.LPCB.EC0 namespace and document the corrected mapping.

Tested on a Lenovo Yoga Pro 9 16IMH9 (83DN) with BIOS NKCN35WW: the patched module registers fan1_input and fan2_input, both reporting 1800 RPM at idle.

Signed-off-by: rahlquist <rahlquist@gmail.com>
---
 Documentation/hwmon/yogafan.rst |  3 ++-
 drivers/hwmon/yogafan.c         | 17 +++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

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
index 605cc92..71b5f81 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -71,6 +71,15 @@ static const struct yogafan_config legion_16bit_dual_cfg = {
 	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" }
 };
 
+/* Lenovo Yoga Pro 9 16IMH9 (83DN) uses the PC00 namespace and has two
+ * 8-bit fan tachometer fields. */
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
@@ -170,6 +179,14 @@ static const struct hwmon_chip_info yoga_fan_chip_info = {
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

