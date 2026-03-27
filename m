Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D3531618C
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774626152; cv=none; b=empEpoXlZ5M5beepPYGlnUaApOjHqCQas2DB+xL7eVxVSxOVB2Xp41mpNtFCcYNoKSucgnW1jIF2x/2YZbis1YLUx4OcU8XKEQk0R7ITGPhhoJnX4jw2wdQqvCL7zHrGC56qTj2Fpf1gdX876killaCJHufQZkx6Ecf6wPukGlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774626152; c=relaxed/simple;
	bh=wHClqSYMk00dSTT8QPLbIwzBEr1/LNNGBDfrcYSBl74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bg6Vw3ToJdy/D24fPCMriN+TJNqgVIEkQPJruNGiXFLiAVofoPYDhXZZ5IPSG3DuBJDrMPeJlqGbgEuritauW90hmOsana9NBrTCBIFIusX3AZLbB6GUmuYD6h9SODxgrKV/2/EEFnvsjooFDAfK+C6U/nyVK0yYgmRB6+ydnNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B21bnswd; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B21bnswd"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c175635a33so1534610eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 08:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774626149; x=1775230949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PlGnbqGG5xeLchwn0WE7eEoM2zOVzOibg54QmCQ/Nyk=;
        b=B21bnswdivCVyVZjfuDW5pI+VrLIn1g6YXXzknxP1FOdntNiZGtvUPzB6zDjPI8KWv
         YJ+7S2r9dNmn79QzcxT9lFcVyjFNaK9cwGiFarMZuYSEpl+0+jFCdw+etuqbB22dJJ4B
         stohiSw7T60bf/AGYTkNk+ZKeDgcVEW5G+QStD0FH1/zwO7kNzInZ+Vg/yQPznDkFEgD
         vEQBvaglPl4+U2Tapmws4CFsIpsu4y9FpM2qDqcQjWLEtFHMIUqHlmWg8xHRbc2AMcqZ
         wX6x6owiblfzwvicHuSsFR5hdqjLcj2jIccGdqAvusErOa8buhy6cECbX9zFvVcIaTxZ
         zubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774626149; x=1775230949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlGnbqGG5xeLchwn0WE7eEoM2zOVzOibg54QmCQ/Nyk=;
        b=oAFSkA74ebQh0VbqDBIB2qQ2hmKZAn8pMnfO1sG4WO9KhW38esc8ishHvSFcZkOGI/
         1imWLxZpmJMMOBRinECFIUSl/ri64m7LkCNAW5CnIGjRHVKrROUcw2MofH143MgKG2NU
         Vy9K0aTvcyL2faapRbT+JrDTPCKQcSyfSkddoiapM1F6AjrExmG4vy+jHvXTbAHYMO0x
         naTp1KNoeIbBRJyt8OjUvFwaZFOnNlJLz++ClNxfqBIhFyHRkCSGBqd9rvwetnwO2Ko1
         36Udgsr9j47U9PiqvRZAK2ErubmVpcduOBjeDOaElp6aDDlXphrrFvlcPRDbzIdtyL/a
         OT6A==
X-Gm-Message-State: AOJu0YztWVS9BbTYK7kp3U+vt/r4mn1aQkQWLrTQj0Sb3xpbisNI2N3B
	kdTATbGR3UWMLCgVGE4FGPW5CwxcLH6WQ1TqmSP+XVX2hIUSrzwT1L+5
X-Gm-Gg: ATEYQzyd83lEJkrwW9WoyAd9Bqlp97pDovIoZFpiF42FPWb/ilcq/vEhtcmOHghZa+m
	kQFgXRWZHh2EKIlQ1ydb16VLvz5iisRjI5l2CoBXqIzR7Af0/tGV4sg4J9yBSmL1y7ljhSx4dRP
	egpCiAMqswugFxWbXxr3tpSJwmeMma7W+98p7kNuXe0x4cKtV9W08aTK2H1FemAVoUpF2jnLtd9
	0psMNyRfRTMDU7uBS3Mo5PN4SrRW+LVHFfVTflDu7CWJuGIZFI04RuOGg+gBU0JteBpQtLiPb7F
	o1tIMgF9uqrsykl/0KV3o8FDgbDwWYjIF1grvEUrAAL+l86eyC/vMt/1lcHL77aXB3/7W3t2BVh
	wI4pBEjt87o2JHbOcM/7dmigjwSXXEm0nj1ki1F4koCCAKUW67130kawZgU7CvUt11SNL8LPJhT
	PX9GwsIsMcP2eTIbYxxOOhTwmHJ0RKMAwxQEjthSc9AREeMcoZhjMy2D24w72U1YKjlKDRWRta
