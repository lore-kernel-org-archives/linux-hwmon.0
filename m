Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD217C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Nov 2022 08:15:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbiK1IPw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Nov 2022 03:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbiK1IPt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Nov 2022 03:15:49 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B500167EE
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Nov 2022 00:15:46 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-142b72a728fso12094554fac.9
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Nov 2022 00:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQ9oe161GuzlyQd6Dr6L0N0KUFc0WQFGhH+/v9gtWhE=;
        b=dS0jGtfTrg8Arlgyee+L2Gg5FknWSzQ5V/MZRYCJ9Kk6INqWU7SIkpDGDWpdZBJeBp
         cJFfzVAgVcoYAPESEPgvBdcmDjeN4TPa6TlGJWU0eW8pm6l8h+hZzweRO/0ev2tQl/ZA
         MLjy2J2daMzrD5YLtuBnSQeexoKNaCkc1VuhH6/zIALLuhBHTuvYt8kscpCAGOh/vCuW
         He3b16LZD8Fz2QtWsfHz9a67dGiYL9bFMOFethvakzmyAW7jnT+KZHOZd7QuOYDFHdut
         NpfGXJp7qdhYz2o6TrLE8h9Kc5X7MTlyTy1TN/d4PBkbYxlogxQPOhqCgFtTxwMvvR9V
         GBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQ9oe161GuzlyQd6Dr6L0N0KUFc0WQFGhH+/v9gtWhE=;
        b=qtJ/pHgaWvt6EcSoPYpAJurs+RxtnsdSvj6wO+2/HKQJMAzONoYjVBVelUmk8enp/4
         0GTaEVqpD+TphTtgjtCAsOi2eAvXkUBi/k0ghOzJOCe5GausltyqSW9la97swU4b4I+k
         tenGCTF5FyOiGBhnMndNnnJ189UWrMSqzot9bXmp0CvKwbS9GgP/PO2tEsRvMVW4p4BF
         t7Mba0kAlC4YlsyvnBsSWoyoALVhxw1GwcaEyQB7hlCAVJRPJItpO9U4rFZrP3fEFkBr
         MspyCk8M1y/skOHV/Zspqmg1onnokdB66VVKxCwuXjYjsa0sJo/nAGGljkAL4Ipdxc3s
         viSg==
X-Gm-Message-State: ANoB5pkuQfE1xCXV/V+Hhj0zMI0T/3P+rt0iLkPw07nqSHY/rMWPx6sB
        BMi4cv0xkfjWGDi3W/mzXQM=
X-Google-Smtp-Source: AA0mqf4FEkmKeO7slYyndg0D9hbWtdyg1vO+cejDkx21eKM4xg4IiY+c7trkYR+l0msTr0gDafvt/A==
X-Received: by 2002:a05:6871:4095:b0:143:c0be:ee72 with SMTP id kz21-20020a056871409500b00143c0beee72mr954308oab.99.1669623345488;
        Mon, 28 Nov 2022 00:15:45 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k9-20020a4a4309000000b004956ee06cadsm4085906ooj.43.2022.11.28.00.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 00:15:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <59af69f2-6f07-3eed-434e-8691340774bc@roeck-us.net>
Date:   Mon, 28 Nov 2022 00:15:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     Saravanan Sekar <saravanan@linumiz.com>, jdelvare@suse.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org
References: <20221126171711.1078309-1-saravanan@linumiz.com>
 <20221126171711.1078309-2-saravanan@linumiz.com>
 <ec33655d-4070-4107-4c5c-f798ebe56b73@roeck-us.net>
 <4819f317-a6dd-dd8a-4800-06b82be4f995@linumiz.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 2/3] hwmon: (pmbus/mpq7932) Add a support for mpq7932
 Power Management IC
