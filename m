Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C94282F1A
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 01:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775006107; cv=none; b=mEpU/SIMNMyFPDT8OAWj5LccVRN5TQlvILtCXoXbWT3rBx4oowJWzPNClmaciETPAdi8z0TMQov34WyiuhvYKe0nEPGhOE1zhjEMMuF76UWx8fm+UY8eMhSjhC7MqsROeNpZJR+bN4JCC7mDDYiB+1b8j/3gizVVBPwncoZLkyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775006107; c=relaxed/simple;
	bh=7Oora+SpNHTeIJQ7SmoEn0XPxQpv6Dx9z9WVs+FV8Cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JH57BiGEKyKvLDcvoGe1PTx9Nt+jecoJU+PKG4bbtJf7d8jc8y4eMhaK8Gpaj09+cBfEU0dGCEYodfldX0aIA2kqj3YW/jklDwLoZ99cheRGTT9eDwJqC+tdcGT0LWh0OwElSadC4OzwUnDNXxFK2gRls56OyS8z9J84KHi5oE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTmRsSuF; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTmRsSuF"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12a693cdf29so466966c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 18:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775006103; x=1775610903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DxSr4fbw6bIEQZe3QnfwmTyIhs/KxLrwwYu0FoW6pxY=;
        b=LTmRsSuFL4GZbAyp/iReCCRxTeU4c+sLKKiv1YpUiX3bJkbVZhaxCxkc6ub3igH2Yk
         tLal+921MbvvPoIRk8VOX4KBk4fxX2BV6LxD0KfANLXCjSw/B3FVGa0gaFWiu+oOnwkx
         506nOG2UNySJX9nQqkhRPlrbx/RGufYQtHJoy3Ax5NABq2oc8oeHwYmYZSoird3KUbgg
         NwmHbjLKxljAe3SnBy27aRHrtw9w36Nd65qymbRz2M+vnuK1KhVW36tO4y1HcyE1XQEu
         nUSe60TdCg2HQXV8nNRWce31Iwqntca52g05hEWeEc4l96/B6x2iEgdLbYdvLaUPm6JT
         MwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775006103; x=1775610903;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxSr4fbw6bIEQZe3QnfwmTyIhs/KxLrwwYu0FoW6pxY=;
        b=SJN1OyRDcLEMDIJxMdCrkmr20jIkBR0Mrv0C4yQYdyNGgj4hrnR+u3FS2oNHwtG42/
         xuoccsgteEanGJ87uz85oUjngqXLomSR9vlQnsptD5ohqjJ3HjlD0lAjs+Xk/1ACDbqW
         HncNw0jKUWE74r3MBvLlxppwz7276Lsmf5WTnBTDVQ93IOJLCRWdxrtl/wMrKKt1qSKB
         qn4KT4hJqPcGyXtMDl4YCoA7I8pfMg6zqsCFuRDYcYEcZNgZxJYlkLPdAKIEOy8pq6wn
         1bxJ7T41vfKz8rcW4BU+2fnB/SOfe/+ky9UsJAQ6FUr+EU9xFBP/0uPyfRS6PaIvFhfb
         NP/w==
X-Forwarded-Encrypted: i=1; AJvYcCW6loVoF00IBDib8BNdIuJc2DQjL/et2N/USdp5DxSt3f++ajJQA4LaTGKb98PRphk8Cf6V8w9FkA06yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZqWqNPuW24pd6ASOc582bO22ynnHSDQT/V8CpPIICA1xx/PZL
	5okKw6jkMo4f3v8hMAuxOgqP7uOqXDqEvpaqBjVeKPF7Is2WoeZxRg+F
X-Gm-Gg: ATEYQzyFQLkPZcYxmo2axLPYiLCw1dDSxhjt1Fb/Yix2cx/WKOIdtx9O4uGXNWHNFxm
	oIZXSDkJ8N7A816Y8MELE3cZrPI113SieNpGlz8bwrqU5ELTZHeKST6lG8fRozjHaacDWulkDXi
	aaPETxMe4RUUzVvteIYtT1lGDg1iymzHc+ZN3BsDrYypkK8V84Q8bXhfr/WCsNzoY+NVBR5N0VD
	65yItRwBtMUm149wmJ12R+JQ/UVcoqA6vx/1DgfSbKBZiUDEYF1QLRJNPFCVWaPRsKZRi26XnYS
	P7DDswTnZMdlklmBEjEiF0b0oKQ/BLeTjVYrw2B/jf/J5qY1VT0QD4nrrNYpOPWcOWZJuccIn/u
	gqhuufZ5gV+NmAQah0VRFfTDjCI+MjbxyN0jTQhHmHe06Q7xK2febOqSj26+/70C+Pe9TCaLkLo
	AzeNkYb2osVypqt+PMUsecWUPSzvNA+Itlg3Bb9ZxKGEEhT7fpBcVw2+pypLLmqTfWmF08m5w2
