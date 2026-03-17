Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24833570C1
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 03:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773719574; cv=none; b=GhyiE7HLkojg+ViL9ljrV1osaArKY3Rm50zIuA6Zzc2/StdSjbwD3hQNWaq/OHLyGhKrj4bnzI2VJ8Ddz/W5fGqUpNfUlVcAMxNttghM1he2WIRCKAxyr8UpV16+A7lTNtEtZuSiNQqakidlNfWlEjQhiYq+wLdzG6FOYP0DBMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773719574; c=relaxed/simple;
	bh=0SvX4m6vB3Urzbo1xNFUfeEerQYe8sJyA41Xo5c5wu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nN0JC0Fb6Z11XpFqWmt+O4lJyT5SHSs7SgDTbwZcc5/5OilUVHs/EtK9MrSaaeEtsbjKZ9oEspEnkvcLdeGYqFH03c6GvHg0yyQPaPpeD3NGshcvpWb3wpKEVGHeV1M+6TwNeLKoMBCiG+iDJuJuOM7gpMtnT1BZtq9IuYhr8Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqHitUvv; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqHitUvv"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c0c1e03405so172911eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 20:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773719564; x=1774324364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FadqkpcCJP+o15yZeX31CrCHgzxcCtkbDe0Mr1AZuZQ=;
        b=UqHitUvvvyzoaD+bXdKK8TXm9PX7vE0Tfv/ABG7rph6lsaLPWRd89NFP8HgFKw2kU4
         FtC5SPm7nu51NGyqf3k5apBUCK76gGZ4rjFiQ0YL8P1HUB5IvN+2AlGkHWWC1nOzt2IT
         IIzMOKOt/FIaL/JXlW6EkB5/poCYUJ3Ayz207icKNZB6OI9AYIrAhwA8jPZV5DuRaV/C
         gt7tmx3GBxQ8oLp6y8UwYoQAQ0ekqHcZF1QPbjdQJm+hNrEU8afR6T1Q7FRISulBUIP/
         F+NULLgiwQf5k6aO3eEndlWrd02gA0CiarnvUe4LDNqmsI/Q7taIvAI3LRjYM6qt5Wp8
         svug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773719564; x=1774324364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FadqkpcCJP+o15yZeX31CrCHgzxcCtkbDe0Mr1AZuZQ=;
        b=HYZ8vx3DGZMJYs9919bZ9ySSYYP+Xsc2z1oxAChrKvhQbbfaiUxJYyPcRGFLuAgYrA
         MqbX0N0lpvJzxpJe50Aw5tFs4y3ejwzBP96irY98JKVXS7wbZvOKid5Z2P+YbR2apEbX
         dDrvb+5bUQj1hMq0ykcjwUHLPXgjQUnEjTuGSMhbKY3Lg4aFdQYkDvqd7/kT/sGrrFNw
         oEjOM9znCBfT1htgTNDpzu2shvehlbh8r2XoV0qjNfum0Md7PIM1xEiAg1nFBMrzdKtt
         W7jBoUE1OjOHt9Rf1RsfZcsUWQdfHPZfJA3Qmt42ya3HKlrQGN3J7CFusPA3TKHC6nax
         2+wA==
X-Gm-Message-State: AOJu0Yyn0srjF9HWrMpnSqLmVuDmcukqzoGYDBwc3QHcLWZ+GsWWQanB
	Zu4msCEbcYIluXtgM3ltt/E3ykP6n5u2Eva0RdFhCyVKutXbBu3cILtC
X-Gm-Gg: ATEYQzxlt2UbesUU/dtopBWloi7XpaKj9XrJSOC4EqG+4ANq912AgB6COviRhUjVkxU
	LTsBhJjC6LeXyyDWxKuJNLYjfDFPkPkLzWVsVKdr+koxvOO2jMuqy/TonzZrHoWPRQBKp2AHhKy
	yjXgDfEQe7MVyKLKQxGzYP1WWhBHaUfBeAI3pO3Eacr17vNr3eTqnFoEKPzeIQ2zwybLqoBawLP
	8dKQSyjz8ONKVhbw5SeoIfre8bMhMmva4OnxxrCNN1siMg3njzflNvMCWSvh+rvJkYIhs8+VwNA
	3uNuTYqmYGTqOiQSfA81kC2EPXv4BPvdAAobaBrWy4y+qxbQvKo9QM3416C0QBr0SSF3za+p0eb
	gEl8TusbOPY+7jju8Lj/6T3A7KaToOVJX5MAYfYw/Ni0HlB1UX6rLN1XBs91l6zIf8nlK83QKfK
	BuPNLpcIeWaJgIgg4lEWGydTv9wFhbUsfe/riLizYA91xiHGAvxR9k99+VhZBZVv4+faLiQwqg
X-Received: by 2002:a05:7300:7fa8:b0:2c0:ca48:3107 with SMTP id 5a478bee46e88-2c0d5248965mr677007eec.15.1773719563694;
        Mon, 16 Mar 2026 20:52:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab525c5fsm17201908eec.22.2026.03.16.20.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 20:52:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <de06c50e-5552-46bc-bf85-439fc166879d@roeck-us.net>
Date: Mon, 16 Mar 2026 20:52:41 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon/pmbus: (isl68137) Add support for Renesas
 RAA228942 and RAA228943
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm" <magnus.damm@gmail.com>,
 Grant Peltier <grant.peltier.jg@renesas.com>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <35c39de7-773a-4f94-b495-97eb25555a71@roeck-us.net>
 <TYWPR01MB11935E8EA8F851E93FFE271F1D541A@TYWPR01MB11935.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <TYWPR01MB11935E8EA8F851E93FFE271F1D541A@TYWPR01MB11935.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/16/26 19:50, Dawei Liu wrote:
