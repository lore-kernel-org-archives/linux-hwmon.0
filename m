Return-Path: <SRS0=pmHe=RY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA08C43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Mar 2019 13:14:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D55F621901
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Mar 2019 13:14:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcltZjwC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbfCUNO1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Mar 2019 09:14:27 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38285 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728145AbfCUNO1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Mar 2019 09:14:27 -0400
Received: by mail-pf1-f196.google.com with SMTP id 10so4278863pfo.5;
        Thu, 21 Mar 2019 06:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H/SJS88IpwGLal4CqHG9XEDUOjKyTbxeHogHRe/U/3o=;
        b=qcltZjwC4YWputpykpCsx9ud0PX0D533tzH3fXcsUYGB1BwHkRhfYTVeW+qUcQfJAI
         MyCSqsTJ3n7MJXPeXy5qzHWs4qbMPV4rVovwS24VCVSDHB6IcKjbmHkUmjruyIDR0Sm5
         BF4D+ST0hoyNRxRN5FLP0AVT+Tjc9NURLXFURAl7+xDd8OvdShloIw5e0j6HjKW0EXT4
         bhRVBXB6v+Nq8ovdSR/lGrbrbSTNRZai64YMjQcsqjQqkUaYLaddTdikr4YcDdm6vaEW
         GkQdZ97w+aXZJaBIYlvi89Rj/KzLgkw/YBg9cJcVzF8O+n5JK6AW27HycL1hj1hjlXg+
         JClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H/SJS88IpwGLal4CqHG9XEDUOjKyTbxeHogHRe/U/3o=;
        b=YCnhrnttU5LsmMUme4v2Q+GDHLTMdflXWA84rSXFb82W2JRJqHvVi6DzM8I1iF9k87
         ebQ9EyXQUVzRjA8AJFl0rtf8qy2dxeHjyhD196jqXrCMgz037M0l5txLounZzrlyhlzH
         itxqNyHOXK4/EuVzcSEaQeecuvzkRvLit503fVtPiAXVjSGdNy1GJBLTu8vZBRa5k8qF
         fljA8gURREzOE6/VuZfIQKNfje65BwlQvMidpzDsIz5gxOFTmOaRBAGpfdStSABarShQ
         2FCyTqSY3itKMHxPEtW1l6IvFT2Kgk0BmOliu/ikBpji6YZleWu13UiIMVKN5rX3pR9P
         zD1A==
X-Gm-Message-State: APjAAAXO5gpwX/G2xFDf8xacO6H64lRXj/Q549hmpQ30ZWykto4oQGTN
        x3YIr21OnwBt5Bp9QPX/FHxocEud
X-Google-Smtp-Source: APXvYqwXKRSB3nPRQfZkaShpy7LO/uY1MuG1VenfBrypJ+04l34jjLpqecI1q64TDNA09JZRwR/nfg==
X-Received: by 2002:a65:5c0b:: with SMTP id u11mr3218673pgr.352.1553174066360;
        Thu, 21 Mar 2019 06:14:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g6sm6298435pgq.54.2019.03.21.06.14.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Mar 2019 06:14:24 -0700 (PDT)
Subject: Re: [PATCH 3/3] hwmon: lochnagar: Add Lochnagar 2 hardware monitoring
 driver
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-hwmon@vger.kernel.org, corbet@lwn.net,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com
References: <20190320145818.30644-1-ckeepax@opensource.cirrus.com>
 <20190320145818.30644-3-ckeepax@opensource.cirrus.com>
 <20190320164010.GA13650@roeck-us.net>
 <20190321115930.GX46536@ediswmail.ad.cirrus.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <792e97a0-8131-7497-fd2b-2285134ef94d@roeck-us.net>
