Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BBE374E67
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 22:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785016930; cv=none; b=FZVodzvuyBmjtCn7ggPWX20+mXFQCs2xHEK4aPHfV4K0wmilyCNL24TyrhNxlsyC9IjK6Tuvq8A7UZV+8EQtqmR2dPPvAVbBLPfHRDVxYXBnbz8J7vxkOUcWzTekDE+XmHK3BfX3ftT8SyPBVkuRSLrqCdIsy4WfzkBdm5C2D4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785016930; c=relaxed/simple;
	bh=9ZVA5F1apm9Y8OSBwNUy1O3cywXwO9qSbRbgAFCMq0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tPXaWXKemJc7vo1TwFLshMeTZiGAm6vd7AVasAL9wvg9Ypz/os5pkpXomeoy9DhVYRmjInOcTCS4q68cYiHAcbJAlpYkodYcf7QxSFT9XekP9gsd56SBI8YoA9FhBEh/lzblLzoX3utVIoNKYoTRt3PGJ8QCB1g/XMelUDtKFTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjF0bnVU; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjF0bnVU"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84847482584so1101746b3a.0
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 15:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785016928; x=1785621728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPmk2LaJF2j7Cy/ci3JJ9rxR/hY7vB88kyDQKQGkbM8=;
        b=FjF0bnVU9CaquCgEUdtwkx7mnEUU1KAlI2F5KzMj9R6Z540s8QA+bVwa+vbn6W99DO
         qldmM/JgZ/u+Op4VO15wSsuKyW3dm+ts6QiGRY8Ah6Sxr9bP1L1FfQL9GwjdqbtvQf14
         oK5Ipbr3N/KRO+oV/qQw+WSFgrEGetXISxiYNi0mzh8WJ//RqtzJgPa5ahCoxq4pOd2e
         U5bf+gtB2OquTdn925Mc5rc6QfnxEBEMZOCLj+Ua/FbFEYh1yo+M7I3mWeMneTuaxQI1
         maCdRwfZwFBYq1pWGl9dPR1mpkRklks6NQ+LzR1wFCmr8rKT3llUUvEJ3F3YmNzKJB85
         81yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785016928; x=1785621728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPmk2LaJF2j7Cy/ci3JJ9rxR/hY7vB88kyDQKQGkbM8=;
        b=i/83WKeVurj8jcQ8MwcJQtaupLlnAdMllrLP8X30qWhzxvK9Jg1k+OPcH4XOFPvgg7
         f+Aym/j2aTuBgDxrsIwKWa/APs3JscEXuE2VNaAhbfWTCaKvpTuX2G2qyGMKsIRYXZHy
         PlVX86QTFD+4msLLi9hYzJ0GQEmErqHOj2l7uF352XnhgP5Ph6KrNAFuwnTlJ++bPAoC
         0Fm6VvgknXjRmcY6wvDiArESgPG/GRKZEAUnPcziG3hdKWwFD5wiDZ+Y72Hg1mnV46by
         PN9MBSiCwYA7Z27nIO+1gfK+ZS+AujmAlZaUcvsNl7jLG4Pi4KBAT8xPttIY2lGR5p9p
         /gKw==
X-Gm-Message-State: AOJu0YyFQCZWR9Jai3gAWR21UlLRNdASb++UFiHc2oFcPWRLv7yPoEYu
	R3+W3CwWOjX3JbnXWgoaZzaO/r/mrA2eLhH3hNz+llCpsTrumql3Kg0Ui3+FUw==
X-Gm-Gg: AR+sD12fu5zUGE+t6PHlbfVl11D3Bt5Lue/20yOs3XSZZ2/qL7MUSDvsupfARcT0OU6
	zcuDKH6w3Hm6W1WsBBbKJJixjzpvDuxo7Ulvn9csCBq4iUepwCrFuNxvJef5qhIEN0AL10Y+ix1
	LUhhIj0w4nexc6/Xo41rq+YYRkysIALTxHw7oOnsVAbw2z3S7ZO3qUDdh45x+zdmEq30SZwfmTg
	CgcUfXrvdSyswrdN8My098LVx09gNc5Xv+lzuyuyHYkQXWCy8Ktb/1c3Smufch+XhSRGW2KmKY1
	R7YpLlEGW8yaW+/7O0/e4HB1FWw8Y5oXG5/Lm/UArxs1Zu+is0i7EwdA5ygLpwtOn9EIIIFlwDy
	CV3EV75B1/S+Cv5eujby1W1LCcgc2INzkHjT0DtrrgjVUmLlPkTN2/t5tu/Rpg+fL9Co313OTBz
	6H0VJkVqY6Fe8cGMM6SAuVYfZ/7g==
X-Received: by 2002:a05:6a00:3909:b0:84b:9a69:156d with SMTP id d2e1a72fcca58-84e59266bc9mr2275361b3a.0.1785016928120;
        Sat, 25 Jul 2026 15:02:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d13f0sm1336021b3a.35.2026.07.25.15.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 15:02:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] hwmon: sht3x: Fix unaligned accesses
Date: Sat, 25 Jul 2026 15:02:05 -0700
Message-ID: <20260725220205.1931189-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports:

In sht3x_update_client(), the 16-bit temperature and humidity values are
extracted from a stack-allocated byte array using be16_to_cpup(). The
pointers passed to this function are calculated as buf and buf + 3. Since
the difference between the two pointers is an odd number of bytes, at
least one of them is guaranteed to be at an unaligned offset.

This will trigger an alignment fault on strict-alignment architectures
such as ARMv5 or SPARC, resulting in a kernel panic.

Fix the problem by using get_unaligned_be16() instead of be16_to_cpup(),
and put_unaligned_be16() instead of cpu_to_be16().

Fixes: 7c84f7f80d6f ("hwmon: add support for Sensirion SHT3x sensors")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sht3x.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index c2f6b73aa7f3..4d90f89a9929 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/jiffies.h>
+#include <linux/unaligned.h>
 
 /* commands (high repeatability mode) */
 static const unsigned char sht3x_cmd_measure_single_hpm[] = { 0x24, 0x00 };
@@ -276,9 +277,9 @@ static struct sht3x_data *sht3x_update_client(struct device *dev)
 		if (ret)
 			goto out;
 
-		val = be16_to_cpup((__be16 *)buf);
+		val = get_unaligned_be16(buf);
 		data->temperature = sht3x_extract_temperature(val);
-		val = be16_to_cpup((__be16 *)(buf + 3));
+		val = get_unaligned_be16(buf + 3);
 		data->humidity = sht3x_extract_humidity(val);
 		data->last_update = jiffies;
 	}
@@ -336,7 +337,7 @@ static int limits_update(struct sht3x_data *data)
 		if (ret)
 			return ret;
 
-		raw = be16_to_cpup((__be16 *)buffer);
+		raw = get_unaligned_be16(buffer);
 		temperature = sht3x_extract_temperature((raw & 0x01ff) << 7);
 		humidity = sht3x_extract_humidity(raw & 0xfe00);
 		data->temperature_limits[index] = temperature;
@@ -389,7 +390,7 @@ static size_t limit_write(struct device *dev,
 	raw = ((u32)(temperature + 45000) * 24543) >> (16 + 7);
 	raw |= ((humidity * 42950) >> 16) & 0xfe00;
 
-	*((__be16 *)position) = cpu_to_be16(raw);
+	put_unaligned_be16(raw, position);
 	position += SHT3X_WORD_LEN;
 	*position = crc8(sht3x_crc8_table,
 			 position - SHT3X_WORD_LEN,
-- 
2.45.2

