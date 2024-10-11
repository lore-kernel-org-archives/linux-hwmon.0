Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462101D0E19
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 19:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676616; cv=none; b=p4Mco9lzizWT7kWP+Qv5jqdzESLO3t1FGZZBqLLH2a3azDun2/e0PesJ70MAhlAX+YKQ4vj3Tb70eADzdbd38roxIIV0jEAuyIru48p+PTwpA8acMHxtUNyny6L7Y+H2+eOvcKoqhbXjk3TPQStW94k8Qohisr9reAuLMFcBmCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676616; c=relaxed/simple;
	bh=g2Z5nllsgmxj1y7+SREPGoK4qScU6WDZHVW+crgNhIM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KyNvEGoCpeOfJZBAOT9zocgARR7siWkd040Ev6q87bDACZXv4EKd7lQF3Jf4zID9yREzcFZlkR2ML9CARfoIs1C8j4CA+npjZaf+keFKpPuItVir9Jk7yY3fW+JKHb+g7FHaWL57FxGEcJDu33c9bLjQCxp5KJsU05WCMye59ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZ9UzwWE; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZ9UzwWE"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c94dd7e1c0so1194441a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 12:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728676614; x=1729281414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cZDsgvaMSMCDosVhYQ+jHb1gmxWEhWiVbisFT4Tb9Og=;
        b=fZ9UzwWEuZgJt6Ep3TdvZvMBz0gH8rWhOmQsoSCvxNwTe5mEY24ibtUEYXa4p9mpHH
         krPXO+SMLToPi0sL6UM7elItWWcnMffVu53F4S6+9nq4RhZ7F4ZUq2gLef/4Eb3NWoOn
         xvbtDxDgO+nyR/ZOW3HdsnKpJd7u37zPf7N1AexopmBvuBsiudOMfaJCN+JmEhZXX7Ih
         m7IJSUl/acVNgd5zR1ydCoH4TcKUzyHB/5q+1dS6ZYFQciB/sigYG2yJLJpi1BJ13r2F
         irwEFga1yxQBt1wtK2NIpe1q2BNpxewhInhmVeNFmqgcuVSIAHA+4sWdj2UPkHoJRMRK
         ZoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676614; x=1729281414;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZDsgvaMSMCDosVhYQ+jHb1gmxWEhWiVbisFT4Tb9Og=;
        b=ElgXD0NRehlNMP92j2xsxu32kboaonUpccZ2gwDlX+DRGBW1ClAA5zeCzqJIJezcI0
         QmXi+wYvwRxo3iFkgH17BhQ2DePy7Z0e2+Ejdcwa9aRsf8+FEMCvVZchl3nTO+kIDstt
         24P9vvRLWfujbRGRJsF4nyylkFJqwC5KHkZ3YnT2GWOhF6YuYZAlu5GzHLmF+9EWmpnR
         dEmFMnwx3cs1ZT0LbGfmY5zorMc5ODSRdaJT5HcVvQ8OVFAPhmbL1NuZOt99ghoNahKK
         FT+6Sp4JFeqp0yBPPYyxZDGbFddhJ1EXejlvaPIGpXlN0ANSzpv5yVfb6tueI9udUJK2
         TX5Q==
X-Gm-Message-State: AOJu0Yy9I2InAeEqnYJwwrEd1AMK8F2Ulll7Fr2dBPiDodhe3tivoGgL
	m9uiiuAFhMnAQd7bGPy5qQw1rtZqDtdVaDdrYZ+rHFBBSTrLth8O
X-Google-Smtp-Source: AGHT+IGVhZQubooyolf8IvFX44iyhcOLGv6x25Y50SUQfKbw9o7CbrDPWMQINQ0L56O/GDeI43Khug==
X-Received: by 2002:a17:907:f18b:b0:a99:4e2e:6f58 with SMTP id a640c23a62f3a-a99e3cf8692mr66219066b.35.1728676613611;
        Fri, 11 Oct 2024 12:56:53 -0700 (PDT)
Received: from ?IPV6:2a02:3100:afd7:9a00:94ac:542a:1cd2:c9ce? (dynamic-2a02-3100-afd7-9a00-94ac-542a-1cd2-c9ce.310.pool.telefonica.de. [2a02:3100:afd7:9a00:94ac:542a:1cd2:c9ce])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c93726094csm2216285a12.64.2024.10.11.12.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 12:56:52 -0700 (PDT)
Message-ID: <d5d2570c-dfd9-4be5-ad9f-e721be477131@gmail.com>
Date: Fri, 11 Oct 2024 21:56:52 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/8] hwmon: surface_fan: Simplify specifying static visibility
 attribute
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Maximilian Luz <luzmaximilian@gmail.com>, Ivor Wanders <ivor@iwanders.net>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <6f43a3e1-3622-4595-a1ec-2b3ad94bdf5b@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <6f43a3e1-3622-4595-a1ec-2b3ad94bdf5b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use new member visible of struct hwmon_ops to simplify specifying
the static attribute visibility.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/hwmon/surface_fan.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/hwmon/surface_fan.c b/drivers/hwmon/surface_fan.c
index de3c5a240..aafb4ac92 100644
--- a/drivers/hwmon/surface_fan.c
+++ b/drivers/hwmon/surface_fan.c
@@ -18,14 +18,6 @@ SSAM_DEFINE_SYNC_REQUEST_CL_R(__ssam_fan_rpm_get, __le16, {
 	.command_id      = 0x01,
 });
 
-// hwmon
-static umode_t surface_fan_hwmon_is_visible(const void *drvdata,
-					    enum hwmon_sensor_types type, u32 attr,
-					    int channel)
-{
-	return 0444;
-}
-
 static int surface_fan_hwmon_read(struct device *dev,
 				  enum hwmon_sensor_types type, u32 attr,
 				  int channel, long *val)
@@ -49,7 +41,7 @@ static const struct hwmon_channel_info *const surface_fan_info[] = {
 };
 
 static const struct hwmon_ops surface_fan_hwmon_ops = {
-	.is_visible = surface_fan_hwmon_is_visible,
+	.visible = 0444,
 	.read = surface_fan_hwmon_read,
 };
 
-- 
2.47.0


