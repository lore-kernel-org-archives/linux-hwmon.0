Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DB1444717
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Jul 2026 16:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911956; cv=none; b=IzXu/7jTJF6DwqAeUOZCttSUrEXZYCCeKaKWBe+SAA+U6FxCkCDg+l/QNMz6eKWWN2gJRXhMuJ+g2wlS6SM0HcmHR1mhR96gkNTe4/D3CgGzCu/wMmuThJriXeuYaTjZzHy7WHxeQCxWhuf12qfHq8rCn9OQxD5PEhZ+FybJsMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911956; c=relaxed/simple;
	bh=35IoV7vE+4nDzg2Nx0XPGWsaiXWtKAGksvCqm71nvxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6qoG0RYBEEjRdaaFhC/ZS0l1wAPdYpJe3BUJy2QFPElhBfvqcL+9RkJ1Y2QWQrLx+zD0ke2kxrkwTGpWKKE9hx5A4kYsNVy591se9+9Pwxy9sRtsYvwOyGsqJ1Bh4RvieAoTYK3AaUsRzvQQlI+z2NDcSenrAgknyf1kvD1P38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/gdoPS3; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/gdoPS3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf27856f9cso9069405ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Jul 2026 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784911954; x=1785516754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R5MlGsOLs4wGnW8TY+feH+zpq8ktGG8kIj4IWl7CUYw=;
        b=U/gdoPS3uztUWKsaZx23qILBRq2O/LI+FlvRWmILTwaNDP3fQrlqYDM3MJ+I97xU/5
         ijbpyIQ6fDZjjoDbB0EdgroMLJKnFIRMIEArl7awKjxhzNwNxHB2hsOFm80JibZvnNjU
         Pg6mjuVhpD85iu8yLpV0yZjefhbujiFhtAV+R2y0QcFDh9wSK4Nc0uDJWXdTnO0tSWGN
         8aje6YJUWRErKXHMCW7UAwLct1b3o8gCpalhXjUpql8WVbm64tclROucY0iife/haRjM
         em66kTwvADPiUYATOoyw1Wg26VEgrZ7gBDxfLvsw24vH5VL8cE3Nkez+JeWVu1jmTv2u
         Ea2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911954; x=1785516754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5MlGsOLs4wGnW8TY+feH+zpq8ktGG8kIj4IWl7CUYw=;
        b=PDSeOJrJL1R2OM9Is6ft6J7BEduXbvihSJ/QzxlcUTRhpfK2ePF6v0d0nbhWDDvyX9
         dseRPzx4lSuWsUdtVZZay0nALLf9+whtV33ESCjcnaIlNumkFgqTcpunJFhHVWmRCO9/
         kAdX9GG5WiHxSVb0J4ej/2HNJv62BL6TTOq9N8FOWmj+Q1M8NaJ8xBDD1UjsxVvBoZj7
         ktB7oE75GT5qUMhP7s5gxdjWnyw0UC7Bk0el+APowUZ+PdBTKo4LrOUb+GDt9u/en8/U
         +GeVD2h/0QbLEpedXxggaFog6jjr/zJ4bFx+1XURSWlbZFAB1hkBjhnxTc+xab1QXiVJ
         275A==
X-Forwarded-Encrypted: i=1; AHgh+Rp5DmLz6GDMvnQwP97SUZ6zXAFS+fL9OUe5bG4CEmWNZt04xnT4XibugaISRr7bIahJXifVIqbJX6I/Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygsIKi4IKIWl8r3yQRIIOoGJp7qo5+27cjp07N2TwNQqbalaGW
	TfzhkGJJmzKewvZ/tgwTyU+klI1Gzjrl98g45WXUmBYcWOYVN2TRllOr
X-Gm-Gg: AR+sD13kirwGcaoXLT7J5ggHTuqC1w1Yyp1RiNChQuEzLnWfHuuzFdHomZNJAeIlJzt
	AU6bUBWYdYX8HwD+MIMekgrKhMqChny7PYVfd2BrYmFdNLVre/HbR1bgAlOkZdlYXF6+1UUwS1H
	VFDvBvVnzO4IeKCeciDuJzvLwGi5t9C1oZ3CUq3k6430Z7/H7ZcSzjObvhuJ5r6utc9A2YiFxB0
	zHrhEKzACDz6bfUFwMLrZ/2Kty/e/Igc72EUTxA3uPUKMhsHPSy5BiM2kmq5Lqq/Pewzs4Kv1ab
	E+8VoofUuxf31LmHR4UVZrbCZzV/j8vh27REUexKU/4PCcf67wWk6IlC4cHk+lb0MMteHEn1mj5
	ayrbazcx9nWn8LdAIVFJ+nBkub6EZdFgq76HT8Hmvo2rwsBrA9VZlv3npfMuBZTkhXT8XEESJNb
	z4YKuaYW0MwMDNRdVBgrp9BAPQfg==
X-Received: by 2002:a17:903:2385:b0:2cc:6329:b7ba with SMTP id d9443c01a7336-2cfa6b6fda8mr95199715ad.16.1784911954005;
        Fri, 24 Jul 2026 09:52:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf9c8b7a7esm44701815ad.3.2026.07.24.09.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:52:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 24 Jul 2026 09:52:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 3/4] hwmon: (kb9002) Add driver for Kandou KB9002
 retimer
Message-ID: <987fa310-d032-49e7-bdee-5b85b0d66dcd@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-3-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-3-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:39PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes an SMBus
> target with mandatory PEC. Add a hwmon driver reporting the firmware
> aggregated maximum die temperature as temp1_input, with the firmware
> version and boot status under debugfs.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter
