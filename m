Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A892A1AA
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 23:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721170863; cv=none; b=ZHBzcqrmfEPX9/Aq3CVWyzGLEFwkhH+pmqzMxJy8Qv2oBiXtuVeKnpPPTYG7GReEdQSDEmE+PgeGRpDHWKplUuPO7JU4FQIsPIVRvTrzVXQTIgnhKbeWzPSPWwz5Vjmg667WCzk1WvrnyacY2ujqrC4+QyR6Ysw+RPjd6DgW98A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721170863; c=relaxed/simple;
	bh=QuAF5jDUQY4fce8gJR0uUbraF3Vsup0Z3qPwpCk0sK4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eLrxQkyJLXkHelE8UkEX/65zPEVL8wv8lr1O61L8vyNkvqZEfPm8o0Y0U2En8u21L52F0PO2Lw9GJ3pYA9iPB+Xo9q5t/UwfmpgYhICuBgp15BUYKrvdTuZwooIaoeefSdiSZwX7DEU1gCd3aGcIOwV9i/nY4enEKrJKNK3hsTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GH0rx/xQ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH0rx/xQ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70b42250526so4612840b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 16:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721170860; x=1721775660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoKt1Ppg09NG9pVN3LcM+m26clGMcm38wUCw/PB5OL4=;
        b=GH0rx/xQEqxQZcQCt/EAC1MqEPFizuBbwsBgG5YMr+lXdQdfWClrNOK1wdtpOKqwSe
         p0Fq8FpUhEhUpoizXvd1iOyw27UoSsUg+onkHkJpfuTwIZLMXa68gePiFFPVlFsYQVVS
         z9nKFFPY9b/xoZGgOs1MZwq1gEzhzPxnpsWO+nclXoSFyM135oqvw4sgc+KtOb0e5xs4
         NUEXFbFhQFWp8IE8dTWJZf/w017tmXsHrIdhxMb3ErlZgkjC0MIGwq3nLfpoug7bwiEs
         CbQPnkdDEm2PI2k4ILrpM2c6cmdDt2wGszn3W/fgAn/bvkR8xJbpgyg/IzggmYH3stMh
         bWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721170860; x=1721775660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uoKt1Ppg09NG9pVN3LcM+m26clGMcm38wUCw/PB5OL4=;
        b=kwxYj7dfd9h33tFxanKg/hQBuIIsVZMRUAwiazoL4pXhu6kG1A8QeleQJd6Z3v2gHs
         x2BWSJfDXj2AOsk9v0fSc1V1kJqyOWZ4mW3PC22d1XVfSg/gbWFO6ecbaluT84B1lBJt
         MNSuvcq3vVrHPAEYFGOwe5ngkiygLt5JDKZ6jyWfiWCMgxvr0dcldKSIXxzjDcuQ9BlL
         c6MFjYQdIiEFNaKS5rP2omOiWuWCZ+gTEPFWtgHl8Tl+/MQ1+GuGu8e2BKlnU8QI2M0M
         u/mmYHLgHyiYruOql+ja2tzYArTR8fWk2YQdvMFgBEXYEPNJ59l6k54qeVJFeI8knRUM
         2HKw==
X-Gm-Message-State: AOJu0YzTTwCrf9Bh2xmUKmQ2hNeNvzFoGUPNQ/ZhGMfLS+4DSyNUqmGe
	tlzwl/B7iMDqAxQX1JYMBa1N2Qfjs4YUenRJtDHnuKgkFCr01/peVUbIXw==
X-Google-Smtp-Source: AGHT+IH+HuFL229bsEMyujD0NyFAdGGnwIinHWtMA0GwnsY5YieZRGEGqoSanwND8155w3wSH7rERw==
X-Received: by 2002:a05:6a00:2304:b0:706:251d:d98 with SMTP id d2e1a72fcca58-70c1fb673fbmr4150721b3a.4.1721170860281;
        Tue, 16 Jul 2024 16:01:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eb9dec9sm6855032b3a.20.2024.07.16.16.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 16:00:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/6] hwmon: (adt7x10) Use multi-byte regmap operations
Date: Tue, 16 Jul 2024 16:00:47 -0700
Message-Id: <20240716230050.2049534-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716230050.2049534-1-linux@roeck-us.net>
References: <20240716230050.2049534-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use multi-byte regmap operations where possible to reduce code size
and the need for mutex protection.

No functional changes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7x10.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
index 6701920de17f..2d329391ed3f 100644
--- a/drivers/hwmon/adt7x10.c
+++ b/drivers/hwmon/adt7x10.c
@@ -170,21 +170,15 @@ static int adt7x10_temp_write(struct adt7x10_data *data, int index, long temp)
 
 static int adt7x10_hyst_read(struct adt7x10_data *data, int index, long *val)
 {
-	int hyst, temp, ret;
+	unsigned int regs[2] = {ADT7X10_T_HYST, ADT7X10_REG_TEMP[index]};
+	int hyst, ret;
+	u16 regdata[2];
 
-	mutex_lock(&data->update_lock);
-	ret = regmap_read(data->regmap, ADT7X10_T_HYST, &hyst);
-	if (ret) {
-		mutex_unlock(&data->update_lock);
-		return ret;
-	}
-
-	ret = regmap_read(data->regmap, ADT7X10_REG_TEMP[index], &temp);
-	mutex_unlock(&data->update_lock);
+	ret = regmap_multi_reg_read(data->regmap, regs, regdata, 2);
 	if (ret)
 		return ret;
 
-	hyst = (hyst & ADT7X10_T_HYST_MASK) * 1000;
+	hyst = (regdata[0] & ADT7X10_T_HYST_MASK) * 1000;
 
 	/*
 	 * hysteresis is stored as a 4 bit offset in the device, convert it
@@ -194,7 +188,7 @@ static int adt7x10_hyst_read(struct adt7x10_data *data, int index, long *val)
 	if (index == adt7x10_t_alarm_low)
 		hyst = -hyst;
 
-	*val = ADT7X10_REG_TO_TEMP(data, temp) - hyst;
+	*val = ADT7X10_REG_TO_TEMP(data, regdata[1]) - hyst;
 	return 0;
 }
 
-- 
2.39.2

