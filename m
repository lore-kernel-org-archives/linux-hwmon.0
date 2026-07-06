Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F243A3E9287
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 16:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356694; cv=none; b=eoNVdSE7N+rlw10muLqnfGqyy7ovW5bQgUewG8e8sZDP1i3AJd4qmsyLzD+KdTr8ibLijkbzpWsO567u76sIZooFjOHCwKzeTVTX4KwjMs04tX4zeKa8UmPKDNtgsBWWEZzZ4OQpeVpToiZo74RQ7YdjypkwQiiSd5sgaGPm0B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356694; c=relaxed/simple;
	bh=QryJy5X/pq1M/8aPlp2uX+jXK7FcV5hVFFwpTtvblns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKszIiywWpGPSQ2Z64hppHgqMhSjCI59UHVQAGC62gN5JGNrokyJnlGexcwoqhSJPM9g+wSigYmZ34zgn5HMCvixAIRHsC1UtOIGTJ3qEXqGKBSop1gqvXgyRVOB/3GPWcSfu1olnHJSExpkQaZfoJTuMhdcm+VXtbt9exwHSW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksmdEOwA; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksmdEOwA"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso4353148a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 09:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783356692; x=1783961492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gHYPO6Hmln8s8emIzU3WAqi7i4TZ26A9EJUpruVUFY=;
        b=ksmdEOwAlxbck9AUlPquWfrmSpE99vRNecyr1lj8+UF4ZEOMRVZRxeMO+5SELc9+Pg
         kXqM1NpmqOdXdVh1hQjCqNKDGjbaXFC1FzOD8qiTfijrVZy77uPAjgYgJNYGRrEK4qW2
         h7q8vFlXq6W0+LvLkZ8VJZ2cjhDhId3CNyF+lrQLeFJ1Nj6j+e1Q54PNLhxbdtQNHAzU
         0B9EKr+sC4aaiurXNJknKZ2t71Aqtgj4KVeGLU2XYdJRlGekmCLDu0OjG59GN+iSzpLj
         0fW2jzOycXDrg+BmVf50BibX0fOoAr/Ena53m52Nx/1imxoHAUb0OIM4W6UYffEGb80W
         O+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783356692; x=1783961492;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/gHYPO6Hmln8s8emIzU3WAqi7i4TZ26A9EJUpruVUFY=;
        b=ne3QzDVCAkNynpnqjUfhsGasUWBVqPXwHebM3+yYhr+aq3yGmAAki6cDNyHoQN66bZ
         W2dO/Abknys4YgzTtXrrGy0i+5B2SKs53aQnKd5bugPozq3x3tYhQm7V7mknQRi02Gdx
         PoUg+pgFxC7BurkvvfSaG+iQodHqb4ccQSjyCdjEO2c9RSEEWo9h8btK8cOfMiy8OUj9
         XfeRv7kmT9bRWO4R7TKbjoY1AzAOrwDp2TQLii3OgEWjBZNFLz/BOvl8PO2AbQMsgbGp
         fUGk+ubvI9Rkd5kK11CR8ieSP7uo8rxt3nh8IbKqqB4RxR1v+pSX9GO58ACAxKhh7Dvk
         GwDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpb/FC7gleWLCU1uZ+NLKHr7oT1LCnMSh9pevOKL5JB6QZm0NvVtEBH8hcKQkA27CnGp9tksy4hG61FPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUJLAyfwOm9eEviKtj/NuYLOpaifJIIGbkUmNjahzmA91g8SER
	lv14Y9FMxHwPPxd6M1Qvst0y6k0QyoWQkoINOWHtOzM2nv8f0B7Ww2LG
X-Gm-Gg: AfdE7cnPu2us7MaPlPIqEWj56jXnWMHyH3qUGs2WpsxVvTdrj8CnNdo6IPuhnu4Y02R
	ysan+Yfj+v7TzaoUdmpfMDGuoFrU6X3Mq4A25vE6orbzwM/k1Z/YeVKHm796wieHmDrm3FYpw3B
	fMkxvpaefbPi91T8m0o/HF/h750HW9Hdu4nCgOoSe5hIT1fR81ZabCyH9eoBTGket3DaKMI8jML
	qbIVKO1HbhMlkTU7vfFMoSVNY0ASyJqo8gYX7U3Kdb4OOILE8ZZVV2myDvs2Lu7diDoOVKaf+zF
	ib4/VFlLwebF1t04wPgyYkUvR4+vrxfLYPBjxtTxvjV5dCKb1LC3c74PXgCowzucAc6KgEHwEzU
	mh0yZ6CE8Zze2caPhU4wS/sdoksRFGjNcB8N8zHVAdctpu6EkitWR6a6ZMv4FKccAR0viRPRde2
	WVSyO3Fj2cUcErhZL+AyFEEoxKqGCivOC1+R5XRYrmoDg3yFdjdYDDy67oTwkDvg==
X-Received: by 2002:a17:90b:53c3:b0:381:abcc:c8e9 with SMTP id 98e67ed59e1d1-3875650be6bmr1436934a91.7.1783356692124;
        Mon, 06 Jul 2026 09:51:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3812801e8d6sm5441077a91.12.2026.07.06.09.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:51:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <34f8c1fb-e23f-41c8-9327-1646fb4ec84b@roeck-us.net>
Date: Mon, 6 Jul 2026 09:51:30 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: emc2103: use min_t() for explicit type in fan
 target clamp
To: Animesh Rai <animeshrai853@gmail.com>, steve.glendinning@shawell.net,
 linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20260706162519.6087-1-animeshrai853@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260706162519.6087-1-animeshrai853@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/6/26 09:25, Animesh Rai wrote:
> Using min() with an explicit cast on one operand is fragile. Replace
> with min_t(u16, ...) to make the intended comparison type explicit and
> avoid implicit type conversion.
> 

Sorry, I have no idea what you are trying to fix here. Both parameters
are u16. There is nothing "fragile" about that.

Guenter

> Signed-off-by: Animesh Rai <animeshrai853@gmail.com>
> ---
>   drivers/hwmon/emc2103.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/emc2103.c b/drivers/hwmon/emc2103.c
> index 27dc149a3ed9..fbb1b4025eb7 100644
> --- a/drivers/hwmon/emc2103.c
> +++ b/drivers/hwmon/emc2103.c
> @@ -348,7 +348,7 @@ static ssize_t fan1_div_store(struct device *dev, struct device_attribute *da,
>   	/* update fan target if high byte is not disabled */
>   	if ((data->fan_target & 0x1fe0) != 0x1fe0) {
>   		u16 new_target = (data->fan_target * old_div) / new_div;
> -		data->fan_target = min(new_target, (u16)0x1fff);
> +		data->fan_target = min_t(u16, new_target, 0x1fff);
>   		write_fan_target_to_i2c(client, data->fan_target);
>   	}
>   

