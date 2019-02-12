Return-Path: <SRS0=z86d=QT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DEEC282C4
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Feb 2019 16:12:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3680E21773
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Feb 2019 16:12:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBqMFxVH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730808AbfBLQMY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Feb 2019 11:12:24 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44144 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728585AbfBLQMY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Feb 2019 11:12:24 -0500
Received: by mail-pg1-f194.google.com with SMTP id y1so1452603pgk.11;
        Tue, 12 Feb 2019 08:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JDYGZVeE/67pu9/b6zrQDDBAGFhszR/n3uCYeLzZnWI=;
        b=SBqMFxVHlETXLji4tl03c91VLJQX2tJBwHLC5Go02ZBipvsJlb6hcLgXbq6Ho7hk3X
         YsNNi+EJZigsyQkBzrht4XSKpF5Ok/auMERfTmefR7/16fLDQiRLOB6xJHMZrkDdG/Yv
         V+ln0HAhcd6bgIIOcLCYgAPTDWOMCJZGz3ekKvYBRQZT/dLUjwXMV7ThSvWkurVcBNCy
         PyZuIdCHhNb9rS5Rrj2lSyQUQxNXkt91txBsNzorVhyAjP9hX0RdjcuKZv1u+6EBMSKw
         JKAhkY/4StPZ5h6AyaBGLNaIBMpVeg0BHdN1KqX0XD8sKaEnap1EjZYpA/9+Jg12cYP1
         jUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JDYGZVeE/67pu9/b6zrQDDBAGFhszR/n3uCYeLzZnWI=;
        b=f0F+gf6bMGrwGsCDcy2uy9m8V947IJu0a75Ldl5NexR6e/W7LpiQapI0//Vtq2gWDq
         2cZm7d34IKOTgt6QEWrm8GkJAOxcvethQ/2q7FXQXGASmsQsr+a/1qypAdejnZZJM/zW
         DY8UrsC7LDJkSFvwaBk39ZFjbsou+Fc3n7mF8HNFksUXlzW+49I1KwwJvKz3tlRE9WHK
         7b+5mcQqGUFGv2PW+HotYvFlZ/aJUpEaob3ns+ODMOP4WsZy0L3DAu4E++fw39NY/y46
         QDikNht+miYhWH0/d8QtSN62O+zB2ND7Zj6tHxn556Jn0pbGET8DJS99Qg6uD+fquvpd
         rTdQ==
X-Gm-Message-State: AHQUAuZmQqS0nDLja9T3d+H0pSq6Ef6yFftzmWqctRu+nH1C7rd0KF67
        au9EqpvOotMF2dVwi5DoefZcNbSX
X-Google-Smtp-Source: AHgI3IZMCpT3HJdChTNNTpY+9bpihXjUZu6SJLoaLfREq002M4boFNfSsqfAR1Hyxv/Kh86WHd6O5A==
X-Received: by 2002:a65:40c5:: with SMTP id u5mr4257169pgp.46.1549987943044;
        Tue, 12 Feb 2019 08:12:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y14sm22691199pgc.17.2019.02.12.08.12.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Feb 2019 08:12:22 -0800 (PST)
Subject: Re: [PATCH V3 3/6] thermal: Register hwmon in
 thermal_zone_of_sensor_register_param()
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Marek Vasut <marek.vasut@gmail.com>
Cc:     Eduardo Valentin <edubezval@gmail.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>, linux-hwmon@vger.kernel.org
References: <20181217155644.29278-1-marek.vasut@gmail.com>
 <20181217155644.29278-4-marek.vasut@gmail.com>
 <20181218214439.GB8850@localhost.localdomain>
 <867ffa18-9c16-685a-7c83-7534bc14e41d@gmail.com>
 <a4aa607d-f83a-2ed4-09c2-fdcba308664d@gmail.com>
 <2b24720c-c649-44e0-0337-c8a52c78d33d@gmail.com>
 <20190205232442.GA4423@localhost.localdomain>
 <1b331713-d1d1-1fe0-277e-2fea4866c244@gmail.com>
 <CAMuHMdW_ifuQqz9Y_-o4JXX42d+NMOt5L6chszcvw0MriSq8LA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a440c5f7-07dd-bf62-88ce-ec05df0fbf50@roeck-us.net>
