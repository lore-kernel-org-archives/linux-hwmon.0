Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939AEC32793
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Jan 2023 14:45:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbjAROpK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 18 Jan 2023 09:45:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbjAROok (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 Jan 2023 09:44:40 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F4C4B1B8
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Jan 2023 06:36:42 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id i1so11277217pfk.3
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Jan 2023 06:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JWzthP/D2z5l/va44q9Ia5nBErmtBzP2A7Ist5l4GHU=;
        b=OP0opohILXPot8ONwXdVRO/YoMYwCsbi4Hc+stuTYn/Ztwzwz9M9vUtJujzs81E2xZ
         C7AMIN1ZYy7rbYhpomHjZ40HrjNyrMQWsvP3ljv49Ji+qJkI7dSFF5lEQNnZcnSO+vd2
         tJD7F7I26h1k0NhM8MGuMl9KcehWHB9stk9nAabs2r+ktl8p/cl6+hm1jacBqV82YRpO
         fLMGiHl0D/McUan+KaRXWF1xTC5FYSb4SamOaIXr45Daawqs33jXcL/ZyOF1WAJlqbbU
         gMW9EXM6IDPq5W3P03MDQjXVJVj4YHLI/rzNNKqqzynoNr+VQCxGhF/6bikaT93nPDhF
         9gyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JWzthP/D2z5l/va44q9Ia5nBErmtBzP2A7Ist5l4GHU=;
        b=rBM/UTNtH4GXutnefK9SDfSfnqDbtpJafhBohbcG82zK19bj7JNMueMnYq2ZhUu3iI
         az0oG7MsQKCNXIlO1B4hx3CxX8z7/K/U2967LOQXAWTsd15G4ZLQA7N6Xxcl68ScoPMz
         4gULeo5a6gGCM43z4BF77Qb/XadvrK+zpCfauthK6mSPhO6QKlUbel0DxgQm8BcDa93M
         Q7F2uuT2UlXC94uoXyvpzxI4z1tkMm8r6wDt3k/kfNcSutAayql9fQZqDfb/fmNuR0R3
         bdTUzYqmtpY69QP+sO/rJKYvs6PmsY6RbixSf/bG1yaBj7w2rs1HglgcS+fwNTH7+r+I
         QYvQ==
X-Gm-Message-State: AFqh2kqktlBAulXsZSglTggctOZOMjsbmPg8kK4MTum4F1+cCg7s5hmP
        +HRGmWnZdwiY15o1yqJ3RQp40A==
X-Google-Smtp-Source: AMrXdXtI8bt5PFOTBzAudB2RXW4tAD0txrTAOg8PV3w/Jr0VTp4tPPRuvAg+f0Lxor0eOwPft+cyfQ==
X-Received: by 2002:a05:6a00:b53:b0:574:a541:574a with SMTP id p19-20020a056a000b5300b00574a541574amr10240619pfo.0.1674052601534;
        Wed, 18 Jan 2023 06:36:41 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id b28-20020aa7951c000000b0056bcb102e7bsm7947403pfp.68.2023.01.18.06.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 06:36:41 -0800 (PST)
Message-ID: <e20695a6-0c48-4131-cf7d-111f727f07e6@9elements.com>
Date:   Wed, 18 Jan 2023 20:06:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] hwmon: (pmbus/core): Generalize pmbus status flag map
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230118111536.3276540-1-Naresh.Solanki@9elements.com>
 <f9a47a1a-dcce-87e1-be4e-4f62f8e60c78@roeck-us.net>
Content-Language: en-US
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <f9a47a1a-dcce-87e1-be4e-4f62f8e60c78@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On 18-01-2023 07:13 pm, Guenter Roeck wrote:
> On 1/18/23 03:15, Naresh Solanki wrote:
>> Move the PMBus status flag map (pmbus_regulator_status_flag_map)
>> outside of the regulator #if block and update the associated
>> variable/struct name to reflect a generic PMBus status. Also retain
>> the regulator error flag for use in determining regulator specific error.
>>
>> This will make the PMBus status flag map more versatile and easier to
>> incorporate into different contexts and functions.
>>
>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> 
> Sorry, I don't see the point of moving a structure including
> regulator error codes outside regulator code.
I'm working on adding pmbus irq handler.
Since irq handler is regulator independent, this change is needed.