In-Reply-To: <4819f317-a6dd-dd8a-4800-06b82be4f995@linumiz.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/27/22 22:35, Saravanan Sekar wrote:
> On 26/11/22 18:50, Guenter Roeck wrote:
>> On 11/26/22 09:17, Saravanan Sekar wrote:
>>> The MPQ7932 is a power management IC designed to operate from 5V buses to
>>> power a variety of ADAS SOCs. Six integrated buck converters power a
>>> variety of target rails configurable over PMBus interface.
>>>
>>> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
>>
> Hello Guenter,
> 
> Thanks for your time to review.
> 
>> I find no reference to this chip anywhere. Can you provide one ?
>>
> 
> I have Preliminary specification under NDA, checking with manufactures upload in public accessibility.
> 
>> Also, please refrain from cryptic abbreviations. You may know what
>> ADAS means, but I have no idea.
>>
> Sure
>>> ---
>>>   drivers/hwmon/pmbus/Kconfig   |   9 ++
>>>   drivers/hwmon/pmbus/Makefile  |   1 +
>>>   drivers/hwmon/pmbus/mpq7932.c | 150 ++++++++++++++++++++++++++++++++++
>>>   3 files changed, 160 insertions(+)
>>>   create mode 100644 drivers/hwmon/pmbus/mpq7932.c
>>>
>>> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
>>> index 89668af67206..5e938768bd77 100644
>>> --- a/drivers/hwmon/pmbus/Kconfig
>>> +++ b/drivers/hwmon/pmbus/Kconfig
>>> @@ -317,6 +317,15 @@ config SENSORS_MP5023
>>>         This driver can also be built as a module. If so, the module will
>>>         be called mp5023.
>>> +config SENSORS_MPQ7932_REGULATOR
>>
>> Drop "_REGULATOR".
>>
>>> +    tristate "MPS MPQ7932 buck regulator"
>>> +    help
>>> +      If you say yes here you get six integrated buck converter
>>> +      regulator support for power management IC MPS MPQ7932.
>>> +
>>
>> This primarily adds hardware monitoring support. Referring to it
>> only as regulator is misleading. Please also refer to hardware
>> monitoring functionality. More on that below.
>>
> 
> okay
> 
>>> +      This driver can also be built as a module. If so, the module will
>>> +      be called mpq7932.
>>> +
>>>   config SENSORS_PIM4328
>>>       tristate "Flex PIM4328 and compatibles"
>>>       help
>>> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
>>> index 0002dbe22d52..28a534629cc3 100644
>>> --- a/drivers/hwmon/pmbus/Makefile
>>> +++ b/drivers/hwmon/pmbus/Makefile
>>> @@ -34,6 +34,7 @@ obj-$(CONFIG_SENSORS_MAX8688)    += max8688.o
>>>   obj-$(CONFIG_SENSORS_MP2888)    += mp2888.o
>>>   obj-$(CONFIG_SENSORS_MP2975)    += mp2975.o
>>>   obj-$(CONFIG_SENSORS_MP5023)    += mp5023.o
>>> +obj-$(CONFIG_SENSORS_MPQ7932_REGULATOR) += mpq7932.o
>>>   obj-$(CONFIG_SENSORS_PLI1209BC)    += pli1209bc.o
>>>   obj-$(CONFIG_SENSORS_PM6764TR)    += pm6764tr.o
>>>   obj-$(CONFIG_SENSORS_PXE1610)    += pxe1610.o
>>> diff --git a/drivers/hwmon/pmbus/mpq7932.c b/drivers/hwmon/pmbus/mpq7932.c
>>> new file mode 100644
>>> index 000000000000..23d3ccdaed1e
>>> --- /dev/null
>>> +++ b/drivers/hwmon/pmbus/mpq7932.c
>>> @@ -0,0 +1,150 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +//
>>> +// mpq7932.c  - regulator driver for mps mpq7932
>>> +//
>>> +// Copyright 2022 Monolithic Power Systems, Inc
>>> +//
>>> +// Author: Saravanan Sekar <saravanan@linumiz.com>
>>> +
>>
>> No C++ comments in hwmon subsystem, please, unless mandated.
> 
> okay
>>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/init.h>
>>> +#include <linux/err.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/pmbus.h>
>>> +#include <linux/i2c.h>
>>
>> Alphabetic include file order, please.
>>
> 
> okay
>>> +#include "pmbus.h"
>>> +
>>> +#define MPQ7932_BUCK_UV_MIN        206250
>>> +#define MPQ7932_UV_STEP            6250
>>> +#define MPQ7932_N_VOLTAGES        0xFF
>>> +#define MPQ7932_NUM_PAGES        6
>>> +
>>> +#define MPQ7932_TON_DELAY        0x60
>>> +#define MPQ7932_VOUT_STARTUP_SLEW    0xA3
>>> +#define MPQ7932_VOUT_SHUTDOWN_SLEW    0xA5
>>> +#define MPQ7932_VOUT_SLEW_MASK        GENMASK(1, 0)
>>> +#define MPQ7932_TON_DELAY_MASK        GENMASK(4, 0)
>>> +
>>> +#define MPQ7932BUCK(_id)                    \
>>> +    [_id] = {                        \
>>> +        .id = _id,                    \
>>> +        .name = ("buck" # _id),                \
>>> +        .of_match = of_match_ptr("buck" # _id),        \
>>> +        .regulators_node = "regulators",        \
>>> +        .ops = &pmbus_regulator_ops,            \
>>> +        .type = REGULATOR_VOLTAGE,            \
>>> +        .min_uV = MPQ7932_BUCK_UV_MIN,            \
>>> +        .uV_step = MPQ7932_UV_STEP,            \
>>> +        .n_voltages = MPQ7932_N_VOLTAGES,        \
>>> +    }
>>
>> Why not use PMBUS_REGULATOR_STEP ?
> 
> MPQ7932 chip supports ramp delay and softstart which is not covered
> by PMBUS_REGULATOR_STEP, I have incremental patch to address which
> requires API's in pmbus_regulator_ops to be exported so chip driver
> can extend/modifiy with reuse of pmbus_regulator api. Plan is to submit 1st set of minimal driver and create RFC.
> 
> I can replace PMBUS_REGULATOR_STEP for this series.
> 

The only difference is that the above also sets min_uV.
I'd rather have that added to PMBUS_REGULATOR_STEP instead
of adding more macros.

As for min_uV, is that really needed ? None of the other regulators
seemed to need it.

>> >> +
>>> +struct mpq7932_data {
>>> +    struct pmbus_driver_info info;
>>> +    struct pmbus_platform_data pdata;
>>> +};
>>> +
>>> +static struct regulator_desc mpq7932_regulators_desc[] = {
>>> +    MPQ7932BUCK(0),
>>> +    MPQ7932BUCK(1),
>>> +    MPQ7932BUCK(2),
>>> +    MPQ7932BUCK(3),
>>> +    MPQ7932BUCK(4),
>>> +    MPQ7932BUCK(5),
>>> +};
>>> +
>>> +static int mpq7932_write_word_data(struct i2c_client *client, int page, int reg,
>>> +                   u16 word)
>>> +{
>>> +
>>> +    switch (reg) {
>>> +    case PMBUS_VOUT_COMMAND:
>>> +        return pmbus_write_byte_data(client, page, reg, (u8)word);
>>> +
>>
>> This needs explanation. VOUT_COMMAND directly sets a voltage, and the provided
>> value is in ULINEAR16 format. Just using its lower 8 bits seems, at the very
>> least, odd.
>>
> 
> Indeed, unfortunately word_write results -EREMOTEIO and got clarified with manufacture chip support only byte write except STATUS_WORD :(
> 
Question then is what this byte contains. What if an attempt is made
to write a value > 0xff ? Writing 0x00 instead of 0x100 can only result
in severe trouble.

>>> +    default:
>>> +        return -ENODATA;
>>> +    }
>>> +}
>>> +
>>> +static int mpq7932_read_word_data(struct i2c_client *client, int page,
>>> +                  int phase, int reg)
>>> +{
>>> +
>>> +    switch (reg) {
>>> +    case PMBUS_MFR_VOUT_MIN:
>>> +        return 0;
>>> +
>>> +    case PMBUS_MFR_VOUT_MAX:
>>> +        return MPQ7932_N_VOLTAGES;
>>> +
>>
>> This is not how this is intended to work. If the chip does not provide
>> those properties, they should not be faked.
>>
> 
> Unfortunately, chip support neither
> 
>        PMBUS_VOUT_MARGIN_HIGH          = 0x25,
>        PMBUS_VOUT_MARGIN_LOW           = 0x26,
> 
> nor
> 
>        PMBUS_MFR_VOUT_MIN              = 0xA4,
>        PMBUS_MFR_VOUT_MAX              = 0xA5
> 
> 
> as a result set voltage fails due to error in pmbus_regulator_get_low_margin. I can understand these absolute workaround, please suggest alternatives
> 

Good point. I'd accept that with explanation, but PMBUS_MFR_VOUT_MAX
is a maximum voltage, not the number of voltages. And is 0 for
the minimum voltage really correct ? It seems to contradict
MPQ7932_BUCK_UV_MIN.

>>> +    case PMBUS_READ_VOUT:
>>> +        return pmbus_read_byte_data(client, page, PMBUS_VOUT_COMMAND);
>>> +
>>> +    default:
>>> +        return -ENODATA;
>>> +    }
>>> +}
>>> +
>>> +static int mpq7932_probe(struct i2c_client *client)
>>> +{
>>> +    struct mpq7932_data *data;
>>> +    struct pmbus_driver_info *info;
>>> +    struct device *dev = &client->dev;
>>> +    int i;
>>> +
>>> +    if (!i2c_check_functionality(client->adapter,
>>> +                     I2C_FUNC_SMBUS_READ_WORD_DATA))
>>> +        return -ENODEV;
>>> +
>>> +    data = devm_kzalloc(&client->dev, sizeof(struct mpq7932_data),
>>> +                GFP_KERNEL);
>>> +    if (!data)
>>> +        return -ENOMEM;
>>> +
>>> +    info = &data->info;
>>> +    info->pages = MPQ7932_NUM_PAGES;
>>> +    info->num_regulators = ARRAY_SIZE(mpq7932_regulators_desc);
>>> +    info->reg_desc = mpq7932_regulators_desc;
>>> +    info->format[PSC_VOLTAGE_OUT] = direct;
>>> +    info->m[PSC_VOLTAGE_OUT] = 160;
>>> +    info->b[PSC_VOLTAGE_OUT] = -33;
>>> +    for (i = 0; i < info->pages; i++) {
>>> +        info->func[i] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
>>> +                | PMBUS_HAVE_STATUS_TEMP;
>>> +    }
>>> +
>>
>> Is that really all the chip supports ? No input data, no current
>> or power measurements ?
>>
>> Is this even a real PMBus chip, or a fake one which claims to support
>> PMBus but in reality doesn't ?
> 
> I would say this is PMIC buck regulator chip over PMBUS, I guess the regulator support in pmbus shall be used without hardware monitor support (though chip support temperature, error status, cml, status)
> 
> 
>>
>>> +    info->read_word_data = mpq7932_read_word_data;
>>> +    info->write_word_data = mpq7932_write_word_data;
>>> +
>>> +    data->pdata.flags = PMBUS_NO_CAPABILITY;
>>> +    dev->platform_data = &data->pdata;
>>> +
>>> +    return pmbus_do_probe(client, info);
>>> +}
>>> +
>>> +static const struct of_device_id mpq7932_of_match[] = {
>>> +    { .compatible = "mps,mpq7932"},
>>> +    {},
>>> +};
>>> +MODULE_DEVICE_TABLE(of, mpq7932_of_match);
>>> +
>>> +static const struct i2c_device_id mpq7932_id[] = {
>>> +    { "mpq7932", },
>>> +    { },
>>> +};
>>> +MODULE_DEVICE_TABLE(i2c, mpq7932_id);
>>> +
>>> +static struct i2c_driver mpq7932_regulator_driver = {
>>
>> PMBus drivers are not primarily regulator drivers. They
>> are hardware monitoring drivers. It is difficult for me to
>> determine, due to lack of information about this chip,
>> what it actually supports. If the chip is really a regulator
>> masquerading as PMBus chip, you might want to consider writing
>> a regulator driver for it.
>>
> 
> I try to share datasheet once I got permission from manufacturer.
> Sure, I consider to write regulator driver over pmbus (addnl helper support on regulator subsystem like regmap) if we conclude should not be part of hwmon.
> 

Depends on you. Do you want a hwmon driver with regulator support,
or a regulator driver ? We can't have a regulator driver in
the hwmon subsystem.

Guenter

