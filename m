Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22091308F03
	for <linux-hwmon@vger.kernel.org>; Sat,  8 Aug 2026 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786178246; cv=none; b=POkBSb5LnRj+HBNz9bY+mGJ5zjJcgvl8onc8D+ZMiMYSgMSF48lbdWFrjwntbPmQtWR6obC5x0fCOAHBHqcD/GE46199UMSWbcT0wl7Rjwce7j8BYj+zufAGpzOs7Fja67jZP9ksQXW4rDi+0qh4815iT/ISfrLZfztOvCKPKaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786178246; c=relaxed/simple;
	bh=1FQRD6y3nQHRT/3ACGuevi9lV0PULdGjUaVtobyDon0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LMrQXIuL0AWethMr5KI5RrC9GwgXGXSMV8UzZD4ooTQKWkpzk/n/GhoXty6VgdtPex0Z48QcMRE6ZKz/nXqynpIi4iW0vtuTmEINzXJtvPVB7pB9vn8qp6n2IZ0SWTx0azq5dBkXH0YoGEcgVdlV5aHu5pj5/0+5kPfcfXGo3Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erSu2a2k; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erSu2a2k"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceaf8a1265so5650305ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Aug 2026 01:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786178244; x=1786783044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X3aT+2HiJFLjEoJh1JauY8Vmnc/hB4K6lngFnJNa8gI=;
        b=erSu2a2kzSpondAe3MbRw0sS9HzTL2F/vvxNWOk0Sx3/ycqDtY1DANeptiRj/g7nqo
         VL7wMGkBi9rmD22JNDY1iCW9W1OdyIhC2Fu9c+byW3oXSE8cUVH5XWI0DwJbZ1EYYRdA
         LqeW89T8nD3pHWyt1XPwWL5aCZtkX0P072O86b1i3a1UdxsI0UOwdTKiUtxR0tieC7hL
         L9xmJPWbb96iE3Os+WaNCav2SiLJD9JBBD4Nw+U4CCJTP4ojt92skYKExcGy7U4CwhWQ
         7f5HK7OiUVh8Ea8L5cc2QLdDL8ViEtLWkNINn05Qrd7vTR4LQq3T4cEaLxHDGw+94DDf
         Q6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786178244; x=1786783044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X3aT+2HiJFLjEoJh1JauY8Vmnc/hB4K6lngFnJNa8gI=;
        b=PMWVwoQefK8D2nK5qeOAPB9W1PxM3wcXlzfv2qCW6ndDZYkPtsNiRV9V0M6PcLaAEn
         Ww+VBE9TBMgAl+J4xnzvBr+kXCuBmcTNUXP7J68f8XM4Ot0qw6eqX4M+bwhwZZYJNX6Z
         srArubN+20qXha1uS6x2qBjrR6NxEkf4Chbs20t8RBc0mfs5E8tmxQ5e7CrMqrfQdjiG
         b0j/Ung7Vb4hFyeXR9Zt9NxQ47BSt7aoV5ZaqUAbkpu0S9kRCqpHIO4G3XsAkF/L5C5k
         DT0dwTvQEdlUNu8IxVNs4pYqvYn3GrpkHbNQ8k8MMXArMDAeTwognXFEUSe7bZiW5HC3
         R5dg==
X-Gm-Message-State: AOJu0YzBN14FJ8cFeG45ByrXxVN6Wa7RyzGio8lUXFw1+Ze6BmV+LIeM
	jDsOuqfUqB1hXzdBA03Pgqf3phyOAgMt+11nnvNy6ACyD2G3joP1+OD8bms7LmNW
