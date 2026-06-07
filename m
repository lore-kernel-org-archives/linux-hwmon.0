Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72F72E1C4E
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 23:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780876602; cv=none; b=bmCiyR8uADqDms7Y2OhcpSdbef3oH136wC4M6Coyh5Y8yu00S3CWzKCdU4bZpQao12fw3MxLwK9Hp4ztv9B+dDPpjEpH/Uf5qWBA7VpD7TAycHkgY5U4z/LPUYaXS4h0jD9EbkQtH3UBH0w7nVjlgVGIDSFBly68rprgY9UUkwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780876602; c=relaxed/simple;
	bh=H59OzCN5fIKPbGRUUfb6m96s+QF56Qf+23fBb/qM9tA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hV1BORHR7V4gwc935V8y2f9194J2yFscxU7fPkxfjBzuhj5GJ4mNQAOP3BWp72r1kNjQ8UoqNIM+02HEpF8zZYU6PErqCiOyOxAB2n91fBAiPWpkz56sfKp+A5SgPsNWD+wbFQsu9hQi1T00RdDf6tEjsDI5YNp1h3Omoec8kVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuD6m58S; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuD6m58S"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso25032735ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 16:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780876601; x=1781481401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mQEY43TKXmVzVuz2rt6OfQ1VUbuizVngZzaF2qvwCqk=;
        b=UuD6m58SIs51PHcr6efon6ynkzT+sRxt/muslvmjHiKH34BuIBpiE5UyqNhODvpZ77
         +ZU+SZCmPUa96+Pb2AnQD+no8yMGtOXFn1IzY2m0W5D5/oit1hkgC1FaYauk35GfJLa1
         ikip2sZXXv+Qj2vEXw3CrFjgyKQgKV4CAbcJrwGXDzLyujFtgUU7lZj+40fRkLKRgrVu
         n2BbiOaUnTdpJOMDvhfb7fUcCSWflgjuz/Tqwzd5uRx3ODV94s9zOoXNczWsJwz2kAIc
         gcAxHAxauS7sQ8131mUrKOZwUfVksJh3zzGwnr5F5YE/+9CmCLIcruYW6kuce1rpXMQh
         ZZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780876601; x=1781481401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQEY43TKXmVzVuz2rt6OfQ1VUbuizVngZzaF2qvwCqk=;
        b=V0ME0SuJbno9nl1HFFeG7VrhOxVcfIa3ozp4luj3KCqa99Tg2L1008e31uYtdPMZlY
         Pyp0GihaSHhWul5U4vcroZf4am106zD9mAEKaIEP5f1Lt8RurwsViVlt5+mJtgyW+Jxz
         KlhN8arwl+2n9GUu4WLxS10+5bV5zV3I/AkgDEa+ET+36QHwzkP9qClgINUGz4g338jg
         VXdqWlTmVBAYZOx49KBOdJ+PoVUE/fXX4rZyP9mUPew4fZ8zFMPfhYeNU2xa2y3ItzMK
         2ZO8Y+JGYjKSviByitDI0VW6o5Fx29fI8wlZS+Q4uu+E/EpnHhIeFyL3NdfREAGHYlXM
         g5rQ==
X-Gm-Message-State: AOJu0YwmtYbEVZxFwZxyEitrLUl1WI64sOM2Wcj1S3R/gTuMSsu6db6c
	bw0zd8msqvmMZN6B4tUurjeVd2g33VRkLuWDhRi3rP80xDjeIUN/5IZs
