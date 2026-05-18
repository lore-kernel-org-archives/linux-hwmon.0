Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9630D3AC0E7
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 22:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779143153; cv=none; b=N42esIqHk0enSIiYFtdM8eMGRepglYaIrJj3tjOVV2g0ohV44IDlvx+Ryfg8LX0LV4T1edvRe0V3lSWR3E6/ExDzUkZpS5iEt+azjtDl4xJk7RRUVZbnswypwKB/J6ej+fJnlbN+xEgmDd2KEnv0U23Q4hw87w8srF0/fFUCEZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779143153; c=relaxed/simple;
	bh=zxRp3GpglRdru2dzTviXae9Rm0zTVlUvDkO9Kg86QvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJnC4kqHc6lJ7lutznoSBaaiSZVGA0rwU51bSNAMw6OIxB9AopDaF7OJynQyAid1Rn0lGySDs2q915Yizxvhk44iS8+A6WLc4uKvkhiaCXllEyJEPwgaWviBD+6HBgRN7eqVuePCjb5Q99kxCKm9dMpXbWxzQOfoG4ZzbRYvWwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEeiLXmE; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEeiLXmE"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f33ae12f97so9992734eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 15:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779143151; x=1779747951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yIaEBuVIsiHcibkjeCjIYH7vswglxKBI9QeKiz+liVA=;
        b=pEeiLXmEX1dH3AEUNPqXyf6i3YCHHzeUFsdtHafZgPGSgERaad9XB3AxjltZnBaWd9
         tkIp0sMspu0BdbdAQxcab+qI9ACP2TO8ib9nEyzD0/rsepA6028hN6FgOkaiWUrTcVWl
         A+qSOvtN/grWqO9yKYCcxyuP7x0QnPnyLkVs1efuTRBE9Dwwbhbz/C5r8n3iSuKxoQTT
         0DzBJuu8rJ2XJbUeCsECscPExY1j5/cwIijXDf9VRO14cLgw8K8FikqbldHvNjZ/6ONc
         gOPFB26X+K1LehWwtiWM9BsbK+7k/71kdgyuhDHuH+v21YwAKqP00aH7opXwr2Hlk03j
         Ealw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779143151; x=1779747951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIaEBuVIsiHcibkjeCjIYH7vswglxKBI9QeKiz+liVA=;
        b=LEUfcOsah60vSt3VWwTkZYQINOWe/I0wF97wWbp8TIgkpQ4DvrKAJL9L0M1qRvEn2D
         KrAYSkpRwpgYaSG0pSSd3ftwKFj6uYwTnD17ougK/zYho4HzY4G/hwqntGLNr0akNT0D
         Fyp3lyE1ilWU94cJSu1iI5W+w+T3NCSW58M4m9dh45vj0qQtyAPwRRimLVcR2RhnIzaw
         AAxa5xHhbzEQ5YSDQD7qDzDs7wto1pO+7eE6fcThAVRBri0qrL8aJnNO1uiMRUsebVLk
         GUN4hPEAZYTLNnh2MySbKhGp08gSgb6kXfo6p1GTA68+1z+u1t+g4jN5H39dmEM7kmFB
         9vqw==
X-Forwarded-Encrypted: i=1; AFNElJ/W+CTUqnSWu9x1+veNCfwpT2dQ/sjTKKrE+KSZAQBzMPvruEZfJ6Zxt6jMhD2PgO1P8QpzLUzoukluAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGK0gKVFTUolt3Kxur1YMRKmGY1ftoz64/KvtK84I66leMMSoO
	gULW4sZjhB2Fv3DrMWItQYKd6vLtQtQiIBOYZPrcy5XJyCI1i0lgtjvN