X-Gm-Gg: AR+sD12P0+uCP2+BAF7lduOLjMG6lDT5IHO1ou5DfaDmubUOmU69oiuln1c/BJnZi+U
	ZM59KPLli/kO0JLZBHCVcOC3fCqO4mAEeOKodFZ8FuCpv4nIMWvk/P9lPP+7JmcDRlzI+EqUMSe
	1bY/QHhTHtq8mp7hQBvtE4fy1dq+abrgrQGc2Veco3tq1M9g20CpCwgPjCWnWCHgWyHmRZUmVfd
	oo3AkInO/oGUtDV5u8eU1bIO+J2FPkzMtWl8JK4Owu1njWRsdaUAS5QDqLcYJijbV1qdQpkUfWp
	TScgT78tr/pFUJDVQ6fqO6MDj8ruqfgtFHFcpzDTfcuN9Zf5nJURc8tZPmDpvtA0FAYJZRuUanZ
	fg0dtpsjuEr/PTKRYETxwxTvIZRidor3O0H6Qfjn/xVERCYbhfIAUY91KgjZhqU5wsYW9Kb92Oy
	FqGugvXKhL9qyyLw3DcDJnq6F6oXruTD95L0LzQvgW+lPpoJ3EkBUb65ywIDbNnoYlbEKBG9cce
	mtthw==
X-Received: by 2002:a17:902:ea01:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2d0ca71b505mr306746185ad.7.1786178244329;
        Sat, 08 Aug 2026 01:37:24 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm16736028eec.4.2026.08.08.01.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:37:23 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Vadim Pasternak <vadimp@mellanox.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (max6621) fix negative temperature offset and crit readings
Date: Sat,  8 Aug 2026 15:37:18 +0700
Message-Id: <20260808083718.2612205-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

max6621_read() reads the temperature input, offset and critical alert
registers into a u32 and assigns them to the output without sign
extension. The device reports these values in two's complement (the
driver comment and the write path, which clamps to
MAX6621_TEMP_INPUT_MIN == -127000 and encodes negatives, both rely on
this), so negative values are misreported as large positive numbers:

  - temp_offset: *val = (regval >> MAX6621_REG_TEMP_SHIFT) * 1000, an
    unsigned shift, so e.g. a -10 degrees C offset (register 0xfd80)
    reads back as ~+1014000 millidegrees.
  - temp_crit: *val = regval * 1000, so a negative critical threshold
    reads back as a large positive value.
  - temp_input used an s8 intermediate, which is correct for the
    -127..127 range but reports the documented +128 degrees C maximum as
    -128 degrees C.

The registers are 16-bit (the driver's own PECI error codes occupy
0x8000-0x80ff), so sign-extend from bit 15 before scaling. This fixes
all three reads and drops the now-unused s8 intermediate.

Fixes: 92b64580f14b ("hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/hwmon/max6621.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
index a7066f3a0bb4..03ac3eb5a594 100644
--- a/drivers/hwmon/max6621.c
+++ b/drivers/hwmon/max6621.c
@@ -204,7 +204,6 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	struct max6621_data *data = dev_get_drvdata(dev);
 	u32 regval;
 	int reg;
-	s8 temp;
 	int ret;
 
 	switch (type) {
@@ -225,8 +224,8 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			 * The temperature is given in two's complement and 8
 			 * bits is used for the register conversion.
 			 */
-			temp = (regval >> MAX6621_REG_TEMP_SHIFT);
-			*val = temp * 1000L;
+			*val = (sign_extend32(regval, 15) >>
+				MAX6621_REG_TEMP_SHIFT) * 1000L;
 
 			break;
 		case hwmon_temp_offset:
@@ -239,8 +238,8 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			if (ret)
 				return ret;
 
-			*val = (regval >> MAX6621_REG_TEMP_SHIFT) *
-			       1000L;
+			*val = (sign_extend32(regval, 15) >>
+				MAX6621_REG_TEMP_SHIFT) * 1000L;
 
 			break;
 		case hwmon_temp_crit:
@@ -254,7 +253,7 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			if (ret)
 				return ret;
 
-			*val = regval * 1000L;
+			*val = sign_extend32(regval, 15) * 1000L;
 
 			break;
 		case hwmon_temp_crit_alarm:
-- 
2.25.1

