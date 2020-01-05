Return-Path: <SRS0=lfVP=22=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAC6C33C8C
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 18:35:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B58B520866
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 18:35:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRSqTVNY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgAESfC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jan 2020 13:35:02 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43905 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgAESfB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jan 2020 13:35:01 -0500
Received: by mail-pg1-f193.google.com with SMTP id k197so25810188pga.10;
        Sun, 05 Jan 2020 10:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KQ91YVn/rmJBqxHYRpPIQMhM/8tE3sVnvU7fTnRCHxc=;
        b=sRSqTVNYV3UxxH7K+0IBkd9R7DqXms1hRWxJd7BRVeKrlJUsRFO9Icmn4P9gSeIuYT
         aM90/cm/ejehqsudvf9xpl10qx4bqNqRgA529zK6e2noBcK5omKk5izCVILDuPrbpUh5
         M3/LoNX35CvYX8BHs4WvLHRieee4io5yKMAl/npYcm2wzk23mUADWokA9762vsPdSjKZ
         XaJMvTYRJU+CjG7TGLttN+33L0n4rHspFr+zFARWjBN0CQItg9zHtn6E7OnzvHkXIoxR
         fLQpDeeBK8+VSNJVAslVKuvuO9tOdwPsJFC7bIMf9iiHS76EAEvu4ADjESe4RG54ILHe
         J2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KQ91YVn/rmJBqxHYRpPIQMhM/8tE3sVnvU7fTnRCHxc=;
        b=Lb18gaGoD9jyhaOzQzKM0OoGLjR+bJYFa6IdO2TJRQgaV6lE+Pws3u0YY827I0cz9k
         H77P5YVBnL0i2w30Teb95p2qZwkfGcjWv+/f/SoPfFoO2QOO7Prbv83yuwzTmxApTWh4
         viv95JDOe/2tkU5CkaBJZZUOaXMG1qstT5+cIOzPm0i3SteiPZd/WqEtMWeUOF5T/cTu
         8HQn2w/d0BBcDMBqgW9266F5DSJNkgiwdRHIu5uQ+wudrv4qlQisGhyg7MVbvHffah9M
         P/XJ5ty87MMpvdog+8dd7zPRYz2zmBtLnx4GWPeZPQR+rsz/ll5QG4Dhto+CETDxriIW
         aI1A==
X-Gm-Message-State: APjAAAVn6wSOXGFWEzzU7wiJIV1ZFCOyhHSYCWXDSHs6v+oSoMCQvjPv
        GQ93+DpFYjn9fiGke0R4DbdUVNdS
X-Google-Smtp-Source: APXvYqy2p/WOZ459qo0J77vlb+jtmf1ZnaQO/2Y8EwdFJLnuVzSh16+4kl1L5GGDkwz2ftPDuasi0Q==
X-Received: by 2002:a62:64d6:: with SMTP id y205mr106466038pfb.41.1578249300237;
        Sun, 05 Jan 2020 10:35:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g8sm74097116pfh.43.2020.01.05.10.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2020 10:34:59 -0800 (PST)
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
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a30e4f98-65a4-f93c-371e-7691aace41f7@roeck-us.net>
Date:   Sun, 5 Jan 2020 10:34:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <AM6PR05MB5224F444CBAC5A0503AFBB83A23D0@AM6PR05MB5224.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/5/20 8:44 AM, Vadim Pasternak wrote:
> 
> 
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Sunday, January 05, 2020 6:04 PM
>> To: Vadim Pasternak <vadimp@mellanox.com>; robh+dt@kernel.org;
>> vijaykhemka@fb.com
>> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
>> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
>> device list supported by driver
>>
>> On 1/5/20 2:58 AM, Vadim Pasternak wrote:
>>> Extends driver with support of the additional devices:
>>> Texas Instruments Dual channel DCAP+ multiphase controllers: TPS53688,
>>> SN1906016.
>>> Infineon Multi-phase Digital VR Controller Sierra devices XDPE12286C,
>>> XDPE12284C, XDPE12283C, XDPE12254C and XDPE12250C.
>>>
>>> Extend Kconfig with added devices.
>>>
>>> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>>> ---
>>>    drivers/hwmon/pmbus/Kconfig    |  5 +++--
>>>    drivers/hwmon/pmbus/tps53679.c | 14 ++++++++++++++
>>>    2 files changed, 17 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
>>> index 59859979571d..9e3d197d5322 100644
>>> --- a/drivers/hwmon/pmbus/Kconfig
>>> +++ b/drivers/hwmon/pmbus/Kconfig
>>> @@ -200,10 +200,11 @@ config SENSORS_TPS40422
>>>    	  be called tps40422.
>>>
>>>    config SENSORS_TPS53679
>>> -	tristate "TI TPS53679"
>>> +	tristate "TI TPS53679, TPS53688, SN1906016, Infineon XDPE122xxx
>> family"
>>>    	help
>>>    	  If you say yes here you get hardware monitoring support for TI
>>> -	  TPS53679.
>>> +	  TPS53679, PS53688, SN1906016 and Infineon XDPE12286C,
>> XDPE12284C,
>>
>> TPS53688. For the others, for some I can't even determine if they exist in the
>> first place (eg SN1906016, XPDE12250C) or how they would differ from other
>> variants (eg XPDE12284C vs. XPDE12284A).
>> And why would they all use the same bit map in the VOUT_MODE register, the
>> same number of PMBus pages (phases), and the same attributes in each page ?
> 
> Hi Guenter,
> 
> Thank you for reply.
> 
> On our new system we have device XPDE12284C equipped.
> I tested this device.
>
Sounds good, but did you also make sure that all chips have the same number
of pages (phases), the same set of commands as the TI chip, and support the
same bit settings in VOUT_MODE ? It seems a bit unlikely that TI's register
definitions would make it into an Infineon chip.

