Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125321;
	b=FN8S+saqPIGVnNE49mS4XhK3qfhOiD3yb91g58UicwXQl6y1XrWbZmCcx3JDNpWZsW2I
	 4uL9JfvpRpOAPJJPXBAlPASv1BNkt2kAxDbMTmp4FvzBzROLo4T1HyiP048TT87cE6IqK
	 UPQ6YEQPMUr0MmIWxuHmgoJw3cEelI+QchT/4VXp8IZnNOIvOQKbr7uWtiWcyqppIb71V
	 /RX2DqsFDRyZCNWaZP9hoJfcMS92phmC9Daoos2a8X4zTE37YWNQ8dmgxhgEnI2CjVizi
	 6gkOb6hd1QKCuES6vw/7C8R8B008DeYsw5hQPCpTQv7qBHEJ1zx8BtmL2MZRko54P0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U7XmuxZEKsKhKcPeD0Bm1mQbeva3m9bG2ujD+Ag4pwA=;
	b=J9S2AZPiiWWM2cBW8sdfDzAqSdliGcNEGfdNoPsSIskdJVt9aoWh0uqtByUApt4m9t4E
	 Msuh9A7rbctgUL3n5RRQSW2xdSR97mXNV7c9D3qmR9eYbkD821VBeoE4vCHGWaVeWGpFy
	 /bMIt1P9cgSgVi4xdW+JeN9jWBNzIH3VnLIIUpLaJsicZlmd8l81dZcE4KwowqKJsRpFp
	 esAy4bYww5jB6IM0zRX2O9f69GlhSZy+lIoO34Kmwqyax2xOrexmqYJk/ROEH1LnYpQc5
	 TrtnoimKqw/M0uREIlfRnPFQIt7nzyYmBehZc2bcXZwTvRtiZfx+ZR193pcfUPS3uFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBtp9ZAZ;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CC9606A324
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 21:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69CC9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBtp9ZAZ
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9495f083657so36494085a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 13:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795125320; x=1795730120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7XmuxZEKsKhKcPeD0Bm1mQbeva3m9bG2ujD+Ag4pwA=;
        b=hBtp9ZAZubEyioZEjMRiNkXicclEhX4PAQOrX0HufTZNyhdbh+GclybvsOIWi5NsGf
         vKnuxjUuP9E86w5Sf1tsOXeC9DON6PAY57sSCJ9UZcmbWgQhUewlKr3pjGht01uZbgfJ
         Jj2QNAXBryUxkydrpdsicqpt0PrQON6jm6hFPPkSiFWGOL8/QphdNyJzktgCwiKvPCJS
         fxGu+EmXlqyMTqrKOfO3gi+NN2tjoh9VG51sQUH46mialdnA1XixZzpqvi+G2KtUQwR6
         tu+o+37bWr0iT1F+o+ih2UvgsDEjRPsQZZDuXwmR5sdUhJU4/4DBv0nMP2fnPHGq9Niv
         G+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795125320; x=1795730120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7XmuxZEKsKhKcPeD0Bm1mQbeva3m9bG2ujD+Ag4pwA=;
        b=nROrCyzsWJkl0BKglX/EkxZeQqGisyVE5kQPVurP+qMRrhYnbF/DcUxE/wIaarM2ss
         1suGjWhCQQJt9sCQxZqKwnpZpjByUTt40gLUcVEbtwiSRPY+9GtyAgwmSX91X8w0RR5j
         ZYkIzj4HqDcd4Q6jsNQtoRTR3B1wnndtQh+nqeZkDd/A7hK0HX9LV5A/oPFRQOQow1Uo
         HCYOUnUOmEerKmN8ssqlyDZYiQwAb32bpsjfOrvuHhn+wIfRNP4ItfuMFJzzYVL7Pdyl
         g28DfB/NWXiaI8Myyih6Xc1OeqbB4OMcr96fAJSXcD8X2sctb5EfufgU8rmPmOuYAtCa
         QIKA==
X-Forwarded-Encrypted: i=1; AL+hErFjXfVfUHFHg087ocnoTxr2v3UgflMIo56PPTegVWq8vomlx53c36RjjsL09b7KxN+A7KwTEsYUWKQJWQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/K/SXyaFjR5WaYsLvwXzGF09MnB5oJpBzdThQQi4DRnlEKg7eO
	8GLk9pDvDCG6GhbsY5CT4654i3eoshaYUuPGamGcliORpWTY9PpEksmxCt+HDGAXEj4=
