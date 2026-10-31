Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793440244;
	b=ifsCtOCJWvUY662+wZHuTDfiewsGZ2J+o+5erj+RpG4L2wG8WYi933gSwwusXWmvJAYa
	 35/zw0HABSsiqqlYabcoHx4NbynybIXzDrPRfBPqrkQhas8QRCk9/Ce2oKxvKMcSkwkwu
	 EtNWVAwDWskJuqOD6NYoPVDBoqbMQYtNZUSWnwfDu9oDnNhwKUZ6YLEeVy3n8FaYfwgzg
	 E1SeZ5xmzf4A1p9Barq2nDfVZi2QcbPPZqEEIeU7xSlkdqbEzm733jETaWUGU9FqgnEUW
	 8vEbsP+XaSbK/yKNA2HGDCNDCl/A9okkMWFJYWhbpYoENcsAzvd6cdoU0ynhxLnPoeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793440244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EivTM9AaIOsrkRjqX0xsfFPqcFyziSUsNmwZ7BEydgk=;
	b=UgojSNWDzjjumYOV39uQz8DNJUtVgEdtzV898UrEWIEzkZhJvx/KM7vS2Plt+udnzmPm
	 LmWiStj6yJOKvRdX2Vx2oI/AikwJyyVzVvoYZG5YEV6Ik66a2uaLhpJV4z6fTD6YprkbM
	 MOu4YiLcEIjf5y0IAGvlIMQtjYIIGlu+PobDSt+MjHijcelbo1kbv8cYrMHHQ0ttRmNWB
	 BKNOYgTobNp7fNUnoRNIlgoFkmb9dvGiMDhZDjQ9nSFKx+mfAhsJNUkbAt+obgL7IVVNR
	 dt4+A0Sxk4oHWzYqz8urLNVZ9wIof2gzkHibT/G/9Erty/corCMws8etY84U4zJP0Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iw4oW4d/";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA687606A31E
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 09:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA687606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iw4oW4d/
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35b2c599f43so1121588eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793440243; x=1794045043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EivTM9AaIOsrkRjqX0xsfFPqcFyziSUsNmwZ7BEydgk=;
        b=iw4oW4d/RyKBW5a1pYUtjFSFu6pJ15+v1M8Ps2Fa/meQTeGbEItgeF4eCgjjZuuM1Y
         UMBWzwdzUMMtQYDGZoC98Vhj9YBtZs/hJJ0pWdzV7Uh8dYRFhM19GaA4+oO84Ywd/Wh4
         y78kIys+Lfl9ZbsUUz6v5wEP2exSOW0Kz57pBSydGt8jgj6fOULsqqnfQ09vMS/X/x1Y
         i3MAkvYpMvuHIDqdjmtXxWKcdBJDEzFihtwS++kyA2U0y6BjbD+2MOBJwbbw9zVRJloT
         46gWf3qrr2GoDInbF4iUYb7EWBW8uKwnjkjfwjUW8ncUBLtmWovDQiPKyC4V+NMBOxX6
         FAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793440243; x=1794045043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EivTM9AaIOsrkRjqX0xsfFPqcFyziSUsNmwZ7BEydgk=;
        b=ygykFFi+MZf4uR1wkVyK47HUgKjcrSyaTHzTmJUafrN5svlYNDh79qK5EAb6OH17SC
         95mwSfN8b459YIGMyXhOrycJTnjHUmwp9SNa6BFfrgTH4Pihk9UAacYizS7RVp+k5nx4
         m53bIWh7eQlHp6YBe9ji13JHuTmys3frQ9uLk14IUtQQGz9d2+JHPyXk54VzbZqt3Dvv
         hfRut8qPzO8dj8YsptilmtwqA3AjAWPGbS6nYyfXrbrKtjFBql1P/rdRblF0+owyuIZA
         5xcyeS+dN4YCZPc6mkqVbppHrp93z2NwCRed/tiJphdznjYQbNV6QKJ67wljpym2HUpm
         Zd6A==
X-Forwarded-Encrypted: i=1; AKwUvBxeBXJg2UKhH0A5EL7u+KblkvcZUUvnYB0cBaDDqsDzrVFeuvI9JBcm7wqk9MSec9/PJg+q9FJ5EZZu2Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKY4JcCzf2+Z0Z8+swPW2ZiLAeSzpMmwKT3iDdm55uRoZ39Tu6n
	8qBUYBho3fYGOng62VBVKB4JwlQtwFYKt5ZFl7RUpHgEV75k1ntAfuN+9KuO31Meh/A=
