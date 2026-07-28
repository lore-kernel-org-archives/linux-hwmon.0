Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331043515E2
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 03:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785210082; cv=none; b=lxHlScytBQsLBsbC0K3UjoSqyPT6kcKYp/L738KcaJvPjXyCmdXAz1HUuvAmEOJP3kwer6+fanLtaRBWc0uZT80nM/VyggP1sz7t49756/1teW1pMJUpN6V40sVUC3DlYKYhsvGFFvfIrIBfEI/Ad3Ko1D6z1W4KiPFe3iWFydc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785210082; c=relaxed/simple;
	bh=tGl/xAq94VuJIjn/stN27Le7fgNAMSWc0TQsUovSkw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=haMicNBdIDEedxantDUtL5nkD1r3ZhmZQxxnqcRfejAz/9YHiKjM4Dn33cNmOc7zkXGyrW1D7HwBYd+oUjBODltJ/9YrIOOE38YiWo2NdtKVIPFCFXNdM0/Wjix0g/M7PO4fdKU8/oq9Bm0HGMHsd4uqO0vXN2qlc/QcYSiglsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EafBYB0S; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EafBYB0S"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbb662575d3so1948013a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 20:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785210080; x=1785814880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1s3vhEoW1xwEExespEZ3ODHzHep+GF28+Zno2CEI4sk=;
        b=EafBYB0SB68Jo/C3D8B/CQdnJ7mdT0/k0r+uDBOHl28wn0lYUPeBABKqX37bmQlcwc
         xCHVyAtEPTvtC0ySXnnaT20sKuTjxcuMXC2adEu/GKUQi/31ENiet/PGRe3fj1/Q1hc5
         WZPkGmfpuSIzZliuanuGCp9ejKkGO4xQ5I+g+Ldvv1asuTLQn0OkwD7LiBwOEa9DHB4F
         wi9tjvXzm9dhkVEGXCL5cOSxrJOF6/9h6jhO87v3B0EPoPUr22gR6nAu1NmT3xceySlB
         dJmJien5sa9hb4yAeDbhBVs3bT2wXR/YOxQ/VWXT6TR3JdlHUR9QQQtoQ+TE2E37n391
         Mh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785210080; x=1785814880;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1s3vhEoW1xwEExespEZ3ODHzHep+GF28+Zno2CEI4sk=;
        b=CDYd6agLYP4KdnZtGB4jpBPP+TEP4Ig6wRZqLYprWVIxXRJqmcRtkPfy0Mx9zkkvra
         laqfSKrRYu6slenzmXEfMurUeCADMrkIWlqNNeKJ4UzsL1dsTl4u1fEtgiviIgyBaf0+
         Mmo3oRmJv33bS9ITC6EazLsZEKb00R6eN+rplPR+fAtexZZ0HpOBs+0vwjItPSkJgrUn
         VT5FoI5nXBLH1Jx5jh4Fp3ORyPyQ5DTaX6uztsRZzfAutsqHSa7g48oPmaQEYWU5GIDP
         /GAF3a04o1obZ6UOZ2J/CQGpEkOkqKIg8I8JBMuaTdKSBNEhTWLxsRjsdg0GzGWD7b9v
         2F+g==
X-Forwarded-Encrypted: i=1; AHgh+RoLUoBOP//aS1O7E4OFk/hlqW4vxoQKQ1pcYeOBKNSo67N1lipZR8P3O4nzBhuTPv39E3D/74CBa6vjrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp2+OAdwyBDXmIapnZRFNskll2Pe02YyzUfpj6YtHJbB+wiwlZ
	A0seWe4icCz3/GgBwGVYIexCCy82QKC8SITAFMnZ2mJtIIeT4n4wrBXa
