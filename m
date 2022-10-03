Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545B9C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Oct 2022 20:50:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbiJCUuP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Oct 2022 16:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiJCUuN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 16:50:13 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107921D658
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 13:50:12 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id gf8so8349746pjb.5
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Oct 2022 13:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date;
        bh=2+CBdqj9JiT54Eunbr+U31hMwewCMN3/TUllyS1zV2I=;
        b=PDeK7Y9utLMN6vAl39g4H4GpGJHYOxjWa8psPTuRy41/3Zr5iMpsD3+CNQnHlrJ+Od
         bFgd+tUiKioR3Qiq66ap1pDkj6hdAznFfNNS0dYNKZtmq4cOLOiLLk4Cabwo1NHaLI1a
         bGn5GcRgbJ/mgrRmKd8wmtx2kCqmTVO6O3VQt4UvZeHeYULEVMzLfGh9W52ZX3AITDtl
         w6/kBzxUAY5N5D20+V2Rgn+k6RCgmVGfEJRJxI4orW2TC2w60R2D6PzfuPJyxnxyXLOe
         M21OOvGYX3sZPYESolUWg1c2xZS/vc0UNIVsAACTwRnHJ9RYH4q1IB21uQBLxIlvcOzb
         cJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2+CBdqj9JiT54Eunbr+U31hMwewCMN3/TUllyS1zV2I=;
        b=sJoOh0x51OpPZ+QntLnIXDNRNin6wx+2c8TNbivgzQA4WNPX3K8jmlgGAhBK61z36w
         TaI1z1UQMbMYoOqrgdhFVaGa6rljm7YotvGbGkUd4q904OCJGDzy4t1OvUxTAbK9DJz0
         AXTU1vWtekJYMCN8RWNui+25liEO0uiIZUi2X9r7T/ZMeof/8WVmdnuI3EdICQDhqh2H
         PBrQ3d9Ci44r85cMSIu9+mculmTcX0IlIz7um6AgQKM4A0gC66OX5u6wa7+NMxONcN0a
         7MaoBEZAMGD50W3uGzFu3vIGNtB+/O47K6T03mV/Ms+e3ZlJjDCmE9oHHuVb0cYMX8Ny
         WK7g==
X-Gm-Message-State: ACrzQf2HicKtA4wT0nvMAn1GTHWm4D9jkBUkvUMxgKZ0s/dVCnSJkAob
        qYJunp6QNNwe0dmjNpX0iLj/RAwpDjIrcg==
X-Google-Smtp-Source: AMsMyM7SCdJb1KykAo2gHH0O+AFNMPXIML5m80fenzG1k+E/537R1eYCBwzc4qkqYbffKDP4XdkaRw==
X-Received: by 2002:a17:902:a383:b0:176:dd41:4f56 with SMTP id x3-20020a170902a38300b00176dd414f56mr23722153pla.104.1664830211495;
        Mon, 03 Oct 2022 13:50:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h15-20020a17090a470f00b001faf7a88138sm6651817pjg.42.2022.10.03.13.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 13:50:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3d2815ae-00f5-5333-9ce0-8f6d5f1e5887@roeck-us.net>
Date:   Mon, 3 Oct 2022 13:50:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20221002174259.14609-1-ahmad@khalifa.ws>
 <20221002174259.14609-2-ahmad@khalifa.ws>
 <20221003181002.GC1023056@roeck-us.net>
 <b493e629-c6a5-e705-6574-060550f5c977@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/2] it87: Add param to ignore ACPI resource conflicts
In-Reply-To: <b493e629-c6a5-e705-6574-060550f5c977@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/3/22 13:30, Ahmad Khalifa wrote:
> On 03/10/2022 19:10, Guenter Roeck wrote:
>> On Sun, Oct 02, 2022 at 06:43:00PM +0100, Ahmad Khalifa wrote:
>>> Add in the parameter to ignore ACPI resource conflicts so that modprobe
>>> can use the force_id parameter when ACPI has the same address mapped.
>> force_id and ignore_resource_conflict are orthogonal / unrelated to each
>> other. Why create a dependency or correlation where none exists ?
>>
>> The reason for introducing ignore_resource_conflict in the driver was that
>> some systems didn't like the system wide parameter (acpi_enforce_resources)
>> to ignore resource conflicts and failed to boot if it was set to lax
>> or disabled.
> 
> They're unrelated in their purpose, but adding ignore_resource_conflict creates an unusual situation that doesn't make it safe to use on its own. Because the driver registers two platform devices, the second one will start probing a random base address (0xFFF8).
> 

They are unrelated, period. You only consider systems where a resource
conflict exists. Also, you could (try to) use acpi_enforce_resources=lax
instead.

Everything else is just a coincidence that applies to _your_ system.

> It's not random though, because 0xFFFF & ~7 gets you there. But frankly, I don't know what normally lives there, so my initial opinion was that both changes should be a single commit to stop it87_find() from confirming that a device exists.
> 
> Just to be clear, currently, without the ignore_resource_conflict param, the driver just unregisters itself after the first of the 2 registers gives the ACPI conflict. So the issue of the second non-existant device, is not an issue.
> 
> Could separate the two patches completely, but ideally they're still together. What are your thoughts here?
> 

That isn't the point here. The problem is not with the patches, it is with
the rationale for the patches.

>> The third parameter is the access permission. It should be 0 or maybe 0000.
>> Why "false" ?
> 
> My mistake, out of tree convention. Missed that the param right above it uses a 0 convention.
> 

If there is such an out-of-tree convention, it is wrong. The
variable is not a boolean (it sets the runtime access permissions)
and must not be initialized with one. Case in point: Using "true"
as initializer would translate to permission 0001 (S_IXOTH,
execute permission for "other") which obviously would not make
any sense.

Guenter
