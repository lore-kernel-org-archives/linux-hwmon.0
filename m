Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B705C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Aug 2021 17:53:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01777610FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Aug 2021 17:53:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhHRRyB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 18 Aug 2021 13:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbhHRRyA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 Aug 2021 13:54:00 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4056C061764
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Aug 2021 10:53:25 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id n1-20020a9d1e810000b0290514da4485e4so5098796otn.4
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Aug 2021 10:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B6vEin5FbeNpRmKZsuVfTUiuiAH2/qmNDzDL/btEYMY=;
        b=ASNy87TmzVpR3nPkGRiNlccxNXdXEvW9zWPdbVZjIwjmsrRGb4IiRgsbgV2TlpDtne
         6Gd6ahJHvTnDedzQEHwqTmnNBaS0kxPoe6UVc1lvuYlmJtsjMA2Xp99hsFWM6VpAMOa8
         ExgamGCOM659ySinMynX3eCY58i/SkbZiecjQgoHzy3zBcQ+l0iwljT3saXh9/0tBb4/
         6Ql0uexjyaSae82AbEo82z5jbpbWyMfv2SbDbrgwfxD5KY0UdP3eJ3eIZEisHZ/MglLf
         PU0iDvN6J01uKaIaNNoq2KRRXHljwKtu6KePlVZwo6V/UsbRQEIQ91ZHFn3ZU5H4eKDL
         dECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B6vEin5FbeNpRmKZsuVfTUiuiAH2/qmNDzDL/btEYMY=;
        b=hMVN+o+GV9A9k5MAEZrge0NS0VfD197/lrjJ9M3xn/zXBg0VEQWrOlmfAsY1D6lpw3
         OavXVL8Z7S53brdw5BPfELlfcQyqU1ERb5y3aYLM29nalWQJ9rjcioCD0BXYz/ie4FSL
         9GI28vuFfgsgBtb1p/SoR9kz6uywvOnvgsp4/mPXHbUftffcup7fv0PNoyEZ93+C5baq
         Q4waWBwc4TZ6T86h/QVXJGIHzyqGS64ii7LbGXXDqwdco96EvnOx/jMIsKUMIlp/cG1Z
         pO6VRfWGO8BOU+xaQSIltv2pcRubFEDGxQyEOVVJuYAWfq5qYCwbG6TsOhUHLbFLgvYw
         PYIg==
X-Gm-Message-State: AOAM531eTnTJIP5LBJP3BtRlFhVuC4oIlPcb1MD0RTXuOKq8lkK+cueu
        bajyYCxGHY029Dny0jOW7byWzthkRNM=
X-Google-Smtp-Source: ABdhPJxbCe+XlDo3J9L8gOSEuL2Gpm/Q/IKMD6VZFLYMl6GBW+TBPhEyJsiGBfPDwwnJJOBlkLuJeA==
X-Received: by 2002:a9d:22a4:: with SMTP id y33mr7156188ota.324.1629309199745;
        Wed, 18 Aug 2021 10:53:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 65sm82177ooc.2.2021.08.18.10.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 10:53:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20210816203547.257403-1-robert.hancock@calian.com>
 <9e79f343-c81d-9c0c-621c-00f9ee030cf0@roeck-us.net>
 <095c32600b3648edd017277888099e4ae422a35e.camel@calian.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (adt7470) Add support for PWM inversion
Message-ID: <f66ed494-aacd-1efb-87cb-c009be7708bb@roeck-us.net>
Date:   Wed, 18 Aug 2021 10:53:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <095c32600b3648edd017277888099e4ae422a35e.camel@calian.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/18/21 9:34 AM, Robert Hancock wrote:
> On Tue, 2021-08-17 at 20:26 -0700, Guenter Roeck wrote:
>> On 8/16/21 1:35 PM, Robert Hancock wrote:
>>> Add sysfs attributes to control whether the PWM output signal from the
>>> device is inverted (i.e. active-low rather than active-high).
>>>
>>
>> We would normally call that "polarity".
>>
>> Anyway, what is the use case ? The pwm polarity is not a fan property but
>> a system property. While many of the hwmon sysfs attributes describe system
>> properties, that is for the most part a leftover from times when PCs
>> did not provide the necessary information, and it was necessary to
>> configure hwmon devices from userspace.
>>
>> Nowadays, system properties are typically provided with devicetree
>> properties or with the ACPI equivalent. A good example is the driver
>> for adt7575. Would that solve your problem ?
> 
> In our case the board we are using with this device has a transistor between
> the ADT7470 PWM output and the fan PWM input, which results in the signal being
> inverted. So this is effectively a hardware property, which could belong in the
> device tree. The PWM frequency is another property we are setting that could
> belong there as well.
> 
> Right now the ADT7470 driver doesn't do anything with the device tree at all,
> the entry in the DT for the device is only useful for probing. I suppose it
> could get some code to initialize the default settings for some of these values
> from the device tree if they are present and still provide the sysfs interface
> for backward compatibility?
> 
Sure, but only for the existing attributes.

