Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E31C4321E
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Nov 2022 18:12:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiK3SMj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Nov 2022 13:12:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiK3SMi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Nov 2022 13:12:38 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478F2657C
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 10:12:37 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so2783980pjp.1
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 10:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+yxxovaF5Rrf7ztlABqNCOJeXd/kVJI7IAu8URnud6w=;
        b=HlNsB0vjysuevgUV/NvPZ5C52Wlx5AeGC4tumTuvDwdbrVanvElBG4UJaX1gNpkH5O
         rt4PgMpK4fBOzQUqt2zitJfu6VR76HDh5yaDlT4TUNM9gCNk+xVnqFomd6QQbNvwGvIB
         SH2ZNvXCdzWhepR46MLf+9fwhOxEmffz8YVk4D8yKTIkgYGHmNUpJnfl4O7tBF/B+LpO
         5otPFnyLMlXJTytOnb/MNQ2WI58pweIJW18kDzrSDNtzJYZbqPY8093i/oHEFssg893E
         R+zBuRgawgm0AlMZJnMAEMftVdu7LHBB5v8D/Yc+yluEAQ+lane4RY6FeFZ2MQs/z/XG
         luZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+yxxovaF5Rrf7ztlABqNCOJeXd/kVJI7IAu8URnud6w=;
        b=Z/f1nuFTvSLv3fz/ByM8uQJRQzjacLQWcp5EapXB8gpOI9wHJcsbu+x+WgYvfTitom
         cPfwJpMV2ily3byJ58WwQmu39P6zZt7gf4efb3rCVetUMzN90DLWGkWWHH5Gu4Xdy8+I
         jfefzrKxyTN4IKqbgpY2AOHnM5J8psSi821majbUAqYCC0lhQoWUViWSzWOusJMq7jqn
         ewPlLwKA6faZBN5bCuXrPrLbUlQWIxa6S4l+pTL0PgtVEKx2qpzwm0+bfRgc0FMYgHAk
         3Zo2KbwVCK4rdEj8O5spZ6SsEK+1/vHeIOLyL65+rzNd36oY3898pqA2UzjkjSmF6qXr
         sDCA==
X-Gm-Message-State: ANoB5pnvr63AyCsNMV7132tZs1ati3WYvrfXVDefvctkDqhc/VOACHLj
        yKwa6pq57zswACjPAGC69n2/dA==
X-Google-Smtp-Source: AA0mqf6woT3/sCwqUwYWcMp7MDjkb19scEmzMe2rkXu1KfLHq29d2cK81Uw+ixK6eTeEjCXfOAoQZw==
X-Received: by 2002:a17:903:22c4:b0:171:5092:4d12 with SMTP id y4-20020a17090322c400b0017150924d12mr44204783plg.107.1669831956753;
        Wed, 30 Nov 2022 10:12:36 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id g3-20020aa79f03000000b00565c8634e55sm1685227pfr.135.2022.11.30.10.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 10:12:36 -0800 (PST)
Message-ID: <b6f0a393-0715-1541-631d-5b98c0d7b155@9elements.com>
Date:   Wed, 30 Nov 2022 23:42:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/4] hwmon: (pmbus/core): Add status byte to regulator
 flag map
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>
References: <20221130165833.3478555-1-Naresh.Solanki@9elements.com>
 <20221130180642.GA2656856@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <20221130180642.GA2656856@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 30-11-2022 11:36 pm, Guenter Roeck wrote:
> On Wed, Nov 30, 2022 at 05:58:28PM +0100, Naresh Solanki wrote:
>> Add PMBus status byte to regulator flag map.
>>
>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>>
>> ---
>> Changes:
>> - Remove status input
> 
> Not really.
> 
This was about PMBUS_STATUS_INPUT & not STATUS_BYTE
>> - Add comment for PMBUS status byte.
>> ---
>>   drivers/hwmon/pmbus/pmbus_core.c | 20 +++++++++++---------
>>   1 file changed, 11 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 95e95783972a..a7b4ae0f1f3b 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -2751,7 +2751,16 @@ struct pmbus_regulator_status_category {
>>   };
>>   
>>   static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] = {
>> -	{
>> +	{	/* STATUS byte is always present. */
>> +		.func = -1,
>> +		.reg = PMBUS_STATUS_BYTE,
>> +		.bits = (const struct pmbus_regulator_status_assoc[]) {
>> +			{ PB_STATUS_IOUT_OC,   REGULATOR_ERROR_OVER_CURRENT },
>> +			{ PB_STATUS_VOUT_OV,   REGULATOR_ERROR_REGULATION_OUT },
>> +			{ PB_STATUS_VIN_UV,    REGULATOR_ERROR_UNDER_VOLTAGE },
> 
> Still there.
> 
STATUS_INPUT remove & STATUS_BYTE retained.
>> +			{ },
>> +		},
>> +	}, {
>>   		.func = PMBUS_HAVE_STATUS_VOUT,
>>   		.reg = PMBUS_STATUS_VOUT,
>>   		.bits = (const struct pmbus_regulator_status_assoc[]) {
>> @@ -2768,6 +2777,7 @@ static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] =
>>   			{ PB_IOUT_OC_WARNING,    REGULATOR_ERROR_OVER_CURRENT_WARN },
>>   			{ PB_IOUT_OC_FAULT,      REGULATOR_ERROR_OVER_CURRENT },
>>   			{ PB_IOUT_OC_LV_FAULT,   REGULATOR_ERROR_OVER_CURRENT },
>> +			{ PB_POUT_OP_FAULT,      REGULATOR_ERROR_FAIL },
> 
> Please document your changes in the description. There are two functional
> changes hidden under "Add PMBus status byte to regulator flag map".
> That is inappropriate. Those, as I have pointed out, should be separate
> patches.
My bad. I kept this change in this patch. Will remove this from this patch.
> 
> Guenter
> 
>>   			{ },
>>   		},
>>   	}, {
>> @@ -2834,14 +2844,6 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
>>   		if (status & PB_STATUS_POWER_GOOD_N)
>>   			*flags |= REGULATOR_ERROR_REGULATION_OUT;
>>   	}
>> -	/*
>> -	 * Unlike most other status bits, PB_STATUS_{IOUT_OC,VOUT_OV} are
>> -	 * defined strictly as fault indicators (not warnings).
>> -	 */
>> -	if (status & PB_STATUS_IOUT_OC)
>> -		*flags |= REGULATOR_ERROR_OVER_CURRENT;
>> -	if (status & PB_STATUS_VOUT_OV)
>> -		*flags |= REGULATOR_ERROR_REGULATION_OUT;
>>   
>>   	/*
>>   	 * If we haven't discovered any thermal faults or warnings via
>>
>> base-commit: 9494c53e1389b120ba461899207ac8a3aab2632c
>> -- 
>> 2.37.3
>>

Regards,
Naresh