X-Gm-Gg: AYBFou28md0zSlg1rWgmTjbbV7jmASX/5zdpt+HQCRNI6TgfgL4RZ9xoTPUKJXrX29Z
	ShzfqvYvmvEbwiG8UyqxNFYgiCW8p3A/3ooBstAOqTeeuMfOUssterKZry43cMwTtekq3quOiJv
	e2UWB5g4dyYWjqfbXovWafJsDPyePiJebWg8eqKQ3nXXsgvMq5Mv3ARziPkYNZ05myxZjbkS2ck
	NpcFiuvXwkizfQTbdvX25yobOgwCgO4LXMQwovf5fg/GyCthuFelHRONlrDhwohmunjfGw7WHF3
	XmOB3R23wSRLgkLAYQlYgQvwaMLXuepMQSMLVzxFA2C5tUiH15+gca+F7ZqQWJlSjHgNUY8CNKQ
	hB/HRBMgYIFIDUXAdYIwip8nzcfxjju45+J+zBF+qmRiuzjMZQVdboWmcDJXFDT3KyG06xSVg0I
	TwMREJhgdBBLOq7L+ZdXWwc2EbNwKHUvsB9vc8vWJ50dI7NUfMOAuZTSVd2+saVSCkUzuwnWfG9
	w8JELy+01dZh9KxLL1sorLaPy62gl3x0ugYBDjutDYgsbfNOlIFvgC1FYkwLCRNsxjls9XqZSI/
	1uavzQNcweH/W3nr4qvmWfH8YpMKNxb6vSPxmyUFDg==
X-Received: by 2002:a05:620a:4397:b0:93c:8e3f:3036 with SMTP id af79cd13be357-949ba827abemr169904285a.4.1795125320405;
        Thu, 19 Nov 2026 13:55:20 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb418241sm54011185a.38.2026.11.19.13.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:55:19 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] hwmon: sy7636a: read the temperature only while the rails are on
Date: Thu, 19 Nov 2026 21:54:05 +0000
Message-ID: <20261119215405.20596-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The driver enables VCOM at probe, which keeps the panel's high voltage
rails on for good. Read the temperature only while the rails are on, when
the chip samples it, and return -ENODATA otherwise. Read power good with
it in one transfer, so the value can not be from before the first sample
or after the rails went off.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
v5: rebased on regulator for-7.5, which now has fc8519fab34e ("hwmon:
(sy7636a) fix negative temperatures"). No code change. Added Guenter's
ack. v4 2/2 (imx defconfig) is unchanged and stays for the i.MX tree.

 drivers/hwmon/sy7636a-hwmon.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index a6b47452e29e..a8bfbf1716a1 100644
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ b/drivers/hwmon/sy7636a-hwmon.c
@@ -9,26 +9,43 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
-#include <linux/regulator/machine.h>
 
-#define SY7636A_REG_TERMISTOR_READOUT	0x08
+#define SY7636A_REG_FAULT_FLAG		0x07
+#define SY7636A_FAULT_FLAG_PG		BIT(0)
 
 static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *temp)
 {
 	struct regmap *regmap = dev_get_drvdata(dev);
-	int ret, reg_val;
-
-	ret = regmap_read(regmap,
-			  SY7636A_REG_TERMISTOR_READOUT, &reg_val);
+	u8 buf[2];
+	int ret;
+
+	/*
+	 * The thermistor is sampled while ON_OFF is set, but the first sample
+	 * is only ready after the ADC sampling and conversion time (ADC_SPL +
+	 * ADC_DEL in the datasheet); until then it holds its reset value, 0.
+	 * PG is only set once all rails are up, after the first sample, so
+	 * read it in the same transfer and report the temperature only while
+	 * it is set.
+	 *
+	 * With ON_OFF set but PG low (rails still ramping up, or a fault), no
+	 * temperature is reported even if one may be available. That is
+	 * accepted: the display driver reads the temperature only while it
+	 * holds the rails on, after power good.
+	 */
+	ret = regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, sizeof(buf));
 	if (ret)
 		return ret;
 
-	*temp = (s8)reg_val * 1000;
+	if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
+		return -ENODATA;
+
+	*temp = (s8)buf[1] * 1000;
 
 	return 0;
 }
@@ -72,10 +89,6 @@ static int sy7636a_sensor_probe(struct auxiliary_device *adev,
 	if (!regmap)
 		return -ENODEV;
 
-	err = devm_regulator_get_enable(&adev->dev, "vcom");
-	if (err)
-		return err;
-
 	hwmon_dev = devm_hwmon_device_register_with_info(&adev->dev,
 							 "sy7636a_temperature", regmap,
 							 &sy7636a_chip_info, NULL);

base-commit: d979b780718905dcbb55c10a5ecb26cc1ff1762f
-- 
2.52.1