> You mentioned adt7575, I assume you meant adt7475 - it has an adi,pwm-active-

Yes, sorry. Fat finger.

> state value that can be defined to set the PWM as active low or active high for
> each output. We could do something similar here. Not sure if anything else is
> setting PWM frequencies in the device tree right now? I see some in-tree DTSes
> which set a maxim,fan-pwm-freq property but I don't see any driver in tree that
> reads that property.
> 
The definition was submitted recently but Rob didn't like it because the
properties are listed as Maxim-specific but should be generic. At some point
someone will have to spend the time and propose a set of standard properties.

Anyway, the pwm subsystem uses 'clocks' properties for this purpose.
The npcm750-pwm-fan driver uses the same mechanism. Maybe we should use that
here.

Thanks,
Guenter

>>
>> Thanks,
>> Guenter
>>
>>> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
>>> ---
>>>    Documentation/hwmon/adt7470.rst |  5 ++-
>>>    drivers/hwmon/adt7470.c         | 72 ++++++++++++++++++++++++++++++++-
>>>    2 files changed, 75 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/hwmon/adt7470.rst
>>> b/Documentation/hwmon/adt7470.rst
>>> index d225f816e992..8293f93d6cd5 100644
>>> --- a/Documentation/hwmon/adt7470.rst
>>> +++ b/Documentation/hwmon/adt7470.rst
>>> @@ -69,7 +69,10 @@ from 0 (off) to 255 (full speed).  Fan speed will be set
>>> to maximum when the
>>>    temperature sensor associated with the PWM control exceeds
>>>    pwm#_auto_point2_temp.
>>>    
>>> -The driver also allows control of the PWM frequency:
>>> +The driver also allows control of the PWM inversion and frequency:
>>> +
>>> +* pwm#_invert: Controls whether the PWM output signal is inverted
>>> +  (i.e. low when active rather than high).
>>>    
>>>    * pwm1_freq
>>>    
>>> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
>>> index 2e8feacccf84..f0863a6e1560 100644
>>> --- a/drivers/hwmon/adt7470.c
>>> +++ b/drivers/hwmon/adt7470.c
>>> @@ -61,10 +61,14 @@ static const unsigned short normal_i2c[] = { 0x2C,
>>> 0x2E, 0x2F, I2C_CLIENT_END };
>>>    #define ADT7470_REG_FAN_MAX_MAX_ADDR		0x67
>>>    #define ADT7470_REG_PWM_CFG_BASE_ADDR		0x68
>>>    #define ADT7470_REG_PWM12_CFG			0x68
>>> +#define		ADT7470_PWM2_INVERT_MASK	0x10
>>> +#define		ADT7470_PWM1_INVERT_MASK	0x20
>>>    #define		ADT7470_PWM2_AUTO_MASK		0x40
>>>    #define		ADT7470_PWM1_AUTO_MASK		0x80
>>>    #define		ADT7470_PWM_AUTO_MASK		0xC0
>>>    #define ADT7470_REG_PWM34_CFG			0x69
>>> +#define		ADT7470_PWM4_INVERT_MASK	0x10
>>> +#define		ADT7470_PWM3_INVERT_MASK	0x20
>>>    #define		ADT7470_PWM3_AUTO_MASK		0x40
>>>    #define		ADT7470_PWM4_AUTO_MASK		0x80
>>>    #define	ADT7470_REG_PWM_MIN_BASE_ADDR		0x6A
>>> @@ -162,6 +166,7 @@ struct adt7470_data {
>>>    	u8			pwm_min[ADT7470_PWM_COUNT];
>>>    	s8			pwm_tmin[ADT7470_PWM_COUNT];
>>>    	u8			pwm_auto_temp[ADT7470_PWM_COUNT];
>>> +	u8			pwm_invert[ADT7470_PWM_COUNT];
>>>    
>>>    	struct task_struct	*auto_update;
>>>    	unsigned int		auto_update_interval;
>>> @@ -300,11 +305,22 @@ static int adt7470_update_sensors(struct adt7470_data
>>> *data)
>>>    			reg_mask = ADT7470_PWM1_AUTO_MASK;
>>>    
>>>    		reg = ADT7470_REG_PWM_CFG(i);
>>> -		if (i2c_smbus_read_byte_data(client, reg) & reg_mask)
>>> +		cfg = i2c_smbus_read_byte_data(client, reg);
>>> +		if (cfg & reg_mask)
>>>    			data->pwm_automatic[i] = 1;
>>>    		else
>>>    			data->pwm_automatic[i] = 0;
>>>    
>>> +		if (i % 2)
>>> +			reg_mask = ADT7470_PWM2_INVERT_MASK;
>>> +		else
>>> +			reg_mask = ADT7470_PWM1_INVERT_MASK;
>>> +
>>> +		if (cfg & reg_mask)
>>> +			data->pwm_invert[i] = 1;
>>> +		else
>>> +			data->pwm_invert[i] = 0;
>>> +
>>>    		reg = ADT7470_REG_PWM_AUTO_TEMP(i);
>>>    		cfg = i2c_smbus_read_byte_data(client, reg);
>>>    		if (!(i % 2))
>>> @@ -935,6 +951,51 @@ static ssize_t pwm_tmin_store(struct device *dev,
>>>    	return count;
>>>    }
>>>    
>>> +static ssize_t pwm_invert_show(struct device *dev,
>>> +			       struct device_attribute *devattr, char *buf)
>>> +{
>>> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>>> +	struct adt7470_data *data = adt7470_update_device(dev);
>>> +
>>> +	return sprintf(buf, "%d\n", (int)data->pwm_invert[attr->index]);
>>> +}
>>> +
>>> +static ssize_t pwm_invert_store(struct device *dev,
>>> +				struct device_attribute *devattr,
>>> +				const char *buf, size_t count)
>>> +{
>>> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>>> +	struct adt7470_data *data = dev_get_drvdata(dev);
>>> +	struct i2c_client *client = data->client;
>>> +	int pwm_invert_reg = ADT7470_REG_PWM_CFG(attr->index);
>>> +	int pwm_invert_reg_mask;
>>> +	long temp;
>>> +	u8 reg;
>>> +
>>> +	if (kstrtol(buf, 10, &temp))
>>> +		return -EINVAL;
>>> +
>>> +	if (attr->index % 2)
>>> +		pwm_invert_reg_mask = ADT7470_PWM2_INVERT_MASK;
>>> +	else
>>> +		pwm_invert_reg_mask = ADT7470_PWM1_INVERT_MASK;
>>> +
>>> +	if (temp != 1 && temp != 0)
>>> +		return -EINVAL;
>>> +
>>> +	mutex_lock(&data->lock);
>>> +	data->pwm_invert[attr->index] = temp;
>>> +	reg = i2c_smbus_read_byte_data(client, pwm_invert_reg);
>>> +	if (temp)
>>> +		reg |= pwm_invert_reg_mask;
>>> +	else
>>> +		reg &= ~pwm_invert_reg_mask;
>>> +	i2c_smbus_write_byte_data(client, pwm_invert_reg, reg);
>>> +	mutex_unlock(&data->lock);
>>> +
>>> +	return count;
>>> +}
>>> +
>>>    static ssize_t pwm_auto_show(struct device *dev,
>>>    			     struct device_attribute *devattr, char *buf)
>>>    {
>>> @@ -1135,6 +1196,11 @@ static SENSOR_DEVICE_ATTR_RW(pwm4, pwm, 3);
>>>    
>>>    static DEVICE_ATTR_RW(pwm1_freq);
>>>    
>>> +static SENSOR_DEVICE_ATTR_RW(pwm1_invert, pwm_invert, 0);
>>> +static SENSOR_DEVICE_ATTR_RW(pwm2_invert, pwm_invert, 1);
>>> +static SENSOR_DEVICE_ATTR_RW(pwm3_invert, pwm_invert, 2);
>>> +static SENSOR_DEVICE_ATTR_RW(pwm4_invert, pwm_invert, 3);
>>> +
>>>    static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point1_pwm, pwm_min, 0);
>>>    static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point1_pwm, pwm_min, 1);
>>>    static SENSOR_DEVICE_ATTR_RW(pwm3_auto_point1_pwm, pwm_min, 2);
>>> @@ -1231,6 +1297,10 @@ static struct attribute *adt7470_attrs[] = {
>>>    	&sensor_dev_attr_pwm2.dev_attr.attr,
>>>    	&sensor_dev_attr_pwm3.dev_attr.attr,
>>>    	&sensor_dev_attr_pwm4.dev_attr.attr,
>>> +	&sensor_dev_attr_pwm1_invert.dev_attr.attr,
>>> +	&sensor_dev_attr_pwm2_invert.dev_attr.attr,
>>> +	&sensor_dev_attr_pwm3_invert.dev_attr.attr,
>>> +	&sensor_dev_attr_pwm4_invert.dev_attr.attr,
>>>    	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
>>>    	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
>>>    	&sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
>>>

