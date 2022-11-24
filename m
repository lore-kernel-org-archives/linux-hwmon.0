Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358E9C43219
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Nov 2022 19:37:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiKXThB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Nov 2022 14:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiKXTg7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Nov 2022 14:36:59 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFEC1827EB
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Nov 2022 11:36:57 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so5857307pjc.3
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Nov 2022 11:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ychMJ5CecOOaqTuUXxUfl245iKKvBb99gKZkBpHBZLI=;
        b=JLQeuWSc8UUiNVIXg7ORcPhQkOkHQIa4AsIv5vBsGwMw2haJMzFfq8PF5aVZQjDh3f
         KvA2bkNWoDbBuHFBVI/PCnP3eZd2th0R8SbzfrP8HBVTAcGZ4phd94O0EXKyJ9JhEUl0
         hOuQvq8Wo4vl0m/G+Sp4QWug3TJUClsYAqaPhkusimXijEaqw0UN5hTm0UketZtrfvnh
         /yXtc/GtGrbIaQFdlaZ1blhKIrnHa22KOYWsgPF7qn5Rib9tjairWEJCcg2R1FXYI72h
         +6VNVGU/EY4Sj11E9Zi5sp9QPEJ/PsmlcdsrVqFFFWmZP6EixA7+X4YyB2Tup3mvSdyT
         rYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ychMJ5CecOOaqTuUXxUfl245iKKvBb99gKZkBpHBZLI=;
        b=nojUNpaYKumKyvStgVWaIZmgPqmQmFq0OfIAfr4sTMHSR1jkSQm6XaBU3tt0+thalL
         tjf7+Uz076ufqKk1zUIrqpndV5OLbP6L/lnaO0hPisYqwa9i6XGL46/HJ3wvwqaCJ9/1
         tHEoiQp5RB+tztNd7BIl296vDgBcx8dd1y8Gk3jh6u+ORLpHSYL1cAHyVXU/msaQF7sh
         /PP3+BlKyzlLAPr+ye4iQ6aTV+qVhdw1GUDUqHfI/SMuCox+gKujT0XPj4zFr/vWM2wo
         hYbIVpSaaaqcKYO3qtEwSCKFB6zkLLuL1AX0kLaOZLfI4KiqQrcWOTO3imlW0kofkjo/
         GMzQ==
X-Gm-Message-State: ANoB5pkinDAogKvdgdGMGkKrz5sX25bD4oqwDxKWcek43qXXM7t0XbGZ
        GCY/1FddVMeZMb+8NqL43KLA7A==
X-Google-Smtp-Source: AA0mqf51i9RZr2KyDoWTd1hQmf02KFmQODY/3CRDe4e7xu+BYqng65nHD9Xx4/W6YtlbGGKQKiAWxg==
X-Received: by 2002:a17:90a:ad47:b0:218:cad8:acef with SMTP id w7-20020a17090aad4700b00218cad8acefmr15557582pjv.161.1669318617288;
        Thu, 24 Nov 2022 11:36:57 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id n5-20020a63f805000000b0046f1cbd2631sm1371247pgh.50.2022.11.24.11.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 11:36:56 -0800 (PST)
Message-ID: <44501c19-8067-5588-b3d9-e13359af6562@9elements.com>
Date:   Fri, 25 Nov 2022 01:06:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5] hwmon: (pmbus/core): Implement regulator get_status
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org
References: <20221124083439.3840025-1-Naresh.Solanki@9elements.com>
 <1fcf36d3-0579-3e23-2613-61f523bcb046@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <1fcf36d3-0579-3e23-2613-61f523bcb046@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 24-11-2022 07:48 pm, Guenter Roeck wrote:
