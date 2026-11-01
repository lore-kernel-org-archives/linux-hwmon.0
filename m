Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572339;
	b=IJzv89dg/sqoHqgCmwbMa8zMw7EpGgqcggxDExP3yP7g2bxl3lSKrA1AjyYMCtF9+lIJ
	 UdXo0wDXsF1ViKsVL9etyb79pfriatBQB0c4z6cwcJV8CLBeQHwL7e3LO/B3Vrgo1iL/P
	 xivhxrUd2QTnIdRCrVDIzEH+IS/aloY0Nx0ji6OaH2iFIK0VQQ9d4TVvsMXdzPI8TT8R2
	 edcOF44xXI0x8OXleZrXfKgqf2dCZtcXMal9TST1m0MfoB4FR011rWf6uGylriBONNXjH
	 pm1MS2ErfNtqyzvSIDy+a1EB882nC++veqgcabgo1kIMZB8YUAqEOqHk2tdhZ8CeY9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TS5Dan/nb4cmKxpfEwON69wlnKqem2VsrIBuzvRoE1s=;
	b=iq1PlGgnq265av/oMU6pvSZ19eVuX6BHIsYnliiBHeD5Nab/I924mOGmd9Yp9Cs6MNBa
	 Jq2Kf7ZO/9c6qbFWJ3ZZcGhQpA2M7MyAw3vX7YbOuO+RzjG2C+zYnZfkU/GYaf434EbdD
	 GmU9PmQOUBpwPybAG5UUDVi1cn2y5OGUJIhy5pHfziPSeDNqLG808CmZiNv3bv9cJV4gP
	 QspSJ3iHirfM7M6uZxcGnL3xgM2hGUQc2ACe6qutmPRFyTnmlc+YpqnlH7+9NIU31uJkI
	 rfo4p3KWIvIHcJgQiUFj4e2AuoZ7BgtT45w/vJc9YcP4W+8PF4GD4yysDYwdPrVu24A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIIzce1T;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4232960A2604
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 22:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4232960A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIIzce1T
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso20761605e9.1
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 14:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572338; x=1794177138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TS5Dan/nb4cmKxpfEwON69wlnKqem2VsrIBuzvRoE1s=;
        b=sIIzce1TQw73QbNOA97j5ibiT2rdrv6yjPmb1JS7AQ6FNgJd5/0CYoIErLSeuGJLIE
         JNw1vB4ibgkWUt+EjcKBTHyoD37K8edwRwzfs3mVeIWmkVrDIiPZzodlBRmVDGzFNf8u
         LYmDcuJ13o3LG7t7y6EAAyXOHAdatp/HUFkQabrVBz4HScCk1DRGrqW5FLo7QnZebwOA
         oWH+RjX3Vx2cmznh/4rH95EcV6SqLs2MAO+OJF9jF7EThkJ6JKEn6mHFYINHfhJc+UXr
         Fv4PHUvO4SgpQr/WDVOpnzNp+z91xi8ovsTk3kRcyy+ksliCC9xIh00Eq5sQMN3Ycy2B
         26hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572338; x=1794177138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TS5Dan/nb4cmKxpfEwON69wlnKqem2VsrIBuzvRoE1s=;
        b=BGOe5feE9IuMsFGEHa0XIz5ApVLw10grgnyElZmnPY/fcxtJxoUatH1FH59pK3IQm9
         418bSngFbWdnYjy9RBt++o1Eb+bxJuQQ54w8HEnC+6QEI+EU18a+hvGNpZdFbIt41syK
         PMHAO4e0FwOCspxMgZvJkR0ZyqsxByzq8mbOW6kSUxCFhgTZuVBmub1jukB8VVoSfe4r
         x8xvCcejGMwh+w52AJQxUnCnwntzS+Iy7RnvT5Sq/9qFtGvFMq3xjPCs9uRsrSrw5JfT
         xJIenhYkYTEPwE1U+YxqsFFIFaVux1ue2s7CMYH2V5/FANExGA33HATgH9/e8HyPqvo1
         3qLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxz3Or51iT3QNYNMB3+R9ghQw399J+jdw2a2a0+JVGTdt5PCCU91oPKtEJyfqbhQ+oiVUziOHdhFDP9Kg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKvuLdzwF0mebZQBye+vODy0TLQU765FzE0TzwjB2u9NP6vXVXr
	eD5I0CSGlEIe27ltcMlqms8hWyKqV1aoYBWp3GaDJIRNI/QUBH0Y+YcJ
