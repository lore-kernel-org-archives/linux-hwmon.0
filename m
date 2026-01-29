Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076AE3542C9
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 17:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769709079; cv=none; b=bCQiWWI/X0wMnpwORkoetMvTK4RO6RiXBXyeEtHINN23vS24eFXQ39c2S477AKSouaPuRuYSs9yF30/Hsn0ah8DTbAYt9ca/8gLcET+ZHOSFqVyCM3b4Xc9gepatkFEKl4Kcn8GcHNZ9f1zjAaKP3nfVjtPK/8X4IQ3XAwBCE5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769709079; c=relaxed/simple;
	bh=1Dd5HNBNlMl+QvHgOSsoV1aSZSdJjpyyWNvnpWIgAn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yk9BTR22q9F3kSiCBGi+6t9Tg7MXI19UU1ym4+NlIr0lJF+bteS1osCiuhW4mV3/6U4PyDdGws06JD/UTdlkc4Qc3cw76dtPXCfTriaL260LH7ipdNuAxg7HYv1J3LAdbT5m7409ZK8ZMlFysOtm0uPGKnavcizrZ4c4QRxTeGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDDyc5Pj; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDDyc5Pj"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-124899ee9d3so871637c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769709077; x=1770313877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8TZqR5PEbqne86hzJARZ8FvvQIlK3JN89X37Ko34KY=;
        b=KDDyc5PjNsj5dc0jDywOekDyo/0qjQYZBqsZuOemApW3aFO/2mh4Em/C4GTSyvFgFL
         qtvY6hZKHe4NvRwzs9K5Vy4huwbggNQpi6lohxCCcWj4/GEvgN1S9ZMYKTmDZuhaTGis
         703lT8b5agrN9A35hHeUMt46KAgZw9D4Q5zNliDHTreDrSiho3ARwhcK8LocRZllqaNm
         Nka6kkY9PDkvGHymHt7AD6fiA4D84lyGWvlM4nf8M9EHLmgX2+QsJLauT/JebVvl8p1j
         VbDBl/dKw/iRkGq9a7pg8ngfJEWYO2WKIMMoMHBU6NksTPuRuvRyusdHqFNrSuoHg0C2
         gm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769709077; x=1770313877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p8TZqR5PEbqne86hzJARZ8FvvQIlK3JN89X37Ko34KY=;
        b=wCexrhtdeRPHV+QJ1sE5ihUPGimywrY91+ibgH0CeBtVnuXPCh1pLnCwo71OKWsB8I
         EhgHcks0K6CXLv8mSgnv6AhpGhvOGU3ry5bmQ8/urU+sQ1R4BUR7tnpM02mKRu13OrBq
         PkS5fVE0A1xvb/lkSzSJrnMx9R9/vLjns6CCoNYvf2xnWJFb7I/xfPWMvgFIbEeVW3rk
         Ft8IOBeaTMU/Llb0LB9D2PYRTe+Rp1kza6SDZcGyD+elQE2wk0sx3OH0H1ze8qC93HAy
         SweqI5NgrSbwvZZ5kHVtGJjdiokNA0b4iXgLFINwc6fvJyi09uvlFCwyeLCZnYPCLIaq
         1xMg==
X-Gm-Message-State: AOJu0YyqsGRjglcn3t5+7pE5MgX2OB6ndW0HHTsuxvKO0yjVhrUWvRx0
	fNF+H5oRn0U9QXsRIIxhkLtwAHFc2Ofq64RuBk38s0h3bokj+0G6SRJlxyjwEs5U
X-Gm-Gg: AZuq6aIz0KR/vaK9yfDsyWkrsIex0YvbrMNU/zOGa//YeyFTbAq6uiFzuw7yEElr/vK
	R0tt2F3SYG0m2tn0FYsKJdpgfBaeLH32J0iM7sWU67A37T4BW2jTGv+vuxifmvjprQenbRjUghz
	sTKm65q2kysXY+0V83sjwtYWUvAjETBknqgIfdkMsL09mkB+7VdVRPIPVRNY18PFlu9Tbz/MfZs
	A5Gs7b066srRAxHqkPvaVqwLdcXtAIXiekIzgQXvOmtHYTjmi8rBXYGZPaxKBh6Gwd9pupXaBuw
	ysPmmHC4jMi9OUck/D0UaP7KhRav0Q3vQlkuqOG3kIoNUBrMaVigWsk1/yE//FWuI+Ew84WZYuB
	H8sQnFHqTQjnaDuOLYNQpVJuz+yBH4VoGBeFhNINZDO0SBL+4OyxUtkjt9joN99WjePekNGfEEl
	8eoJEkoMsK5J88ckacZvRD9Iar
