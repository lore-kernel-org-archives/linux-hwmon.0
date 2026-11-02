Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630469;
	b=XUSBrZnFZBAImVGL45oM3mv4Hsc+EkFd/Gm2XoBAhSDWmN2kAnrVFiP8ilIw3njOVBFj
	 yQF/ZywMH/GlsltvT8Pj7q77qTzIV9VwwymNjNkmOgqXRxhsX0X8M8i4LCofHsyhsb66z
	 S5QRzmpn2Mgw/NYmz0DVeijyB7Z7xll1Vzh91crJTSc9WeMB+O6lvvbcJO3YNT587p6CN
	 Tl5utgr0D2GKtjFihZF2TFqqNKagDd/pirfqYjYzTtWG4+fiavTZGyIOq9NxNxjLS9y4d
	 xEmHeyyT6tciQtqQJeJUFPeOjSUsyzlTlFSudTpRiBG7OURMEUGkM04OxAWdycSvtMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630469;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=uhhyoTnuOePmiNi2TTjrH2pfB4g3E59pTNwEteU8WVw=;
	b=WyQo292QpeOCBFAsygt88Q+d0idaZzTAAf6SkSTKfi9RdrdygL7CrsVdvCTngBrQ14rS
	 NIiZjrK/rmuvCo5vIaQWRHOpckvUg5Sb1BHpHxmyyUQW474UpojQnM9oYmQZHVE6ETFLK
	 +nzxr4n9LF2UdFVk37ZM1aU0ysjpyKi3NlcXH9sI2W31SuS3wPnIBFcePox1cuANxjdkW
	 FQKEDk6zw/f6G9FT7G/g4I2wDdY/LUQf9GL/80DMr8HzuLNfyW9ioezyenpuVMgUPpPiM
	 uAtWkTR5+KvITZNViTUmsvvOJqSARPuK4RyfaBshAqwmwkJWapGnVwYl+bfbLh+MbiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FKtnF6dB;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47617606F214
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 14:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47617606F214
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FKtnF6dB
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id NrdqxQoCwMylkNtDgxxxvz; Mon, 02 Nov 2026 14:41:08 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NtDfxf3aPNSXiNtDfxzSTc; Mon, 02 Nov 2026 14:41:07 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae8a104
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=UZ1dQ18DKJ-JX__J:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=_jlGtV7tAAAA:8 a=pGLkceISAAAA:8 a=gbnuFjvqYHqCK1CYIykA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=uhhyoTnuOePmiNi2TTjrH2pfB4g3E59pTNwEteU8WVw=; b=FKtnF6dBM9D4
	/mQdgXnbzZz2k6e8Ww4dCKe3p6d3mQHc6R7VsgQm1/831PLzXe6gFi0XlTIq28BWnMijosx4zBRjA
	Oy+3p9u0EOsrZn7Ey0vz48KB4410GmaoUBfbxiSU0Evh3Vg2B+6OB6Gv/KDsaBAkG5RyzTgBTgzg1
	pEH3H+IKtoUeItaLBPrQxEPW61GBXi/fLR2JGOOHg6jYLO6MGiE41c5siYo5B3JDDbt4in03/PO57
	fxcyCBlAFHquGRL425W2F0DdeDZ+yLH6cwHn5itrIXJgGw6l0b39st6MKmJ0hIk8PSMYbwaTwzVq2
	NRvO6lpj3gd+o5YADYrSnw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58310)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNtDf-00000003c0m-0aAh;
	Mon, 02 Nov 2026 20:11:07 +0530
Message-ID: <862b0b65-6c7e-4521-9fd3-c5d53e4ddb72@roeck-us.net>
Date: Mon, 2 Nov 2026 06:41:05 -0800
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] hwmon: sy7636a: read the temperature only while
 the rails are on
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>,
 Andreas Kemnade <andreas@kemnade.info>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261101223125.302001-1-pmazzini@gmail.com>
 <20261101223125.302001-6-pmazzini@gmail.com>
 <2c48d47a-85f5-48e8-a675-239b033eb0ce@roeck-us.net>
 <CAAxh=jvHthWQb2zi-XKM9ggM3Qi7Ra=QSfCGsVTPk54HexQqHA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAAxh=jvHthWQb2zi-XKM9ggM3Qi7Ra=QSfCGsVTPk54HexQqHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xNtDf-00000003c0m-0aAh
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:58310
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKWWndnGQmrbP9b6R6bkAuFcu7Ek+1p6nhXxNtjJ1LcGvYwd1TLABrP9lYvi9WLOu5lDTsEoK8vMAfSxgkS7T3HhcIO+39OnqxABfpQ4DsniB5cMJKH1
 gaZzlQQq8QhbF5orMTedL6tZsb6zP9WqDKgAQnBHoacsXMHCO4FLZ4Hmno2r4uhSZXmuGuNhSDjEa6kMkgbuLfXP9A4PngxvVZwJTefsJ24YYMep5EMvW9Uj

