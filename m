Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB30A43A7FF
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426869; cv=none; b=e7y4GKBlTbsgcHfb8/eN08LJbhPKC5ztGt4TJcLOdXOBWFuspXxb47gixP6Zx4YwjVkUzf+fGt17G20MxKHodC1UnzHyw2dqMH/Oje6WB+rPGiBwO6yVVYutp7lAx4D/Zbh7fBsDPS5GUtdHX54GQnS3K0V4E3F7SZ91SJU1vuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426869; c=relaxed/simple;
	bh=lBNtrU7nqo2LGdziFUJ+g+Dshswg7sI8Cx8mBe+2I0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fNM7dhId/L2b43U8kHgAc6v9SCeUmj2VmbwVsTXxko/Axh7v+qdRLLUUxaavj983y1Lq6IWU3ZrvGzKIsriscv9gnEE6U3WOYxhF+RMUCbsc9fPTfLuWPooKqdjVoIkgh05fvVMbfHWnpTeMTqLeScWtKUDOu+kcpRRDWNl2ZN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CU2CuQod; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CU2CuQod"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so46567a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785426867; x=1786031667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mbcUXH2UkXsg3GtsdQpN1QpKfGFyO9S1J1v/052T+U=;
        b=CU2CuQodpLAa9HH0gNxxoLUj9gmYk6OKojA0Z1dJdlsePoZtfTz4RWlWy9d8pxTSzx
         r+YCtafE0CI1PKw4jJp48LgguLelRaAji3uxr3Fenrvi1Vh+MKTpfdEjC6Zgif9vxmm5
         w4WY+MH2o+OK69K3aU77SSWftlHnzwiYdQA9qEMFyFAJbe19taQJAWqma+e7462Ia/eD
         nSly4+HVQaAwxCNCwtTFVqQzlNnwU0hIE6dWpVETcJ4hYruYFqFN1aizTGbSfJBtIboM
         85JAc5n1bf79C8LDI/vE/fqasvFo+R3P3JMss1DeMscDmWmk4Ods9cW7Goz4pcdEVVIj
         HVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785426867; x=1786031667;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3mbcUXH2UkXsg3GtsdQpN1QpKfGFyO9S1J1v/052T+U=;
        b=aw0anCqvPRu3TbpQ8P3Q9ur0cvI4XvzxxjaS3UIiHbtcys9ynlCP4dOmkjILSSKw8z
         7442MPFAYU0kdfxQfnrFFXBSNnRAVo0PERYvxt//SAz2OlOjy0n/J5JG7eBkQ8lSCWgr
         TAzEX62rAboCk/Tt3/pC4775jJlZAhQrd2szFy9rCTyl6J6dtdsENrM4yMLOFoaYduMT
         1KT0eD1BNcqTAlgcUK/o3QeUx6E1vFBQs7oXmnPNyN8GdYRAbQITZxKVSLr5d5bvTQdl
         eXuoADknmmR+U6UqEpmnzOwldvmISHR+TOt/MBSM+GwkfXAMh2anXayLwO/H71oQInbK
         0mtQ==
X-Forwarded-Encrypted: i=1; AHgh+RpODI707tTgTiBbcgTKTRh9FAtuXUpsZYruW0z0mnbnsN2PvczEJthQdUyVwamCzFbJoN3JfWZSe9DVxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEPNCUZxlRkkqGYr4Zv2DrGZJJwk/EE4OKySlcwleB5yImOgHO
	dFhdgch2OSlZSCB/e23/nNyrupG/DAQZ2g2ucV31onMwtW2XBgziPkzL
X-Gm-Gg: AR+sD10fa8aNCroa6iv+iTiXLPfnM/NS6k6chHhn6pBkO2DfOjq/FVR4JwC1NMPsw6D
	hdmLS0LKbfP8PhnYl3CfLaYtLrHAi03wkfIsYI1U7GmTHAhowLikg+f3JfWWD4IKsQBjF3/CNKb
	5u8Oah4mQBDvdmqYqR0oxE5sUZ+RJ1lzrt8+MByyGRk7haurqd6QhRWP6w1IOnZbavWshQt5a2g
	t51ERdBxxEDrqwsvQRo1bRyoHC2lGtRlotCAOAG+QYZLtGDluJMcmtoRAfj4NfphL1jPoblCQyv
	dEo/HyUwMfeQJscr8uHPxIqGsFcezOOqDAZZNhmL07yjNymwygrhiJXwyklOHsTGougS0b9cex9
	a6NznyjkVh2IQPmDl0spjOnEARzgA4tdzuAu/ZTwFhwuH7pjp/CCqcQI/fNrsXbRED44Ppu6evc
	D2YYVK0wUPuONnU3xI8uL/JbX5hRfw7N+rFfXtGSQkUk9qO3l7B1sxPoBogbt3yQ0VjwiP05QCQ
	+pV6qL64Olsyfwa9bCDctjiNrrel/4gRHdlFA==
X-Received: by 2002:a17:90a:e7d0:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-38f9be67c0amr2707979a91.10.1785426866937;
        Thu, 30 Jul 2026 08:54:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b72c596sm1313465a91.9.2026.07.30.08.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 08:54:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6287e749-04f5-4a03-a91c-fcc705df269c@roeck-us.net>
Date: Thu, 30 Jul 2026 08:54:25 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Alan Tull <atull@opensource.altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
 <c3e143ed-af08-4a0f-a630-96a255df838d@roeck-us.net> <amtewh9lOgWz0-Nh@nsa>
 <e37df572-1ca9-4c56-a16e-faa44f1ff1cd@roeck-us.net> <amtqPQSM6zsiCh4B@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <amtqPQSM6zsiCh4B@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/30/26 08:19, Nuno Sá wrote:
> On Thu, Jul 30, 2026 at 07:47:37AM -0700, Guenter Roeck wrote:
>> On 7/30/26 07:27, Nuno Sá wrote:
>>> On Tue, Jul 28, 2026 at 02:05:53PM -0700, Guenter Roeck wrote:
>>>> On 7/28/26 09:03, Nuno Sá via B4 Relay wrote:
>>>>> From: Nuno Sá <nuno.sa@analog.com>
>>>>>
>>>>> This is in preparation for adding support to a device which needs to
>>>>> use it's own read_block implementation.
>>>>>
>>>>
>>>> The chip-specific implementation calls i2c_smbus_read_i2c_block_data().
>>>> I'll need to know if this is a chip limit or a controller limit.
>>>> If it is a controller limit, a chip specific override would be
>>>> inappropriate.
>>>
>>> I'll reply from top of my head (did not looked at the driver again).
>>> IIRC, the biggest reason we need the chip-specific implementation is because of
>>> the RAIL selection logic (mainly when not in page mode).
>>>
>>
>> Yes, I have seen that. Question is why you use i2c_smbus_read_i2c_block_data()
>> instead of i2c_smbus_read_block_data(). The rail selection logic would not
>> require that.
> 
> IIRC the reason was because the i2c controller on the raspberry pie does not
> support i2c_smbus_read_block_data(). So I guess this:
> 
> https://elixir.bootlin.com/linux/v7.1.4/source/drivers/i2c/i2c-core-smbus.c#L220
> 

Hmm, I think we really need a common solution for that problem. Not all
controllers support i2c_smbus_read_i2c_block_data(), so you are just moving
the problem from one controller to another.

One key example is the PIIX4 driver. Your new driver does not support the
majority of PC style systems with AMD CPUs.

Guenter

