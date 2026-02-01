Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D3C1E9919
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Feb 2026 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769959287; cv=none; b=r60PLXPbLNes+HE9sJgL4PgOu2N8luEBZ7WYBGiMlUahONZ2mf7Lpukxfk7LJ4kr/daSpG39z7VadD1moLdWitsKl4i4Dn1Q5aByvC7eZqw5u9k5lqKLyYZ9ecbOJgrOc/Z+hV3BQkaD8iFAIrOzwDMK0CGOs5CXuEIFpym1Cqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769959287; c=relaxed/simple;
	bh=lWLgrZlMdbQFynj0EsY24u1VnU69LSpC+29QXJ7GeeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njivOjawO9Tps7oe8RpUeatvKg6jDTaFxI9DZpADKrZeDfOWN22GH07AOQF2XF0qjoHqSGTKsEcFqHA9Ub9CtMhtPw/qLNkmy/OIcK2qlTc4BwqQhXOSOa1HS16QYwDea7wWFswNMjl4KkJ5YUE5g73yqTU0xn3XxWl+de62adY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIjzmsZS; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIjzmsZS"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b714f30461so3196412eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Feb 2026 07:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769959285; x=1770564085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9Xl7Ul0vWAc+/jN5GtRFvKPXPcL6ktPYcrY2QGjT26E=;
        b=kIjzmsZStIHcJJtwc6dxA7wBfVsLoB6OX54kJ5Hmt1p5skfmETQxHFbIfL5MI8GCCz
         qhdYYB7tfcrUYtNFliwe06iTC6yNM2eklCI9A9jXQJGFxQ/80+/6gPMt1rBmJwEjmwA7
         F+VjeOQxtm+Y/GEqsGOSYfJr4lUwDLILNwJwdfDXEZGYCGiJVlZ+W++/CVx/8wnfQHvF
         KOgX0uE4YwLnSnpz3D8LR3zNnD+WNPmiyM50kY1Sc0cmYJy3BM4V25AdzLRABj2/q0rs
         a3VVOtU7PdUP5ibIbBAdGQNzObzcqYozmcTPinJYLY92/JIUZ4mIUuohXGzSTDm6ClDg
         zRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769959285; x=1770564085;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Xl7Ul0vWAc+/jN5GtRFvKPXPcL6ktPYcrY2QGjT26E=;
        b=SZIxNW5GUIfe/2cH3+gMoa78c9ngkKamsIT1FwRdIChv2P79ZLgIJyGo8oBrZzsJKq
         z/td8NOh3RCXObG+9T5MATtIt/goEVaf+2A79glu/NmCMxiBAA//CpCG03lpaGI9H5pf
         qGAgB80YVwOsqqtVXiGtMGa42ETaDgliIwnKDlnZZE4Y+qlt2fO/8wgz6LDrkUvMdKTf
         r47RZxdjKxu/32X5jCDIYi9W9rICpSl1DGblL1tyfLT5DNnr4otGpC2pDKgT+DED38pd
         h6xfrVlHVioA4QAXxI0qGw7XLGWG/57GEl5Ql9/eb0weaZpnSu72ukHPBSL2hr0TSkgt
         X+gg==
X-Forwarded-Encrypted: i=1; AJvYcCVjy8BNCMk6KRByiudRcbtWO/rhr+S6PJHntzeZpDnLSxz4pBKqHqLPMUph9mx3BUTBeuC7a/1PqWoNmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7PFh4RaXMT4e2KlL9DsyMOkF0qs62uh4x7/8iIdboI3rybFx1
	f7QoGV04hujyzVxdjqgmhylw6lMCjbb/6R2Nuse3ao3z8eA4vzqfwYHW
X-Gm-Gg: AZuq6aLYQKsvVMOkvnkNe5v5nhs5sh/Qwli8QKvMcmSNxjHV8K9FIEQXnKZRwwwQrR+
	i2ADkmUc+BH8r6tDFiJNcNFAc4ZEEb1DF4/Fx7QUQlTJMKs9Pdi3K1qKHHJrIbdZI7HBBGCPPTn
	WD5jT0R9TWsdWRm/+AQUsYwNOlkEp/UKfO487fCJl3TP18/vjf2Tj5BpZVcjS/sl4TsblJnm9TU
	lXNGgRcN7AgJphy0uX90Q5p69sXDCHCVkNj90VTZb9L8gvfqtOlEyhzAafkBMzvMBE+6A8++gZA
	3wdpzHeZWjujzJ5+o8Q7uf/P7+GCllEofTTFT8+b7Q4SOx/YqyZsrhhn6NGeABz8UYlBXrLpk2M
	VCxkC1xTnoth7brZzLUQjv54YXcMGy4Xpxq/Zi9HcMcM3FjBAVmwyPWDHSCf5q19xCvBv1aWvrY
	aPm/UrdoJr4NCcHMeGEaxzqLlUvHOFY+2sUaiixXzwifY38ieyX/0MKCzlqrLV
