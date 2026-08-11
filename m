Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFFC3FDC06
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 16:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786465161; cv=none; b=Bk450rECzlKQuQ4NVMcl6YFL1Oqp34NOy8iT6XRvP0L+GuBtk8cmvS8wjUX0x2kUHGv8bcr0wABk2x8DFSoOsmtPSGY0OP5H4Wok1GVvov33bb4frMbw2h04WTpNzGbnp5nzPKn0Sk9K7i/NSiAhSzI8qwPb7D9CNJfNAiUK3TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786465161; c=relaxed/simple;
	bh=z+VfugDQHvtJuAGpUPkQNfmeIe8AY7wqkS0xf7wCXZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ebEXGJ3fl0UK9Csvn8hXEqJDu7x7A6yzB/3tFOE8WLL13r4sghZ8zy65ZJOM758+rjw+JIqefIMytZqt/wQizKC3ZrLmA8UPydvRY8XxsLWtvjRfT++gjx0jZGKyRjvS7AdpaDcaChENFewVw/zkEW/Rb/9XNcizVWSv3lrewYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuGGryMU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuGGryMU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc61541f8cso16065025ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 09:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786465160; x=1787069960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmC1aNhntQos2bMrR1NPmi0PKUecGtnknBV5kB3cTzM=;
        b=WuGGryMUEMNFoQJGuytGvJfDU32vH+UM5l0d4wJXRQl33TpsGyZYpS3xNuQGVpmcfJ
         Qu0hmpiNifPPd586GdRfXiQLAlZqi4ohGtCiNS2zlf9P5frMX+tWxOsefM1KT0edmQLH
         cy/om2I5P+rWnPDwJXOfwSlUumxYAF2SpTqt0Bm0FVtB6CosjS6xxuUw16IrAXRgR83S
         tuIa742DfCTjgIeng8TfmvP6osTvlsyW4UtcG1gF9agC6rK7+xn41w8DDJv+ShADvrrU
         atzU0ces4V/Xme4OKiKGEhNN9IsNAxZwaMrcl02TlbYIh1fcPe58ZMFAMuZAiVnCLVS8
         9haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786465160; x=1787069960;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmC1aNhntQos2bMrR1NPmi0PKUecGtnknBV5kB3cTzM=;
        b=qLCoCHtRNTc5prYwPaPQHNzVYzddOK4e5NcO/42dO6OSLtaeQZ312gkvO2xuiUN04Z
         0HbbUbMNh215HQrCtSbXu6u8R3BZnqckoCLn7n4XYFP34hj5lTHvJ6K5Pm53Hqwtd+t1
         sZizCTgnhbf7UBrCDJvQRQpx46SSJGZDK9tt9czNGMz45U4Gp/4Ahx4ElOUlWU6dEzfU
         25J9I8LZusvBP6EvlwoGOQxuN61tvnKh4ek/QPkpQRTB8knm8ECJs6zxJkS33mGU8Yo7
         0qwW7EroW9TwLhenBkbBU5YCTbyyZWuqpqXn+o10fko4RwTAKqJiKqefikhGCOzxirca
         UZAA==
X-Forwarded-Encrypted: i=1; AHgh+RoEn7XaZkqsbLm1iy06/ti5nIm1vMd38IOWrzA0BiTTV0XOoGBCEGlRHDyv12E/2i+2DCknlxcjnpG/tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY5EsJFwaCd8xuHxlDE5GxxvyVf6dGRUcqY0jHWbcUQDLHLuaZ
	Qs/yBdpHZBs9jIShSDDsWd/BklDm1dPgkZMQ9PDaVxFDa1QL7C1zDM6AlIxGHA==
X-Gm-Gg: AR+sD10MDKqHZX1Nttwmm9K7vwzGhqu73zwo5jatLw1fix98sZ3pLeEYqhB84FU2zvo
	DzfhN3K2Woyun6se0cgI8kRuBEb9RMKXLU3DJdambXPaXp2mK11qZO905dfwQaWkVM4dKJn+Oxg
	ugdxDYOZUguZJktuDFaHjg7wRWfRCHELScP1h/LkEoAt24wC0qsevA0Zz9LASfRV3anEAzwSTly
	PVikK9WZAW+lrgR/vAlIR467Iyep8F7ECkxt9c0ZDbPNnr2FsPH0RIwXyI3YRFLd8RzJDYcoApi
	cXBw1A1nsSnBNhcQyMW4FmLi7ZiXAYwVkGyA+jNqUF9tGSnO8HV1eQhvLT2z/Gw4mMTpzZxcE9t
	rFH8fM6iDEyvSEGnsJuznw8iLa2DLryDxEe4NSfI2ddkS8qrzjEuYKs7iLq+lPd41vIa6a85Yy8
	YJukraMgIYraP0yQNkx6CZTZdFECqUUuGkjiqqBUcz61XeXXB5UlNS/Qv0hz82uqxw7e4g+V8N1
	8ybFLhzcbGwuj6VBnqOe08icu47giUcw4dGpVdsyLI=
X-Received: by 2002:a17:90b:2249:b0:390:84db:888e with SMTP id 98e67ed59e1d1-392f457e050mr532204a91.7.1786465159650;
        Tue, 11 Aug 2026 09:19:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f8896c20sm188083a91.1.2026.08.11.09.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 09:19:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <615fe24b-66dc-4893-ba78-7a5d0e5f516b@roeck-us.net>
Date: Tue, 11 Aug 2026 09:19:18 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (k10temp) Add per-CCD temperature monitoring for
 Zen5 Turin
To: Gabriel Ford <gabriel@gford.dev>, Clemens Ladisch <clemens@ladisch.de>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811050523.5688-1-gabriel@gford.dev>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260811050523.5688-1-gabriel@gford.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/10/26 22:04, Gabriel Ford wrote:
> Adds support for per-CCD temperature monitoring on Zen 5 Turin (EPYC 9005)

Nit: s/Adds/Add/

> CPUs, as they fall in a different model range with a larger number of
> maximum CCDs compared to their desktop counterparts. Tested and working
> on an EPYC 9555P.
> 
> Signed-off-by: Gabriel Ford <gabriel@gford.dev>

I'll need confirmation from someone at AMD to confirm that this is correct.

Also, it appears that the patch did not make it into patchwork nor into any
of the mailing lists, and thus it has not been reviewed by Sashiko.
Any idea why this might be the case ?

Thanks,
Guenter

> ---
>   drivers/hwmon/k10temp.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index de0760dc597d..b882fe09ac1b 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -207,6 +207,10 @@ static const char *k10temp_temp_label[] = {
>   	"Tccd10",
>   	"Tccd11",
>   	"Tccd12",
> +	"Tccd13",
> +	"Tccd14",
> +	"Tccd15",
> +	"Tccd16"
>   };
>   
>   static int k10temp_read_labels(struct device *dev,
> @@ -515,6 +519,10 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		}
>   	} else if (boot_cpu_data.x86 == 0x1a) {
>   		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x2f:	/* Zen5 Turin */
> +			data->ccd_offset = 0x1F0;
> +			k10temp_get_ccd_support(data, 16);
> +			break;
>   		case 0x40 ... 0x4f:	/* Zen5 Ryzen Desktop */
>   			data->ccd_offset = 0x308;
>   			k10temp_get_ccd_support(data, 8);

