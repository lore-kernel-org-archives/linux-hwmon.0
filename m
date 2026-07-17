Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49943955E3
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Jul 2026 21:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784322003; cv=none; b=l0/5Dgf39A8gUHpPp958LSz3MqrVF63xNoeLg3F8F9EdW/WIwy5XLclPHmSgT+tXDDesW+7IxEaC0uDuo8tdMOK51gZbDMrzbtqhl9X+ed6KwOL/n3Frlx413cAuQH0B6LnV93umM819FqMnLCOCsSrmumFVl61uXNG2+BW1Dk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784322003; c=relaxed/simple;
	bh=8Fve2063ng9ha5wZtD1FR+vdZcWSIu8cW4ZgNpjdBwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jmkpsKP3rkUDxAeWQ+uWgBV2LsZ7aOkj4l5sV37EN4oJr8iRtavh3ZBBF+UZv6Ddm8krTjGI4mV/+n7DriHbtLUOfymiZzezB023FFvDKWpTKapuQac5vEmEHS+zswApWR2aQt6+GdnDzBjN/pqwfJz5U0mMwhR7NEiAef0pip0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOzuxz/S; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOzuxz/S"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7ff05e5d009so106857897b3.1
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Jul 2026 14:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784322001; x=1784926801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FetDMiCgPkyxkRzwngK3OSAJNfZgDIIZiTYVMWGBG8I=;
        b=SOzuxz/SPFR6TLAAXwUIM6M971JUOobWorPE/Bxo2kwum8Ro0dBuy945l/pZy55KVe
         1iJ84shaDHpsIMeyqAm8sdV0lhrYDCE0JEuLbBnzfwv4HUFX30CV3YTUXCfzH6kLnv2E
         1Kwts0XjYrPjUsSZdCXM/gSxN9wMBLMFoIP0S4LDKfGHb07QzbuTIHDTJrekC74kOpH4
         r58sdMJI4PzEEEKEhvRZny7lkmI6FHwLNneZU6pev6K+6dbsO6iS+OkyJ04uxH7j52xQ
         i7iGwgFMS3MswGjvaMnzeayG5VjOvZ7Y0JnhE6cEzk/fq6UfmPz4XqlmQDeqzL3O0IJ+
         jfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784322001; x=1784926801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FetDMiCgPkyxkRzwngK3OSAJNfZgDIIZiTYVMWGBG8I=;
        b=nhSaeEBJi6RZGw8GFmDJN0sjXMFRTlZieNtjrQyw1JcZIsyU5p1wF93Z/kcRZ01SSX
         iN8QB/oBlEgxYrookHo7fVTs8EvwBDBXy1nrpG3MEYg1Ys6kLiZPVgX+kxpk5XL06Te6
         oH8NFa8XXVhcaCpCi6nm1QdUvhmdJlvFqSrSPh1KXLhQGaVkFW2wV4HJceS/GpLohwX1
         PIfOrT6gwcXI5Gs/hfvpThoOoHt2xllWTo8T1m1nVQmXO8jGXnFA39MIhViqgSKBh1Rf
         9dqk9jwtEuzDFtjJKMFc3XCvj38hjj+cmvUemriZF7W5fOjYztXAc3zCIsroB7ul6gwv
         K1ew==
X-Gm-Message-State: AOJu0YxNOYTMkSytpxOxRuSUqUU6Grsx8sRJVVCEMPg6GEnvQ3+//O7M
	OAXcBCUA2U4dM8GTBJmhJaBAOTUtC1NHexGH3sqqSTaK2JzTl/V3Hl+X
X-Gm-Gg: AfdE7clKQ0rHviJvM3i02RcbdjMpfp8lene1UanDmm2P+07d5E2DWyuJEvqdPaaQH/T
	3hrTtxDmngOclrOcCWVLBV/EDA4Ba4Z9nLwXDwlzhs7ZOvgd4s6H4+6jEoQ4SDKXpLHjVpp4Mio
	RNwlG3FaGfSpjdxdtMixwi6AYVzqkbZBNGjgh+UzSAjxFroiOOS6Ef6TWoAK4VBdBWO0Jarmu2N
	7A+MTJM0NuQcBvLKb0Q93cq6eB05Fgl1Yqak0hZ9d1/qf1MoYHrwyf3EFGJdXJ5H0xxsc1eAHuk
	mgnc0GhxqWxVuIwjTCUAUWWkN/I52as/0YX5hCLyMEVQ0ASk+tN35EQL36h2M3arucs5YP0Xvw+
	p3L7dEaD09ozHYYSep0EWmU9ScJAC9S722SgLZ8sW3Isi6nYbsnK+UsofKtzh9Ixi0GevPZ8Vkl
	dxq/5L4aoijAJ5CslM
X-Received: by 2002:a05:690c:650f:b0:81d:42e6:6a82 with SMTP id 00721157ae682-81ef273585emr18799947b3.25.1784322000847;
        Fri, 17 Jul 2026 14:00:00 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.94.103.218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef3e6656dsm20013647b3.0.2026.07.17.13.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 14:00:00 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 17 Jul 2026 17:59:19 -0300
Subject: [PATCH v2 6/6] hwmon: (adt7470) Add thermal zone sensor support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-adt7470_thermalzone-v2-6-a55147958fad@gmail.com>
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
In-Reply-To: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org
X-Mailer: b4 0.15.2

Expose the ADT7470 external temperature sensors to the thermal
framework using HWMON_C_REGISTER_TZ.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index aaae14a421cd..595a8f934d60 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -1251,6 +1251,8 @@ static const struct hwmon_ops adt7470_hwmon_ops = {
 };
 
 static const struct hwmon_channel_info * const adt7470_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,

-- 
2.55.0

