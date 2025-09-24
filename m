Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9DD8488
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 19:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758741378; cv=none; b=nPlInxAMstL8bmkPicjl+X+qTnvHL4RigJ2JhydtEiydjMxZ2QkVKtcYOH36IIofToDN6B0mq/hIXvE/ESK34ZJjnjvr03uIMoqyLjQFlIviYllLP/cPpK7H9ymp6hzVAZ7rIDF78eQ5DOpTgCvXk/Sbevd7rxSpknFqjLQRoEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758741378; c=relaxed/simple;
	bh=242uNVKq6KrYgnHaBQZ/+ePdOXDtoEPr1zTTT6LTAgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkbYD3orunU0VH/fPeSBTHlPKvVbFWmwcBWiRcu3uYE40vVgAXXL2mC/K7pAfVtNS61VGTZURpyRHgrPkvzHKEwrTE6U0ivF1eIJVeSi5lhrh4klGEcqsBndrKmu+9RYYH/tyDVIYSNYAs5wl1JffF8Hu4zF+Hr4HbCCW9eoc8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjcMMcd+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjcMMcd+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27d2c35c459so1352745ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 12:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758741376; x=1759346176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fGs2Zb6lt09bETnOM5YrvUvUmVqAndiGU5BiAiH+8xc=;
        b=JjcMMcd+qOTUsprAqT8IZgrmi5dLG3NPladk242QMpb29P5FH72DTOVUzNXFgKJ7xP
         UFOEn9aRlpRJDG66sZADk/kCb+Yb7ipwDQt1C1tglp9xKDfayrTxA9aitQNMWlGxJPo+
         1DXM/vh2qFQIkgqhUn976AIszk2S2leoa2U87nQ8j3GCbDDtE3pFAIcMW9DMXno/GwZ7
         pin33I4tVvrCNVU9W2U4+vSK8nCdANfm9vMA1i22+lekDeB7p5aGVoZTOBeqax2e9M1L
         gLOH3zcCMFx+04YPb9Rqw8tNjJlZSadOLMCG5NuwkUt4rJ+RejU8enwmTbR6d1dvKVcZ
         6jAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758741376; x=1759346176;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGs2Zb6lt09bETnOM5YrvUvUmVqAndiGU5BiAiH+8xc=;
        b=hoYJv6UVlkm/5K8JTF1IJj+dbCkB1vwXIEFXM2HUNbFo+yIxyk0lUqHBXRcskWyY1k
         SU4viwINDGxiRgOhhGlnrNAi41QDz2hbMH+K5zQUYzrV2t5g72zevwfA/zYVo/FvA/9S
         XGzQn9gaMms+oRpWwEjbolTYHa6WZF3iKcM8ShoL3tOI766G5SfMSpfZghZ0tIe38VDv
         gqXEYDM7gSjFGbTbHmZe47pP3y9ZTzmYqehIXTG25SJar7zxHLky0zMe9NGYOcXgHELD
         3ZyOJl4tKomvPz7aBjAA58qMJg8dc/Bb32LwoJOsVXcoj8QJLyPUA3gKQiZpmlqFVQRs
         WrtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ09gL1oBEeU2YUS+N6/Wa24LHgzF4l0XIEIrBI4+hu59M80L7hLGI25U0d4F+12beCsUnK4BTHxSwAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUmtNuovHD9Yg/iAKH7MPzpCMwc2BKe7MSfJ/65uZ4FmED1RJ5
	O37MAsg7l/Ss2pdqAOBi742/JeX7YH8vGCAhwQMslPa7vSZI7N3NLJwE46gKkZMm
X-Gm-Gg: ASbGnctNFJOL+Kk0jxdnh31x81DApFH7k4rFjGV9a6C8lfYIALD1XS0PNscqxAVivyL
	E/Ml09BUUZ1odR2vbFADvultnpbfk7eigjpG/yQ2WkYtGPxurMdarQ5Fs2HdfyG9QnDAFTcMn2n
	wPSdjFGxlAWTGj71bww5q4pLDYg6u2fyslTVR9XLiydnd2v2fH5S2YqFjgCMsSqxyIhljkuWuSB
	wsGPQRTpqmRtidcKOIyJ39x2+dsCFwF2egNn6UqonZYmc+08Ne+D3f4h6EcVz4DpxuerT1rvPPT
	29tURPp74yJ0PV+Dr2bchAg5oPeGWfgNFVXP4HbsPJXtN1hJ0shWUvDNcPcYeWnSA+8nOsfL7X7
	8vyb6GuX66oJKz/flughLGf/XfOFGYa3veWYD7cp4o2tQunvvvTxOEjG9fxQx0cFIShPEpY4=
X-Google-Smtp-Source: AGHT+IGzgLOm8oRRNNeox1ZmPlg/Ozpw8OvsNF5vjDP9jV9+fnCL6+cwPBpaHD2rsaR+/wdI6NuCOA==
X-Received: by 2002:a17:902:e5cc:b0:270:e595:a440 with SMTP id d9443c01a7336-27ed49e1af2mr9808495ad.25.1758741375887;
        Wed, 24 Sep 2025 12:16:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802deb48sm194706265ad.70.2025.09.24.12.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 12:16:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e6c8f022-ebfc-459c-806b-f75618f65916@roeck-us.net>
