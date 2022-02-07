Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB099C3527D
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Feb 2022 17:28:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbiBGR2B (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Feb 2022 12:28:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345042AbiBGRUv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Feb 2022 12:20:51 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D75C0401D5
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Feb 2022 09:20:50 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id o9-20020a9d7189000000b0059ee49b4f0fso11406621otj.2
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Feb 2022 09:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=RZfm+nBDWOz1ujhgnwivAwTA6u9XkBJI1w9HaEx3LYQ=;
        b=jQlkukE2u6BE9rYm9fO1F/BQiSO/JcAR3h4bFWW+rItbpTD+Xas84iKYnqDDam25Q1
         27dDzTa6GFwMp+wiX7YOdZ6FTijaXoBi3t3zXtzsFNQHzCbyTrgaLQfDhWarFUsIooGY
         jHDl3JeINjLSxE2dS1MiG27KBcVxvacuqp6tJ9KOT8XmlBoBNpDNkiHYgQhItmsI/BpZ
         oWO3H3i1tJ5hLBSJU0yQpQtYO83KYllejF0GOmFQxDfxP+Fb4lCqsaXEg67qxwWfZQI0
         0CITWCkyozBzTAfyUb5O3pFMBVXXKTwpGWO8nRAZ+RoY4+Jy3ynWDiWn12WqGiLxgLU/
         p+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=RZfm+nBDWOz1ujhgnwivAwTA6u9XkBJI1w9HaEx3LYQ=;
        b=guBZrpMICnz5jGXpgxwai8O2dYCX3p0WVIxFCv/KPUbPx1ygChDTuCu5D39Le13HEK
         g9+p+dY7+BHnX3blV/ZR0yZD/Gjix5NFK7GvLd+WvwPhrfkY3bfA510wbnj1orGdKyHU
         O6dwnZ3UAHcHrX8KoRH/xni3G3xv7L+nOJcDQv6urgnH5kFbLz8iPvjLtzT63UvAPfvr
         s6l98JeIwFybr5ZG2s7Ekji2mr4yYCU6pW3X315gMBOi/7AEE0o2phNRQaR0EHWDrV9a
         IB9UbmwB41TZWWoqgwhii93aJYleSxNTbZJiYHn1wxpiwRMKCol1crZi64c/Tqm3zXvO
         ozuQ==
X-Gm-Message-State: AOAM530DrOWQrjcth+VoZgStLEuZQc7ayz7uoyCGp+k8pUwsjwwIfne6
        JXV9L1fUn985XG11XABrxI02Z8feInjgxw==
X-Google-Smtp-Source: ABdhPJyLOtZSCJxpedoJbN3d8/8yDIdDLiJL4hLnvzRlzEkGkZ6Qmwm3qe9+E5fHeKTPV+UNjtHcUA==
X-Received: by 2002:a05:6830:10d6:: with SMTP id z22mr327231oto.106.1644254449433;
        Mon, 07 Feb 2022 09:20:49 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bg34sm4291238oob.14.2022.02.07.09.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 09:20:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5260ae3b-a9ec-55f8-82f4-a1fd4842b4b0@roeck-us.net>
Date:   Mon, 7 Feb 2022 09:20:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Christian Lamparter <chunkeey@gmail.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20220206190517.303483-1-chunkeey@gmail.com>
 <eac99325-ad4a-a636-9d96-0fa56cda35d3@roeck-us.net>
 <6dbef8a5-6df4-ccab-ffc0-639e16b2ebf6@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] hwmon: (tc654) Add thermal_cooling device support