Date:   Tue, 12 Feb 2019 08:12:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW_ifuQqz9Y_-o4JXX42d+NMOt5L6chszcvw0MriSq8LA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/12/19 12:52 AM, Geert Uytterhoeven wrote:
> Hi all,
> 
> On Mon, Feb 11, 2019 at 9:43 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 2/6/19 12:24 AM, Eduardo Valentin wrote:
>>> On Mon, Jan 28, 2019 at 01:10:11PM +0100, Marek Vasut wrote:
>>>> On 1/15/19 1:35 AM, Marek Vasut wrote:
>>>>> On 12/22/18 3:19 AM, Marek Vasut wrote:
>>>>>> On 12/18/2018 10:44 PM, Eduardo Valentin wrote:
>>>>>>> On Mon, Dec 17, 2018 at 04:56:41PM +0100, marek.vasut@gmail.com wrote:
>>>>>>>> From: Marek Vasut <marek.vasut@gmail.com>
>>>>>>>>
>>>>>>>> Register hwmon sysfs interface in thermal_zone_of_sensor_register_param()
>>>>>>>> in case thermal_zone_params->no_hwmon is set to false. This behavior is
>>>>>>>> the same as thermal_zone_device_register().
>>>>>>>>
>>>>>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>>>>>> Cc: Eduardo Valentin <edubezval@gmail.com>
>>>>>>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>>>>>> Cc: Zhang Rui <rui.zhang@intel.com>
>>>>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>>>>> To: linux-pm@vger.kernel.org
>>>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>>>> ---
>>>>>>>> V2: No change
>>>>>>>> V3: - Work around the From line and SoB line checkpatch warning
>>>>>>>>      - Reorder the SoB line at the end
>>>>>>>> ---
>>>>>>>>   drivers/thermal/of-thermal.c | 12 +++++++++++-
>>>>>>>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
>>>>>>>> index e1a303a5698c..5ccff7b678de 100644
>>>>>>>> --- a/drivers/thermal/of-thermal.c
>>>>>>>> +++ b/drivers/thermal/of-thermal.c
>>>>>>>> @@ -15,6 +15,7 @@
>>>>>>>>   #include <linux/string.h>
>>>>>>>>
>>>>>>>>   #include "thermal_core.h"
>>>>>>>> +#include "thermal_hwmon.h"
>>>>>>>>
>>>>>>>>   /***   Private data structures to represent thermal device tree data ***/
>>>>>>>>
>>>>>>>> @@ -521,8 +522,15 @@ thermal_zone_of_sensor_register_params(struct device *dev, int sensor_id,
>>>>>>>>                   if (sensor_specs.np == sensor_np && id == sensor_id) {
>>>>>>>>                           tzd = thermal_zone_of_add_sensor(child, sensor_np,
>>>>>>>>                                                            data, ops);
>>>>>>>> -                        if (!IS_ERR(tzd))
>>>>>>>> +                        if (!IS_ERR(tzd)) {
>>>>>>>> +                                tzd->tzp = tzp;
>>>>>>>
>>>>>>> So, here you will overwrite what was done in of_parse_thermal_zones().
>>>>>>> That means, after this point, property like sustainable power, slope and
>>>>>>> offset are gone.
>>>>>>
>>>>>> Hmmmmm, that was rather inobvious, indeed.
>>>>>>
>>>>>> Do you have some suggestion how to pass in the no_hwmon = false then ?
>>>>>> Since tzp->no_hwmon is set to true in of_parse_thermal_zones(), the
>>>>>> three drivers (stm32, rcar, rcar_gen3) seem to hack around it. I'd like
>>>>>> to clean that up.
>>>>>
>>>
>>> Yeah, that is an issue.
>>>
>>>>> Bump ?
>>>>
>>>> Bump again, any suggestions ?
>>>
>>> Yeah, a couple of ideas have been proposed for this issue.
>>>
>>> First most tempting one is to have a DT property per thermal zone.
>>> Making it linux specific, something prefixed by linux,<property>. I
>>> recall Amit Kutcheria trying something similar to this, but dont
>>> remember where that went. Frankly, this is a Linux thing, I am not
>>> convinced DT is really the right place to fix this.
>>
>> DT is not the right place for this, DT describes hardware and this is
>> policy, so it shouldn't be in DT.
> 
> Indeed.
> 
>>> Another hack that could be written is a module parameter for of-thermal
>>> that would reflect the no_hwmon value, globally. The down side here is
>>> you have to make sure all drivers match that no_hwmon value, right?
>>
>> Indeed, it should be the driver which decides whether or not to register
>> a HWMON interface for the thermal zone.
>>
>> I guess for now, I'll just discard this entire series and hack the data
>> structure like other drivers do, since I don't see any reasonable solution.
> 
> Pardon my ignorance, but when would a thermal driver (not) want to register
> a hwmon interface for the thermal zone?
> 

Thermal zones can also be registered from hwmon drivers, so we have a
chicken-and-egg problem.

Guenter
