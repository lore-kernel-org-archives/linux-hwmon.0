Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85362486647
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 13:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480111; cv=none; b=GglihpnFI9wslbO9E0R6AxDUKGXmJMHfZ/9+5nwSh1/Q0+NAbUMyupfyZz02DuAfmvxJeRLupyIfRgInEtzAbQY/0ZvM5TIIZuLIIfcfuApwZt8DCssFC+/nvnXuzofPvOOrCJtXRe6vtbeEcvlNhZtcw/TZpqlU/Vw5Em31cVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480111; c=relaxed/simple;
	bh=IZAYf9TzwRwWpywlUYpH8gZY90k36YJx9QXjlaypJu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pIsC0RGh3nEdle2Mvf40K2cUQiyXXObKZRuRJFPkkaPWfkwV6qXIgReWGnuVux8kHN1FTfxxS8E+nnKMYobLvoch1jqFOwqscy+BkV+jrnxaOJDB1GXDIYzZ2wwgrfESEcH7/6YAaqozCmSScw/RzCuTvry57HTViCuZ4vqJJpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=XGkaThKX; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="XGkaThKX"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7355e411so24840455e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 06:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789480108; x=1790084908; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WktfTLRo83weqsYIStqkDkxZJm/k92lurSU+0igDaDI=;
        b=XGkaThKX2d/JXJLAOGisge6vmG/uXMO8AoCC6xTdbGW6RsF/caIhbtGeIowMlNxBNA
         Ra3oKOVVX5DnPFV5XU5cSK8aIrlgm5U2E2AEBgHdj/+kUHUhIDxtC7HYrSzcMvdokEO5
         X7m0vMq/4hyMs6yZZQi5tYDA4PxIKMocn2jpiX0ZdZcm4xKTi115X1thsyBx2xFChPuz
         I1T5Dplb/LbCfvOx7tOm9zGP6ldLadrgfCp/e0DuAoeJSW3Sfre+wySKKAmYc+m27eB2
         Bug8K5+IKfYufBiNFA+ZS/rAtpq6OkSvts0dPgnj6EfsevNT/zyl7Hkcrol1pJ2QORdU
         o0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480108; x=1790084908;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WktfTLRo83weqsYIStqkDkxZJm/k92lurSU+0igDaDI=;
        b=i0JEXIdhkjgsYlgT7yAmpiodooD/V1iz0IQB1OzWk9KsRpderKYcvTXhJXRioYd1Ph
         L5Hepr8LhtFtDYrEOB9lVUyPQfIE4i+8Up++9TWGb3g5+rDDInggMo70aYJVCbk96Kq+
         s4Czyq3sZarAHn5apexdlroI340Ycv/S59mBgfLj8W35b3elF/naUx/DZSU9ljD6JwWo
         ep1wwLgLj2J/TZ/cCw5K7pp6xojiE0xxeFIRg1LHbsnEIu6PXem7X+DNrPseB02St6ek
         2ebldB5yYZtKgTAkUZwUnxXVHKX2bHVGWgB+hRKHfBnWzClTZ3xjQBomW4KoNXcArPf2
         loXg==
X-Gm-Message-State: AFuF++lTS32XvE7U8ZFr2L+3JAXlJ/c6mTcWVUmuMGPfM7LPfeME6RUF
	nuSX5jHsX4FleLHkiriXCy1hsOr/QhePBvRbFSte+sVNONuVA8MUCaIEuEbA2N4DtmI=
X-Gm-Gg: AYBFou28RBxX19DtKVCEbVPZ7OpcHZS+leTMEDtw8ADkEndSYGoYssGMwGe3KcQm48m
	fPhiZTRt3tSBixqYas3tRsEn0TWdrnPe1nDbEnRDjhA72qra4PH4BsVWlvm1Oe/g8YtOMOIX4Lu
	GJqMuSwuu5l5YqC3nfrMuMI5vIZcsJLYAai4qctfqE5GY1B2wZagwNjcA6bbT/8D9zz3bck/bc8
	uCzD9tMxmGbPwlYfCi2vtXFe/QWZ5254T+LJo6TcQU/OyGLVG65JQJ0A1AL/1vc/1brNVTfSnQK
	2gaAvrJV9Xzr4jcgnwM3LieHsskp6ZF+VPP//SbyiTz9wj7GLDAwduWgvmUYcbHvXtyrc2eq5QZ
	rWgNden19JOfzvv64cYAY9wdoFEMvsa8tZvXZOdqB5uSCnsp//QwowX6ru7+J6xtdU8bg2HfhYc
	Jzlh+hloJ/nOTPFt6eCXg17Vbnug326FJPuRumUDN73/2jR1T4ZUIKdKqM6mfhHLlbvXuLSS7iB
	3ttmNJVZ7TDID77
