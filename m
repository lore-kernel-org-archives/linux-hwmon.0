Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBC033985
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Feb 2026 22:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770242952; cv=none; b=Wjz1uQiXiix+b7HdmQ8NScdwU6kKDcg7k0akWnVT8elujin+wNAA8jpnaX5ENcGyZ/igBjTPwY8jUC0Cf3QJT1PQNpT05awVj0Gc4yahja3+RXZ7wcIM9O0MG1xl4l25wye9vFBl6yDpj315C3yNQpOylcB4YgAanjZiL4G7hGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770242952; c=relaxed/simple;
	bh=jzVXfpj2TtaJAU8n3GQn5GE8ngNR11Jg7Qx83YicUeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mNEfDWr/LhsL/OSrbIIiJforTM2QsNk4IUNtmRVu2As13+Erv/MggyV8b0Viubht3UGZJSl0qHUqYOfXAGJOwOqNBVRl5PcOK9dwQMQAMJbFbNOPNTgKx8Gs524v/lVEeU4qY2Z4tFNEJI2/Z03hItzvBmCwrROciAHMmIDsPRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XV6AoC1p; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XV6AoC1p"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a743050256so2159475ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Feb 2026 14:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770242951; x=1770847751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6+tFel27j/+qLvMq2SC1oIZUAR+XBVSVb+IrXwy2KNA=;
        b=XV6AoC1pnwY/5Fk8x/q+RrOHzvXjSZbEmmUETLO7XtTH/tsGX+VFHc7LsetrspSEBl
         C7BYLFhtmOWKksT3SF4BSIKv3ZRzMrs8zOPOe2l3W/o2PwZr4evLAJ8XiLdvWlhzE4Fx
         giwFJOCJUj4uhO9+qAf+wn076immUyOHbbEtlu4/V91/X2h0pnPbY35NhFmywTYTtZdD
         jBjfmA1WqottXHejr26hrOxdn5l4zgRa7If8T3qT3bKC0XsM0CXhQ7nCMFJfK4sfFYv4
         jp4DeLLDnZQtT0R84Hkscwt9fxLUJOlIH58METDUml5uP6SbkJu1oVcmpmxO0jGClbev
         2/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770242951; x=1770847751;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6+tFel27j/+qLvMq2SC1oIZUAR+XBVSVb+IrXwy2KNA=;
        b=lVLAKM3AA9etW3JbTx0hly4iaBRG2/30KlHUJE1LUgZHlxVEsD4+l098JuRLj/5vu0
         +r525oBMTm//uwMXCsMebcE4ue+D4JJ9Vq8rveSdkLZ5I9xe1vzxtc/K5bdu1e3eD9SN
         K1GB/bDSln6MvjSIMTM90/oKOUa0LrHYhon+eRIry/iwOdu1G+ZTozhS53QaXftGXiDV
         1gejZgHQf66qIAOLx3iuPPk+P86n7DJjh7GRcoeI2t/Z5uVsJxpNOg4hNHziAxS50NGo
         i2tSEOtra1F9WkE/9Wo4afCA0OgEYgdsYHRXANO2+0/fpwj7t9jy656D0iZRpGMKflex
         sHHA==
X-Forwarded-Encrypted: i=1; AJvYcCUThSnEk/4O2byFkVCPXafJbG1LtdN4Ttm7m5/mJiCa/v500SHBT4Yl6VYvWdSBDgp6yDmRM/vj7D5uSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye5XUVWhF0Qn04wVA+FIvFJbhAoKl38Q+wBduOfKGOWIKzn+Kn
	8AwZY60vS8Cp3p5eWJHINIBHrq2/pt7PmZbFpVJKFC5+NNczeJ6yzgHaEW+ZFKhQ
X-Gm-Gg: AZuq6aIBz/GoUdcA8XiJkCEDxQbW90xvgDSv9D63GfVIHdS5m65C2WIg7xd9hkkJTDf
	AI/4stdJj9emRqzNCo9WwPhZgf6xTDSRLdCuBZPPqzknyOmmGlw76FFMfQX9CzTMdF2X/rKHmtb
	wxEKLaQ7uU8QwVn7eN4RKSp2JrpnLD2k5vmX9wegF8gVa45IlPrmIR5mBZB0KUku3ggg+nIzGCs
	BqbCJtU8hwH1FpmqZwDyepZXuXOMdFOD/KPj7mixkQwT0WWdiFSQF3XOvBz0j2zDxZOmdaW7ntR
	+yctMoJcVwFw/CtZxOxIXo1OLnB5wu//e3KSkPAm5Ucjhe9lRqLJtYufQUBTxmAeFwl8iTscoVy
	0CFMeadVZ45iaoeBX05MtdN3ARc6JqNxvdwNrTMnbbQAzslT3acOMV2/tc+EdOrAX0+PTEWQwKW
	2gxxVfa23NTV4d/M+iEiVGwpxJGl5kOEToOKjTLvlgFEowQyFMFNrNzhyghf6m
X-Received: by 2002:a17:903:1983:b0:26d:d860:3dae with SMTP id d9443c01a7336-2a933bc9a9cmr44488295ad.3.1770242951230;
        Wed, 04 Feb 2026 14:09:11 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93394e5d4sm30497415ad.56.2026.02.04.14.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 14:09:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3887feb9-344a-43e3-935e-8d651f9b923b@roeck-us.net>
Date: Wed, 4 Feb 2026 14:09:09 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: nct6683: fix memory leak in
 nct6683_create_attr_group
To: Joshua Peisach <jpeisach@ubuntu.com>, linux-hwmon@vger.kernel.org
References: <20260204211543.70029-1-jpeisach@ubuntu.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260204211543.70029-1-jpeisach@ubuntu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/4/26 13:15, Joshua Peisach wrote:
> If allocation fails, free prior allocations before returning.
> 
> Not tested on real hardware. Did not update rest of file for style
> changes, only updated the NULL conditional checks.
> 
> Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>

Allocation is with devm_kzalloc(), so the memory is released after
the driver is unloaded, which happens immediately because the probe
function is about to fail.

> ---
>   drivers/hwmon/nct6683.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index 6cda35388..365f6b99d 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -431,18 +431,18 @@ nct6683_create_attr_group(struct device *dev,
>   		return ERR_PTR(-EINVAL);
>   
>   	group = devm_kzalloc(dev, sizeof(*group), GFP_KERNEL);
> -	if (group == NULL)
> +	if (!group)
>   		return ERR_PTR(-ENOMEM);
>   
>   	attrs = devm_kcalloc(dev, repeat * count + 1, sizeof(*attrs),
>   			     GFP_KERNEL);
> -	if (attrs == NULL)
> -		return ERR_PTR(-ENOMEM);
> +	if (!attrs)
> +		goto out_free_group;
>   
>   	su = devm_kzalloc(dev, array3_size(repeat, count, sizeof(*su)),
>   			  GFP_KERNEL);
> -	if (su == NULL)
> -		return ERR_PTR(-ENOMEM);
> +	if (!su)
> +		goto out_free_attrs;
>   
>   	group->attrs = attrs;
>   	group->is_visible = tg->is_visible;
> @@ -481,6 +481,12 @@ nct6683_create_attr_group(struct device *dev,
>   	}
>   
>   	return group;
> +
> +out_free_attrs:
> +	devm_kfree(dev, attrs);
> +out_free_group:
> +	devm_kfree(dev, group);

That defeats the purpose if using devm_kzalloc().

NACK. There is no problem.

Guenter

> +	return ERR_PTR(-ENOMEM);
>   }
>   
>   /* LSB is 16 mV, except for the following sources, where it is 32 mV */

