Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD7D47885F
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 20:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772225986; cv=none; b=XGurrF6bmPB0YfvRUlWx8IrPYs7hu++y5KWK9h6LjES2lWulE2wUtU7hysFTiQ13b3NEe4M4EyNhzxZRAeVPxdv3EqV7uVpo1HhHthF9tMjDi+Xsddzy9eFDDsEbL7PNcTYamlmKx4Jgq5Iu84tgL4UslnL14j+6hTvQSz+l0zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772225986; c=relaxed/simple;
	bh=zUyTS8tijk9whGvjVkKBjDqLMlwwM2S448eMAMLZHHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PUu+al/nsvdxf5ZiAHt+F31ntucMsa75PsPkk6vJ3X3NNxAFGJBOP9EgGswTs7lzsGgOEu2PdVRDXxfyUIyf4A1cv6uuqxX1mcvjgAnAhD5MZcrpPZW1OIDz/viwRKZ6VwLomn66iFzDvMLS4U+ZhrqiXmML1lroDi9wbmfJH0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgbCj37J; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgbCj37J"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c70378ddaafso1644036a12.3
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 12:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772225985; x=1772830785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp/azNZS6Opx0sqAqS2UZOBbLw8KEa+oqsuoau8HW2o=;
        b=LgbCj37J1IYTJ4S2WrGTQEFpqlWo3V6GMlMO6ljyBErlsbEYIAGQR3wEjm5oJlZ3gA
         Ecq/+n6d1EF83kT9bOXuP9UWmVeLj4q1tpHVvXcTVhQuYpN0kcU99y/2tIVYwwQ0gKeh
         9v+vY8//cJtN8NF4AJIvnfJHzEhurJ436R1EyIwI2PMqt7RVBt6jMF85xrhDagpmZBv+
         A31tNpP6pry0YH+YQ+SqGjD5QURGH5CMgh0t0pv+XkwMuo3Y/VCz5rmh1VxAZrFfCewU
         TmENlEUyuwRNyCWqiq122A3/k9vacnyUh1HvqcUCNGdrw271f1DxxO6mk0Kd+n5kPFEb
         f28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772225985; x=1772830785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vp/azNZS6Opx0sqAqS2UZOBbLw8KEa+oqsuoau8HW2o=;
        b=Qd65q2v24ehs2fI//zKBR7wMsqShFO1+VAsy8yyQ7SStFMvtYYfYa/YTrKWHwo/H4L
         /NUEQnTrPa+GI1G4cG8G39NvyM2oRzfM1Ih9K/9qldgxisOXJ1ghA8qk3LBt2f6Cagld
         vxIfqC0Qmw52RAhKcZi1bwWSRJGCM9jL+Z4ifByMY9LqKKrn9fEgeJyc2r/tb4pbWLhe
         +3e3TDr+bbshUP5o48KpGr5uKsluzj8XWwvd0JtSo4dWz9b+iubNENW/RfqWXiNiR4kK
         PqaHlEdz0DSwxxuIQYtMTe7Vxt7veQOVeGuZ6TgVvBlyKZu+FU6pZHCBETakfRwicNVc
         BrvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb4TvViv0NY7wfOFo48Hn9+MgbLwtW0liZfVK4RRqdOA9bpD8gv4l4jcYKeSIdR8+h+mjwGJLPxZ5ECA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBI6OPIXFL+aGcwhCPk/EjePZxJ1ifPEn+aO2B/37VAFg7GPkq
	82DZ572o8TXpiFNAzpcfmFWUJ4FWfzcCU2lAF9exjVO/qHApFTcLjAIs
X-Gm-Gg: ATEYQzwNVEIln6Y5aJBhY01TIry9y8kdTFQdyts8UumLV8xxytzN3kD53r3plrRVFUS
	YCqnTsjnM4hm9M5pq7GqZceZ5CCfpPqmyMxZd+Ho/sMJOIiCH7dYpd4f6GHXTwjGpZ06wvt+UqU
	dbmGNvlHsEPP41WQ2YAfUPMsLoTA16CHJjX5DZbLhPhkt0NQ5txTF3tM84rq9PyHEPMbHoufkWV
	ytjfwexZWxhieQX9zfF21P0OeD1NTqPpcQ8u2BjftGOcgNZafvpgNAqi0uXcaOhFm/wloCUCoPF
	9hD2BOPctZ0gbMvEyf2qorI2m7zZSXwV7AiwSdTtFTQVPleKy5XDWAUyhfnO/sA3q4+xiJAKFZ8
	xzPlTrvyXXIjpDYQ8/SbmC02bj3YN7WPTq1OiZ0x7bB8MtpXavaxbTEaqx2zuI9WP2d7eBmeW4k
	IsSjJsVhixm7qC2zywBckiXYzmIWq2Venht/HFtYnrIxE49PPxWIUcctXe2PL+S7f32kVp2/VAy
	pWKJdhquw8=
