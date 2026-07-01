Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC51B34040D
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Jul 2026 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915570; cv=none; b=AlF6/+a9oBFzaP08K7NmhH0jUpBPdbYT5bwhV1TkzaeKJnL/0c6389a7b2AJNlqIjV33dY21Bni7kHeQYs2u60bvU203tdujNDW8JUqjyYlvzTcRktbYPX9fK7iZ80Pk/fheJGXeHrxWiFoyYkf9YbMdPQu0nckNbHaC3CsyK/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915570; c=relaxed/simple;
	bh=vH8nvZeHSmN2/0es/LDZtMNIDHkJrInk6Hj1SdBcrE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBzaU/QlAlc9eVMBA8QjIUjD5F0Uo3mdITwYyeQE5/2CUiq8t6+Je+qey6hL91bnJkypmVrTW9hLHX59FAsKPCY3iWHBGSUjFNoiIm7nVLscgHwDj/Y/ozX9zMhiWm3rnn97E2IQD2DnksV6mL/kkGQ9X3l7uo5sQRZpjIuFpgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwx6xUrp; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwx6xUrp"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8478fe07f0fso532738b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Jul 2026 07:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782915568; x=1783520368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6U+/o0tXXBCTuwlnimqkfxQsRgMwYtbQ9Z14+685ECQ=;
        b=lwx6xUrpMIxYooSy42nVx9T1M0j1gjHyZ16ZANuJdD+3YbTdoILI8EvqCwlbSmBMV3
         wJyWvONKxMXdMU1GzjdVPVkYOmqy83+eDJYhKpvFMRQmP5x3NJEfNdS9gZdl+MLERoD+
         91ndmXoRz4WTn7C937I+Qzxdi9GH8Kb2O+QqDuD5oBy4qw3ljbc79LnEYxqaQJgLVVpn
         QH9NXTg4yj5OtHKimHYnJ2qWUR/4XIT2JNrV5Zmx3ZJtV0suTlLGdKlw9Bi1zZTXP7Bu
         xDkkGDTezPFA3JFyV7tRNygWNGB6J5hcA/neBGqDT7dKY4KOrp3KmwP5g3Ru4BK2vMWZ
         IzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915568; x=1783520368;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6U+/o0tXXBCTuwlnimqkfxQsRgMwYtbQ9Z14+685ECQ=;
        b=eDz1oytiP+cFMue0CYblDvkrr7VEl8ER3EVu/81Sm7gwfBlBz7qJ5y3Jr93UDxOGG3
         WP4ZfEMavxA7penxzYMKg5KFWyrE4cK7BT56u7clRNS8e5WG160hWn4vJTyR8K7/sR1R
         7IVb3emJwk2Ydrrx6X3T+VqpRVC8ben5ekfMft7rhQmBP0VTxJj5JCtqMj3JmzYUf33j
         HnKEQELagCmWX0c7IRlmCE1d9f12CA1rhnrH3GzrUdGIk2ryBFIQh2s4kVKAxcK0bJZU
         4DHkWmuJxi4SS8YwAIbUv9gswVioDOjGWyS1gUoqipDvQEAof5/ZB5PM25dCczT7HS97
         4NLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GySZpmDC8nSfzl/5MsvFQrQGZGbNsjithXTpCMKGdbE8ZzSevp1wJ/D7qO3oB0RdeHySMF5+/1WJ5AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFiJIHXiKyavAwkOEcCRljk6P2xvWW3j0cGpgBfEZcB/dW+4Cx
	9R+yY06unBFttPVmTqcZHqYutxMFC8WgLXMaHGSfprdtm9QchX2pMT6Z
X-Gm-Gg: AfdE7clbPd+CURL4cMkUqzi0jTtzyNx9yuVm812kSBKvd4oSvWVhSb1iGyc9oxAGqhT
	GIgxgbrOfK0S2ngwC4Va420I/nI+iX7CUz4xIk6QUBwARVGpxf1TA3TEuWJsyu8Z7qFyxlwIGDQ
	HCd3VTNq3qRPYREZnqjoPmMsU1hGvD00PU29rZ7OPwqqQYu/9W7t8/9aHozkMDe+EAF+tL71/Vz
	6/hZxM2CLTvJw1NhHuAOKhzb1VzeqIujmOYHAsFEY80Hc55/Gv4gXMnn8+5rTZR3S39BHntL3kn
	P2ZLGdeybe7pqb/YiCNYjasHmUakLluoiVxRRGGhj/VT2pmV1ZOBpkvS2G97CvBJBPXoRRwW2d9
	ziVaxgY2uGLJowZxvM/SvkFk9eD7gvuRAWEJYoac/ZDjVZ5dN4qSqk9qXX+qdi23J6a0wkp7xg7
	ZFnTJWnelHhOUmK6U90V6X5/G6zpQV1lNFo+634IxcavixnwT8Z/5LRENIy7HA4Fhegcefaq9K
X-Received: by 2002:a05:6a00:98d:b0:847:85b6:1f53 with SMTP id d2e1a72fcca58-847c08822b1mr1757403b3a.44.1782915568012;
        Wed, 01 Jul 2026 07:19:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03a9185sm4242095b3a.55.2026.07.01.07.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 07:19:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <86b84aaf-a5ad-41db-a765-eddfbfdb07f8@roeck-us.net>
Date: Wed, 1 Jul 2026 07:19:25 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: Document SMSC
 EMC1402/1403/1404/1428
To: sashiko-reviews@lists.linux.dev, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20260619103153.216444-1-clamor95@gmail.com>
 <20260619103153.216444-2-clamor95@gmail.com>
 <20260619104041.8ED151F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260619104041.8ED151F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/26 03:40, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The device tree binding schema fails to correctly restrict the maximum number of channels for the `smsc,emc1402` and its variants (emc1412, emc1422, emc1442). By grouping it alongside `emc1403` under the `not` condition for `emc1404`/`emc1428`, it inadvertently sets the channel `reg` maximum to 2 instead of 1.
> --
> 
> commit 5a834c50ed998e304e4c00fb64e4e434cbd93896
> Author: Svyatoslav Ryhel <clamor95@gmail.com>
> 
> dt-bindings: hwmon: Document SMSC EMC1402/1403/1404/1428
> 
> This commit documents the basic hardware layout of SMSC (now Microchip)
> EMC1402/1403/1404/1428 thermal sensors.
> 
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml
> 
> [ ... ]
> 
>> +allOf:
>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              enum:
>> +                - smsc,emc1404
>> +                - smsc,emc1428
>> +    then:
>> +      patternProperties:
>> +        "^channel@([0-7])$":
>> +          properties:
>> +            reg:
>> +              items:
>> +                maximum: 2
> 
> [Severity: Low]
> Does this conditional block correctly restrict the channel limits for the
> smsc,emc1402 device and its variants (emc1412, emc1422, emc1442)?
> 
> By grouping the emc1402 variants with the emc1403 under the fallback
> condition (not containing emc1404/emc1428), it applies a maximum reg value
> of 2. This appears to allow up to 3 channels (0, 1, 2) to pass schema
> validation.
> 
> Since the emc1402 hardware only supports 2 channels (local and 1 remote),
> should there be a separate conditional for the emc1402 family setting the
> maximum to 1?
> 

I am by no means a devicetree expert, but it seems to me that Sashiko
has a point. Please take a look.

Thanks,
Guenter

