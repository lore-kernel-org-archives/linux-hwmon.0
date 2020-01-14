Return-Path: <SRS0=c1px=3D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A6FC33CB2
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:19:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C24824684
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:19:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGHbpOu9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgANOTa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jan 2020 09:19:30 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54288 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgANOTa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jan 2020 09:19:30 -0500
Received: by mail-pj1-f65.google.com with SMTP id kx11so5763040pjb.4;
        Tue, 14 Jan 2020 06:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y0upk0vFmlxXAKu3RaTIFax+7e+AIUeZkoTuIA7nGLM=;
        b=PGHbpOu94JkmO7JLkjLWah8GkwROrOyq7+Hxnhr8k7hJAaf+UY2eoYOkPnczUYwgfN
         JVVlXV94tQSk4r/s26i8zx9zjsNABh5x8n/6upDXVLu0z14srjEUZKFM1DOIdQ0S4bxU
         TWEPu057mflsTexA5sGbsZpTXsCV2Egnz+xhWCVMX+BSNKmHQuLcX2MtapfpVIzgOTWi
         QSms1DL0YPz+8jaibJf7kVmeIoPEwllR5wfB+UKXVHwgySObQxxEEcqBShK+IfmMG5j0
         1RO4IpvoubyHF8JmDFhn+c5tlMTSkop6Bazyk+d2C7ySSiRtNMbptbzJg2Ow4R9abI1E
         /lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y0upk0vFmlxXAKu3RaTIFax+7e+AIUeZkoTuIA7nGLM=;
        b=KJ6unAMZC/SYQlNWdz2G2ADDRA/+wQ/vYrXNJXRCCTTEQurgFD+sXIxZm+bY5cJZTL
         Nd9SdlHNUWRzeGqPIzNrxl8fCa3JflzQfivb+SzFrmaVejMH6+z0Fv5Jbuvol7W0QM1z
         6whP+Dq2lBtNhAnRvt3jQysSOKqXG2Wmaqwh/itR8C0g7VRU5KsFebpjbuNJoGEdvrNW
         muw3UqKmL71w4VT5RpvQqsTlJzj5uMs7Qgp1LReXhkeuiz+rNPy6ljIRoT6wkmjNVU4/
         1/Hg3vVEU2FwZFjdCgexQ++zXKia+us4CUaTjYZu99iOwtB3bRb7S6kk1dTo/Cv1kt7K
         3fyA==
X-Gm-Message-State: APjAAAWlmX8rhJez2gJSBC2HUCRFwwO96vWRQNbq61+dRcaHWwgkCl7z
        3gJb08ktsg6AomCgmTJtw6Q=
X-Google-Smtp-Source: APXvYqxV+YBHpZQh3AgodQiZpjMFs+WqMkomwOlx9vaYQDYoaKX6I68NFyYcl+RXz8i5KH951xoY7Q==
X-Received: by 2002:a17:90a:be0d:: with SMTP id a13mr20996067pjs.78.1579011569581;
        Tue, 14 Jan 2020 06:19:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l8sm17154060pjy.24.2020.01.14.06.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2020 06:19:28 -0800 (PST)
Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
 device list supported by driver
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "vijaykhemka@fb.com" <vijaykhemka@fb.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Michael Shych <michaelsh@mellanox.com>,
        Ofer Levy <oferl@mellanox.com>
References: <05925e70-0079-2467-b703-eba8d8667eaf@roeck-us.net>
 <AM6PR05MB52242EA6A029D4C5F011A21BA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200106210104.GA9219@roeck-us.net>
 <AM6PR05MB52247DB7AB2677F5F36BAAE9A23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <a76015b5-74e3-5f84-dfce-f5cce34c302a@roeck-us.net>
 <AM6PR05MB5224ED5368BD037051F5BF92A23F0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <5be3c6c4-81e8-7731-2b6e-39b7ad6531d5@roeck-us.net>
 <AM6PR05MB5224C166E608C3BBD09E4606A23E0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200108164748.GD28993@roeck-us.net>
 <AM6PR05MB5224026B612B674681E81DF9A2350@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200113205614.GA24228@roeck-us.net>
 <AM6PR05MB522448927DE44812BECAFE74A2340@AM6PR05MB5224.eurprd05.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <530f290a-37f9-b493-066f-795bea9f8a83@roeck-us.net>
