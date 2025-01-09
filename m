Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58176219A93;
	Thu,  9 Jan 2025 14:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431714; cv=none; b=p1OZblqToBgeye4cKAs1Js92egWf2fveBl5cYwnD58TwOb6D8Fu+QvAwU6cOR7mvPOS4K6NhlER1868GQtYti0ZeWgHZI1KcAIoMb0+JGPjgZOQeGeiVtneroaM19mkQ85Atzd499IWEp2bbzXtAZT2b6G3dq0sOlqaUrDIilGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431714; c=relaxed/simple;
	bh=npe+/FHP0F+2rX6XbsOumEF4Ihr7wMvChx1co/E64YQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJoWLuPvG3n8biNG1wnO0EazafZYOGFOo57PHxbNXDhhhSEc8yuPK7HZD0qo5iIF12gVzC9/PqbF6cWlu/4N4Xz9MbmBn3UnFcUBsirQ9Fp8Q5VuyxOnTHgSwbVUmuyJH0m9SeBsOsFpwNinjd/SM8jMMnpSJ6hN9J/y75OL8bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XN0k4pS/; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XN0k4pS/"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2156e078563so13543935ad.2;
        Thu, 09 Jan 2025 06:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736431713; x=1737036513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fa+0MfrjdKY5FvOChqcYyOo88eA2m6FeMZQVXasM0zs=;
        b=XN0k4pS/u3xF9RnB1xn1pFLl2m3FSRpz6nZoEjoAwWNt04bjL1/gIaSfixqXdA4qpC
         KfMgRK6Pi+NBqR6v1pYhfwzus5Gs/oA51HAdIB0tsTmSEIN0H60WqLmYQDnJIO0m9XjC
         ee+qqPZj7TBHEHG3Bh4+P1IF0c9hoLXaZsYI++GAGMdzp+iBizq5uTCLNXG+xFRf0Qpg
         UsOPghdYbwebnJpF7LUoYGXizLpmbhjtY3GtBpOOD82PkzuHNShTxAUtIpuiBy0ysYKm
         ieeGrCVmrHMAJinLv+eti6TimFoosFidoxPtFZtQjyuETLUGN2kVYglx1ra4rV2e2kxr
         LQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431713; x=1737036513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fa+0MfrjdKY5FvOChqcYyOo88eA2m6FeMZQVXasM0zs=;
        b=etcXdLLpG/OVxlL+TyLDckMxxUg/wMewp7LbPY93h2RUzubiA9e5FU/YIdx7ZDMkzy
         dGt7nQQPv1ZXLYpn90ZlR6O53fphaVm0k5C+cTHLICDPBmsjGSM1vxKAtEj4evWtS1PT
         OSZS99zmxUDyYIzC83y0T74Z5QbjIPrA0vfqJwO1xw9eXS4VEcH3J7D66BOzq+mIlqah
         nVadEYPKekvsZ6CVN1pMDT8hLaMUfgGsanTpq7Vl6OY+QKkErFvVawO3FZ93vUTkEhX3
         AEUMyS0+7998bnUQtPgO7/dn7yDfi/rP3YcL00QLJaGgBO++hOKC/Py3OkO5QDZ5KtbS
         MWpA==
X-Forwarded-Encrypted: i=1; AJvYcCV+Sq9ugNsTdBEW/N3H0VfAqwXDlqxrWzHqsIRxs78eThRPQcr8HeD9WaUvP0OpmCJbwTsiRZsZGchbLHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJzGr9lw9TIIG9M+tbk/2bgZ5FbKf+EhGmRSIk67ESxiFdzpEn
	aRxpqZgDwVZFgrwjT+RSYdhCPVaUFifSp6t316qPGE4IFnJYgihX
X-Gm-Gg: ASbGncuzjeCYXoZGtxfRzRIdHEFRSvfoxDV35wF8yEhOV/Ns/DIZHgh9rP2wbQHcd3w
	5ffdoFoFsUTlfkCsgjnGPMMW/e80BczBl3z3QeeC5uzAim4Ldi1Pow2Lmfm+gK+UJSWrC8sMOV6
	qkI2PRkNnImN2I7l/GdolhMEYzscwDknkavlmOCi5981Cs9HMX9ntlfUZdjF2Xy7151DEmjM83X
	UC2ZoTDC9RNlwy7FpiAqkugwAUa2gHIKi7HJ2ZSfivDThJkozGSfS2zmIVqoLxjzR6VNzgfsRgw
	l9nh5trx1v5IAdxWH4GoJJtZYtvDyw==
X-Google-Smtp-Source: AGHT+IHjwp5c6AzdGlXUXXHGKucDdSRLGtnjJA8ySFBHD/fykNIE4McGQT3aRhUphzMTKyT0TRbdWg==
X-Received: by 2002:a05:6a20:1582:b0:1e1:b19a:fb58 with SMTP id adf61e73a8af0-1e88d0edb48mr11316446637.13.1736431712605;
        Thu, 09 Jan 2025 06:08:32 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb9a8sm37370874b3a.157.2025.01.09.06.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 06:08:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4a62570b-00bd-4740-a416-1f13da3469ce@roeck-us.net>
Date: Thu, 9 Jan 2025 06:08:30 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: pmbus: dps920ab: Add ability to instantiate
 through i2c
To: Denis Kirjanov <kirjanov@gmail.com>, robert.marko@sartura.hr,
 jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109100912.10054-1-kirjanov@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250109100912.10054-1-kirjanov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/25 02:09, Denis Kirjanov wrote:
> Add support for instantiating the Delta DPS920AB PSU
> through I2C on systems without devicetree support.
> 
> Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>
> ---

Change log goes here.

>   drivers/hwmon/pmbus/dps920ab.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
> index cc5aac9dfdb3..c002ed41f517 100644
> --- a/drivers/hwmon/pmbus/dps920ab.c
> +++ b/drivers/hwmon/pmbus/dps920ab.c
> @@ -190,12 +190,19 @@ static const struct of_device_id __maybe_unused dps920ab_of_match[] = {
>   
>   MODULE_DEVICE_TABLE(of, dps920ab_of_match);
>   
> +static struct i2c_device_id dps920ab_i2c_match[] = {
> +	{ "dps920ab" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, dps920ab_i2c_match);
> +
>   static struct i2c_driver dps920ab_driver = {
>   	.driver = {
>   		   .name = "dps920ab",
>   		   .of_match_table = of_match_ptr(dps920ab_of_match),
>   	},
>   	.probe = dps920ab_probe,
> +	.id_table = dps920ab_device_id,
>   };
>   
>   module_i2c_driver(dps920ab_driver);

