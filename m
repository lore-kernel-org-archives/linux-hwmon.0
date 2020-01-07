Return-Path: <SRS0=assb=24=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AFCC33C8C
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jan 2020 12:14:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86492206F0
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jan 2020 12:14:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUsdeE0q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgAGMOZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jan 2020 07:14:25 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44100 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGMOZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jan 2020 07:14:25 -0500
Received: by mail-pf1-f194.google.com with SMTP id 195so27662044pfw.11;
        Tue, 07 Jan 2020 04:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bufx3/9OA6WNhqetg944j6vXQrQkZnu7KFyQKaw2j+8=;
        b=JUsdeE0q0EU+xvfkohP7DWmbjbsClBJK8elMEtZFFCnlwiJzO3ilgfQkIiMASfl+Zs
         Q5sbevzCMs9L7SLYrMQ7GqxFNoXeM21dKxuZgRCVur0+JqCylD5m2oTfGVQq8K4X3vy5
         x8uoOl5IN90tTZ4dj9ZYohG60tifB4hfV7CHW/K5fctqJSuGZD/rXxeo6lBWi2631jPf
         sgggw02pUbGrnhTMzaVfPlWl1U+SDQerWg+V919S7LBeEJCJCP92flgotCMn49kN3ZiY
         IFCTktQAVf+KIzkRnvnp5IBX/IB0/fJxMlfuwLZHj8IIPK1Jo33QjBTdSuWRUFG7kJCj
         V7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bufx3/9OA6WNhqetg944j6vXQrQkZnu7KFyQKaw2j+8=;
        b=If81Bvu7S0zbSXS/bs077PNog+oOKw5OJR57VzwybRnHFk6SWGcKZSED0t7uwOeyGX
         rxEcDv/SN8hHiIEa91RHRiXFiIgbq0VwTpyXOKdYJrtw1xD1xMJlOz4uN4VGEwjNMUub
         WGLF0vfx/SMRQll3FF2OG+xfcDPVVkXeIzRNdYrCB2c0Z+0ACPqkLKzUb9iaEXSUeXZL
         ExjDAdx8qWQXpsMabzz7uLEuDZMzlAwqdz3KBPFuwq/+lxGvkJgj0qqy4kDO20w/8jq9
         717obNmnb2ddNzIKZOMSk5sW6VskvI45BNy2Lr654NZ2giojs7jMVugN5ojgam873DEW
         H1JQ==
X-Gm-Message-State: APjAAAV2L0NRPO6Tvsm4oJlw/A3r/otZxz9g4V2OQT40SPihiVGO46Eh
        KI2cniX5bYtSx6YE6kXxhvvA4mea
X-Google-Smtp-Source: APXvYqw8TO6NMMTSCtxH4HXbV6xIlrCpAAz5C7m82dTloCdfFXQmdMPDOxvaZtihVaVPC3ESg/8dkQ==
X-Received: by 2002:aa7:9484:: with SMTP id z4mr112011239pfk.88.1578399263694;
        Tue, 07 Jan 2020 04:14:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c1sm48774495pfo.44.2020.01.07.04.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 04:14:22 -0800 (PST)
Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
 device list supported by driver
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "vijaykhemka@fb.com" <vijaykhemka@fb.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20200105105833.30196-1-vadimp@mellanox.com>
 <20200105105833.30196-6-vadimp@mellanox.com>
 <567ebd26-529e-6b2a-2f07-cfaf0f2217a9@roeck-us.net>
 <AM6PR05MB5224F444CBAC5A0503AFBB83A23D0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <a30e4f98-65a4-f93c-371e-7691aace41f7@roeck-us.net>
 <AM6PR05MB52245C747A0EB1691C3EBFBFA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <05925e70-0079-2467-b703-eba8d8667eaf@roeck-us.net>
 <AM6PR05MB52242EA6A029D4C5F011A21BA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200106210104.GA9219@roeck-us.net>
 <AM6PR05MB52247DB7AB2677F5F36BAAE9A23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <a76015b5-74e3-5f84-dfce-f5cce34c302a@roeck-us.net>
 <AM6PR05MB5224ED5368BD037051F5BF92A23F0@AM6PR05MB5224.eurprd05.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <5be3c6c4-81e8-7731-2b6e-39b7ad6531d5@roeck-us.net>
