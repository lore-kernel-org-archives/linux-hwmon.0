Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A9223BD1D
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Feb 2026 01:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771636647; cv=none; b=o6PbB/1No/pui7A2aYTn9SkE1ppvaiuvlaLcRHxqSqOeohehzbJAGoCCn2bLrGHBGW8hlwk2fOhxHwBwduJI2tcK68vXUvmQPnD2rq1f01w3qVefKSHDAyYR+vw1yy3rs2/VxbSfOsQvvTx20wwiMOW+av0cAmQLvB5VXaseeU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771636647; c=relaxed/simple;
	bh=FzQVHmJODu+G3HNyUQgVcA5eBLWvbUIqTdOdWxoPD5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/oda11BApOKPGnOvjiX6/tAU1lWZoDxFg/mjnutgcH8MpPlZTzOcQF6bCAeDATeAGYLLs0fzcdDAeJPQDg+2ojf6R6IXvT9L07AbDje1uBOu4iAqViGFy5sSCFFi2mTvl4G8dWmW3SypSav7r1xzefK9nw0KwNMa4UnxDqAw5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L909svEH; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L909svEH"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12713e56abdso1895536c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 17:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771636645; x=1772241445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cq/oORE8SUUgFzgZ/eOT8NiZ5MP8bTXVkKNEhYsFzp4=;
        b=L909svEHpDRdtvzcMAHn4RerXEvvxWu9UDbh2XkTgtRww50FfMikJxmVPkeKBFB3Ki
         72MaEYYi6zXu8i48bp5XUhS865D/53SUHHqsc+EXbnBhRHBQ8/g9rC9JTDThDmqlQ+08
         FhxprRFdDKWc16EFbM1ybbXm92lIapIvx2gm0FY+Bq42i4tMWi/gtgeSDdg5MxYClPIa
         ZbYfoiHJg1qfsr5yVDFHdfjMpdTtX6augOCcIkwr/9R8JJ6Xaugs/bY+hU6DcO8PFKg7
         7iXlgy7c/qV34Lk+Yc3qTZZUKBVh7fBg6kaSnSv17oZ63LnBGJgqY3KUldpx2lRji6mU
         Ei4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771636645; x=1772241445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cq/oORE8SUUgFzgZ/eOT8NiZ5MP8bTXVkKNEhYsFzp4=;
        b=NNpsEVgwjGF+KrL0w9EmtomlCKw+0ewYYKOB1OFMhBw6B5vYNsa5ofx0R13ElcscYd
         VHnyRbLmIhc59/D/OkFmDqHpa7SHeFgrhtLfgayrRDHHH3GBdaRD3/dukDohw8wfia05
         K6Ifc4CYTe0OEEjQadthtBrFwgtWvnTammRnRhnxg0iSeVnnFb9Kh7PnP9k4Qu4Jz+q4
         zyNeX5VGcZuthvB1Q+1iI4VE6LiQeiHCevCE684/L5bq2HReu3l38Ik1W3HXYTgBW1Pe
         3xoHN5KJ/nWXNCIknUImsxEz/2rw6JrzwiBo/cgS87AKccRIVLyfLLoMULwpXtD/F9le
         JFxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy8/LtHhfupZ3Q7alzZvaCDd11YzU/P+JYVkBfFS7zzpn3uQmlayde+zbYwP3q+Pv5JWMwWxd6jOZ6XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAynI+ERaxhs75AnHC7ZW0JykSGoadg5Mzfdi57Rpxxd0eWBNE
	9rBBGLiWCiS9RTYcj0/kQgYhEMdcDOKC/R+ptPnGzqHouWKoiKaPLmf7
X-Gm-Gg: AZuq6aJnLfd7Rxgr6+jMdiA7sw/sLyNfp/yiIbeJE0YVH6e6ivgmSiy627rVbuqHzF0
	tobbSQ954X9KRu/GmaFsuXTyTqMfnrbwY7kxAiU2QD40aevlXgeSErOqLezO+vYHLOxBGHwUoZj
	jXGT3pZYPPJEoPzKhGY3vQftiu2pTBPB+w0DLUD5yoof0YdLLDg1B0sQiLx5aE4VwJCO/Ffkk9n
	Av24KUCRojD65nG5VzsK+v2p/etb9AZaSiWZE+1HmawhquI2m9v/qDCSO54Hq/pKlYXUZTkcsyj
	Rl6hFHzokksVbjXXThIUbtrJpLri94a9zoZLM2n16rkbXRoWViUaOqQZqixUVKrRNvUK300ojvy
	bPy51ncGZX3KsMXqANXKc8wmXSFYGgurgQfFcNCq9QHWl8c0RqWP+l5PaakG/7is5jjB4vwYVUS
	MEVpIwC5bvnfeyAn/cE8JLDWGNs/Xc1EZDTkowfJg3J3EA8p52kholuiRkfVA1U+MCzCzEQ2Tk
X-Received: by 2002:a05:7022:41a0:b0:11b:9b9f:427c with SMTP id a92af1059eb24-1275fa9dca7mr3005244c88.13.1771636645348;
        Fri, 20 Feb 2026 17:17:25 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7ae99sm990629c88.10.2026.02.20.17.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 17:17:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1c9b5717-94bf-4f00-982c-09938937cd5c@roeck-us.net>
Date: Fri, 20 Feb 2026 17:17:23 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, nuno.sa@analog.com,
 linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
 <0ae2d448-06e3-41f6-89aa-8aa3f939d64f@roeck-us.net>
 <4a9ecd101d502515d25a7f27a8043b6b592f510c.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <4a9ecd101d502515d25a7f27a8043b6b592f510c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/17/26 05:39, Nuno Sá wrote:
> On Sat, 2026-01-17 at 16:27 -0800, Guenter Roeck wrote:
>> Hi Nuno,
>>
>> On 12/23/25 04:21, Nuno Sá via B4 Relay wrote:
>>> This is v3 for the LTC4283 how swap controller. Main change is that I'm
>>> now using the auxiliary bus for adding the GPIO device (done depending
>>> on FW properties).
>>>
>>> Similar to the LTC4282 device, we're clearing some fault logs in the
>>> reset_history attributes.
>>>
>>> Guenter, in [1] you can find some replies for some questions you had in
>>> v2 that likely you don't remember anymore. Regarding the regmap story I
>>> ended up adding a secong regmap for the 16 bit wide registers which
>>> seems like a clean solution (if I'm not missing nothing).
>>>
>>
>> Sorry for the long delay.
>>
>> Actually I prefer the solution used in the lm75 driver: Map all registers
>> to 16-bit registers using a regmap bus. Would that be possible ?
> 
> Hi Guenter,
> 
> I intend to send the next iteration by the end of the week (finally!) but there's something
> I wanted to know if you have any strong opinion on.
> 
> So, the above is a bit annoying because of the energy reading which is 6 bytes long (so, 6 regmap
> reads). Given that our custom bus will now have val_bits = 16 that won't work out of the box. So:
> 
> 1. Either I directly use the i2c block API to get the 6 bytes.
> 2. Or I use regmap_bulk_read() with val_count of 3.
> 
> I don't like much of mixing regmap with "plain" bus calls but given it's only in one place, might
> not be that bad. OTOH, to use regmap I do need to account for it (and yet another corner case) in
> the read callback (so I do not use the i2c swapped version for the energy reading).
> 
> I do not have any strong opinion but I'm more tempted in going with 1.
> 

Sorry, this got lost. I think 1 is the better choice here. This is really a messy chip :-(.

Guenter

