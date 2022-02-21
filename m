Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F33C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Feb 2022 18:10:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbiBUSK4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Feb 2022 13:10:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232480AbiBUSIs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Feb 2022 13:08:48 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5593520F66
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 09:59:22 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id t14so15791202ljh.8
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 09:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BtVx5cKZlLA7qGLpXssxO5oVxjU4CkTarjxNL4GRihE=;
        b=WXlrtvdalVhqlODv82wuzlD1hY3TwgUApoS0OGxRHrIlMdWrPjdSS+0iDvAaB9pk4p
         Q3R1+bskkwLSyzF6H2C2ACzG2mzXOSEVkZ+IsER316ckdTt/WvEvu9tUdXoqZYDiPYtt
         N1knkkux5D+NjjGLElsQ9ta9nSLfhCT8J/CfNLl+ofPUrrqJXtN5CmSNl7OGqnNxTUSU
         yENT6ZeVWUt3Iz0aH1FDliK6ba/tu0ROc2ggEWdKXWCw/Udbgbf56IBoNrupd6pj1onv
         apBI4pLZkdvwvA3JAhhS9LBBlE7L3GTGl8xD0aI3QDY3tkm21ySk9pMF63+6zZu0Wvf9
         N6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BtVx5cKZlLA7qGLpXssxO5oVxjU4CkTarjxNL4GRihE=;
        b=XKPU3DPM2poKx6epDIgJby1QH6wjz25Rw/woQzvCzjKb+906Gpu+f+i1tDyvjGAeBo
         7H1JeQ7Xehfy7H95fpBsh+JJL86nnYv4FBKMfXVkuCggt5xESHCP6zEDYxPvY1gwLqJw
         aTCblXclXZe6TtxAKT/wK0DpIIIVyj81FGizi4/R5kkumVTf9xclSqLSog70vSF9OJGC
         UmxRZ1cK847GsvWYnDbZYF/foWlcY5k3EQv/sSV3/D2T2ORS6oq4sxvhL+Lxm7w343CI
         L8MeQoTKM5B6sp27K/Unr2WTPK9A7JKVlPRo+ikBPFnkuVlsCgfRvcjciBYYTxMKXg/G
         mjfw==
X-Gm-Message-State: AOAM533oU2DAe7tXznvy4pEVmsVnde3ZEoZPDeKvLEfrdayAxGR7/O+r
        36aoy1+G1J9Gp89xiRZcYfnCguoW1DA=
X-Google-Smtp-Source: ABdhPJzrxzrgigy+dPLjV7ek9cdzmAksE9cD5l3Vn+U2UHKM+XxUJPlF1UrLPGsEFos9emC1U7FjhQ==
X-Received: by 2002:a2e:86cb:0:b0:246:12b0:940c with SMTP id n11-20020a2e86cb000000b0024612b0940cmr15197819ljj.40.1645466360576;
        Mon, 21 Feb 2022 09:59:20 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.googlemail.com with ESMTPSA id m6sm1177735lfg.45.2022.02.21.09.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 09:59:19 -0800 (PST)
Message-ID: <af0576cb-96d6-266a-3fc3-5670d9cffd8d@gmail.com>
Date:   Mon, 21 Feb 2022 20:59:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hwmon: Handle failure to register sensor with thermal
 zone correctly
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>, Jon Hunter <jonathanh@nvidia.com>
References: <20220221164434.4169560-1-linux@roeck-us.net>
 <9ad46103-381b-ac0e-c263-cde0d26eab46@gmail.com>
 <e8c4f814-e017-26bf-501c-6ed1da0963e9@roeck-us.net>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <e8c4f814-e017-26bf-501c-6ed1da0963e9@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

21.02.2022 20:12, Guenter Roeck пишет:
> On 2/21/22 08:56, Dmitry Osipenko wrote:
>> 21.02.2022 19:44, Guenter Roeck пишет:
>>> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
>>> index 3501a3ead4ba..4bfe3791a5ba 100644
>>> --- a/drivers/hwmon/hwmon.c
>>> +++ b/drivers/hwmon/hwmon.c
>>> @@ -214,12 +214,14 @@ static int hwmon_thermal_add_sensor(struct
>>> device *dev, int index)
>>>         tzd = devm_thermal_zone_of_sensor_register(dev, index, tdata,
>>>                              &hwmon_thermal_ops);
>>> -    /*
>>> -     * If CONFIG_THERMAL_OF is disabled, this returns -ENODEV,
>>> -     * so ignore that error but forward any other error.
>>> -     */
>>> -    if (IS_ERR(tzd) && (PTR_ERR(tzd) != -ENODEV))
>>> -        return PTR_ERR(tzd);
>>> +    if (IS_ERR(tzd)) {
>>> +        if (PTR_ERR(tzd) != -ENODEV)
>>> +            return PTR_ERR(tzd);
>>> +        dev_warn(dev, "Failed to register temp%d_input with thermal
>>> zone\n",
>>> +             index + 1);
>>
>> Do we really need this warning? I suppose it should be okay if sensor
>> isn't attached to any device in a device-tree and just reports
>> temperature.
> 
> I'd rather leave it there for the time being. It will only affect
> devicetree
> systems (turns out there is already a check for of_node elsewhere). Thermal
> zone specification is not always easy and there may be a mismatch between
> what is reported by the driver and what the user (programmer) expects to
> see (which I think is what happens here). I don't want to silently
> ignore such problems without any notification.
> 
> We could make it dev_notice and/or change the message (instead of
> "Failed to
> ..." just say "temp%d_input not registered with thermal zone" , maybe ?).

I'd change it to:

dev_info(dev, "temp%d_input not attached to any thermal zone\n", index + 1);

I'd also add an info message to print out to which tzd attachment happened.