X-Gm-Gg: AYBFou2xNONKsSY/xptnXx8MXSaFzc1+Ps5AN6jF54/qvw3MQWlKcMBOjO9GOZVODM2
	r14gw0t/WsTPM58yNOyqPwuy5iEnaRCyG0gDBxzVNK6jGsfyWWgTBCbCzdfX1IIAteL/dmf0gku
	Bf6QnZ49JGy5XXzlyIei+e+zNQSBxv8k6S89kZ2T+8YQPyQM2TO8LM0/652sLDi4EklSt5luJJb
	B4VmAXPBT9NX/s1Ceo346wzKzjCni0oknuNSI22IF3qdISS1mGZPwn4rjPoUc0pw5+LffSHz137
	8bXQqElydDxaHPBTwitEZynG7dvRBfU/PPPltP08oSjt5jrVd9uqOpAqvGOrKpCL+TQl39tecDF
	EKIE+tKMclBfX6veq22WpT9G2QOLmER5Obo3PCnPGDIGCtmrKkCPJXjloq/qqA9YzlF3BFNc67s
	yvxtfUTebFcj07WmrQamXsS7H6tf4RFvdvdTN3HxlEoklMIo5dyh2oUtdAcLL4SWZsmSPh4UwFm
	fR0M2o94mbleXzqkXGFZIbXQ8XRClLhOaFnPl6b7kkqdQ5L27cVOXg/8y2iApfGBoO3j8gPairV
	gjqHRzPU2jKUZTQwJAjwmKqkEQpiQ4j+UvwQiQBihr/op0nYcqex6Egs7IoZvZFWrHvw0+elw9e
	PqSe+Gpit
X-Received: by 2002:a05:600c:4454:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4ac17d19777mr188166415e9.28.1793572337774;
        Sun, 01 Nov 2026 14:32:17 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:32:16 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] hwmon: sy7636a: read the temperature only while the rails are on
Date: Sun,  1 Nov 2026 22:31:23 +0000
Message-ID: <20261101223125.302001-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101223125.302001-1-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
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
rails on for good, and gets a dummy regulator if it probes before the
regulator exists. Read the temperature only while the rails are on, when
the chip samples it, and return -ENODATA otherwise. Read power good with
it in one transfer, so the value can not be from before the first sample
or after the rails went off. Register it under the chip name, as the
TPS65185 and FP9931 drivers do.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/hwmon/sy7636a-hwmon.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index f01f368d68e5..475aff997c2d 100644
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ b/drivers/hwmon/sy7636a-hwmon.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/regulator/machine.h>
 
 #include <linux/mfd/sy7636a.h>
 
@@ -22,14 +21,22 @@ static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
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
+	 * Read power good and the thermistor in one transfer: the thermistor is
+	 * only sampled while the rails are on, and power good comes after the
+	 * first sample
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
@@ -72,12 +79,8 @@ static int sy7636a_sensor_probe(struct platform_device *pdev)
 	if (!regmap)
 		return -EPROBE_DEFER;
 
-	err = devm_regulator_get_enable(&pdev->dev, "vcom");
-	if (err)
-		return err;
-
 	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
-							 "sy7636a_temperature", regmap,
+							 "sy7636a", regmap,
 							 &sy7636a_chip_info, NULL);
 
 	if (IS_ERR(hwmon_dev)) {
-- 
2.52.0

