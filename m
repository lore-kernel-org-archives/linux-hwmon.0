Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA9BC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Sep 2021 14:59:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A85536023B
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Sep 2021 14:59:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349547AbhICPAI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 Sep 2021 11:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349488AbhICPAH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Sep 2021 11:00:07 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A168DC061575
        for <linux-hwmon@vger.kernel.org>; Fri,  3 Sep 2021 07:59:07 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id h133so7188302oib.7
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Sep 2021 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YzGKnhI8ycH6/ir2dNeH8ErpiKN/vnR8+4OvWOK+1fE=;
        b=ZZfRVSVMO1iCgVoADWqalp6OFtTPzUkmw8hqjXxeVDUsRKzIkLDkA0StTp7gHKYjft
         vcnH9chcVP57uRh8VeegbifCsv7oZ2Q8cLV7dhX17wDlqEbFnpM+MGcGqnqNNDN2F5OP
         FbpIjoqwxTeysr2BTkS666qV/EjvxNybLjb+SlqgmoLT0k5vRi/N7yX3TIquma+lsSt0
         NM3KR5KK9x1aQA2u72p4h8cUsSa6GjvrAmU5SXMD/yM4jB4M9TW02rh6IjMoNzRWNhy1
         RA7Qdw0gRtll/G+2DMOwfno1UBFJ5xnutT4ZnsptRUN9Jwj8Ukd7rIDZs5Kjo6Kv/rWU
         YNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YzGKnhI8ycH6/ir2dNeH8ErpiKN/vnR8+4OvWOK+1fE=;
        b=ot6sWXhZdv0AK2OsdjISHCj4J5OaLcD5WA0XHh4d6wzjBwMIZ029q+c7qTutV22G7+
         jK7Ltu/RP9Nq/GFDvURWkp4omPVB1f42gPB7W+RPXZUbzziSB8h/0oKUDMQD3bMDmSfE
         JNdffRgPw9IEy+sUiwQJziGPpDS1H4PHCpyMinbtJdsI6J/VIJMhzYHAAZLerc+My5TN
         6gSVQ5KdrNjrU/DuMR1ZgJ8BHax3IvLIfKtSvE+IdfNXvp4MkzdI2z+Ylc63G+04gcrH
         K5c6yUGX4NbE1J7JpYJ4GQJB3qlvyBiMuGMPG24004KBQBc3xVpXvzNAoKxlhuZD2+Lj
         p1sg==
X-Gm-Message-State: AOAM533YNKJjdRkcGFuMFNjhPRBtt3f537Vcm0135cffs5JUxFUOH1YI
        lr5yK4OFSUWfwa2txy1GjRfMTROTvtk=
X-Google-Smtp-Source: ABdhPJz7RvrgXGRT74zmlBlvbPLBgzPhq8gjJSFiknf/oilpdMtOOWn57Lb9F99YD7i960As5tjwIw==
X-Received: by 2002:aca:180c:: with SMTP id h12mr3123630oih.60.1630681146375;
        Fri, 03 Sep 2021 07:59:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l3sm1037013ooo.7.2021.09.03.07.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 07:59:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, W_Armin@gmx.de
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210903142456.9926-1-W_Armin@gmx.de>
 <20210903144908.vrrae6oeivjxqpkj@pali>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (dell-smm) Show fan_max param in sysfs
Message-ID: <cbca6113-9a47-4a69-26bc-92a1fcf9679a@roeck-us.net>
Date:   Fri, 3 Sep 2021 07:59:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903144908.vrrae6oeivjxqpkj@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/3/21 7:49 AM, Pali Rohár wrote:
> On Friday 03 September 2021 16:24:56 W_Armin@gmx.de wrote:
>> From: Armin Wolf <W_Armin@gmx.de>
>>
>> For allowing tools like i8kutils to query the fan state
>> without having to rely on the deprecated /proc/i8k interface,
>> they need to scale the pwm values (0 - 255) back to the
>> real hardware values (0 - 2/3).
>> Show fan_max in sysfs to allow for such a scenario.
> 
> Guenter, I think that this is general problem and not specific to
> dell-smm-hwmon.c driver and i8kutils.
> 
> All other hwmon tools should have similar problem. If e.g. GUI tool has
> slider for controlling pwm then such tool needs to know number of steps.
> Otherwise usage of such slider would be not very user friendly...
> 
> Currently in hwmon sysfs API there is not attribute which could export
> this kind of information.
> 
> What about e.g. introducing 'pwm_steps' attribute which would provide
> this information?
> 

It isn't really a problem. The problem is that the tool writers insist
not following the ABI. All they would have to do is to use a scale of 0..255,
read back any written pwm value, and adjust the displayed value based
on the returned value. I do not see why this would be "not user friendly".

An attribute such as pwm_steps would not work because the step size can be
non-linear.

Guenter

>> Tested on a Dell Latitude C600.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/hwmon/dell-smm-hwmon.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
>> index 774c1b0715d9..6d3fd4f0f99d 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -107,7 +107,7 @@ module_param(fan_mult, uint, 0);
>>   MODULE_PARM_DESC(fan_mult, "Factor to multiply fan speed with (default: autodetect)");
>>
>>   static uint fan_max;
>> -module_param(fan_max, uint, 0);
>> +module_param(fan_max, uint, 0444);
>>   MODULE_PARM_DESC(fan_max, "Maximum configurable fan speed (default: autodetect)");
>>
>>   struct smm_regs {
>> @@ -1245,7 +1245,10 @@ static int __init dell_smm_probe(struct platform_device *pdev)
>>   			fan_max = conf->fan_max;
>>   	}
>>
>> -	data->i8k_fan_max = fan_max ? : I8K_FAN_HIGH;	/* Must not be 0 */
>> +	if (!fan_max)	/* Must not be 0*/
>> +		fan_max = I8K_FAN_HIGH;
>> +
>> +	data->i8k_fan_max = fan_max;
>>   	data->i8k_pwm_mult = DIV_ROUND_UP(255, data->i8k_fan_max);
>>
>>   	fan_control = dmi_first_match(i8k_whitelist_fan_control);
>> --
>> 2.20.1
>>

