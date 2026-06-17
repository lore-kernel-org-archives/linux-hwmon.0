Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708843AFCFF
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jun 2026 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781704469; cv=none; b=egMSk7OORSCJkK/q/1XJ/9CHigOeXjdWqB6nnftdxYjeXJDImpNWiwBl1+JsDa1x/Q2fckaLnZdbzQFPo0AOb2/+d5R5o18UhujAfrW9Zl54fNuyE7ZRxULrwWMa55ZJDacOSg8HqoaN1jDvIvyen+BUiTFV/5AEedtfMTurjcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781704469; c=relaxed/simple;
	bh=qi+Hi2uFWuj/NXIv44J56JWnC0zlhs9FIjEiauTi9Wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGOyBZepHc2jyLDjrh04nKt9hVVr68mZOTVAlHyYruQeGo/pSjaarXKiRZNKBRbdalzlMYiJcNGZWfHif6wrM7DhP7mY+J4+H8zZV2xRjov4ouZ0sMVz4MVntjrrs13pCuHEObF6V6eInMifSg61dMy+ARrkAZ7DmydOqxqqoB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGvHdxKU; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGvHdxKU"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84347ad88edso4189639b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Jun 2026 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781704468; x=1782309268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0qyYu9YrxKSv9f0N5eACl0e+paMMSeyEvrBmVE9p+p0=;
        b=rGvHdxKUgu4hDJxOhR5LVx5tAzTjUjAPFl+hHYtVg7LTdhD09TqHTpBLXAQocIpLcv
         skmZrW0EhmF4dAtajVbeTm/EYy1PN5sb79xQwK+1SqVpUbKQN+J3+iE1cxSJ/r1mb/Qv
         N4sUCLU4F36lJuHpWva/+sVi4JyUIrNs7GG0anLTzB8mFoWXp1VRlojuc7G2eYwijJwx
         j0XupAeURJ+hx+G9irhzicceFcHjZK63GzwPl/bb9pYVYBYBdl2v9U6Zj5jxgQyp4t5+
         9a7tip3bMPDEiwAWvLP4Rvr+SIMikGxiPO1r/30FPODyJMjhylxiT5ZWPKxRKZXhQcPz
         6z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781704468; x=1782309268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qyYu9YrxKSv9f0N5eACl0e+paMMSeyEvrBmVE9p+p0=;
        b=EU1tI/Ky4zzNc1lsgibYD9UKfgB99qCo/qnkCnqyoDYajEmYJfHjhcte6KQf5+FtYW
         v8go9kjhu8sgWvUXRXmgKXq1E2AWWgzurtojdiQr5aVHFNPDTyR+qFI2XT1DVb080wUT
         tTSNjbo89rgZOsGQKZhyaG9gPntlh3bK9fE87m0kOeHalZ42yMPWyQRFrGnl/HUqG5na
         OAdXToxizcaFQvPMV+QeDKlOVxTaCYJDsdswGWOypYKCKCjSN6F1M0fd5quEVtvDl4fX
         sHptUwv5sTLeSlStL+92FZcbQjEfOw03HS00+VYvMaQIYNxRuagat/oxBqIzxRixJuJc
         ESvw==
X-Forwarded-Encrypted: i=1; AFNElJ9PCWyMbYGPgiUAU339JSNmFUN7OgWkh/i/UcPBffEoWrN7RMhsSg+SGzt4I1vKx6KC8dFrC7vkNBxiDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhiwkqcjS85qJVwhYqgZi2c0on46h35yq9cv7SmlODa9B0Vh4f
	OAIOWIZIxQE2rZbR7A95S56Va5t/z2dTu5iNefziOqw8SClES89UWScL
