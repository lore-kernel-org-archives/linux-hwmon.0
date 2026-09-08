Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70952E62B4
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 05:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845216; cv=none; b=lj7P7Z8MRaZzjMBElOpK6rnXStG/ZgNv9G4Z8lJgBoo/VHLQuUc71nsmGCodoPk6koxQciX3g+Mxnk1wIQNnCGAl7vy5l1mEPtnrwFgTWxClAtw0KvvlUSA4bZf0amdKAGrwIBr3AGVg65waj2n2dbNd9AWCqqNKQ3GMU8eDI1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845216; c=relaxed/simple;
	bh=ZIRVEqjxXGVRKDzZh1TGbLw59T9G6VckCt7458JkZCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUoYp3TlCguD6LDk3NpbrQabgz2MrnUqSQfiPE/xX2q0D4HYj5Nk4l4Ts1vurIbhj6qKAzsfQg8Sn1ftwppDTIrISI9C+J4FiBz3VVBz1IoSjWwIR8d1o81cvk4u4vV6uz5FNfyuAQpJQ5RGHg11aFIbD8AjTrRZ3yEB7qXzrmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkMuKH5D; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkMuKH5D"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3008405a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Sep 2026 22:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845214; x=1789450014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1W+fM/Wuxfg9AV61/48GxXECYU1wlppMPQetunuyOIs=;
        b=UkMuKH5DLx1QhBCXQL0ADKpiw6NCr49GIdGMliXZKWyFc30tkMZ/Y9z1qanozXWTOR
         YNlfYX6iZPh5J9Jx6UL6nGotIMa/c11eUgg0oibIIR2XZSXVPgLWWFsZUINvByi7VQBY
         W5tsAMUGJ0SohkHxTmvyDlF6DrtNAmRo+EZMCh4LfDHfYJqNA+JGeTOeSKaVcDMquCbd
         QyvmLgP0zqLrTb3pay0yYn0jMT8uJLn9uzZ9tj0dT2YF7VbHeaNbY+QzjmbERiEUMIVZ
         ohIQrbrXRIDeRDlQx/6BK/zyrkFcbf+xzzJFFGXLOUJLi8ye5eIhAMgnoHxX+wZMAa6U
         ONjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845214; x=1789450014;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1W+fM/Wuxfg9AV61/48GxXECYU1wlppMPQetunuyOIs=;
        b=L9oprOCYF3oaBIfNGHr+NLLx/aDJJHipRjjHsHPeMvmsJaqC0K6w01CfQiwqAK78hD
         CsRMe9/rJjZEZB9V+N30B75PCoXoRgcgg3bqcpy/ssEYEfpm/3wFfVdUj5+eB85KFQLj
         l/P2+4NE4J0g7G8llOZmyOcA389ySA1vdt3Syx2LTv+C3ZBhET6N3WNMsUas0MiF5O28
         BQ8UG79aJkDRVKJgfkziGxsheBkw1nRhERhe9s5ohnf5l6KQKJ3HC0f9Lq12E7ypiRhi
         TBo4nJ5Tg35ue/JCcRxhOCwGLQHIpwYjtc0YeVpO3QnNJ4Hg46+cnYwx2rG/+jDQTPXG
         EuBA==
X-Forwarded-Encrypted: i=1; AKwUvByeVzBFWM0PrRCxcTH2rGikIXkTqbbvZj7C9oOelacVhol4+dF1HHlUkRwYynClPon26A9Ww4eO3L7HwA==@vger.kernel.org
X-Gm-Message-State: AFuF++nyRy+EjdpTVT/XvT98cMO7lQ2vigiEwFMhZ079fiPFZL9DLjyg
	86exox8D1Zxc8MPPVGOMe6K2CqkrrT4bP0KUy03YHsT/POS5f4quZ42d
X-Gm-Gg: AYBFou21jyEvMbLynF3+OksNr4BoCNPB1HX8Te8ZEQmcDq8ppv8Nfac9G3ddmq86e/l
	L3B+4NGJANv0zID+CQAhEeJgGIpYWdyf7DNUDFA6Jkq3w9qyfilDan9LECX5f5zw8ntiSkKbpdJ
	CpHpnpBWKKMZuAFDVba/6zTUsH8NixGnBRr3gJ722fcPbAuULGbqH8PWAdXOrhFiKVdUgMMv0rv
	Zpd0Mo0rWmboBAauG5XKV/YF7YzZds7ncs7EjGRvNp7b6qWTQpI7K0FWPHeV8cusZMbv+gR5KHx
	5njud0ACdKE/J3x8tkweUG2GD2FD4sfOvNA3H7T4Vsb9urHLhh3HCEelZ2tvRnbMlx4b9GdaJeU
	2uEVXFQ78ouaZUMHIGIw7R9B2I30IzNgWt75REQVg4TpRidqANdgy5g2u0ry6M9uJ3GQ4+AALG6
	Quw2xH5DakdqmKkopSE82OjzyhNGkOXlhdS+KUYlIt5SEpdSR15O8bEreVZSGRbA2TgNW4qYDxs
	VY+TeUSiIw6GxCDIfLmBxCIXxBmnUomD9RTdQ==
X-Received: by 2002:a17:90a:d004:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39b26273267mr41950559a91.13.1788845214308;
        Mon, 07 Sep 2026 22:26:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b58187a9fsm4339012a91.3.2026.09.07.22.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 22:26:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1b2d3cca-09a6-42f7-93b3-ac1a2934d301@roeck-us.net>
Date: Mon, 7 Sep 2026 22:26:52 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] platform: arm64: qcom-hamoa-ec: test sensor and
 variant handling
To: Birk Skyum <birk.skyum@pm.me>, sashiko-bot@kernel.org
Cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Daniel J Blueman <daniel@quora.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908015650.84401-1-birk.skyum@pm.me>
 <20260908015650.84401-3-birk.skyum@pm.me>
 <20260908020711.ED17B1F00A3A@smtp.kernel.org>
 <20260908021844.42118-1-birk.skyum@pm.me>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260908021844.42118-1-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/26 19:18, Birk Skyum wrote:
> Thanks for checking this.
> 
> The test client is bound to the I2C core's dummy driver by
> i2c_new_dummy_device(). Unregistering it unbinds that driver and releases
> the managed hwmon child before the adapter is deleted. I reran the arm64
> KUnit image on the stated 7.3-rc2 base; all seven cases completed and the
> guest rebooted normally, including cleanup after the sensor-probe test.
> 
> The dummy-driver binding is also documented here:
> https://docs.kernel.org/driver-api/i2c.html#c.i2c_new_dummy_device
> 
> For the hwmon placement, I kept the small read-only sensor path in the
> existing EC driver, as huawei-gaokun-ec does. Guenter and linux-hwmon are
> already copied. Would an auxiliary driver under drivers/hwmon be preferred
> here? I'm happy to split it if that is the preferred direction.


Your call, really, but it is all or nothing as mentioned
in the other patch. Platform drivers are not documented in
Documentation/hwmon/.

Guenter

