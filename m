Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAB1ECAAD3
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Sep 2022 14:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233986AbiIAO6n (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Sep 2022 10:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234488AbiIAO6m (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2022 10:58:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CE57A533
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Sep 2022 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662044320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bE0TdgbHTlPub8+p6QK52e8GGKi3CU/yaDOC4uYWKQc=;
        b=MbMqew7jKnAwnZSw1KyqruS+AdPl4wnoft7GP5ZSMtyBEyey31y1IqUza/FZW4KEVGlAOK
        Ru8Oks78N/xQnGs3hiho6SJvS+D9mx5Lk/VPyPZCPWj9gpmwN5HffIq3T0JBCcsUGem/K2
        /2vDqwLpsfThkHJNZLT0L2/IEsTCG4k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-CwpH2wmvMeyzbrnccbvvKg-1; Thu, 01 Sep 2022 10:58:39 -0400
X-MC-Unique: CwpH2wmvMeyzbrnccbvvKg-1
Received: by mail-ej1-f72.google.com with SMTP id qf22-20020a1709077f1600b00741638c5f3cso5975589ejc.23
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Sep 2022 07:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bE0TdgbHTlPub8+p6QK52e8GGKi3CU/yaDOC4uYWKQc=;
        b=F7T2SHsIYfAaoTir3d59dOUZI9qZObnRQ3cLZ5ssQFF+nsRSMzwGBOaVkatNp+781v
         moBNuriV2WzTabnmz83vOgF+Rm/edAyuIQaugmv69O6/1vAc2m52ZfCkW1/lfSSppju8
         KXrjySy/g1xKTXBO/GJEHV8k3hZL7894//pNkM9wChZ9RoUiiMt/O8nJV5a47H2j1T6i
         QhRRCa3LTFYv0z7d4SKip6PtON1VXaNhuoM3kxM3UG33hJx3o6BFQJ5jWrzKcKck3nlt
         CaMbHuVKqBKfXjk8jw6RGcCuscMGbo5FIGccYVPMVHXIhbhREchPzTEnasTD04fqpUiS
         34zQ==
X-Gm-Message-State: ACgBeo0RjXD4LACHr/AhztzcxoAC3XxUB2LsnJADhMieXOwiyXe9ISDC
        upNgSUWPvblLzK2pkkXe41OLF4ZjZNEVfBrapXfoBzy1Glux/hjIPNkZYYiZhBy3hASs499z+5g
        VlmknJIeSMV/fLunWQivBiYA=
X-Received: by 2002:a17:906:99c1:b0:6fe:b01d:134 with SMTP id s1-20020a17090699c100b006feb01d0134mr23529858ejn.598.1662044318570;
        Thu, 01 Sep 2022 07:58:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR58ylG7U3rzoPStiTD88Zrl0UoM9RaMtg4Tbq8sHhi5YXMNCfe2Ur7IUrMZc7HoxVjyrPA0Lw==
X-Received: by 2002:a17:906:99c1:b0:6fe:b01d:134 with SMTP id s1-20020a17090699c100b006feb01d0134mr23529848ejn.598.1662044318384;
        Thu, 01 Sep 2022 07:58:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id o1-20020a170906768100b0073d5e1edd1csm8506873ejm.225.2022.09.01.07.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 07:58:37 -0700 (PDT)
Message-ID: <5bd15802-a269-420c-7071-1cae63fa6070@redhat.com>
Date:   Thu, 1 Sep 2022 16:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] asus-wmi: Increase FAN_CURVE_BUF_LEN to 32
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        "Luke D. Jones" <luke@ljones.dev>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, markgross@kernel.org
References: <20220828074638.5473-1-luke@ljones.dev>
 <20220829133556.GA3766826@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220829133556.GA3766826@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi All,

On 8/29/22 15:35, Guenter Roeck wrote:
> On Sun, Aug 28, 2022 at 07:46:38PM +1200, Luke D. Jones wrote:
>> Fix for TUF laptops returning with an -ENOSPC on calling
>> asus_wmi_evaluate_method_buf() when fetching default curves. The TUF method
>> requires at least 32 bytes space.
>>
>> This also moves and changes the pr_debug() in fan_curve_check_present() to
>> pr_warn() in fan_curve_get_factory_default() so that there is at least some
>> indication in logs of why it fails.
>>
>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
>> ---
>>  drivers/platform/x86/asus-wmi.c | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 3d9fd58573f9..11203213e00d 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -108,7 +108,7 @@ module_param(fnlock_default, bool, 0444);
>>  #define WMI_EVENT_MASK			0xFFFF
>>  
>>  #define FAN_CURVE_POINTS		8
>> -#define FAN_CURVE_BUF_LEN		(FAN_CURVE_POINTS * 2)
>> +#define FAN_CURVE_BUF_LEN		32
>>  #define FAN_CURVE_DEV_CPU		0x00
>>  #define FAN_CURVE_DEV_GPU		0x01
>>  /* Mask to determine if setting temperature or percentage */
>> @@ -2383,8 +2383,10 @@ static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
>>  	curves = &asus->custom_fan_curves[fan_idx];
>>  	err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, mode, buf,
>>  					   FAN_CURVE_BUF_LEN);
>> -	if (err)
>> +	if (err) {
>> +		pr_warn("%s (0x%08x) failed: %d\n", __func__, fan_dev, err);
>>  		return err;
>> +	}
>>  
>>  	fan_curve_copy_from_buf(curves, buf);
>>  	curves->device_id = fan_dev;
>> @@ -2402,9 +2404,6 @@ static int fan_curve_check_present(struct asus_wmi *asus, bool *available,
>>  
>>  	err = fan_curve_get_factory_default(asus, fan_dev);
>>  	if (err) {
>> -		pr_debug("fan_curve_get_factory_default(0x%08x) failed: %d\n",
>> -			 fan_dev, err);
>> -		/* Don't cause probe to fail on devices without fan-curves */
> 
> The pr_warn() should be here. If you want to have a message from the call
> in fan_curve_enable_store(), add dev_err() there.

Guenter I can understand where you are coming from with the warn vs err
thing but IMHO that is a minor concern and I'm actually a fan of pushing
error logging closer to the first failing call so that we only have
one place to log the error instead of having to log it separately in
all the callers.

So I'm going to take this patch as is.

Regards,

Hans