X-Gm-Gg: AfdE7ckJn8tsJIguLJR4UIPkfhERrpe3Q5Q5hY3JZkBFPYD68I4hZvYyR0JGVQgD4Gu
	6S16FDhb+FOIXJPjSrJh/6vBkzE/Kc7QcgnmKj/OyoqXxe6drxaPAXKtTGOjxijiZd/HZDC8I0V
	BJdJIxJWhUVvfuH2z/TINxzaQ4RVqsD/d6OxktIzxF46K2x3sfmXo3qR6rNOS5R+couV0nZ9GNn
	cqRDn2Muun2PScvXyu3P7Z14lax5XPUVRD7/uMAoBuyYg1EV2UbidYsEzYTwsvGcsTsjh/7E40h
	si9u1Cq7o2yiiXzkiUmS0XbksP30Ckpje9T2yzxUtmO6mmOhA1giA8VocJv/zm2W6RiyKfm45k5
	XEKpJ56Go+bteuX06kNz6XuTEd/HKa2Xo2cJLJINGPU4a39Ztt649jXWIvEhcAbv3uwlIjeUK+1
	NSNNACVJ7nIZ37N4guf9Tk9FRbw2/p7RbJ6UccoP1N+koWSjPN6EWk1ZyOe9x8j6by6Q0lMjTK
X-Received: by 2002:a05:6a00:a221:b0:83a:4846:90bf with SMTP id d2e1a72fcca58-845245a1353mr4131365b3a.43.1781704467862;
        Wed, 17 Jun 2026 06:54:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acffd04sm16003336b3a.26.2026.06.17.06.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:54:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <55876e19-4642-4e22-b67b-fe5a8dd66a36@roeck-us.net>
Date: Wed, 17 Jun 2026 06:54:25 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] hwmon: adm1275: Support ROHM BD12790
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Wensheng Wang <wenswang@yeah.net>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 Charles Hsu <hsu.yungteng@gmail.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <8ca875d21f2d9a4d53a87b47a5e6efab48266178.1781591132.git.mazziesaccount@gmail.com>
 <e1673147-a51f-460c-ad09-21f54d3d6803@roeck-us.net>
 <7e430392-1b27-4c3d-bfc7-1311b9838156@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <7e430392-1b27-4c3d-bfc7-1311b9838156@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/16/26 22:56, Matti Vaittinen wrote:
> On 16/06/2026 17:08, Guenter Roeck wrote:
>> On 6/15/26 23:44, Matti Vaittinen wrote:
>>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>>
>>> Add support for ROHM BD12790 hot-swap controller which is largely
>>> similar to Analog Devices adm1272.
>>>
>>> The BD12790 uses the same selectable 60V/100V voltage ranges and
>>> 15mV/30mV current-sense ranges as the ADM1272, and the same VRANGE
>>> (bit 5) and IRANGE (bit 0) layout in PMON_CONFIG. It therefore uses
>>> a dedicated coefficient table that mirrors adm1272_coefficients, with
>>> the following differences derived from BD12790 datasheet Table 1 (p.18):
>>> - power 60V/30mV: m=17560 (vs. 17561)
>>> - power 100V/30mV: m=10536 (vs. 10535)
>>> - temperature: b=31880 (vs. 31871, reflecting T[11:0] = 4.2*T + 3188)
>>>
>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>> Assisted-by: GitHub Copilot:claude-sonnet-4.6
>>>
>>> ---
>>> Originally this patch was AI-generated. I did pretty much re-write the
>>> probe changes by hand, and also fixed some of the coefficient math
>>> afterwards :/ But yeah, this one was AI "assisted". :)
>>>
>>>   drivers/hwmon/pmbus/Kconfig   |  4 +--
>>>   drivers/hwmon/pmbus/adm1275.c | 53 +++++++++++++++++++++++++++++------
>>>   2 files changed, 47 insertions(+), 10 deletions(-)
> 
> // snip
> 
>>> @@ -655,12 +681,23 @@ static int adm1275_probe(struct i2c_client *client)
>>>           break;
>>>       case adm1272:
>>>       case adm1273:
>>> +    case bd12790:
>>
>> Please don't overload the existing case statements.
>> Just add separate case statements for the new chips.
>>
> 
> Hmm. Ok, although, here, same as with the BD12780, I would like the code to clearly show that the BD12790 is very very similar to another IC (adm1272). When we have own case for it, this information gets kind of lost as these cases are a tad too long to easily spot the differences. If there are any ideas how to ease spotting this while having own cases - I am keen to hear.
> 

You could add a comment into the case statement.

Guenter

