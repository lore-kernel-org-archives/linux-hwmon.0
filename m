Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6E3B2AA
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198195; cv=none; b=rgkeqTReuJBwrlU3h06uWW1L30fhcU2LgFvo5hw0gMhxeIZbnfrAyaW77yFD+547N1Z+KqvbIWyLBIicB7S6U3nHpkGWYEexG4f2qgh+UasjvqG0fD8lwYxxG8f2PhS/oFHgQb1z2jee/Iy9e2HsFmkFfZHyIYHJ4S6koi6ujAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198195; c=relaxed/simple;
	bh=MnSlsVjZ0ZH7NBeuUlYOB8uSfiwXv5GX7Y4crwc31rU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ALQzFhh+sKC5idPHIlpK34WO/CzGEKRbwOrj0Al1lJcRTqFfLVRd47G9p/7x2FNSLezrW0T4eWpx5aKSJy/6mPCupSoFRIMZ0myOMlfje7xu05jkH2b3RMEgMj4o5y7p+CiMwFAwmFq2GdBSSZ0osffyvyfSAgnQre3rgrxuGr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZ7R2WyV; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZ7R2WyV"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-80cebd41372so37993007b3.3
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785198192; x=1785802992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUNnh8it/2jud+mHlDPXd2WDvqi0lMyWbPvQi3B6024=;
        b=EZ7R2WyVfv5RToLk9VfLeRKCsOSnedB6dy50mUaJJVmHahhiPTB1UfiB0TmlNBAew+
         Oxsipj01OnCqeYd+Z0IDDkfCB9fK7gTgLQRltrwOdTE2XehDY0fQtncPZuhehI2GyYaV
         NvnrmFH8xCb6CsQsGOni9dXWFwrkLy+tb10eFKGG1TZs8PaRk1IdSvVKKrIRZJ5N2Ebn
         II+usEM9a3ywi1PTVFpOhVio7uel3Wbgsmm14l9ZzqvgPB4ZEI78QtEBPKen0Wxn93RE
         M+XH1p+yqps3h+pbYFaMWGl14I2zyzOHNxP0I2ycgbVI0IyqqyFoEJ7AMP+gqFN4Cwib
         Cuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785198192; x=1785802992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUNnh8it/2jud+mHlDPXd2WDvqi0lMyWbPvQi3B6024=;
        b=HMY2rJpNfBEoypJuJnN3dJJlFeKRsiDpUQ+cuvYKV1lGkHh5lUq8ThhZYkMHhiIknC
         mpfb3dWFJSxom3ygCwGoscKSS/q4+GRoDA3RnCBDoogpCBQE/nwX1ATN3gNrBNe5dXHY
         Jl1Xj7MqQRRp0D9dFjA/pMJPEPukTQBg/FPixvESTONMz9fOxZjOlFNLU9w8RLEyGgyM
         O/1lxDhHI9kSkbVJRia4V+CQ1TGpYjPEzoOHIFc5DYDa8CoK8FZTRujb/SvSctnUoqZJ
         CLNncIn4dwqs/4sNIHFodnD6vhib85iWwkUbUXpj0/dI+c9g46/mbUt93c4h0/mQ6t7I
         2aOA==
X-Gm-Message-State: AOJu0YwaFCtZo1KaYMdXzagtzx+iGtex7nGsDNHIlGF4dbYK9HDxd3PK
	dvZbKtBd00c0w5gTsB23zYx0jQ4C2rao3uB2cBAqEOO8yzjUOJ6YoRJQtcJ6AlXA
X-Gm-Gg: AR+sD13CIPlWEbFcLgDGfmmv0o2KoHLgC5laVzv3GUMy11pmlNu0p3MpCBh8PWrbKZ2
	P711rZFWmndSA0CMo3wHUz7fbwJJvSjM12VjZJabw0sNSX6w3R/0yPBPsl+TGk4Od3qPTsOO49u
	A3JQqMWByM40mFYjRupCQ8hPOF8mCF3HRCPZTHLux1+q/gNg3CmgyNDIeom1NyZyeH9MoaHdVB0
	UXA00GQu7iUvaiNPQ9R5AKn25QU7u+adBe4yNFYB0KvK+GZHpXj3lTM+FS7GRsXUhaN5DUJYgJz
	+vmRiKv9P24EqLGQV4X+3B+ktwyW2OsegLPShy1Za0SRRHdBzHsysdMyoAQr20y7hohvw9w3rns
	pCsX5Mky3n3+uxAT9lhO0TmtO+/2oqcOoD6ZZbduFZ/Siw39IwFiTxecxvxUf6A6wZeQktTUaP7
	0ZwSxqOXxacUC/2+uW44JXLcWG7/qDgAlpPzTpK8GNdWa02s7hKm2L35HmENVPNMstXsTO7Vfyd
	SdNoz7O8ZwoNqM=
X-Received: by 2002:a05:690c:6d0d:b0:80c:85c6:898a with SMTP id 00721157ae682-81f99260db2mr551077b3.57.1785198192646;
        Mon, 27 Jul 2026 17:23:12 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f655acc7csm39583707b3.0.2026.07.27.17.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:23:08 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 21:22:23 -0300
Subject: [hwmon PATCH v2 7/8] hwmon: (adt7470) Fix divide-by-zero TOCTOU
 crash in fan speed read
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adt7470_fixes-v2-7-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
In-Reply-To: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, sashiko-bot@kernel.org
X-Mailer: b4 0.15.2

If the fan data becomes 0 between the FAN_DATA_VALID() check and the
FAN_PERIOD_TO_RPM() conversion, it will result in a divide-by-zero crash
due to a race with a concurrent update of the cached fan value.

Fix a TOCTOU issue by reading fan data once.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/r/20260727034929.E29B71F000E9@smtp.kernel.org/
Fixes: fc958a61ff6d ("hwmon: (adt7470) Convert to devm_hwmon_device_register_with_info API")
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 1fbca4869b7b..772d2a409bb5 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -660,36 +660,33 @@ static ssize_t alarm_mask_store(struct device *dev,
 static int adt7470_fan_read(struct device *dev, u32 attr, int channel, long *val)
 {
 	struct adt7470_data *data = adt7470_update_device(dev);
+	u16 fan_data;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
 	switch (attr) {
 	case hwmon_fan_input:
-		if (FAN_DATA_VALID(data->fan[channel]))
-			*val = FAN_PERIOD_TO_RPM(data->fan[channel]);
-		else
-			*val = 0;
+		fan_data = READ_ONCE(data->fan[channel]);
 		break;
 	case hwmon_fan_min:
-		if (FAN_DATA_VALID(data->fan_min[channel]))
-			*val = FAN_PERIOD_TO_RPM(data->fan_min[channel]);
-		else
-			*val = 0;
+		fan_data = READ_ONCE(data->fan_min[channel]);
 		break;
 	case hwmon_fan_max:
-		if (FAN_DATA_VALID(data->fan_max[channel]))
-			*val = FAN_PERIOD_TO_RPM(data->fan_max[channel]);
-		else
-			*val = 0;
+		fan_data = READ_ONCE(data->fan_max[channel]);
 		break;
 	case hwmon_fan_alarm:
 		*val = !!(data->alarm & FAN_ALARM_BIT(channel));
-		break;
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
 
+	if (FAN_DATA_VALID(fan_data))
+		*val = FAN_PERIOD_TO_RPM(fan_data);
+	else
+		*val = 0;
+
 	return 0;
 }
 

-- 
2.55.0

