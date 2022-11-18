Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925ECC433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Nov 2022 08:48:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241585AbiKRIsX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Nov 2022 03:48:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241586AbiKRIsE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Nov 2022 03:48:04 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A1590389
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Nov 2022 00:47:07 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id k15so4291980pfg.2
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Nov 2022 00:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BTr9RLJZCU+iZbH2jfaUHLO2ECEQ589FOHcKYojS/kw=;
        b=FCMndVTtjX7tpp5v6UaY6uiRtMdjKr/uK8Pb33hCrC1/z4eHXbbpM7NXTgvneXKRWa
         VyqpLKIu4kv5z6K+Ga1xRU3+8hz4jpa3xvtACL9HNj0wk/LrJHccrX99iZYf0HRkH5Pu
         77sn0WeVIjZjRMsRJ7YDGKTn2pZNXJRZP3XVrkYYrG8zL7Me6O+7fTTsZMZ2/HT0g60m
         asOs2tsCB3hmNmo26e7fuaTT0wR4fJ0Y0I4L5R6JCFWiWvb8fOK8cbyER7Fk1IMe0pkQ
         2cg+5Ymd7TaPMPUtX5Nls9OvEPPDEw/qM3VTH48uhUAo5Sx68naC7/+0HRsEFpkz3DpM
         KUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTr9RLJZCU+iZbH2jfaUHLO2ECEQ589FOHcKYojS/kw=;
        b=WS/vg5iGUH0vpy+o/rX5X9NIDT7LVa4RIGMOe5Jgt9pVSX9uYbLpDE63bDaDQz5mq5
         Rz8QbLViT1cWKfA0uMHBWQSsmHwE/UYAQYt9Ti4DphZ0+wgcr1dQQvimolCXMengv8PC
         XnDY9C1o1yCEe/zxgYPdvkYl3DseDoto644x35/CwGIS009lDmAp15OpRJ2FIj0vfwW3
         uc9ZDyst8zw6qydBy22rFcAdEdVv3ibzGJoJLawEJC6cdozzwjT8cYJsZM8HpEY8kqCt
         eDWvwVKMRlQZQEpJZS2p2XU6jeAn1ZZvNKhj/ixV++rWDfP5F4H1Ctxr6bIRPU5YlFRR
         xJ0A==
X-Gm-Message-State: ANoB5plcMynMOYTjF20rwJ8uFoklTPJZYWYpWKITvPy55iiEdHZLK9LO
        teElXLf+G2Aip7wol3gVtECpAA==
X-Google-Smtp-Source: AA0mqf4IMqeGo9H9ZInGWaaif276tmbM5qcGv2tH90xrijw6AdI8ne/V/cCKUI76NGEBnobN22PI4g==
X-Received: by 2002:a63:4f4c:0:b0:45c:562f:b2b9 with SMTP id p12-20020a634f4c000000b0045c562fb2b9mr5665489pgl.245.1668761226539;
        Fri, 18 Nov 2022 00:47:06 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id ij28-20020a170902ab5c00b00188ffe7f6a1sm846746plb.190.2022.11.18.00.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 00:47:06 -0800 (PST)
Message-ID: <ccfa3067-302f-56a9-cbf7-6ba14350718a@9elements.com>
Date:   Fri, 18 Nov 2022 14:17:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] hwmon: pm_bus: core: Implement regulator get_status
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org
References: <20221117194352.1904264-1-Naresh.Solanki@9elements.com>
 <20221117223856.GA675221@roeck-us.net>