X-Gm-Gg: Acq92OFsxVy4mRichIkGeCR6MknGp2O4ED6XiQiFhkQkVU/IINIVP3eaHS7MCqn3RG9
	SXx+99RCvPQh/A3J9XBi9EGgIlis9S8+SvWFiumKp7psSYLnaOkVk9zE2jM9uNwXSVoisaMoYKK
	6VMJc0J1V9AcB6lmnTnUg2f/l2XyQlEmW+FJ2U920dffGHeQD628ETPRe9V2ojhVWbVTqxJS02I
	nm/7NWjwdHN9sZ1sV0jW59IRsKJko84oep2sWnE8wb+txcxZVOjp/rzKPEKOQBL4sNWZ8F2shkB
	AW+SBpPzi/yd5aa3DAxODMDrg3PC/gWcSQW+D0fGDjoq9deb+CgTgz/3fY1Jg3zRR7DBCY2pX4P
	x98jklwdzzLsvg7eWKPaFquQbkI7cEh3UJuoW0IdGh1RGLVwYwX8ovKD4z4bTeXD/GhZ46z8HP1
	x+Ugmtdfudx8lKU2Rdobwv0KbRxo4QeSHPejMSumIz+e0WtGzYjrB/oNg0r6Jl+QMef8RBXivtj
	cqXDlAoyUQ=
X-Received: by 2002:a17:903:4b28:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2c1e89579ccmr133614095ad.35.1780876600973;
        Sun, 07 Jun 2026 16:56:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e2e2sm156389165ad.49.2026.06.07.16.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 16:56:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <73557336-94d6-4eef-bcc3-da59af188f86@roeck-us.net>
Date: Sun, 7 Jun 2026 16:56:39 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
To: Conor Dooley <conor@kernel.org>
Cc: linux-hwmon@vger.kernel.org, Lars Randers <lranders@mail.dk>,
 Conor Dooley <conor.dooley@microchip.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Daire McNamara <daire.mcnamara@microchip.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Valentina.FernandezAlanis@microchip.com
References: <20260527-earring-bully-eb4a268c2e68@spud>
 <b49d4781-0827-4f26-9ca2-ccd177f90237@roeck-us.net>
 <20260528-defog-lasso-84891a72775a@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260528-defog-lasso-84891a72775a@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/26 15:34, Conor Dooley wrote:
> On Wed, May 27, 2026 at 09:07:20PM -0700, Guenter Roeck wrote:
>> On Wed, May 27, 2026 at 10:06:11AM +0100, Conor Dooley wrote:
>>> From: Lars Randers <lranders@mail.dk>
>>>
>>> Add a driver for the temperature and voltage sensors on PolarFire SoC.
>>> The temperature reports how hot the die is, and the voltages are the
>>> SoC's 1.05, 1.8 and 2.5 volt rails respectively.
>>>
>>> The hardware supports alarms in theory, but there is an unconfirmed
>>> erratum that prevents clearing them once triggered, so no support is
>>> added.
>>>
>>> The hardware measures voltage with 16 bits, of which 1 is a sign bit and
>>> the remainder holds the voltage as a fixed point integer value. It's
>>> improbable that the hardware will work if the voltages are negative, so
>>> the driver ignores the sign bits.
>>>
>>> There's no dt support etc here because this is the child of a simple-mfd
>>> syscon.
>>>
>>> Signed-off-by: Lars Randers <lranders@mail.dk>
>>> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> Guenter, there's one question here about the unit that update_interval
>>> is in, I didn't see anyone else using us, but I assume that's okay since
>>> the resolution that ms would give would be 8 steps only?
>>> RFC cos the question is also in the driver as a comment.
>>>
>>
>> That just came up in a different context. We'll add a new standard attribute
>> update_interval_us. The existing attribute MUST use ms. Everything else
>> would be an ABI violation.
> 
> Cool. Sounds like Ferdinand is working on that based on the other
> thread.
> 
> Do you think I should support both update_interval and update_interval_us in
> this driver?
> 

I have been thinking about only supporting one for a given driver, but that
doesn't work because there are existing drivers which would benefit from
supporting microsecond-based intervals, so both it is (unless you want to
wait for _us support to be available and then just support that).

> If yes, should I do the ms version now and add the us version later once
> Ferdinand's work is complete?
> 

Yes, that is what I would recommend.

Thanks,
Guenter

