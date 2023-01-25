Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FE9C54E94
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Jan 2023 14:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235395AbjAYOsd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Jan 2023 09:48:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235300AbjAYOsc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2023 09:48:32 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0B349967
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Jan 2023 06:48:31 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id nn18-20020a17090b38d200b0022bfb584987so2221459pjb.2
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Jan 2023 06:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3HH78zHkfuQVaviQLAC5Vdg63en+Z2ew1XbLuKcJbA=;
        b=fGzm4zJAIRCuccjELLHu0v0C6Bf9+4bl+DlQoqVNFjZuwsEdMlH+XsoFt0mvTjKe0P
         ABSkgKCQmE2ea3/1M0PYBzDTkqL9TN++x8mxk66+quEO7H5BJyWuHkLs7TEH88CZDwIN
         OMPUfWktdj90vC8VgTGWdMZFbo/77fluKJ31gH6CaUq47Vu6MODk95nsnbH3HhbOUvx4
         K8ae5gIxoOaw1p4zlBHomP+Q2zM2suPjatFenK5vBLeChonIlmTsif6E8jwFypiCJFbE
         x1q+izuiFMx7gneoD1ALw7hpIzR0h74WDzYBYAk5aR5NELk01WbfneBy6fywKP1mKDEB
         A4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3HH78zHkfuQVaviQLAC5Vdg63en+Z2ew1XbLuKcJbA=;
        b=xNbwOvB7x9iYVkh5UpO5p2mElgHbAfPsIdBjjU8jJyCx1KwivKnweNTzp/rRlASUAf
         1vwhQ7+Q4vj/dgP72zoNJGTB+9ZWXvkwVhyNqx2/Ofx6/bjoZOb4zKfyYmVGC87m6Tmi
         /BxMhWS+FUyFWlOzOXm/Gesqsueg4zdSFj1tVtY5jEmqO7AAutD4XHJ2BZhOHVtI+Fdi
         VCLHDFVDnnoau2mOhYhy4MS7iaP6upl1VTAkqKFcbFSbhTKnUqyWkYhbPNj6+v9pvFtW
         ZTjSRbJtBUiQ572r1uAz/VSbfARLjqsMqqPpaQy2OV3DfGUDFugDm61QBUFa3+uEnDa9
         lM0w==
X-Gm-Message-State: AFqh2kr3Y4rnjP6wtsJltYFKJp117V35+RQgaCsyrULeSh/jVU8qZ58j
        V+5m/03vO6KJAxAroqAbJpOR5w==
X-Google-Smtp-Source: AMrXdXta1TFhZ+T/65cvZ/iNRUvhazI5yAhpQwi/gDTUuYZkLSSbbT6oe1Xq34+2sBpiRZtmT+VIqw==
X-Received: by 2002:a17:903:22c1:b0:194:a662:259 with SMTP id y1-20020a17090322c100b00194a6620259mr40545660plg.63.1674658110742;
        Wed, 25 Jan 2023 06:48:30 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id iw4-20020a170903044400b001960735c652sm3742865plb.169.2023.01.25.06.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 06:48:30 -0800 (PST)
Message-ID: <59982fd2-fe5b-bd7d-40fd-0fba7de6687c@9elements.com>
Date:   Wed, 25 Jan 2023 20:18:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] hwmon: (pmbus/core) Generalise pmbus get status
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230123064021.2657670-1-Naresh.Solanki@9elements.com>
 <20230123064021.2657670-2-Naresh.Solanki@9elements.com>
 <20230124174809.GA563974@roeck-us.net>
Content-Language: en-US
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <20230124174809.GA563974@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi

On 24-01-2023 11:18 pm, Guenter Roeck wrote:
> On Mon, Jan 23, 2023 at 07:40:19AM +0100, Naresh Solanki wrote:
>> Add function pmbus get status that can be used to get both pmbus
>> specific status & regulator status
>>
>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>> ---
>>   drivers/hwmon/pmbus/pmbus_core.c | 148 +++++++++++++++++--------------
>>   1 file changed, 82 insertions(+), 66 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 1b70cf3be313..12b662b91306 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -2735,64 +2735,16 @@ static const struct pmbus_status_category __maybe_unused pmbus_status_flag_map[]
>>   	},
>>   };
>>   
>> -#if IS_ENABLED(CONFIG_REGULATOR)
>> -static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
>> -{
>> -	struct device *dev = rdev_get_dev(rdev);
>> -	struct i2c_client *client = to_i2c_client(dev->parent);
>> -	struct pmbus_data *data = i2c_get_clientdata(client);
>> -	u8 page = rdev_get_id(rdev);
>> -	int ret;
>>   
>> -	mutex_lock(&data->update_lock);
>> -	ret = _pmbus_read_byte_data(client, page, PMBUS_OPERATION);
>> -	mutex_unlock(&data->update_lock);
>> -
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	return !!(ret & PB_OPERATION_CONTROL_ON);
>> -}
>> -
>> -static int _pmbus_regulator_on_off(struct regulator_dev *rdev, bool enable)
>> +static int pmbus_get_flags(struct pmbus_data *data, u8 page, unsigned int *error)
> 
> Moving this code outside the conditional without usage there will result
> in compile errors due to an unused function if compiled with REGULATOR
> disabled. While this will (hopefully) change in one of the later patches,
> it is still unacceptable because it may result in bisect failures.
> 
Yes. With REGULATOR disabled. There is warning:
warning: ‘pmbus_get_flags’ defined but not used [-Wunused-function]
  2739 | static int pmbus_get_flags(struct pmbus_data *data, u8 page, 
unsigned int *error)

Will add maybe unused as below:
static int __maybe_unused pmbus_get_flags(struct pmbus_data *data, u8 
page, unsigned int *error)

Let me know your view.

