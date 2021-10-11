Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AA2C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Oct 2021 14:32:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E05ED60BD3
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Oct 2021 14:32:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242002AbhJKOeF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Oct 2021 10:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238706AbhJKOeA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Oct 2021 10:34:00 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BD9C06177F
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Oct 2021 07:27:49 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id o204so16696604oih.13
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Oct 2021 07:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xOC4fOoAZDukV+VlyMwUKMfjrKQZpBbEsLBiV3jfAM4=;
        b=d1dJON5417sBhXCJsGpIcE2cQkt4xRo6dm8WycHwLxqEgVwdEeeZllR7FnD8DqS5+l
         h7NYUZG0pWK1f3EjHOHjU/Me0L4aMLg8tR8nb3P7/OCnsuSphxkQvQsPwHqrzXh9bZLl
         y+MM3HqnaJLmjTX2gmB2R9CfFOGzy2Q//RFqD8C74ongMbr9p4lStkzW/LEPpEPtsiQj
         9K+D0/+ETyHHLU1R5dTMEOD2pUzYWiJCkcTKzQXtjbCW56tBc7b3UX3r198Lua5D7zcY
         0QZZgqAYaWegHt95KF9I/21osiDh3bVPJ7g8aRnTwPG0g2Tfgk5xNTYstucc6WEo/u6U
         PMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xOC4fOoAZDukV+VlyMwUKMfjrKQZpBbEsLBiV3jfAM4=;
        b=Q3aehzFIsb5g89OZFz1pYvC8xcQhEuATeKrJGtV9XoYJSnUtFmJjqqw83SBJN6WMaY
         blc14h2Yn06z+3Py1NfD7aLdRMaN3KjG8eIxoi+kiQHVKrmXacsDHxkXWjcrLeU85xxD
         90ym4cBUHSMYpzbXEGS3sNPRWZ1Xxwjks19VA/VHqw9Y2/7mel7YdZh5dj9vuD+RZv14
         sZ0a0fl7Zh2LU7m2eRkvY9BH5ud2J1+PcV5Sr/shedpvF2N2koGar6yxRB5irJq8w3Tm
         HPnmLw2A3iIRp8SYIDu30bjtfJdfJ2u9JdpmLLhA1nKRoqW+RXuD7oK4jDEp+/2Tbu2g
         LdYA==
X-Gm-Message-State: AOAM532GzlZXbVHQ0aqZirNJoebcn3w/CmWq8DhAWAzybGYnke8pCLGG
        qFmVkwNe0MAa6AyHfudPxZ22Pi5+Rok=
X-Google-Smtp-Source: ABdhPJybUlx9hxzq6IIdRtBtur/D9+1VaI4KH0YGiCc7a55wGUrYnIeBD9Fd9+npSJhJvC8aSWCtuw==
X-Received: by 2002:aca:2208:: with SMTP id b8mr6909418oic.87.1633962469058;
        Mon, 11 Oct 2021 07:27:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w203sm1691918oiw.45.2021.10.11.07.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 07:27:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 1/2] hwmon: (dell-smm) Add support for fanX_min,
 fanX_max and fanX_target
To:     Armin Wolf <W_Armin@gmx.de>, pali@kernel.org
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210926221044.14327-1-W_Armin@gmx.de>
 <20210926221044.14327-2-W_Armin@gmx.de>
 <6345229a-6cd2-042e-398b-d57cf45520bf@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <3f746883-c664-2754-6f9e-f79dbc42ca03@roeck-us.net>
