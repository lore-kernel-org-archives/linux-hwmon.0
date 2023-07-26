Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196D4C001B0
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Jul 2023 12:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbjGZMW4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Jul 2023 08:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjGZMWz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jul 2023 08:22:55 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57505100
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Jul 2023 05:22:54 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-686e0213c0bso235434b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Jul 2023 05:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690374174; x=1690978974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nn8DCO7g1eZCn249KiB+jhWf8x4kwfg8K3tJq8yEXmE=;
        b=d+R5o5vnmYkW6Q/Sj8wmdp2zicwwFbAEeygMUvQULY9My6S7pasnKLFJxGVMg3D2q8
         OzrYEemHqADRcE8rHuGTRkaiPEjheanzMmxdGnTTDrzQUjKzuvbkqxnsZ8CbQK98pZgY
         fTs4G1HOwqS76qi/9XtocqJzZXo2RbBVHxdrXQQoVFeU8Ik8Hvy0FqMf/rdZyn5VF4Km
         67lX1zbK7+iwpRrGB4QDqOqsgiNkMaBzLO57aeE7qVdqiTAn6ANVOCtwejR76HcO23Gt
         EIg/5BBe+K3FGhflWfbzNHGYLgCXYhINFlP7GB3bBabrHucOUGsuKCbaPBCM/gZ7NbOR
         15vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690374174; x=1690978974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nn8DCO7g1eZCn249KiB+jhWf8x4kwfg8K3tJq8yEXmE=;
        b=DPuwZX0XDnHAG2QI1a2GyKPEDa0wQFYff1solPlNXVwWVZ3ihcrctylMdpkj2uaBNu
         82NDpzXNzKbCuaf5Q97UCXBZrMKWj68xME6NMVElv78y+ZMwwblaZn5q+kFGSxokeXmA
         okxhS0roN4idDeYXNJWVwVnKWtOmNRPulLhyy6VZocKLNFkKbWpQRvy9npE3ZWQr0YZG
         8/yIR8W6u61fNntVCp/FaExI0KqkrVyPm6GapZgCJXIGtKTcaY3Bxr/+G3qNPJdbiz7B
         RK/tY1xtmCYo1jF+X4nG4SReNZ2AiZsNDDlL/Ik/IBgBuhgS6z2AR9Q4KcLcO/iwEadL
         LkEA==
X-Gm-Message-State: ABy/qLYo+bFNVcu67nb8kzDRdcCvxbAed8g1m7uYB7hpVgQHhqkqYiC6
        8QJuBFTvNdv6wqzajqUw4s6ooQ==
X-Google-Smtp-Source: APBJJlFxJ8w4bPLq3LuBOPVoX5ZVkj3KBFf92dEVRGNqwu0o2oedMzufW7dmoHEPY/g4SokfmdU/Uw==
X-Received: by 2002:a05:6a20:3ca3:b0:132:1e76:6f02 with SMTP id b35-20020a056a203ca300b001321e766f02mr1843152pzj.34.1690374173784;
        Wed, 26 Jul 2023 05:22:53 -0700 (PDT)
Received: from ?IPV6:2405:201:d02f:d855:461d:14be:2cce:b776? ([2405:201:d02f:d855:461d:14be:2cce:b776])
        by smtp.gmail.com with ESMTPSA id b26-20020a63a11a000000b00563962dbc70sm8933780pgf.58.2023.07.26.05.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 05:22:53 -0700 (PDT)
Message-ID: <331889b5-caf7-ab68-fea2-6566e550d7e8@9elements.com>
Date:   Wed, 26 Jul 2023 17:52:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] hwmon: (pmbus/tda38640) Add workaround for bug in
 SVID mode
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org
References: <20230725114030.1860571-1-Naresh.Solanki@9elements.com>
 <20230725114030.1860571-3-Naresh.Solanki@9elements.com>
 <46f3f44b-5c25-8193-70b5-59303be04ad0@roeck-us.net>
