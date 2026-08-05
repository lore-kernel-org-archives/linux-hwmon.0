Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CBD22A7F6
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 00:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891448; cv=none; b=E5BT7yfs9ijwMaWM/303Kwt9rwmPDyi7daR5Y7/9ntxWcPSEgEm6IEUMWonLcNxUYyVf0HDaLryZ3qkpz8zyBmsGvivfV7N1/m7f8NgX14MX3Gc7MjBhycxzooYD0w28ZkZBGCB1JGWahT43YUxW3r8h4NmrTTB6mdVT75BTPdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891448; c=relaxed/simple;
	bh=wng+ZdXwb9rk/IYBKotq4exBLH69abotecAA4EgLE/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z4yV58EGUrOa046EAlmDdOdElEGLLBkoo8PX7EDwok2qSyyCAOG0/PL04y/sq67+rPY3SDw8f4h5teqP1oOO0EyfhxrkqW53jwPAgC4J2Slx7Szl66OPw+ISXjE3nLG44T0mvRweErdnTOBsTt5o8uiM4fbKbJtRG2MjEIwPGQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBcRFf9d; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBcRFf9d"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dcbade417so336768a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 17:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785891446; x=1786496246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugIEGQBm1epkMmYUTc9RBj81IIB58bqaEFJ446iYDHg=;
        b=nBcRFf9du7tE1T6WkQv6ZAickCkncKtkiwZVY9LRmL6bJNChAzI1EMicD+c2qJcPLm
         WPNny7gcKx3cS8+7qrA00zjX6q4sN/4uakmlGfXgqnWMjLnAlu6kcELfroYDr2HWUcpr
         haLezIzH+dSdv80HouKzoEcIJF/7kNF1Uu2BTY+lJpmT4fhFmD8pWbgYWHCSkmerIhAM
         JziwWiKr2WnIXWOLR0InYF/xfUxjC+p88k+0Z1qr4OXRjhMJ9ea+v3rsOKPs3jL+WKiJ
         snWfAPTq1Tbqk0eFBk+/eJwEtYq4EUMbTrUVTwhP4w73txsVf+wCfxyjCbRec6YeuoI9
         hSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785891446; x=1786496246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugIEGQBm1epkMmYUTc9RBj81IIB58bqaEFJ446iYDHg=;
        b=OEbOw6i2KuoSaFc/JD2l2yau5S5ICeQoGT39ZpxlkgMBRfEarE/AESTsq9bQzjrqoE
         xrHEisBNob9gv0a5rfuxIUTlsyB4Ni8HVMYEev1BlkEJzzHbHv1D11MsaJ9ehgI05akT
         BSdnYdpVcDgl/fWxVmNUJVQYfw+ehmCCWczvV4QvCy8HN+mw6HNd+6DSJhu2Zkt5YWK/
         0LD9JdX7sJyIjltg0XQaNc5adXhEgJBKp6lOC5o61IdJDqoiOv3OYBoaNFpytWA23TSz
         V2qRLHIbY4adx0/PIGfLgPX5wZJ7chUAQLCxds5fiMYknF0pRBfc+gf9k/ZVyJ5j7vO0
         limw==
X-Gm-Message-State: AOJu0YzO2Tt2Udqac/nee9/3tCYByX6nsFRomc9xUvjjPaQT14YfCPBE
	cHBXczxrw9ovIqcntsXG8cGR0EvpejzBfL281mBtPBVIC+GmyG2jZaBl641auQ==
X-Gm-Gg: AR+sD11W9pu8Maw1c18hKAOwfMkxrsL77Ix1+p/TO5NScVd+UPM5oHcl/yIb6xYh0fM
	uTtqnhLVDgxZbvgQAz60t2ZFeBoMx0YJqNFfbLoC4adT+5OP6BNVpjmLsKCCOKx5NJuTqsp/Y1o
	Vos4mxxakYE9JY2WrNvIWjhRSLOvB05UjU13c5Qw9OzQp3X5sWGkluaeglbku+pRwFUTHh5b0Ar
	XwcC/9kiGQiLmyRQZPWZFdPsnOLE9lFL0XlcNQnRXm0xv2Tv3zF8zEvEZAOzVnxhQCiHui/Vxem
	o2JBbIo17BdZuePF09WnBQjZQbxNJUin1uvy2/ssoeik0JmlwBWm45nB+s5QpRTKm1nbqL/tX+/
	E1wSOdBvmRI4lde3V7IyATWcsgUKtR9rXi9kS6Sx/Olwg79C0JNIXnUqm9T5pivDL5uETLVVI2A
	+Yjzd3SnKXgCrm7XXgVYfjQt/2xoFMc1dQZ2a26rir0THOiOB6jWiyNf2TjMkdcKEEMVd7LUXRv
	gJIGVJOZ+us
