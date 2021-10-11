Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D19C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Oct 2021 18:49:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DA6960F0F
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Oct 2021 18:49:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233712AbhJKSvF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Oct 2021 14:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233913AbhJKSu5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Oct 2021 14:50:57 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710D5C061570
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Oct 2021 11:48:51 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id u69so13424396oie.3
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Oct 2021 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dyO64YME79obPWUAyFT7zN7hP+Nr958JmV1DzZMc8GU=;
        b=ieIeFwRzC9qL7qQx0UAX/9YCyRYVW5qTsoi5s5oPSKaJXykNHOgpPBPBTPHQi5BH/2
         DpYhsgmyWPUpNZEEhbUec5H19gPPdsFdgcoxhLgXy/u3iC6/TTxMyyzMSHlql/u1E6U5
         GCwLfSRmGPLvtLQTB2FJV5V1n37lvgCBjyG5OC5TmYzQdF+cdmO3xXI4/R9iPaxFK4iG
         etWY7sTNWizB101I/XaUDoYvDLw+PNst7lPllJXSAiSKGCUQlzlcfgQzq0mjj3vX29np
         k9ZAHCyRLk3KyafLT1LYbgdQRAZftPUvcKPs3/Bewf0U09lzsDMc7Tt3dnCOaJtL2VhO
         YnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dyO64YME79obPWUAyFT7zN7hP+Nr958JmV1DzZMc8GU=;
        b=mRRk2Eq/NqVMmWWTgK/phHuojL30mXM4Bu9VJ9kT8Ig0kFffeYmaDh2yPpxhn/yhuD
         SxvYvJSxi0GFnWqM1UUm0b0ozqJxycE6jjJXOL08SHucuUFIF19sdJ7J2UwDcUQEgvZz
         OmHfyGHfLCYFmLcxBtwz4sTNqRCWoSa6ImlqYXdo5R/6IfgwhKCVeDS83GTxObjGJGxP
         IguqsNOgW/Xurhz8T8AJEw4RuKFnpu03RoQyWU6d3c0uKwj21DB6igGfdAcsumZ/21Ku
         dqzpNnI6FHMLW4qoWkcL8lDTcgHlTTfBGvxX4rFu3oWIfS+rWpJmamy1AnzXbsfzICaE
         smsQ==
X-Gm-Message-State: AOAM531rlD0s8crvvBFfQETuWrMU3BRJHWrYTVjxDqrV8laHH96+anjb
        dbHTOuGV/okLhCYro8KplM1oQb6Z3Xo=
X-Google-Smtp-Source: ABdhPJxfAusXg1OqwQkPvUXspqkQX5nzYf9VavubVoBGKtEx8kSAHgf3foaivLgeGoJXkpdugKdJFg==
X-Received: by 2002:aca:f0c3:: with SMTP id o186mr498039oih.37.1633978130081;
        Mon, 11 Oct 2021 11:48:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 63sm1841781oih.14.2021.10.11.11.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 11:48:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, W_Armin@gmx.de
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210926221044.14327-1-W_Armin@gmx.de>
 <20210926221044.14327-2-W_Armin@gmx.de>
 <20211011161101.s7lojsh2ugsnbuzh@pali>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 1/2] hwmon: (dell-smm) Add support for fanX_min,
 fanX_max and fanX_target
Message-ID: <06e2d014-2394-f1ff-225d-fc0afc4d6cf7@roeck-us.net>
Date:   Mon, 11 Oct 2021 11:48:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011161101.s7lojsh2ugsnbuzh@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/11/21 9:11 AM, Pali Rohár wrote:
> On Monday 27 September 2021 00:10:43 W_Armin@gmx.de wrote:
>> From: Armin Wolf <W_Armin@gmx.de>
>>
>> The nominal speed of each fan can be obtained with
>> i8k_get_fan_nominal_speed(), however the result is not available
>> from userspace.
>> Change that by adding fanX_min, fanX_max and fanX_target attributes.
>> All are RO since fan control happens over pwm.
>>
>> Tested on a Dell Inspiron 3505 and a Dell Latitude C600.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   Documentation/hwmon/dell-smm-hwmon.rst |  3 ++
>>   drivers/hwmon/dell-smm-hwmon.c         | 61 +++++++++++++++++++++++---
>>   2 files changed, 58 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/hwmon/dell-smm-hwmon.rst b/Documentation/hwmon/dell-smm-hwmon.rst
>> index 3bf77a5df995..beec88491171 100644
>> --- a/Documentation/hwmon/dell-smm-hwmon.rst
>> +++ b/Documentation/hwmon/dell-smm-hwmon.rst
>> @@ -34,6 +34,9 @@ Name				Perm	Description
>>   =============================== ======= =======================================
>>   fan[1-3]_input                  RO      Fan speed in RPM.
>>   fan[1-3]_label                  RO      Fan label.
>> +fan[1-3]_min                    RO      Minimal Fan speed in RPM
>> +fan[1-3]_max                    RO      Maximal Fan speed in RPM
>> +fan[1-3]_target                 RO      Expected Fan speed in RPM
> 
> Hello!
> 
> I do not know API / meaning of these 3 properties, so I looked into
> hwmon documentation at:
> https://www.kernel.org/doc/html/latest/hwmon/sysfs-interface.html#fans
> 
> And in documentation is written that both 3 properties (min, max and
> target) are RW.
> 

That is the expectation. That doesn't mean they _have_ to be RW.
It doesn't make sense to categorically demand that attributes are RW
if the hardware does not support it.