On 11/2/26 00:09, Pablo Mazzini wrote:
> Thanks for looking at it.
> 
> Reading the temperature races with the rails being switched on and
> off, as Andreas pointed out on v1.
> 

This should be explained as comment, with source (I don't see that
in the datasheet).

> PG only goes high once all rails are up, after the first measurement.
> It is also in register 0x07, next to the thermistor readout, so one
> short transfer reads both.
> 

That is not really an argument. With the current implementation,
static state with EN=1 and PG=0 will report no temperatures even though
temperatures may be available.

Guenter

> Pablo
> 
> On Mon, Nov 2, 2026 at 3:35 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 11/1/26 14:31, Pablo Mazzini wrote:
>>> The driver enables VCOM at probe, which keeps the panel's high voltage
>>> rails on for good, and gets a dummy regulator if it probes before the
>>> regulator exists. Read the temperature only while the rails are on, when
>>> the chip samples it, and return -ENODATA otherwise. Read power good with
>>> it in one transfer, so the value can not be from before the first sample
>>> or after the rails went off. Register it under the chip name, as the
>>> TPS65185 and FP9931 drivers do.
>>>
>>> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
>>> ---
>>>    drivers/hwmon/sy7636a-hwmon.c | 25 ++++++++++++++-----------
>>>    1 file changed, 14 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
>>> index f01f368d68e5..475aff997c2d 100644
>>> --- a/drivers/hwmon/sy7636a-hwmon.c
>>> +++ b/drivers/hwmon/sy7636a-hwmon.c
>>> @@ -14,7 +14,6 @@
>>>    #include <linux/module.h>
>>>    #include <linux/platform_device.h>
>>>    #include <linux/regmap.h>
>>> -#include <linux/regulator/machine.h>
>>>
>>>    #include <linux/mfd/sy7636a.h>
>>>
>>> @@ -22,14 +21,22 @@ static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
>>>                        u32 attr, int channel, long *temp)
>>>    {
>>>        struct regmap *regmap = dev_get_drvdata(dev);
>>> -     int ret, reg_val;
>>> -
>>> -     ret = regmap_read(regmap,
>>> -                       SY7636A_REG_TERMISTOR_READOUT, &reg_val);
>>> +     u8 buf[2];
>>> +     int ret;
>>> +
>>> +     /*
>>> +      * Read power good and the thermistor in one transfer: the thermistor is
>>> +      * only sampled while the rails are on, and power good comes after the
>>> +      * first sample
>>> +      */
>>> +     ret = regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, sizeof(buf));
>>>        if (ret)
>>>                return ret;
>>>
>>> -     *temp = (s8)reg_val * 1000;
>>> +     if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
>>> +             return -ENODATA;
>>> +
>>
>> I had a look at the datasheet. It does not say anything about the
>> temperature not being measured when PG is not set.
>>
>> The datasheet does suggest that temperatures are only measured
>> if bit 7 of the operation mode register is set, but that is
>> different from the "power good" bit in the fault register.
>>
>> So why the association with the PG bit and not with the On/Off bit
>> of the operation mode register ? That warrants some more explanation.
>>
>> Thanks,
>> Guenter
>>    > +   *temp = (s8)buf[1] * 1000;
>>>
>>>        return 0;
>>>    }
>>> @@ -72,12 +79,8 @@ static int sy7636a_sensor_probe(struct platform_device *pdev)
>>>        if (!regmap)
>>>                return -EPROBE_DEFER;
>>>
>>> -     err = devm_regulator_get_enable(&pdev->dev, "vcom");
>>> -     if (err)
>>> -             return err;
>>> -
>>>        hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
>>> -                                                      "sy7636a_temperature", regmap,
>>> +                                                      "sy7636a", regmap,
>>>                                                         &sy7636a_chip_info, NULL);
>>>
>>>        if (IS_ERR(hwmon_dev)) {
>>