X-Received: by 2002:a05:7022:4a6:b0:11f:1e5b:2dd6 with SMTP id a92af1059eb24-12bddefb9b7mr2825597c88.17.1775006103352;
        Tue, 31 Mar 2026 18:15:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97e7a57sm15328420c88.6.2026.03.31.18.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 18:15:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e92f45aa-564d-49bc-a2b9-e01f396c0ce9@roeck-us.net>
Date: Tue, 31 Mar 2026 18:15:01 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: pmbus: Add support for Sony APS-379
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260331231916.94662-1-chris.packham@alliedtelesis.co.nz>
 <20260331231916.94662-3-chris.packham@alliedtelesis.co.nz>
 <b4b2642c-35d6-410e-8e44-b3860dc551cf@roeck-us.net>
 <c41a0423-d81d-44a4-bee6-79f5bc66e961@alliedtelesis.co.nz>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <c41a0423-d81d-44a4-bee6-79f5bc66e961@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/31/26 17:26, Chris Packham wrote:
> 
> On 01/04/2026 12:56, Guenter Roeck wrote:
>> Hi Chris,
>>
>> On 3/31/26 16:19, Chris Packham wrote:
>>> Add pmbus support for Sony APS-379 power supplies. There are a few PMBUS
>>> commands that return data that is undocumented/invalid so these need to
>>> be rejected with -ENXIO. The READ_VOUT command returns data in linear11
>>> format instead of linear16 so we need to workaround this.
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>
>> Feedback inline.
>>
>> Thanks,
>> Guenter
>>
>>> ---
>>>    drivers/hwmon/pmbus/Kconfig   |   6 ++
>>>    drivers/hwmon/pmbus/Makefile  |   1 +
>>>    drivers/hwmon/pmbus/aps-379.c | 196 ++++++++++++++++++++++++++++++++++
>>>    3 files changed, 203 insertions(+)
>>>    create mode 100644 drivers/hwmon/pmbus/aps-379.c
>>>
>>> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
>>> index fc1273abe357..29076921e330 100644
>>> --- a/drivers/hwmon/pmbus/Kconfig
>>> +++ b/drivers/hwmon/pmbus/Kconfig
>>> @@ -77,6 +77,12 @@ config SENSORS_ADP1050_REGULATOR
>>>          µModule regulators that can provide microprocessor power from
>>> 54V
>>>          power distribution architecture.
>>>    +config SENSORS_APS_379
>>> +    tristate "Sony APS-379 Power Supplies"
>>> +    help
>>> +      If you say yes here you get hardware monitoring support for Sony
>>> +      APS-379 Power Supplies.
>>> +
>>>    config SENSORS_BEL_PFE
>>>        tristate "Bel PFE Compatible Power Supplies"
>>>        help
>>> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
>>> index d6c86924f887..94f36c7069ec 100644
>>> --- a/drivers/hwmon/pmbus/Makefile
>>> +++ b/drivers/hwmon/pmbus/Makefile
>>> @@ -9,6 +9,7 @@ obj-$(CONFIG_SENSORS_ACBEL_FSG032) += acbel-fsg032.o
>>>    obj-$(CONFIG_SENSORS_ADM1266)    += adm1266.o
>>>    obj-$(CONFIG_SENSORS_ADM1275)    += adm1275.o
>>>    obj-$(CONFIG_SENSORS_ADP1050)    += adp1050.o
>>> +obj-$(CONFIG_SENSORS_APS_379)    += aps-379.o
>>>    obj-$(CONFIG_SENSORS_BEL_PFE)    += bel-pfe.o
>>>    obj-$(CONFIG_SENSORS_BPA_RS600)    += bpa-rs600.o
>>>    obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
>>> diff --git a/drivers/hwmon/pmbus/aps-379.c
>>> b/drivers/hwmon/pmbus/aps-379.c
>>> new file mode 100644
>>> index 000000000000..e4c4c2d12bc9
>>> --- /dev/null
>>> +++ b/drivers/hwmon/pmbus/aps-379.c
>>
>> Driver documentation is missing.
>>
>> This power supply does not seem to be documented anywhere, so this is
>> actually quite
>> important.
> 
> I'll see what I can add. I do have a list of the actual supported PMBus
> commands so that would be helpful to share.
> 
>>   Having said this, the behavior seems quite similar to BluTek
>> BPA-RS600. Are those
>> power supplies from the same OEM ?
> 
> The BPA-RS600 is a smaller form factor. BluTek do make PSUs in the same
> from factor (there's a DC input one we use that I might get around to
> upstreaming one day), but they are genuinely different suppliers and the
> definitely don't interop electrically. Part of the reason for us using
> the APS-379 is manufactured by a Japanese company which lets us sell it
> into markets that have country of origin restrictions (that's as much
> politics as I care to discuss). They all have different
> quirks/deviations from the PMBus spec.
> 
> I did of course refer to the bpa-rs600 driver as I was familiar with it.
> I pulled the linear11 vout workaround from mp5990 and adapted it for my
> needs.
> 

I asked the AI version of Google search if they use the same OEM. It suggested
that they probably use the same or a similar controller chip and use the
firmware provided from that manufacturer as base for their firmware
implementation. Guess that makes sense.

Guenter