X-Received: by 2002:a17:902:e786:b0:2ad:ca3a:ecb0 with SMTP id d9443c01a7336-2ae2e412a45mr43866765ad.25.1772225984836;
        Fri, 27 Feb 2026 12:59:44 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa65sm65236635ad.58.2026.02.27.12.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 12:59:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <749fa661-efc3-4096-8f46-94558dfd80bf@roeck-us.net>
Date: Fri, 27 Feb 2026 12:59:43 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] hwmon: nct6775: Register fan PWMs as PWM chip
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-pwm <linux-pwm@vger.kernel.org>,
 linux-hwmon <linux-hwmon@vger.kernel.org>,
 julian friedrich <julian.friedrich@frequentis.com>
References: <20260225125159.20822-1-richard@nod.at>
 <9c733024-8ad6-459d-ae5a-a9825f85c506@roeck-us.net>
 <1892064865.155.1772178411224.JavaMail.zimbra@nod.at>
 <163f68da-c31b-4ee6-a187-a81d14202311@roeck-us.net>
 <aaH3ZgfMiYuRhvp4@monoceros>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aaH3ZgfMiYuRhvp4@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/27/26 12:02, Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Feb 27, 2026 at 12:17:00AM -0800, Guenter Roeck wrote:
>> Hi Richard,
>>
>> On 2/26/26 23:46, Richard Weinberger wrote:
>>> Hello Guenter,
>>>
>>> ----- Ursprüngliche Mail -----
>>>> Von: "Guenter Roeck" <linux@roeck-us.net>
>>>>>     - Exporting a PWM for external use is only allowed when the fan mode
>>>>>       is set to manual or off.
>>>>>     - As soon as a PWM is exported, changing its configuration is no
>>>>>       longer possible through the hwmon sysfs interface, reading is
>>>>>       still allowed.
>>>>>     - Changing the PWM period is not supported. IMHO, it is too risky
>>>>>       since the PWMs usually control system fans and similar components.
>>>>>     - Reading and decoding the current PWM period is only supported for
>>>>>       one chip variant so far, for all other chips, a fixed period of
>>>>>       100ms is assumed.
>>>>>
>>>>
>>>> This is a good start, but I'll want to see stronger safeguards.
>>>> - Creating a pwmchip entry for a pwm channel must be triggered by
>>>>     device property data, obtained either from devicetree or through
>>>>     DMI or through device properties embedded in ACPI data. For each
>>>>     channel, this must be confirmed by checking that the channel is
>>>>     not associated with a fan control channel.
>>>
>>> In my case it's a x86 based industrial PC with direct access.
>>> What safeguard do you suggest in this case? A module parameter?
>>>
>>
>> Presumably it has DMI information or some other means to identify the system.
>> That information can be used to set device properties, which would then be used
>> in the probe function to determine if a channel is modeled as pwm channel.
>> See device_add_software_node() and friends to get an idea how that works.
>>
>> How exactly those properties would look like needs to be documented in
>> nuvoton,nct6775.yaml. I'd assume that the pwm channels would be described
>> in there just like for any other pwm chips.
>>
>>> Also for ACPI data, what exactly do you have in mind?
>>>
>> ACPI can be used to provide devicetree properties. The information is embedded
>> in the DSDT table. Conceptually that is identical to devicetree data. That is
>> not something you need to be concerned about unless you are responsible for that
>> system and in control of the firmware. Technically the company selling that
>> industrial PC should provide the information in the DSDT table, but of course
>> that needs to be standardized first (and then they would have to actually use it).
> 
> That would imply that derRichard has to update the BIOS, or at least
> fake some ACPI tables, right?
> 
No, I didn't say that. The board manufacturer could do that, but checking
the DMI data in the init function and using software nodes to pass properties
to the driver would do the trick.

> For me it would be good enough if the first consumer of a channel "wins"
> and others get a -EBUSY. Compared to describing that in dt or acpi this
> has the advantage that the use can be changed without a reboot.
> 

No, this is not acceptable. In almost all cases the pwm output will be
connected to a fan, it will be configured by the BIOS, and it may (and
likely will) be configured for DC output instead of pwm output. Changing
that randomly with "first consumer wins" is simply not acceptable.
This will have to be static and well defined.

Guenter