Date:   Mon, 11 Oct 2021 07:27:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6345229a-6cd2-042e-398b-d57cf45520bf@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/10/21 2:18 PM, Armin Wolf wrote:
> Am 27.09.21 um 00:10 schrieb W_Armin@gmx.de:
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
>>   Documentation/hwmon/dell-smm-hwmon.rst |  3 ++
>>   drivers/hwmon/dell-smm-hwmon.c         | 61 +++++++++++++++++++++++---
>>   2 files changed, 58 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/hwmon/dell-smm-hwmon.rst b/Documentation/hwmon/dell-smm-hwmon.rst
>> index 3bf77a5df995..beec88491171 100644
>> --- a/Documentation/hwmon/dell-smm-hwmon.rst
>> +++ b/Documentation/hwmon/dell-smm-hwmon.rst
>> @@ -34,6 +34,9 @@ Name                Perm    Description
>>   =============================== ======= =======================================
>>   fan[1-3]_input                  RO      Fan speed in RPM.
>>   fan[1-3]_label                  RO      Fan label.
>> +fan[1-3]_min                    RO      Minimal Fan speed in RPM
>> +fan[1-3]_max                    RO      Maximal Fan speed in RPM
>> +fan[1-3]_target                 RO      Expected Fan speed in RPM
>>   pwm[1-3]                        RW      Control the fan PWM duty-cycle.
>>   pwm1_enable                     WO      Enable or disable automatic BIOS fan
>>                                           control (not supported on all laptops,
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
>> index 774c1b0715d9..476f2a74bd8c 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -76,6 +76,7 @@ struct dell_smm_data {
>>       int temp_type[DELL_SMM_NO_TEMP];
>>       bool fan[DELL_SMM_NO_FANS];
>>       int fan_type[DELL_SMM_NO_FANS];
>> +    int *fan_nominal_speed[DELL_SMM_NO_FANS];
>>   };
>>
>>   MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
>> @@ -673,6 +674,13 @@ static umode_t dell_smm_is_visible(const void *drvdata, enum hwmon_sensor_types
>>               if (data->fan[channel] && !data->disallow_fan_type_call)
>>                   return 0444;
>>
>> +            break;
>> +        case hwmon_fan_min:
>> +        case hwmon_fan_max:
>> +        case hwmon_fan_target:
>> +            if (data->fan_nominal_speed[channel])
>> +                return 0444;
>> +
>>               break;
>>           default:
>>               break;
>> @@ -740,6 +748,25 @@ static int dell_smm_read(struct device *dev, enum hwmon_sensor_types type, u32 a
>>
>>               *val = ret;
>>
>> +            return 0;
>> +        case hwmon_fan_min:
>> +            *val = data->fan_nominal_speed[channel][0];
>> +
>> +            return 0;
>> +        case hwmon_fan_max:
>> +            *val = data->fan_nominal_speed[channel][data->i8k_fan_max];
>> +
>> +            return 0;
>> +        case hwmon_fan_target:
>> +            ret = i8k_get_fan_status(data, channel);
>> +            if (ret < 0)
>> +                return ret;
>> +
>> +            if (ret > data->i8k_fan_max)
>> +                ret = data->i8k_fan_max;
>> +
>> +            *val = data->fan_nominal_speed[channel][ret];
>> +
>>               return 0;
>>           default:
>>               break;
>> @@ -889,9 +916,12 @@ static const struct hwmon_channel_info *dell_smm_info[] = {
>>                  HWMON_T_INPUT | HWMON_T_LABEL
>>                  ),
>>       HWMON_CHANNEL_INFO(fan,
>> -               HWMON_F_INPUT | HWMON_F_LABEL,
>> -               HWMON_F_INPUT | HWMON_F_LABEL,
>> -               HWMON_F_INPUT | HWMON_F_LABEL
>> +               HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
>> +               HWMON_F_TARGET,
>> +               HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
>> +               HWMON_F_TARGET,
>> +               HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
>> +               HWMON_F_TARGET
>>                  ),
>>       HWMON_CHANNEL_INFO(pwm,
>>                  HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>> @@ -910,7 +940,7 @@ static int __init dell_smm_init_hwmon(struct device *dev)
>>   {
>>       struct dell_smm_data *data = dev_get_drvdata(dev);
>>       struct device *dell_smm_hwmon_dev;
>> -    int i, err;
>> +    int i, state, err;
>>
>>       for (i = 0; i < DELL_SMM_NO_TEMP; i++) {
>>           data->temp_type[i] = i8k_get_temp_type(i);
>> @@ -926,8 +956,27 @@ static int __init dell_smm_init_hwmon(struct device *dev)
>>           err = i8k_get_fan_status(data, i);
>>           if (err < 0)
>>               err = i8k_get_fan_type(data, i);
>> -        if (err >= 0)
>> -            data->fan[i] = true;
>> +
>> +        if (err < 0)
>> +            continue;
>> +
>> +        data->fan[i] = true;
>> +        data->fan_nominal_speed[i] = devm_kmalloc_array(dev, data->i8k_fan_max + 1,
>> +                                sizeof(*data->fan_nominal_speed[i]),
>> +                                GFP_KERNEL);
>> +        if (!data->fan_nominal_speed[i])
>> +            continue;
>> +
>> +        for (state = 0; state <= data->i8k_fan_max; state++) {
>> +            err = i8k_get_fan_nominal_speed(data, i, state);
>> +            if (err < 0) {
>> +                /* Mark nominal speed table as invalid in case of error */
>> +                devm_kfree(dev, data->fan_nominal_speed[i]);
>> +                data->fan_nominal_speed[i] = NULL;
>> +                break;
>> +            }
>> +            data->fan_nominal_speed[i][state] = err;
>> +        }
>>       }
>>
>>       dell_smm_hwmon_dev = devm_hwmon_device_register_with_info(dev, "dell_smm", data,
>> -- 
>> 2.20.1
>>
> Are there any problems with this patch? I already tested it on two
> models, is there something
> else i should verify/change?
> 

I am waiting for an Acked-by:/Reviewed-by: from Pali.

Guenter



