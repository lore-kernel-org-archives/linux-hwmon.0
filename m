Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB304156F45
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 05:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785907933; cv=none; b=ozePYjbKezdvUxDA3Dd2eWAqoH9eoPmcbLhZa0sF/jiTKfARSkv+N/LaTfsg6Hs6vreInhjyMp8OZwctmDcQPxjgdu8dVHFMFsYC2kaaEhlZQzryoIpFkYvVYw7MIrjzXaq5iyFmG95DUR4d6U6JEfkAa+4JZajKN+EO7DmwVY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785907933; c=relaxed/simple;
	bh=odRnePs4ZboFQQxAmkpJ17Zpps7HqAHS6K6Vl8149lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGegk3dXx6o75SNspKTMqWrBxMSDjflLxmpNpVT8uJx+TZ22oUU47et1dKkKyp0bx3J+ijThTnEUdgNZMfG7YNfapvXw4ymRhFKJu37Z06SwE5MMk47MvFj0OiVpZlZKRHmB0uF1s6MxjzIOOqHNxDvQLyZYer9PxW0LqD4WriU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p90g41xY; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p90g41xY"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so326013a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 22:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785907930; x=1786512730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7vKBpppJHeTlbjTLdX9Z/bAWZvGUy9g/R92qTNlVRg=;
        b=p90g41xY1Jid65/Gp5Mwka+RQ1xDz5iyH3TVcA0vPyARiaaf4YZCkZEnB29/aVTxfU
         l+9232lMbh6mks+dRd0A2ocqjFRxpCegxtKtD5zCQ/ppMOtb48w2mvt/2MSYZFS0yJ/+
         MVuLyY84B9gPD02/OErPOmwmnEcux/UC1VwAtJJwQv/EJn8arwJFw4+8q5XE7eRQ4Ue/
         l716+aMUgK6R7TQgRUcQuDP5O0/wc4vleF0Kg2u8DxrgEWWHdhVG6sA/jm6ukTvDZwTT
         2ctwoj9fFt8IicBaI7CWgK5ElQhw18cBZZdmVs8D8UCTlbYAmsIXw/6lziSbbs80jvP+
         VGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785907930; x=1786512730;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J7vKBpppJHeTlbjTLdX9Z/bAWZvGUy9g/R92qTNlVRg=;
        b=XeEQ7tPXkhW2UOplSNibphvvF7WcBnDFHWGlMCG+GBM0mbyHHdF2qE1p505Nah808G
         0B8/3jj96IjH4SNhttmGqhS+8KvZaNDgtJxmpMPhPZi7Gi2J7AITsTw+yjWbK4rjXfU7
         DRT+4588Wl2H2nRj2k7hYL6coZlmGBvQa8ATe2KjjDqJbN5KWJyb6NTkU7cRGlU4j57+
         cECoaWu73cNLv2faVPr/mb9B8ohqhwWq1yDF0F2EpPkCN/IEupeTMZIHWC5QGGsUAabb
         9rcyctYo1n+nJbnO7M0h6N9AreVgLJ5YQy3nxYNXquxdEje6Oan716FmH9AgMzQvWYZZ
         359g==
X-Gm-Message-State: AOJu0YxNT2zIyxp1gQVD5qgkKt8rIEb22I1t+alyz+JfRTtnm3u/h9Fr
	HM+zslDeLPFgDLgzG+MRWUFrDUJphiniLzR4v5RUkppK498lVwG3l7D4
X-Gm-Gg: AR+sD12X0WqdGvH4Fj0Z05fkgJOxnyLOWIBr29fy2WcXjUbi2+/sT6S+tkALFqetI/3
	zCqeOjBZYZP1TIuJC/mlrZQ+Fre+3Be6wayr1HUkLBqOV84jtEQSNId5fDdxXDIBLtCXckGuwPP
	/ovfA5zWAziVGq9BSyzmPNO9KRdEv/YGWQGRa7vXlLgH+wVEH38cBi6oop2z/Wt8JWK6PPn/OHt
	coSpsc5cG7aBmfS8FSUetEDUddDZtD1aCnTv+hTeVT+Cezg5q+kzBTWTSwqeySLc7F1kVvc9iqE
	WGqZUTTkZ2EBV7msk2M6lRU5ThHWrmx9nGP4RJusIzDq01CmhXIrIe59ZenfKlFD3M8ofgfDKvI
	yXW9l0qsLdS599W0FT4AxeLxzg2skoueXUYMnO05IsPb+zZanEv4StAxY5YfwiCzhEnxojvqveF
	2bsNdQLtqjwn6GbhXpphW8C2TyJ7LlUC4+P4+JIiXnuga5OQmXUpfZ/mbDUCEr5vCoQp4Z2Dpkp
	6chvvS76k6BWMpt/MP/DEZlUxcShcZp1t9jmw==
