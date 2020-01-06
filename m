Return-Path: <SRS0=XbaA=23=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E14DC33C9E
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jan 2020 14:52:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53B162075A
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jan 2020 14:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltTOTzWh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgAFOwh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jan 2020 09:52:37 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39713 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgAFOwh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jan 2020 09:52:37 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so19000907plp.6;
        Mon, 06 Jan 2020 06:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J5hhaE5FX3cF52VITZ7S/uv3Q2jj8Ag28WL04w1zpWA=;
        b=ltTOTzWhSg4Va0gQ6P/71cmwDov+D7T2URRhsJ58MJvUxvpnk4KvJneGrdoBIKZ1eF
         UN3HhxlJgSxb1B41mlucONmY7Ix+U+G2yUDlILvTSzMBGOww8uNn8wvkDtLCtJ5mznU4
         VqLdvpKpjdwWeL7mG1kGX9YkQ71ag4AiwCIIWJkpxD2xQDN4W9wX5ywa1tA5UmH/OvQ0
         TuhgRhxhB9l3J52l0ipDZlnSi25UnN5VJghJI1cAKxDBhu72iOLSmYEjBnQAl6tn0ens
         lLd5zdWIjC4CNnrOyRmHPn0KECun7KD/+sGjn6+SDbwTYFJLK7QqpHiHqmHrVQGczxvN
         XTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J5hhaE5FX3cF52VITZ7S/uv3Q2jj8Ag28WL04w1zpWA=;
        b=MKdth0o3UJtgF8HIAf+P/n/mQPleAZT/qOkB02foCRiujGjAuMDztBgSKOSgNfIFfN
         SILzXs4GrUvuulXleWDj/UTEDW6z+teCL2FcoHLLVXFb4NmwtBPNqvUNnAp0womW1gOJ
         C1sPNDvLtyLIeyDY0I/jUrTZeqDdyMueUVntcvDK+5J0DT0F57rfCCuz+KliVq6FX2Rz
         varoUdI3phlXN5fCUc0TpKsonWsqun83alI8hrS5yS9o9qzO6whWTl+Z+lRv0hNVbVgW
         fVRLlivEtucua4nyeire0CyCa8/IgyCvs3+eRwKEXH2wxY1CM1+f73If3n35xZe7qkwH
         dudA==
X-Gm-Message-State: APjAAAXbDidjT3LRF+BW+sL148Yv7Km1ryI6iQd2Ko3j8LeCbPgpSQKC
        K7ONU9rSlCDj4gjYEdRdj5/LjUFK
X-Google-Smtp-Source: APXvYqzfc+QSzFbUyi83aF7VeK3fETNnl4dz1UELxX26HJYYdl2SMD3CcuC57eLYB1Z4NZaUneVu6Q==
X-Received: by 2002:a17:90a:ec0f:: with SMTP id l15mr41817780pjy.39.1578322356445;
        Mon, 06 Jan 2020 06:52:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z4sm78245782pfn.42.2020.01.06.06.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:52:35 -0800 (PST)
Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
 device list supported by driver
To:     Vadim Pasternak <vadimp@mellanox.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "vijaykhemka@fb.com" <vijaykhemka@fb.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20200105105833.30196-1-vadimp@mellanox.com>
 <20200105105833.30196-6-vadimp@mellanox.com>
 <567ebd26-529e-6b2a-2f07-cfaf0f2217a9@roeck-us.net>
 <AM6PR05MB5224F444CBAC5A0503AFBB83A23D0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <a30e4f98-65a4-f93c-371e-7691aace41f7@roeck-us.net>
 <AM6PR05MB52245C747A0EB1691C3EBFBFA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <05925e70-0079-2467-b703-eba8d8667eaf@roeck-us.net>