Date:   Tue, 7 Jan 2020 04:14:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <AM6PR05MB5224ED5368BD037051F5BF92A23F0@AM6PR05MB5224.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/6/20 10:06 PM, Vadim Pasternak wrote:
> 
> 
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Tuesday, January 07, 2020 3:29 AM
>> To: Vadim Pasternak <vadimp@mellanox.com>
>> Cc: robh+dt@kernel.org; vijaykhemka@fb.com; linux-hwmon@vger.kernel.org;
>> devicetree@vger.kernel.org
>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
>> device list supported by driver
>>
>> On 1/6/20 2:29 PM, Vadim Pasternak wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>>> Sent: Monday, January 06, 2020 11:01 PM
>>>> To: Vadim Pasternak <vadimp@mellanox.com>
>>>> Cc: robh+dt@kernel.org; vijaykhemka@fb.com;
>>>> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
>>>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679)
>>>> Extend device list supported by driver
>>>>
>>>> On Mon, Jan 06, 2020 at 04:57:32PM +0000, Vadim Pasternak wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>>>>> Sent: Monday, January 06, 2020 4:53 PM
>>>>>> To: Vadim Pasternak <vadimp@mellanox.com>; robh+dt@kernel.org;
>>>>>> vijaykhemka@fb.com
>>>>>> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
>>>>>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679)
>>>>>> Extend device list supported by driver
>>>>>>
>>>>>> On 1/6/20 4:16 AM, Vadim Pasternak wrote:
>>>>>>>
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
>>>>>>>> Roeck
>>>>>>>> Sent: Sunday, January 05, 2020 8:35 PM
>>>>>>>> To: Vadim Pasternak <vadimp@mellanox.com>; robh+dt@kernel.org;
>>>>>>>> vijaykhemka@fb.com
>>>>>>>> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
>>>>>>>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon:
>>>>>>>> (pmbus/tps53679) Extend device list supported by driver
>>>>>>>>
>>>>>>>> On 1/5/20 8:44 AM, Vadim Pasternak wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> -----Original Message-----
>>>>>>>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
>>>>>>>>>> Roeck
>>>>>>>>>> Sent: Sunday, January 05, 2020 6:04 PM
>>>>>>>>>> To: Vadim Pasternak <vadimp@mellanox.com>; robh+dt@kernel.org;
>>>>>>>>>> vijaykhemka@fb.com
>>>>>>>>>> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
>>>>>>>>>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon:
>>>>>>>>>> (pmbus/tps53679) Extend device list supported by driver
>>>>>>>>>>
>>>>>>>>>> On 1/5/20 2:58 AM, Vadim Pasternak wrote:
>>>>>>>>>>> Extends driver with support of the additional devices:
>>>>>>>>>>> Texas Instruments Dual channel DCAP+ multiphase controllers:
>>>>>>>>>>> TPS53688, SN1906016.
>>>>>>>>>>> Infineon Multi-phase Digital VR Controller Sierra devices
>>>>>>>>>>> XDPE12286C, XDPE12284C, XDPE12283C, XDPE12254C and
>>>> XDPE12250C.
>>>>>>>>>>>
>>>>>>>>>>> Extend Kconfig with added devices.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>>>>>>>>>>> ---
>>>>>>>>>>>       drivers/hwmon/pmbus/Kconfig    |  5 +++--
>>>>>>>>>>>       drivers/hwmon/pmbus/tps53679.c | 14 ++++++++++++++
>>>>>>>>>>>       2 files changed, 17 insertions(+), 2 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/hwmon/pmbus/Kconfig
>>>>>>>>>>> b/drivers/hwmon/pmbus/Kconfig index
>>>> 59859979571d..9e3d197d5322
>>>>>>>>>>> 100644
>>>>>>>>>>> --- a/drivers/hwmon/pmbus/Kconfig
>>>>>>>>>>> +++ b/drivers/hwmon/pmbus/Kconfig
>>>>>>>>>>> @@ -200,10 +200,11 @@ config SENSORS_TPS40422
>>>>>>>>>>>       	  be called tps40422.
>>>>>>>>>>>
>>>>>>>>>>>       config SENSORS_TPS53679
>>>>>>>>>>> -	tristate "TI TPS53679"
>>>>>>>>>>> +	tristate "TI TPS53679, TPS53688, SN1906016, Infineon
>>>>>>>>>>> +XDPE122xxx
>>>>>>>>>> family"
>>>>>>>>>>>       	help
>>>>>>>>>>>       	  If you say yes here you get hardware monitoring support for TI
>>>>>>>>>>> -	  TPS53679.
>>>>>>>>>>> +	  TPS53679, PS53688, SN1906016 and Infineon XDPE12286C,
>>>>>>>>>> XDPE12284C,
>>>>>>>>>>
>>>>>>>>>> TPS53688. For the others, for some I can't even determine if
>>>>>>>>>> they exist in the first place (eg SN1906016, XPDE12250C) or how
>>>>>>>>>> they would differ from other variants (eg XPDE12284C vs.
>>>> XPDE12284A).
>>>>>>>>>> And why would they all use the same bit map in the VOUT_MODE
>>>>>>>>>> register, the same number of PMBus pages (phases), and the same
>>>>>>>>>> attributes
>>>>>>>> in each page ?
>>>>>>>>>
>>>>>>>>> Hi Guenter,
>>>>>>>>>
>>>>>>>>> Thank you for reply.
>>>>>>>>>
>>>>>>>>> On our new system we have device XPDE12284C equipped.
>>>>>>>>> I tested this device.
>>>>>>>>>
>>>>>>>> Sounds good, but did you also make sure that all chips have the
>>>>>>>> same number of pages (phases), the same set of commands as the TI
>>>>>>>> chip, and support the same bit settings in VOUT_MODE ? It seems a
>>>>>>>> bit unlikely that TI's register definitions would make it into an
>>>>>>>> Infineon
>>>> chip.
>>>>>>>>
>>>>>>>> Also, what about the SN1906016 ? I don't find that anywhere,
>>>>>>>> except in one place where it is listed as MCU from TI.
>>>>>>>
>>>>>>> I'll drop SN1906016.
>>>>>>> Datasheet has a title Dual channel DCAP+ multiphase controllers:
>>>>>>> TPS53688, SN1906016.
>>>>>>> But maybe it's some custom device (anyway I'll try to check it with TI).
>>>>>>>
>>>>>>
>>>>>> Or maybe SN1906016 means something else. Unless we have explicit
>>>>>> confirmation that the chip exists (or will exist) we should not add
>>>>>> it to the
>>>> list.
>>>>>>
>>>>>>>>
>>>>>>>>> Infineon datasheet refers all these device as XDPE122xxC family
>>>>>>>>> and it doesn't specify any differences in register map between
>>>>>>>>> these
>>>> devices.
>>>>>>>>
>>>>>>>> That is a bit vague, especially when it includes devices which
>>>>>>>> return zero results with Google searches.
>>>>>>>>
>>>>>>>> "A" vs. "C" may distinguish automotive vs. commercial; the "A"
>>>>>>>> device is listed under automotive. If the command set is the
>>>>>>>> same, I don't really want the "c" in the id.
>>>>>>>
>>>>>>> Got feedback from Infineon guys.
>>>>>>> No need 'C' at the end, as you wrote.
>>>>>>> All XDPE12250, XDPE12254, XDPE12283, XDPE12284, XDPE12286 are
>>>>>>> treated in the same way:
>>>>>>> same pages, same VOUT_MODE, VOUT_READ, etcetera.
>>>>>>>
>>>>>>
>>>>>> And same as TI, including VOUT_MODE ? Also, did they confirm that
>>>>>> the unpublished chips do or will actually exist ?
>>>>>
>>>>> Hi Gunther,
>>>>>
>>>>> According to the input I got from Infineon guys, these device are
>>>>> already available for the customers, like XPDE12284, which is
>>>>> equipped on new Mellanox 400Gx32 Ethernet system, on which we are
>> working now.
>>>>>
>>>>> But I'll re-check if all these devices are available today to be on
>>>>> the safe Side.
>>>>>
>>>>> Regarding VOUT modes:
>>>>> TPS53679 uses modes - 0x01, 0x02, 0x04, 0x05, 0x07
>>>>> TPS53688 uses modes - 0x04, 0x07
>>>>> XDPE122xxx uses modes - 0x01, 0x02, 0x03 and additionally 0x10,
>>>>> which is for 6.25mV VID table (AMD application).
>>>>>
>>>>
>>>> The problem is that PMBus does not define VID mode values. If it did,
>>>> we could add vrm version detection detection to the pmbus core. 0x01
>>>> for
>>>> TPS53679 _may_ be the same as 0x01 for XDPE122xxx, or maybe not.
>>>> There is no way to be sure without datasheets.
>>>>
>>>>> I didn't add support for mode 0x10 in the patch.
>>>>>
>>>>> The VID table for the AMD application is different from the Intel
>>>>> VID tables.
>>>>>
>>>>> A value of 0x0 corresponds to the highest output voltage of 1.55V.
>>>>> The voltage is reduced in 6.25mV steps down to the value 0xd8, which
>>>>> corresponds to 0.2V.
>>>>>
>>>>> The formula for the calculation of the output voltage would be:
>>>>>
>>>>> 	case DON’T_NOW_HOW_TO_CALL_IT:
>>>>
>>>> Doesn't the datasheet have something to say ?
>>>
>>> It just specifies VID table format as
>>> 0 = 10mV VID table
>>> 1 = 5mv VID table
>>> 2 = 6.25mv VID table
>>> 3 = 10mV VID table (200mV offset)
>>> calculation as:
>>> Range: 0 = Off, 1 (250mV) to 255 (1520mV); vid_table=0 (10mV)
>>> Range: 0 = Off, 1 (500mV) to 255 (3040mV); vid_table=1 (5mV)
>>> Range: 0 = Off, 1 (200mV) to 255 (2740mV); vid_table=3 (10mV)
>>> Range: 0 = (1550mV) to 247 (6.25mV); 248~255 = Off; vid_table=2
>>> (6.25mV)
>>>
>>> And VOUT_MODE[4:0] as:
>>> 00001 = 5mV VID table (VR12)
>>> 00010 = 10mV VID table (VR12.5 or VR13)
>>> 00011 = 10mV VID table (IMVP9)
>>> 10000 = 6.25mV VID table (AMD application) others = illegal setting -
>>> PMBus write is acked, but no write occurs
>>>
>>>>
>>>>> 		if (val >= 0x00 && val <= 0xd8)
>>>>>                 			rv = 1550 – (val *6.25);
>>>>>
>>>>> I doubled check it.
>>>>>
>>>>> Do you think it should added as well?
>>>>>
>>>> I am quite neutral on that. I am much more concerned with the
>>>> assumption that the mode values have the same meaning for chips from
>>>> different vendors. In this case, what do we do if TI starts shipping
>>>> a chip in the TPS53xxx series which uses mode 0x10 for something else ?
>>>>
>>>> Overall I'd rather play safe and add a separate driver for the Infineon chips.
>>>
>>> I see.
>>>
>>> We actually waned to have ability of transparent replacement of TI and
>>> Infineon devices within the same type of system.
>>>
>>
>> That should not be a problem as long as you instantiate them differently.
>> After all, the relevant information _should_ be available in ACPI tables.
>> Otherwise you'd have to claim that a chip is, say, tps53688, while it is really an
>> Infineon chip. And that is never a good idea.
>>
>>> Maybe it's possible to have 0x01, 0x02, 0x03, 0x04, 0x05, 0x07 as a
>>> basic set and support for example 0x10 according to specific device id?
>>>
>>
>> Unfortunately not, because there is no standard defining those. TI might at
>> some point decide to sell a new chip where 0x03 means something completely
>> different. On top of that, I already know that at least some of the TI chips of this
>> series have more than two pages. Unfortunately, the information I have is vague
>> (no datasheet again). That is another reason for avoiding pollution of the tps
>> driver with non-TI chip support.
> 
> OK.
> So, I think to modify the patch as following:
> 
> Add sperate driver  xdpe122xx with support this Infineon family (after final
> checking with Infineon, which of the are available).
> It will support 0x01, 0x02, 0x03, 0x10.
> 
> Add tps53688 to tps53679 driver.
> 
> Add two new vrf versions imvp9, amd625mv (I only don't know what is the
> best naming for these new modes).
> 
> And these new modes will be handled as:
> 	case imvp9:
> 		if (val >= 0x01)
> 			rv = 200 + (val - 1) * 10;
> 		break;
> 	case amd625mv:
> 		if (val >= 0x0 && val <= 0xd8)
> 			rv = DIV_ROUND_CLOSEST(155000 - val * 625, 100);
> 		break;
> 
> What it be fine?
> 

Yes, sounds good.

Thanks,
Guenter

> If yes, I'll make v1 patch version.
> 
> Thanks,
> Vadim.
> 
>>
>> Thanks,
>> Guenter

