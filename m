Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38D6C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jan 2022 14:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237763AbiA0O2a (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jan 2022 09:28:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiA0O23 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jan 2022 09:28:29 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE59C061714
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jan 2022 06:28:29 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id d18-20020a9d51d2000000b005a09728a8c2so2718622oth.3
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jan 2022 06:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=S6BTydlraWZWCt2NifxG5jc5VWppyr71C1FZw86bWWg=;
        b=Ll8ZluxD7MjaXvKOlKW9/LO7Ja1rBc2hTbX+7F0PKEmKYjSzyyOEc13f1xpc9spxsd
         xEWDJpBg62mmENtg+oEqUmdNk9D2SWyOvzURcaoRB5xrEahOp451EYBdDKkvMbXirxmC
         4SekfKN3/ZxYUIdHv7COeqfFAPZb5Dclm6JLxZZGtU3zLgF/1Q30jrbImiAGJJnd5gIS
         D7PBBf/4M/MMWACrAHDdXfBodopl82Bcac+RUKfyB/MwYKFGfzPc41NE5bcT3OPOS38q
         zBu8F8cN/aCgZDiPuYzsEakUCf7SL5iKkOE0htzriTIVkLsLV4hxr+AjOLinhHECYMw+
         /ryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=S6BTydlraWZWCt2NifxG5jc5VWppyr71C1FZw86bWWg=;
        b=HanfZHPGXn3/Xi00Gm/Vmv4KTRQrsvkuEr52i5ZxRMwQAcNytSJCkWIjFeIMZTTWH/
         RmU90XgT51obDoHDrxJYfLD26KRgTgbPSqwsiJqI78X0bJOxT64vS/ThyRjY4qVLd2BF
         6Hv9iiMuT7YQbdgFuijZJkeSKdzwGVny9GIUmeBDKC3ySNnmzzKqQ8S7acy4VOhweRYZ
         iJcRs99c9LA0BnOFmTyxaV+c/87yBJ5hC1+3nnWasZNhYIQQKuZnAbuLCDhy3gai8v7P
         7IvCTSj3uSo/pt7a1GJzkG/HbNk9ksKSopo1eq/PFNanpJN7Op4SxeOE6zekhZURGw8L
         YGgA==
X-Gm-Message-State: AOAM530hmB4sigAho0WK2peh2xLb28DnfAEE/jWtVu6Kdz9HipX3OvqI
        3B+mD0hMButoNQ0se89wnqhz+zoZVulRVw==
X-Google-Smtp-Source: ABdhPJwCM3WYEmaiD7EJU1UUmDodKh7LbtIUZIkH9oX3ocLocFTLP0j9xOixH5XO5dIWmRBWrEVqCw==
X-Received: by 2002:a05:6830:3148:: with SMTP id c8mr2281589ots.380.1643293708752;
        Thu, 27 Jan 2022 06:28:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q188sm7918822oig.15.2022.01.27.06.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 06:28:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <73331bd3-a252-4e11-e84c-8dfad3f62eb0@roeck-us.net>
Date:   Thu, 27 Jan 2022 06:28:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Paul Cercueil <paul@crapouillou.net>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20220127085245.GF25644@kili>
 <TI4D6R.WEHYEPI3R49G3@crapouillou.net>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [bug report] hwmon: Add "label" attribute
In-Reply-To: <TI4D6R.WEHYEPI3R49G3@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/27/22 01:47, Paul Cercueil wrote:
> Hi,
> 
> Le jeu., janv. 27 2022 at 11:52:45 +0300, Dan Carpenter <dan.carpenter@oracle.com> a écrit :
>> Hello Paul Cercueil,
>>
>> This is a semi-automatic email about new static checker warnings.
>>
>> The patch 073c3ea6c530: "hwmon: Add "label" attribute" from Jan 10,
>> 2022, leads to the following Smatch complaint:
>>
>>     drivers/hwmon/hwmon.c:825 __hwmon_device_register()
>>     warn: variable dereferenced before check 'dev' (see line 810)
>>
>> drivers/hwmon/hwmon.c
>>    809
>>    810        if (device_property_present(dev, "label")) {
>>                                             ^^^
>> The patch adds a new unchecked dereference
> 
> I will send a patch to address that.
> 
> I'm surprised that this function can be called with dev == NULL in the first place, though.
> 

Originally it was needed for the thermal subsystem, which did not provide a parent
device. By the time that was reworked, it was (mis-)used by the Loongson-3 hwmon
driver (which was never reviewed by a hwmon maintainer and does pretty much
everything wrong).

Guenter