X-Gm-Gg: Acq92OFQNrAOeyMkBmq+N73SFJwNlihqZrXsfaIdWsgwiD92H/8EXJB6s/qMNN8HOB0
	oXsqZ+RX7MlV8lTsMLxSMv7urDH0zCuAi7/pdAmZ5PHMIprG2df9yghYjbKDqU/97z6VVbMZKAh
	tgvleHCeogLhgTCpzRYSFOD+mBrDeY0vzZhs+z9xAQH93YVethxQqyklVyviNt015zEoflrrfV8
	snNh8UnMBAV54P2yx/xrGZUgJXLMDwR5LfMvSgeRFClhADbOvNxReXqDjMxtGdEZQkwscf2vzbW
	2kv+oVvJ6D53FSiz321oYXx7mMyQtXHGX0pryMqpGc1CeWsMQSLUVLVvEuvsh/XTWEkTh7YQu6i
	iCs72d5NJmANPvUOIrhFkmR9TEORTCTtVkXkH103FURLtgdUDjxY7/FfY22+gzW3kloMfc2G+Gq
	a4lrGkb6mHcozU+GvrZLG1btKp9hR4OInvMO218X0ic5p8+5cJhVBrTxtBEgpOwsY7OfcZUQqQ0
	wzrRBACz04=
X-Received: by 2002:a05:7301:1004:b0:2c5:b972:b436 with SMTP id 5a478bee46e88-30398652460mr6944628eec.23.1779143150537;
        Mon, 18 May 2026 15:25:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm16657384eec.15.2026.05.18.15.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 15:25:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8855d587-8351-42f4-8f79-9e763f56ccf0@roeck-us.net>
Date: Mon, 18 May 2026 15:25:48 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] hwmon: (pmbus/adm1266) adm1266_gpio_get_multiple()
 fixes
To: Linus Walleij <linusw@kernel.org>,
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Alexandru Tachici <alexandru.tachici@analog.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai>
 <CAD++jL=rasuYTot3M8u75PXRgrhbCzpue=pY2Yxx7ymVwhgGGQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAD++jL=rasuYTot3M8u75PXRgrhbCzpue=pY2Yxx7ymVwhgGGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/17/26 03:44, Linus Walleij wrote:
> On Sat, May 16, 2026 at 10:45 PM Abdurrahman Hussain
> <abdurrahman@nexthop.ai> wrote:
> 
>> Two pre-existing bugs in adm1266_gpio_get_multiple() that landed
>> together when GPIO support was first added (commit d98dfad35c38).
>> Both are reachable any time userspace queries multiple ADM1266 GPIO
>> or PDIO lines at once via the gpiolib char-dev or sysfs interfaces.
>>
>> Patch 1 caps the PDIO scan loop at ADM1266_PDIO_NR (16) instead of
>> ADM1266_PDIO_STATUS (0xE9 = 233, a PMBus command code that ended up
>> in the bound by mistake).  As written, the scan walks
>> find_next_bit() up to bit 242 across a 25-bit caller mask, reading
>> out of bounds and -- if any of that incidental memory contains a
>> set bit -- driving a corresponding out-of-bounds write to the
>> caller's bits array.  Flagged by sashiko in review of an unrelated
>> fix series [1].
>>
>> Patch 2 drops a redundant "*bits = 0" reset that sits between the
>> GPIO and PDIO halves of the function.  As written, the GPIO bits
>> the first loop populates are immediately discarded before the PDIO
>> loop runs, so any caller asking for a mix of GPIO and PDIO lines
>> sees the GPIO half always reported as 0.
>>
>> [1] https://sashiko.dev/#/patchset/20260515-adm1266-fixes-v1-0-1c1ea1349cfe@nexthop.ai
>>
>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> The better option would be to:
> 
> 1. Convert this driver to use regmap

That would mean to convert the pmbus core code to regmap,
plus all the pmbus client drivers.

PMBus uses a mix of registers/command with different size, plus some
block commands. That would be a difficult task. Byte registers can be
mapped to word size, but for block registers that is difficult,
and then there are commands with zero data length. Maybe someone
managed to do this somewhere. I tried some time ago and could not get
it to work.

Guenter

> 2. Extend gpio-regmap with get/set_multiple()
> 3. Convert the driver to use gpio-regmap
> 
> So if you feel adventurous and have time on your hands,
> consider it! :)
> 
> Yours,
> Linus Walleij
> 

