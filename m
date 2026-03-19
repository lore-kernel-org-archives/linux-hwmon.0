Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADA5396B68
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773944460; cv=none; b=jDnAuThxGqxaNaGG2XqjPXuJKA3BkQxWrIQud8UCugFbZjiyu0w2uimAiya0+QHpo6o2yBMjGd9uqnDmUPtwqPCL+nRghoegxvF2HL2cJUOU7aLXbHkQGhZhzR6gsiJXWDGdHn+2Rm5vIaZoJAMoa11I/xNckma4AgY74KbJ9jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773944460; c=relaxed/simple;
	bh=xLp5nerlY+dL4zLc/Aw4YGKqpL2yoqHnQ/iRGy1O+wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDjeOe+3ewXuKXD8H4eKqidbpAcN/5pvvq41+G7tZ3y//lI8OZyUJykSmdVkjpUHIgifS38/m1h1/kcdJJwr+mgMKqEcfSaB4OtJHqSR27jjFvSkhegcXg77UK6uVRlz4xQAGgx9oWETXSRWirD5ckUgbT+wBoQ6v/c/zlRtilA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlBxdj/U; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlBxdj/U"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35a1f3f07ebso666061a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 11:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773944458; x=1774549258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=waGlNDzVjeptbexObWtVTHYHPkYJN1y+VrcTRjBpPQs=;
        b=YlBxdj/UX66u1Es+9rXiMPkvwhtzUvb16VLSoOW1UPZKXhL497/yxrmC0YPQfK3MeH
         lryT04Mmm1nnXiwQ+I81tN2U+xXluIihqUJt6AJcoLrgtEUBOmC+dL9WPn4Jt9mzq8ai
         AQZy3jEI1uhNiZxgO7RMZgNXmX6Iw3zy+h7FJR1tR6xJUVR4vC1jpP/ityq95mFluvvA
         NIt6TRo9X+nNQUIuig883vQpOcRjXHKmsl2bjvkVsM1kJ69YOmaecQkRZpKqofVHSJ6i
         b+ok0/733B/w8JrKLL+UgfC2ozP0Mc3StAop7z+eY1Cw4HCwYYRgppnoYPxwUoXWDeSo
         UgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773944458; x=1774549258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waGlNDzVjeptbexObWtVTHYHPkYJN1y+VrcTRjBpPQs=;
        b=J9gVjpIKBVOWZeoggh1dc32gDro4PTjBd4dPOgA49yHVqAsrliPZocB9dJFFVTgCXw
         2/6HhpceYutGnPWxGYIntpUNHpps1OVsLnChB/M9aaAimzK+NwA6wAvYLjesrrlJZsLr
         wrQfg9TCp5u2FbteCc7fMUPLi8resU4nEjyQ109Vcpufy40VBG1eVZrBPuvqqWqojNA7
         98fSLIe1yC7Fo1f8ZTRx0k4dEWWZ532lC24Zf48VKmOwsyGrBS0ali2Y9NnYV/D6mLs8
         ergYBmV8wfXHjRTfpyuKApzb1CQmGU2UpuKD/xzFUbr8LLSUIt2ocDLvIPFbUgM9LyiP
         s2jw==
X-Forwarded-Encrypted: i=1; AJvYcCWrS0Y9ocy3PDvwtiFAsg271e1C7NB15c7btJs13vVfPgs7QnZVMpMIS+MtPp+D6vuF9zoXU/c3gxBOKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybzxJB+h59Ns3ZIHLCTxm4QCre0HlB1RaQ8f8PfRzgCDLXuA46
	CBH+6mr6zG1rr6w/qQP4mb3X5goB4fynWrbtkZpTcsrHwP4pFh2BY4nHJUtGUg==
