Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FB23DFC92
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 09:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008200; cv=none; b=V+99rIb3yI8VjgYbzMsvvrveRbDghxYTcHz2CboBa6UzD5/dQL3m7UWPpu5n2HgqwWd9UldeuGZnWu68Zok/GwAewazm6lg9BkcVVheee/l+SbNZkZ4INEJhJCzQLhGEBzt9PoYWSKdJpytMBmqyO5TWgX7baIURlzVZHkIGmzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008200; c=relaxed/simple;
	bh=9DorRpsf0X3NptiVofpiue9g3f4qUK4biflyT9GfLW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8f+CQ8ylfYo/NxrIM6prlewOddPkkS2gy5OBJIaOFj8qIXvNJAFkUW+Pnu+VCnY3Zkhx1bjXhJD8Lkme55AUwFMNX8Eh+582+ZAWDeENcbNk1BJIulpfsH2jRsYiB8ZCN3yYrrjdWY083JGStHW13zsbCK744KiHylGNovkfuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGmSenRv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGmSenRv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc891373e0so24372345ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 02:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008198; x=1786612998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKnbS8RtB8OjH4J9qcWvKTUcp+LBGTFP36erKPzfgK4=;
        b=VGmSenRv0oDHxCppJrLoyb0TG/3Ktu/ImF6PlYj6svq0a0IAqGra2ODAXQFAA3lflu
         fbFoLHH5osw6cnkllepDnzCInKSNKliGZjqb1sREg+sdbfp5jRuSzS0TGfeFJtPOLgDz
         dOeB6829afOS0wT/4dXx37gY7UdifJ1oNXp1QbPRK4Ech2tHImGi/jAYdcv4nOc2RWPz
         i7THcAQAIJ8sQWewXI58jyK3z8rSTNqfMOGgHGKNP0jvldKvVb99b8t7LrP52PJmzQdf
         APfzfflHqDDPZ89m9G+4QqdpRBgR/xr1yZU8cmQZH43O4qYx84btK1yjdLtHl/JMKHHP
         3nIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008198; x=1786612998;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gKnbS8RtB8OjH4J9qcWvKTUcp+LBGTFP36erKPzfgK4=;
        b=W9tM/LfVYKwo0DxzyJm47hK864/Optsm496+84yMSo9zpB4FRj9w//InGfRCtXy218
         mGdZluozzn0J33Yw120pkLA1tlwUPsipKo/r820hieyrxwvChiaNl5Q6VrGt9TFEN9HY
         mBqxztVf28B/0I4PQmnVnpwF9G6TOe6ncdEq+itkpcwglafzI0i1H72UYhfNhXIxwW+p
         Vpk7GhHH/jBs6L+FaUsFHUhbmoeZo321Ez7PqzDogPOA98KUhNJciLqIdO9coIIJBZjH
         YZqTT114hoLPvELzAbTPx3tgNht1ZUUnOU1cNJEeAUsTOyM+ceA+pzd1RffWR9Z7jF/v
         QvAg==
X-Gm-Message-State: AOJu0YyPX2rwlRXP+9xQVG4segPQ8MeX+v5EzF3YO8PS0heF//TgZTYd
	o7+W2qgQh8lXZrDOMf5SVDDhWTkh1dXHqGx8AR30tVu1CikCFtd5kJRb20XJXw==
X-Gm-Gg: AR+sD12aHSZl/bLZf9gGefuNFxb3njaCG09iOxSMGNM1QhTVQWu2HfrCFRazh5Y9X1D
	vzjT5FzZ3wLqkq/E+2lkw+BfU6o1AqBR9vuzgNunzUFR389RzhFkaTb+hy5/e/NQ8QZfH2XOmNn
	QwRqohlFjVZGZmMm8+ZNOE3iUlCmOkchdl3xo5mPDxtPu2PqbURWg6jCpk7j6roI3vZ0LK/S/jl
	hnIAYULPwUfcEJL7lj5d1riTnLW/2e721dxa55u7sZu7W4utgC7YsTgxUHTCMiQNQM0tTbcwcA2
	g75Frg1Ltm/MWwXQZWzSo1DrsVsCyL6RTZwXq3GyMETgvgbVLNz0fMTg69HekC1kM3vwHHtoijQ
	4keXBhbWwqa2eSUuVRb+1K9RkG7uUDK2eU7oU/fqJrVcScHotP+qn2nNEU6Dj4DEMBhBxqPPmoW
	gjtF3tfqbebiCVhebjmS8Dl6s7Fbux2Y8fiSEs81HnIws5dqbo+py4iFPYW3BjeoBPj1AXihPW0
	x19MrycuWr2CVuqan+bQYts0oBKC5wRhjMXyVAl14XcVD86
X-Received: by 2002:a17:903:2301:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2d0ca712d5dmr134101115ad.7.1786008198219;
        Thu, 06 Aug 2026 02:23:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f93680sm29393815ad.1.2026.08.06.02.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 02:23:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <20505360-0780-4f74-8627-8135a40d9401@roeck-us.net>
Date: Thu, 6 Aug 2026 02:23:16 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against
 hwmon
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Ali Ahmet Memis <ali@iusegentoo.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260802123653.19532-1-ali@iusegentoo.com>
 <20260806072337.15496c74@posteo.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260806072337.15496c74@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/5/26 22:23, Wilken Gottwalt wrote:

> 
> That does not even compile on a current 7.1.5/7.1.6 kernel. Though, not sure
> yet, what that is. But I can not risk running a trunk kernel on my workstation.
> 
> /usr/lib/modules/7.1.5-arch1-2/build/include/linux/cleanup.h:302:9: error: unknown type name ‘class_hwmon_lock_t’; did you mean ‘class_task_lock_t’?
>    302 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
>        |         ^~~~~~
> /usr/lib/modules/7.1.5-arch1-2/build/include/linux/cleanup.h:422:9: note: in expansion of macro ‘CLASS’
>    422 |         CLASS(_name, __UNIQUE_ID(guard))
>        |         ^~~~~
> corsair-psu.c:667:9: note: in expansion of macro ‘guard’
>    667 |         guard(hwmon_lock)(priv->hwmon_dev);
>        |         ^~~~~
> corsair-psu.c:667:9: error: cleanup argument not a function
>    667 |         guard(hwmon_lock)(priv->hwmon_dev);
>        |         ^~~~~
> 

You'll need commit d1e720c7328e ("hwmon: Support guard() and scoped_guard for subsystem locks").

Guenter