X-Received: by 2002:a17:90b:51c1:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-3903c5d7c48mr4574115a91.19.1785907929723;
        Tue, 04 Aug 2026 22:32:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38feda512f3sm3302386a91.11.2026.08.04.22.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 22:32:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <475123d2-3eee-42c6-afc6-bf0a8b2fc8f4@roeck-us.net>
Date: Tue, 4 Aug 2026 22:32:07 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (ads7828) Fix external VREF regulator handling
To: Qingshuang Fu <fffsqian@163.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sam Povilus <kernel.development@povil.us>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Qingshuang Fu <fuqingshuang@kylinos.cn>
References: <20260805042101.1177736-1-fffsqian@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260805042101.1177736-1-fffsqian@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/26 21:21, Qingshuang Fu wrote:
> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
> 
> The driver currently has two issues with the external VREF regulator
> handling in ads7828_probe():
> 
> 1. All errors from devm_regulator_get_optional() are ignored, causing the
>     driver to incorrectly fall back to internal VREF even for transient
>     errors like -EPROBE_DEFER or genuine failures like -ENOMEM.
> 
> 2. The external regulator is never enabled. The driver calls
>     regulator_get_voltage() without first calling regulator_enable(),
>     so the VREF pin may remain unpowered if the regulator is not
>     configured as always-on.
> 
> Fix both issues by switching to devm_regulator_get_enable_read_voltage(),
> which handles regulator get, enable, and voltage read in one call.
> Only -ENODEV (no regulator specified in device tree) should trigger the
> fallback to internal VREF. All other errors are propagated to the caller.
> 
> Fixes: a8ddfea09566 ("hwmon: (ads7828) Accept optional parameters from device tree")
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
> ---
> Changes in v3:
> - Switch to devm_regulator_get_enable_read_voltage() to also enable the
>    external regulator, as suggested by Guenter Roeck.
> Changes in v2:
> - Broaden the error check to handle all errors except -ENODEV, instead of
>    only checking for -EPROBE_DEFER. This addresses the Sashiko AI review
>    concern about masking genuine errors like -ENOMEM and -EINVAL.
> 
>   drivers/hwmon/ads7828.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
> index 149cfcec78dc..172da6f6549d 100644
> --- a/drivers/hwmon/ads7828.c
> +++ b/drivers/hwmon/ads7828.c
> @@ -106,12 +106,11 @@ static int ads7828_probe(struct i2c_client *client)
>   	struct ads7828_data *data;
>   	struct device *hwmon_dev;
>   	unsigned int vref_mv = ADS7828_INT_VREF_MV;
> -	unsigned int vref_uv;
> +	int vref_uv;
>   	bool diff_input = false;
>   	bool ext_vref = false;
>   	unsigned int regval;
>   	enum ads7828_chips chip;
> -	struct regulator *reg;
>   
>   	data = devm_kzalloc(dev, sizeof(struct ads7828_data), GFP_KERNEL);
>   	if (!data)
> @@ -125,14 +124,15 @@ static int ads7828_probe(struct i2c_client *client)
>   	} else if (dev->of_node) {
>   		diff_input = of_property_read_bool(dev->of_node,
>   						   "ti,differential-input");
> -		reg = devm_regulator_get_optional(dev, "vref");
> -		if (!IS_ERR(reg)) {
> -			vref_uv = regulator_get_voltage(reg);
> +		vref_uv = devm_regulator_get_enable_read_voltage(dev, "vref");
> +		if (vref_uv >= 0) {

Please use
		if (IS_ERR(vref_uv)) {
			if (vref_uv != -ENODEV)
				return vref_uv;
		} else {
			...

Thanks,
Guenter

>   			vref_mv = DIV_ROUND_CLOSEST(vref_uv, 1000);
>   			if (vref_mv < ADS7828_EXT_VREF_MV_MIN ||
>   			    vref_mv > ADS7828_EXT_VREF_MV_MAX)
>   				return -EINVAL;
>   			ext_vref = true;
> +		} else if (vref_uv != -ENODEV) {
> +			return vref_uv;
>   		}
>   	}
>   