Date: Wed, 24 Sep 2025 12:16:14 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] hwmon: (sy7636a) fix races during probe of mfd
 subdevices
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mark Brown <broonie@kernel.org>, jdelvare@suse.com, lgirdwood@gmail.com,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alistair Francis <alistair@alistair23.me>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
References: <20250920114311.291450-1-andreas@kemnade.info>
 <20250920114311.291450-2-andreas@kemnade.info>
 <79aa98fe-b9b6-4210-a556-d33863f0129a@sirena.org.uk>
 <20250920233307.0c425863@kemnade.info>
 <473e217a-c6b3-4ebc-895d-85beab50267c@sirena.org.uk>
 <20250924090023.282ae450@kemnade.info>
 <b68d40d9-6ea9-49a9-8a2e-8b899f33340d@roeck-us.net>
 <20250924195358.16bbd90c@kemnade.info>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250924195358.16bbd90c@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/25 10:53, Andreas Kemnade wrote:
> On Wed, 24 Sep 2025 00:17:48 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 9/24/25 00:00, Andreas Kemnade wrote:
>>> On Sat, 20 Sep 2025 23:18:59 +0100
>>> Mark Brown <broonie@kernel.org> wrote:
>>>    
>>>> On Sat, Sep 20, 2025 at 11:33:07PM +0200, Andreas Kemnade wrote:
>>>>   
>>>>> Just for learning, yes, it is an abuse of the _optional for non-optional
>>>>> things, so a dirty hack which should not go in, therefore RFC. But what
>>>>> happens more than having the hwmon device endlessly deferred at worst?
>>>>
>>>> There's also the fact that this API is so frequently abused for bad and
>>>> broken reasons that I regularly audit users and try to fix them, I'd
>>>> rather not see any new users that don't have a really strong reason to
>>>> use it.
>>>>   
>>>>> The wanted regulator is the one defined in sy7636a-regulator.c. So it
>>>>> is all an issue internal to the sy7636a.
>>>>   
>>>>> Both subdevices are instantiated via drivers/simple-mfd-i2c.c.
>>>>> I see several other solutions:
>>>>> a) call device_is_bound() on every other children of dev->parent, if not
>>>>> bound defer.
>>>>> b) do not care about the regulator api at all, just check whether
>>>>>      the corresponding bit is set before reading temperature, return
>>>>>      -ENODATA if not, some mutex is probably needed.
>>>>> c) do not care about the regulator api at all, just set the
>>>>>      corresponding bit (together with some mutex locking and counting).
>>>>
>>>> I assume this is using the regulator API because someone might use an
>>>> external regulator in a system design for some reason (better quality,
>>>> power efficiency or a shared reference between multiple devices I
>>>> guess?), or because the supply might also be used by external devices?
>>>>   
>>>>> d) copy the of_node pointer from the parent, add a regulator phandle property
>>>>>      to the node pointing to the regulator in the node itself.
>>>>>      That sounds like your idea but is against the current dt binding for
>>>>>      this device and afaik it is uncommon to have mfd-internal things wired
>>>>>      up this way
>>>>>
>>>>> e) something clean, simple I miss
>>>>
>>>> The idea is that the relationship between the devices should be
>>>> registered before the devices, that's how the regulator knows to defer.
>>>> We used to have an API for doing this for board files which might fit
>>>> here, but it got removed since nobody wants board files any more.  If
>>>> you're allocating the devices dynamically that's annoying to implement
>>>> though...
>>>
>>> looking a bit around:
>>> max5970-regulator.c has hwmon integrated and no extra device. That would
>>> simplify things. Although it does not report temperature. Some
>>> touchscreens have temperature via hwmon, some others have temperature
>>> via iio, directly in one device without mfd. Maybe that is also
>>> the better way here?
>>>    
>>
>> Touchscreens reporting temperature via iio is in general the wrong thing to do.
>> Touchscreens report the temperature for monitoring reasons, after all.
>> But then, sure, if you insist. I am getting tired of arguing.
>>
> I apparently did not make clear what my question refers to. It was more about separate
> hwmon device + mfd vs. integrating everything into the regulator driver.
> 

What I keep failing to understand is why people keep avoiding the potential of
implementing auxiliary device drivers, since that would be the perfect solution
and match the intended use case for auxiliary devices.

> But since you brought up the topic hwmon vs. iio for temperature. I do not have
> a strong opinion here as long as I can somehow live with it. Nothing I want to
> fight for. One sensor I use for measuring room temperature is hwmon, another
> one is iio. So it is all not that consistent.
> 

That doesn't mean what exists is consistent or even makes sense. Some driver support
for chips intended for reporting the environment or chip temperature are pushed into iio.
I have no idea why that is the case. Yes, that results in odd situations like yours,
but there is nothing I can do about it. I can only guess that _someone_ is pushing for
submitting drivers into IIO instead of hwmon, but that is just a wild guess. You would
have to ask the driver authors and/or IIO maintainers for reasons. I am copying the IIO
mailing list for feedback.

Also, again, I am tired of arguing, so I typically don't even comment anymore (if I even
notice) unless explicitly asked.

> But what is the hwmon equivalent for
> devm_fwnode_iio_channel_get_by_name() + iio_read_channel_processed()?
> 

Assuming you refer to the exported functions for in-kernel use, so far no one has
expressed a need for it. The best solution would probably be a hwmon->iio bridge,
or equivalent functions could be implemented and exported.

> I wonder whether I really need a thermal zone. It adds stuff not needed here,
> trip points and polling.
> 

The driver _registers_ a thermal zone, but that doesn't mean it has to be configured.
If one is configured (typically via devicetree), it is obviously needed.

> Documentation/hwmon/sy7636a-hwmon.rst seems to be wrong. It is not
> SoC-on-die temperature, but temperature from an external NTC. And
> that is typically used to tune the EPD refresh to the temperature.

Please feel free to submit a patch correcting the documentation.

Guenter