Content-Language: en-US
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <46f3f44b-5c25-8193-70b5-59303be04ad0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On 25-07-2023 07:51 pm, Guenter Roeck wrote:
> On 7/25/23 04:40, Naresh Solanki wrote:
>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>
>> The TDA38640 supports two operating modes to set the output voltage:
>> - PMBUS
>> - SVID
>>
>> Due to an undocumented bug the regulator cannot be enabled using BIT7
>> of OPERATION(01h) register when in SVID mode.
>> It works when in PMBUS mode. In SVID mode the regulator only cares
>> about the ENABLE pin.
>>
>> Add a workaround that needs the ENABLE pin to be left floating or
>> tied to a fixed level. The DT must contain the newly introduced
>> property 'infineon,en-pin-fixed-level' to enable this workaround.
>>
> 
> Why is that property even needed ? Isn't the workaround always (and only)
> required if the chip is in SVID mode ?
Will add below function to detect SVID mode.
static bool svid_mode(struct i2c_client *client)
{
	/* PMBUS_MFR_READ(0xD0) + Address */
	u8 write_buf[] = {0xd0, 0x44, 0x00};
	u8 read_buf[2];
	int ret;

	struct i2c_msg msgs[2] = {
		{
			.addr = client->addr,
			.flags = 0,
			.buf = write_buf,
			.len = sizeof(write_buf),
		},
		{
			.addr = client->addr,
			.flags = I2C_M_RD,
			.buf = read_buf,
			.len = sizeof(read_buf),
		}
	};

	ret = i2c_transfer(client->adapter, msgs, 2);

	if (ret < 0) {
		dev_err(&client->dev, "%s:%d i2c_transfer failed. %d", __func__, 
__LINE__, ret);
		return ret;
	}
	/* 0x44[15] determines PMBus Operating Mode */
	return !!(read_buf[1] & BIT(7));
}

Based on svid_mode will init accordingly:
	if (!IS_ENABLED(CONFIG_SENSORS_TDA38640_REGULATOR) || !np || 
!svid_mode(client))
		return pmbus_do_probe(client, &data->info);

	dev_dbg(&client->dev, "SVID mode");

