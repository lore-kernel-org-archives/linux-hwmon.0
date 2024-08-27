Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A7E179A8
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 04:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724731266; cv=none; b=hIeZlptsHWsk9xawfpeIffMgcum+OjXubEFHUMd/TMktcK/YiNl2kE5Eg7JX2HAaplLTT3+RKIirN+Rhgj46S4jXh4+exftOJBC55THLP+B8lrIBDaCWETUWIyG6YbFhkvC/gUnm+aT0UDublOEkGss5Vuasbc4Hk/ZbPKkwick=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724731266; c=relaxed/simple;
	bh=p2nLf/VmitTe+GH/KMMqwooZcZyXg+4k/UPUulyhuCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fHUfTwrfByIjri4ule1Cbr1xqL2HKSwDaxQ2xBuWSh6M93xJHveJc/Bs1jHc48m7KvjI9SVa9yiuqEVMk8GDN+qgYU/zG6+lY/jvwVxyR6RV9g7SpHZulMzk+mWzn5n0QH/d7OHId3z6DR+8JMHyDp0+rUikBbsMkfWVYIsYwgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VT7Z2WRI; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VT7Z2WRI"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5d5e97b84fbso4083099eaf.1
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Aug 2024 21:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724731264; x=1725336064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uQEXbPSwXfolVaTNF8pFBv4C5nehlvOIEpJyunOBBGg=;
        b=VT7Z2WRIoNcd4UCoCulImeMQsM2y7HoK5h/53Vhm6wHjBv5O5zUxkOBGd2fLtMRug9
         xD2MIFFUxRkdoT2WKMibWHdiCLHY+k3mdsaINLACLQ0hWamCbrdlJQFHv/TsM/NvGxSa
         xyhpAaIXxONqLjbmT7PFTxQ0aKfOqDbUjqaozic16IDKmU2+5y9nwdQRij0DhXD9tFJi
         WmplotPNOx2QJzSsQ1w4Z+PFzuyKNMAUe9warQSL74aOibKgt5rBEeOkei+7cT0gQrmb
         zdedTx2LGgeoYttMSZgDNwYigRTWbcLBoM4xDbNneaiYoIIHFDGsTPv5+L+LazyQlxfZ
         VYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724731264; x=1725336064;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQEXbPSwXfolVaTNF8pFBv4C5nehlvOIEpJyunOBBGg=;
        b=Bfwd+3OOCxAipQSWBIWbj0fcGvng17BYIsKvMuwAMFqQha4UAZOBfbNsqZ0ERuDy6g
         m65Ta4wDku4gwAjy8sEU6Rbm8jiNN/kP7itx4SSTI2VrwNnd7am13MzLueAbk0hKh9rC
         Cyzehm1P/2x0QNIjozY7KtBsIXxlkjkMU/MtqvnPjLKixUo1ghzGk9O4Tvvqh/N7YJ6u
         1Aa8viL7dlvywpx2Yosmp+FxKefQnJT6q7hWm4VHDWrmhAxIIsCFSyjTXScSZBX+gKK1
         atLRVc9gSg3Ur7XjUCSW8EucS1+qp03VFtLbCwtah8SeFyrVBxi81Whn1VuTCO5puO1f
         Dqkw==
X-Forwarded-Encrypted: i=1; AJvYcCXdljUWsnJIzElSro+A4/xePwZAmXbBPbv8jYuplGEYxSH0n2tBlbdZRCFBUPMIH7sZElOmMCM5QYKLmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YysOeXM/AnwUCjJ3PHyl1VH6R3+7XVN3JrPdSgwJ9ndXojyi1Qo
	HTOwYDQkolIXWQBIAEa4pjLwuyO1Uhf45jJhZvyO+H27OAg8Ti26
X-Google-Smtp-Source: AGHT+IEqntLbysw6zucEJfpwE7mYVJ9LSt7xN6jDox92P2PILznjTYSTR8F5638pKrqD/MAF7Cm9qA==
X-Received: by 2002:a05:6870:638d:b0:260:71c4:f33a with SMTP id 586e51a60fabf-2775a0385bcmr1909078fac.39.1724731263820;
        Mon, 26 Aug 2024 21:01:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434254057sm7708662b3a.77.2024.08.26.21.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 21:01:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b41a6bd9-dea2-4323-9bc3-e5c48def99d9@roeck-us.net>
Date: Mon, 26 Aug 2024 21:01:01 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 0/8] hwmon: Simplify with scoped for each OF child
To: Jinjie Ruan <ruanjinjie@huawei.com>, jdelvare@suse.com, joel@jms.id.au,
 andrew@codeconstruct.com.au, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
References: <20240822062956.3490387-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240822062956.3490387-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/21/24 23:29, Jinjie Ruan wrote:
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
> 
> Jinjie Ruan (8):
>    hwmon: (aspeed-g6-pwm-tacho): Simplify with scoped for each OF child
>      loop
>    hwmon: (aspeed-pwm-tacho): Simplify with scoped for each OF child loop
>    hwmon: (ina3221): Simplify with scoped for each OF child loop
>    hwmon: (lm90): Simplify with scoped for each OF child loop
>    hwmon: (nct7802): Simplify with scoped for each OF child loop
>    hwmon: (npcm750-pwm-fan): Simplify with scoped for each OF child loop
>    hwmon: (tmp421): Simplify with scoped for each OF child loop
>    hwmon: (tmp464): Simplify with scoped for each OF child loop
> 
>   drivers/hwmon/aspeed-g6-pwm-tach.c | 4 +---
>   drivers/hwmon/aspeed-pwm-tacho.c   | 8 +++-----
>   drivers/hwmon/ina3221.c            | 7 ++-----
>   drivers/hwmon/lm90.c               | 7 ++-----
>   drivers/hwmon/nct7802.c            | 7 ++-----
>   drivers/hwmon/npcm750-pwm-fan.c    | 5 ++---
>   drivers/hwmon/tmp421.c             | 7 ++-----
>   drivers/hwmon/tmp464.c             | 7 ++-----
>   8 files changed, 16 insertions(+), 36 deletions(-)
> 

Series applied.

Thanks,
Guenter