> On 11/24/22 00:34, Naresh Solanki wrote:
>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>
>> Add get_status for pmbus_regulator_ops.
>>
>> ---
>> Changes:
>> - use lock throughout the function
>> - Avoid line continuation upto 100 column
>> - Optimize use of & and | operator
>> - Check for VOUT, IOUT, TEMPERATURE bit in status word before checking
>>    respective status register for fault.
>> - Report regulator current status.
>> - Utilize get_error_flag to check for regulator errors.
>> - Check for return value of function get_error_flag
>>
>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>> ---
>>   drivers/hwmon/pmbus/pmbus_core.c | 44 ++++++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c 
>> b/drivers/hwmon/pmbus/pmbus_core.c
>> index 20ca26e19db7..0b13214c662f 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -2855,6 +2855,49 @@ static int 
>> pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
>>       return 0;
>>   }
>> +static int pmbus_regulator_get_status(struct regulator_dev *rdev)
>> +{
>> +    struct device *dev = rdev_get_dev(rdev);
>> +    struct i2c_client *client = to_i2c_client(dev->parent);
>> +    struct pmbus_data *data = i2c_get_clientdata(client);
>> +    u8 page = rdev_get_id(rdev);
>> +    int status, ret;
>> +
>> +    mutex_lock(&data->update_lock);
>> +    status = pmbus_get_status(client, page, PMBUS_STATUS_WORD);
>> +    if (status < 0) {
>> +        ret = status;
>> +        goto unlock;
>> +    }
>> +
>> +    if (status & PB_STATUS_OFF) {
>> +        ret = REGULATOR_STATUS_OFF;
>> +        goto unlock;
>> +    }
>> +
>> +    /* If regulator is ON & reports power good then return ON */
>> +    if (!(status & PB_STATUS_POWER_GOOD_N)) {
>> +        ret = REGULATOR_STATUS_ON;
>> +        goto unlock;
>> +    }
>> +
>> +    if (rdev->desc->ops->get_error_flags) {
> 
> Looking into this again, why is this check necessary ? Isn't this
> the regulator_ops from below ? Also, why not just call
> pmbus_regulator_get_error_flags() directly ?
Yes. Felt that to be the right way.
Will update to do pmbus_regulator_get)error_flags directly
> 
>> +        ret = rdev->desc->ops->get_error_flags(rdev, &status);
>> +        if (ret)
>> +            goto unlock;
>> +
>> +        if (status & (REGULATOR_ERROR_UNDER_VOLTAGE | 
>> REGULATOR_ERROR_OVER_CURRENT |
>> +           REGULATOR_ERROR_REGULATION_OUT | REGULATOR_ERROR_FAIL |
>> +           REGULATOR_ERROR_OVER_TEMP))
>> +            ret = REGULATOR_STATUS_ERROR;
> 
> If the condition above is false, the return value will be 0, or
> REGULATOR_STATUS_OFF. Is that intentional ?
No. It should be REGULATOR_ERR_UNDEFINED. will fix in next revision.
> 
>> +    } else
>> +        ret = REGULATOR_STATUS_UNDEFINED;
>> +
> 
> CHECK: braces {} should be used on all arms of this statement
> #72: FILE: drivers/hwmon/pmbus/pmbus_core.c:2884:
> +    if (rdev->desc->ops->get_error_flags) {
> [...]
> +    } else
> 
> Guenter
> 
>> +unlock:
>> +    mutex_unlock(&data->update_lock);
>> +    return ret;
>> +}
>> +
>>   static int pmbus_regulator_get_low_margin(struct i2c_client *client, 
>> int page)
>>   {
>>       struct pmbus_data *data = i2c_get_clientdata(client);
>> @@ -2995,6 +3038,7 @@ const struct regulator_ops pmbus_regulator_ops = {
>>       .disable = pmbus_regulator_disable,
>>       .is_enabled = pmbus_regulator_is_enabled,
>>       .get_error_flags = pmbus_regulator_get_error_flags,
>> +    .get_status = pmbus_regulator_get_status,
>>       .get_voltage = pmbus_regulator_get_voltage,
>>       .set_voltage = pmbus_regulator_set_voltage,
>>       .list_voltage = pmbus_regulator_list_voltage,
>>
>> base-commit: 2c71b3246ec3246522e8cb7c8191dc7a5d62cc70
> 

Regards,
Naresh