Naresh
> 
> Guenter
> 
>> ---
>>   drivers/hwmon/pmbus/pmbus_core.c | 94 ++++++++++++++++----------------
>>   1 file changed, 47 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c 
>> b/drivers/hwmon/pmbus/pmbus_core.c
>> index 95e95783972a..1b70cf3be313 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -2692,6 +2692,49 @@ static int pmbus_init_common(struct i2c_client 
>> *client, struct pmbus_data *data,
>>       return 0;
>>   }
>> +/* A PMBus status flag and the corresponding REGULATOR_ERROR_* flag */
>> +struct pmbus_status_assoc {
>> +    int pflag, rflag;
>> +};
>> +
>> +/* PMBus->regulator bit mappings for a PMBus status register */
>> +struct pmbus_status_category {
>> +    int func;
>> +    int reg;
>> +    const struct pmbus_status_assoc *bits; /* zero-terminated */
>> +};
>> +
>> +static const struct pmbus_status_category __maybe_unused 
>> pmbus_status_flag_map[] = {
>> +    {
>> +        .func = PMBUS_HAVE_STATUS_VOUT,
>> +        .reg = PMBUS_STATUS_VOUT,
>> +        .bits = (const struct pmbus_status_assoc[]) {
>> +            { PB_VOLTAGE_UV_WARNING, 
>> REGULATOR_ERROR_UNDER_VOLTAGE_WARN },
>> +            { PB_VOLTAGE_UV_FAULT,   REGULATOR_ERROR_UNDER_VOLTAGE },
>> +            { PB_VOLTAGE_OV_WARNING, 
>> REGULATOR_ERROR_OVER_VOLTAGE_WARN },
>> +            { PB_VOLTAGE_OV_FAULT,   REGULATOR_ERROR_REGULATION_OUT },
>> +            { },
>> +        },
>> +    }, {
>> +        .func = PMBUS_HAVE_STATUS_IOUT,
>> +        .reg = PMBUS_STATUS_IOUT,
>> +        .bits = (const struct pmbus_status_assoc[]) {
>> +            { PB_IOUT_OC_WARNING,    
>> REGULATOR_ERROR_OVER_CURRENT_WARN },
>> +            { PB_IOUT_OC_FAULT,      REGULATOR_ERROR_OVER_CURRENT },
>> +            { PB_IOUT_OC_LV_FAULT,   REGULATOR_ERROR_OVER_CURRENT },
>> +            { },
>> +        },
>> +    }, {
>> +        .func = PMBUS_HAVE_STATUS_TEMP,
>> +        .reg = PMBUS_STATUS_TEMPERATURE,
>> +        .bits = (const struct pmbus_status_assoc[]) {
>> +            { PB_TEMP_OT_WARNING,    REGULATOR_ERROR_OVER_TEMP_WARN },
>> +            { PB_TEMP_OT_FAULT,      REGULATOR_ERROR_OVER_TEMP },
>> +            { },
>> +        },
>> +    },
>> +};
>> +
>>   #if IS_ENABLED(CONFIG_REGULATOR)
>>   static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
>>   {
>> @@ -2738,54 +2781,11 @@ static int pmbus_regulator_disable(struct 
>> regulator_dev *rdev)
>>       return _pmbus_regulator_on_off(rdev, 0);
>>   }
>> -/* A PMBus status flag and the corresponding REGULATOR_ERROR_* flag */
>> -struct pmbus_regulator_status_assoc {
>> -    int pflag, rflag;
>> -};
>> -
>> -/* PMBus->regulator bit mappings for a PMBus status register */
>> -struct pmbus_regulator_status_category {
>> -    int func;
>> -    int reg;
>> -    const struct pmbus_regulator_status_assoc *bits; /* 
>> zero-terminated */
>> -};
>> -
>> -static const struct pmbus_regulator_status_category 
>> pmbus_regulator_flag_map[] = {
>> -    {
>> -        .func = PMBUS_HAVE_STATUS_VOUT,
>> -        .reg = PMBUS_STATUS_VOUT,
>> -        .bits = (const struct pmbus_regulator_status_assoc[]) {
>> -            { PB_VOLTAGE_UV_WARNING, 
>> REGULATOR_ERROR_UNDER_VOLTAGE_WARN },
>> -            { PB_VOLTAGE_UV_FAULT,   REGULATOR_ERROR_UNDER_VOLTAGE },
>> -            { PB_VOLTAGE_OV_WARNING, 
>> REGULATOR_ERROR_OVER_VOLTAGE_WARN },
>> -            { PB_VOLTAGE_OV_FAULT,   REGULATOR_ERROR_REGULATION_OUT },
>> -            { },
>> -        },
>> -    }, {
>> -        .func = PMBUS_HAVE_STATUS_IOUT,
>> -        .reg = PMBUS_STATUS_IOUT,
>> -        .bits = (const struct pmbus_regulator_status_assoc[]) {
>> -            { PB_IOUT_OC_WARNING,    
>> REGULATOR_ERROR_OVER_CURRENT_WARN },
>> -            { PB_IOUT_OC_FAULT,      REGULATOR_ERROR_OVER_CURRENT },
>> -            { PB_IOUT_OC_LV_FAULT,   REGULATOR_ERROR_OVER_CURRENT },
>> -            { },
>> -        },
>> -    }, {
>> -        .func = PMBUS_HAVE_STATUS_TEMP,
>> -        .reg = PMBUS_STATUS_TEMPERATURE,
>> -        .bits = (const struct pmbus_regulator_status_assoc[]) {
>> -            { PB_TEMP_OT_WARNING,    REGULATOR_ERROR_OVER_TEMP_WARN },
>> -            { PB_TEMP_OT_FAULT,      REGULATOR_ERROR_OVER_TEMP },
>> -            { },
>> -        },
>> -    },
>> -};
>> -
>>   static int pmbus_regulator_get_error_flags(struct regulator_dev 
>> *rdev, unsigned int *flags)
>>   {
>>       int i, status;
>> -    const struct pmbus_regulator_status_category *cat;
>> -    const struct pmbus_regulator_status_assoc *bit;
>> +    const struct pmbus_status_category *cat;
>> +    const struct pmbus_status_assoc *bit;
>>       struct device *dev = rdev_get_dev(rdev);
>>       struct i2c_client *client = to_i2c_client(dev->parent);
>>       struct pmbus_data *data = i2c_get_clientdata(client);
>> @@ -2796,8 +2796,8 @@ static int 
>> pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
>>       mutex_lock(&data->update_lock);
>> -    for (i = 0; i < ARRAY_SIZE(pmbus_regulator_flag_map); i++) {
>> -        cat = &pmbus_regulator_flag_map[i];
>> +    for (i = 0; i < ARRAY_SIZE(pmbus_status_flag_map); i++) {
>> +        cat = &pmbus_status_flag_map[i];
>>           if (!(func & cat->func))
>>               continue;
>>
>> base-commit: 774dccfe77dcd8cf1d82df1f61fe95a720dc76e4
> 
