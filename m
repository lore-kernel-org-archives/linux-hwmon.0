Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016C2C05027
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Feb 2023 14:11:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbjBNOLV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Feb 2023 09:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbjBNOK5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Feb 2023 09:10:57 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D472A6D4
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Feb 2023 06:10:32 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id mg23so8653825pjb.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Feb 2023 06:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ccPn3vYCFWTMaESXxJLT7uCH+Tq14dZdgeytmCR/WM0=;
        b=hATTtKLQsqwSzhzQr4Ufz1XXIPKmfYNoi4HPc59mDHI/WU+t43LRfBBSyieGqTnh+t
         2/rPp+9pN5GG71/61C/xJZGyFh41Q04sCpLcrbJWllcR14fL5HFcFhNDmLPp72jbMjzq
         WbaHRcpS/V7h9X5jE6vtJFdsOIZVI/qXnIPpDy1ntunqs7lrZH+lP12O47LuA7fXKKrg
         SxGYa+/QnKSkF1S/HXEf8gCLFf510fRcefFfFa1U2b6nCRJrXiSWZtxdC0i7yIJtrzjR
         VR/dTmJt2L/o9gC4H223azln2NNrZXJqJDsvQKuGgLAvID52wKc5vG18IsjOsBiCjXiP
         bwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccPn3vYCFWTMaESXxJLT7uCH+Tq14dZdgeytmCR/WM0=;
        b=yw8R4caYIHeDhn03V3kntuCHnIpq/hFNB8ab/K56fRM14roPuNbXS5OPHLB0JlojGH
         Xd3Ih7O5AMp6AJB4GMAErkvTWYzV7kx30xmsB2qQlUS6wnxVuWoWQs9rQNLmk9exhajW
         XSkzft3P7ERnCmC3X3h29HZfLXuFdRi69B2w0ll/N/tv1268NAL68y+hg86bAMeZJVZN
         tGC6ruEiTNMR4/jw9gVuXX1iNDBjBmiv1sH/mrS+GEYXOoR4zrc2YtbGkD6IXqv9D1dd
         4sXf1ztD9vF86lRIMmVdI2F6mf0JDGnAIxYosbGkuSdnZScf5U9gO+jylr4EBVPa31MY
         4ozA==
X-Gm-Message-State: AO0yUKWCJZ/n49rjCxbq1+BsdtepexH9hTJ6c0dhcLqY4LQq/qEWG4vj
        D5JEy/RLoGBzFtTZKywvpqYcew==
X-Google-Smtp-Source: AK7set82ewOO5srjnprU89Gu8qAI0uO51nzsrkI0fV1Mdbqk//ypAr/0Zj7uVUCg8Lou90gaZgAaCA==
X-Received: by 2002:a05:6a20:3d84:b0:be:a817:ef9d with SMTP id s4-20020a056a203d8400b000bea817ef9dmr2720654pzi.42.1676383821546;
        Tue, 14 Feb 2023 06:10:21 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id t1-20020a63b701000000b004fb5704f19bsm7589390pgf.31.2023.02.14.06.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 06:10:21 -0800 (PST)
Message-ID: <f432eb79-6efb-2b69-2f20-ae06999d60de@9elements.com>
Date:   Tue, 14 Feb 2023 19:40:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus/core): Add interrupt support
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org
References: <20230207120241.2800662-1-Naresh.Solanki@9elements.com>
 <20230207120241.2800662-3-Naresh.Solanki@9elements.com>
 <20230211153729.GA203244@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <20230211153729.GA203244@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi

On 11-02-2023 09:07 pm, Guenter Roeck wrote:
> On Tue, Feb 07, 2023 at 01:02:40PM +0100, Naresh Solanki wrote:
>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>
>> Implement PMBUS irq handler.
>>
>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>> ---
>>   drivers/hwmon/pmbus/pmbus.h      |  2 +-
>>   drivers/hwmon/pmbus/pmbus_core.c | 85 ++++++++++++++++++++++++++++++++
>>   2 files changed, 86 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>> index 713ea7915425..11e84e141126 100644
>> --- a/drivers/hwmon/pmbus/pmbus.h
>> +++ b/drivers/hwmon/pmbus/pmbus.h
>> @@ -26,7 +26,7 @@ enum pmbus_regs {
>>   
>>   	PMBUS_CAPABILITY		= 0x19,
>>   	PMBUS_QUERY			= 0x1A,
>> -
>> +	PMBUS_SMBALERT_MASK		= 0x1B,
>>   	PMBUS_VOUT_MODE			= 0x20,
>>   	PMBUS_VOUT_COMMAND		= 0x21,
>>   	PMBUS_VOUT_TRIM			= 0x22,
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 5ccae8126a56..d5403baad60a 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -3093,6 +3093,85 @@ static int pmbus_regulator_register(struct pmbus_data *data)
>>   }
>>   #endif
>>   
>> +static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg, u8 val)
>> +{
>> +	int err;
>> +
>> +	err = pmbus_check_word_register(client, page, reg | (val << 8));
>> +	if (err)
>> +		return err;
> 
> I am not convinced that this is necessary. The next command will return an
> error anyway if the register or the specific mask is not supported, so what
> is the point ?
> 
Sure. will remove.
>> +
>> +	return pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
>> +}
>> +
>> +static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
>> +{
>> +	struct pmbus_data *data = pdata;
>> +	struct i2c_client *client = to_i2c_client(data->dev);
>> +	int i, status;
>> +
>> +	mutex_lock(&data->update_lock);
>> +	for (i = 0; i < data->info->pages; i++) {
>> +		status = pmbus_read_status_word(client, i);
>> +		if (status < 0) {
>> +			mutex_unlock(&data->update_lock);
>> +			return status;
>> +		}
>> +
>> +		if (status & ~(PB_STATUS_OFF | PB_STATUS_BUSY | PB_STATUS_POWER_GOOD_N))
>> +			pmbus_clear_fault_page(client, i);
>> +	}
>> +	mutex_unlock(&data->update_lock);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int pmbus_irq_setup(struct i2c_client *client, struct pmbus_data *data)
>> +{
>> +	struct device *dev = &client->dev;
>> +	const struct pmbus_status_category *cat;
>> +	const struct pmbus_status_assoc *bit;
>> +	int i, j, err, ret, func;
>> +	u8 mask;
>> +	u8 misc_status[] = {PMBUS_STATUS_CML, PMBUS_STATUS_OTHER, PMBUS_STATUS_MFR_SPECIFIC,
>> +			    PMBUS_STATUS_FAN_12, PMBUS_STATUS_FAN_34};
> 
> static const u8 ...
> 
Done
>> +
>> +	for (i = 0; i < data->info->pages; i++) {
>> +		func = data->info->func[i];
>> +
>> +		for (j = 0; j < ARRAY_SIZE(pmbus_status_flag_map); j++) {
>> +			cat = &pmbus_status_flag_map[j];
>> +			if (!(func & cat->func))
>> +				continue;
>> +			mask = 0;
>> +			for (bit = cat->bits; bit->pflag; bit++)
>> +				mask |= bit->pflag;
>> +
>> +			err = pmbus_write_smbalert_mask(client, i, cat->reg, ~mask);
>> +			if (err)
>> +				dev_err_once(dev, "Failed to set smbalert for reg 0x%02x\n",
>> +					     cat->reg);
> 
> dev_err implies an error. This is ignored and thus not an error. On top of that,
> not all chips support PMBUS_SMBALERT_MASK. All of those would see this message.
> We can't have that. At best make it a dev_dbg.
> 
Sure. Will make it dev_dbg_once.
>> +		}
>> +
>> +		for (j = 0; j < ARRAY_SIZE(misc_status); j++) {
>> +			err = pmbus_write_smbalert_mask(client, i, misc_status[j], 0xff);
>> +			if (err)
>> +				dev_err_once(dev, "Failed to set smbalert for reg 0x%02x\n",
>> +					     misc_status[j]);
> 
> We definitely can't have a message here; that would fire for almost
> every chip.
> 
Sure. Will remove printing of error here.
>> +		}
>> +	}
>> +
>> +	/* Register notifiers - can fail if IRQ is not given */
> 
> If there is no irq, what is the point of executing this code in the first
> place ? No, wait, in that case the function isn't called in the first place.
> I think the comment doesn't add any value and is just confusing.
> 
Will clean this comment.
>> +	ret = devm_request_threaded_irq(dev, client->irq, NULL, pmbus_fault_handler, 0,
>> +					"pmbus-irq", data);
>> +	if (ret) {
> 
> Why both "err" and "ret" ?
> 
Will replace ret with err.
>> +		dev_warn(dev, "IRQ disabled %d\n", ret);
> 
> The calling code aborts, so this should be dev_err() and say something
> better than "IRQ disabled"; It should be something like "failed to
> request irq".
> 
Sure. Will update to "failed to request an irq"
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static struct dentry *pmbus_debugfs_dir;	/* pmbus debugfs directory */
>>   
>>   #if IS_ENABLED(CONFIG_DEBUG_FS)
>> @@ -3455,6 +3534,12 @@ int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info)
>>   	if (ret)
>>   		return ret;
>>   
>> +	if (client->irq > 0) {
>> +		ret = pmbus_irq_setup(client, data);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
> 
> I think it would be better to have the check in pmbus_irq_setup():
> 
> pmbus_irq_setup()
> {
> 	if (!client->irq)
> 		return 0;
> 	
> 	...
> }
> 
> and here
> 	ret = pmbus_irq_setup(client, data);
> 	if (ret)
> 		return ret;
> 
> 
Sure
>>   	ret = pmbus_init_debugfs(client, data);
>>   	if (ret)
>>   		dev_warn(dev, "Failed to register debugfs\n");
