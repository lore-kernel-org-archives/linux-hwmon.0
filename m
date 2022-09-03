Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B4DECAAD5
	for <linux-hwmon@archiver.kernel.org>; Sat,  3 Sep 2022 22:00:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbiICWAK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 3 Sep 2022 18:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbiICWAJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Sep 2022 18:00:09 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3F739BAA
        for <linux-hwmon@vger.kernel.org>; Sat,  3 Sep 2022 15:00:08 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id 145so5266668pfw.4
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Sep 2022 15:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=Gm6usRBuViQMTZdHvwpmD6F0l3o1GEDbVd0wQwkYZq4=;
        b=DpZKsXVxh3/ck373aUGzS6k6rPWwRKMcx6cji7XOAi4kZ6wcAS83ajA3pf59MFEJkp
         lSs82WvqvpUYvcwZdUpV9QxyP43bvY/qeQfYaVN7fNWfJovhwPvkdGplxrrhnD2iKUze
         EEj4gJCa7iUG2N1WUJ6Cv9QlKfEoGvYDBVxFfPxH46ZpcsA8qHHJUZ76sN7kDhUlFBD9
         OAq/QogOkEkG6bmVjJ+lmi4GEUzP5fhF114QEFZGvQ2WU57oqx7Ff2w6qxIXou3J+Vxp
         Jv1SWHXmsyhRrOeqdkPACSKN6Hsre7M/kUvd0ou0LsH73+LY4gkadnAozN1YUb62+YsZ
         bqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=Gm6usRBuViQMTZdHvwpmD6F0l3o1GEDbVd0wQwkYZq4=;
        b=Xor50awveHm/zMPOjoBNU7r8Jps+QCZZ/fbgU+LaQyG7HQx+6KzgctKEd8MGkAMlBM
         ylXC8E1HVkKulywQ/yitfNM+zRiG8Uky8E/tR45iR4j6UUwne9d82yeY2dcCIHcvo3Sa
         LSsiEmrezwYNrmakONGKRx08x0M9E359r+/VCxBsiWS9FU6spIk8DMZlNWetPh4XWdlI
         JJ1s74xCN+R8hZOPV1Y9JC9+5t1CabexZBcMf3XgZ/FL8CgMaVPszwCZB0lliMYP7DWP
         Nv9F3HO/aMkFNZGZWSusGjndOXEHt9otgxxEbsMTQ4dXKHDd0/gdTM4CAvTw+YlBXsfA
         ptTA==
X-Gm-Message-State: ACgBeo1mD5AI4qiVxIeUT96rdtsqir61shjnmZ5A3LMlEkt9+nObWdYd
        VY7XA++tCtM4m5c0/wTld+JozY1IKo0m8Q==
X-Google-Smtp-Source: AA6agR7y3zdpqy5HjA/yYykeVMbx4JbrwG2lpfDnt4TDVGHWoESf0N13hrFCQQBi3PFLn/vdkmutnA==
X-Received: by 2002:a63:465e:0:b0:430:326c:7e6e with SMTP id v30-20020a63465e000000b00430326c7e6emr15500494pgk.84.1662242407445;
        Sat, 03 Sep 2022 15:00:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x6-20020aa79a46000000b0052d432b4cc0sm4435733pfj.33.2022.09.03.15.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Sep 2022 15:00:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ac202c2e-3add-2470-3fa6-85783c1494a0@roeck-us.net>
Date:   Sat, 3 Sep 2022 15:00:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other
 distributions
Content-Language: en-US
To:     Eugene Shalygin <eugene.shalygin@gmail.com>
Cc:     Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org,
        regressions@lists.linux.dev
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
 <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
 <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
 <5e42685d-ae82-d74d-4883-d8a9e9fcb243@roeck-us.net>
 <CAB95QAQ9EXX3uZhiZyxr=aAwiSR6j6i1GstFg9iX4eF06b5GUQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAB95QAQ9EXX3uZhiZyxr=aAwiSR6j6i1GstFg9iX4eF06b5GUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/3/22 12:40, Eugene Shalygin wrote:
>> I don't understand why that works either. Maybe it interferes with other
>> PNP0C09 devices and/or the code in drivers/acpi/ec.c.
> 
> Turns out the patch breaks sensors on a system where it should provide
> output. The module gets loaded but provides no output (which should
> mean the probe code is not executed). I will try to investigate
> tomorrow.
> 
>> Couple of comments:
>>
>> - You'll need to drop __init.
>> - No need or reason to rename asus_ec_sensors_platform_driver
>>     to asus_ec_sensors_platform_driver_probe.
> That's in order to not drop __init.
> 

What does the name of the struct platform_driver data structure
have to do with __init ?

Thanks,
Guenter
