Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3D5C433FE
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Oct 2021 19:39:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4BDC60FC2
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Oct 2021 19:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbhJGTlw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 Oct 2021 15:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233354AbhJGTlk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Oct 2021 15:41:40 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF943C061775
        for <linux-hwmon@vger.kernel.org>; Thu,  7 Oct 2021 12:39:46 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id l8-20020a4ae2c8000000b002b5ec765d9fso2206826oot.13
        for <linux-hwmon@vger.kernel.org>; Thu, 07 Oct 2021 12:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kariGMCqBVDGJk9TS7SFMqlMF9WIuaonCqitS85ky1Q=;
        b=S9piTheNOi0GJ7M/gqTNFsxmG8Uz2+mJ3jb9KrCnpp15Tl+yMEvWWe82703eX0TJAP
         sjkJ4WG7GIQQBWxVMwZaX8KxenP0T3ducp9boLXS9z9ucxzZbvNVynr1NZK8FS/jRZC4
         i1x+iDqki6JiLqnpILWY5QSUxOs8Bd1TJRRDIciHRaofpEyWWm/VDFMYmZRMZ7WNl1Ad
         YgDGBVCpnqEaJNFtvx4xE7j3SS5tnjXMmVcaK4jXIQT5ZpSXyMnzzv7UENZZomnpHJpS
         s1PhyUEO3CMEMqhrjnMCkPqSdSoOap6LrTTi9SJK14qxAPnQDPIyRUjw0oUqusUSOr/P
         GPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kariGMCqBVDGJk9TS7SFMqlMF9WIuaonCqitS85ky1Q=;
        b=JE06uRQhx4a+VX4LPSQ9XEE/L1XVv0tTpQpL1hUt8/9iyft2xWWHhQ6u0JBSWqddaB
         RiSjRx/4MOnODpg0ckVejvCIGPCv/ZmRofMiXlsig2qZgWeCmNXsuI7s3a3Rp9Z4vLHj
         VP/GPE/bujzduJAUz3FzeLoeF9Rw9qI2L5KDPJelJ6xvikeTd23/KsD1Ib8vzv/4ibDp
         0cJzLIxndgrLV3dRCPjn7TZ2oDqEjo96WTGINiDg2qv7D5d+9ZmVlCh4E0ERyb5DNqEy
         E9TgIsP2gYuZ6RAhTNxcC4QoVorHWy+PhQGBvOvxMcia5SC2KH8ARGFElYo7i4yx2zQ/
         Olkg==
X-Gm-Message-State: AOAM533GwyGt90bdW11U3xGsfbdDiXDBblatEP7Wfi0Q/OUh+grqPaCq
        jexoK++zKpuIPHzEnIDHGY4Gg5Nv13c=
X-Google-Smtp-Source: ABdhPJy3/XI7jo4tpX6nRvhidTDwAEs6AWsxcTRwPC/SGCyX+vmiSCBqyIaml9IS7gUvNTrMCYiD5w==
X-Received: by 2002:a4a:892f:: with SMTP id f44mr4857151ooi.95.1633635585957;
        Thu, 07 Oct 2021 12:39:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s206sm87740oia.33.2021.10.07.12.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 12:39:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: i5k_amb temp_mid replacement
From:   Guenter Roeck <linux@roeck-us.net>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <7aaa2734-514d-3752-01f1-fe3895718f55@gmx.de>
 <20211002140451.GA34532@roeck-us.net>
 <ce066c64-bf13-e6fa-278f-0dd6f2c2f45e@gmx.de>
 <def290d3-8c45-a44b-ebc7-166a77e8a2b9@roeck-us.net>
 <9f5c769b-416c-c431-5145-2ce9c0bb69ef@gmx.de>
 <c817fb03-a0c7-f562-5000-2c46bad58075@roeck-us.net>
Message-ID: <29999837-1ab4-e530-1b5b-e41807537b44@roeck-us.net>
Date:   Thu, 7 Oct 2021 12:39:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c817fb03-a0c7-f562-5000-2c46bad58075@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/7/21 12:24 PM, Guenter Roeck wrote:
> On 10/7/21 10:59 AM, Armin Wolf wrote:
>> Am 07.10.21 um 18:30 schrieb Guenter Roeck:
>>> On 10/7/21 7:20 AM, Armin Wolf wrote:
>>>> Am 02.10.21 um 16:04 schrieb Guenter Roeck:
>>>>> On Fri, Oct 01, 2021 at 12:13:53AM +0200, Armin Wolf wrote:
>>>>>> Hello,
>>>>>>
>>>>>> while trying to convert i5k_temp to the new hwmon API to resolve
>>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=208693,
>>>>>> i was asking myself whether or not temp_mid could be replaced with a
>>>>>> standard sysfs attribute?
>>>>>> Since afaik temp_mid and temp_max are both temperature limits, they
>>>>>> could potentially be replaced with
>>>>>> temp_max and temp_crit.
>>>>>>
>>>>> Quite likely. Unfortunately, the chipset documentation is not available
>>>>> to the public, so it is difficult to determine what those temperatures
>>>>> actually mean.
>>>>>
>>>>> Guenter
>>>> Darrick Wong says the chipset documentation would support such a change.
>>>> However, he fears that the changed meaning of tempX_max could confuse
>>>> userspace
>>>> programs.
>>>> But i think the current not using standard attribute names will confuse
>>>> even more
>>>> programms.
>>>
>>> I still don't know what temperature limits temp_mid and temp_max actually
>>> reflect, so I still can not really comment.
>>>
>>> Guenter
>> "Intel 6400/6402 Advanced Memory Buffer" seems to document that.
> 
> Ah, thanks.
> 
>  From the description, it should be:
> 
> TEMPLO -> temp1_max
> TEMPMID -> temp1_crit
> TEMPHI -> temp1_emergency
> 

Scratch that. I am misreading the document.

TEMPLO -> temp1_min
TEMPMID -> temp1_max
TEMPHI -> temp1_crit

is fine.

Guenter
