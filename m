Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:48987 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750820AbdJHXMa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 8 Oct 2017 19:12:30 -0400
Received: by mail-io0-f172.google.com with SMTP id j17so4714635iod.5
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Oct 2017 16:12:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171008162003.GA28043@roeck-us.net>
References: <20170925230911.20824-10-linus.walleij@linaro.org> <20171008162003.GA28043@roeck-us.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Oct 2017 01:12:28 +0200
Message-ID: <CACRpkdb5cU=dZEv-yUWU2=NCrRVM6VR_Ws8EsEi02XVZtn4T9w@mail.gmail.com>
Subject: Re: [9/9] hwmon: gpio-fan: Convert to use GPIO descriptors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Jamie Lentin <jm@lentin.co.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Oct 8, 2017 at 6:20 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Tue, Sep 26, 2017 at 01:09:11AM +0200, Linus Walleij wrote:

>>  static int fan_alarm_init(struct gpio_fan_data *fan_data)
>>  {
>> -     int err;
>>       int alarm_irq;
>>       struct device *dev = fan_data->dev;
>>
>> -     err = devm_gpio_request(dev, fan_data->alarm_gpio, "GPIO fan alarm");
>> -     if (err)
>> -             return err;
>> -
>> -     err = gpio_direction_input(fan_data->alarm_gpio);
>> -     if (err)
>> -             return err;
>> -
> Followup question: I assume this is no longer necessary because the pin
> is used as interrupt pin ?

It is not longer necessary because it is requested as input in probe():

    /* Alarm GPIO if one exists */
    fan_data->alarm_gpio = devm_gpiod_get_optional(dev, "alarm", GPIOD_IN);
    if (IS_ERR(fan_data->alarm_gpio))
        return PTR_ERR(fan_data->alarm_gpio);

GPIOD_IN takes care of setting the line as input.

> If so, what if it can not be used as interrupt pin (ie gpiod_to_irq()
> fails) ?

It now looks like this:

    /*
     * If the alarm GPIO don't support interrupts, just leave
     * without initializing the fail notification support.
     */
    alarm_irq = gpiod_to_irq(fan_data->alarm_gpio);
    if (alarm_irq < 0)
        return 0;

That should be <= 0 since 0 is not a legal IRQ number though so
fixing that too. (And hoping noone is using the illegal 0 irq anymore.)
It was essentially the same before though.

Yours,
Linus Walleij
