Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259E7C433B4
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 May 2021 22:23:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED76F61440
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 May 2021 22:23:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhENWYY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 May 2021 18:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbhENWYX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 May 2021 18:24:23 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84794C06174A
        for <linux-hwmon@vger.kernel.org>; Fri, 14 May 2021 15:23:11 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id f18so479628qko.7
        for <linux-hwmon@vger.kernel.org>; Fri, 14 May 2021 15:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=av4bY0z8HSA65ib/6yZStrOfckVV0NJHezxyScBtHE4=;
        b=TwKmITKbVAVlDPwGNGOLrq1pmJhTp8rdQNjHbL1EI4x87vi/c6Xd3z2+ByRIc01Fe5
         tJDvqXRPaYvIb4NJhZBEsnKvjXdUTz/fpTv6nOjmeCj5wL9TK2g1H21eox5Kst8fOQEN
         RiUvzhmO3uYo8T4afTlVXSbeDUbfhI955jEfmwFUgo+Hjw1+pt7eIz16oRzDZtPevT2F
         8Oj8wcLF3Im+XOO3lLsIf4YRUEyg3upT+bPJE4rLA43NfVzYKrjIIUI7Wraj5rbrumih
         RsDvXhDUY1MRwKsBvCkUEWtPx+WufeSNX4iwjC8rIS8hYmYiySSYCogS2VcT92MzxWVy
         MXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=av4bY0z8HSA65ib/6yZStrOfckVV0NJHezxyScBtHE4=;
        b=UrB2DgaRgOJiCl9lHsRCm6SjZ9mMnJQWQA3My3f99pFqp6dx5Y6NfwvJaI+KderMVe
         CHdNh0onvaozaEJWE1yQuy5vy7p4FkbigcnUO+Eakw9eZv3ZNDD56xSWmFdktrFDZqOu
         fuAXO5PLQbN7ZSThNKum7Y3NVvnTMbAouKn1DDitv+APtJeUigIzZiYxuwRxVfhha1G3
         gVbPin2H5n2Fc0Aq13L+L8PqpIdzXeDRb6hkxMCuRrpNlOgUtY61+bSgGPUPbik3q+GP
         5AcdtB9ClO9VRms6kw+bnIKo3/UMhIn8Z8+8tyupivzkc1OihKNAyFWL+YMsn63coTc1
         C95A==
X-Gm-Message-State: AOAM531/IgSrdNOS8QNrSBS1EXXlefQjr95QIscXff+HyZEUEu/Qw2AJ
        NVO2Sxo5oY+6Da4beDzsi2xkYX3D7yI=
X-Google-Smtp-Source: ABdhPJwj8T833NG7Nric2A0PuP6N+4/vtATX8UDd0VFmjY1ehjhOuE7JBPeHvYVEEKx62dTE1AihGg==
X-Received: by 2002:a05:620a:752:: with SMTP id i18mr37474027qki.362.1621030990834;
        Fri, 14 May 2021 15:23:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f12sm5601102qtj.26.2021.05.14.15.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 15:23:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus/isl68137) remove READ_TEMPERATURE_3 for
 RAA228228
To:     Adam Vaughn <adam.vaughn.xh@renesas.com>,
        Grant Peltier <grantpeltier93@gmail.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Grant Peltier <grant.peltier.jg@renesas.com>
References: <20210514211954.GA24646@raspberrypi>
 <fa8c3175-f1b8-8951-46ac-bb9ca08d6822@roeck-us.net>
 <OS3PR01MB64529FC38D0AD138EC814DCCD2509@OS3PR01MB6452.jpnprd01.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <cb7da9c3-b819-ae73-d273-18aa5ef7e115@roeck-us.net>
Date:   Fri, 14 May 2021 15:23:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <OS3PR01MB64529FC38D0AD138EC814DCCD2509@OS3PR01MB6452.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/14/21 3:11 PM, Adam Vaughn wrote:
> Hi, Guenter,
> 
> Attached is the datasheet behind this change. See section 11 for the revision history.
> 

Great, thanks. I'll apply the patch.

Sorry for the trouble, I wish things were easier :-(.

Guenter

> Regards,
> 
> Adam Vaughn
> Staff Product Marketing Manager
> Core Power Solutions
> Mobility Infrastructre & IoT Power Business Division
> Renesas Electronics America
> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Friday, May 14, 2021 4:43 PM
> To: Grant Peltier <grantpeltier93@gmail.com>
> Cc: linux-hwmon@vger.kernel.org; Grant Peltier <grant.peltier.jg@renesas.com>; Adam Vaughn <adam.vaughn.xh@renesas.com>
> Subject: Re: [PATCH] hwmon: (pmbus/isl68137) remove READ_TEMPERATURE_3 for RAA228228
> 
> On 5/14/21 2:19 PM, Grant Peltier wrote:
>> The initial version of the RAA228228 datasheet claimed that the device
>> supported READ_TEMPERATURE_3 but not READ_TEMPERATURE_1. It has since
>> been discovered that the datasheet was incorrect. The RAA228228 does
>> support
>> READ_TEMPERATURE_1 but does not support READ_TEMPERATURE_3.
>>
> 
> Sorry that I have to ask, but do you have some kind of reference for that ?
> Due to recent events I can unfortunately no longer trust such submissions without some kind of confirmation (for example resend from your Renesas e-mail address if that is possible, or ask someone from a Renesas e-mail address to send a Reviewed-by: / Acked-by:).
> 
>> This change fixes an error introduced in commit:
>> 51fb91ed5a6fa855a74731610cd5435d83d6e17f
>>
> 
> That should be
> 
> Fixes: 51fb91ed5a6fa ("hwmon: (pmbus/isl68137) remove READ_TEMPERATURE_1 telemetry for RAA228228")
> 
> Thanks,
> Guenter
> 
>> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
>> ---
>>    drivers/hwmon/pmbus/isl68137.c | 4 ++--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/isl68137.c
>> b/drivers/hwmon/pmbus/isl68137.c index 40597a9e799f..1a8caff1ac5f
>> 100644
>> --- a/drivers/hwmon/pmbus/isl68137.c
>> +++ b/drivers/hwmon/pmbus/isl68137.c
>> @@ -244,8 +244,8 @@ static int isl68137_probe(struct i2c_client *client)
>>    		info->read_word_data = raa_dmpvr2_read_word_data;
>>    		break;
>>    	case raa_dmpvr2_2rail_nontc:
>> -		info->func[0] &= ~PMBUS_HAVE_TEMP;
>> -		info->func[1] &= ~PMBUS_HAVE_TEMP;
>> +		info->func[0] &= ~PMBUS_HAVE_TEMP3;
>> +		info->func[1] &= ~PMBUS_HAVE_TEMP3;
>>    		fallthrough;
>>    	case raa_dmpvr2_2rail:
>>    		info->pages = 2;
>>
> 

