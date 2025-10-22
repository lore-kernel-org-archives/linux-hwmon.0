Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4A32FD1BE
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Oct 2025 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142049; cv=none; b=Zyz92cef0OksugCFMsMzHobHNqcq8htXdR8LQ3k3t/nojpzE7Rfau4IulV4Or23LM2EMeWMOLdrD/Z2GLHIrn6Ud6ilbWhmXQSeEPYQg+QCUVvJswOugFONaFQbgzvbSSsstiN6K5/HrZMaKPr9vKQhf/QSTEuf4Q/VHfPKmwtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142049; c=relaxed/simple;
	bh=1C17DoVvYolAyaHXd5cbIQWFprwLNpCGAH9O/IeMJS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kAhd9OkeTRVyxNq2O2NgglHLhExezt7tpCoDkboE06xktJUOXJJCppGSxspJp77xqeVtcQ9YKO3XYKjzx8KbCH0AuwtvKU1+Gxcdp3+jYgSWY8t8jTmXz07FfLsycIXCEVIzwXObhfi3uiiktcz/4Zo739Jb5Bal8HlStI53Qp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gt/6aead; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gt/6aead"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33badfbbc48so8370798a91.2
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Oct 2025 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142047; x=1761746847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WHJCfnJWMLGX7Es1g+WBJ01c0gatEOnm7L9ZExylw/U=;
        b=Gt/6aead8T6TBSSoY4JGYWRj8InXcxtLX59iYl8emLbVHqsmbeUgDVRvrFVyRdHo7U
         5U5oFLosAwDuWAsc9W0I1rxlsoGjcR8FMK5Ipe5ZNUVfNHJkjaPLznz6Mj/zryzMlpch
         hlr9A+JG0szVPcuPK3tWJy8qT+icGnZ9c2YEvWZAzkpiiC/tnnYD/6laAvGQGM4QM4um
         L+q7e3TSjASyfLXE+VziWFTEzFMc8Hy277fDo0/HuoPgFgnlhKDi8CRhvFp0qibY5wsO
         EgddAXXnhAQY0hjvkWrSCODvgYiRfiDowyFvOun/zoJKlPxQywZenHg5/tO5W8EUPYN/
         rkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142047; x=1761746847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHJCfnJWMLGX7Es1g+WBJ01c0gatEOnm7L9ZExylw/U=;
        b=V683z4D7Cs5DdkmyPY1UCI1kFk8vCetYwow22a0wU8a4TBIFWlIHOGBRAQ3GUR/9Jd
         R6j98o49XQsMz3Yq1ejqpB8PqxwTy4WhpB9acKbMQNKshVJxwOkDy5tmWv6KAIul0we5
         05HNeRSUS3G3jZtK26iHNlBklwTzLrFE+fZAG1hMnIP/cQfEDO2AXKCMj9ANoO2FV7YO
         WeIl6BeNbN5ZtMIIWIrlobX+eTztMsf3AmoIK2FKLyakkdOQ5tA9dg824amY2ckwFvJO
         R0gpelgw95HG33QVP94kxY56LecVJkGfLgjgnwyubN1DJ2hC8B+imBwPJIbKdC+nKel9
         +bZg==
X-Gm-Message-State: AOJu0Yzh4qXxdZhQh0CECmATd3aVVAMFBYJQfNX2eIi+e4AoQs1XQ4VD
	4SvltxELc5PryT6QrZZfK1bx7vVVEmWPRQGeRfIvxU0llTqc//Otxx1w
X-Gm-Gg: ASbGnctEyOssN3s5gpM0k3H/NdrKbbSf6ISuXf3X21kJbr/sfD/ZCFpKjJ62jZLY/T5
	sgv3er5HBCVXEWJ9qJWtbHeYb5/2zr0q7pHA3x83AcUPb7sz3wRmFd9XN2CXOGSXCmZvhsc05KJ
	TqrzSrvDMGGLzaDmrfzsCGoiemLX2hqci+r2GHSjPYlfWFLIZYc6Ok7NagVb8gf5AmVsPQmBLMG
	nsKNrowE+4nIAaqiBRfDVG0wC3VVr5LIstks5ovtjzakLxGLGtIxcL8QuErsMiB8qD8OvX078Ro
	Ix+9S6Kp4jXaCLa/ycSc9UA3oHYGs+E7plBvLZWJGvEIuKKAuRZVLW40E1kqvhY0kp5fsZ8TFe5
	R9e2nqNrFgwQV/JaaXQkIJLq2FD4YObMVWwGCmoGpNTC3FTo8jpDI0BeMpGgWHoX2L+sXqYzCei
	ZP7W2MZEGrMVROgFdkk4YptCmlls0+F9mPMA2s7Gg0bl3abnkf4uF3te+N6jc=
X-Google-Smtp-Source: AGHT+IFeOO2m/QK88KsQxbIIIGJpiMOj19Lffr0deFbuerlgZNfeec+YsiTpPWgAdx2hr78z9hvKTA==
X-Received: by 2002:a17:90b:2fd0:b0:335:28e3:81cd with SMTP id 98e67ed59e1d1-33bcf8fa1b5mr24895951a91.18.1761142047333;
        Wed, 22 Oct 2025 07:07:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e2247a7f1sm2722930a91.14.2025.10.22.07.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 07:07:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3a4e8cb8-2543-484b-80ab-15eb3490f29b@roeck-us.net>
Date: Wed, 22 Oct 2025 07:07:25 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] hwmon: Add TSC1641 I2C power monitor driver
To: Igor Reznichenko <igor@reznichenko.net>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251022044708.314287-1-igor@reznichenko.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251022044708.314287-1-igor@reznichenko.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/25 21:47, Igor Reznichenko wrote:
> This patch series adds support for the ST Microelectronics TSC1641
> I2C power monitor. The TSC1641 provides bus voltage, current, power,
> and temperature measurements via the hwmon subsystem. The driver
> supports optional ALERT pin polarity configuration and exposes the
> shunt resistor value and raw shunt voltage via sysfs.
> 
> Tested on Raspberry Pi 3B+ with a TSC1641 evaluation board.
> 
> Igor Reznichenko (5):
>    drivers/hwmon: Add TSC1641 I2C power monitor driver
>    drivers/hwmon: Add Kconfig entry for TSC1641
>    drivers/hwmon: Add TSC1641 module to Makefile
>    Documentation/hwmon: Add TSC1641 driver documentation

Please squash all of the above into a single patch.

>    Documentation/devicetree/bindings/hwmon: Add TSC1641 binding

This patch should come first.

Thanks,
Guenter

> 
>   .../devicetree/bindings/hwmon/st,tsc1641.yaml |  54 ++
>   Documentation/hwmon/index.rst                 |   1 +
>   Documentation/hwmon/tsc1641.rst               |  73 ++
>   drivers/hwmon/Kconfig                         |  12 +
>   drivers/hwmon/Makefile                        |   1 +
>   drivers/hwmon/tsc1641.c                       | 801 ++++++++++++++++++
>   6 files changed, 942 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
>   create mode 100644 Documentation/hwmon/tsc1641.rst
>   create mode 100644 drivers/hwmon/tsc1641.c
> 

