Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130596;
	b=iyLExkNhlE47pcPXrExZt7955lMDiSIQJJ+el0D4tlmWRl8ifjsa3df9Q8qs45cneF6E
	 epBojuAjJC5oECIayUL3nrSNWkFIsBkpmQeBmJ6bhXifXKVTkYZCPrBDxYxfxqiWHTaU6
	 +Gnm02NjvIEZ2SS61KlVqHHsTA9SvwSkgtkNDyvaKUv78hTDWo6xIVP4kIME1m6xhJrvA
	 AXiuxX+q0XCFeDMqJTdV9Yy6ad214a310rZFtI6HphDHucHCwDs7MDgpEzsj+UTtyRWQK
	 nPYY1ozNSHofkFHQ13cQBU9CUsphI7Kq+4dCZddnIttKPlhadFWq7fbzjZXKnIYKlyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fmCdZN7F+gZnp32CbSHIv9tAwBwiH8xmcnjC1W/VNEk=;
	b=qrAHjjLf+DlKq0lwmE4Cg0uUQDbOtvHTaXpBQU1gDlFvYTy5gGDb6tqN5Y8IVilZxffx
	 hdwgnJN040XKmSBlsxBjhNbQ8mbFETfUdRfJRlUOirXrJbIN24paQnhjnv5MHn8JGnLoY
	 BD1hz5s335+QZcMT2hsRcdjuPxQkVpbxnHK9JwCrLgaf1KkroFgyqL1HNO60HDqXz8Q/U
	 qcvMoDvOUZJc2HN5QEgVh/uTzkE+76aYcoMQe92Qp0Y3CWP/WgWsvsMUZWP6r4cPMq96H
	 dLezwhLr8Npzi+gFJhMXVi0HLHajNNrWhLogA1L+wzw/G4X81yHJOrJonO+A8V385Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a2UPCxol;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A6D606A323
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 09:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42A6D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a2UPCxol
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490585eddfcso227702f8f.0
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Nov 2026 01:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130595; x=1794735395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmCdZN7F+gZnp32CbSHIv9tAwBwiH8xmcnjC1W/VNEk=;
        b=a2UPCxolXGQxRgQTZhIgNegf7wZNJJV5uLDURypcCBlgm3F9axunyEv1Pnk2FIs4F4
         dZT0HZuah4+k5WBy+R5kwJzvwjuPeI/aTdTJ1hY4RH26bCthgV0YX+NdaBYkRd+GqjqA
         W+s4PFV5yrH3AysyOFrNuPuGaVaeCGQfTxi46a+b4zw75225W9BbmF4xUyMQHshnOt/I
         XqNqYLpi+lYYXQa9TMxoqhRPBzhXLcK04sehoMx7WNjlIOM28GEeZ0uYnM2mgQCK36pb
         QP6m+P0ETqEh35dtYAQI1GlcP6O3qfiKhtKo4mPRVBRdnFgrhCFtLzaommFWzPe3lJnx
         xUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130595; x=1794735395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmCdZN7F+gZnp32CbSHIv9tAwBwiH8xmcnjC1W/VNEk=;
        b=tzIYwhE+wb7Yq8Ex5HD6Ra7UdOx1IV+g8LlGa0S6Fwb2fk1EkKoC86EL1t+XU4f+dy
         CMpbaWwPmNCytljRL/p9S9XbOLFhVDBd3aQYU5X4qLW+H2yFqPLahOUBSuYpTF85hsyJ
         cj3681NDuAme4v+bxCinljGeoy0vhBAyMOm5of48hWjQ1U+yaNnZvpViWDtUQrK3JwE2
         jXyFJOu/1+6ss4qRq1u3AKF32tJVELMP+uYJDxmOJ5n1/TRDJI4vC/WtZaCzJR5s/ern
         lsB+5ZYzdsN+XtIHQsu25a+uzVvidbBl9taacGeznLhs62fwvo7/KrPFEYg6jP87X2Tr
         W8Kg==
X-Forwarded-Encrypted: i=1; AL+hErHgbpcTLN3Q4lfKUPdwln6yne8Jls6Epo970qe5Cb9AbJ6moHOu2yf6oThzwdFaCx4ASt17IxFUv8Z8Uw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1UdXckAGWtPsizQkLdmT59o4axApqAugP1l3FkvxbrGcKNdE1
	j1ansnJw7BNY+pb7TqjkSJRTUw6TU6ytjESnYfEmGkyGs4+Pb2LwrM3h
X-Gm-Gg: AYBFou0VzNZ/o1zG0RstFbhp+0IKWbby0Ax+GLrK9TEXySpyQJl+huNUje4OtZTjBC1
	y8gYjVbFP+3RXynxIaa7oq+gOt8r1ZitU/czZYMd4eduhjNDg6MF6BUYJQCFdfaY5J/saOe4jxB
	NAoymqjnzQLW7Qa+h0hYID37shu2YZQjtcjrE+IZ0b+7w2h6zJaRn3Q1AkmU6HiQicooESRAVZg
	5JaI05NTgg6pTM3cy+8bRBx9xu4OzgnGffYqYGkLhc5WITDn4v7qBIDT+RDvYD4XU5PCuAyLsNk
	PG8y3A4s0G0Cu8l64KU0C2YiGaxWe0sX609jkqIO18n+sv2LLEa/NmqqIDDjR/YCDFmFzFe5qzE
	CloHtbdxDs/jZLrNWaT4VBapNNutntajBXTAOPNlStc60nLePDku1cwBmGpnJSJCkVnrXh9seZg
	gW/ELOz2IAfWmt8uOntJXvjlDz4+aj6Y8TOwbLggO0REh+Cm4H6xbnpVkgcktulCyyykGvnNF2+
	oZCxzgdW1lpxpJ3tR3jYG3SSxmPRdI5hLaqdCmEwBowWhkEOTG3n45/wqlhRwNvmrz9PP4uMyMX
	Sc7cLHuL0WyL/3V3zdA5BgbAzVqZ4s2jwL3+xOfrs2nFrE/8eIZ3xAXo0+ecbhibd734Q9gl2s1
	gjuNLXu05
X-Received: by 2002:a05:600c:8b6d:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4b963c6d1dcmr19953865e9.8.1794130594642;
        Sun, 08 Nov 2026 01:36:34 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm141650355e9.7.2026.11.08.01.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:36:34 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] hwmon: sy7636a: read the temperature only while the rails are on
Date: Sun,  8 Nov 2026 09:36:01 +0000
Message-ID: <20261108093602.329554-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108093602.329554-1-pmazzini@gmail.com>
References: <20261108093602.329554-1-pmazzini@gmail.com>
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
or after the rails went off. Register it under the chip name, as the
TPS65185 and FP9931 drivers do.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/hwmon/sy7636a-hwmon.c | 37 +++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index a6b47452e29e..0c0601d47b87 100644
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
@@ -72,12 +89,8 @@ static int sy7636a_sensor_probe(struct auxiliary_device *adev,
 	if (!regmap)
 		return -ENODEV;
 
-	err = devm_regulator_get_enable(&adev->dev, "vcom");
-	if (err)
-		return err;
-
 	hwmon_dev = devm_hwmon_device_register_with_info(&adev->dev,
-							 "sy7636a_temperature", regmap,
+							 "sy7636a", regmap,
 							 &sy7636a_chip_info, NULL);
 
 	if (IS_ERR(hwmon_dev)) {
-- 
2.52.0

