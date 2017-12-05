Return-Path: <linus.walleij@linaro.org>
Return-path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20171204235205.GA3396@roeck-us.net>
References: <20171204222029.11956-1-linus.walleij@linaro.org> <20171204235205.GA3396@roeck-us.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Dec 2017 09:31:36 +0100
Message-ID: <CACRpkdb9kY1zHnY0cXXpJ4PA=5V8Xr2AoHmy=HrfMgpJD55h3A@mail.gmail.com>
Subject: Re: [PATCH] hwmon: Deal with errors from the thermal subsystem
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Dec 5, 2017 at 12:52 AM, Guenter Roeck <linux@roeck-us.net> wrote:

>> -     devm_thermal_zone_of_sensor_register(&hwdev->dev, index, tdata,
>> -                                          &hwmon_thermal_ops);
>> +     tzd = devm_thermal_zone_of_sensor_register(&hwdev->dev, index, tdata,
>> +                                                &hwmon_thermal_ops);
>> +     if (IS_ERR(tzd))
>> +             return PTR_ERR(tzd);
>
> This won't work because devm_thermal_zone_of_sensor_register() returns
> -ENODEV if CONFIG_THERMAL_OF is disabled. We'll have to check for
> -EPROBE_DEFER and only return this specific error, but ignore all others.

Sounds more like we should ignore -ENODEV and respect all other
errors? It will be more robust if some code changes and some
new error code appears again.

I will cook a patch like so.

Yours,
Linus Walleij