X-Gm-Gg: ATEYQzw91+nE1B0S53lPzErl65LJLNHVLnD+8ywS4pwgCgUS7Vj11H9BDDjwBO2HtjL
	j+ev2u84Tioc3FAlejHJbxkOV/vOGXzslcBr5ANXSPikg/Hjzi2WaKcEAgLrYe4WkH1/DqUYq7r
	XZCN3uZQqS+8aPEogPG/Gb37EvfSQ7VJVMwVKLOfqbdUMXzNeg7LUchrIW3aOfYZiJB+QdaxSOf
	gMbwcj20B+yUcRsY4PHTsIu1wOXEAWYGK9QHxQmSrt7eUwc01cKy6xZQAwFV5Qt71LC/B5s31La
	rKv/KnCfe7YaTLfDim+yLRIOTZLHXqYZwvXZxQPAu7zoGX4BfPBvaIUiFExjRhfh6b6KD/mW0ip
	E70ntdgo6+4fgDD3Jq9DAt+VQvM3BJcl+nUQtWzqPzafTUFM/LUyoEOao8nJLC/SR7zC1S31YXD
	qzmBbGKF4rgxoyOpjt6ZLRSthbFkuodC4H77izC3ISRS673YyLyjgywAlyIUEN5PhJQKxUiznvq
	fDllj0HbQ0=
X-Received: by 2002:a17:90b:35c3:b0:35b:9aaf:21c2 with SMTP id 98e67ed59e1d1-35bd2be72e2mr137559a91.13.1773944458271;
        Thu, 19 Mar 2026 11:20:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd271c674sm40002a91.12.2026.03.19.11.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 11:20:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8e9a351d-af3c-4a66-956b-9adab716de9e@roeck-us.net>
Date: Thu, 19 Mar 2026 11:20:56 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hwmon: (sht3x) Add support for GXCAS GXHT30
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1773920314-17755-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1773920314-17755-4-git-send-email-zaixiang.xu.dev@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <1773920314-17755-4-git-send-email-zaixiang.xu.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/26 04:38, Zaixiang Xu wrote:
> Add support for GXCAS GXHT30 sensor to the sht3x driver. The GXHT30 is software compatible with the Sensirion SHT3x series.
> 

Line length. Please run checkpatch --strict on your patches.


> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> ---
>   drivers/hwmon/sht3x.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> index 08306ccb6d0b..4384c18115e9 100644
> --- a/drivers/hwmon/sht3x.c
> +++ b/drivers/hwmon/sht3x.c
> @@ -934,13 +934,26 @@ static const struct i2c_device_id sht3x_ids[] = {
>   	{"sht3x", sht3x},
>   	{"sts3x", sts3x},
>   	{"sht85", sht3x},
> +	{"gxht30", sht3x},
>   	{}
>   };
>   
>   MODULE_DEVICE_TABLE(i2c, sht3x_ids);
>   
> +static const struct of_device_id sht3x_of_match[] = {
> +	{ .compatible = "sensirion,sht3x" },
> +	{ .compatible = "sensirion,sts3x" },
> +	{ .compatible = "sensirion,sht85" },
> +	{ .compatible = "gxcas,gxht30" },

As mentioned in the bindings feedback, those should be explicit chip
names and not include wildcards.

Also, this is doing more than advertised in the commit description.
It adds explicit devicetree bindings support. That should be a separate patch.

Thanks,
Guenter

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, sht3x_of_match);
> +
>   static struct i2c_driver sht3x_i2c_driver = {
> -	.driver.name = "sht3x",
> +	.driver = {
> +		.name = "sht3x",
> +		.of_match_table = sht3x_of_match,
> +	},
>   	.probe       = sht3x_probe,
>   	.id_table    = sht3x_ids,
>   };
> @@ -948,5 +961,6 @@ module_i2c_driver(sht3x_i2c_driver);
>   
>   MODULE_AUTHOR("David Frey <david.frey@sensirion.com>");
>   MODULE_AUTHOR("Pascal Sachs <pascal.sachs@sensirion.com>");
> +MODULE_AUTHOR("Zaixiang Xu <zaixiang.xu.dev@gmail.com>");
>   MODULE_DESCRIPTION("Sensirion SHT3x humidity and temperature sensor driver");
>   MODULE_LICENSE("GPL");