X-Gm-Gg: AR+sD12I6caXi+VJVNdJ25QIBvukF5awdVoHuozhc1p85glbfawn58nwfMcMg1GSN7i
	g2RkHytzBAo2Tz9Bg3C92hBZT7EKXSva+gw0pvYMevhTieYABIE23ZVoyXRAQPVFq0hGeYUJSHm
	NNr0lH/JnYczyZmQ9+1HatCfO36mxtJgJpXjujoDn0Yi9fBCW3qeHnkse3GSq+TvGmHTLTm+TOe
	sIZO/eEKzVOdBeEPP1DpjdO2CRgJoesmxgxqPZdN+ljeCGW4HNqL+3s56odpS88/w5bacRCWO1n
	5VVFz7pYXg6WGojM35FwTTtQ60cXvSpSaHKV9SV/NCJXtzZ7wjwg/3CWW7aMqTh6ZbngWwFyJ2S
	UPBlXNJXoxHNSxWqVFq4bqlBOCmqnva66E/MIQbTey6u+DnGGwGUs9mFoJ2Vn9h9OsfPFYMHe6w
	BskVwVAxePM7Dzi+lmc0a49XUUicvWDSVb8PD5pffKTz0WvEvzvEw=
X-Received: by 2002:a05:6a20:939a:b0:3b5:489c:7bb5 with SMTP id adf61e73a8af0-3c8b88ae6demr881297637.28.1785210080388;
        Mon, 27 Jul 2026 20:41:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm37480125eec.10.2026.07.27.20.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 20:41:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <18773444-febb-4e8a-a76e-2536d55d7cb1@roeck-us.net>
Date: Mon, 27 Jul 2026 20:41:18 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] hwmon: (pmbus/tps25990): Rework driver for
 multi-device support
To: sashiko-reviews@lists.linux.dev, Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-hwmon@vger.kernel.org
References: <20260728015857.193890-1-sbogdanov@baylibre.com>
 <20260728015857.193890-2-sbogdanov@baylibre.com>
 <20260728020703.EFC111F00AC4@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260728020703.EFC111F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 19:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The static array `tps25990_base_info` is missing the `const` qualifier, placing it in mutable `.data` memory instead of read-only `.rodata`.
> - [Low] The `tps25990_i2c_id` array uses positional initializers, which violates the I2C subsystem's coding guidelines.

Both reported issues are valid. Please fix.

Thasnks,
Guenter

> --
> 
> --- Patch [1]: [PATCH v5 1/3] hwmon: (pmbus/tps25990): Rework driver for multi-device support ---
> commit 7c6d03feb4ad36395a77df5021ef6a8c6f2df2a8
> Author: Stoyan Bogdanov <sbogdanov@baylibre.com>
> 
> hwmon: (pmbus/tps25990): Rework driver for multi-device support
> 
> This commit reworks the tps25990 driver to allow adding support for new
> devices. It introduces a chip enumeration and a data structure to hold
> per-device measurement coefficients.
> 
>> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
>> index 9d318e6509abf..490dcd2a5fa51 100644
>> --- a/drivers/hwmon/pmbus/tps25990.c
>> +++ b/drivers/hwmon/pmbus/tps25990.c
> [ ... ]
>> -static const struct pmbus_driver_info tps25990_base_info = {
>> -	.pages = 1,
> [ ... ]
>> -#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
>> -	.reg_desc = tps25990_reg_desc,
>> -	.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
>> -#endif
>> -};
>> -
>> +static struct pmbus_driver_info tps25990_base_info[] = {
>> +	[tps25990] = {
>> +		.pages = 1,
> 
> [Severity: Medium]
> Should this array be declared const?
> 
> The previous single structure was const, but the new array drops the const
> qualifier. Leaving tps25990_base_info mutable places the struct's function
> pointers in mutable .data memory instead of read-only .rodata.
> 
> [ ... ]
>>   static const struct i2c_device_id tps25990_i2c_id[] = {
>> -	{ .name = "tps25990" },
>> -	{ }
>> +	{ "tps25990", tps25990 },
>> +	{}
>>   };
>>   MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
> 
> [Severity: Low]
> Does this code run counter to the I2C subsystem coding guidelines?
> 
> The guidelines specify that initialized arrays of type struct i2c_device_id
> must use named initializers, but this patch changes the initialization to
> use positional initializers instead.
> 

