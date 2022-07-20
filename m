Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756BACCA480
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Jul 2022 12:34:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240392AbiGTMex (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Jul 2022 08:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240695AbiGTMev (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Jul 2022 08:34:51 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760556D2C2
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Jul 2022 05:34:47 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id a15so17683025pjs.0
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Jul 2022 05:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IhPE//uPwVK4CeIewgBdgN6YQ24tHleDOwB4H9LK6JM=;
        b=MvDuRL0KFKi9Ivol3OlOdfNHvNkjwL9SPu7bTXvybUA7mLV9wUJ5k5XN28ZDvagYIa
         VvfkGbmtMsREq0g0RlyeedZa3OazBAejBgwQOYGxTRg3KuTfY/NUGQha9z/caTsK43zt
         jQ+KkowJjnQzGJ/PZ6En6kjH4NDfCbsvlXeRFENQozl3nbUh0Xh4vq9Yde56j2ZdBhOT
         AVW/TCf9NYZ8cGTau8KykGUYfLwFpxw7jTaNWncaXKV9EA+Rgu52Q5XrorNcRqMqP6qs
         gaJ6XnkrF7J3MhtppTboOhC5jjPv7r8RmlY0kncdCObB/5fND2v2PFjDwfwf5JQg/y9F
         IsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IhPE//uPwVK4CeIewgBdgN6YQ24tHleDOwB4H9LK6JM=;
        b=BjZSaDB4AqzTUG7JfV4Lo+XgpksZHlH/QHG7JaF+6B7++6iuEmx8RZ9+xsUBuayVlc
         nTUGNJfryd6eP54PpVtP5ORqMuDtsXQU3uKEULGTYgF6D7tq0D68WCrN0tOFDgg1AXkm
         Wvw6nEOQ8SB0hcUahi4mZ6QYyRXo2W7K3eDwIkIOIlKL3MyP6tKiivN37p69JbzglZ5P
         pjhkAC4YK9PZgj9Wq+IV3IFBIfWqsUxkds0vQx9TuMMSB8pQiILO3Xi3xtxPkY+S5rHf
         yRGyvyIr7ji9X2o0fC8dI2tMqJr7E+UglZszz9+BHBDdpT2i6SCLG/oV+HtBkrv3/Zqx
         YFZA==
X-Gm-Message-State: AJIora/2tCN0CoFmN/K6fHA2Uovy2jSAzEoTq/yxbViGPbhaqR6SEKvp
        I7ljfP2fd4bioZ8UGUdtHhU=
X-Google-Smtp-Source: AGRyM1s4R6kVrdqcc0+z72gizH/pnNxvtOxdopDm3Q1ho2uOPZy5U83BJ/JMrGKXcZd47f/9pp2A7Q==
X-Received: by 2002:a17:902:f151:b0:16c:dcc3:97b8 with SMTP id d17-20020a170902f15100b0016cdcc397b8mr968756plb.64.1658320486832;
        Wed, 20 Jul 2022 05:34:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k74-20020a62844d000000b00528bbf8245dsm13541477pfd.79.2022.07.20.05.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 05:34:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4db2c5d5-9df7-5329-c9b7-65f96958c7b5@roeck-us.net>
Date:   Wed, 20 Jul 2022 05:34:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drivers: hwmon: Add max31760 fan speed controller driver
Content-Language: en-US
To:     "Tilki, Ibrahim" <Ibrahim.Tilki@analog.com>
Cc:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Bolucu, Nurettin" <Nurettin.Bolucu@analog.com>
References: <20220704160606.52-1-Ibrahim.Tilki@analog.com>
 <20220715181709.GA3775212@roeck-us.net>
 <DM8PR03MB624710E4039F7C6212320363968E9@DM8PR03MB6247.namprd03.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <DM8PR03MB624710E4039F7C6212320363968E9@DM8PR03MB6247.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/20/22 03:08, Tilki, Ibrahim wrote:
>> On Mon, Jul 04, 2022 at 04:06:05PM +0000, Ibrahim Tilki wrote:
>>> MAX31760 is a presicion fan speed controller with nonvolatile lookup table.
>>> Device has one internal and one external temperature sensor support.
>>> Controls two fans and measures their speeds.
>>> Generates hardware alerts when programmable max and critical temperatures are exceeded.
>>>
>>> Driver creates following sysfs attributes for configuring lookup table:
>>> pwm1_auto_point[1-48]_{pwm,temp,temp_hyst}
>>>
>>> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
>>> Reviewed-by: Nurettin Bolucu <Nurettin.Bolucu@analog.com>
>>> ---
>>>   drivers/hwmon/Kconfig    |  10 +
>>>   drivers/hwmon/Makefile   |   1 +
>>>   drivers/hwmon/max31760.c | 614
>>> +++++++++++++++++++++++++++++++++++++++
>>
>> Please add doucmentation describing the supported sysfs attributes.
>>
> 
> Driver does not create a sysfs attribute other than the standard sysfs attributes defined here:
> https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface
> 
> Should I still add documentation?
> 

Yes. The documentation describes the sysfs attributes supported by the driver.
See other documentation files in Documentation/hwmon for examples. Also please
read and follow Documentation/hwmon/submitting-patches.rst.

>>>   3 files changed, 625 insertions(+)
>>>   create mode 100644 drivers/hwmon/max31760.c
>>>
>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig index
>>> 590d3d550..59cc44a5c 100644
>>> --- a/drivers/hwmon/Kconfig
>>> +++ b/drivers/hwmon/Kconfig
> 
> ...
> 
>>> +	case hwmon_pwm:
>>> +		switch (attr) {
>>> +		case hwmon_pwm_input:
>>> +			if (val < 0 || val > 255)
>>> +				return -EINVAL;
>>> +
>>> +			return regmap_write(state->regmap, REG_PWMR, val);
>>> +		case hwmon_pwm_enable:
>>> +			if (val == 0)
>>> +				return -EOPNOTSUPP;
>>> +
>>> +			if (val == 1)
>>> +				return regmap_set_bits(state->regmap, REG_CR2, CR2_DFC);
>>> +
>>
>> Accepting all other values ?
>>
> 
> Standard sysfs documentation defines pwm_enable as follows:
>    - 0: no fan speed control (i.e. fan at full speed)
>    - 1: manual fan speed control enabled (using pwm[1-*])
>    - 2+: automatic fan speed control enabled
> 
> So I assumed I should accept all other values as automatic fan speed control.
> If that is not the case, what is the correct way to handle this attribute?
> 
That only says that drivers may implement values 2+ as fit for the chip.
For example, 2 could mean RPM based automatic fan speed control, and 3
could mean pwm based automatic fan speed control. It doesn't mean "accept
any random value".

Guenter