X-Received: by 2002:a05:7300:ac8a:b0:2c0:c754:cd86 with SMTP id 5a478bee46e88-2c185a762c8mr1592883eec.0.1774626149202;
        Fri, 27 Mar 2026 08:42:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ea7bde3sm5316665eec.0.2026.03.27.08.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:42:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cc67f9e5-9f6d-40cd-bb89-9de0b084d42c@roeck-us.net>
Date: Fri, 27 Mar 2026 08:42:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] hwmon: Add WITRN USB tester driver
To: Rong Zhang <i@rong.moe>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
 <a3a8eb58-b2fa-411b-81be-eb70dac86b4f@roeck-us.net>
 <5ee967a8a4dca6f70e50c7fac382d4f91b6620aa.camel@rong.moe>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <5ee967a8a4dca6f70e50c7fac382d4f91b6620aa.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/26 05:01, Rong Zhang wrote:
> Hi Guenter,
> 
> Thanks a lot for your review and applying patch 1 :-)
> 
> On Thu, 2026-03-26 at 17:05 -0700, Guenter Roeck wrote:
>> On 3/26/26 12:19, Rong Zhang wrote:
>>> WITRN produces a series of devices to monitor power characteristics of
>>> USB connections and display those on a on-device display. Most of them
>>> contain an additional port which exposes the measurements via USB HID.
>>>
>>> These devices report sensor values in IEEE-754 float (binary32) format.
>>> The driver must perform floating-point number to integer conversions to
>>> provide hwmon channels. Meanwhile, they also report accumulative float
>>> values, and simple division or multiplication turns them into useful
>>> hwmon channels.
>>>
>>> Patch 1 adds label support for 64-bit energy attributes, as the driver
>>> needs it.
>>>
>>> Patch 2 adds a helper module for floating-point to integer conversions,
>>> so that the conversion, multification and division methods can be used
>>> in this driver as well as other drivers (I am also working on another
>>> USB tester driver that needs it).
>>>
>>> Patch 3 adds a barebone HID driver for WITRN K2.
>>>
>>> Patch 4 adds hwmon channels and attributes to the driver.
>>>
>>> Signed-off-by: Rong Zhang <i@rong.moe>
>>> ---
>>> Rong Zhang (4):
>>>         hwmon: Add label support for 64-bit energy attributes
>>>         hwmon: New helper module for floating-point to integer conversions
>>
>> Nack. This is not a hwmon problem and should reside in a driver or in lib/
>> (if it is needed by multiple drivers).
> 
> Makes sense. I will try.
> 
>>
>>>         hwmon: Add barebone HID driver for WITRN
>>
>> Nack. This is the wrong place for such a driver. It should reside somewhere
>> in drivers/usb, or maybe in drivers/misc/.
> 
> Hmm, I decided to place it here because:
> 
> - It's not a hid_ll_driver but a dumb hid_driver, i.e., does no low
> level things but just receives hid event from the HID core. It doesn't
> even send any HID report to the device.
> 
> - There has been numerous hid_driver in drivers/hwmon/.
> 
> - There has been a similar USB tester driver in drivers/hwmon/, i.e.,
> powerz. That's the major reason of my decision.
> 

powerz is a pure hwmon driver, nothing else. It does not claim to be a
"pure hid driver". If your driver _only_ provides a hwmon ABI, it would
be acceptable. But then this and the next patch should be one patch,
and it should only provide the hwmon ABI, nothing else (except maybe
debugfs entries or sysfs entries attached directly to the HID device
to display information such as serial number etc). Reading ROM/RAM addresses,
as mentioned below, would be outside that scope.

