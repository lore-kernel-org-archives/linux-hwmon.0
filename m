Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:48706 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751391AbdJHXF6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 8 Oct 2017 19:05:58 -0400
Received: by mail-io0-f173.google.com with SMTP id j17so4708877iod.5
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Oct 2017 16:05:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171008143927.GA8671@roeck-us.net>
References: <20170925230911.20824-10-linus.walleij@linaro.org> <20171008143927.GA8671@roeck-us.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Oct 2017 01:05:56 +0200
Message-ID: <CACRpkdbp6Eaw+CwJz9-8BLnnz-nAGuuXr_pkLecGjh_2nzZnAA@mail.gmail.com>
Subject: Re: [9/9] hwmon: gpio-fan: Convert to use GPIO descriptors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Jamie Lentin <jm@lentin.co.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Oct 8, 2017 at 4:39 PM, Guenter Roeck <linux@roeck-us.net> wrote:

>> @@ -86,9 +84,9 @@ static ssize_t fan1_alarm_show(struct device *dev,
>>                              struct device_attribute *attr, char *buf)
>>  {
>>       struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
>> -     int value = gpio_get_value_cansleep(fan_data->alarm_gpio);
>> +     int value = gpiod_get_value_cansleep(fan_data->alarm_gpio);
>>
>> -     if (fan_data->alarm_gpio_active_low)
>> +     if (gpiod_is_active_low(fan_data->alarm_gpio))
>
> Is this still needed ? Just wondering - I would have thought that
> gpiod_get_value_cansleep() does the conversion.

My bad. Fixing in V2, sending it soon.

Yours,
Linus Walleij