X-Received: by 2002:a17:90b:528c:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3903c5448dcmr2858172a91.4.1785891446235;
        Tue, 04 Aug 2026 17:57:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca908068sm7018818c88.12.2026.08.04.17.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 17:57:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Nuno Sa <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 1/3] hwmon: (ltc4282) Avoid overflow in maximum power calculation
Date: Tue,  4 Aug 2026 17:57:19 -0700
Message-ID: <20260805005721.1566034-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260805005721.1566034-1-linux@roeck-us.net>
References: <20260805005721.1566034-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During device initialization in ltc4282_set_max_limits(), the calculation
of the maximum power limit can suffer from a 32-bit integer overflow.

static int ltc4282_set_max_limits(struct ltc4282_state *st)
{
    ...
    st->power_max = DIV_ROUND_CLOSEST(st->vsense_max * DECA * MILLI,
                                      st->rsense) * st->vfs_out;
    ...
}

The result of DIV_ROUND_CLOSEST() evaluates to a 32-bit unsigned integer
on 32-bit architectures. This result is then multiplied by st->vfs_out,
which is a 16-bit unsigned integer. According to C promotion rules, since
both operands are 32-bit or smaller, the multiplication is performed in
32-bit precision.

If the device is configured with a low sense resistor value via the device
tree (for example, 100 nano-ohms, resulting in st->rsense = 1) and the
voltage is high, the division result can reach 343,750,000 and st->vfs_out
can be 33,280. The product of these values is approximately 11.44 trillion,
which exceeds the maximum capacity of a 32-bit integer and overflows
before being stored in st->power_max.

This overflow causes a truncated value to be assigned to st->power_max and
written to the hardware limit register. An incorrect maximum power limit
can trigger spurious power-bad faults or alarms, which may lead to the
shutdown of the monitored power rail.

Avoid the problem by calculating and storing the maximum power using 64-bit
variables.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: cbc29538dbf7d ("hwmon: Add driver for LTC4282")
Cc: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc4282.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
index cc698803f8bf..bb7f6727c44d 100644
--- a/drivers/hwmon/ltc4282.c
+++ b/drivers/hwmon/ltc4282.c
@@ -137,7 +137,7 @@ struct ltc4282_state {
 	 */
 	struct ltc4282_cache in0_1_cache[LTC4282_CHAN_VGPIO];
 	u32 vsense_max;
-	long power_max;
+	s64 power_max;
 	u32 rsense;
 	u16 vdd;
 	u16 vfs_out;
@@ -613,13 +613,12 @@ static int ltc4282_read(struct device *dev, enum hwmon_sensor_types type,
 }
 
 static int ltc4282_write_power_byte(const struct ltc4282_state *st, u32 reg,
-				    long val)
+				    s64 val)
 {
 	u32 power;
 	u64 temp;
 
-	if (val > st->power_max)
-		val = st->power_max;
+	val = clamp(val, 0, st->power_max);
 
 	temp = val * int_pow(U8_MAX, 2) * st->rsense;
 	power = DIV64_U64_ROUND_CLOSEST(temp,
@@ -629,7 +628,7 @@ static int ltc4282_write_power_byte(const struct ltc4282_state *st, u32 reg,
 }
 
 static int ltc4282_write_power_word(const struct ltc4282_state *st, u32 reg,
-				    long val)
+				    u64 val)
 {
 	u64 temp = int_pow(U16_MAX, 2) * st->rsense, temp_2;
 	__be16 __raw;
@@ -1222,7 +1221,8 @@ static int ltc4282_set_max_limits(struct ltc4282_state *st)
 		return ret;
 
 	/* Power is given by ISENSE * Vout. */
-	st->power_max = DIV_ROUND_CLOSEST(st->vsense_max * DECA * MILLI, st->rsense) * st->vfs_out;
+	st->power_max = DIV_ROUND_CLOSEST_ULL((u64)st->vsense_max * DECA * MILLI,
+					      st->rsense) * st->vfs_out;
 	ret = ltc4282_write_power_byte(st, LTC4282_POWER_MAX, st->power_max);
 	if (ret)
 		return ret;
-- 
2.45.2