> Hi Guenter,
> 
> I understand that enum chips is not used in the device matching
> logic. However, it provides a clear, centralized list of all
> supported chip models for developers and users reviewing the code.
> 
> I added entries there to maintain consistency with recent commits
> that had been accepted. For example:
> - 71a117d28f87 "hwmon: (pmbus/isl68137) Add support for RAA229141"
> - 2190ad55a601 "hwmon: (pmbus/isl68137) add support for Renesas
>    RAA228244 and RAA228246"
> 
> Both commits follow the same pattern of adding to enum chips.
> I think keeping these entries in enum chips maintains code
> consistency and documentation value. However, if you prefer
> not to add them there, I'm happy to adjust in v2.
> 

What you are saying is that I did not notice the problem when reviewing the
previous patches, and that it should be ok to continue the wrong pattern
because of that. Sorry, that is not how things work.

What should be done is to drop the unnecessary enum values, not to add new ones.

Guenter

> Best regards,
> Dawei Liu
> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Monday, March 16, 2026 11:48 PM
> To: Dawei Liu <dawei.liu.jy@renesas.com>
> Cc: linux-hwmon@vger.kernel.org; linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org; devicetree@vger.kernel.org; linux-renesas-soc@vger.kernel.org; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; corbet@lwn.net; skhan@linuxfoundation.org; geert+renesas@glider.be; magnus.damm <magnus.damm@gmail.com>; Grant Peltier <grant.peltier.jg@renesas.com>
> Subject: Re: [PATCH 1/2] hwmon/pmbus: (isl68137) Add support for Renesas RAA228942 and RAA228943
> 
> On Mon, Mar 16, 2026 at 01:35:40PM +0800, Dawei Liu wrote:
>> Both RAA228942 and RAA228943 are digital dual-output 16-Phase(X+Y ≤
>> 16) PWM controllers
>>
>> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
>> ---
>>   Documentation/hwmon/isl68137.rst | 20 ++++++++++++++++++++
>>   drivers/hwmon/pmbus/isl68137.c   |  6 ++++++
>>   2 files changed, 26 insertions(+)
>>
>> diff --git a/Documentation/hwmon/isl68137.rst
>> b/Documentation/hwmon/isl68137.rst
>> index e77f582c2..0ce20d091 100644
>> --- a/Documentation/hwmon/isl68137.rst
>> +++ b/Documentation/hwmon/isl68137.rst
>> @@ -394,6 +394,26 @@ Supported chips:
>>   
>>         Provided by Renesas upon request and NDA
>>   
>> +  * Renesas RAA228942
>> +
>> +    Prefix: 'raa228942'
>> +
>> +    Addresses scanned: -
>> +
>> +    Datasheet:
>> +
>> +      Provided by Renesas upon request and NDA
>> +
>> +  * Renesas RAA228943
>> +
>> +    Prefix: 'raa228943'
>> +
>> +    Addresses scanned: -
>> +
>> +    Datasheet:
>> +
>> +      Provided by Renesas upon request and NDA
>> +
>>     * Renesas RAA229001
>>   
>>       Prefix: 'raa229001'
>> diff --git a/drivers/hwmon/pmbus/isl68137.c
>> b/drivers/hwmon/pmbus/isl68137.c index 78cff9712..da2484d42 100644
>> --- a/drivers/hwmon/pmbus/isl68137.c
>> +++ b/drivers/hwmon/pmbus/isl68137.c
>> @@ -63,6 +63,8 @@ enum chips {
>>   	raa228228,
>>   	raa228244,
>>   	raa228246,
>> +	raa228942,
>> +	raa228943,
> 
> AI:
> 
>    Is it necessary to add these entries to enum chips?
>    Looking at the rest of the driver, this enum does not appear to be used
>    anywhere. The device data mapping seems to rely on the variants enum
>    (e.g., raa_dmpvr2_2rail_nontc) instead.
> 
> It has a point.
> 
> Guenter
> 
>>   	raa229001,
>>   	raa229004,
>>   	raa229141,
>> @@ -478,6 +480,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
>>   	{"raa228228", raa_dmpvr2_2rail_nontc},
>>   	{"raa228244", raa_dmpvr2_2rail_nontc},
>>   	{"raa228246", raa_dmpvr2_2rail_nontc},
>> +	{"raa228942", raa_dmpvr2_2rail_nontc},
>> +	{"raa228943", raa_dmpvr2_2rail_nontc},
>>   	{"raa229001", raa_dmpvr2_2rail},
>>   	{"raa229004", raa_dmpvr2_2rail},
>>   	{"raa229141", raa_dmpvr2_2rail_pmbus}, @@ -529,6 +533,8 @@ static
>> const struct of_device_id isl68137_of_match[] = {
>>   	{ .compatible = "renesas,raa228228", .data = (void *)raa_dmpvr2_2rail_nontc },
>>   	{ .compatible = "renesas,raa228244", .data = (void *)raa_dmpvr2_2rail_nontc },
>>   	{ .compatible = "renesas,raa228246", .data = (void
>> *)raa_dmpvr2_2rail_nontc },
>> +	{ .compatible = "renesas,raa228942", .data = (void *)raa_dmpvr2_2rail_nontc },
>> +	{ .compatible = "renesas,raa228943", .data = (void
>> +*)raa_dmpvr2_2rail_nontc },
>>   	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
>>   	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
>>   	{ .compatible = "renesas,raa229621", .data = (void
>> *)raa_dmpvr2_2rail },

