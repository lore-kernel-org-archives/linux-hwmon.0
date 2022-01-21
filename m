Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DBEC43217
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jan 2022 14:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380934AbiAUOER (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jan 2022 09:04:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380891AbiAUOEJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jan 2022 09:04:09 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFCAEC061747;
        Fri, 21 Jan 2022 06:03:53 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id y14so13607027oia.9;
        Fri, 21 Jan 2022 06:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CwPJV4eJ2lyGmhLqt7aSY5rJvMk44a5RZXQw2y4Qw+M=;
        b=NAfzEpmJGJXc6Ref6FrvhO/ZYgvDnOurs/Gd5T+AEQ9y+u807hxJJASKo9oaAl8XAF
         IR94ddzdFZ39wOKzWRxpTneqOWyk3tDfio80qvv7REFZ/9krYbeAeb8CJkKI2HxtegyC
         EXblrkNiDM1BEYZCji7Yi+kwqwuYisBXUISRBFcQ6pxyipydKIVd2vs6NxJh1GhidSrD
         hKhoitfCVAh3oivtLYUKTNK8c4JuvJeu+pFSNJlNnMFNjSrwWdQ+zn9Q49fqmLzd5u7x
         8hZ+GU4hKcNEOXFz6SMWPMEsrj5mrjPwEhBEWt77lHqmk3vc8+Fkjm4AkYP34fL/rs32
         H1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CwPJV4eJ2lyGmhLqt7aSY5rJvMk44a5RZXQw2y4Qw+M=;
        b=ZVm7cZkSKqHFeDfLKVuKFcAqUiz0kC54WCa8mMqlhT+k4KNhfgUTNccmxRHXOu0qZj
         UGdIXxyp5MA5HFJdjeUWRKCbcJosz5AZcMmVlwPCXmDTus67vHZDZVtM69gPCYG8Rb1i
         JBAsTOnhg1WF0faPcnCQe+QrrmAk+mRKRk3DKU1ZYrxRVkW8YCQCpga78Sb0zrv23zg5
         eBLl3/js4TkXzCjsA6RMH1j/MBKHdYWClpEZVY2l8X6AcbzsQcQ+L3tuf3miD5tC5hO+
         4m6i+F/nl6d8prcP1jkU/pvw9e0uQ3yfFvEAomgHhrxB9D1mNDy8IXzZhX3D5g42MG3N
         gA2Q==
X-Gm-Message-State: AOAM533iazOCbA1xaNAEiJ2z4zkFfjc1nkAeZ+8Bd6Iuvu4h7r5oy7Sn
        sTMV88Nihaze/TO7rZlACK/u/s0U0TI=
X-Google-Smtp-Source: ABdhPJxIcqvv+z69ZqK+p+rPxBCUqRxYt9p6lksF6+QVvQZ4q8Vl6QfrfxCwWVpohgCY3Yj5UJjjbA==
X-Received: by 2002:a54:4e95:: with SMTP id c21mr588060oiy.177.1642773832713;
        Fri, 21 Jan 2022 06:03:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r30sm1249938oiw.58.2022.01.21.06.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jan 2022 06:03:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: (adt7470) Prevent divide by zero in
 adt7470_fan_write()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20220121053917.GB27293@kili>
 <4ef54638-1b51-2507-1e45-ff9050c3711e@roeck-us.net>
 <20220121073752.GE1978@kadam>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7eae8a4f-8138-5866-16b6-296ebc29743d@roeck-us.net>
Date:   Fri, 21 Jan 2022 06:03:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220121073752.GE1978@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/20/22 11:37 PM, Dan Carpenter wrote:
> On Thu, Jan 20, 2022 at 10:10:45PM -0800, Guenter Roeck wrote:
>> On 1/20/22 9:39 PM, Dan Carpenter wrote:
>>> The "val" variable is controlled by the user and comes from
>>> hwmon_attr_store().  The FAN_RPM_TO_PERIOD() macro divides by "val"
>>> so a zero will crash the system.  Check for that and return -EINVAL.
>>>
>>> Fixes: fc958a61ff6d ("hwmon: (adt7470) Convert to devm_hwmon_device_register_with_info API")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> ---
>>>    drivers/hwmon/adt7470.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
>>> index d519aca4a9d6..cd474584dc0b 100644
>>> --- a/drivers/hwmon/adt7470.c
>>> +++ b/drivers/hwmon/adt7470.c
>>> @@ -662,6 +662,9 @@ static int adt7470_fan_write(struct device *dev, u32 attr, int channel, long val
>>>    	struct adt7470_data *data = dev_get_drvdata(dev);
>>>    	int err;
>>> +	if (!val)
>>> +		return -EINVAL;
>>> +
>>
>> Technically that restores old (pre-fc958a61ff6d) behavior, but it is still bad:
>> Userspace can provide a value of -1 (or any other negative number), and it will
>> translate to 5400000 RPM. So it should either be
>>
>> 	if (val <= 0)
>> 		return -EINVAL;
>>
>> or
>> 	if (val <= 0)
>> 		val = 1;
> 
> There is a clamp() which does already turn invalid values into something
> valid.
> 

Yes, but
	-1 -> -5400000 -> 1, which translates to 5400000 rpm.
This is in contrast to
	1 -> 5400000 -> 65534
which translates to a more reasonable 82 rpm.

> 	val = FAN_RPM_TO_PERIOD(val);
> 	val = clamp_val(val, 1, 65534);
> 
> But I will make the <= 0 return -EINVAL change and resend.
> 
Thanks,
Guenter
