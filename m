Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C3A2D7804
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 17:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855450; cv=none; b=E7JRNXdg6PZeNGLkuPTOTngit6E4dH9CmJXvt6rCxczNODFUnKsEINCsHmrBGkjyBkeKjg3blNjFnDwhwx7P/lD902A7ak8/eVzrm2mpU+CEVo8ga+tvUyOgBYRUR58+SAi2Bc/ICLOQ49hq1vVCRWsTMUuJOVTrn7CjqjbFhpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855450; c=relaxed/simple;
	bh=9N0p1gHJ4/ldCRjXubOfQ1J+k+6ttdTdb0EsZzoophk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLdTjnCCBZIvHpre8fnINJAyxmhfX7fTkB/tkLUdU3coJ+Su20bN7a/zdae4yMQaKauNO0Lz+13lrNpydqqXnKTRTkLHfXjeRInWCj33oZAd/+icro4IKq4t4pVieX5hYx7YFTern3YG0J1UGgvw/vleZpJWk0H8T8P5OXtOueQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Srzpw+pT; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Srzpw+pT"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b061b6cf36so407645ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 10:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773855449; x=1774460249; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OJEyn7i7B9+B9dY5m7w6oyTeXs0Qvwqbo+nm6YMirEU=;
        b=Srzpw+pTOJVMZnh0BUC8kvo+IU9Fhbs7Ex9hOjEWXe3SeGnIq0nYjP9N/5YAzmF6u9
         /3yNfOgdysOH84sd/o7dKe36M4sxQVBAynJj0cwhJwwKODoTN42gyHAOB6fWTjEYrFkl
         7+eXrb9xCoQWZizvvUftMZdLRoF6BlQaujaqDe+b7Hgek4wRc4ZjnmnCGJ1yykhw27f+
         TMVs3pFdCveloHlCY22hQYhfQJKzG73sln9W9m04exHZfJ7eAgxhSVASdQAwiX8//LCk
         wAwZ70ruy63MAQplkhnJGZ/DAsV35I295EvieVBMWFBoMEZWD7YxxwCO/7c40lPXOeaj
         YN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773855449; x=1774460249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJEyn7i7B9+B9dY5m7w6oyTeXs0Qvwqbo+nm6YMirEU=;
        b=MorEWtdJ2sValWtjLPNVQTbZp0EbIvIp+XHR1QF/9GWbsSzJKERKO+B2LD3iS2+UyJ
         wCNwqtFp2hkV5EsAWbzUyCqVo/By/zmeQQyXYomUiV6KPN4/ub5+anna7eAI8TkbJZbg
         4Zfh/A8hQdohcweoW7yWhsnwhnxUyk20vHwT3wvFCAVsxYJkyyl458sQsZCpJgM8xSW5
         rCo1hX6t0ZPAQQHpeFY8LIhtSZbY1Hic+dcLb1dZPoDRlq8SjbXUgMeLRYmGH6VGJV1H
         rUFRxXmKe+x+Xt1DYaLRU03Nng1L2SZYdwoiai4n4zAyoN9r/dcKPrclFgbdf1bO7o7S
         A7Fw==
X-Gm-Message-State: AOJu0YyapC8GkSpF0wWkl2vwNVF0x8s4eMIUBt9AAYTfCGMrOAOJ4BTD
	Klo+8f6GhEQ1rVarH7gttBW5MQVcRaj4vlH03iaTQl6tPauvaxvJUe3H
X-Gm-Gg: ATEYQzzeCZp0ywzXT2MWYOYQnPBrfXESRaT0NDdvj7gSPkqa2P8S3jZB+5sTX2a0iHR
	tB2MgYItahHVBueNQ1pQ6xvLKYui70yabQAY297ae0y1vIv267GGTseB0UhPEfh1/Sr+qH4/0iw
	dcj/Iu8fQDLjjlhwUggh/opK8/0GVNDfiC3Ksp/f/6DGP4mN5/pYVRu4ijvTGlORYFWeLlPeJhF
	BZKhSPXSmtj+paZvLg8GIilDO+2TzDkrUG8M6CSSy51nATBLlGGK6nyC9rmZw5pEpNePC1yIREU
	UgyHptbkF7AzDLmBA6K5yfpiMziQVkCxzdgSjCW8GUSGOIpRvJDik4Wq5DBlfdhshmlkyF801CO
	M+u/o7jJC34mF5tlJzQUa3sxaueOu2ajVcN/Z5sttn0ZEz2lKrGnz6UeYkBhj4vl3PDjgXnb7+f
	pM0CuM1wAynEOoyEsPOrX6qT7ABIw/HSPIo4uFrAK7Gsbm51NXqgLjAoOXQ7a/gd99emnyZqhw0
	gcJagAOz6M=
