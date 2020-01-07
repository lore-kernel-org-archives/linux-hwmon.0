Return-Path: <SRS0=assb=24=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0ECC32771
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jan 2020 01:28:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D7DF20715
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jan 2020 01:28:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fq5IbmM6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbgAGB2x (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jan 2020 20:28:53 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40489 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727315AbgAGB2w (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jan 2020 20:28:52 -0500
Received: by mail-pg1-f195.google.com with SMTP id k25so27676941pgt.7;
        Mon, 06 Jan 2020 17:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Txw5iOl3n197g9O0YGDb5h1YUktFk/Z+4Sza8kD6AzA=;
        b=Fq5IbmM6V2/u3jrFjSqwB1NxRtD0+KitHtRcab9da8Yk0N0yNEUplNf3axTXWYgMT6
         w7fAJOdmGH7YcgYwiul2pE12Pxmhmnt5vqQGgFU/PZHciwfYIRpzzVsT6dD7RWgBEtpS
         nO5vgBrp3OzwY0+9hLrLOP+sPHNPovP+b97l0rbNESTOKpV5H3aJ6GB9q2eEPmVwnpm/
         yDKJQKHBFboiQtQg3GOr/lfyvJDgwHOK7UcIl21oWgVyMYvEOto4gh+8CRSKxdJWRC7N
         dsWz5EGHL64EUNPgB5Q5vRqgauMt8IUXZD8tuyY6vPu5IgasLm0KlslnEhwq7za6z4UC
         CSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Txw5iOl3n197g9O0YGDb5h1YUktFk/Z+4Sza8kD6AzA=;
        b=mzKcQundZldwGOnrxk7BzMo7DHg9NS9LHBSNAodxF6+WfD0Xj00Remk5X2LHISn3vS
         EHgdO6PzgNuR2zbvLjzHkg5t24Wv5wtr8fisGmlHJTUsSlCPtZcUmm+8E4q7HW2l7mOc
         LKbKjq1ljwVLcT6TEBrM4X1QblO4GesxWMeYS+iDx+RiOcHBhJosUQeeEPpfvXQ1lnJq
         2J4ucnsYO9BKT1KaugAhUH0hCK1gL3s1y5U3qe9tnBrFUGo9IwPXJm8xpegXrYSJgoZ6
         mP0l0K7+j2B99XfvGwdumVsrfIHaPen8/0WKi7yhiiOgcRGEGfja5WE3D48SLXKBEz0p
         eiFw==
X-Gm-Message-State: APjAAAVbnFRs9jy6eObHiBEzv9QXS5NOpl72XcZsvw90fPFzRS7e+7J5
        aHtOMGGMyR8wX2tlW0kmmBJc1AwK
X-Google-Smtp-Source: APXvYqwFDIhJlJ6NWEgbapeoLN+6n1yGxAbiiDjylTAMj2KMoSq4CFJ6IM+XcAY21G4YTORWe2+BSg==
X-Received: by 2002:aa7:82c9:: with SMTP id f9mr112821035pfn.168.1578360531232;
        Mon, 06 Jan 2020 17:28:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b42sm26127618pjc.27.2020.01.06.17.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2020 17:28:50 -0800 (PST)
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
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a76015b5-74e3-5f84-dfce-f5cce34c302a@roeck-us.net>
Date:   Mon, 6 Jan 2020 17:28:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <AM6PR05MB52247DB7AB2677F5F36BAAE9A23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/6/20 2:29 PM, Vadim Pasternak wrote:
> 
> 
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Monday, January 06, 2020 11:01 PM
>> To: Vadim Pasternak <vadimp@mellanox.com>
>> Cc: robh+dt@kernel.org; vijaykhemka@fb.com; linux-hwmon@vger.kernel.org;
>> devicetree@vger.kernel.org
>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
>> device list supported by driver
>>
>> On Mon, Jan 06, 2020 at 04:57:32PM +0000, Vadim Pasternak wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>>> Sent: Monday, January 06, 2020 4:53 PM
>>>> To: Vadim Pasternak <vadimp@mellanox.com>; robh+dt@kernel.org;
>>>> vijaykhemka@fb.com
>>>> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
>>>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679)
>>>> Extend device list supported by driver
>>>>
>>>> On 1/6/20 4:16 AM, Vadim Pasternak wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
>>>>>> Roeck
>>>>>> Sent: Sunday, January 05, 2020 8:35 PM
>>>>>> To: Vadim Pasternak <vadimp@mellanox.com>; robh+dt@kernel.org;
>>>>>> vijaykhemka@fb.com
>>>>>> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
>>>>>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon:
>>>>>> (pmbus/tps53679) Extend device list supported by driver
>>>>>>
>>>>>> On 1/5/20 8:44 AM, Vadim Pasternak wrote:
>>>>>>>
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
>>>>>>>> Roeck
>>>>>>>> Sent: Sunday, January 05, 2020 6:04 PM
>>>>>>>> To: Vadim Pasternak <vadimp@mellanox.com>; robh+dt@kernel.org;
>>>>>>>> vijaykhemka@fb.com
>>>>>>>> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
>>>>>>>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon:
>>>>>>>> (pmbus/tps53679) Extend device list supported by driver
>>>>>>>>
>>>>>>>> On 1/5/20 2:58 AM, Vadim Pasternak wrote:
>>>>>>>>> Extends driver with support of the additional devices:
>>>>>>>>> Texas Instruments Dual channel DCAP+ multiphase controllers:
>>>>>>>>> TPS53688, SN1906016.
>>>>>>>>> Infineon Multi-phase Digital VR Controller Sierra devices
>>>>>>>>> XDPE12286C, XDPE12284C, XDPE12283C, XDPE12254C and
>> XDPE12250C.
>>>>>>>>>
>>>>>>>>> Extend Kconfig with added devices.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>>>>>>>>> ---
>>>>>>>>>      drivers/hwmon/pmbus/Kconfig    |  5 +++--
>>>>>>>>>      drivers/hwmon/pmbus/tps53679.c | 14 ++++++++++++++
>>>>>>>>>      2 files changed, 17 insertions(+), 2 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/hwmon/pmbus/Kconfig
>>>>>>>>> b/drivers/hwmon/pmbus/Kconfig index
>> 59859979571d..9e3d197d5322
>>>>>>>>> 100644
>>>>>>>>> --- a/drivers/hwmon/pmbus/Kconfig
>>>>>>>>> +++ b/drivers/hwmon/pmbus/Kconfig
>>>>>>>>> @@ -200,10 +200,11 @@ config SENSORS_TPS40422
>>>>>>>>>      	  be called tps40422.
>>>>>>>>>
>>>>>>>>>      config SENSORS_TPS53679
>>>>>>>>> -	tristate "TI TPS53679"
>>>>>>>>> +	tristate "TI TPS53679, TPS53688, SN1906016, Infineon
>>>>>>>>> +XDPE122xxx
>>>>>>>> family"
>>>>>>>>>      	help
>>>>>>>>>      	  If you say yes here you get hardware monitoring support for TI
>>>>>>>>> -	  TPS53679.
>>>>>>>>> +	  TPS53679, PS53688, SN1906016 and Infineon XDPE12286C,
>>>>>>>> XDPE12284C,
>>>>>>>>
>>>>>>>> TPS53688. For the others, for some I can't even determine if
>>>>>>>> they exist in the first place (eg SN1906016, XPDE12250C) or how
>>>>>>>> they would differ from other variants (eg XPDE12284C vs.
>> XPDE12284A).
>>>>>>>> And why would they all use the same bit map in the VOUT_MODE
>>>>>>>> register, the same number of PMBus pages (phases), and the same
>>>>>>>> attributes
>>>>>> in each page ?
>>>>>>>
>>>>>>> Hi Guenter,
>>>>>>>
>>>>>>> Thank you for reply.
>>>>>>>
>>>>>>> On our new system we have device XPDE12284C equipped.
>>>>>>> I tested this device.
>>>>>>>
>>>>>> Sounds good, but did you also make sure that all chips have the
>>>>>> same number of pages (phases), the same set of commands as the TI
>>>>>> chip, and support the same bit settings in VOUT_MODE ? It seems a
>>>>>> bit unlikely that TI's register definitions would make it into an Infineon
>> chip.
>>>>>>
>>>>>> Also, what about the SN1906016 ? I don't find that anywhere,
>>>>>> except in one place where it is listed as MCU from TI.
>>>>>
>>>>> I'll drop SN1906016.
>>>>> Datasheet has a title Dual channel DCAP+ multiphase controllers:
>>>>> TPS53688, SN1906016.
>>>>> But maybe it's some custom device (anyway I'll try to check it with TI).
>>>>>
>>>>
>>>> Or maybe SN1906016 means something else. Unless we have explicit
>>>> confirmation that the chip exists (or will exist) we should not add it to the
>> list.
>>>>
>>>>>>
>>>>>>> Infineon datasheet refers all these device as XDPE122xxC family
>>>>>>> and it doesn't specify any differences in register map between these
>> devices.
>>>>>>
>>>>>> That is a bit vague, especially when it includes devices which
>>>>>> return zero results with Google searches.
>>>>>>
>>>>>> "A" vs. "C" may distinguish automotive vs. commercial; the "A"
>>>>>> device is listed under automotive. If the command set is the
>>>>>> same, I don't really want the "c" in the id.
>>>>>
>>>>> Got feedback from Infineon guys.
>>>>> No need 'C' at the end, as you wrote.
>>>>> All XDPE12250, XDPE12254, XDPE12283, XDPE12284, XDPE12286 are
>>>>> treated in the same way:
>>>>> same pages, same VOUT_MODE, VOUT_READ, etcetera.
>>>>>
>>>>
>>>> And same as TI, including VOUT_MODE ? Also, did they confirm that
>>>> the unpublished chips do or will actually exist ?
>>>
>>> Hi Gunther,
>>>
>>> According to the input I got from Infineon guys, these device are
>>> already available for the customers, like XPDE12284, which is equipped
>>> on new Mellanox 400Gx32 Ethernet system, on which we are working now.
>>>
>>> But I'll re-check if all these devices are available today to be on
>>> the safe Side.
>>>
>>> Regarding VOUT modes:
>>> TPS53679 uses modes - 0x01, 0x02, 0x04, 0x05, 0x07
>>> TPS53688 uses modes - 0x04, 0x07
>>> XDPE122xxx uses modes - 0x01, 0x02, 0x03 and additionally 0x10, which
>>> is for 6.25mV VID table (AMD application).
>>>
>>
>> The problem is that PMBus does not define VID mode values. If it did, we could
>> add vrm version detection detection to the pmbus core. 0x01 for
>> TPS53679 _may_ be the same as 0x01 for XDPE122xxx, or maybe not.
>> There is no way to be sure without datasheets.
>>
>>> I didn't add support for mode 0x10 in the patch.
>>>
>>> The VID table for the AMD application is different from the Intel VID
>>> tables.
>>>
>>> A value of 0x0 corresponds to the highest output voltage of 1.55V.
>>> The voltage is reduced in 6.25mV steps down to the value 0xd8, which
>>> corresponds to 0.2V.
>>>
>>> The formula for the calculation of the output voltage would be:
>>>
>>> 	case DON’T_NOW_HOW_TO_CALL_IT:
>>
>> Doesn't the datasheet have something to say ?
> 
> It just specifies VID table format as
> 0 = 10mV VID table
> 1 = 5mv VID table
> 2 = 6.25mv VID table
> 3 = 10mV VID table (200mV offset)
> calculation as:
> Range: 0 = Off, 1 (250mV) to 255 (1520mV); vid_table=0 (10mV)
> Range: 0 = Off, 1 (500mV) to 255 (3040mV); vid_table=1 (5mV)
> Range: 0 = Off, 1 (200mV) to 255 (2740mV); vid_table=3 (10mV)
> Range: 0 = (1550mV) to 247 (6.25mV); 248~255 = Off; vid_table=2 (6.25mV)
> 
> And VOUT_MODE[4:0] as:
> 00001 = 5mV VID table (VR12)
> 00010 = 10mV VID table (VR12.5 or VR13)
> 00011 = 10mV VID table (IMVP9)
> 10000 = 6.25mV VID table (AMD application)
> others = illegal setting - PMBus write is acked, but no write occurs
> 
>>
>>> 		if (val >= 0x00 && val <= 0xd8)
>>>                			rv = 1550 – (val *6.25);
>>>
>>> I doubled check it.
>>>
>>> Do you think it should added as well?
>>>
>> I am quite neutral on that. I am much more concerned with the assumption that
>> the mode values have the same meaning for chips from different vendors. In this
>> case, what do we do if TI starts shipping a chip in the TPS53xxx series which uses
>> mode 0x10 for something else ?
>>
>> Overall I'd rather play safe and add a separate driver for the Infineon chips.
> 
> I see.
> 
> We actually waned to have ability of transparent replacement of TI and Infineon
> devices within the same type of system.
> 

That should not be a problem as long as you instantiate them differently.
After all, the relevant information _should_ be available in ACPI tables.
Otherwise you'd have to claim that a chip is, say, tps53688, while it is
really an Infineon chip. And that is never a good idea.

> Maybe it's possible to have 0x01, 0x02, 0x03, 0x04, 0x05, 0x07 as a basic
> set and support for example 0x10 according to specific device id?
> 

Unfortunately not, because there is no standard defining those. TI might
at some point decide to sell a new chip where 0x03 means something completely
different. On top of that, I already know that at least some of the TI chips
of this series have more than two pages. Unfortunately, the information I have
is vague (no datasheet again). That is another reason for avoiding pollution
of the tps driver with non-TI chip support.

Thanks,
Guenter
