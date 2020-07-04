Return-Path: <SRS0=THek=AP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3D9C433DF
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Jul 2020 23:56:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DF17206F8
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Jul 2020 23:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="on4PO+zT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbgGDX4n (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 4 Jul 2020 19:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbgGDX4n (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Jul 2020 19:56:43 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4020C061794
        for <linux-hwmon@vger.kernel.org>; Sat,  4 Jul 2020 16:56:42 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id o1so7354432plk.1
        for <linux-hwmon@vger.kernel.org>; Sat, 04 Jul 2020 16:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bo/g4lRy3XJSoX20bz485onCbEN5NrJoZ9TRkeGQQmE=;
        b=on4PO+zT/+7mPEfpZLq1qzhPDMBygXHchnnn8tFR+G/yaxXrsGwJaL52i73bdDvVPV
         uYsJUjGRA9Ms/D74cXtBuAEjLwnJzM+63ZKe6XslVK8MRVOE/5veqfmxw/XjTMcCOKeb
         DmZ4wmvyUNe6hXrF4foEHMcVr/Y9FwFJDrsy6LTGK8WhfTqovXuCDZeBU5LQFugviemy
         jv2V48I+Qz/4BZuGq4HcFuByawQnHZv9ObAXVp3o93cFFs8DGWTvd/QTH9j0QjUaqodA
         ZGOpA1cAfpLCFwsroS48xxqNBX1fm6NKxHxC300xJUi7wR9FPGWeqb1ZN2Z7yTcuZanF
         dO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Bo/g4lRy3XJSoX20bz485onCbEN5NrJoZ9TRkeGQQmE=;
        b=L40dFto6N+8lf+Wpog42uS2Cq1j+LsXsopGyKtflMhCGhLAd8QkEuYfWRvdWKhtBR4
         /P7j3B+OLLfY2y8DHoGgrPP5bVhBvow1+Vegl8b0I10WZFbXH2uXBMk2U28MY2pAo4bs
         rM3E6gqmi2eTBy5rhAeqtE6riXHqVRKq2m2nUFtpZsvPwrEm/4BE6egEcC0JKXSRP8sd
         w2HdAseZHH9nq8lpSy1BPRB6FMdZE10/qSFuF+FFHlJN36tNYzidZ74sjRKWhZUDFcou
         M+vCXXtov+fW40Vy04ygdyddmjKr6APMAsSsSh652cwlNTBH9SwgawQe0GxmYIspRa4N
         Wiug==
X-Gm-Message-State: AOAM531e9E8DLSO+S4h9LAsE/q/9KS1mePK7Cq31kXvihFnGom9fjpd8
        J8vkKMVfXofJUGJRtCpcJvAtiSKoT44=
X-Google-Smtp-Source: ABdhPJx8bMoMZUNOrvIkG8yyC9jhPvjP8L2YVcLElAbdZ4QXbkWSDrx3+56pyuijCJOOy/vbgP8ynw==
X-Received: by 2002:a17:90b:102:: with SMTP id p2mr46828972pjz.227.1593907002223;
        Sat, 04 Jul 2020 16:56:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k92sm14585461pje.30.2020.07.04.16.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2020 16:56:41 -0700 (PDT)
Subject: Re: [QUESTION] fan rpm hwmon driver
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <xU_nzuNaKzomGSEsIdtEGvDVgR0MuUoti45TC5WzkVu0FscRsOEp7dzY4tGOoUkvrG9QPJethyosMSnxcXFuE-xcpqJ6DQwfnPkPlFiEcbY=@protonmail.com>
 <3b92f53f-fd3f-a432-aae1-620582701286@roeck-us.net>
 <vCYQSnYIKROnbBCa77NtCP1VqtQUNl8cItazgNFjTJfmzRogHKpxkUThwzQnv-HXuISOOhhZ_J_gM2Pm-Y8dwfp2c6IxY2LYirIgdbriYwQ=@protonmail.com>
 <3259b471-c3b6-ef22-e5c6-813313395cef@roeck-us.net>
 <gPUUkJgSquQcl0TQu3m4-RdGPCj7xKAyRqgZlbIcu0FoA3egKZHq6VUMpNDMLJSp5Vs9GTRV7QWOfKJR3Mv4zgKof9JtJn_bAjAZu6Rykkk=@protonmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <097a08db-2afb-f220-75d3-caa9d37fd1f9@roeck-us.net>
Date:   Sat, 4 Jul 2020 16:56:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <gPUUkJgSquQcl0TQu3m4-RdGPCj7xKAyRqgZlbIcu0FoA3egKZHq6VUMpNDMLJSp5Vs9GTRV7QWOfKJR3Mv4zgKof9JtJn_bAjAZu6Rykkk=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/4/20 4:08 PM, Barnabás Pőcze wrote:
> 2020. július 5., vasárnap 0:44 keltezéssel, Guenter Roeck írta:
>> On 7/4/20 2:25 PM, Barnabás Pőcze wrote:
>>
>>> 2020.  július 4., szombat 22:54 keltezéssel, Guenter Roeck írta:
>>>
>>>> On 7/4/20 12:50 PM, Barnabás Pőcze wrote:
>>>>
>>>>> Hello all,
>>>>> I am completely new to Linux kernel development. I have written a kernel module for my laptop that integrates the fan speeds available in the embedded controller memory into the hwmon subsystem.
>>>>> My first question would be: can such a driver be merged into the mainline? I ask this because it is a device specific driver, and I am not sure if such drivers are wanted in the mainline.
>>>>
>>>> There are several device/platform specific drivers in drivers/hwmon;
>>>> that is not a problem. Question is more how the EC is accessed, and
>>>
>>> It is accessed using the acpi/ec driver.
>>>
>>>> who is going to maintain the driver after the initial submission.
>>>> This might be easier to evaluate if we had a patch or a pointer to,
>>>> for example, an out-of-tree driver at a public repository site such
>>>> as github.
>>>
>>> I uploaded it to github, I hope it helps: https://github.com/pobrn/xmg_fusion_15_fans
>>> I apologize for stylistic inconsistencies and such in the code, this is more or less a work in progress (at least in terms of making it an "acceptable" kernel module).
>>
>> Way too noisy, way too too many empty lines, and you should drop the "nodetect"
>> module option as it is way too risky. Otherwise I don't have major problems
>> with it.
>>
>> Guenter
>>
> 
> Thank you for the feedback, I will definitely try to fix those problems if I submit it as a patch. What I gather from your response is that it is possible that such driver is included under drivers/hwmon, correct?
> 
Correct.

> Furthermore, did it help answer the "who is going to maintain the driver after the initial submission" question of your previous email?
> 
A driver is not write-and-forget. It has to be maintained, preferably by someone
with access to the hardware. Otherwise it is going to bit-rot. Do you plan to
volunteer to do that ?

Thanks,
Guenter

> 
>>>>> Depending on the answer to my first question, my second question is: where should such a driver reside in the source tree? Initially, I thought of drivers/hwmon, but that seems to be occupied by drivers for external(?) devices (I am not sure, but that is the idea I get). So I am now thinking of drivers/platform/x86. However, I have failed to find any fan hwmon drivers there, so I am not sure about that one, either.
>>>>
>>>> hwmon drivers should in general reside in drivers/hwmon, unless hardware
>>>> monitoring functionality is part of other functionality and would be
>>>> difficult to extract from the main driver (example: various Ethernet
>>>> or graphics controllers).
>>>> Guenter
>>>
>>> Thanks for the reply.
>>> Barnabás Pőcze
> 
> 
> Barnabás Pőcze
> 