In-Reply-To: <6dbef8a5-6df4-ccab-ffc0-639e16b2ebf6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/7/22 03:10, Christian Lamparter wrote:
> On 07/02/2022 09:47, Guenter Roeck wrote:
>> On 2/6/22 11:05, Christian Lamparter wrote:
>>> Adds thermal_cooling device support to the tc654/tc655
>>> driver. This make it possible to integrate it into a
>>> device-tree supported thermal-zone node as a
>>> cooling device.
>>>
>>> I have been using this patch as part of the Netgear WNDR4700
>>> Centria NAS Router support within OpenWrt since 2016.
>>>
>>> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
>>> ---
>>> v1 -> v2: - Drop imply THERMAL
>>>       - aligned ( so . everything is lining up
>>> ---
>>>   drivers/hwmon/tc654.c | 94 +++++++++++++++++++++++++++++++++++--------
>>>   1 file changed, 77 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
>>> --- a/drivers/hwmon/tc654.c
>>> +++ b/drivers/hwmon/tc654.c
>>> @@ -367,36 +368,30 @@ static ssize_t pwm_mode_store(struct device *dev, struct device_attribute *da,
>>>   static const int tc654_pwm_map[16] = { 77,  88, 102, 112, 124, 136, 148, 160,
>>>                         172, 184, 196, 207, 219, 231, 243, 255};
>>> +static int get_pwm(struct tc654_data *data)
>>> +{
>>> +    if (data->config & TC654_REG_CONFIG_SDM)
>>> +        return 0;
>>> +    else
>>
>> Nit: else after return is unnecessary. Sorry for not noticing before.
>>
> Noted.
> 
>>> @@ -447,6 +458,44 @@ static struct attribute *tc654_attrs[] = {
>>>   ATTRIBUTE_GROUPS(tc654);
>>> +/* cooling device */
>>> +
>>> +static int tc654_get_max_state(struct thermal_cooling_device *cdev,
>>> +                   unsigned long *state)
>>> +{
>>> +    *state = 255;
>>> +    return 0;
>>> +}
>>> +
>>> +static int tc654_get_cur_state(struct thermal_cooling_device *cdev,
>>> +                   unsigned long *state)
>>> +{
>>> +    struct tc654_data *data = tc654_update_client(cdev->devdata);
>>> +
>>> +    if (IS_ERR(data))
>>> +        return PTR_ERR(data);
>>> +
>>> +    *state = get_pwm(data);
>>> +    return 0;
>>> +}
>>> +
>>> +static int tc654_set_cur_state(struct thermal_cooling_device *cdev,
>>> +                   unsigned long state)
>>> +{
>>> +    struct tc654_data *data = tc654_update_client(cdev->devdata);
>>> +
>>> +    if (IS_ERR(data))
>>> +        return PTR_ERR(data);
>>> +
>>> +    return _set_pwm(data, clamp_val(state, 0, 255));
>>> +}
>>
>> Looking into this further, wouldn't it be more appropriate to limit the
>> cooling states to [0 .. 15], or in other words use data->duty_cycle
>> directly ? I don't know how the thermal subsystem reacts if it requests
>> to set the state to a certain value and the actual state is set to
>> something completely different. Also, it doesn't seem to make much sense
>> to bother the thermal subsystem with 256 states if the chip really only
>> supports 16 states.
> 
> So there's more: Yes, the chip has 16 PWM states (from Duty Cycle 0=30%
> to Duty Cycle 15=100% - each step has a linear 4,66...% increment).
> The chip also has a "shutdown state/mode". where the FAN(s) are all turned
> off (only the chip's I2C interface remains active for the wake-up signal).
> 
> This is why even the current pwm_show() looks so funny.
> <https://github.com/torvalds/linux/blob/master/drivers/hwmon/tc654.c#L365-L380>
> 
> |static ssize_t pwm_show(struct device *dev, struct device_attribute *da,
> |            char *buf)
> |{
> |    struct tc654_data *data = tc654_update_client(dev);
> |    int pwm;
> |
> |    if (IS_ERR(data))
> |        return PTR_ERR(data);
> |---- from here ----
> |    if (data->config & TC654_REG_CONFIG_SDM)
> |        pwm = 0;
> |    else
> |        pwm = tc654_pwm_map[data->duty_cycle];
> |---- to here ----
> |    return sprintf(buf, "%d\n", pwm);
> |}
> 
> If the chip is in that TC654_REG_CONFIG_SDM (SDM=Shutdown Mode), the PWM is 0%
> and the fan is off. If it's not in TC654_REG_CONFIG_SDM, then that duty_cycle=0
> gives you a PWM with 30%.
> 
> The same goes for the pwm_store. And yes, the current behavior through the
> hwmon sysfs interface is a bit extreme:
> 
> pwm_store with val=0 => SDM engaged - Fans turn off.
> pwm_store with val=1 => Fans are on 30%. (There's a steep cliff / steep climb)
> ...
> pwm_store with val=~78 > Fans are on 34%
> ...
> pwm_store with val=255 = Fans are on 100%
> 
> 
> So, I would like to keep that shutdown state in there. The Fan on the
> WNDR4700 is annoying and only needs to run from time to time.
> 
> For now, I fiddled around by adding +1 and -1 here and there. Another
> option would be to extend the tc654_pwm_map. But this has the
> consequence that it changes the existing behavior on the hwmon interface
> as well.
> 
> I've inlined a preliminary git diff patch, if you want to take a peek
> and maybe already have comments.
> 

Couple of comments inline.

> I want to test this on the hardware, before sending out a version...
> Which I only can do on weekends (so it will be a week, hope that's ok).
> 

No worries.

> Thanks,
> Christian
> ---
> diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
> index cf2a3acd5c91..f6b6375ffeaf 100644
> --- a/drivers/hwmon/tc654.c
> +++ b/drivers/hwmon/tc654.c
> @@ -15,6 +15,7 @@
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/slab.h>
> +#include <linux/thermal.h>
>   #include <linux/util_macros.h>
> 
>   enum tc654_regs {
> @@ -384,28 +385,19 @@ static ssize_t pwm_show(struct device *dev, struct device_attribute *da,
>       return sprintf(buf, "%d\n", pwm);
>   }
> 
> -static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
> -             const char *buf, size_t count)
> +static int _set_pwm(struct tc654_data *data, unsigned long val)
>   {
> -    struct tc654_data *data = dev_get_drvdata(dev);
>       struct i2c_client *client = data->client;
> -    unsigned long val;
>       int ret;
> 
> -    if (kstrtoul(buf, 10, &val))
> -        return -EINVAL;
> -    if (val > 255)
> -        return -EINVAL;
> -
>       mutex_lock(&data->update_lock);
> 
> -    if (val == 0)
> +    if (val == 0) {
>           data->config |= TC654_REG_CONFIG_SDM;
> -    else
> +    } else {
>           data->config &= ~TC654_REG_CONFIG_SDM;
> -
> -    data->duty_cycle = find_closest(val, tc654_pwm_map,
> -                    ARRAY_SIZE(tc654_pwm_map));
> +        data->duty_cycle = val - 1;
> +    }

This does change existing behavior a bit: The current code always sets
(and thus updates) TC654_REG_DUTY_CYCLE, and sets it to 0 even when setting
TC654_REG_CONFIG_SDM. With the above change, that is no longer the case,
and TC654_REG_DUTY_CYCLE is kept at whatever the previous value was.
Maybe that has no impact, but it might be safer to clear data->duty_cycle
when setting TC654_REG_CONFIG_SDM.

> 
>       ret = i2c_smbus_write_byte_data(client, TC654_REG_CONFIG, data->config);
>       if (ret < 0)
> @@ -416,6 +408,24 @@ static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
> 
>   out:
>       mutex_unlock(&data->update_lock);
> +    return ret;
> +}
> +
> +static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
> +             const char *buf, size_t count)
> +{
> +    struct tc654_data *data = dev_get_drvdata(dev);
> +    unsigned long val;
> +    int ret;
> +
> +    if (kstrtoul(buf, 10, &val))
> +        return -EINVAL;
> +    if (val > 255)
> +        return -EINVAL;
> +    if (val > 0)
> +        val = find_closest(val, tc654_pwm_map, ARRAY_SIZE(tc654_pwm_map)) + 1;
> +
> +    ret = _set_pwm(data, val);
>       return ret < 0 ? ret : count;
>   }
> 
> @@ -447,6 +457,56 @@ static struct attribute *tc654_attrs[] = {
> 
>   ATTRIBUTE_GROUPS(tc654);
> 
> +/* thermal cooling device functions

/*
  * Please use standard multi-line comments. This is not the networking subsystem.
  */

> + *
> + * Account for the "ShutDown Mode (SDM)" state by offseting

offsetting

> + * the 16 PWM duty cycle states by 1.
> + *
> + * State  0 =   0% PWM | Shutdown - Fan(s) are off
> + * State  1 =  30% PWM | duty_cycle =  0
> + * State  2 = ~35% PWM | duty_cycle =  1
> + * [...]
> + * State 15 = ~95% PWM | duty_cycle = 14
> + * State 16 = 100% PWM | duty_cycle = 15
> + */
> +#define TC654_MAX_COOLING_STATES    16

TC654_MAX_COOLING_STATES is misleading; it is really the maximum cooling state,
not the number of cooling states. Please drop the "S".

> +
> +static int tc654_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
> +{
> +    return TC654_MAX_COOLING_STATES;
> +}
> +
> +static int tc654_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
> +{
> +    struct tc654_data *data = tc654_update_client(cdev->devdata);
> +
> +    if (IS_ERR(data))
> +        return PTR_ERR(data);
> +
> +    if (data->config & TC654_REG_CONFIG_SDM)
> +        *state = 0;    /* FAN is off */
> +    else
> +        *state = data->duty_cycle + 1;    /* offset PWM States by 1 */
> +
> +    return 0;
> +}
> +
> +static int tc654_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
> +{
> +    struct tc654_data *data = tc654_update_client(cdev->devdata);
> +
> +    if (IS_ERR(data))
> +        return PTR_ERR(data);
> +
> +    return _set_pwm(data, clamp_val(state, 0, TC654_MAX_COOLING_STATES));
> +}
> +
> +static const struct thermal_cooling_device_ops tc654_fan_cool_ops = {
> +    .get_max_state = tc654_get_max_state,
> +    .get_cur_state = tc654_get_cur_state,
> +    .set_cur_state = tc654_set_cur_state,
> +};
> +
>   /*
>    * device probe and removal
>    */
> @@ -477,7 +537,18 @@ static int tc654_probe(struct i2c_client *client)
>       hwmon_dev =
>           devm_hwmon_device_register_with_groups(dev, client->name, data,
>                              tc654_groups);
> -    return PTR_ERR_OR_ZERO(hwmon_dev);
> +    if (IS_ERR(hwmon_dev))
> +        return PTR_ERR(hwmon_dev);
> +
> +    if (IS_ENABLED(CONFIG_THERMAL)) {
> +        struct thermal_cooling_device *cdev;
> +
> +        cdev = devm_thermal_of_cooling_device_register(dev, dev->of_node, client->name,
> +                                   hwmon_dev, &tc654_fan_cool_ops);
> +        return PTR_ERR_OR_ZERO(cdev);
> +    }
> +
> +    return 0;
>   }
> 
>   static const struct i2c_device_id tc654_id[] = {
> ---