X-Received: by 2002:a05:7022:220d:b0:123:331f:978f with SMTP id a92af1059eb24-124b101ee64mr1810955c88.7.1769709076809;
        Thu, 29 Jan 2026 09:51:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16d01c4sm7816731eec.2.2026.01.29.09.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:51:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Nathan Chancellor <nathan@kernel.org>,
	James Calligeros <jcalligeros99@gmail.com>,
	Neal Gompa <neal@gompa.dev>,
	Janne Grunau <j@jannau.net>
Subject: [PATCH 1/2] hwmon: (macsmc) Fix regressions in Apple Silicon SMC hwmon driver
Date: Thu, 29 Jan 2026 09:51:10 -0800
Message-ID: <20260129175112.3751907-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260129175112.3751907-1-linux@roeck-us.net>
References: <20260129175112.3751907-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recently added macsmc-hwmon driver contained several critical
bugs in its sensor population logic and float conversion routines.

Specifically:
- The voltage sensor population loop used the wrong prefix ("volt-"
  instead of "voltage-") and incorrectly assigned sensors to the
  temperature sensor array (hwmon->temp.sensors) instead of the
  voltage sensor array (hwmon->volt.sensors). This would lead to
  out-of-bounds memory access or data corruption when both temperature
  and voltage sensors were present.
- The float conversion in macsmc_hwmon_write_f32() had flawed exponent
  logic for values >= 2^24 and lacked masking for the mantissa, which
  could lead to incorrect values being written to the SMC.

Fix these issues to ensure correct sensor registration and reliable
manual fan control.

Confirm that the reported overflow in FIELD_PREP is fixed by declaring
macsmc_hwmon_write_f32() as __always_inline for a compile test.

Fixes: 785205fd8139 ("hwmon: Add Apple Silicon SMC hwmon driver")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/linux-hwmon/20260119195817.GA1035354@ax162/
Cc: James Calligeros <jcalligeros99@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>
Cc: Janne Grunau <j@jannau.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/macsmc-hwmon.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/macsmc-hwmon.c b/drivers/hwmon/macsmc-hwmon.c
index 1c0bbec7e8eb..40d25c81b443 100644
--- a/drivers/hwmon/macsmc-hwmon.c
+++ b/drivers/hwmon/macsmc-hwmon.c
@@ -228,25 +228,22 @@ static int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
 {
 	u64 val;
 	u32 fval = 0;
-	int exp = 0, neg;
+	int exp, neg;
 
+	neg = value < 0;
 	val = abs(value);
-	neg = val != value;
 
 	if (val) {
-		int msb = __fls(val) - exp;
+		exp = __fls(val);
 
-		if (msb > 23) {
-			val >>= msb - FLT_MANT_BIAS;
-			exp -= msb - FLT_MANT_BIAS;
-		} else if (msb < 23) {
-			val <<= FLT_MANT_BIAS - msb;
-			exp += msb;
-		}
+		if (exp > 23)
+			val >>= exp - 23;
+		else
+			val <<= 23 - exp;
 
 		fval = FIELD_PREP(FLT_SIGN_MASK, neg) |
 		       FIELD_PREP(FLT_EXP_MASK, exp + FLT_EXP_BIAS) |
-		       FIELD_PREP(FLT_MANT_MASK, val);
+		       FIELD_PREP(FLT_MANT_MASK, val & FLT_MANT_MASK);
 	}
 
 	return apple_smc_write_u32(smc, key, fval);
@@ -663,8 +660,8 @@ static int macsmc_hwmon_populate_sensors(struct macsmc_hwmon *hwmon,
 		if (!hwmon->volt.sensors)
 			return -ENOMEM;
 
-		for_each_child_of_node_with_prefix(hwmon_node, key_node, "volt-") {
-			sensor = &hwmon->temp.sensors[hwmon->temp.count];
+		for_each_child_of_node_with_prefix(hwmon_node, key_node, "voltage-") {
+			sensor = &hwmon->volt.sensors[hwmon->volt.count];
 			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
 				sensor->attrs = HWMON_I_INPUT;
 
-- 
2.45.2

