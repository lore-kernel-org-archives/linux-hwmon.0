Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0E62C11E4
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 21:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785016681; cv=none; b=AtKWMXWFF8ef/RPIRq2X4UdGsM3SkOJ9yaHlVNk8hPXtl/yHB8Ix9gFFeeVGnYxToSwOgcpVfuw80pA3dq/BD+m3BSRYqZ5+FT83O3R50+qU71qbMwze2Q3YJsirEo7D1ro5eK30BMaOz6pwu9hEiFuTGWqziqLJMNcjYIXRozo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785016681; c=relaxed/simple;
	bh=uGdezS5f5mKtNC48GAhz3Yw5vPIGaLESKS0jzv+W+ME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rU4e0GUVFtc7mcvknJZzyzS1DFLBAdoaSKhOSU7NPKH//N4HUWvmJ5tZqEBu/X1lXubRF47tR/brFV7aQxM0JSA/+mgZMbqHGcCCTqjic6X5r45nDoIHW4sKkGLcB1lxY8VvuwYnU9NiqdPkpWM6OVeMt3zTxPkeVGYLPB8+y5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ifg9+/cE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ifg9+/cE"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacb8416a1so14876395ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 14:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785016679; x=1785621479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ij+nPvM2JujHYHrlzoLvu1+uFgTfhmH0qa8iNuWbYXY=;
        b=Ifg9+/cEJsMA2AK7Oun6H5zkpCxVuMPBqh4Rw3TgNNO1VUwiDKLUKVX9WrD/bdKGZz
         S5SGXRft3RBaMMlsNJmLpju0yc+HiIBHCE4fCneBWCHYud21q1BiOEaVvFAG1UropZ6G
         uKiI+zWCmKMnq3Q/1MI+vAv6dRH/WFFo26ab0VBdxBThpN75o6hsQHOuvNHb94N1Q21X
         L3OxCYCcbhCxZ6mAYUQA+R6rXGJJYirJAuxHn0hLKT55kpmh81278lbqJGI0ft+YrOCx
         OEaDVr516HNU6EURx5chVCHfJH5C794vqOhCtrDgdUVARc10B0V9LhS9cKlE78DuiD1s
         suww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785016679; x=1785621479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ij+nPvM2JujHYHrlzoLvu1+uFgTfhmH0qa8iNuWbYXY=;
        b=V+RXrlB/YsEZ4vBGb9EMpMRZ4igulmArXlrT9cwQ16QLT0etkMXU+dLDoLuLPN/3gT
         k0hSNdIa3/Z/1EcF45VrBDPqiBqj0GPMLOJc3gspsG2fUS5L7S2OhX6iCNLD4I3Uqjwm
         9kmOC+IAQdi7ZOBlyYFl3wy5IzLxphu69t5a4hPwoRovH7t2MafUD9waM1ZSIrIVG57M
         FuRe5m1BvyRabeU/lXeUYJZF+oDlOz/d4d2VmL8vEJn2ibXae87+TrtY9oJpZhsaUAwz
         tj33xvsP5UJZyErJnla8OtF3RPZT9CqcfQ8WzSSer2TM4vLeH/dHyoV0T2sS77SCoV/y
         ak2A==
X-Gm-Message-State: AOJu0YxPMShjbeaISlzCk5SXPRYfW9OcGZCKjnthLoNb5djTTU6vSpXf
	QIcbUZsIxtFfARJdSaIUEiGBTI55RUrL2B4uU6EmcTgykt3mQx+LolkoPbGyhg==
X-Gm-Gg: AR+sD11Og0gHhdXbG6hfPfzcLEPn73w3MUQfxtCr6ovJYT6mqLR8lXx6JRNE0yK7Xuy
	0CPr6KeGuKZfui2oWCOcAInRGH30UsIMAzV5vb7OqAbmrWT3bE+y4Vbi8pL3ozNDSKg0zVwkkRY
	BIAvS2LdCcS1d+QwzpHSBzbW5HJ2kboKsR7EdRWba8O4o0zJY4Cx16g3rx1aaMisbw0roZhO6wX
	CRcEoO5rGhFUIcaXurSoZrigUALLLZYnbmZI25anQ7daaTT2jRAU/w4izTvEZO4oHcmuff121Z6
	RDzzbcoKFsaeMIcdLeUbIuYlNvKxEurg93YDxUibGMo8M2VxVdFTICxr2riSJ20dhUd22VK7x8o
	bBwR/bhWSoWyqf7hRjsAfy7itN0ExDu9NqJlX5jD7ch8NMO+BPJ/+caAVJkroTWEP7AAbiFKSQ6
	XlS1yJ5MJHy6c8knfhl+s3HkFMtg==
X-Received: by 2002:a17:903:1ae3:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cfde798d28mr29557075ad.17.1785016679009;
        Sat, 25 Jul 2026 14:57:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc4f4sm13184185ad.39.2026.07.25.14.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 14:57:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Nuno Sa <nuno.sa@analog.com>
Subject: [PATCH] hwmon: (ltc4282) Fix reading the minimum alarm voltage
Date: Sat, 25 Jul 2026 14:57:55 -0700
Message-ID: <20260725215755.1926830-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coverity reports an out-of-bounds access when reading the minimum alarm
voltage for the VGPIO channel. Add the missing return statement to fix
the problem.

Fixes: cbc29538dbf7 ("hwmon: Add driver for LTC4282")
Cc: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Sashiko is likely to report a potential overflow in
ltc4282_set_max_limits(). That will need to be fixed in a separate
patch.

 drivers/hwmon/ltc4282.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
index 39b9d3abca99..cc698803f8bf 100644
--- a/drivers/hwmon/ltc4282.c
+++ b/drivers/hwmon/ltc4282.c
@@ -374,8 +374,8 @@ static int ltc4282_read_in(struct ltc4282_state *st, u32 attr, long *val,
 						   channel, val);
 	case hwmon_in_min_alarm:
 		if (channel == LTC4282_CHAN_VGPIO)
-			ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
-					   LTC4282_GPIO_ALARM_L_MASK, val);
+			return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
+						  LTC4282_GPIO_ALARM_L_MASK, val);
 
 		return ltc4282_vdd_source_read_alm(st,
 						   LTC4282_VSOURCE_ALARM_L_MASK,
-- 
2.45.2