> I'm somehow lost as I have not fully understood what is the original
> meaning of these 3 properties. Guenter could you help?
> 
min: lower fan speed results in warning/error.
max: higher fan speed results in error
target: target fan speed. The controller should set the fan speed
	to this level.

> After reading I understood it as that these properties are for HW which
> supports controlling directly fan speed via RPM (and not PWM). And so
> user can set lower and upper limit of fan speed (via _min and _max) or
> can set exact RPM value (via _target).
> 

Not really. The controller can try to modify a pwm value to reach the
configured target fan speed. min/max values apply to both pwm and rpm
controlled fans.

>>   pwm[1-3]                        RW      Control the fan PWM duty-cycle.
>>   pwm1_enable                     WO      Enable or disable automatic BIOS fan
>>                                           control (not supported on all laptops,
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
>> index 774c1b0715d9..476f2a74bd8c 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -76,6 +76,7 @@ struct dell_smm_data {
>>   	int temp_type[DELL_SMM_NO_TEMP];
>>   	bool fan[DELL_SMM_NO_FANS];
>>   	int fan_type[DELL_SMM_NO_FANS];
>> +	int *fan_nominal_speed[DELL_SMM_NO_FANS];
>>   };
>>
>>   MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
>> @@ -673,6 +674,13 @@ static umode_t dell_smm_is_visible(const void *drvdata, enum hwmon_sensor_types
>>   			if (data->fan[channel] && !data->disallow_fan_type_call)
>>   				return 0444;
>>
>> +			break;
>> +		case hwmon_fan_min:
>> +		case hwmon_fan_max:
>> +		case hwmon_fan_target:
>> +			if (data->fan_nominal_speed[channel])
>> +				return 0444;
>> +
>>   			break;
>>   		default:
>>   			break;
>> @@ -740,6 +748,25 @@ static int dell_smm_read(struct device *dev, enum hwmon_sensor_types type, u32 a
>>
>>   			*val = ret;
>>
>> +			return 0;
>> +		case hwmon_fan_min:
>> +			*val = data->fan_nominal_speed[channel][0];
> 
> When fan is turned off then it has speed 0 RPM. So should not be minimal
> fan speed always hardcoded to zero?
> 

No. Fans can be turned off on most systems/controllers. This means the
"minimum" fan speed would always be 0, and the attribute would be
worthless. In other words, "fan turned off" is always an exception.

>> +
>> +			return 0;
>> +		case hwmon_fan_max:
>> +			*val = data->fan_nominal_speed[channel][data->i8k_fan_max];
>> +
>> +			return 0;
>> +		case hwmon_fan_target:
>> +			ret = i8k_get_fan_status(data, channel);
>> +			if (ret < 0)
>> +				return ret;
>> +
>> +			if (ret > data->i8k_fan_max)
>> +				ret = data->i8k_fan_max;
>> +
>> +			*val = data->fan_nominal_speed[channel][ret];
>> +
>>   			return 0;
>>   		default:
>>   			break;
>> @@ -889,9 +916,12 @@ static const struct hwmon_channel_info *dell_smm_info[] = {
>>   			   HWMON_T_INPUT | HWMON_T_LABEL
>>   			   ),
>>   	HWMON_CHANNEL_INFO(fan,
>> -			   HWMON_F_INPUT | HWMON_F_LABEL,
>> -			   HWMON_F_INPUT | HWMON_F_LABEL,
>> -			   HWMON_F_INPUT | HWMON_F_LABEL
>> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
>> +			   HWMON_F_TARGET,
>> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
>> +			   HWMON_F_TARGET,
>> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
>> +			   HWMON_F_TARGET
>>   			   ),
>>   	HWMON_CHANNEL_INFO(pwm,
>>   			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>> @@ -910,7 +940,7 @@ static int __init dell_smm_init_hwmon(struct device *dev)
>>   {
>>   	struct dell_smm_data *data = dev_get_drvdata(dev);
>>   	struct device *dell_smm_hwmon_dev;
>> -	int i, err;
>> +	int i, state, err;
>>
>>   	for (i = 0; i < DELL_SMM_NO_TEMP; i++) {
>>   		data->temp_type[i] = i8k_get_temp_type(i);
>> @@ -926,8 +956,27 @@ static int __init dell_smm_init_hwmon(struct device *dev)
>>   		err = i8k_get_fan_status(data, i);
>>   		if (err < 0)
>>   			err = i8k_get_fan_type(data, i);
>> -		if (err >= 0)
>> -			data->fan[i] = true;
>> +
>> +		if (err < 0)
>> +			continue;
>> +
>> +		data->fan[i] = true;
>> +		data->fan_nominal_speed[i] = devm_kmalloc_array(dev, data->i8k_fan_max + 1,
>> +								sizeof(*data->fan_nominal_speed[i]),
>> +								GFP_KERNEL);
>> +		if (!data->fan_nominal_speed[i])
>> +			continue;
>> +
>> +		for (state = 0; state <= data->i8k_fan_max; state++) {
>> +			err = i8k_get_fan_nominal_speed(data, i, state);
>> +			if (err < 0) {
>> +				/* Mark nominal speed table as invalid in case of error */
>> +				devm_kfree(dev, data->fan_nominal_speed[i]);
>> +				data->fan_nominal_speed[i] = NULL;
>> +				break;
>> +			}
>> +			data->fan_nominal_speed[i][state] = err;
>> +		}
>>   	}
>>
>>   	dell_smm_hwmon_dev = devm_hwmon_device_register_with_info(dev, "dell_smm", data,
>> --
>> 2.20.1
>>

