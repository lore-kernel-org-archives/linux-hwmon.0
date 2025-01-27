Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E8818BBBB;
	Mon, 27 Jan 2025 20:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738008859; cv=none; b=DZPSIGzC+Tku0Jht2svEFWcT0TxP1on31LeQzgFW5VomO23jY8vv69ocPvuSwoX1XtK4ZdjvxB7bEkvZVIekx2H+aYVQegu9O6jZfiV7zLfdfXIIAdfBtbwNlEVwJQmGWl5XyFysnLiaBtPlAuihVBNXQv04ym9A7/k7DY7LPn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738008859; c=relaxed/simple;
	bh=XdLtn4quuaBxuUISSB8yQNL/1UvPIGGzwtHJINKG8/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIvN3b2rFXv4RKrrXUf4VhLE3CHBBGkRb+jwd/Z/O7YWIg3m2k+91q1d+wAiC+/E5V+hhFwMokikrRwDc5M9R0t8t4GN+IjKTARCLzk+ERiPrtOSx7F91t8MJoUs0dYsngQid166JtFrA3aMXN3ulXwbShfPN4S0LpemlkYwhIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+fqAJ+/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+fqAJ+/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21669fd5c7cso86491075ad.3;
        Mon, 27 Jan 2025 12:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738008856; x=1738613656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=suJf/HEqHsMHaCSANSOZbLLa+EWjVVVMsD4BM3M4r4g=;
        b=M+fqAJ+/DI38DK5t6lxhLkGYZrjSZaYcQdXzXcAVwnL3gs+mG4tPkXQ+MFefDCjqji
         MBF2GsOlj6I7XL50u/FsdnSPBi+a0iZ3HWzUMWTYrDs2tIu8Tsdkt+2FQTMbP+NXMGm5
         OHa5CCq3MmhJCG5LTlMwaeiKCmQMPACnIRl+PBgT46g0lDy/OTUFpmZp4t+Xef37S7ry
         5K40ES46w2a2RIvQ+IRz9tRd1i9S98rpWqgoJRBsnHdwhQm9JPtegIkU7kkLqT/CmSfM
         EI9IVu8NAaFAQIJDy79qXeDhm0CdV3fpo1XsnVsCOeaxeOgpoKsYdIKxQxVBP0vb5H95
         eYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738008856; x=1738613656;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suJf/HEqHsMHaCSANSOZbLLa+EWjVVVMsD4BM3M4r4g=;
        b=spfh+DVWi/dv7LOBXCHqZQBSwsHxQjOB6PUIq/qURZFC8LIyyuAXkpV6rr9IhrUzpF
         2p+cgpIXGgZ9jIKa1/XXmGBPce2Jb6DGlDA6lPqvpgFaG2y52Y9hAjX/CNL/Tvbb6ZIp
         kgD3gC/EYgWEwEFERbpYg2+x4SHDX+h4m/YHFAd2YGnvjHyDMSBvRNQxO8xq4cyqx6W4
         FEbXyd5Nbn9szoIXxF7qKFQe5KGtn4jD45paC2TqgMgn2awGW4bgKl5fUDAQl+Yw8M17
         Otf7LcCRIImEFkfLmcFDNMIwmGMh6knWeX52L1M9cmY+dM+Ew1iEjVC8aJPZ+O22Mqxn
         tyuA==
X-Forwarded-Encrypted: i=1; AJvYcCUu1SUMsaWKteeMZ1eBq8daTmbC7UxAZJq5OP0tJJNnncaiuBgJXFrJF+4uE7OwDPXPMP2P+WiTQFzu@vger.kernel.org, AJvYcCXZyERenUHFOUT+4anqgD+zuw6R+kNW5t0eK4suvYGTnw8qo8b0i7TrCZbR3qxg8y9hZQFrN0DCGxiLG/U=@vger.kernel.org, AJvYcCXdIl24XfVj2O26Pd9rKxE/TprP4CT2nngocqdLPuTwyNE462b35eqtkRt0OoqYErXShpKrYSaUBT+S25LD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7JczOB/T2RmdlcbRAaxpgTrgM5Kdc3DMgjAoQZix9nmal9POX
	i5gsrbE1+PZVA2JaYiLYInqCmboDbBOVddpC+GqVHwe/5JagHHtY
X-Gm-Gg: ASbGncsyyVZOr4wtD7kf1JQqmcpM+6T0d3QteXcyDjmuMlbvrbMTrl6OPWAQ7Y3p7ek
	wOSCCHYNftFGz87L3TJEd7BGgBrfGZZBZQDvPbCEWu9rrTSZoinUYif5xulTtP+fUZElPkJ5gCN
	6eIipFRwGtubpIg2iuG0h/k5/vSphH8vNlRUd9iEmq+opr7Ll5YXbJ5F/F8zLJXW5NQRhgGyE8X
	bpZ6pSLInUfSTuwbje1O/dt5hHDcZlQRqffmV1sQoC2wn0AykMnbxbPR4yVSq5wapwTo59yvxnn
	ondJ1z/yZwsjLl1CBi/Y5x8Z4NSvSYd3fjW2uFAoA64KwNPttydRkw==
X-Google-Smtp-Source: AGHT+IEE6kMcw+ib+xPXtqwUJT4WXgGuhp268d1lgJueu9itxPBMzr4XdEtwnwF9NR2WMqv6S0ZwfA==
X-Received: by 2002:a17:902:e881:b0:215:7b7b:5cc9 with SMTP id d9443c01a7336-21c3552fe17mr716591855ad.22.1738008856446;
        Mon, 27 Jan 2025 12:14:16 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141bd0sm67929875ad.114.2025.01.27.12.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 12:14:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d0ad8ed6-b0d8-4bf2-acfb-1d9b098d6550@roeck-us.net>
Date: Mon, 27 Jan 2025 12:14:14 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: Add description for sensor HTU31
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: jdelvare@suse.com, conor+dt@kernel.org, robh@kernel.org,
 christophe.jaillet@wanadoo.fr, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250126144155.430263-1-andrey.lalaev@gmail.com>
 <20250126144155.430263-3-andrey.lalaev@gmail.com>
 <20250127-agate-mouflon-of-promotion-6df8ee@krzk-bin>
 <57e08fc1-a319-4778-ba4a-28655f413511@gmail.com>
 <7d598b2c-dbef-4574-b154-cfef9b4c2099@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <7d598b2c-dbef-4574-b154-cfef9b4c2099@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/27/25 11:39, Krzysztof Kozlowski wrote:
> On 27/01/2025 20:21, Andrei Lalaev wrote:
>> On 27.01.2025 08:07, Krzysztof Kozlowski wrote:
>>> On Sun, Jan 26, 2025 at 03:40:56PM +0100, Andrei Lalaev wrote:
>>>> Add trivial binding for HTU31 Temperature and Humidity sensor.
>>>>
>>>> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>
>>> Please version your patchsets correctly. `git format-patch -v2` or b4.
>>>
>>> This is not v1 and you could not get my ack on v1.
>>>
>>
>> Oh, my bad, sorry, I manually edited the cover letter and forgot about patches' subjects :/
>>
>> Should I resend v2 with normal versioning, or would you prefer me to go straight to v3?
> 
> Tools might work fine with it, so no need to resend, unless Guenter
> asks. But if you send v3 for any reason, be sure to mark all of the patches.
> 

Please no resend just to add version numbers to the patches.

Guenter