Regards,
Naresh
> 
> Guenter
> 
>> The workaround will map the PB_OPERATION_CONTROL_ON bit to the
>> PB_ON_OFF_CONFIG_EN_PIN_REQ bit of the ON_OFF_CONFIG register.
>> In combination with the fixed level on the ENABLE pin the regulator
>> can be controlled as expected.
>>
>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>> ---
>>   drivers/hwmon/pmbus/tda38640.c | 95 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 93 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/tda38640.c 
>> b/drivers/hwmon/pmbus/tda38640.c
>> index 450b0273fb59..9d3b89d9845c 100644
>> --- a/drivers/hwmon/pmbus/tda38640.c
>> +++ b/drivers/hwmon/pmbus/tda38640.c
>> @@ -18,6 +18,72 @@ static const struct regulator_desc __maybe_unused 
>> tda38640_reg_desc[] = {
>>       PMBUS_REGULATOR("vout", 0),
>>   };
>> +struct tda38640_data {
>> +    struct pmbus_driver_info info;
>> +    u32 en_pin_lvl;
>> +};
>> +
>> +#define to_tda38640_data(x)  container_of(x, struct tda38640_data, info)
>> +
>> +/*
>> + * Map PB_ON_OFF_CONFIG_POLARITY_HIGH to PB_OPERATION_CONTROL_ON.
>> + */
>> +static int tda38640_read_byte_data(struct i2c_client *client, int 
>> page, int reg)
>> +{
>> +    const struct pmbus_driver_info *info = 
>> pmbus_get_driver_info(client);
>> +    struct tda38640_data *data = to_tda38640_data(info);
>> +    int ret, on_off_config, enabled;
>> +
>> +    if (reg != PMBUS_OPERATION)
>> +        return -ENODATA;
>> +
>> +    ret = pmbus_read_byte_data(client, page, reg);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    on_off_config = pmbus_read_byte_data(client, page,
>> +                         PMBUS_ON_OFF_CONFIG);
>> +    if (on_off_config < 0)
>> +        return on_off_config;
>> +
>> +    enabled = !!(on_off_config & PB_ON_OFF_CONFIG_POLARITY_HIGH);
>> +
>> +    enabled ^= data->en_pin_lvl;
>> +    if (enabled)
>> +        ret &= ~PB_OPERATION_CONTROL_ON;
>> +    else
>> +        ret |= PB_OPERATION_CONTROL_ON;
>> +
>> +    return ret;
>> +}
>> +
>> +/*
>> + * Map PB_OPERATION_CONTROL_ON to PB_ON_OFF_CONFIG_POLARITY_HIGH.
>> + */
>> +static int tda38640_write_byte_data(struct i2c_client *client, int page,
>> +                    int reg, u8 byte)
>> +{
>> +    const struct pmbus_driver_info *info = 
>> pmbus_get_driver_info(client);
>> +    struct tda38640_data *data = to_tda38640_data(info);
>> +    int enable, ret;
>> +
>> +    if (reg != PMBUS_OPERATION)
>> +        return -ENODATA;
>> +
>> +    enable = !!(byte & PB_OPERATION_CONTROL_ON);
>> +
>> +    byte &= ~PB_OPERATION_CONTROL_ON;
>> +    ret = pmbus_write_byte_data(client, page, reg, byte);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    enable ^= data->en_pin_lvl;
>> +
>> +    return pmbus_update_byte_data(client, page, PMBUS_ON_OFF_CONFIG,
>> +                      PB_ON_OFF_CONFIG_POLARITY_HIGH,
>> +                      enable ? 0 : PB_ON_OFF_CONFIG_POLARITY_HIGH);
>> +}
>> +
>>   static struct pmbus_driver_info tda38640_info = {
>>       .pages = 1,
>>       .format[PSC_VOLTAGE_IN] = linear,
>> @@ -26,7 +92,6 @@ static struct pmbus_driver_info tda38640_info = {
>>       .format[PSC_CURRENT_IN] = linear,
>>       .format[PSC_POWER] = linear,
>>       .format[PSC_TEMPERATURE] = linear,
>> -
>>       .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
>>           | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
>>           | PMBUS_HAVE_IIN
>> @@ -41,7 +106,33 @@ static struct pmbus_driver_info tda38640_info = {
>>   static int tda38640_probe(struct i2c_client *client)
>>   {
>> -    return pmbus_do_probe(client, &tda38640_info);
>> +    struct device *dev = &client->dev;
>> +    struct device_node *np = dev_of_node(dev);
>> +    struct tda38640_data *data;
>> +
>> +    data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +    if (!data)
>> +        return -ENOMEM;
>> +    memcpy(&data->info, &tda38640_info, sizeof(tda38640_info));
>> +
>> +    if (!CONFIG_SENSORS_TDA38640_REGULATOR || !np ||
>> +        of_property_read_u32(np, "infineon,en-pin-fixed-level", 
>> &data->en_pin_lvl))
>> +        return pmbus_do_probe(client, &data->info);
>> +
>> +    /*
>> +     * Apply ON_OFF_CONFIG workaround as enabling the regulator using 
>> the
>> +     * OPERATION register doesn't work in SVID mode.
>> +     */
>> +    data->info.read_byte_data = tda38640_read_byte_data;
>> +    data->info.write_byte_data = tda38640_write_byte_data;
>> +    /*
>> +     * One should configure PMBUS_ON_OFF_CONFIG here, but
>> +     * PB_ON_OFF_CONFIG_POWERUP_CONTROL, PB_ON_OFF_CONFIG_EN_PIN_REQ and
>> +     * PB_ON_OFF_CONFIG_EN_PIN_REQ are ignored by the device.
>> +     * Only PB_ON_OFF_CONFIG_POLARITY_HIGH has an effect.
>> +     */
>> +
>> +    return pmbus_do_probe(client, &data->info);
>>   }
>>   static const struct i2c_device_id tda38640_id[] = {
> 
