Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748151BD519;
	Sat, 11 Jan 2025 22:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736635508; cv=none; b=NA2deMxsnjp5RSVA6M8+EO5P6Fpgy+DXYEoZgcvRKjcHeA3Pfnye/Pqaiq3uYJ5VNHC/N8ChTM9O3u653Hdm62J47RKkjJN/LSAD0BtBhmxZqYJjrZlIfqaXGMDqBi+dNhmLuu/ZTDaZHMzakYH0l7JafynGmeSSiYCOcgbbyig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736635508; c=relaxed/simple;
	bh=OuF1DBNjktO+j3VH4grhShjnFkpvY3tANz5NIQik5jM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHkAh3hzeAAUSakJCkQdEEEav7grNaZY7iW15lsU2K6p1u/nSDzCov6kf6HLfgT1ldYjaKr1n92CyKs081DKwdEDsA/XSnKkOksvs4jbzzeTf9gEIDDoEryo121m5BrJmex0xSAcUgDC4JKer090tq2OS8haLSErtneCXXVoFp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fok4dvxP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fok4dvxP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-218c8aca5f1so66821635ad.0;
        Sat, 11 Jan 2025 14:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736635506; x=1737240306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3c+MC59cltI83Rp0W3IJS/Fp68qTFA5+u886Rvk5aKs=;
        b=Fok4dvxPb0GAK/aO9uzA3EXHYNB7WAlQq0MvpLEDTKgiLj7/lggKQZp9+30rmA0XXR
         IywAeTZ4ZSmyG8Wx+RjRmyfxAI+iZi5DaChhY7DrT0aarJED5iFNhqrHoOjLZs31hFbI
         l9tnYcZacOON3qx7/wkUnnad1vvnBoJFwxaBFJKKaSTSEAu/PBzHpgGEwrfBj3RQ0T8J
         dQ27GoNmSRbKx7A08BWFivfJvq8EL3m171ZSS59UDiaiVarKwu8eW7V5Gy6z0nfgAZeT
         5r7bfELxDRoDS4OAMhh6gzz4RQg93AsOpXvq/bwIwW7R90+gMKz3eUg5UiInrrfoOHPp
         ZA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736635506; x=1737240306;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c+MC59cltI83Rp0W3IJS/Fp68qTFA5+u886Rvk5aKs=;
        b=W6OAMrU5LbYQSwAoh0YPSnwUtV85gZeBCnScvrYCN1BrWXVU27GR9cIi+T8D9WywQ8
         v9d7ppNAC9pa2FQXqM9Hbf3Ipa68rAk6MKUrFHF5F8tMlz67YJebOEInuIZ/ZaCmwd5i
         NxvrNLg0KeM0DdP4G8eUtt/Ek/CI4cnbpJ/dtRh3kAqLlz/GNpe724nBi02iObHxZ7In
         XFRE1LzMEJT44/UygFM3SmayJP4kH1ln3RqrJgkPXGVBylcFPkbjkKxZIH6Nof7vt37J
         RoRG1Aga0nDytz43tQYy/vTbvxUQrJbd/yhMmAaYjUoWZD0pTgwHjcTP7rFFlg++I7jA
         i6dA==
X-Forwarded-Encrypted: i=1; AJvYcCU77y+uWnvMJ7IbfcV8kTI56gMS3+SRoNOMmL5VGIwaFgntD24EcDFGrWVmoX22i8nzFL43BGFa4mS+@vger.kernel.org, AJvYcCV0BLTtDNO/KYBts/e8Sp8eGqIYZx7KSFyrcDJNX/S/JJJo/ao36AFdsz6pOaAdF/agmuZiqviwKvYtK3mp@vger.kernel.org, AJvYcCXzN+CFDlCP3c7tTwgV/wCJulChWvCPbojbQBDrAmI1KqKG4DO2LBg5CyEalhqpf2cEn59k807BZjFid2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuwdmTKgZbACFH5xnCxeg6abhb8q1U7CR6Zj+iHrxOu1VlKqT6
	zKiFlGL5b7xpV9E2kDFFlPW7aYsPwmXyjfi2rTD8o24AosM+H2F3PEX5cQ==
X-Gm-Gg: ASbGnct05rK6bkSQ18aJqmLAOoPBgtiFSHVT95Gxrtuld4VHEVKB+oEIwx7xzmXfCN8
	5Jc4SsaoVOG3wdECSO57imr+mQ1iguGc+ilQbgG+Gfjr8MTNBrQLTgdvGt+rq3/XcJ40e1t7v3M
	qO/bWBLnYUFR5SvswnMfNEuS1qPLjylCdS4SvojvYC96um3AHOIhrt5yC0P2sLOAekItOtn1TEK
	q9i3fQB94yCqFbY6XPE1mTSJiAMd78rnZ6YIfQMb8r0Gp+9ese3AT4zWeU7Fri0506m/wyMFRfM
	WRY2mhluk0eHDRtLxS0We8QsEdp2qw==
X-Google-Smtp-Source: AGHT+IHZ0c5wXMx6YKekzvg0dkM+CxlQgFjx1Lxj7k5RtxG6zP2xUUpODrI87JjF+Cb082/DMnUmvg==
X-Received: by 2002:a05:6a21:38b:b0:1e0:c50c:9842 with SMTP id adf61e73a8af0-1e88d361a43mr28100481637.31.1736635505718;
        Sat, 11 Jan 2025 14:45:05 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40568dccsm3470731b3a.47.2025.01.11.14.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jan 2025 14:45:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <34f7e4c0-5385-442f-a4a1-7813b40c40dc@roeck-us.net>
Date: Sat, 11 Jan 2025 14:45:03 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm
 property
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250103101448.890946-1-peter@korsgaard.com>
 <20250103195810.GA2624225-robh@kernel.org>
 <dbf7cdd3-c5ab-4801-be85-163124b8a898@korsgaard.com>
 <20250106173805.GA501301-robh@kernel.org> <87sepq8mcc.fsf@dell.be.48ers.dk>
 <f6ee420b-7c3f-4a21-831b-619fe38408b5@roeck-us.net>
 <874j25dx9y.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <874j25dx9y.fsf@dell.be.48ers.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/25 10:24, Peter Korsgaard wrote:
>>>>>> "Guenter" == Guenter Roeck <linux@roeck-us.net> writes:
> 
> Hi,
> 
>   >> Guenter, what do you say? This way we don't need any new device tree
>   >> properties. I personally find it less clear than a default-pwm property,
>   >> but oh well.
>   >>
> 
>   > I would not call that "default". It is more along the line of
>   > "If available, use highest cooling level as maximum allowed".
> 
> Sorry, what are you referring to exactly? The commit message? The change
> is about the default/initial pwm setting, there is nothing disallowing
> user space to increase it afterwards?
> 

 From the current probe function:

"Set duty cycle to maximum allowed". If you dislike the term "maximum allowed",
please consider something like "Set initial duty cycle to maximum or, if provided,
to the highest cooling level".

Guenter