Also, what about the SN1906016 ? I don't find that anywhere, except in one
place where it is listed as MCU from TI.

> Infineon datasheet refers all these device as XDPE122xxC
> family and it doesn't specify any differences in register map
> between these devices.

That is a bit vague, especially when it includes devices which return
zero results with Google searches.

"A" vs. "C" may distinguish automotive vs. commercial; the "A" device
is listed under automotive. If the command set is the same, I don't
really want the "c" in the id.

> Tomorrow we'll have guys from Infineon in our lab and I'll
> verify if there is any difference.

Tell them that it isn't really helpful to keep their datasheets
under wrap. Unfortunately, TI started doing the same, which isn't
helpful either.

Thanks,
Guenter

> If yes, I'll leave only XPDE12284C.
> 
>>
>> Thanks,
>> Guenter
>>
>>> +	  XDPE12283C, XDPE12254C, XDPE12250C devices.
>>>
>>>    	  This driver can also be built as a module. If so, the module will
>>>    	  be called tps53679.
>>> diff --git a/drivers/hwmon/pmbus/tps53679.c
>>> b/drivers/hwmon/pmbus/tps53679.c index 7ce2fca4acde..f38eb116735b
>>> 100644
>>> --- a/drivers/hwmon/pmbus/tps53679.c
>>> +++ b/drivers/hwmon/pmbus/tps53679.c
>>> @@ -89,6 +89,13 @@ static int tps53679_probe(struct i2c_client
>>> *client,
>>>
>>>    static const struct i2c_device_id tps53679_id[] = {
>>>    	{"tps53679", 0},
>>> +	{"tps53688", 0},
>>> +	{"sn1906016", 0},
>>> +	{"xdpe12283c", 0},
>>> +	{"xdpe12250c", 0},
>>> +	{"xdpe12254c", 0},
>>> +	{"xdpe12284c", 0},
>>> +	{"xdpe12286c", 0},
>>
>> Alphabetic order, please.
>>
>>>    	{}
>>>    };
>>>
>>> @@ -96,6 +103,13 @@ MODULE_DEVICE_TABLE(i2c, tps53679_id);
>>>
>>>    static const struct of_device_id __maybe_unused tps53679_of_match[] = {
>>>    	{.compatible = "ti,tps53679"},
>>> +	{.compatible = "ti,tps53688"},
>>> +	{.compatible = "ti,sn1906016"},
>>> +	{.compatible = "infineon,xdpe12283c"},
>>> +	{.compatible = "infineon,xdpe12250c"},
>>> +	{.compatible = "infineon,xdpe12254c"},
>>> +	{.compatible = "infineon,xdpe12284c"},
>>> +	{.compatible = "infineon,xdpe12286c"},
>>>    	{}
>>>    };
>>>    MODULE_DEVICE_TABLE(of, tps53679_of_match);
>>>
> 