X-Gm-Gg: AYBFou0abs2bWUcMk/SF4CUccCNnsLPO2bGdjv70UGViNgRXzD2KL3Uy7/BXX8oQBRp
	Pbx8upSjkLOvFidW6bT09yFh96431PYmHft/ZxuzfOBOTTps8gIF7yggK7zyHO+32EruWoo6qbq
	41aSQI+/WZ411gePb+EUPsU7no5vOYRb3AEmgOmQjrqJtfG2Oz4097rEGtZ18kJgi+CnVTlD8cv
	ceP9gGLCA2GKxZT9YnWRuzgpr8YMGmf0cR6Ov2/UDXXaaUl9ojILHtF8nBjatWyo+ov1rUNxPqR
	rcl/ez7ff0k/VK7fiSS7lzYXuUedUTsY2PTml2KnP7j5RKSLSr9RFLFgGOLsfm7rDM7bs7zitgB
	mVJwNKlhzEe/wQwMRDT8rIDvRpd3keodbpD0rcv9V23gLFUH/I7ziXojV2SXxE4uyBn88LMKqNP
	ygm9ZN9vxZ+QbA3BzKF0Zu8oSIMZcEix870iPHTX7yTYj3q3K3sNP3c4VC1ccjc5LbGA3odRNjB
	EJdwEgk1cZQk/9BIbQ03o+xEHzSnQvEw+K85ySws/fTgis/rKXH9SP9sl4SWHRLHbPtPrCoi0RJ
	tSG63CK3CFuA32vthskCqU83Vr/t7pSmc/5wsCJOrI87bw==
X-Received: by 2002:a05:7300:e918:b0:35c:de00:93d3 with SMTP id 5a478bee46e88-36a4247d812mr6622966eec.40.1793440242826;
        Sat, 31 Oct 2026 02:50:42 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm16137291eec.24.2026.10.31.02.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:50:42 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (gpio-fan) Update the speed cache before dropping the PM reference
Date: Sat, 31 Oct 2026 18:50:39 +0900
Message-ID: <20261031095039.11683-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

set_fan_speed() writes the GPIO control value before dropping the runtime
PM reference when stopping the fan. pm_runtime_put_sync() decrements the
usage count even when suspending the device fails, but the error return
currently leaves speed_index at the previous running speed.

A request for that same running speed then returns success without
changing the GPIOs or taking a runtime PM reference. Retrying the stop
instead drops a reference the driver no longer owns and can trigger a
runtime PM usage count underflow warning.

Update speed_index after writing the GPIOs and before dropping the PM
reference. The initial same-speed check already excludes a stopped fan,
so a zero target is sufficient to identify the transition that needs a
PM put. Preserve the PM error return and the CONFIG_PM=n exception.

This keeps the cached control state and PM reference ownership consistent
without restoring running GPIOs after a possibly partial supply failure.
It does not clear persistent runtime PM errors or claim that a failing
regulator has successfully powered off.

Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")

Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
An arm64 QEMU/KVM kernel exercised gpio-fan through hwmon sysfs with
virtual GPIO and regulator providers and the actual runtime PM core.
An injected -EBUSY regulator disable error after a running-to-stopped
request left GPIOs off and PM usage at zero. Before the change the
speed cache stayed running and a repeated stop underflowed PM usage;
after the change the cache stayed stopped and no PM underflow occurred.
No physical fan or RPM was tested.

 drivers/hwmon/gpio-fan.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 3f78375eeb448..08b58b49be5b9 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -150,7 +150,10 @@ static int set_fan_speed(struct gpio_fan_data *fan_data, int speed_index)
 
 	__set_fan_ctrl(fan_data, fan_data->speed[speed_index].ctrl_val);
 
-	if (fan_data->speed_index > 0 && speed_index == 0) {
+	/* The GPIOs have changed, and a PM put drops the reference on error. */
+	fan_data->speed_index = speed_index;
+
+	if (speed_index == 0) {
 		int ret;
 
 		ret = pm_runtime_put_sync(fan_data->dev);
@@ -158,8 +161,6 @@ static int set_fan_speed(struct gpio_fan_data *fan_data, int speed_index)
 			return ret;
 	}
 
-	fan_data->speed_index = speed_index;
-
 	return 0;
 }
 
-- 
2.55.0

