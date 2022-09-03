Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC03ECAAD4
	for <linux-hwmon@archiver.kernel.org>; Sat,  3 Sep 2022 15:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbiICPmk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 3 Sep 2022 11:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiICPmi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Sep 2022 11:42:38 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F4D558F4
        for <linux-hwmon@vger.kernel.org>; Sat,  3 Sep 2022 08:42:38 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id e31-20020a17090a6fa200b0020025bf26c5so966428pjk.5
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Sep 2022 08:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date;
        bh=RihxUErPjGjCRqUDS9HiNVuBbHa0QuWFBeZk5IF4d5A=;
        b=LhnvBaEGtF/EwExLuye2jtEj11YmcGxHMSpXEVByoR2rfSw7wnBM3I/8XvCadrYDaP
         USeKz8cbPrXg/ksnsKvEj5dXkgqMnkadX/nQrkxAf9QBYgo6+CiM8L9fy73ILY/9AM46
         /NE8v2Ay6moBLmAT/SClw+KDYOEAdpl7sxlp6dgkMVxIL9xiu2kJwDwaXfAUbqjTQw1k
         WZLB26r5d+V7bjyZn9fQW9xw2+tjEPZHiy7BZ9OnH/N5LxlVfHD/DuPOyeaKDUqdloXc
         4mQ1BVpLAmUGjR7ZbFi/KFyqfLM54RLyrQLwqkvsGMP1M0kbFGzfp3VdhrVwFc4L4Oje
         tQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RihxUErPjGjCRqUDS9HiNVuBbHa0QuWFBeZk5IF4d5A=;
        b=8PmmCcuaopK1048mlQ/BakvR1V0RSPcu7LArMq7WSnOspisMg8EyJ6KIKgLu33Y+ai
         eHc19TtxJB+NYVUq0cZAtnMvsAuZeZgEcO9K/81xvcWMzkAeCt1/OrD3L94nKJbLZLQw
         uXSzWxqgqN4BNaTbxPjxrz/NFCdqc0kXJB61kWhdB3yC+hYZVEwnT9ZYHrDGNJR/RFM6
         0KhYJ+eZtEwI/J3JMMEXSgytLibZSFnlFJ8kAjxE2xSWrF1+epdfEqwh5ow45WvNm5uW
         hEFG08EfF3sSaQ1CsiGTzuyVkEVKgbDpxC2cZB2VJPtBSJQH5Zt9quuda2mgdB4CASHj
         MbxA==
X-Gm-Message-State: ACgBeo0QALwnZ7tqgR66ud0UJihJM7kCDwQCoMbRj+DurG3qG0PwcQh0
        PwrK9JsQnZL2+wZwGYODPc8=
X-Google-Smtp-Source: AA6agR6V9DCFe/r6xK476t79zuEgn+XddXPAXY2KeS67DfvvT3HPza5sfbINa1GzuaKs/aD1Yw5gaA==
X-Received: by 2002:a17:902:8bc7:b0:172:c32f:7d30 with SMTP id r7-20020a1709028bc700b00172c32f7d30mr39289655plo.48.1662219757601;
        Sat, 03 Sep 2022 08:42:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 136-20020a62158e000000b0052d52de6726sm4109083pfv.124.2022.09.03.08.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Sep 2022 08:42:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5e42685d-ae82-d74d-4883-d8a9e9fcb243@roeck-us.net>
Date:   Sat, 3 Sep 2022 08:42:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Eugene Shalygin <eugene.shalygin@gmail.com>
Cc:     Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org,
        regressions@lists.linux.dev
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
 <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
 <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other
 distributions
In-Reply-To: <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/3/22 08:13, Eugene Shalygin wrote:
> Guenter,
> 
> yes, there is a patch that I don't really understand, but it fixes a
> very similar problem:
> https://bugzilla.kernel.org/show_bug.cgi?id=216412 I will test today
> that change with a hardware where it needs to autoload and submit the
> patch if it works.
> 

I don't understand why that works either. Maybe it interferes with other
PNP0C09 devices and/or the code in drivers/acpi/ec.c.

Couple of comments:

- You'll need to drop __init.
- No need or reason to rename asus_ec_sensors_platform_driver
   to asus_ec_sensors_platform_driver_probe.

Thanks,
Guenter

> Best regards,
> Eugene
> 
> On Sat, 3 Sept 2022 at 17:09, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 9/3/22 04:00, Christopher Klooz wrote:
>>> Hi Eugene,
>>>
>>> Currently, we have user reports of at least 4 Fedora installations that have issues with asus_ec_sensors since 5.19.4. They remain in 5.19.6.
>>>
>>> All issues can be solved by blacklisting asus_ec_sensors.
>>>
>>> https://bugzilla.redhat.com/show_bug.cgi?id=2121844
>>>
>>> The bugzilla report contains kernel logs of two machines, one with nvidia-driver and one without a tainted kernel.
>>>
>>> The report and the contained ask.fedora link contain some elaborations of how the issue manifests at the users' machines. The major issue is a wrong output of battery power percentage (in one case it gets stuck, in the other cases is becomes erratic). Also, in one case it has effects on suspending (see the report).
>>>
>>> On the Internet, there are already reports from other Linux distributions noting the issue and the same solution (blacklisting).
>>>
>>
>> Eugene,
>>
>> do you have an immediate idea other than reverting the patch pointed to in the bug report ?
>>
>> Thanks,
>> Guenter
>>

