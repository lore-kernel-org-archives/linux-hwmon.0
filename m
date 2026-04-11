Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7052E3A9D87
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Apr 2026 15:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775922881; cv=none; b=DK1eEWmLN7/iURaoqB8eA68/x1ZL2QRD04rdcSRAhDUeCvkAd8UVCsLIjT0Q17SHCF9B4MLk2fJH/Vr2B5xz5EmEEaDajDPnaZfbF1w/PjrGeGp+swmCy1PzxZXBeWfQwmOxGsBeSkhGCpQpRChSYiVzuoakQyEMHIIGTOqXXw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775922881; c=relaxed/simple;
	bh=vyZ3p4QNZDmYaHVFaAa2c29T/arRXgNKIbADpC/E2RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geoc6wlhleBXqtwNEFDM8mvuvE0ydLvko2c8VsuS3/KVAhc8tzuUa0UhsK7Vqb/BgIcnzT7tvIUoR0TYxXvnR6iC3hUKTBGSp4ARp3riaVwSTbqVGDjt1QCCVnpJ0QjMzX57RuhP9CHawIdZh0ABYZIZVpESj7jBbUXH60EVjIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5FGLWXb; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5FGLWXb"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35d965648a2so2596633a91.0
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Apr 2026 08:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775922880; x=1776527680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KdjVpbQ+mHdJ8uLjb1LbuXKErsPJPIomY1MUk5b01hY=;
        b=a5FGLWXbA+ZrxwwsqjwXzqUXV9wVjVCWmKesO6H8aM5/Ka02nkLd0uxVVl2e7QGmoH
         iQbzHQruqgrqco+l5va1Zhpj3u696v7V1V0+LzmYh4C8RoHrFfOBjBEOm13WndLeFE0K
         z/JYpUHKEeSfMdf5lbt+6YkRP/irSbE+N0Jb/YgVpRs+PWaQ2Wyi93U7hIaGitLaUBxp
         nN+IcubwXJjRGXU0dTmwt7jvngppj2wjLIES1oA3dYS4qivOU20p1HmWoJdRS8LxM98+
         IxRQNG8H/6x+WlrIbyKEez4A4Oh2kJDu8/Iv8EEKB/P8UVqFUc/Dg1Bh0RfNJrZcvGAc
         Mzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775922880; x=1776527680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdjVpbQ+mHdJ8uLjb1LbuXKErsPJPIomY1MUk5b01hY=;
        b=QAEpViR/TFImUE74LY5rmMsGEYMQyU1Eqsqba5DsaEDHcR4abTCrIDlYqR3OiT8hKO
         mLHfCGBY8fLeA9APVTL7yFCFRARkfDu7GrODxhT5XThrkGs8lWl8Job2DM8FUxRhr1HC
         oltp+cYVPWMZ9IjbVrDFIIMnjaDLmh9x+fNP0gY30NGgIzGKHc8eGqPT/fYOcdBZveLl
         RKI7PE9WxiCVC4rmY/YFOqZBCkACWinlk0Hp+mJdGek/y6Jy5PQDgPSNef6vrM0Uwxu8
         Rrr7dkWQyH2qxmAJwuYZS9tWUbqZNjGD0qOQ7CCS/5UzAf/vSNhqM+7alIOJzDW8H6KV
         UiKg==
X-Forwarded-Encrypted: i=1; AFNElJ/DP6ZxehqHTy+0lJAO43UTYBa6zW+BDzuYp4zZKcThY5ia8qy8WPKRHbQMWb2lv9rfieF3qDB4cU34iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJws3rQ2zYbxVDXH63auRkQPnbTZK/ndqtSx4E+cl9C8OhkrLB
	FrUUzodY72RAGOBOPlfDj11L0C539M6/w3MSUSy01J4kUgaXoBBTDcoh
