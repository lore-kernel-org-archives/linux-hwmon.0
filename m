Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E3917A312
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Mar 2025 23:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741562527; cv=none; b=QSkRG68yjGSi0adlau481DYdJG0HUmpYr54qu6TSHq0yHVrIzV7I8FqaTp++FBWikw1NIKMKHLPkWlX6l9nI0RJhjdaQV8wQk9F7nQf6vRr1+c4m8XGCP234pYBG3DJ/9iaJAFGb9kSX4NO0ti4gMWyPdul3G4u4lZFfq6uupjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741562527; c=relaxed/simple;
	bh=OkpBrM8D8De2xQQTCK9XsRW0tvGz3SfLNsvYueuEDPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxtFENtquttUNn5uh0+lR/yl5v5177zfrcfHNtVwNf09vMI9ecr6eAFhyo3oTDKF0luE3OlqDMnMDxFTn3Tx5U/OrVbyagSlGDt/4jw5WGNaJk81wdad34ZAdbzcgTVH9k8OOXhwzHOgG3LHpWESS0NlofS05UuKS+wpoy5f5UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaRPIE0b; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaRPIE0b"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223f4c06e9fso59345475ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Mar 2025 16:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741562525; x=1742167325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9cSR0q9KQRuIWkLYSADtBrSjZw3rXlp1S+6iUY69IHE=;
        b=EaRPIE0bbVVZwg0OluaYCyXY1qHJFwYT3QbGkSVoltblLuAtFwYq6owpQL6RfotBd0
         08bWn2mZTINwo2t2Zx4FwIl6KCDceRErzdIOTKPVrEtSGqPLgBgsaZmq6u3uhGlGtrt6
         3KCP9tSjdwzNV9qoiv2uX5r7UDJpA5RXqDSHQQk2Y3CnmsRyvYkGbaoxyUcwivCqmgbg
         hgP/wZeEnfikw+SzyamkISR4naYOOeEkscrQz5NupJXd0qF5fEgrEm+Ixc96KSMDet6K
         Cs+Kt1+RvQiO8aamuB5u7TO6cRMHLNvce4uDdRp8+9dL62yYPXhLOUIq0qTWXoMZAFRX
         ycnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741562525; x=1742167325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cSR0q9KQRuIWkLYSADtBrSjZw3rXlp1S+6iUY69IHE=;
        b=tfDUloNMNFb5xQJJ249iH4lfi6a/+0Q8KClrk/JdtOI2HPdanR1GV9OYtGRzCzEEqq
         cs8N1/8Sk+ItA4b+Zzrd84d9sh0JFg+sq3oyU3E/s5eikBXb8rnLl3AFpVE2coIKeuVo
         jotQuhCmorBGW17WgdAoD2/7fEnlhLwg95Qf2aOKOPum0aGY3ymLum5DHwasT1u05Wah
         mVzmxhZ7JYh1QNnpBxKezZKpBJzcob+boILDJmcDgq19TI0tHhgjnIEM3Nq0hGszWs8u
         CWfrbhN0BOGRfIx8TKdGeft/tpsWAA6Sgrlu30+3zCyz1RvtZgbKnC4F2GeE4CytxoCE
         xz+g==
X-Forwarded-Encrypted: i=1; AJvYcCX1n3zlRlhmA6X8dp6j30rl+MEeYDKN1qDHIGx76BwynuXJgLiAVYhMwB48wp7TFK521V9fe+5nTfK2MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8aAwA/7yQBycOc9gaWldQtURD7XpFhC9ARv21ziCuYtYm5O5L
	cyezpo5vNxmy6dOGH0ExmAPLCXsrFZP8OnlEfxFFqMmNl9/GFwcs
X-Gm-Gg: ASbGncsAAYyCtY9RbEgq3r4/1hkxibkLgtA2f1KRbNJrGj8i7jHUSLHV3alLc1Wljqv
	CLYDid7dBlLUrPtAgmG+XhZkQebiNxA3tBUM1RtQlJ5NJFrnvthaqniFbZPBdcNKzsKURSiHPOh
	X+jVIJIdRNz+9pHW809Gb3wc6QDkjB4MXJ+kvq5ZwNQuiNHUAYLWecPO0L2wOesNS9Y93Wf5yOf
	r++cKk8gvP5mga2vB/pXP7q2No9nVqosUEhFDrZIv11NUk0pG/RGzh5nk5EY2OjStSDTlf8AU7h
	Iq4aKb58uM7PHsFIoQZzTY9z1W3BaotNW/5DlIMIvEeH0IKiSS/FfRIlGg2Vo+bL/nqzlrh5EOp
	haxPzBbOqZbUJkYRlzg==