>>   {
>> -	struct device *dev = rdev_get_dev(rdev);
>> -	struct i2c_client *client = to_i2c_client(dev->parent);
>> -	struct pmbus_data *data = i2c_get_clientdata(client);
>> -	u8 page = rdev_get_id(rdev);
>> -	int ret;
>> -
>> -	mutex_lock(&data->update_lock);
>> -	ret = pmbus_update_byte_data(client, page, PMBUS_OPERATION,
>> -				     PB_OPERATION_CONTROL_ON,
>> -				     enable ? PB_OPERATION_CONTROL_ON : 0);
>> -	mutex_unlock(&data->update_lock);
>> -
>> -	return ret;
>> -}
>> -
>> -static int pmbus_regulator_enable(struct regulator_dev *rdev)
>> -{
>> -	return _pmbus_regulator_on_off(rdev, 1);
>> -}
>> -
>> -static int pmbus_regulator_disable(struct regulator_dev *rdev)
>> -{
>> -	return _pmbus_regulator_on_off(rdev, 0);
>> -}
>> -
>> -static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned int *flags)
>> -{
>> -	int i, status;
>>   	const struct pmbus_status_category *cat;
>>   	const struct pmbus_status_assoc *bit;
>> -	struct device *dev = rdev_get_dev(rdev);
>> -	struct i2c_client *client = to_i2c_client(dev->parent);
>> -	struct pmbus_data *data = i2c_get_clientdata(client);
>> -	u8 page = rdev_get_id(rdev);
>> +	struct i2c_client *client = to_i2c_client(data->dev);
>>   	int func = data->info->func[page];
>> +	int i, status, ret;
>>   
>> -	*flags = 0;
>> +	*error = 0;
> 
> You are making personal preference changes here. Maybe that is the reason
> why the patch looks that large. Please try to leave existing code alone.
> If there is a reason to change a variable name (or other cosmetic changes,
> like moving variable declarations around), do it in a separate patch which
> only does that, and explain why it is needed and/or makes sense.
Sure. Will do.

Best Regards,
Naresh
> 
> Thanks,
> Guenter
> 
>>   
>>   	mutex_lock(&data->update_lock);
>>   
>> @@ -2803,14 +2755,15 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
>>   
>>   		status = _pmbus_read_byte_data(client, page, cat->reg);
>>   		if (status < 0) {
>> -			mutex_unlock(&data->update_lock);
>> -			return status;
>> +			ret = status;
>> +			goto unlock;
>>   		}
>>   
>>   		for (bit = cat->bits; bit->pflag; bit++) {
>>   			if (status & bit->pflag)
>> -				*flags |= bit->rflag;
>> +				*error |= bit->rflag;
>>   		}
>> +
>>   	}
>>   
>>   	/*
>> @@ -2823,36 +2776,99 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
>>   	 * REGULATOR_ERROR_<foo>_WARN.
>>   	 */
>>   	status = pmbus_get_status(client, page, PMBUS_STATUS_WORD);
>> -	mutex_unlock(&data->update_lock);
>> -	if (status < 0)
>> -		return status;
>>   
>> -	if (pmbus_regulator_is_enabled(rdev)) {
>> +	if (status < 0) {
>> +		ret = status;
>> +		goto unlock;
>> +	}
>> +
>> +	ret = _pmbus_read_byte_data(client, page, PMBUS_OPERATION);
>> +	if (ret < 0)
>> +		goto unlock;
>> +
>> +	if (ret & PB_OPERATION_CONTROL_ON) {
>>   		if (status & PB_STATUS_OFF)
>> -			*flags |= REGULATOR_ERROR_FAIL;
>> +			*error |= REGULATOR_ERROR_FAIL;
>>   
>>   		if (status & PB_STATUS_POWER_GOOD_N)
>> -			*flags |= REGULATOR_ERROR_REGULATION_OUT;
>> +			*error |= REGULATOR_ERROR_REGULATION_OUT;
>>   	}
>>   	/*
>>   	 * Unlike most other status bits, PB_STATUS_{IOUT_OC,VOUT_OV} are
>>   	 * defined strictly as fault indicators (not warnings).
>>   	 */
>>   	if (status & PB_STATUS_IOUT_OC)
>> -		*flags |= REGULATOR_ERROR_OVER_CURRENT;
>> +		*error |= REGULATOR_ERROR_OVER_CURRENT;
>>   	if (status & PB_STATUS_VOUT_OV)
>> -		*flags |= REGULATOR_ERROR_REGULATION_OUT;
>> +		*error |= REGULATOR_ERROR_REGULATION_OUT;
>>   
>>   	/*
>>   	 * If we haven't discovered any thermal faults or warnings via
>>   	 * PMBUS_STATUS_TEMPERATURE, map PB_STATUS_TEMPERATURE to a warning as
>>   	 * a (conservative) best-effort interpretation.
>>   	 */
>> -	if (!(*flags & (REGULATOR_ERROR_OVER_TEMP | REGULATOR_ERROR_OVER_TEMP_WARN)) &&
>> +	if (!(*error & (REGULATOR_ERROR_OVER_TEMP | REGULATOR_ERROR_OVER_TEMP_WARN)) &&
>>   	    (status & PB_STATUS_TEMPERATURE))
>> -		*flags |= REGULATOR_ERROR_OVER_TEMP_WARN;
>> +		*error |= REGULATOR_ERROR_OVER_TEMP_WARN;
>>   
>> -	return 0;
>> +unlock:
>> +	mutex_unlock(&data->update_lock);
>> +	return ret;
>> +}
>> +
>> +#if IS_ENABLED(CONFIG_REGULATOR)
>> +static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
>> +{
>> +	struct device *dev = rdev_get_dev(rdev);
>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>> +	struct pmbus_data *data = i2c_get_clientdata(client);
>> +	u8 page = rdev_get_id(rdev);
>> +	int ret;
>> +
>> +	mutex_lock(&data->update_lock);
>> +	ret = _pmbus_read_byte_data(client, page, PMBUS_OPERATION);
>> +	mutex_unlock(&data->update_lock);
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return !!(ret & PB_OPERATION_CONTROL_ON);
>> +}
>> +
>> +static int _pmbus_regulator_on_off(struct regulator_dev *rdev, bool enable)
>> +{
>> +	struct device *dev = rdev_get_dev(rdev);
>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>> +	struct pmbus_data *data = i2c_get_clientdata(client);
>> +	u8 page = rdev_get_id(rdev);
>> +	int ret;
>> +
>> +	mutex_lock(&data->update_lock);
>> +	ret = pmbus_update_byte_data(client, page, PMBUS_OPERATION,
>> +				     PB_OPERATION_CONTROL_ON,
>> +				     enable ? PB_OPERATION_CONTROL_ON : 0);
>> +	mutex_unlock(&data->update_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int pmbus_regulator_enable(struct regulator_dev *rdev)
>> +{
>> +	return _pmbus_regulator_on_off(rdev, 1);
>> +}
>> +
>> +static int pmbus_regulator_disable(struct regulator_dev *rdev)
>> +{
>> +	return _pmbus_regulator_on_off(rdev, 0);
>> +}
>> +
>> +static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned int *flags)
>> +{
>> +	struct device *dev = rdev_get_dev(rdev);
>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>> +	struct pmbus_data *data = i2c_get_clientdata(client);
>> +
>> +	return pmbus_get_flags(data, rdev_get_id(rdev), flags);
>>   }
>>   
>>   static int pmbus_regulator_get_status(struct regulator_dev *rdev)
>> -- 
>> 2.38.1
>>
