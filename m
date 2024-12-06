Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ABF1DE8AB
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Dec 2024 09:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733477868; cv=none; b=WMfYMOLyN7MnxTIN9ux25LmQQw+1ZvUL2WhhqxX1+bmLy3JuqMHICM17hHDPe7j+3EMIWQOYNKDZcmUQw++P6w9+zd2vbKB4bgB+lPKbJancfUPIfF8/jS0h/YBfHmM/rNPsko/kIIXJ3x+PeFuTFFrqB2IPxcTvZa7tE7BWXpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733477868; c=relaxed/simple;
	bh=XisWVnbBRFPxwrQpVjeDFOvmw6S/8wKdHd0D8NuHYdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aR6fNa8YXPzgN9CiZO8j+/GciR8B30ALng/EOdTr8MDrhizgH8KseVoex6gORoUpTaXL8JC+qRQmrgN1I95ByYK3Q23JJFPJ6pw/QvhwJv07V08Jt2MZfs6ina3l6upuZQYNIs85hGA9mOJOX4rhVWNYVBYS6O9MFX/vXuUZlNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYRooBbA; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYRooBbA"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e384e3481so54027e87.2
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Dec 2024 01:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733477865; x=1734082665; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46xnEZBaNMSheCCiZJiDbfdEocNDp9CvRZTpUgOVQPE=;
        b=jYRooBbAix+PMUZmdTYIc7UuC1oi2UjT1pMR2GKgWcmb4pPPHGTR10p3uVjx8PEhw9
         hQT1gTjtRFx7dkjpwIDnm1EV/RhEj0j6KP/wlys2lApiqfvoxIzJ6LYgRlIg3qrnqnzV
         VHSDhWy54YoVSwG12CYZT50vYsguli3Ia/IjvafrFA9zgEeZ6nOCaZTJHRtRH1D3IOA2
         zfW+RoQlPAiHsWvIiYTa3Ku6WKNEnN1hP2asAe9HUJbWKRTeOOnBceHvac0QqAR2J50G
         KcQcm8n+ze7UqEYkTeG4E7LaGmyeVTMF7NhHBb0c2yNnqmDUggY3CxIL9pFpmJHniEtl
         H49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733477865; x=1734082665;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46xnEZBaNMSheCCiZJiDbfdEocNDp9CvRZTpUgOVQPE=;
        b=eClhiCUWYo2D6SAdYW5/rxbwY44jeRp5d3YN45Le/u0+BTwTU803RxAb1i/hApWRT5
         5a2Pbg3dgA9nc2umWTfzxXnAr1E8f7KH0uack17aeQ4ZbtGOPOBHnoWCyllzrpW60mSX
         T1x0JR/R4dULBptdsnTo1qiWPM+hITmMSVlE2so8OdotDRVuy2U22S1nQeIVNG5mBz72
         yUJhaiYpdu0Xzqgl+QaiwKt2lHsrRwl49csesRNOQc4FwJxSF9Tl/Ix/uVkpurUge9x5
         zI/ae87AZ73CMCTstMPptDdkL1UZinHtS7lzuK/BHMWINtlke3nU4ONizItswZo8OdCE
         rhBw==
X-Gm-Message-State: AOJu0YxLCO5sOte5T7FJsXCvfjVID3rDdjAwPbnni0+0s/gZEpS3sYMV
	ryLUUT+3Vd/sIfTUPEFX8DKAuSU9soK1oRgKqwss7QzGbv0jUQ4Nz1Vu7kF1xY4=
X-Gm-Gg: ASbGncuVK0/UdQrGbHfBAIWOrI5d/GaDAgXGhTGAQy+hw2V8X/srAZnPzwIWT+7pVa7
	w2SX7SFpO/XqsF7ZV+M+1Wb9hc24a80jlTJjzu8rPx4a8MaWshTokF9Lmda/30YSlRVH8nf2AHS
	fy3h+VS1XiE1lR1kjHbVF2+viv2t18Ra2LHpH25fcuuFO3pLkbrIXCOmhcg8reGiErYgxxQkay6
	VW3oSX8CLSBEuJoeitk/y9XT8I9hfxwkRCovKvFCmLxniTHlq1F6ns=
X-Google-Smtp-Source: AGHT+IGMRBAi/Li6P96LN7i/X9zmLh063bXK3BTdutJqDKf+5emjBEJsjRE5mUFk+lrsqJzsYUUOgg==
X-Received: by 2002:a05:6512:2354:b0:53e:20d6:a951 with SMTP id 2adb3069b0e04-53e2c2b0d9dmr1040262e87.4.1733477865232;
        Fri, 06 Dec 2024 01:37:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da11387dsm50974015e9.30.2024.12.06.01.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:37:44 -0800 (PST)
Date: Fri, 6 Dec 2024 12:37:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-hwmon@vger.kernel.org
Subject: [bug report] hwmon: (pmbus/tps25990) Add initial support
Message-ID: <b2b550ae-a2b0-41f8-a0ce-9dafd1714f8c@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Jerome Brunet,

Commit 6fbd1e5d9876 ("hwmon: (pmbus/tps25990) Add initial support")
from Dec 2, 2024 (linux-next), leads to the following Smatch static
checker warning:

	drivers/hwmon/pmbus/tps25990.c:134 tps25990_read_word_data()
	warn: ignoring unreachable code.

drivers/hwmon/pmbus/tps25990.c
    127         case PMBUS_VIRT_READ_IIN_AVG:
    128                 ret = pmbus_read_word_data(client, page, phase,
    129                                            TPS25990_READ_IIN_AVG);
    130                 break;
    131 
    132         case PMBUS_VIRT_READ_IIN_MAX:
    133                 return TPS25990_READ_IIN_PEAK;
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

--> 134                 ret = pmbus_read_word_data(client, page, phase,
    135                                            TPS25990_READ_IIN_PEAK);

Is this supposed to be stubbed out?

    136                 break;
    137 
    138         case PMBUS_VIRT_READ_TEMP_AVG:
    139                 ret = pmbus_read_word_data(client, page, phase,
    140                                            TPS25990_READ_TEMP_AVG);

regards,
dan carpenter