Date:   Thu, 21 Mar 2019 06:14:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190321115930.GX46536@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/21/19 4:59 AM, Charles Keepax wrote:
> On Wed, Mar 20, 2019 at 09:40:10AM -0700, Guenter Roeck wrote:
>> On Wed, Mar 20, 2019 at 02:58:18PM +0000, Charles Keepax wrote:
>>> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>>>
>>> Lochnagar is an evaluation and development board for Cirrus
>>> Logic Smart CODEC and Amp devices. It allows the connection of
>>> most Cirrus Logic devices on mini-cards, as well as allowing
>>> connection of various application processor systems to provide a
>>> full evaluation platform.
>>>
>>> This driver adds support for the hardware monitoring features of
>>> the Lochnagar 2 to the hwmon API. Monitoring is provided for
>>> the board voltages, currents and temperature supported by the
>>> board controller chip.
>>>
>>> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
>>> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>>> ---
>>> +#include <linux/of_device.h>
>>> +#include <linux/i2c.h>
>>> +#include <asm/div64.h>
>>> +
>>
>> Alphabetic order, please. Also, please include linux/math64.h
>> instead of asm/div64.h.
>>
>>> +struct lochnagar_hwmon {
>>> +	struct lochnagar *lochnagar;
>>
>> The only use of this structure is to dereference regmap from it.
>> Please replace it with a pointer to struct regmap.
>>
>>> +
>>> +	/* Lock to ensure only a single sensor is read at a time */
>>> +	struct mutex sensor_lock;
>>> +	struct device *hwmon_dev;
>>
>> Not used anywhere.
>>
>>> +static u64 float_to_int(u32 data, u32 precision)
>>
>> A return type of 'long' would make more sense. Also see below.
> 
> Yup will get those all fixed up.
> 
>>
>>> +{
>>> +	s64 man = data & 0x007FFFFF;
>>> +	s32 exp = ((data & 0x7F800000) >> 23) - 127 - 23;
>>> +	bool negative = data & 0x80000000;
>>> +
>>> +	man = (man + (1 << 23)) * precision;
>>> +
>>> +	if (exp > 0)
>>> +		man <<= exp;
>>> +	else if (exp < 0)
>>> +		man >>= -exp;
>>> +
>>
>> Is this an ieee754 floating point format ? Please add a comment stating it.
>> Also, if the format supports it, please check for NaN. If the HW guarantees
>> to never return NaN, please add a respective comment.
>>
>> How likely is it that the values overflow ? A precision multipler of
>> 1,000,000,000 means that numbers will overflow quite easily. And does
>> the the hardware really report voltages and currents in pico-units,
>> and are temperatures really reported in micro-degrees C ?
>>
> 
> I believe the hardware can't return NaN. But will check that,
> what ranges are possible and add some overflow checking.
> 

How about the units ? Maybe add a note explaining what the HW actually returns.

>> Overall it might make sense to reconfigure the hardware into continuous
>> measurement mode and get rid of the delays (if that can be configured -
>> the user guide isn't detailed enough to be able to determine for sure).
>> After all, it is quite unlikely that the board will be used in an
>> environment where the power savings would be worth the inconvenience
>> of having to wait more than two seconds for a set of measurement values
>> (adding all the current and temperature delays up).
>>
> 
> Yeah the hardware is quite slow and regrettably doesn't have a
> continuous measurement mode. We could potentially add a thread to
> poll them but mostly the usage for this data is just taking power
> measurements of various audio use-cases so the large delay isn't
> a huge problem and not sure it warrents the additional
> complexity.
> 
>>> +	msleep(nsamples);
>>> +
>>
>> This needs some explanation how nsamples translates into millisecond waits,
>> especially since that wait can add up significantly (reading the temperature
>> will take forever, as will reading all currents).
>>
>>> +	ret =  regmap_read_poll_timeout(regmap, LOCHNAGAR2_IMON_CTRL3, val,
>>> +					val & LOCHNAGAR2_IMON_DONE_MASK,
>>> +					5000, 2000000);
>>
>> Can that indeed take another two seconds on top of the sleep above ?
>>
> 
> It does about about 1.5-2 seconds I think last time I checked.
> 
> Essentially the hardware will average a number of readings and
> return that. The number of readings given in the driver is what
> the hardware guys recommended for each, that said we could
> potentially make it configurable if that helps at all? Also
> I could get the msleep a bit closer to the actual runtime,
> just need to check how linear the time is with the number of
> samples take (I assume very).
> 

Brr. Just add a note explaining that the long times are indeed intentional,
and that the HW takes that long.

Thanks,
Guenter

>>> +static int lochnagar_hwmon_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct lochnagar *lochnagar = dev_get_drvdata(dev->parent);
>>> +	struct lochnagar_hwmon *priv;
>>> +
>>
>> It might make sense to add a check to ensure that lochnagar is not NULL.
>>
> 
> Can do.
> 
> Thanks,
> Charles
> 

