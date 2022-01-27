Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF25C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jan 2022 17:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244428AbiA0RRX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jan 2022 12:17:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244448AbiA0RRU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jan 2022 12:17:20 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B9DC06173B
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jan 2022 09:17:20 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id w133so7131648oie.7
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jan 2022 09:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=RGtIvwWOpPXW1OrxjYsKPcHqrKwtXzbtb2b3AY8cYrE=;
        b=h0Igrp094o20LdrKs6PR9sw7bqY6/WNOaP/urjWxnV8rjqGaPVYxbUSJiizxsa54py
         lLPxQ/5yJrPw187nfCOJ0Ntn2kD45dobwK8YdSIrFJjRV+pWJcXBZjaZmZvkuOyEkD55
         Ta8qW0DLYvZYu4o6YfiXdjLXilgaOXT3wB1ZggFB/Lvk9KLn3XzB9et1cNoRzmsrjawl
         LkmFGBkOSUY0XdD15P2SbI/hSpTccIPYN+6GlW27Ahauyb354nBw5nPa2tph8i1CFZrU
         UsFjlHatyN8mLGIBbWlZs3D0DMtO+Yk2+yHrUvb5J0Yu0NN577kVmYeqfikrsm3V3wzl
         PJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=RGtIvwWOpPXW1OrxjYsKPcHqrKwtXzbtb2b3AY8cYrE=;
        b=iXkMRnAXoIm6vNCHeWDpd7QALVlejdfvfeuSPx9pZxAcZP4u98FHls1GKUPEiHg/9n
         uTgYzts5H8aLaEPMqMB1oESfJtALUmJjB2D5SGPMGRUOUz9X1MjPgFwS6hF4UlOJnYIn
         qpMqdM0jBGHyMWJ1gK17JChuT/HJHpi2l9KRSiRJM4myFp2uZY+h+bRbSUD76E+oy1MR
         nF3VI+/FRaPn8i2Jt9mYzTX3tEry9/fUpzvT5MH5NAig/wdaIA2d9F/06N2Tx49pi7h2
         yq97UV6YMc9+IwYzhm7UFFNubBnFrrL9xKyE+KEawNnAvWtchbNay1Emz32sTKyS9EPg
         cM+g==
X-Gm-Message-State: AOAM532MXzAvLI/JKGnaD+hkmpskZ4tqrZ5xCmBfoFdJQQE5I1PbGzTR
        qpWRLXOShxZ8o0z2WgaoqzQ=
X-Google-Smtp-Source: ABdhPJxslCkkEpLN08+wMcRUenav2FKqKEHMs4+OOlDy9Lx/joBC2mJzBet2KY7zNt1kPTS7R1+x0Q==
X-Received: by 2002:a05:6808:e83:: with SMTP id k3mr7789026oil.215.1643303839358;
        Thu, 27 Jan 2022 09:17:19 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w42sm7260402ooi.40.2022.01.27.09.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 09:17:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <60926e65-3138-f6fe-5947-49e9d57cdc30@roeck-us.net>
Date:   Thu, 27 Jan 2022 09:17:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-hwmon@vger.kernel.org
References: <20220127085245.GF25644@kili>
 <TI4D6R.WEHYEPI3R49G3@crapouillou.net>
 <73331bd3-a252-4e11-e84c-8dfad3f62eb0@roeck-us.net>
 <YRND6R.QOHHPJC4LTBW1@crapouillou.net>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [bug report] hwmon: Add "label" attribute
In-Reply-To: <YRND6R.QOHHPJC4LTBW1@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/27/22 08:43, Paul Cercueil wrote:
> Hi Guenter,
> 
> Le jeu., janv. 27 2022 at 06:28:26 -0800, Guenter Roeck <linux@roeck-us.net> a écrit :
>> On 1/27/22 01:47, Paul Cercueil wrote:
>>> Hi,
>>>
>>> Le jeu., janv. 27 2022 at 11:52:45 +0300, Dan Carpenter <dan.carpenter@oracle.com> a écrit :
>>>> Hello Paul Cercueil,
>>>>
>>>> This is a semi-automatic email about new static checker warnings.
>>>>
>>>> The patch 073c3ea6c530: "hwmon: Add "label" attribute" from Jan 10,
>>>> 2022, leads to the following Smatch complaint:
>>>>
>>>>     drivers/hwmon/hwmon.c:825 __hwmon_device_register()
>>>>     warn: variable dereferenced before check 'dev' (see line 810)
>>>>
>>>> drivers/hwmon/hwmon.c
>>>>    809
>>>>    810        if (device_property_present(dev, "label")) {
>>>>                                             ^^^
>>>> The patch adds a new unchecked dereference
>>>
>>> I will send a patch to address that.
>>>
>>> I'm surprised that this function can be called with dev == NULL in the first place, though.
>>>
>>
>> Originally it was needed for the thermal subsystem, which did not provide a parent
>> device. By the time that was reworked, it was (mis-)used by the Loongson-3 hwmon
>> driver (which was never reviewed by a hwmon maintainer and does pretty much
>> everything wrong).
> 
> Where is that Loongson-3 hwmon driver? I can't find it anywhere.
> 

drivers/platform/mips/cpu_hwmon.c

> Maybe we can change that now?
> 

It should be a platform driver, it should only instantiate on hardware supporting it,
it should leave the name attribute alone, it should not generate its sysfs attributes
but use hwmon_channel_info / hwmon_chip_info / hwmon_ops, and it should use the
is_visible callback in struct hwmon_ops lm90_ops to determine if attributes are
visible. This is just the problems I noticed after a few minutes of looking into
the code; there may be more. This would be a lot of work, with no means to test
the result.

It might make more sense to add a warning to the hwmon core if dev is NULL.
We should also have a warning in hwmon_device_register_with_info() if the struct
hwmon_chip_info pointer is NULL (the API should really not be used in that case),
but that would require changing the thermal code to use with_groups(). Even that
would be less than perfect since it still lets people abuse the with_groups API
(calling hwmon_device_register_with_groups with NULL groups pointer does not
really make sense either). Given the nature of the thermal code, I don't know if
it would even be possible to fix that.

Guenter