X-Received: by 2002:a05:7301:3c9b:b0:2b7:3678:2d29 with SMTP id 5a478bee46e88-2b7c88f1771mr3831820eec.29.1769959284847;
        Sun, 01 Feb 2026 07:21:24 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ec51csm18310493eec.10.2026.02.01.07.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 07:21:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2e6f0437-0dca-41e9-ac80-f0843120cf52@roeck-us.net>
Date: Sun, 1 Feb 2026 07:21:22 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 linux-kernel@vger.kernel.org
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <c36306c5-2426-4a9c-9abd-9f3cdab17ed5@roeck-us.net>
 <CAJ12PfNkde6__QQXMiyBbEoHMbY3efmtsqgbyiKBtBmyfpX5Jw@mail.gmail.com>
 <2740c3ab-7cb0-4931-81a2-30b85e8615f9@roeck-us.net>
 <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com>
 <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net>
 <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com>
 <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net>
 <CAJ12PfMN5SOcYc6vBJEz57YVcxXAOker4WA61Xh1znP=i8aBRg@mail.gmail.com>
 <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de>
 <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net>
 <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com>
 <CAJ12PfM5xf0+Qy07S5OoLPkpnhZz+bj5a+hTSGTfrEFN2R6PCw@mail.gmail.com>
 <fb688a65-b2cd-4223-ae04-130b5657712d@roeck-us.net>
 <CAJ12PfOvDe5-tsuZGeGpOZh61MztorK08NFfDMV3mkP8dNpDfA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJ12PfOvDe5-tsuZGeGpOZh61MztorK08NFfDMV3mkP8dNpDfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/31/26 23:30, TINSAE TADESSE wrote:
> On Sun, Feb 1, 2026 at 4:25 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 1/31/26 11:50, TINSAE TADESSE wrote:
>> ...
>>>
>>> Hi Guenter,
>>>
>>> While investigating this issue, I previously mentioned
>>> about a flow where SPD write disabled state can be
>>> exported as a capability from the i801 controller, so
>>> that the SPD5118 hwmon driver consumes it.
>>>
>>> The SPD write disabled state is known to the controller
>>> driver (i2c-i801), but this information is not
>>> propagated to client drivers. As a result, auto-detected
>>> devices may be instantiated and probed even though the
>>> controller cannot support the required access model.
>>>
>>> This raises a major architectural question:
>>>
>>> Should SMBus / I2C controller drivers be able to
>>> advertise bus-level capability constraints (such as SPD
>>> write disabled state) to client drivers, so that clients can
>>> make an informed decision during probe?
>>>
>>> A capability-based approach would allow:
>>> * controller drivers to expose what is possible on a given bus
>>> * client drivers to decide whether they can operate correctly
>>> * avoidance of device-specific policy in controller drivers
>>> * consistent handling across different SPD-capable devices
>>>
>>> I actually tested the possibility of detecting, propagating,
>>> and consuming the SPD write disabled state using an I2C
>>> adapter capability flag. Using this approach, I was able to
>>> fix the issue even with the CONFIG_SENSORS_SPD5118_DETECT
>>> kernel configuration enabled.
>>>
>>> At this stage, I am not proposing a specific implementation.
>>> The goal of this RFC is to get agreement on whether this type
>>> of problem should be solved through capability propagation,
>>> and if so, what mechanism would be preferred.
>>>
>>> Any feedback on design direction, or existing infrastructure
>>> that could be reused would be very welcome.
>>>
>>
>> I think it is a good idea, but how would the flag look like ?
>> The i801 controller only write protects a range of addresses;
>> I think it is 0x50..0x57. So any I2C_FUNC flag would presumably
>> have to be address range specific. You could try adding
>> something like I2C_FUNC_SPD_WRITE_PROTECTED. Either case,
>> you'll have to ask the I2C subsystem maintainers for advice.
>> I would suggest to give it a try.
>>
>> Thanks,
>> Guenter
>>
> 
> Hello Guenter,
> 
> Thanks for the feedback.
> I have attached one implementation that I tested and confirmed to
> resolve the issue.
> I will forward an RFC to the i2c maintainers, and if you don't mind,
> I will also add you to the email list.
> 
> Thanks again for the guidance.

Looks good. I didn't know about the quirks, and that drivers are allowed to use them.
We live and learn. Go ahead, and please copy the hardware monitoring mailing list.
I'll hold off sending my patch upstream until we get a response; your solution is
much cleaner.

Thanks,
Guenter