Content-Language: en-US
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <20221117223856.GA675221@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On 18-11-2022 04:08 am, Guenter Roeck wrote:
> On Thu, Nov 17, 2022 at 08:43:51PM +0100, Naresh Solanki wrote:
>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>
>> Add get_status for pmbus_regulator_ops.
>>
>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>> ---
>>   drivers/hwmon/pmbus/pmbus_core.c | 78 ++++++++++++++++++++++++++++++++
>>   1 file changed, 78 insertions(+)
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 7ec04934747e..d5e2b0662da5 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -2851,6 +2851,83 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
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
>> +	if (status < 0)
>> +		 return status;
>> +
>> +	if (status & PB_STATUS_VIN_UV ||
>> +	    status & PB_STATUS_IOUT_OC ||
>> +	    status & PB_STATUS_VOUT_OV ||
>> +	    status & PB_STATUS_UNKNOWN)
>> +		 return REGULATOR_STATUS_ERROR;
> 
> 	if (status & (PB_STATUS_VIN_UV | PB_STATUS_IOUT_OC | ...))
> 
> PB_STATUS_UNKNOWN can mean anything and doesn't necessarily indicate
> an error. Not sure if it makes sense to report that as error.
I wasn't sure about this but as per spec, it still means unknown fault 
or warning. Thats why I've considered it for returning error status.
> 
>> +
>> +	if (status & PB_STATUS_VOUT_OV &&
> 
> PB_STATUS_VOUT_OV was checked above already, and the code won't get here
> if the bit is set.
Oh yes. Will change to PB_STATUS_VOUT so that other VOUT faults can be 
checked.
> 
>> +	    data->info->func[page] & PMBUS_HAVE_STATUS_VOUT) {
>> +		 mutex_lock(&data->update_lock);
>> +		 status2 = _pmbus_read_byte_data(client, page, PMBUS_STATUS_VOUT);
>> +		 mutex_unlock(&data->update_lock);
>> +		 if (status2 < 0)
>> +			  return status2;
>> +		 if (status2 & PB_VOLTAGE_OV_FAULT ||
>> +		     status2 & PB_VOLTAGE_UV_FAULT)
> 
> 		if (status2 & (...))
> 
Sure will update this way.
>> +			  return REGULATOR_STATUS_ERROR;
>> +	}
>> +	if (status & PB_STATUS_IOUT_OC &&
> 
> Same as above - this condition will never be true.
> 
Will change to PB_STATUS_IOUT_POUT so that STATUS_IOUT can be checked 
for other faults related to POUT & IOUT which aren't present in STATUS_WORD.
>> +	    data->info->func[page] & PMBUS_HAVE_STATUS_IOUT) {
>> +		 mutex_lock(&data->update_lock);
>> +		 status2 = _pmbus_read_byte_data(client, page, PMBUS_STATUS_IOUT);
>> +		 mutex_unlock(&data->update_lock);
>> +		 if (status2 < 0)
>> +			  return status2;
>> +		 if (status2 & PB_POUT_OP_FAULT ||
>> +		     status2 & PB_IOUT_UC_FAULT ||
>> +		     status2 & PB_IOUT_OC_LV_FAULT ||
>> +		     status2 & PB_IOUT_OC_FAULT)
> 
> 		if (status2 & (...))
> 
Will update accordingly.
>> +			  return REGULATOR_STATUS_ERROR;
>> +	}
>> +	if (status & PB_STATUS_VIN_UV &&
> 
> and again.
> 
Will update to PB_STATUS_INPUT.
>> +	    data->info->func[page] & PMBUS_HAVE_STATUS_INPUT) {
>> +		 mutex_lock(&data->update_lock);
>> +		 status2 = _pmbus_read_byte_data(client, page, PMBUS_STATUS_INPUT);
>> +		 mutex_unlock(&data->update_lock);
>> +		 if (status2 < 0)
>> +			  return status2;
>> +		 if (status2 & PB_IIN_OC_FAULT ||
>> +		     status2 & PB_VOLTAGE_OV_FAULT ||
>> +		     status2 & PB_VOLTAGE_UV_FAULT)
> 
> and again
> 
Will update to right way.
>> +			  return REGULATOR_STATUS_ERROR;
>> +	}
>> +	if (status & PB_STATUS_TEMPERATURE &&
>> +	    data->info->func[page] & PMBUS_HAVE_STATUS_TEMP) {
>> +		 mutex_lock(&data->update_lock);
>> +		 status2 = _pmbus_read_byte_data(client, page, PMBUS_STATUS_TEMPERATURE);
>> +		 mutex_unlock(&data->update_lock);
>> +		 if (status2 < 0)
>> +			  return status2;
>> +		 if (status2 & PB_TEMP_UT_FAULT ||
>> +		     status2 & PB_TEMP_OT_FAULT)
> 
> and again
> 
Will update.
>> +			  return REGULATOR_STATUS_ERROR;
>> +	}
>> +
>> +	if (status & PB_STATUS_OFF)
>> +		 return REGULATOR_STATUS_OFF;
>> +
>> +	if (status & PB_STATUS_POWER_GOOD_N)
>> +		 return REGULATOR_STATUS_OFF;
> 
> Wouldn't it be better to check those bits first ?
> Also, it should be
> 
> 	if (status & (PB_STATUS_OFF | PB_STATUS_POWER_GOOD_N))
> 
Yes makes sense. Will update.
>> +
>> +	return REGULATOR_STATUS_ON;
>> +}
>> +
>>   static int pmbus_regulator_get_low_margin(struct i2c_client *client, int page)
>>   {
>>   	struct pmbus_data *data = i2c_get_clientdata(client);
>> @@ -2991,6 +3068,7 @@ const struct regulator_ops pmbus_regulator_ops = {
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
Regards,
Naresh