X-Google-Smtp-Source: AGHT+IHJmL8XB2THq99oBOto6j2pIsXNXRyUBIcLtdaByR0QXZP8oOV4lN3iEIYX3DJajeIw2kkADw==
X-Received: by 2002:a17:903:1c5:b0:21f:1348:10e6 with SMTP id d9443c01a7336-22463c6b664mr138652015ad.13.1741562524254;
        Sun, 09 Mar 2025 16:22:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a91c50sm64880125ad.185.2025.03.09.16.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 16:22:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <57917c3e-7d79-4c6e-b9f3-70e8265fb826@roeck-us.net>
Date: Sun, 9 Mar 2025 16:22:02 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add KEBA battery monitoring controller support
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: jdelvare@suse.com, Gerhard Engleder <eg@keba.com>,
 linux-hwmon@vger.kernel.org
References: <20250308212346.51316-1-gerhard@engleder-embedded.com>
 <54a58308-e559-4007-a751-2d8a8fef29bb@roeck-us.net>
 <aefd126d-2041-4355-b685-7aa5ebf6ff13@engleder-embedded.com>
 <6d6dfcdc-aad3-401c-8845-1da7bfba3b02@roeck-us.net>
 <34604a76-d28e-4d40-8c73-1062edee0237@engleder-embedded.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <34604a76-d28e-4d40-8c73-1062edee0237@engleder-embedded.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/9/25 14:36, Gerhard Engleder wrote:
> On 09.03.25 16:04, Guenter Roeck wrote:
>> On 3/9/25 00:03, Gerhard Engleder wrote:
>>> On 08.03.25 23:32, Guenter Roeck wrote:
>>>> On 3/8/25 13:23, Gerhard Engleder wrote:
>>>>> From: Gerhard Engleder <eg@keba.com>
>>>>>
>>>>> The KEBA battery monitoring controller is found in the system FPGA of
>>>>> KEBA PLC devices. It puts a load on the coin cell battery to check the
>>>>> state of the battery.
>>>>>
>>>>> Signed-off-by: Gerhard Engleder <eg@keba.com>
>>>>
>>>> Looking into the keba code, that is kind of piece by piece approach.
>>>> I see a reference to fans in drivers/misc/keba/cp500.c, so I guess I'll see
>>>> a fan controller driver at some point in the future. I do not support
>>>> the idea of having multiple drivers for the hardware monitoring
>>>> functionality of a single device.
>>>
>>> Yes, the fan controller will follow. The cp500 driver supports multiple
>>> devices. All of them have the battery controller, but only some of them
>>> have the fan controller. Fanless devices don't have a fan controller in
>>> the FPGA. There are also devices with two fan controllers.
>>>
>>> The battery controller and the fan controller are separate IP cores with
>>> its own 4k address range (also I2C, SPI, ...). So I see them as separate
>>> devices. There is also no guarantee if the address range of both
>>> controllers is next to each other or not.
>>>
>>> Does that help you to see the battery controller and the fan controller
>>> as separate devices?
>>>
>>
>> Barely. At this point I am not convinced that this should be a hwmon driver
>> in the first place.
> 
> Here a more detailed description, which I would add to
> Documentation/hwmon/ in the proper form:
> 
> The PLC devices use a coin cell battery for the RTC to keep the current
> time. The goal is to provide information about the coin cell state to
> user space. Actually the user space shall be informed that the coin cell
> battery is nearly empty and needs to be replaced.
> 
> The coin cell must be tested actively to get to know if its nearly empty
> or not. Therefore, a load is put on the coin cell and the resulting
> voltage is evaluated. This evaluation is done by some hard wired analog
> logic, which compares the voltage to a defined limit. If the voltage is
> above the limit, then the coin cell is assumed to be ok. If the voltage
> is below the limit, then the coin cell is nearly empty (or broken,
> or removed, ...) and shall be replaced by a new one. The battery
> controller allows to start the test of the coin cell and to get the
> result if the voltage is above or below the limit. The actual voltage is
> not available. Only the information if the voltage is below a limit is
> available.
> 
> That's why I thought a voltage alarm is a good fit. But I'm not an
> expert and I'm curious about your opinion.
> 

It is ok, though in0_min_alarm would be a better fit. And, yes, please
add the above to the documentation.

Given the above description, and the code itself, I'd be a bit concerned
that reading the value repeatedly will cause the battery to be drain faster
than necessary (otherwise it could be active all the time). If so, it might
make sense to reduce the frequency of such readings to, say, once a day.
 From the MAX6916 datasheet:

"The MAX6916 does not constantly monitor an attached battery because such
  monitoring would drastically reduce the life of the battery. As a result,
  the MAX6916 only tests the battery for 1s every 24hr"

Personally I'd have tried to rely on the rtc itself to read the battery
status (RTC_VL_READ ioctl), but of course not every rtc supports that,
and not every rtc driver supports actually reporting it. Just in case
the rtc in your system does support it, and the driver doesn't (such
as the above mentioned MAX6916), it might make sense to submit a patch
for the rtc driver and use that mechanism, since that would be a more
generic solution than relying on proprietary fpga functionality.

That is just a note; it is your call, obviously, to decide how and how
often to check the battery status.

Thanks,
Guenter

