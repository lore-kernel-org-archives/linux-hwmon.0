Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EDCC4332F
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Oct 2022 16:36:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbiJDQg4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Oct 2022 12:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbiJDQgz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Oct 2022 12:36:55 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555E15F111
        for <linux-hwmon@vger.kernel.org>; Tue,  4 Oct 2022 09:36:54 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id l12so13152297pjh.2
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Oct 2022 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date;
        bh=wp//9yqFNE44vIHLwW4JpCFMrNdXWZc8s+U66wxgA/M=;
        b=qNFxBIW5dDRt07yAMxdSznSh2DK/H+LisKlt3FDMJNwKrGWt+BHRrHuvOC0u6LDAFx
         jEfHDnh9vMsECC/fz9+jtMtvrw81HolsBUZQpucp40XR0L5Xk24ogP1BcEd/oqPZVRRi
         lqyYgKoorXLiTVd3n0Q+677gYA5fHH/LNs7isCbhRgwIvMMKedVvdPTuXLr+6umXgNgc
         RzzW1PopqNaVaj/BgDi8Z2fX2lC1qBv4HyGL02zjPYBdG1LF/uJrlEs7PPIau0qRSsmE
         EGOAI8YOLFAc0qOTr0ln6KphqPNolgMj45BhSPjPOCSM1+0UAETIv4LDoGRLQRNm/JwV
         Twww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wp//9yqFNE44vIHLwW4JpCFMrNdXWZc8s+U66wxgA/M=;
        b=e+PUvxNrSuN69X/pe8NqSrmwVeU+Cxzjhb2pDYoSK5Z/FdIYhwBf61sNbL2Jslhjh7
         mg6jSAq5B/B4ncqARxh/3iyZhXGVRvNTTsy8UIjMA/HorehHBTNbfCp1+Il7KedS/VjU
         fb4MPNatfGA8t+K8r6a5Dcwjw97xcWQlYZckj5N0zye2cVhrssjdBqyYgCULz+ZJW7Zf
         miFJGTKHHjexgM/GpNGnqGyhztbJ0ZfjUav62hPauqidpY4CRc5wv5yUGlytsUC4E7ZK
         W7EAanS2kz4W6p67Uec8ZVc0WQMqgy0DpZZ9qJRgnH8hR6GIR+6wdCr/0CrYXDuJKYBQ
         a3tQ==
X-Gm-Message-State: ACrzQf2gQTnQooq4iBUvNlJ4ZerdApl0FnKJafHt/zt8D7JtDIJWuP5f
        gOpYPdP6mhZ/Gz27CwcvkcnRhe7iS5MJ/g==
X-Google-Smtp-Source: AMsMyM7Wwb7Rlte1j8aEZwpda2P/vAgvIrMiDSFCcQTF1kGLjsMBfQKm5jM+/93w2kccMCxhfSet+g==
X-Received: by 2002:a17:903:32c2:b0:17f:7e13:87db with SMTP id i2-20020a17090332c200b0017f7e1387dbmr409630plr.119.1664901413797;
        Tue, 04 Oct 2022 09:36:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s10-20020a63e80a000000b0042fe1914e26sm8720323pgh.37.2022.10.04.09.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 09:36:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f2e39bb8-1903-9d18-deab-b7e80f5e8edf@roeck-us.net>
Date:   Tue, 4 Oct 2022 09:36:50 -0700
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
 <3d2815ae-00f5-5333-9ce0-8f6d5f1e5887@roeck-us.net>
 <eeacbfb8-1e28-072d-2428-931e3270ddb8@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/2] it87: Add param to ignore ACPI resource conflicts
In-Reply-To: <eeacbfb8-1e28-072d-2428-931e3270ddb8@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/4/22 09:24, Ahmad Khalifa wrote:
> On 03/10/2022 21:50, Guenter Roeck wrote:
>> On 10/3/22 13:30, Ahmad Khalifa wrote:
>>> On 03/10/2022 19:10, Guenter Roeck wrote:
>>>> On Sun, Oct 02, 2022 at 06:43:00PM +0100, Ahmad Khalifa wrote:
>> They are unrelated, period. You only consider systems where a resource
>> conflict exists. Also, you could (try to) use acpi_enforce_resources=lax
>> instead.
>>
>> Everything else is just a coincidence that applies to _your_ system.
>>
> [...]
>> That isn't the point here. The problem is not with the patches, it is with
>> the rationale for the patches.
>>
> Fair point.
> 
> The force_id change is warranted on its own, even without the ignore_resource_conflict because:
>   - Chipsets will reply with all 1s if no LPC peripheral is connected
>     Useful for lots of systems with a single device
>   - IT87 will reply with all 1s if you don't enter config space correctly
>     Useful for those who override with a known id, but the device is
>     quite different
>   - The driver supports 2 sio devices, but the use of force_id is
>     mostly a single-device use case. It doesn't support forcing two
>     different devices, so it's safe to assume a non-existent device
>     is not expected for those users.
> 
> My systems run mostly tainted Kernels and I can even grab the temps with a shell script, so I'm not worried about my systems, but they're the
> only ones I can test with :)
> 
> The kernel parameter is an option that works, but it's a bit more
> technical for general users to update their bootloader and change
> modprobe config at the same time. This whole patch is about making
> the it87 more usable with less compile/install work.
> 

That is not an argument. If acpi_enable_resources=lax would work,
there would be no reason for the ignore_resource_conflict
module parameter.

> 
> I can prep v3 with both changes if that's still a good approach.
> 
> 
Here is the original rationale for introducing ignore_resource_conflict.

     It appears that some BIOSes reserve ACPI resources without using them,
     and acpi_enable_resources=lax seems to result in failures to load
     certain drivers.

     Introduce a 'ignore_resource_conflict' module parameter as alternate
     means to ignore ACPI resource conflicts.

The rationale for the force_id change was:

     If the reported chip ID is 0xffff, there is no chip, and forcing the chip
     type does not add value.

That is it. No other rationale is needed, and the patch introducing
ignore_resource_conflict needs to explain (like the above) why
acpi_enable_resources=lax is insufficient.

Guenter
