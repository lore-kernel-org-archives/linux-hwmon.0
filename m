Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751130AbdJBOaq (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 2 Oct 2017 10:30:46 -0400
MIME-Version: 1.0
In-Reply-To: <20171001141301.GA31794@roeck-us.net>
References: <20170911191649.3344-2-atull@kernel.org> <20171001141301.GA31794@roeck-us.net>
From: Alan Tull <atull@kernel.org>
Date: Mon, 2 Oct 2017 09:30:04 -0500
Message-ID: <CANk1AXQWnmdZADNasZiKJwNtLS0C2yGQbvxitgg-5uKWREZ_dw@mail.gmail.com>
Subject: Re: [2/2] hwmon: add dt binding for max1619
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux HWMON List <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Oct 1, 2017 at 9:13 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Mon, Sep 11, 2017 at 02:16:49PM -0500, Alan Tull wrote:
>> Add new device tree binding for max1619.
>>
>> Signed-off-by: Alan Tull <atull@kernel.org>
>> Cc: Jean Delvare <jdelvare@suse.com>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>
> Applied to hwmon-next.

Thanks!
Alan

>
> Thanks,
> Guenter
>
>> ---
>>  drivers/hwmon/max1619.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
>> index a182789..76d9669 100644
>> --- a/drivers/hwmon/max1619.c
>> +++ b/drivers/hwmon/max1619.c
>> @@ -303,10 +303,20 @@ static const struct i2c_device_id max1619_id[] = {
>>  };
>>  MODULE_DEVICE_TABLE(i2c, max1619_id);
>>
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id max1619_of_match[] = {
>> +     { .compatible = "maxim,max1619", },
>> +     {},
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, max1619_of_match);
>> +#endif
>> +
>>  static struct i2c_driver max1619_driver = {
>>       .class          = I2C_CLASS_HWMON,
>>       .driver = {
>>               .name   = "max1619",
>> +             .of_match_table = of_match_ptr(max1619_of_match),
>>       },
>>       .probe          = max1619_probe,
>>       .id_table       = max1619_id,
