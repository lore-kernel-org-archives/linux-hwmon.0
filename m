Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E81C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Nov 2022 16:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiK3QzR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Nov 2022 11:55:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbiK3QzD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Nov 2022 11:55:03 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F728BD2E
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 08:55:01 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d18so6481318pls.4
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2022 08:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+g/jHLY0aAFRngqEGFPu2+RdCrIKIIUQe7R5FX4Jk9Y=;
        b=SgJE/KOUSZfpGlH2EoGHITb4dVGoN2kJComRIr19uef7ML+g1QWy7qoAoMRYaASu4X
         b3LscJS5iCrhL7PN07/GeMQq79e/kFVBAopunGjIaL2dBBxCU9XEUTgHKFvpqXuuLQIb
         P126mesFL268jmdTcWVFoVfuWOdo2bpShPWix/xG7Bfi3AXKJMRDx87Cpar2JqPy1yKv
         aG62m/l9gRseO+kb1LMyuHEw9pb1sEFYHDOP64j5Xu+cq7DHmanqDmwmOhwJrcn61Vyz
         Pl/7TQUIEDxoUBilfoWUeMd8ybS98aqEfJpo3+aA6cCVTZcZtlyvM+iZqusArgmpLtvs
         Bq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+g/jHLY0aAFRngqEGFPu2+RdCrIKIIUQe7R5FX4Jk9Y=;
        b=QwZM0AwTBBNh2hqFZBotbEdITSDVdl68BHCP8hIG1AqlODyY5tqAcaGjAfN87K/jtV
         Sek8zWGEJrdF0hPCY+BdZcnt+tyn7UkbDFFe605t0N/QJe2EjwZtAYlE0GvulGDKbY48
         0LnnQL3Fa3EfujJdGV6j68WIh4NZNHESLriEj6lFln3zpCApYwXdrYQXEjE00X8j3SA9
         jQeHo4eTdfwp81GRwe9tyHN9UrytEUeBnKSCYx+1inkhFHtdDTsHBkewIEJI7xf3lkru
         KnMNbqfhJVI4LrGM9Jiu2b9Nhx9ZQYE+Xezo7IcQTRz96ffdNcqBkiwJuDzaUGccuRiJ
         Fg/A==
X-Gm-Message-State: ANoB5plHCXe6ue5pYQnChFasMRZmaUsD+DzgwFgUanR60wxIjIkxB7DE
        OWxsrljPNhsOEj5ZPEIGvklN8g==
X-Google-Smtp-Source: AA0mqf4XK5ZzgS/tFrhMtMg023uNrGhhuJ7b052hADmi3LorUe/c3mRoK4C10G+lUPphedFv0T18bQ==
X-Received: by 2002:a17:902:a60d:b0:189:65c4:ab5c with SMTP id u13-20020a170902a60d00b0018965c4ab5cmr28640339plq.5.1669827300575;
        Wed, 30 Nov 2022 08:55:00 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id g19-20020a170902e39300b00189a540f545sm1700797ple.191.2022.11.30.08.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 08:55:00 -0800 (PST)
Message-ID: <bf6e3ef9-4e9f-a6da-1a12-e7d0f3b44898@9elements.com>
Date:   Wed, 30 Nov 2022 22:24:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus/core): Implement irq support
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org
References: <20221128174715.1969957-1-Naresh.Solanki@9elements.com>
 <20221128174715.1969957-3-Naresh.Solanki@9elements.com>
 <bda19726-74f3-b76d-c30c-eb2543979690@roeck-us.net>
 <1b015a86-0d65-8597-0512-b313769e307b@9elements.com>
 <6522b785-9fcf-93ce-9a0d-6539ca8e18a2@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <6522b785-9fcf-93ce-9a0d-6539ca8e18a2@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On 29-11-2022 08:59 pm, Guenter Roeck wrote:
> On 11/29/22 00:16, Naresh Solanki wrote:
>> Hi Guenter,
>>
>> On 29-11-2022 04:39 am, Guenter Roeck wrote:
>>> On 11/28/22 09:47, Naresh Solanki wrote:
>>>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>>>
>>>> Implement PMBUS irq handler to notify regulator events.
>>>>
>>>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>>>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>>>
>>> As I am sure I have mentioned before, this needs to primarily handle
>>> sysfs notifications to hwmon status attributes and to generate kobject
>>> events. Regulator events are secondary / optional.
>>
>> Based on previous feedback, PMBus interrupt handler is made generic
>> Based on the use case I have in my machine, my application need to 
>> monitor regulator event as soon as they occur and hence the patch.
>>
> 
> I understand, but this isn't just about your specific use case. Your use 
> case is
> what triggers the change, and ensures that the code change is tested, 
> but the
> impact by far reaches beyond your specific use case and needs to address 
> other
> (much more common) use cases as well. Interrupt support is needed in the 
> pmbus
> code, but it needs to address the common use case first, and that is 
> reporting
> the status via sysfs notifications and kobject events.
Agree. I've done the implementation. Will submit the change as separate 
patch along with the series.
> 
> Thanks,
> Guenter
> 
Regards,
Naresh