Date:   Tue, 14 Jan 2020 06:19:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <AM6PR05MB522448927DE44812BECAFE74A2340@AM6PR05MB5224.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/13/20 10:54 PM, Vadim Pasternak wrote:
> 
> 
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Monday, January 13, 2020 10:56 PM
>> To: Vadim Pasternak <vadimp@mellanox.com>
>> Cc: robh+dt@kernel.org; vijaykhemka@fb.com; linux-hwmon@vger.kernel.org;
>> devicetree@vger.kernel.org; Michael Shych <michaelsh@mellanox.com>; Ofer
>> Levy <oferl@mellanox.com>
>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
>> device list supported by driver
>>
>> Hi Vadim,
>>
>> On Mon, Jan 13, 2020 at 12:25:44PM +0000, Vadim Pasternak wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>>> Sent: Wednesday, January 08, 2020 6:48 PM
>>>> To: Vadim Pasternak <vadimp@mellanox.com>
>>>> Cc: robh+dt@kernel.org; vijaykhemka@fb.com;
>>>> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org; Michael
>>>> Shych <michaelsh@mellanox.com>
>>>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679)
>>>> Extend device list supported by driver
>>>>
>>>> On Wed, Jan 08, 2020 at 02:10:50PM +0000, Vadim Pasternak wrote:
>>>>>
>>>>> Hi Guenter,
>>>>>
>>>>> We are looking for possibility to provide some kind of flexible
>>>>> driver to handle different devices from different vendors, but
>>>>> which have common nature, like support of two pages for telemetry
>>>>> with same set of functions and same formats. (Actually driver
>>>>> could be flexible regarding the
>>>> number of pages).
>>>>>
>>>>> While the difference only in VID codes mapping.
>>>>>
>>>>> The motivation for that is to give free hand to HW design to
>>>>> choose which particular device to use on the same system type.
>>>>> There are two main reasons for such requirement:
>>>>> - Quality of device (we already had a serios problems with ucd9224 and
>>>>>    tps53679, caused system meltdown). In such case the intention is to move
>>>>>    to fallback devices in the next batches.
>>>>> - Device availability in stock. Sometimes vendors can't supply in time the
>>>>>     necessary quantity.
>>>>>
>>>>> Currently there are the devices from three vendor: TI tps536xx,
>>>>> Infineon
>>>>> xdpe122 and MPS mp2975.
>>>>> All have different mapping of VID codes.
>>>>>
>>>>> It could be also few additional devices, which are supposed to be
>>>>> used as fallback devices.
>>>>>
>>>>> We have several very big customers ordering now huge quantity of
>>>>> our systems, which are very conservative regarding image upgrade.
>>>>> Means we can provide now support for tps536xx, xdpe122xx and
>>>>> mp2975 but in case new devices are coming soon, we will be able to
>>>>> support it in kernel for their image after year or even more.
>>>>>
>>>>> We can provide ACPI pmbus driver, which will read VID mapping from
>>>>> ACPI DSDT table. This mapping table will contain the names of
>>>>> available modes and specific vendor code for this mode. Like:
>>>>> PMBVR11=1
>>>>> PMBVR12=2
>>>>> PMBVR13=5
>>>>> PMBIMVP9=10
>>>>> And driver will set info->vrm_version[i] according to this mapping.
>>>>>
>>>>
>>>> The DSDT would have to provide all properties, not just the VID modes.
>>>> At the very least that would have to be the number of pages, data
>>>> formats, vrm version, and the supported attributes per page. It
>>>> should be possible to also add m/b/R information for each of the
>>>> sensor classes, but I guess the actual implementation could be postponed
>> until it is needed.
>>>>
>>>> This could all be done through the existing generic driver
>>>> (pmbus.c); it would not really require a new driver. ACPI/DSDT could
>>>> provide firmware properties, and pmbus.c could read those using
>>>> device_property API functions (eg device_property_read_u32(dev, "vrm-
>> mode")). Would that work for you ?
>>>
>>> Hi Guenter,
>>>
>>> We thought that it's possible to provide just modified DSDT with the
>>> specific configuration as an external table, which is loaded during system boot.
>>>
>>> It should not be integrated into BIOS image.
>>> We want to avoid releasing of new BIOS or new each time system
>>> configuration is changed.
>>> New BIOS is released only when new CPU type should be supported.
>>> Also BIOS overwriting is not an option, sine we have to support secured BIOS.
>>>
>>> It should not be located in initrd.
>>> The new system batch is released with BIOS, SMBIOS and with customer's
>>> OS or with install environment like ONIE.
>>> Means no kernel changes.
>>> Also not all our customers use initrd.
>>>
>>> So, it seems there is no place, when we can locate modified DSDT and
>>> load it dynamically.
>>> But we should think more about possible methods for doing it.
>>>
>>> Today all the static devices are instantiated  from the user space.
>>> It's supposed to work for us while we have to support some pre-defined
>>> set of devices, for which we can detect the specific configuration
>>> through DMI tables (SKU in particular).
>>> But it'll not work for some new coming devices.
>>>
>>> We have a possibility to provide VID mapping info through CPLD device.
>>> But in this case we'll have to implement Mellanox specific PMBus
>>> driver aware of CPLD register map.
>>> Not sure if such approach is accepted?
>>>
>>
>> How about a platform driver which loads the parameters into device properties
>> from whatever location and instantiates the pmbus driver ?
>> The PMBus driver would then read the device attributes and instantiate itself
>> accordingly.
>>
>> If the other PMBus attributes can be auto-detected, it might actually be
>> sufficient to have a per-page vrm-mode property and otherwise use the auto-
>> detect mechanism of pmbus.c.
> 
> Hi Guenter,
> 
> I didn't think about such possibility.
> It sounds promising.
> 
> So, we can add our platform driver to "drivers/platform/mellanox",
> which can:
> - fetch "vrm" mapping per each relevant device.
> - for each allocate device node, create properties table with vrm mode
>   mapping like "vrm-mode-vr11", "vrm-mode-vr12", "vrm-mode-vr13",
>   "vrm-mode-imvp9", "vrm-mode-amd625mv", coded accordingly to
>   "enum vrm_version".
> - attach this node to "i2c_board_info" and instantiate it with
>    i2c_new_device() for "pmbus" type.
> 
> And i"pmbus" will get these properties like
> device_property_read_8(dev, "vrm-mode-vr11")) etcetera.
> 
> Did I get your suggestion correctly?
> 

Correct. We'll need a bindings document, though, to make it official.

The binding would look something like "vrm-mode = <number>", where
<number> is well defined (possibly in an include file). There are many
bindings include files which you can use as examples.
We'll need to get DT maintainer approval for the exact binding name;
maybe it has to be "pmbus,vrm-mode" or something like that.

Thanks,
Guenter
