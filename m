Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE94DC4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Nov 2022 15:04:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242021AbiKRPEc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Nov 2022 10:04:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241539AbiKRPDm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Nov 2022 10:03:42 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F8B13EB5
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Nov 2022 07:02:29 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d192so5139946pfd.0
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Nov 2022 07:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kk3s4cJIP4yR/HOAGg+JwbtRRow3lmC/HM1ULj/0+DQ=;
        b=hdTJFix9WQoRhEfrUOynslIY32DPw7ZiyD6vODDUaBdQFK/odSdP+NYZPor9OwDOUx
         PkhwoO0bxZp9MmYbPEc0jqzwFZiZQdexrLKtcLAIBomzu1UOsaz6Ib4RLoqrKvZFVFSh
         af5ZigDWOJvi4luu+n77BTNF1YrH+CtGx/VWiM68LVg+wfta0NaZK0ycZfsjQuOwkj9O
         UP7iYqRrxoXZMQ+RJ2/+Z8QtRw1rNO0FTiDoaO9eblphxK7q9ORoi6Ovrj0VAkLfENHE
         KMeMQVkNwoPadAU8jJckNFmd1SnThxyhZNH+AsWwb47ZM34OCqpYlvUv3xCap+8Nbb5u
         uYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kk3s4cJIP4yR/HOAGg+JwbtRRow3lmC/HM1ULj/0+DQ=;
        b=tdrGexlcBb2q8N1LdEUj872K4+b1Vq7ZhBArzcIVkBgxvnfgPrTAwenA5qfx758VmP
         u0lULneUexKgNmuqyxZv/g5Qh34YsD4sG5aOu3N4DWlHJ2gGe87Dvosru/tN1mvQXCUR
         hVwwqlnMnFwpwPOao0TWOZomaA8UNko23x4yNVRmtvSN/Nu5kuKK1YkEanFRFmM4/cIC
         pMdWgppb0DXolecN4aGUSoAQCnWksNZS33IkxhYaeu6whJX9li3Q5GXIH+lL3UJI8bVc
         znICZuh31hCi6Y/BV6nqFpqPICIrqPCqTLvefjXGf8KPRe5bHJM//+yaAHTGlYN4Ivi1
         MD0g==
X-Gm-Message-State: ANoB5pkyfpFOEdhMV9s5M769FEdpg/l2gMFx2ULGAuYswtvbxK7Ho45/
        mC9g8toGtqLhJxR7/doS3nATGDp033HIJ5e2
X-Google-Smtp-Source: AA0mqf7q3qawacJbTY2YymxYAipmO6GN5ivKFIum52F3uAjsuJjtmu31wec36ATUJsaVvxTQnBi6oA==
X-Received: by 2002:a63:f808:0:b0:426:9c23:97da with SMTP id n8-20020a63f808000000b004269c2397damr7363826pgh.2.1668783748998;
        Fri, 18 Nov 2022 07:02:28 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id f1-20020a170902ce8100b0017f592a7eccsm3730949plg.298.2022.11.18.07.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 07:02:28 -0800 (PST)
Message-ID: <0fb5b5e4-ac23-01c9-a4c7-356db9ab0763@9elements.com>
Date:   Fri, 18 Nov 2022 20:32:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] hwmon: pm_bus: core: Implement regulator get_status
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org
References: <20221118084637.1973838-1-Naresh.Solanki@9elements.com>
 <20221118121049.GB3670981@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <20221118121049.GB3670981@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On 18-11-2022 05:40 pm, Guenter Roeck wrote:
> On Fri, Nov 18, 2022 at 09:46:36AM +0100, Naresh Solanki wrote:
>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>
>> Add get_status for pmbus_regulator_ops.
>>
>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>> ---
> 
> Please provide change logs.
Sure
> 
>>   drivers/hwmon/pmbus/pmbus_core.c | 72 ++++++++++++++++++++++++++++++++
>>   1 file changed, 72 insertions(+)
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 7ec04934747e..5dde345c7679 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -2851,6 +2851,77 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
>>   	return 0;
>>   }
>>   
>> +static int pmbus_regulator_get_status(struct regulator_dev *rdev)
>> +{
>> +	struct device *dev = rdev_get_dev(rdev);
>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>> +	struct pmbus_data *data = i2c_get_clientdata(client);
>> +	u8 page = rdev_get_id(rdev);
>> +	int status, status2;
>> +
>> +	mutex_lock(&data->update_lock);
>> +	status = pmbus_get_status(client, page, PMBUS_STATUS_WORD);
>> +	mutex_unlock(&data->update_lock);
> 
> I do not see the point of this lock here and elsewhere in this function.
> If you want to ensure that the status is consistent, you would need to
> hold the lock over the entire function, not repeatedly acquire and release
> it. Even then there would be no guarantee that the status is consistent
> because it can change anytime on the chip side.
Will hold the lock till end of function. Agree that chip side, status 
may change any moment.

With this I got a question i.e., what should regulator status be 
reported if regulator had previously encountered some fault but 
currently while reading the status found that pgood bit indicate output 
power is good.
Should we continue to still report historical fault or instead report 
current regulator output status based on pgood ?

IMHO, it should report regulator status as ON if pgood bit is 
clear(i.e., output is good) & leave previously encountered error 
reporting to get_error_flag function.

I need your Suggestion here.

> 
>> +	if (status < 0)
>> +		return status;
>> +
>> +	if (status & (PB_STATUS_VIN_UV | PB_STATUS_IOUT_OC | PB_STATUS_VOUT_OV |
>> +	    PB_STATUS_UNKNOWN))
> 
> Please align continuation lines with the matching '('.
> 
Sure.
>> +		return REGULATOR_STATUS_ERROR;
>> +
>> +	if (status & (PB_STATUS_OFF | PB_STATUS_POWER_GOOD_N))
>> +		return REGULATOR_STATUS_OFF;
>> +
>> +	if (status & PB_STATUS_VOUT &&
>> +	    data->info->func[page] & PMBUS_HAVE_STATUS_VOUT) {
>> +		mutex_lock(&data->update_lock);
>> +		status2 = _pmbus_read_byte_data(client, page,
>> +					 PMBUS_STATUS_VOUT);
>> +		mutex_unlock(&data->update_lock);
>> +		if (status2 < 0)
>> +			return status2;
>> +		if (status2 & (PB_VOLTAGE_OV_FAULT | PB_VOLTAGE_UV_FAULT))
>> +			return REGULATOR_STATUS_ERROR;
>> +	}
>> +	if (status & PB_STATUS_IOUT_POUT &&
>> +	    data->info->func[page] & PMBUS_HAVE_STATUS_IOUT) {
>> +		mutex_lock(&data->update_lock);
>> +		status2 = _pmbus_read_byte_data(client, page,
>> +						 PMBUS_STATUS_IOUT);
> 
> Ok to avoid continuation lines as long as the result has less then 100
> columns.
> 
Sure
>> +		mutex_unlock(&data->update_lock);
>> +		if (status2 < 0)
>> +			return status2;
>> +		if (status2 & (PB_POUT_OP_FAULT | PB_IOUT_UC_FAULT |
>> +		    PB_IOUT_OC_LV_FAULT | PB_IOUT_OC_FAULT))
>> +			return REGULATOR_STATUS_ERROR;
>> +	}
>> +	if (status & PB_STATUS_INPUT &&
>> +	    data->info->func[page] & PMBUS_HAVE_STATUS_INPUT) {
>> +		mutex_lock(&data->update_lock);
>> +		status2 = _pmbus_read_byte_data(client, page,
>> +						 PMBUS_STATUS_INPUT);
>> +		mutex_unlock(&data->update_lock);
>> +		if (status2 < 0)
>> +			return status2;
>> +		if (status2 & (PB_IIN_OC_FAULT | PB_VOLTAGE_OV_FAULT |
>> +		    PB_VOLTAGE_UV_FAULT))
>> +			return REGULATOR_STATUS_ERROR;
>> +	}
>> +	if (status & PB_STATUS_TEMPERATURE &&
>> +	    data->info->func[page] & PMBUS_HAVE_STATUS_TEMP) {
>> +		mutex_lock(&data->update_lock);
>> +		status2 = _pmbus_read_byte_data(client, page,
>> +						 PMBUS_STATUS_TEMPERATURE);
>> +		mutex_unlock(&data->update_lock);
>> +		if (status2 < 0)
>> +			return status2;
>> +		if (status2 & (PB_TEMP_UT_FAULT | PB_TEMP_OT_FAULT))
>> +			return REGULATOR_STATUS_ERROR;
>> +	}
>> +
>> +	return REGULATOR_STATUS_ON;
>> +}
>> +
>>   static int pmbus_regulator_get_low_margin(struct i2c_client *client, int page)
>>   {
>>   	struct pmbus_data *data = i2c_get_clientdata(client);
>> @@ -2991,6 +3062,7 @@ const struct regulator_ops pmbus_regulator_ops = {
>>   	.disable = pmbus_regulator_disable,
>>   	.is_enabled = pmbus_regulator_is_enabled,
>>   	.get_error_flags = pmbus_regulator_get_error_flags,
>> +	.get_status = pmbus_regulator_get_status,
>>   	.get_voltage = pmbus_regulator_get_voltage,
>>   	.set_voltage = pmbus_regulator_set_voltage,
>>   	.list_voltage = pmbus_regulator_list_voltage,
>>
>> base-commit: 27fea302952d8c90cafbdbee96bafeca03544401
>> -- 
>> 2.37.3
>>