X-Gm-Gg: AeBDievL2VBSR7ssI7g/LXKX5c8TyX/PUaZoqI4achOKPaFcdHKwTq32odlhnONTjL0
	7p3JX84uvmxeYV07Ex8bF1wqxKOurdWNLNtDt+d3oHC6X+Qdh7v6JU5+sqBCZXRyVRBEAAT9wzu
	t8Pdu6C7y9PTXz1aKSz9WFrBPz5vlxg4JSzZF5ox0GuU0fi0KAkt+16Der6sJP4Ae+J1U74rdGp
	D9SoTWQySwtykpQrL+TBTVdQjur436eaEQ5Hy+pqLcY76BAA4m3LR7vdqnX2Du/vN4gEtVmuK7T
	aDp8veVSr/gDEMkXHhMl7WYtC/siC6q86if5oCDJ5CIq8L1JDF//RM0+/JWbAF2bw39VePvhUum
	uDnW1fQKwi4SiGka19rJrNDfc2s5Q1aaQm5qRdN+/prUs3YpUlREpkNi2PCY0+QRqRuNXz2a/SG
	wYxVZhTfZeD4aMugv/E9mri4hzLF4wJlWLIHQkHJIU3SSQSRpl2VB+T4PW5RjO1VvXVcSrlL20u
	Jzi4eC6bm0=
X-Received: by 2002:a17:902:9341:b0:2b0:4fb6:85ce with SMTP id d9443c01a7336-2b2d5a45a0bmr58725085ad.21.1775922879656;
        Sat, 11 Apr 2026 08:54:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f0a39fsm61293595ad.48.2026.04.11.08.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 08:54:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5b695477-8dc9-49c8-ac0a-51c29604fdbf@roeck-us.net>
Date: Sat, 11 Apr 2026 08:54:37 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, nuno.sa@analog.com,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
References: <20260406-ltc4283-support-v9-0-b66cfc749261@analog.com>
 <20260406-ltc4283-support-v9-2-b66cfc749261@analog.com>
 <29b207c8-10ab-42b4-a1c8-988aacc75154@roeck-us.net>
 <2653dc70f42fd015b88e2744da257f6200603b50.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2653dc70f42fd015b88e2744da257f6200603b50.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/11/26 05:38, Nuno Sá wrote:
> On Fri, 2026-04-10 at 16:27 -0700, Guenter Roeck wrote:
>> On 4/6/26 07:31, Nuno Sá via B4 Relay wrote:
>>> From: Nuno Sá <nuno.sa@analog.com>
>>>
>>> Support the LTC4283 Hot Swap Controller. The device features programmable
>>> current limit with foldback and independently adjustable inrush current to
>>> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
>>> temperature rise for reliable protection against overstresses.
>>>
>>> An I2C interface and onboard ADC allow monitoring of board current,
>>> voltage, power, energy, and fault status.
>>>
>>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>>
>> The patch still has some issues. Please see
>>
>> https://sashiko.dev/#/patchset/20260406-ltc4283-support-v9-0-b66cfc749261%40analog.com
>>
>> Specifically:
>>
>> - regmap_clear_bits() may not cause problems, but it is not the best
>>     choice either because the register was already read.
>>     It might be better to just write the value to be masked since
>>     both the register value and the mask are known.
> 
> Fair enough.
> 
>>
>> - I can't comment on the energy accuracy lost. That is your call.
>>
> 
> The AI might have a point. Maybe you know better but if I understood correctly,
> mul_u64_u64_div_u64() will handle the multiplication by using 128bits (when
> available) or if not, using clever tricks. And it should also handle overflows.
> 
> So my feeling is that we can simplify all of those check_overflow paths with the
> suggested API.
> 
>> - Clamping before multiplying is indeed wrong.
>>     You'll need to clamp before multiplying (and then possibly
>>     clamp again).
> 
> Yeah, the clamp change was just nonsense from me. What about about
> 
> val = clamp_val((u64)val * MILLI, ...)
> 
> ?
> 

I don't think that will work on systems where sizeof(long) == 64.
I'd suggest to just bite the bullet and clamp against LONG_MAX/MILLI
first.

> 
>> -  %*ph: The AI seems to have a point.
> 
> Indeed!
> 
> FWIW, I was already aware of the AI feedback but I'll just setup things locally and
> run the review before submitting again.
> 

The AI now copies you on new revisions. Please feel free to rely on that
(unless you have tokens to burn, of course ;-). Those AI reviews are cheap
for what they do, but they are expensive in absolute terms.

Thanks,
Guenter

