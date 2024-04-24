Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382BA15B996;
	Wed, 24 Apr 2024 14:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713967811; cv=none; b=ScUSUNXjAAfDAQ6v9KvsF8s/j7EAbITHZfbOcp+wA5NfK0ACrwyVbPLUKEDbl9+P2DF+xG8uBxWp0EJZXW//2VvokcD9lSGT3/aSHQuCs4v4bDDAF9UuIrzgr8OcIaav/Ge6go3ImSUU4bQ6SQA+SmQhzWZ8arlr0dap0c+fToo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713967811; c=relaxed/simple;
	bh=cHPPhRacnMQCybYinGGg6Zego+33AVsgLA05gfc5+kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OljEeqEFeQVXqsLwQK0wcrPhoq8fjrDNGFOoPI+2XYQMIn5dnHU74b92cWJFL8dySiXPQXEfcBe5Vw50XbLw7/g4KCTWXWCLx2iBc2/zmKBg3ZYxLHUc02NnDyOLMRg2bG9ovz6En1/G6dZI1HzJgEwsmUUWBdMYjD44hxFDOqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0ZeX84S; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0ZeX84S"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6edb76d83d0so5742215b3a.0;
        Wed, 24 Apr 2024 07:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713967807; x=1714572607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0C27ZabO08UORv1Y/BjmVDIcA8o8DFFYzQlkNDGBtpY=;
        b=g0ZeX84S9GoMI6L9TPF2wZvNDamruPZYHYbaYI1AY6uIecXTIR8tx5mUHvWPZvRDSt
         keDpqj/ZJjxgdKN1qL3peeub3lm71uHwt6kyUklvdaOeKhCKtuuJY8tcLc63f9J2ycO2
         qNTToWLo5tghjiNI4ARUSAfa1abRTiYngiRZq+n+ooJy56GJsfIO2u5uRwndiDubyeMe
         GXe4qtLB4JI3xelSp5ZEXrw7G5LbA7mWtOqYrMi4bXYbnkqMKhYj5ksWqg3xKfWuwNmr
         NpRf+wELVJnPAQxGrILhiQjLMf1rRD7D4HIGkSLCgFXIfze0v2VEq2ZxD8R+jHMJqgCG
         s6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713967807; x=1714572607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C27ZabO08UORv1Y/BjmVDIcA8o8DFFYzQlkNDGBtpY=;
        b=bxbH7D3p0U+hC4Q5O+ZlKwHdB0g5bnPrBJVTwQiw2I9yqS8ivby4Iykxuvh8QZ40TD
         AVXzXa5tpiLUEaTMMXJajllKrOkgWIc0HGyf2JWYQsIihmvsoE8hVHO2rm2WvLGG/tB0
         2/ABB3+Y3OoqZQKOvgHUdoA+6UuRW76SUvkWYdR5wCgoxZnnjFSxdedOQieabMGv4DRs
         OfwGRg4pouomd/s6UXeM1doH1xj6VYiV/RNnHFp4ytaE8PWQAYPoRMZET5iADTlqNa7B
         hvtO5mlFGcnXKzEJ/tW4gperMHjulNATBH00iojDBFWAq+mJFiUvMgrCqVkc5hp9MnjL
         oW/w==
X-Forwarded-Encrypted: i=1; AJvYcCUtXUnYw7eInMkFXYBZYVuxoXIinpCEC4JEHMWG3VqVogmuq0xubbuAh5Icad6MaVyw7YeTUcK0DjkuzK5XAqUmcnr06bgf0p800DcoYPQNNyo9YxdIqdvngDqquFDIso1EXYnNYbMR
X-Gm-Message-State: AOJu0Yzkixz+dancJrle+TUymp4US8C8Duxjk9ISbDGhzuSL8gCVjx7a
	GEfyvlfhXY07qN0tdbtfYNh7js+zUqBWCmW7+JeDN759pXSJtKk/nqXjZQ==
X-Google-Smtp-Source: AGHT+IHHAkk+rkDuFTwAsN4oy2Gvph7tRJL4djx+hkYzHfuNNF6HzreJjAPI4EKqATNIXg2laRvtFg==
X-Received: by 2002:a05:6a20:3d88:b0:1aa:340e:237e with SMTP id s8-20020a056a203d8800b001aa340e237emr2736644pzi.59.1713967807279;
        Wed, 24 Apr 2024 07:10:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ga23-20020a056a00621700b006e7243bbd35sm11885380pfb.172.2024.04.24.07.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 07:10:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8e6977df-e6ec-4c03-bed3-f8ea50d6b637@roeck-us.net>
Date: Wed, 24 Apr 2024 07:10:04 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document target-pwm
 property
To: Peter Korsgaard <peter@korsgaard.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240424090453.2292185-1-peter@korsgaard.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240424090453.2292185-1-peter@korsgaard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/24 02:04, Peter Korsgaard wrote:
> Similar to target-rpm from fan-common.yaml but for the PWM setting
> (0..255).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> index 4e5abf7580cc..58513ff732af 100644
> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> @@ -46,6 +46,14 @@ properties:
>   
>     "#cooling-cells": true
>   
> +  target-pwm:
> +    description:
> +      The default desired fan PWM.

Unlike target-rpm, there is no "desired" here. If this is the default pwm,
to be set, name and describe it accordingly.

Guenter

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    default: 255
> +
>   required:
>     - compatible
>     - pwms

