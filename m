Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AFCC433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jan 2022 20:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbiAOUlx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jan 2022 15:41:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbiAOUlw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jan 2022 15:41:52 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5619C061574
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jan 2022 12:41:51 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b14so23829197lff.3
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jan 2022 12:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9naqtK/AFjFi1JdqO2KF7NMgwtItgNTSUsAbCOnmqYg=;
        b=d7VzzJ5dGpY0qBxK98pzEeANie1lAQb2pGiuBtM1+yQYHImSQ7PHW5n0aW9RM/WRu8
         2pXnY4esQkr0vgT+rDWTY6WDqzL0A+P8gI1Gm3ITl6Prbm4AcAIDNpp6RMQdIb1xJ+lM
         5bN7GYoRincGYXy/klbQ5hI9a4H8CFoz9SWj0gck/DOz9c8Od8DDW8DQSWjCqupCkUcI
         8VU8Lmuitj1L74NblU1hXqnLNQeevEi/aQwMCI5r5TaP+SfO1Za3Mdogf87ikP1USH+S
         MnufwktPF3BCLK6stiOwI+7fvdCwfOUNeBNLKBszTxKbRTxEqnnBR1lod87s9u+ueX60
         ct9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9naqtK/AFjFi1JdqO2KF7NMgwtItgNTSUsAbCOnmqYg=;
        b=yiKWKVCO0x8NNBGow/8oZuDqxl6TBA42f5lNYoN1V8v5nXKHycau71tPrwrCewfFQD
         wQv1GZcVFsTyCxKbfc7PLiigOXeB5auFIULxhQ7TPUPkIujXgzMUSDVVmaYq2jxAkaiq
         oXo9AsG0t85hW4CvZj6qwUiJpYn5YCAS8kxBpgN0hGmTN+ZxfeyRStfAs5mMImmVOZXG
         iQ/5YGbh0hxUUW3t+jOEMLVLMPRT3M1lbeiQZfjf7aL/nU1pdGFyotCAfTE3Ke0+clzr
         VDueKCmjd50NmFWH5ntlyrpeEq5ocXcrrNrKBLL/zp799PQYktrD7/1UOx2fku38tKSZ
         Xgzg==
X-Gm-Message-State: AOAM531BCljgMq7ylUCF3im2CeSEG3PJL5g/H0IXyAxkbTbSGhhimzyf
        E36CwbKIMeuzi8lTSPPPv9w=
X-Google-Smtp-Source: ABdhPJyOK6oqMkGeDV2ZeYYLZeRFwiTCNXgH165oiez5dl+K1Fz4NTOvDOKA6VydBn8Xr1GOdLYJFg==
X-Received: by 2002:a05:6512:3984:: with SMTP id j4mr11855686lfu.578.1642279310326;
        Sat, 15 Jan 2022 12:41:50 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.googlemail.com with ESMTPSA id f30sm758736lfv.40.2022.01.15.12.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jan 2022 12:41:49 -0800 (PST)
Subject: Re: [PATCH 6/6] hwmon: (lm90) Fix sysfs and udev notifications
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20220111165116.1298459-1-linux@roeck-us.net>
 <20220111165116.1298459-7-linux@roeck-us.net>
 <e67010f7-6934-8d89-d8de-7d06793ddff3@gmail.com>
Message-ID: <0842cd57-9060-eb18-3ec5-c67542fdfa55@gmail.com>
Date:   Sat, 15 Jan 2022 23:41:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e67010f7-6934-8d89-d8de-7d06793ddff3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

15.01.2022 23:33, Dmitry Osipenko пишет:
> 11.01.2022 19:51, Guenter Roeck пишет:
>> sysfs and udev notifications need to be sent to the _alarm
>> attributes, not to the value attributes.
>>
>> Fixes: 94dbd23ed88c ("hwmon: (lm90) Use hwmon_notify_event()")
>> Cc: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  drivers/hwmon/lm90.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>> index ba01127c1deb..1c9493c70813 100644
>> --- a/drivers/hwmon/lm90.c
>> +++ b/drivers/hwmon/lm90.c
>> @@ -1808,22 +1808,22 @@ static bool lm90_is_tripped(struct i2c_client *client, u16 *status)
>>  
>>  	if (st & LM90_STATUS_LLOW)
>>  		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>> -				   hwmon_temp_min, 0);
>> +				   hwmon_temp_min_alarm, 0);
>>  	if (st & LM90_STATUS_RLOW)
>>  		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>> -				   hwmon_temp_min, 1);
>> +				   hwmon_temp_min_alarm, 1);
>>  	if (st2 & MAX6696_STATUS2_R2LOW)
>>  		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>> -				   hwmon_temp_min, 2);
>> +				   hwmon_temp_min_alarm, 2);
>>  	if (st & LM90_STATUS_LHIGH)
>>  		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>> -				   hwmon_temp_max, 0);
>> +				   hwmon_temp_max_alarm, 0);
>>  	if (st & LM90_STATUS_RHIGH)
>>  		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>> -				   hwmon_temp_max, 1);
>> +				   hwmon_temp_max_alarm, 1);
>>  	if (st2 & MAX6696_STATUS2_R2HIGH)
>>  		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>> -				   hwmon_temp_max, 2);
>> +				   hwmon_temp_max_alarm, 2);
> 
> 
> IIUC, "alarm" is about the T_CRIT output line. While these attributes
> are about the ALERT line. Hence why "alert" notifications need to be
> sent to the unrelated "alarm" attributes? This change doesn't look right.
> 

Although, no. I see now that the "alarm_bits" in the code are about the
alerts. Should be okay then.
