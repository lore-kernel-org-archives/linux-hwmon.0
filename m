Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BD9C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Feb 2022 22:29:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbiBEW3h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Feb 2022 17:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbiBEW3g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Feb 2022 17:29:36 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8410CC061348
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Feb 2022 14:29:32 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id m10so13006684oie.2
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Feb 2022 14:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OEGA4Djoag/xhVF1ppGgvtEeeKjHvaVZ6NmQRIUvTbI=;
        b=MpAUneq3mS1FWAHXK6A0lm2FLXdt6Lu3Xp4hr7Q7Skv2JIwqi2yQVF6vT96O59xpSQ
         zXLGwpA8o2G06knMkg1G+TWrZvSgiCgKVjVSVQPfyoJ1Ij+JWBBY4h/hMM6H3il45zb2
         yDyHXsWg09zu3wqY27pQV/c5Y6EG7s7Ht/fKFs/MmvpWztGPNsatBY9CS+jrFQY9LWRq
         Jvcex1KCDL7TvYopwOBz4oJxgHq/8LXbgmXLeNidt1PeVA1+mQnrIBshXIdDF3nX1QYf
         YUyohPv9EbvLix8J65ZrSt8PrWyXRd4iuvc+KSs1+1/UYvWM1QQOLf3yWdWvufo4+KK1
         2ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OEGA4Djoag/xhVF1ppGgvtEeeKjHvaVZ6NmQRIUvTbI=;
        b=ojmES0VzKpIJc5iYy8CjAttopcEqNyaI8fDb7LRz1SmFWX25AOVwju3lregdRtcf4f
         HOQ+Utqc0d5LDi78RM2BwdxUTgUgwo8j/5B6VVnJAyM5Khgt4dFyWP6qghOExm/OMQyQ
         3FGNHKVZcQ4hGB6YmSbMO0a026krKVreCw40I3X3K0hc5mA1RanxE0rDGN5mLmAwa11c
         lwLe7Oknf+FKJUhCyWt6CUJUTPnaE276+fnhn1MucLCbB2T24SxPCTgkEA3NdfF1QQ4h
         KJYBdkvqtLH2pNPPe3xy0dp/MyabjdbMWeW71btLW9NWbFfjfYMavZcoUZfhcgHiDWSy
         szgw==
X-Gm-Message-State: AOAM530JEuOerlogIzGmqXFETP9aHSwRzy8ppXJ7mER4SRMgM0gm+11B
        9rer3oyyD1gIWL24bM/+4DS35w6mNV0PdA==
X-Google-Smtp-Source: ABdhPJz9t4srP18UdVjvWxK/suuHGl1fFzc48SmURiRO+cdyYc+iwIikf4sJg9agMqZHHgeKyUSLoA==
X-Received: by 2002:a05:6808:168b:: with SMTP id bb11mr2416420oib.184.1644100171809;
        Sat, 05 Feb 2022 14:29:31 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s3sm2630053ois.19.2022.02.05.14.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Feb 2022 14:29:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bdf16ddb-3774-6894-474d-d42e3f4b6fe8@roeck-us.net>
Date:   Sat, 5 Feb 2022 14:29:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1] hwmon: (tc654) Add thermal_cooling device support
Content-Language: en-US
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <20220203212853.238739-1-chunkeey@gmail.com>
 <20220205182302.GA3079303@roeck-us.net>
 <5d5f6937-b09e-b5e3-d0bb-33713f39832c@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <5d5f6937-b09e-b5e3-d0bb-33713f39832c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/5/22 13:05, Christian Lamparter wrote:
> On 05/02/2022 19:23, Guenter Roeck wrote:
>> On Thu, Feb 03, 2022 at 10:28:53PM +0100, Christian Lamparter wrote:
>>> Adds thermal_cooling device support to the tc654/tc655
>>> driver. This make it possible to integrate it into a
>>> device-tree supported thermal-zone node as a
>>> cooling device.
>>>
>>> I have been using this patch as part of the Netgear WNDR4700
>>> Centria NAS Router support within OpenWrt since 2016.
>>>
>>> Note: Driver uses imply THERMAL. The driver previously worked fine with
>>> just the hwmon interface. Now, if CONFIG_THERMAL is not selected, the
>>> devm_thermal_of_cooling_device_register() will be a
>>> "return ERR_PTR(-ENODEV)" stub.
>>
>> What good does this do ? THERMAL is bool, so it is either there
>> or it isn't, and the IS_ENABLED() in the code handles that.
>>
>> According to Kconfig language, "imply THERMAL" means that
>> THERMAL could be n, m, or y if SENSORS_TC654=y. THERMAL=m would,
>> if it were supported, be clearly wrong in that case.
>>
>> Prior to commit 554b3529fe018 ("thermal/drivers/core: Remove the
>> module Kconfig's option"), THERMAL was tristate, and you would have
>> needed something like "depends on THERMAL || THERMAL=n". This
>> is, however, no longer needed.
>>
>> Given this, I really don't understand what the imply is expected
>> to do. The above text does not explain that. Please either drop
>> the imply or provide a better explanation why it is needed.
> 
> Oh, okay. Yes, you are right. A lot happend since 2016, I have to admit,
> I was updating the driver code, but haven't kept track with the THERMAL
> change.
> 
> So, I'm planning to address your comments in the following way:
>      - Drop imply THERMAL (no replacement)
>      - add __maybe_unused to the new functions+struct
>        In the !THERMAL case, compilers will spot the static declarations.
>        If you prefer, I could instead add a #ifdef CONFIG_THERMAL [...] #endif
>        around the new cooling functions and the tc654_fan_cool_ops struct.
> 
>      - Changed in tc654_probe() that IS_ENABLED(CONFIG_THERMAL) to
>                      IS_BUILTIN(CONFIG_THERMAL)
> 

Please no #ifdef, and __maybe_unused should not be necessary unless you use #ifdef.
I don't understand why IS_BUILTIN() instead of IS_ENABLED() would be necessary.

/*
  * IS_BUILTIN(CONFIG_FOO) evaluates to 1 if CONFIG_FOO is set to 'y', 0
  * otherwise. For boolean options, this is equivalent to
  * IS_ENABLED(CONFIG_FOO).
  */

Thanks,
Guenter