X-Received: by 2002:a17:902:ebc2:b0:2b0:400a:c77c with SMTP id d9443c01a7336-2b06e417f21mr54217035ad.44.1773855448985;
        Wed, 18 Mar 2026 10:37:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5ef42asm40025865ad.40.2026.03.18.10.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 10:37:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5dce0ef8-d61a-4429-aa42-c857b3fd8690@roeck-us.net>
Date: Wed, 18 Mar 2026 10:37:27 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: pmbus: mpq8785: add support for mpm3695-20 and
 mpm3690s-15
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, paweldembicki@gmail.com,
 carl.lee@amd.com, ythsu0511@gmail.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wyx137120466@gmail.com
References: <20260318094635.1873-1-Yuxi.Wang@monolithicpower.com>
 <0111019d00586e60-e3a938c5-6b1d-47c8-9856-0fc717ece565-000000@us-west-1.amazonses.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <0111019d00586e60-e3a938c5-6b1d-47c8-9856-0fc717ece565-000000@us-west-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/26 02:48, Yuxi Wang wrote:
> Add support for the MPS mpm3695-20 and mpm3690s-15.
> 
> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> ---
>   drivers/hwmon/pmbus/mpq8785.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
> index 87bd039c77b9..03889a197c4f 100644
> --- a/drivers/hwmon/pmbus/mpq8785.c
> +++ b/drivers/hwmon/pmbus/mpq8785.c
> @@ -12,13 +12,15 @@
>   
>   #define MPM82504_READ_TEMPERATURE_1_SIGN_POS	9
>   
> -enum chips { mpm3695, mpm3695_25, mpm82504, mpq8785 };
> +enum chips { mpm3695, mpm3695_25, mpm82504, mpq8785, mpm3695_20, mpm3690s_15 };
>   
>   static u16 voltage_scale_loop_max_val[] = {
>   	[mpm3695] = GENMASK(9, 0),
>   	[mpm3695_25] = GENMASK(11, 0),
>   	[mpm82504] = GENMASK(9, 0),
>   	[mpq8785] = GENMASK(10, 0),
> +	[mpm3695_20] = GENMASK(9, 0),
> +	[mpm3690s_15] = GENMASK(9, 0),
>   };
>   
>   static int mpq8785_identify(struct i2c_client *client,
> @@ -114,6 +116,8 @@ static const struct i2c_device_id mpq8785_id[] = {
>   	{ "mpm3695-25", mpm3695_25 },
>   	{ "mpm82504", mpm82504 },
>   	{ "mpq8785", mpq8785 },
> +	{ "mpm3695-20", mpm3695_20 },
> +	{ "mpm3690s-15", mpm3690s_15 },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(i2c, mpq8785_id);
> @@ -123,6 +127,8 @@ static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
>   	{ .compatible = "mps,mpm3695-25", .data = (void *)mpm3695_25 },
>   	{ .compatible = "mps,mpm82504", .data = (void *)mpm82504 },
>   	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
> +	{ .compatible = "mps,mpm3695-20", .data = (void *)mpm3695_20 },
> +	{ .compatible = "mps,mpm3690s-15", .data = (void *)mpm3690s_15 },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, mpq8785_of_match);
> @@ -148,6 +154,8 @@ static int mpq8785_probe(struct i2c_client *client)
>   	case mpm3695:
>   	case mpm3695_25:
>   	case mpm82504:
> +	case mpm3695_20:
> +	case mpm3690s_15:
>   		info->format[PSC_VOLTAGE_OUT] = direct;
>   		info->m[PSC_VOLTAGE_OUT] = 8;
>   		info->b[PSC_VOLTAGE_OUT] = 0;

I don't think those changes are needed since both chips appear to be fully
register-compatible to other chips supported by the driver (specifically the
generic mpm3695 entry for both chips).

Obviously I can not say for sure if that is really the case for mpm3690s_15
since its complete datasheet is not available, so my statement is based on
the code above.

Thanks,
Guenter

