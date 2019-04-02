Return-Path: <SRS0=IR8Q=SE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367F0C4360F
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Apr 2019 13:28:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF26520883
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Apr 2019 13:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7AhgdrW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731260AbfDBN2a (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Apr 2019 09:28:30 -0400
Received: from mail-pl1-f170.google.com ([209.85.214.170]:33710 "EHLO
        mail-pl1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfDBN2a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Apr 2019 09:28:30 -0400
Received: by mail-pl1-f170.google.com with SMTP id t16so4405985plo.0
        for <linux-hwmon@vger.kernel.org>; Tue, 02 Apr 2019 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WwgOSM5YqvSiuF1GKR0m5doiBeNCmQHCuRigdQjL52E=;
        b=X7AhgdrWvwqo4nFulgpyID0Hbo0N+m01E52UamHwUzf3WRi/UN6LaBy82X+bz2vXTD
         8eUAqrJr6sugDvsrtLj9amXlt6DaL4TyevSVRf+XBm2ZqQ7Wr5PU7monUa3I0GOvNf7C
         W6yU8xJDqoCcBrRohrT7/ABGtHqXKQ9Qs7/WNuHr2iHsSQWRrtYh9rW5p2BAPX0uyq3/
         +EgERJSqpozhRGM5kCp2Baac2XNGbfKneNuu5WgmlIGrdK8MWhP0vt4PMPyxpP8WhsKq
         Eghi7MQYfzDj2En4DS6h82n3TUKj7vdPNmicCG3X1DDPff6HpBSjlW5QdK3x/eLp4oA8
         uwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WwgOSM5YqvSiuF1GKR0m5doiBeNCmQHCuRigdQjL52E=;
        b=ZUzyqdt7rpAeYxhafq878ZfuxX8stUrwO4oNAvTNs85w54uYawok14JZQOqNCtX1Oz
         /FMRXZ5eJT952Q3QZUnr6wnBdaLvWApXHtEF12CQX+KmXzI5NejGWFBn93mEixymvR8J
         vyZd75a1b9WRBR+FLeyUScUCvgY5gm+2JpuKRnCNp//51RTMdHCiuiNbKPGXEoogcIsa
         hsPeeXWdtvQwNRVj+eYH5b+3jt7m49TgcxgE7KDEeO7tCTXBPoKfxh10yxi6TaCduLYf
         xa9S3jtcck2u1U1vD2Hi20P0KUzIyO//P6o6zTdrYyRSkW4+iLg013YCY3D+LJ34VsA4
         Yugw==
X-Gm-Message-State: APjAAAXfCT4MgHZgqcXoEsGxy6L9ouKADqlcKp5xtdjLS8YEKzaw9415
        a4d2vdJsrNd5BMiUMRYBgGSvxv0G
X-Google-Smtp-Source: APXvYqy/s4ktM2CmWIASqlLk9MmlQlwxwznJm3u6BzAqiMJQ+VoPGvRV4X9n7UFK0IuHMvfIzTGu8g==
X-Received: by 2002:a17:902:703:: with SMTP id 3mr36254603pli.224.1554211708619;
        Tue, 02 Apr 2019 06:28:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v20sm18768000pfn.116.2019.04.02.06.28.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Apr 2019 06:28:27 -0700 (PDT)
Subject: Re: tmp102 hwmon accessing temp1_input, max, max_hyst
To:     Vinay Simha B N <simhavcs@gmail.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <CAGWqDJ48N5Q6OsHq_f217za-34zQMDY8qNL6XEDLREPY3JP3MA@mail.gmail.com>
 <20190221175511.GA22715@roeck-us.net>
 <CAGWqDJ4pvVeTsqepodC-9g2UDjVq6NT-n3FaudXN456uwLQ00w@mail.gmail.com>
 <20190221184805.GC22715@roeck-us.net>
 <CAGWqDJ6p1yo+LJrJESCCQ-UcF8LnhPj8Tyug4Jhne_ydA2Z7GA@mail.gmail.com>
 <20190221194929.GA676@roeck-us.net>
 <CAGWqDJ40sphwJ7Dy_3jLd-_UYb+c+oSwzc05zOz5aMAca1rWbw@mail.gmail.com>
 <CAGWqDJ6__c8HyGx2HbSbJ6du8zDh3tr+nLsOuWxAny_=0RS-4A@mail.gmail.com>
 <20190227204959.GA3990@roeck-us.net>
 <CAGWqDJ4+3qHKf5BapxeDTL3LC7rm1sYygzzYL-q=KzA9QY-=6g@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ea4e1ca0-2274-b1d5-e39c-66f3d9cdf6cb@roeck-us.net>
Date:   Tue, 2 Apr 2019 06:28:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAGWqDJ4+3qHKf5BapxeDTL3LC7rm1sYygzzYL-q=KzA9QY-=6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/2/19 1:36 AM, Vinay Simha B N wrote:
> hi,
> 
> how to set - deg C for the temperature/hysteresis in device tree , i
> tried setting  hysteresis = <-8000>; , -8 deg C, but this leads to
> syntax error. please suggest.
> 
>     trips {
>                          hdmi_alert: trip0 {
>                                  temperature = <50000>;
>                                  hysteresis = <30000>;
>                                  type = "active";
>                          };
>          };
> 

In general, negative numbers must be surrounded by ().

	x = <(-15)>;

However, such values must be read with of_property_read_s32(), and the "hysteresis"
property is not read this way. Providing it with a negative number won't work.
I assume it has to be positive.

Guenter

> regards,
> vinaysimha
> 
> On Thu, Feb 28, 2019 at 2:20 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Wed, Feb 27, 2019 at 12:14:44PM +0530, Vinay Simha B N wrote:
>>> hi,
>>>
>>> the trip point of temperature and hystersis values does not get
>>> updated in hwmon/hwmon1/temp1_max_hyst and hwmon/hwmon1/temp1_max.
>>> Do we need to manually set these values, though we are attaching the
>>> tmp102 to thermal_zone? otherwise will not get the interrupt.
>>>
>>> please suggest.
>>>
>>
>> Thermal zone data/configuration does not update thermal sensor limits,
>> primarily because the thermal subsystem's notion of zones does not match
>> the typical thermal sensor hardware. Thermal sensor hardware assumes
>> that limits are set to fixed values, but the thermal subsystem assumes
>> they are freely programmable. This can cause real trouble if a thermal
>> sensor's alarm signal is directly wired to some action. It also interfers
>> with the hwmon subsystem's notion of alarms, which also assume fixed
>> limits.
>>
>> Guenter
>>
>>> On Mon, Feb 25, 2019 at 4:00 PM Vinay Simha B N <simhavcs@gmail.com> wrote:
>>>>
>>>> attached the tmp102 to thermal zone, i am able to read the
>>>> thermal_zone_get_temp, tz_dev->ops->get_trip_temp, get_trip_hyst.
>>>>
>>>> the trip point of temperature and hystersis values does not get
>>>> updated in hwmon/hwmon1/temp1_max_hyst and hwmon/hwmon1/temp1_max.
>>>> Do we need to manually set these values, though we are attaching the
>>>> tmp102 to thermal_zone? otherwise will not get the interrupt.
>>>> please suggest.
>>>>
>>>> &thermal_zones {
>>>>          hdmi-thermal {
>>>>                  polling-delay-passive = <250>;
>>>>                  polling-delay = <1000>;
>>>>
>>>>                  thermal-sensors = <&temp_sensor_u49 0>;
>>>>
>>>>                  trips {
>>>>                          hdmi_alert: trip0 {
>>>>                                  temperature = <75000>;
>>>>                                  hysteresis = <2000>;
>>>>                                  type = "passive";
>>>>                          };
>>>>                          hdmi_crit: trip1 {
>>>>                                  temperature = <95000>;
>>>>                                  hysteresis = <2000>;
>>>>                                  type = "critical";
>>>>                          };
>>>>                  };
>>>>          };
>>>> };
>>>>
>>>> On Fri, Feb 22, 2019 at 1:19 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>
>>>>> On Fri, Feb 22, 2019 at 12:32:08AM +0530, Vinay Simha B N wrote:
>>>>>> On Fri, Feb 22, 2019 at 12:18 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>>>
>>>>>>> On Thu, Feb 21, 2019 at 11:46:32PM +0530, Vinay Simha B N wrote:
>>>>>>>> guenter,
>>>>>>>>
>>>>>>>> i want to use these three  tmp102 temp1_input, max and max_hys in
>>>>>>>> dsi2hdmi(adv7533) driver to enable or disabled based on temperature
>>>>>>>> range.
>>>>>>>>
>>>>>>>> https://github.com/vinaysimha/kernel-msm/commit/8ee2b9104fa56765320d4846086d91b8271f5609
>>>>>>>>
>>>>>>>> dsi2hdmi operating temperature range is -10 to 85 deg C, we will
>>>>>>>> enable dsi2hdmi only when temperate in operating range otherwise will
>>>>>>>> disable the chip.
>>>>>>>>
>>>>>>> Do you envision a system utilizing this chip that would have an operating range
>>>>>>> outsize -10 .. +85 degrees C ? That seems to be quite unlikely.
>>>>>> this system sits in a place below this temperature range, cpu can
>>>>>> handle upto -30, but the adv7535(dsi2hdmi) operating range -10 to +85,
>>>>>> so we want the system to be on and disable and enable display based on
>>>>>> temp range.
>>>>>>>
>>>>>>> Your solution will only work for a system with exactly one tempperature sensor;
>>>>>>> otherwise there is no guarantee that the sensor will be instantiated as hwmon1
>>>>>> we do have two temperature sensor, currently i had used hwmon1 for testing,
>>>>>> i have to read hwmon1 otherwise interrupt will not get cleared.
>>>>>> thought to have polling method also, since in this code reading from
>>>>>> userspace is not feasible, is it possible to optimize, any suggestion?
>>>>>> either i need to have global variable declared in adv7511_drv.c and
>>>>>> export it to tmp102.c driver . please suggest
>>>>>
>>>>> You might want to consider attaching the tmp102 to a thermal zone, and then
>>>>> use thermal_zone_get_temp() to read the temperature.
>>>>>
>>>>>>>
>>>>>>> Either case, a decison like this would not only apply to a single chip,
>>>>>>> but to other chips in the system. It might be in the scope of power
>>>>>>> or thermal management, though it seems to me that it might make more
>>>>>>> sense to control it from user space.
>>>>>>>
>>>>>>> Overall, with the above in mind, I don't think a hwmon specific solution
>>>>>>> would make sense. If a solution is really warranted in the first place
>>>>>>> (I really wonder about that operating range), it should be implemented
>>>>>>> as generic solution which applies to the rest of the system as well.
>>>>>>>
>>>>>>> There are some pieces which should be implemented in the hwmon driver -
>>>>>>> for example, it looks like your code implements interrupt handling for
>>>>>>> the tmp102. That should be handled in the tmp102 driver, which would
>>>>>>> then read the alert bit and report the status as temp1_alarm.
>>>>>> initially i had implemented irq in tmp102.c , but how to inform this
>>>>>> information to dsi2hdmi(adv7511_drv.c)
>>>>>> any references how temp1_alarm is used.
>>>>>
>>>>> This would require some work, since the infrastructure does not currently
>>>>> support handling thermal alarms. In a nutshell,
>>>>>
>>>>> - the tmp102 driver would implement an interrupt handler
>>>>> - the interrupt handler would notify the hwmon core that an
>>>>>    interrupt was observed. This notification callback would have
>>>>>    to be implemented. It would notify userspace using sysfs_notify()
>>>>>    and possibly with a udev event, and it would notify the thermal
>>>>>    core by calling thermal_zone_device_update(). I don't know how
>>>>>    the thermal core would then notify the dsi2hdmi driver.
>>>>>
>>>>> Guenter
>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Guenter
>>>>>>>
>>>>>>>>
>>>>>>>> On Thu, Feb 21, 2019 at 11:25 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>>>>>
>>>>>>>>> On Thu, Feb 21, 2019 at 08:21:09PM +0530, Vinay Simha B N wrote:
>>>>>>>>>> hi,
>>>>>>>>>>
>>>>>>>>>> could you please suggest, how to export_symbol the tmp102 temp1_input, max
>>>>>>>>>> and max_hyst values to another kernel driver?
>>>>>>>>>>
>>>>>>>>>> We can acess the values
>>>>>>>>>> from filp_open("/sys/class/hwmon/hwmon1/temp1_input", O_RDONLY, 0); in
>>>>>>>>>> kernel space, but is there better apporach to access the values in the
>>>>>>>>>> kernel space.
>>>>>>>>>>
>>>>>>>>> There is no in-kernel API to do that, and I do not immediately see
>>>>>>>>> the purpose. Either case, accessing the sysfs attribute directly is
>>>>>>>>> as wrong as it can get, if for nothing else since there is no guarantee
>>>>>>>>> that this will always be the hwmon1 device.
>>>>>>>>>
>>>>>>>>> Can you explain what you are trying to do ?
>>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Guenter
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> --
>>>>>>>> regards,
>>>>>>>> vinaysimha
>>>>>>
>>>>>>
>>>>>>
>>>>>> --
>>>>>> regards,
>>>>>> vinaysimha
>>>>
>>>>
>>>>
>>>> --
>>>> regards,
>>>> vinaysimha
>>>
>>>
>>>
>>> --
>>> regards,
>>> vinaysimha
> 
> 
> 

