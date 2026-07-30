Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901C8442139
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 14:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422862; cv=none; b=MEFjYa9A1gp+ZYvRieztdO2loCqmp1YAHgrGLYX3/yw3TMVCWWeG2yyaMvamuAIeFFigsv7EsjQ+Ki+Qp2mrum25N3mQ2IT+SS0R5sNi+WDfR4/b5JXZVnKKv5fcFoSr0AX4bTdRXTrPSmnzxvTOuj/udzPx4edHhtW7yU1AHgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422862; c=relaxed/simple;
	bh=CHo4TkZ2Bd0FHGa4s2+Qmzp6HvTJtts3VaNH04a18wM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZGJoEIRuSvTsajc9lH38P787R5kYBKIJIwKPsb0JCpEqYnC4jV5DxkCI1FBJCPkpbRKSeYpSYl2FNMWEqGv3QGQ+Mr+ZV5EfWSWl7F16i40po+if+Jh9mJe5zjTJJZOru4KwLEpAlf1G9/OYHS67v5q84ovbzcSi9+wODYD3vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5yKZXPA; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5yKZXPA"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so2498496b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 07:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785422860; x=1786027660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WgJDW0G4Wf9hrZ+tf3vu9dcGivf87Rv9XeyNRhNIlM8=;
        b=Z5yKZXPA2FsCekA/b1tSQfhrq6jVZ64fyiL7vpNI+m0fl5EjmG+zgg38j24nm684TZ
         p+H3GW4qTLzrIexrPad1cNUOZBUB7zjY7jXKvxhxjnAaqWVCD37bc9lVG4bd4LcBkK9u
         YqDaWNS4wwSST/ZuKkNjc22ESpQBFfYyd/q3KMFMpfYJ9VHtlkNZvl4QNk6M7EXWZiNk
         ckZ0zYcXGyQKcw6Zb61ufigOog/GGlgEL+Z2fRq47h51sFzQGDcNX5yYjo9h/R0s6rRz
         knKy4powu+8vWK5mPHBVfdjHVQj5Wx8FjrXHQuGEUJfNH/NSODNhn08JAGICFMaLihWj
         s5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785422860; x=1786027660;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WgJDW0G4Wf9hrZ+tf3vu9dcGivf87Rv9XeyNRhNIlM8=;
        b=bx5ZrSsGVRgR6Ym4HqXBqIq4XnrCvbqiRrlymbqxCVvMflnruiTqXcm+6jwMdmuTuG
         IfC76lwbEPe0CFsEVCq8Xp6BzafUBr/Y0wqnKG9V6IDhUCqN8luSIsQdMuBuQAQmvTYL
         c8BusoqWfKbA7hNF46a/G6l0rMFf1m4wx7tazbloQ5kqegJYXln6h9ic1js2t1iI0ChR
         fsT7YaH5zuv/KSXXpK8v/iCj8kiwzCPCuCX5D5+zjmzX3UzQavCkRRPrfp8e7QPZ2yuK
         3KLhrRpMWjVGWsbS0h4JF1dkulkRGAEER7tQRRh9r6WNsG8xTD/HgcK3xPPxN6XK9u1x
         /m1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpSs7qmYxnUiK7s6dHqqQgbZPK9WU0ZggWssylvBpElHmGAsrVulS49OQUbrE32KNU4/cSS9KEOYc0l8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUD+yO+DYWf4y9ZnUmGPL+xSBoTLhzc94+FyL4kH+de8PcrSD1
	jPdKfPiuzVSO0tZWbTUibc+rfUlmbIrAV5OR7/He+pclnutpwkRg6GYr
X-Gm-Gg: AR+sD111l/obf10y/XbJAxidIgIHacQaG4MZAB2louP1GwrhKbAyJtIK0qMfClWd4LI
	+b0VNnnv+0PHsTEKSUJW0NXrNRGbFYhheAdNFsx92s2w61mK/DY28c7gg0etM78CgyOmIZTczVS
	gEX7Gwebh/t9tzsGqJCxDw7NeML4OiMNKKuu4/K8VuN/hqq/072vaHpIaAt7E2h/g4VNTI/pejm
	VeOTClpuKiZY0yPFeRa4R2BuSovfTyFpJgxlsPgkdt1rzyC/kzIAvsYzYZA/fTEDAzOJOoCtxzs
	1sVenpzNUgDfxpr4FmV0EZL/hc9irXHtvnMNfw+axEfrj++5EGz7ixKkw+PzdA56NJTl7sdojHt
	bAi+nG7o9kkunEyggXxgudMXstmXmYcyr2LVt99uzHYGl6p0pGKCihQNcHCbxES9ADp9L//+4wp
	Sd8umFsjuckCWLULtmsvMpntO5fzk+PRsaQ1bUCA467xNyjY33zHpnTbYXNb0Lp+KD0ugitWec2
	N38DPTbdaAl0wz6aLdVGx4ZUYN+A83jvUje5w==
X-Received: by 2002:a05:6a21:6118:b0:3bf:e761:6285 with SMTP id adf61e73a8af0-3c90d44c4fcmr610337637.29.1785422859869;
        Thu, 30 Jul 2026 07:47:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b6d14bsm20653283eec.10.2026.07.30.07.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 07:47:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e37df572-1ca9-4c56-a16e-faa44f1ff1cd@roeck-us.net>
Date: Thu, 30 Jul 2026 07:47:37 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <amtewh9lOgWz0-Nh@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/30/26 07:27, Nuno Sá wrote:
> On Tue, Jul 28, 2026 at 02:05:53PM -0700, Guenter Roeck wrote:
>> On 7/28/26 09:03, Nuno Sá via B4 Relay wrote:
>>> From: Nuno Sá <nuno.sa@analog.com>
>>>
>>> This is in preparation for adding support to a device which needs to
>>> use it's own read_block implementation.
>>>
>>
>> The chip-specific implementation calls i2c_smbus_read_i2c_block_data().
>> I'll need to know if this is a chip limit or a controller limit.
>> If it is a controller limit, a chip specific override would be
>> inappropriate.
> 
> I'll reply from top of my head (did not looked at the driver again).
> IIRC, the biggest reason we need the chip-specific implementation is because of
> the RAIL selection logic (mainly when not in page mode).
> 

Yes, I have seen that. Question is why you use i2c_smbus_read_i2c_block_data()
instead of i2c_smbus_read_block_data(). The rail selection logic would not
require that.

Thanks,
Guenter

