Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:38700 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752865AbdLELEg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Dec 2017 06:04:36 -0500
Received: by mail-pg0-f66.google.com with SMTP id f12so10445100pgo.5
        for <linux-hwmon@vger.kernel.org>; Tue, 05 Dec 2017 03:04:36 -0800 (PST)
Subject: Re: [PATCH] hwmon: Deal with errors from the thermal subsystem
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20171204222029.11956-1-linus.walleij@linaro.org>
 <20171204235205.GA3396@roeck-us.net>
 <CACRpkdb9kY1zHnY0cXXpJ4PA=5V8Xr2AoHmy=HrfMgpJD55h3A@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <7e6845fe-b21f-f978-2c2f-894c019b9e38@roeck-us.net>
Date: Tue, 5 Dec 2017 03:04:33 -0800
MIME-Version: 1.0
In-Reply-To: <CACRpkdb9kY1zHnY0cXXpJ4PA=5V8Xr2AoHmy=HrfMgpJD55h3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/05/2017 12:31 AM, Linus Walleij wrote:
> On Tue, Dec 5, 2017 at 12:52 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> 
>>> -     devm_thermal_zone_of_sensor_register(&hwdev->dev, index, tdata,
>>> -                                          &hwmon_thermal_ops);
>>> +     tzd = devm_thermal_zone_of_sensor_register(&hwdev->dev, index, tdata,
>>> +                                                &hwmon_thermal_ops);
>>> +     if (IS_ERR(tzd))
>>> +             return PTR_ERR(tzd);
>>
>> This won't work because devm_thermal_zone_of_sensor_register() returns
>> -ENODEV if CONFIG_THERMAL_OF is disabled. We'll have to check for
>> -EPROBE_DEFER and only return this specific error, but ignore all others.
> 
> Sounds more like we should ignore -ENODEV and respect all other
> errors? It will be more robust if some code changes and some
> new error code appears again.
> 

Agreed, makes sense.

Guenter

> I will cook a patch like so.
> 
> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