Date:   Mon, 6 Jan 2020 06:52:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <AM6PR05MB52245C747A0EB1691C3EBFBFA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/6/20 4:16 AM, Vadim Pasternak wrote:
> 
> 
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Sunday, January 05, 2020 8:35 PM
>> To: Vadim Pasternak <vadimp@mellanox.com>; robh+dt@kernel.org;
>> vijaykhemka@fb.com
>> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
>> device list supported by driver
>>
>> On 1/5/20 8:44 AM, Vadim Pasternak wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>>> Sent: Sunday, January 05, 2020 6:04 PM
>>>> To: Vadim Pasternak <vadimp@mellanox.com>; robh+dt@kernel.org;
>>>> vijaykhemka@fb.com
>>>> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
>>>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679)
>>>> Extend device list supported by driver
>>>>
>>>> On 1/5/20 2:58 AM, Vadim Pasternak wrote:
>>>>> Extends driver with support of the additional devices:
>>>>> Texas Instruments Dual channel DCAP+ multiphase controllers:
>>>>> TPS53688, SN1906016.
>>>>> Infineon Multi-phase Digital VR Controller Sierra devices
>>>>> XDPE12286C, XDPE12284C, XDPE12283C, XDPE12254C and XDPE12250C.
>>>>>
>>>>> Extend Kconfig with added devices.
>>>>>
>>>>> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>>>>> ---
>>>>>     drivers/hwmon/pmbus/Kconfig    |  5 +++--
>>>>>     drivers/hwmon/pmbus/tps53679.c | 14 ++++++++++++++
>>>>>     2 files changed, 17 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/hwmon/pmbus/Kconfig
>>>>> b/drivers/hwmon/pmbus/Kconfig index 59859979571d..9e3d197d5322
>>>>> 100644
>>>>> --- a/drivers/hwmon/pmbus/Kconfig
>>>>> +++ b/drivers/hwmon/pmbus/Kconfig
>>>>> @@ -200,10 +200,11 @@ config SENSORS_TPS40422
>>>>>     	  be called tps40422.
>>>>>
>>>>>     config SENSORS_TPS53679
>>>>> -	tristate "TI TPS53679"
>>>>> +	tristate "TI TPS53679, TPS53688, SN1906016, Infineon XDPE122xxx
>>>> family"
>>>>>     	help
>>>>>     	  If you say yes here you get hardware monitoring support for TI
>>>>> -	  TPS53679.
>>>>> +	  TPS53679, PS53688, SN1906016 and Infineon XDPE12286C,
>>>> XDPE12284C,
>>>>
>>>> TPS53688. For the others, for some I can't even determine if they
>>>> exist in the first place (eg SN1906016, XPDE12250C) or how they would
>>>> differ from other variants (eg XPDE12284C vs. XPDE12284A).
>>>> And why would they all use the same bit map in the VOUT_MODE
>>>> register, the same number of PMBus pages (phases), and the same attributes
>> in each page ?
>>>
>>> Hi Guenter,
>>>
>>> Thank you for reply.
>>>
>>> On our new system we have device XPDE12284C equipped.
>>> I tested this device.
>>>
>> Sounds good, but did you also make sure that all chips have the same number of
>> pages (phases), the same set of commands as the TI chip, and support the same
>> bit settings in VOUT_MODE ? It seems a bit unlikely that TI's register definitions
>> would make it into an Infineon chip.
>>
>> Also, what about the SN1906016 ? I don't find that anywhere, except in one
>> place where it is listed as MCU from TI.
> 
> I'll drop SN1906016.
> Datasheet has a title Dual channel DCAP+ multiphase controllers:
> TPS53688, SN1906016.
> But maybe it's some custom device (anyway I'll try to check it with TI).
> 

Or maybe SN1906016 means something else. Unless we have explicit confirmation
that the chip exists (or will exist) we should not add it to the list.

>>
>>> Infineon datasheet refers all these device as XDPE122xxC family and it
>>> doesn't specify any differences in register map between these devices.
>>
>> That is a bit vague, especially when it includes devices which return zero results
>> with Google searches.
>>
>> "A" vs. "C" may distinguish automotive vs. commercial; the "A" device is listed
>> under automotive. If the command set is the same, I don't really want the "c" in
>> the id.
> 
> Got feedback from Infineon guys.
> No need 'C' at the end, as you wrote.
> All XDPE12250, XDPE12254, XDPE12283, XDPE12284, XDPE12286 are
> treated in the same way:
> same pages, same VOUT_MODE, VOUT_READ, etcetera.
> 

And same as TI, including VOUT_MODE ? Also, did they confirm that the unpublished
chips do or will actually exist ?

Sorry, to be persistent, but give my thanks to Infineon.

>>
>>> Tomorrow we'll have guys from Infineon in our lab and I'll verify if
>>> there is any difference.
>>
>> Tell them that it isn't really helpful to keep their datasheets under wrap.
>> Unfortunately, TI started doing the same, which isn't helpful either.
> 
> Told them about datasheets availability - got :)
> 

Surprise.

Thanks,
Guenter
