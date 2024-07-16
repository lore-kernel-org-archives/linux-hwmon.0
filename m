Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD6C13CFA3
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 23:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721170869; cv=none; b=TbUMPVhxoa5bEeQUGr3WuzeEnahIlzuTIKHDrtmWOf0sA1nKjohyA4ZP+xQ6uMoN9/p7ebf5SXETqcHx+8lksTcU6FguFDTfkIfLUf0hhpLNAls0lEt7sdJI4aQvrhgtD2j39MQAmB6KSbPkuSgL2T1FTIeGpRhmtPES9Upw5rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721170869; c=relaxed/simple;
	bh=ZLjgHqYTQvU4XadmxDeUP6p9g9ffBRj7/tcMJGf1UYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jx4TMpjWzBAS1lBlVfXebwkLlWmEKPLqBreD78UAw/k0kDRFdw+W5dGydgngeR1l1pdc8tB9bEpHQzV2RjFTYJb/eZYfIUmFL/hqKU1OmrWt3XnNpOpNS9lXBYrCOD8e1x5rU+oaK9mNhKzUg7Zddhk5vCYn2UDmrV67Tr9eMLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eD1MGVzJ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eD1MGVzJ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fb3b7d0d3aso37914225ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 16:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721170867; x=1721775667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYUsX+qSPd3Gzit9fuaalTnUQU5YObCV4PTll9Ip+Dg=;
        b=eD1MGVzJghZuORnSTt90+StSP7ShiYgTT0xaC563pKhIi369zd0xrcpyhEV/kW0ezv
         HL7OcrbxO6yQNbkFdZIXAKzxiqXZYV7rECsIduLFqQvHtw/p76aBxKK33cfa/JfKq+j1
         lCyRwsOcO/jkFaBZmLs8cbINt4F3UFYMTmQkrxtPzcSECYyHIzk7Q2My6uxBBlfgs2dL
         xk7zQ3yo7lk5O6wkqwPH33dP8dYy87MxdcN01GmwKynatUQGdVlsVzhLXKszqyLzxsSW
         sO1tZ9SzIwtoVY7Wg76S08rF+9UgaKq4B1Xb0yUYcqL1l8ieaoDSdBa5Ec6aU2ELch2w
         fMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721170867; x=1721775667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZYUsX+qSPd3Gzit9fuaalTnUQU5YObCV4PTll9Ip+Dg=;
        b=cAuocSKx/sta8jXZFALtFpN1l9wPloCMg+Im8PViLGnHsf6oYVZfdq/gwqAFpxrzDf
         Ei2Cxp2Wq1p8scRbtncDzhGEtx9gpvQ4xxa+/KMnJth0A8SL0ESNvWd36gvkIqWNUC+u
         qcHjN8DDIzNKMaXkmPi38PCrcBpndQDml1j+HnETu4Opi4V5ikgtzO2SHPROZhBDh9Ic
         Oc0r9B9umfSx5e62e+NLnetxdG1ooX/Q2qiSKj9OD+9iWBcxP/9vbqjHPrlljsqmJpsV
         kHA81Yc8NKWhDN8nEGAR2mSCYn820YFl5uiW9qiwpKeU+nnA+z5tlMcpr25fSkEGN3SA
         U4lA==
X-Gm-Message-State: AOJu0Yy0LSnOUFode8OfgaSlPG4zqxV4Q14kEGgeqDGAJbqFnQ3VnbeC
	O42mIM3UoWq7Z/J84k8FNWvT+smei17UL+KJfL/MXxGvrTdl8xQtJbnIBA==
X-Google-Smtp-Source: AGHT+IHMhvSGEkyuuEfp4j1TAtEDgOM3jzyMpz2cDsBk4TshuMWkGJFMmmZPFkk4PhhY2qV7sTY2xA==
X-Received: by 2002:a17:902:e945:b0:1fb:396c:7532 with SMTP id d9443c01a7336-1fc3d9f4d2bmr31465645ad.56.1721170865510;
        Tue, 16 Jul 2024 16:01:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb70306sm63748405ad.31.2024.07.16.16.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 16:01:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/6] hwmon: (amc6821) Use multi-byte regmap operations
Date: Tue, 16 Jul 2024 16:00:50 -0700
Message-Id: <20240716230050.2049534-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716230050.2049534-1-linux@roeck-us.net>
References: <20240716230050.2049534-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use multi-byte regmap operations where possible to reduce code size.

No functional changes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/amc6821.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index ec94392fcb65..ac64b407ed0e 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -136,29 +136,25 @@ struct amc6821_data {
  */
 static int amc6821_get_auto_point_temps(struct regmap *regmap, int channel, u8 *temps)
 {
-	u32 pwm, regval;
+	u32 regs[] = {
+		AMC6821_REG_DCY_LOW_TEMP,
+		AMC6821_REG_PSV_TEMP,
+		channel ? AMC6821_REG_RTEMP_FAN_CTRL : AMC6821_REG_LTEMP_FAN_CTRL
+	};
+	u8 regvals[3];
+	int slope;
 	int err;
 
-	err = regmap_read(regmap, AMC6821_REG_DCY_LOW_TEMP, &pwm);
+	err = regmap_multi_reg_read(regmap, regs, regvals, 3);
 	if (err)
 		return err;
-
-	err = regmap_read(regmap, AMC6821_REG_PSV_TEMP, &regval);
-	if (err)
-		return err;
-	temps[0] = regval;
-
-	err = regmap_read(regmap,
-			  channel ? AMC6821_REG_RTEMP_FAN_CTRL : AMC6821_REG_LTEMP_FAN_CTRL,
-			  &regval);
-	if (err)
-		return err;
-	temps[1] = FIELD_GET(AMC6821_TEMP_LIMIT_MASK, regval) * 4;
+	temps[0] = regvals[1];
+	temps[1] = FIELD_GET(AMC6821_TEMP_LIMIT_MASK, regvals[2]) * 4;
 
 	/* slope is 32 >> <slope bits> in °C */
-	regval = 32 >> FIELD_GET(AMC6821_TEMP_SLOPE_MASK, regval);
-	if (regval)
-		temps[2] = temps[1] + DIV_ROUND_CLOSEST(255 - pwm, regval);
+	slope = 32 >> FIELD_GET(AMC6821_TEMP_SLOPE_MASK, regvals[2]);
+	if (slope)
+		temps[2] = temps[1] + DIV_ROUND_CLOSEST(255 - regvals[0], slope);
 	else
 		temps[2] = 255;
 
-- 
2.39.2