The entire powerz driver is 269 lines of code. Your driver has well above
1,000 LOC. Your code has separate source files plus an include file.
That suggests that it does more than just reporting hardware monitoring
attributes.

I have not looked further into the code itself. My response is based purely
on the subjects and code organization, which suggests that this is a HID
driver with attached hardware monitoring.

I am not sure I understand what all that would have to do with UCSI. UCSI
support is implemented in drivers/usb/typec/ucsi. Anything associated
with that protocol should be implemented there if it is part of the
protocol.

> Could you kindly explain what kinds of driver can be accepted into
> drivers/hwmon/?
> 
>>
>>>         hwmon: (witrn) Add monitoring support
>>
>> This should be implemented as auxiliary driver.
> 
> Could you kindly elaborate? Did you mean that if the device supports
> multiple functionalities they should be implemented as multiple
> auxiliary drivers in different subsystems?
> 

Correct. Your series suggests that this would be the case.

> FYI, the USB tester doesn't provide any other meaningful feature that
> fits other subsystems. The tester only provides two features through USB
> HID: power measurements (this series), and raw PD packets sniffing.
> 

Again, support for raw PD packets sniffing would be outside the scope
of the hardware monitoring subsystem.

Thanks,
Guenter

> As for the latter, the USB tester can sniff raw PD packets between the
> source and sink if enabled in the device menu. It doesn't provide the
> parsed result for packets, and the PC cannot ask the tester to send PD
> packets. This doesn't fit UCSI at all, as a UCSI device operates at a
> higher level and must accept commands. AFAIK such a dumb sniffer won't
> fit any subsystem in the kernel. Hence, the only thing fits a subsystem
> is its power measurements.
> 
> All measurements supported by the official utility for Windows can be
> found in `struct witrn_sensor'. Other than that, all extra features
> provided by the utility are implemented in software and I didn't see any
> extra USB packets other than querying the serial number [1] when I was
> randomly messing around with the utility [2].
> 
> I separated patch 3 and 4 just for easier review. If you are not in
> favor of such a style, I will squash them.
> 
> [1]: In fact, the utility directly asks the device to return the content
> on several specific ROM/RAM addresses, and then the utility calculates
> the serial number with an unknown algorithm. Reading a ROM/RAM address
> seems to be the only command that the device accepts from the USB host.
> 
> [2]: Yeah, their utility does not support PD packet capturing or
> parsing. It seems that the manufacturer provides the PD sniffing feature
> as is and expects users to capture it via hidraw or libusb and parse it
> themselves.
> 
>>
>> Sashiko has a lot of feedback that you might want to address before
>> resubmitting.
>>
>> https://sashiko.dev/#/patchset/20260327-b4-hwmon-witrn-v1-0-8d2f1896c045%40rong.moe
> 
> Sashiko's feedback helps a lot. Thanks.
> 
> Thanks,
> Rong
> 
>>
>> Thanks,
>> Guenter
>>
>>>
>>>    Documentation/hwmon/index.rst |   1 +
>>>    Documentation/hwmon/witrn.rst |  53 ++++
>>>    MAINTAINERS                   |   7 +
>>>    drivers/hwmon/Kconfig         |  14 +
>>>    drivers/hwmon/Makefile        |   2 +
>>>    drivers/hwmon/hwmon-fp.c      | 262 ++++++++++++++++
>>>    drivers/hwmon/hwmon-fp.h      | 212 +++++++++++++
>>>    drivers/hwmon/hwmon.c         |   1 +
>>>    drivers/hwmon/witrn.c         | 691 ++++++++++++++++++++++++++++++++++++++++++
>>>    9 files changed, 1243 insertions(+)
>>> ---
>>> base-commit: 0138af2472dfdef0d56fc4697416eaa0ff2589bd
>>> change-id: 20260327-b4-hwmon-witrn-a629b9040250
>>>
>>> Thanks,
>>> Rong
>>>

