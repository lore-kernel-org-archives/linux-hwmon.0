Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442CF329C77
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 12:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764333846; cv=none; b=LZr4uloeLQwGflerX8YHDhwRyzprLHZS8KULQ/lRZaj4U4QlIzTIysRGdf6uKagO2X4pD1uZ2fsWc9HKZ4A6+UVP+aMUgwMRAlLAb0M/rtqJ4v5dxGGjjI/0EwsuzRo+hS4Rh0JllQJdGkmLVLZXdMFX/lTMYp2nEsGwoKdxtq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764333846; c=relaxed/simple;
	bh=+JYkccohJPxtTxgjO0MmVJPCD7JdGHRBlF9twCxotsg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lQIlho1KhXlW+I2cbh4abU/J81DkBRbeJYggQ+3PiBAfegLpQsLXasn9H6z3a4ggrvyMC/XQiAGMkljRjtBCFKKfuQemORvTFq3zNwZUrqRVhIO61cOAgJs7X7KPUtA4E/j7NQqZuMqwekBbG14wvBhKFyunhH7x0zjyTfo3pds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBbTXaSy; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBbTXaSy"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so1655673b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 04:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764333842; x=1764938642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6/uSvuju5dWyLVdRy0T4vm/UMOcqMe/o27PlacpwM4=;
        b=hBbTXaSyjlTw8HEFVJn5/plEB0pOXymv8KcvHyRmjQm5ttBE8Nd5X97c3RmR5xSjFO
         bIitDex5TBZpds2fz2V5/WxVdxidDmYajTa094tT88uWAo8ugq4+DoA9bdYfvBX81Mlb
         sHt+hj4eSTaSwA0eU6F19uR+McAE/Nr62Tsy6SdRr5mUvEk0kU4ktlaZ0txsWFUXvuij
         tFQ+iz/vczsejHt36octw7amxakFDXh48ClcPPp8/KTfWoD7cXUDnuT9ava4A86P3adc
         khX0rAQqviL7t6Lmr+Fj4d4hM/+7L5t5/c0jTs0bsgA4oIMm4qBySRfxzx7lbqzHPKjl
         470g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764333842; x=1764938642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6/uSvuju5dWyLVdRy0T4vm/UMOcqMe/o27PlacpwM4=;
        b=CdI8Si1aq489SFhjWbjsRg2gEG9YQ4nwzuvqPb+Qvw3BO2URa0cP/PsGRMXL3+qnCV
         rrtLumFVe0RiOA4UtmkxB1x2/Mjzf+vVhtFi2ikt1d1GSZzZqxLaykubn2pzr9lHHrTz
         nzRi4jy+Mw3M0Ns+P3O19/19iB4BZdPdFRV7AoPsY7p1IlFmVP7mrDfWcKapjSOCFSOg
         CktrFUHwvK3LZdd75q0Hc5vaKWeQDeetFRGXBAnhfgCCloJlJDvPW8vNY26pQL8lo4CP
         cSl2mldpkRhGd5sdYL6AtpsrgMboeeeqOgKxer3oTn2HvH3bhB0pHC6ZOjWWWQREphvw
         31Tg==
X-Gm-Message-State: AOJu0YwMTLiOeaUcJjGxgMcoa3XnngDp57iOEKpgqC8zS1rYPy9eOWZF
	SpZ0E3S5mgTx9eM5iKLq5aD/75ppFn+161Az4K5xiKX9ALC1MxnUhrs8
X-Gm-Gg: ASbGncuiy0caDafUWPRtFP5sfyUDrqypHFGFtMhakf+vZ7e3FQVepU2FG8QIFGhJG3Q
	Fxj39cgezGOny1ZpoCzdYRtl5c3AZ/nvlnCA9aKs8dyjCjY4FPV3JxtIU5DSuye8lGJm2XFiZhc
	Lu6smuLJeHRQPGOup0tCjl+ORV8MnSmGYB1Wqu0ooUk3jIcpRG4GBJnvzWHZ5vpAKE9NsrN9XY8
	rDeBgSCRvjQquuzsx0nqrgKZWzpcddY6ip0rp0w6oR60rYSuEq/jED+2r1OhzQ07uJrLwVC1MJv
	K1uVgMQHwOBzxBA2MaDJ0OATssrx4ycV5hBk5zW+yanuqOS9UZSkBKK3GaU/wG16wYY+H4agaul
	aZvkrO3y3O+ux0Lhwro+MyyQ3lWeKpfoFR516xGRWrcnFZ7rPOk36n0mZ5+6kQPyPE2kejOU1ua
	2mKJYlFaMhsxtkQFpqu9e6ePrhD7jj91l0lAQ6bDvSsQfumh+d31h/YlG3izE++YgDvtUN
X-Google-Smtp-Source: AGHT+IHnVGP8yrJTrTUzWQ3F5T6qXbi4UBMigIZNP3pQOi7ZqlFIIgzezyL6g3DHg4jAEFru+7lPSQ==
X-Received: by 2002:a05:7022:221f:b0:11d:c22e:a131 with SMTP id a92af1059eb24-11dc22ea170mr6731615c88.3.1764333841703;
        Fri, 28 Nov 2025 04:44:01 -0800 (PST)
Received: from 2045L.localdomain (7.sub-75-221-66.myvzw.com. [75.221.66.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb057cb0sm20974322c88.9.2025.11.28.04.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 04:44:01 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gui-Dong Han <hanguidong02@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] hwmon: (max6620) Add locking to avoid TOCTOU
Date: Fri, 28 Nov 2025 20:43:51 +0800
Message-ID: <20251128124351.3778-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function max6620_read checks shared data (tach and target) for zero
before passing it to max6620_fan_tach_to_rpm, which uses it as a divisor.
These accesses are currently lockless. If the data changes to zero
between the check and the division, it causes a divide-by-zero error.

Explicitly acquire the update lock around these checks and calculations
to ensure the data remains stable, preventing Time-of-Check to
Time-of-Use (TOCTOU) race conditions.

This change also aligns the locking behavior with the hwmon_fan_alarm
case, which already uses the update lock.

Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Fixes: e8ac01e5db32 ("hwmon: Add Maxim MAX6620 hardware monitoring driver")
Cc: stable@vger.kernel.org
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
Based on the discussion in the link, I will submit a series of patches to
address TOCTOU issues in the hwmon subsystem by converting macros to
functions or adjusting locking where appropriate.
---
 drivers/hwmon/max6620.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
index 13201fb755c9..0dce2f5cb61b 100644
--- a/drivers/hwmon/max6620.c
+++ b/drivers/hwmon/max6620.c
@@ -290,20 +290,24 @@ max6620_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			*val = max6620_fan_div_from_reg(data->fandyn[channel]);
 			break;
 		case hwmon_fan_input:
+			mutex_lock(&data->update_lock);
 			if (data->tach[channel] == 0) {
 				*val = 0;
 			} else {
 				div = max6620_fan_div_from_reg(data->fandyn[channel]);
 				*val = max6620_fan_tach_to_rpm(div, data->tach[channel]);
 			}
+			mutex_unlock(&data->update_lock);
 			break;
 		case hwmon_fan_target:
+			mutex_lock(&data->update_lock);
 			if (data->target[channel] == 0) {
 				*val = 0;
 			} else {
 				div = max6620_fan_div_from_reg(data->fandyn[channel]);
 				*val = max6620_fan_tach_to_rpm(div, data->target[channel]);
 			}
+			mutex_unlock(&data->update_lock);
 			break;
 		default:
 			return -EOPNOTSUPP;
-- 
2.43.0

