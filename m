Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190D0C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Feb 2022 17:12:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237880AbiBURNE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Feb 2022 12:13:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350427AbiBURNE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Feb 2022 12:13:04 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A8B6411
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 09:12:40 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id d3so33604328qvb.5
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 09:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=WZonj1IUnhmAwZj420T4Ef5USEsmOuZA7LqRn73BjLw=;
        b=hMPgnwkAza7aREspM25f5p/TepxU9vIJtIrRgZlQAQxRrPtAJyYfi7n4GGjtb3t0HQ
         2Uy6x5vnx1p4hVNerxI2Aq3h5pDz6p1U163OskCr9ChX1uU5jwYAE8nv4j2BYUXSNg3Q
         bRMeFj1w2kdPns+gaxhxoAiTemc5qMIM1knA3FdtQ11P1rySf4QJ7C+SGAC10s9C8nwu
         6hWClLXsFLP2rZCTsq8MzwQT5YkgRndlRiqk5Z/hRtrBCj5JMLY3t2332Rt14L2Q4n+1
         w8AWO1ix4pngjkIEOIl8QAJ6YgE5EJEL7Vp7Y9a5Ho1nDjh49noqy5m1mcNkLyKBFRcG
         yjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=WZonj1IUnhmAwZj420T4Ef5USEsmOuZA7LqRn73BjLw=;
        b=Ar9/flmzcO/assKxoOhkpVIzOLKZ4SWD2DoqsmYA7pnwCOnHUD72SHr+fvY7SErr3D
         /IgnEhghHnz4OLZx3gFRCf/54Rb0WCyo5XHNVtaADQj6CYXbcKAW09ZOkHjI/zq4451A
         ZJSCJWj8SaZ0yjGcjDw44JBFZWdRjN60sQ4UKyI8F656JNA4T6UPEa5v1JRXLnfP0fAn
         tOpd2sWC6ralwAjRnkW++E7B4/wvT1fY1whOaG5DUl24oqgI9pX3nTjsnCvLKEB50yYl
         eWEBb+5f1+PtcjTY2bvcBYWJ5sprvjLB3QuQ7yx5AmL4QboBkCL/d3XATvy6xrSO0KVS
         fcZg==
X-Gm-Message-State: AOAM533ffm3WQC7QCJI0j/+8PJ3kisj1jRm+X2kXW0vUYyAccqHk3qCU
        +PNHxvsMO2WpjNS0UUutqHw=
X-Google-Smtp-Source: ABdhPJzMNxom0upC0Q98eAEmEMgP2p9l3bVbioIt6kw+v3tI+1XKfosPyiIB1IZnSz5+PA2PDhA6Gw==
X-Received: by 2002:a05:622a:155:b0:2de:466:ad1d with SMTP id v21-20020a05622a015500b002de0466ad1dmr8255875qtw.246.1645463560023;
        Mon, 21 Feb 2022 09:12:40 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 16sm31082537qty.86.2022.02.21.09.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 09:12:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e8c4f814-e017-26bf-501c-6ed1da0963e9@roeck-us.net>
Date:   Mon, 21 Feb 2022 09:12:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Dmitry Osipenko <digetx@gmail.com>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>, Jon Hunter <jonathanh@nvidia.com>
References: <20220221164434.4169560-1-linux@roeck-us.net>
 <9ad46103-381b-ac0e-c263-cde0d26eab46@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: Handle failure to register sensor with thermal
 zone correctly
In-Reply-To: <9ad46103-381b-ac0e-c263-cde0d26eab46@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/21/22 08:56, Dmitry Osipenko wrote:
> 21.02.2022 19:44, Guenter Roeck пишет:
>> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
>> index 3501a3ead4ba..4bfe3791a5ba 100644
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
>> +		dev_warn(dev, "Failed to register temp%d_input with thermal zone\n",
>> +			 index + 1);
> 
> Do we really need this warning? I suppose it should be okay if sensor
> isn't attached to any device in a device-tree and just reports temperature.

I'd rather leave it there for the time being. It will only affect devicetree
systems (turns out there is already a check for of_node elsewhere). Thermal
zone specification is not always easy and there may be a mismatch between
what is reported by the driver and what the user (programmer) expects to
see (which I think is what happens here). I don't want to silently
ignore such problems without any notification.

We could make it dev_notice and/or change the message (instead of "Failed to
..." just say "temp%d_input not registered with thermal zone" , maybe ?).

Guenter