X-Received: by 2002:a05:600c:3487:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-49e7a66af92mr199223895e9.9.1789480107600;
        Tue, 15 Sep 2026 06:48:27 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:3982:f973:cc12:b701])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e6f1sm33509408f8f.6.2026.09.15.06.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:48:27 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 15 Sep 2026 14:48:20 +0100
Subject: [PATCH v2] hwmon: use named initializers for acpi_device_id
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-acpi-hwmon-v2-1-39d17c748eb6@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAKNMqWoC/22NQQ6CMBBFr0JmbUmn0VZdcQ/DAspAR2NLWkAN4
 e4Cbl2+5P33Z0gUmRJcsxkiTZw4+BXUIQPrKt+R4GZlUFJpecGTqGzPwr2ewQtUUqM12tTWwDr
 oI7X83mO38sdprO9kh62wGY7TEOJnf5tw8/6GJxQolDRH0+q2UXguBkddCE1PvhvZ5zbk4wPKZ
 Vm+pUGVL8EAAAA=
X-Change-ID: 20260915-acpi-hwmon-12061c767bc7
To: Guenter Roeck <linux@roeck-us.net>, 
 Luca Tettamanti <kronos.it@gmail.com>, Cosmo Chou <cosmo.chou@quantatw.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789480105; l=4482;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=IZAYf9TzwRwWpywlUYpH8gZY90k36YJx9QXjlaypJu0=;
 b=FSPZhtP5PVanP/wfdT7G+f+Y07naOGWcOJ2b+Y3j2mYGjPPaiKL3jAm5HVmfcv7Bo5gFgxBLj
 NsoqV60V/RWD6MHYKRGgw93+3eL0jXWgdxnNIXyb70ESFM7TdlhMX64
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Tested builds on x86-64 in Yocto using 7.3-rc3.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
Changes in v2:
- Fixed commit title.
- Link to v1: https://patch.msgid.link/20260915-acpi-hwmon-v1-1-20747f6fd218@thegoodpenguin.co.uk
---
 drivers/hwmon/acpi_power_meter.c | 4 ++--
 drivers/hwmon/asus_atk0110.c     | 4 ++--
 drivers/hwmon/pt5161l.c          | 4 ++--
 drivers/hwmon/xgene-hwmon.c      | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 8a539e8d1334..d8e871509405 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -54,8 +54,8 @@ static int can_cap_in_hardware(void)
 }
 
 static const struct acpi_device_id power_meter_ids[] = {
-	{"ACPI000D", 0},
-	{"", 0},
+	{ .id = "ACPI000D" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, power_meter_ids);
 
diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
index 92afb64c09df..868c4e14d26a 100644
--- a/drivers/hwmon/asus_atk0110.c
+++ b/drivers/hwmon/asus_atk0110.c
@@ -141,8 +141,8 @@ typedef ssize_t (*sysfs_show_func)(struct device *dev,
 			struct device_attribute *attr, char *buf);
 
 static const struct acpi_device_id atk_ids[] = {
-	{ATK_HID, 0},
-	{"", 0},
+	{ .id = ATK_HID },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, atk_ids);
 
diff --git a/drivers/hwmon/pt5161l.c b/drivers/hwmon/pt5161l.c
index 2b408a69b085..1638f54f8eae 100644
--- a/drivers/hwmon/pt5161l.c
+++ b/drivers/hwmon/pt5161l.c
@@ -611,8 +611,8 @@ static const struct of_device_id __maybe_unused pt5161l_of_match[] = {
 MODULE_DEVICE_TABLE(of, pt5161l_of_match);
 
 static const struct acpi_device_id __maybe_unused pt5161l_acpi_match[] = {
-	{ "PT5161L", 0 },
-	{},
+	{ .id = "PT5161L" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, pt5161l_acpi_match);
 
diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index 38b140c23c88..eebbb741deac 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -595,9 +595,9 @@ static void xgene_hwmon_tx_done(struct mbox_client *cl, void *msg, int ret)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_hwmon_acpi_match[] = {
-	{"APMC0D29", XGENE_HWMON_V1},
-	{"APMC0D8A", XGENE_HWMON_V2},
-	{},
+	{ .id = "APMC0D29", .driver_data = XGENE_HWMON_V1 },
+	{ .id = "APMC0D8A", .driver_data = XGENE_HWMON_V2 },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_hwmon_acpi_match);
 #endif

---
base-commit: 587858367581b9c55c3690f4e63382ad622719d4
change-id: 20260915-acpi-hwmon-12061c767bc7

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

