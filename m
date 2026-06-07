Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EC52E1C4E
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 23:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780876154; cv=none; b=s6XWuD5H3CmPGHuZQbjOTHgSn2iSPQq314DWgKRW/9ziaUJVd6F1pZ0zpmM7lnvdtOlWLWLMn89vYOXJzubbPBGlh3+cQGf51F/EemvqkUZHva1tWliCZ/612AzhScaLFMF+Z4BDEeoBvhZAQAkaK+uDeCxQAUUfLmurwfMquwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780876154; c=relaxed/simple;
	bh=u6FEkW6VPrOCPX0MrAyAcl+3svpdt7POOZ4vIL47YZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KOZOLfrQOfYwBI6FLEAxDjow7QBEh1wwnT4bgyFU+xk7jRa2xOvt6MjeHOuyWxetXtaj1sirwcbSxHTNECgKgvKRuEgM+j4HFNZ+eDYRPT7pi7mXOAy2h7MdFPNqvvvGNy76ujeNDOOU8bL2OUkg6ahQ8nqakyPocMcAafyJd50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQ1Dwjd+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQ1Dwjd+"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so25600725ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 16:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780876153; x=1781480953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EQ3eehjXkfEBwiu5H8ny1+j5TYHERbwiNQwC5YJI0i0=;
        b=KQ1Dwjd+GJ5PqXZwOMzWtfVfrpFdQyWWclz25j/vULpSFSInvLL1CjlFNLvsU1C4cE
         +OufaMzT481AKK17CY6vNkN7RE8taaLK0TgDJr3ebfLCJiySvxspYjW02DNV+cIyld4D
         mlDwMYWI6CRRis3IfXXiWo/RaYbOSeGUnhEjDUkiwGmRyNxBcCUDrTVBAXzBWGCNwR0v
         xyOnHSC98L/EurhtjLyyQFE2WIKlD1h5/HcP6rwqP8K2YYQMw3jPGLR+8UnC3gs9ROan
         yNDIL4nheZGPTmu4djw8klKfzEXo+9Gkm2Ysmco2cfYFdF11K+YN+HCPAIe89urchZmr
         fNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780876153; x=1781480953;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQ3eehjXkfEBwiu5H8ny1+j5TYHERbwiNQwC5YJI0i0=;
        b=phhzed4DCvxTXHWnq+FSx8F0+JYmEMXxfify9f9dP+8Z/4PcIY0E17sbDWNvNP65Bn
         4dPO2DCkohoHZZxfePHmlOELF4U59i8IIf4WHS/IMOs3QFVeRC5ve2fTrO0MZVqX9gAr
         jBuJToLgdv7XI7yrJm8gAWRul9v/4WeSeku6dkLqJ+OX/mItcriX9lv9LZsoVrXezZlb
         rO150Fj6ANmANfqAaBykfuo0jQLg+r5k//FXD/mfO+H0pyuN9FmIdML1/Nb6fDdPR1Zj
         cL2j30wOapoq3vIioA4c1po22hQYW33vPmiVSABysn/5g+GkIlCf/rNmr6W0bT4zqWv8
         D0Kw==
X-Forwarded-Encrypted: i=1; AFNElJ/3GnuBSVvyXwZZGP51hS7/el1l2YPBsDV91mEJoblc3szTBN5PrECrsTABJ5+s3L7iLGvoxJbgLlTinA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzbTwMNG74Bx9K5M/h+PxG84pGRXts1yr8/CUzMGmE/vmkFD9g
	ETrBnE0a6RmgGo4hiOPPXS0g9usWEH33fI/BRgfAgkQAUas/wgPgmbcI
X-Gm-Gg: Acq92OHD60bmd609RHyMHWWCqXXNJYLma8931E1ay/kBvTraK56WHfJmGWovGp4KiTN
	pmw/lvPkmjAP9Mg3EAo61fnmZvGc4zuf/81tO/mB+R5qcwM88izBRHiYcq/qf4Lat9ELcUYw6LU
	uzhks0KrfjfEVsEJkncWvDRg/WDMwO/yunlIrm3kuuFXnljQs3KjJIDPKNe3elcE1iYwP4U815X
	IDr9W19TWUY76K/6GDsLkACNA0wQ2XSlAOSVq8ti02V7+hjiOe/qNrC8EbsL1DqaHdS4jZ7afFy
	OxpuuihSdRI+CEtnQZ9eXZkE6rSqfCROR82BKarvImG4QzNW/4tf3lA5pSatAap4tQ0aykCCHRC
	WgPuTzkA474K5u6sfAsvQmRZt3p0ykZoDtFctRjnH65s6GYVuU6zs/5w5IxptHnG1/fd5cGgW/F
	AXfmyDU1cRERssjQdcAVgowS5pbCh2tZSjnEXH8ZGBtm0zS3DeVYa4AmkmlMp5kEzjzmILeLOp6
	J2jeS/baeENnoBdd8U0pw==
X-Received: by 2002:a17:903:291:b0:2c0:bcff:e191 with SMTP id d9443c01a7336-2c1e8332c1amr154212455ad.36.1780876152944;
        Sun, 07 Jun 2026 16:49:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df6esm172438635ad.48.2026.06.07.16.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 16:49:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ea749740-6f19-4e34-ac88-c0f985e087c6@roeck-us.net>
Date: Sun, 7 Jun 2026 16:49:11 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] some cleanup and fix in gpd-fan
To: xiaopeitux@foxmail.com, cryolitia@uniontech.com,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
References: <tencent_D01DBC324E22E6A05DA32244B807A89A2109@qq.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <tencent_D01DBC324E22E6A05DA32244B807A89A2109@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/26 03:10, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> some cleanup and fix in gpd-fan
> 
> Pei Xiao (4):
>    hwmon: (gpd-fan): drop global driver data and use per-device
>      allocation
>    hwmon: (gpd-fan): Initialize EC before registering hwmon device
>    hwmon: (gpd-fan): upgrade log level from warn to err for platform
>      device creation failure
>    hwmon: (gpd-fan): fix race condition between device removal and sysfs
>      access
> 
>   drivers/hwmon/gpd-fan.c | 226 ++++++++++++++++++++++------------------
>   1 file changed, 125 insertions(+), 101 deletions(-)
> 

This patch series is a mess.

I received a v2 of this series before this summary, the series sent after
v2 has a mix of "v2" and no versioning tags, and it includes four instead
of the three patches from the original v2.

If you want this series applied, please send v3 with all patches tagged
as v3 and a complete version change log. I will not even try to figure
out which patches to apply from which series.

Guenter

