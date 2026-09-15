Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D73F3C9EDD
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 13:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479611; cv=none; b=rdlQ1iWqN/LdMUgKZsp2mPxeZxO1UNgSaNkpcIcihDhMLY6DYb4cfwmMIQZIWIH31yKV/2rlXrvOUV6hA+Gp5z582Xms4xabR6iUKZiveA0JJWWM1aL0j2Pc2Ra4rlhUuj8kqbCa5hFPWoi2Gn0E2jlvSqneajckZA/Scy9H2Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479611; c=relaxed/simple;
	bh=EWMKE1cMHzUAeCouhF+AX1AoM+Adw5WqktTeUASxVbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QzmlHzRXxSh9pAQqQ93VjEH88EIsT9ZpW0uOXxL2EnrrfD1WI8Mvrqt60rSf2Tp1Vtm9S/0yawKo6qe97Asod4HMJDaKZp6fkJSkoxyx0gavaEmfbSI9IbGtfkOweEiNoyXzZzwKAWDywolo5q0bi26lDmZj7Ls924Lcdxb9BTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=vp9VXWye; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="vp9VXWye"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so2125365e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 06:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789479607; x=1790084407; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ykxCYAC0u7mqojbnQETjhBnm7QCYzlX2vdn+ds5acHA=;
        b=vp9VXWyeH10sQ272qxTqqeWjfugtfJGvMEZZZneeLZJ3gSLWcEnAoVyIHE+SV/0Ozm
         AcJNBE1OFzFeD1YTJNNsKX2hcMDgTXY9t3sLl0QFkOyuMEksJFWI3ucsa0RhlnNz5A70
         V2ZhnGPnI6lFMbFlCvg2N4Cp6HHAWtUh0ROYzT67K33G8P5tIMQkM//SyDIRAwWsSseR
         x+ryPQBJjxRNTi0R0ZAYNqKbcwsZpoRwqMzkPvV2SKbLmozlB2+2JLeDgdZHDJqbyQsT
         0du3sZIqKKquEjwjm5Ku0oN9DqHbNkFP/AwDKeT+CA8OsT8x3vDLsEWDrTRGowuTvfBg
         NzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479607; x=1790084407;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ykxCYAC0u7mqojbnQETjhBnm7QCYzlX2vdn+ds5acHA=;
        b=y0Vyh2NUU8vmJVLzzRQWqtsP5F6YyHmNmjHhGIt9xnQB3Deh9BhGoXfP9BeX4nGNYY
         8LQhLVtcCDeynEMJkc7+acl/1ukU/Lv+5rvHmQeWTTAj8C/maf1dYtoMsVtpzo0VI/9L
         +DUDTMGA+k0kpSQtDAMZwRN529T70Q6ELgPonw7tqcTAqEoYCFrGQCMrCCvMbS8mN3QE
         6WmX3eSxge+5eLaEDGfy101Ztak2g5ogKbgppHOYmEZrefJ0QNv+INFhvCjV3FgpZKhF
         gUE+ikcSVowL0ub8YsDf60fdi0cvmikegoFk5BVOiadHV+8+6tMy5uWD1NYGCcuhvs4Y
         fK7w==
X-Gm-Message-State: AFuF++nizDqmKqx+STq8bob/bwQpM5u/u1aWEYpLfU6UxaNI3JdOW9gJ
	FBKINRPmK1RbKgy1/t452ENc8YGTt4yFQy9tOA0ikeolgbxWhaSq9e5Ra3SVvNTNZ8VIBEgiihc
	YdBCIYAw=
X-Gm-Gg: AYBFou0SPl36usn+U8LHW8ooiiULnqf8X1OvmsmNmB3y1V4hGmF8Jl+acqfcWKcxQJc
	z2bfGdm6ggHGuv+ANdzanodIk0RWy9n12lY1bHRDbwIdF521E2HToVP22y4IEu6CevzRhHjgGix
	4uFrUoQkiZHZUvP4SmysIP29xi1c+uYDftm0Ao3D+Z1B1s1WKqq0GfV7jYePx/jqIUCbo7gVsz0
	Z/I6Y0/yDM80fhsefHi+wdYMpZsu1nHs31PnU/NqvgG6lk7/DZBre5WACg5YkkzvZuWIBNwdC45
	pLvvNfJJKvr0CUulNb2mPivw1nyLnwveyDf3fM9dnQ0LkouWqphejurKkxOozWDDZg4oSMtYlrD
	zKGFsjtI7k+c0mSHzRT0nnnyW0ges/8QBYHPEynN/SSWMaz1cgBovMFbVq5gmmpFcn/0HycVD5H
	yajFz6bNkJOW/eSFLnA68gJH7FRKktnRG3cegocinGJZeIqwdLf6EGqBlL4ojuo1VolQQVIMKvh
	w1i7WFeOn4wfWn+
X-Received: by 2002:a05:600c:83c7:b0:49e:816a:9bae with SMTP id 5b1f17b1804b1-49e822a9544mr19692315e9.28.1789479607411;
        Tue, 15 Sep 2026 06:40:07 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:3982:f973:cc12:b701])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef6bc50sm66914935e9.3.2026.09.15.06.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:40:07 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 15 Sep 2026 14:40:04 +0100
Subject: [PATCH] hwmon: acpi_power_meter: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-acpi-hwmon-v1-1-20747f6fd218@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIALNKqWoC/yXMTQ5AMBBA4avIrDVpm2jDVcSCMRiJktZfIu6uW
 H6L9y4I5JkCFMkFnnYOPLsIlSaAQ+16EtxGg5bayFxlosaFxXBMsxNKS6PQGtughRgsnjo+v1l
 Z/Q5bMxKu7wHu+wGS5GDHbgAAAA==
X-Change-ID: 20260915-acpi-hwmon-12061c767bc7
To: Guenter Roeck <linux@roeck-us.net>, 
 Luca Tettamanti <kronos.it@gmail.com>, Cosmo Chou <cosmo.chou@quantatw.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789479606; l=4339;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=EWMKE1cMHzUAeCouhF+AX1AoM+Adw5WqktTeUASxVbk=;
 b=qvXxsAp6YO6juJlqrdZPUUBoaszCbkOQb7S8zNP5krbGMsx1uFMkOp8227jJOOHd7yHL4IZuH
 Td+ZFjJ2pS2C5MHWmYHqPjoefl+D4pYJ6qSv7HW08Hg9esvCRIeKfaN
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

