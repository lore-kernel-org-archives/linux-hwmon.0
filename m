Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1BCC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Feb 2022 20:12:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233492AbiBUUMb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Feb 2022 15:12:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbiBUUMa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Feb 2022 15:12:30 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0976BCC2
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 12:12:07 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id e22so34828124qvf.9
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 12:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lDOdm5114jrEZABngkYtNG+ZpHfKvBKmU7TcZmMbUlA=;
        b=l+Nj6xoSyHN/4D83coweal4HnxED+CL7UAiUYY1zYJ/cDsPKeFaClEgb9Q6BFAuqgU
         ezP09Ro4d4PU/uuxCIo4Rc6hybkNAwyB4ayxhlL8aBGnkTZ/ocJmhX49oe+Bc5i+nY1t
         vc38jGNo2+kyFRAuJtVU72kYnKXpW2V4H8oETcOo8Y7vgakRLGlfUgqRZfgOeCnaCLai
         3Sb0zfzef/bl8006k6NqH34Ij8CqMMseTTICHI533eeGwo4o08aoDEUTpYjQSDTzwhrU
         ZgsDXbIPSJQ/lZJ+1Knti1cQWWR4OQ3bQ6MRxfK1r8seP6NfqAcur2z5aAODnqa+iV72
         5cuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lDOdm5114jrEZABngkYtNG+ZpHfKvBKmU7TcZmMbUlA=;
        b=PGW5psp3/mBVwtOW60aUE5dWvckvpqKJ8eoDvTIKZiuJgM0P8Zv2wslITFd2OYGdA8
         G/8ZCcjCJhcOGRQq9jnvzbsmn+tX46TinwZEL/CdrYQOxiMKGzIvTmxE7zaxG9pVpZ4S
         4hplYhNMkbY8NvhhCuSUpF6od7wxnbjnG+F6q1e/u+8Cvf+LPzXUlhpD5ljllW0W3bLP
         N4Cb17GaaWukJfG8aRECu08mCLdNMdEPXnihKGvjhojS2eMFRcAXhhIi/WITknr3RC/J
         +Xt4YjnRfhBcCMQA+GO3V9fd+B5xjtbCAImd/Kb/4f6LH++iVC0WCidBRib1RiYOJrvv
         FBYg==
X-Gm-Message-State: AOAM530MouOg6H55RVY+1V20ppYocIfJxHUrkkGHXIA7x5s1augvqd5l
        NSi4ILINLfI4G7S7AHUmeDE=
X-Google-Smtp-Source: ABdhPJyvvghm1tNLj/Hp1x94peEmAmT2YceHcLttNtj6KzHXkgXBmbRNcK1G0zLL61G98l4G6EQeUg==
X-Received: by 2002:a05:622a:198c:b0:2de:707:b1d9 with SMTP id u12-20020a05622a198c00b002de0707b1d9mr7274731qtc.233.1645474326124;
        Mon, 21 Feb 2022 12:12:06 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 5sm31406166qtp.81.2022.02.21.12.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 12:12:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bc5d2eb5-d403-adcc-610e-2a6bf5bc01d3@roeck-us.net>
Date:   Mon, 21 Feb 2022 12:12:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] hwmon: Handle failure to register sensor with thermal
 zone correctly
Content-Language: en-US
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>
References: <20220221182209.1795242-1-linux@roeck-us.net>
 <b9c9f2e2-508d-e34c-c0a1-ec0b579ad3b6@collabora.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <b9c9f2e2-508d-e34c-c0a1-ec0b579ad3b6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/21/22 10:49, Dmitry Osipenko wrote:
> 
> On 2/21/22 21:22, Guenter Roeck wrote:
>> If an attempt is made to a sensor with a thermal zone and it fails,
>> the call to devm_thermal_zone_of_sensor_register() may return -ENODEV.
>> This may result in crashes similar to the following.
>>
>> Unable to handle kernel NULL pointer dereference at virtual address 00000000000003cd
>> ...
>> Internal error: Oops: 96000021 [#1] PREEMPT SMP
>> ...
>> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : mutex_lock+0x18/0x60
>> lr : thermal_zone_device_update+0x40/0x2e0
>> sp : ffff800014c4fc60
>> x29: ffff800014c4fc60 x28: ffff365ee3f6e000 x27: ffffdde218426790
>> x26: ffff365ee3f6e000 x25: 0000000000000000 x24: ffff365ee3f6e000
>> x23: ffffdde218426870 x22: ffff365ee3f6e000 x21: 00000000000003cd
>> x20: ffff365ee8bf3308 x19: ffffffffffffffed x18: 0000000000000000
>> x17: ffffdde21842689c x16: ffffdde1cb7a0b7c x15: 0000000000000040
>> x14: ffffdde21a4889a0 x13: 0000000000000228 x12: 0000000000000000
>> x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
>> x8 : 0000000001120000 x7 : 0000000000000001 x6 : 0000000000000000
>> x5 : 0068000878e20f07 x4 : 0000000000000000 x3 : 00000000000003cd
>> x2 : ffff365ee3f6e000 x1 : 0000000000000000 x0 : 00000000000003cd
>> Call trace:
>>   mutex_lock+0x18/0x60
>>   hwmon_notify_event+0xfc/0x110
>>   0xffffdde1cb7a0a90
>>   0xffffdde1cb7a0b7c
>>   irq_thread_fn+0x2c/0xa0
>>   irq_thread+0x134/0x240
>>   kthread+0x178/0x190
>>   ret_from_fork+0x10/0x20
>> Code: d503201f d503201f d2800001 aa0103e4 (c8e47c02)
>>
>> Jon Hunter reports that the exact call sequence is:
>>
>> hwmon_notify_event()
>>    --> hwmon_thermal_notify()
>>      --> thermal_zone_device_update()
>>        --> update_temperature()
>>          --> mutex_lock()
>>
>> The hwmon core needs to handle all errors returned from calls
>> to devm_thermal_zone_of_sensor_register(). If the call fails
>> with -ENODEV, report that the sensor was not attached to a
>> thermal zone  but continue to register the hwmon device.
>>
>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>> Cc: Dmitry Osipenko <digetx@gmail.com>
>> Fixes: 1597b374af222 ("hwmon: Add notification support")
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v2: Use dev_info instead of dev_warn, and change message to be
>>      less alarming.
>>
>>   drivers/hwmon/hwmon.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
>> index 3501a3ead4ba..3ae961986fc3 100644
>> --- a/drivers/hwmon/hwmon.c
>> +++ b/drivers/hwmon/hwmon.c
>> @@ -214,12 +214,14 @@ static int hwmon_thermal_add_sensor(struct device *dev, int index)
>>   
>>   	tzd = devm_thermal_zone_of_sensor_register(dev, index, tdata,
>>   						   &hwmon_thermal_ops);
>> -	/*
>> -	 * If CONFIG_THERMAL_OF is disabled, this returns -ENODEV,
>> -	 * so ignore that error but forward any other error.
>> -	 */
>> -	if (IS_ERR(tzd) && (PTR_ERR(tzd) != -ENODEV))
>> -		return PTR_ERR(tzd);
>> +	if (IS_ERR(tzd)) {
>> +		if (PTR_ERR(tzd) != -ENODEV)
>> +			return PTR_ERR(tzd);
>> +		dev_info(dev, "temp%d_input not attached to any thermal zone\n",
>> +			 index + 1);
>> +		devm_kfree(dev, tdata);
>> +		return 0;
>> +	}
>>   
>>   	err = devm_add_action(dev, hwmon_thermal_remove_sensor, &tdata->node);
>>   	if (err)
> 
> LGTM, thank you. But still needs a t-b from Jon.
> 

Yes, I'll wait for a tested-by: tag before sending the patch upstream
to make sure that it actually fixes the problem.

Thanks,
Guenter

> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

