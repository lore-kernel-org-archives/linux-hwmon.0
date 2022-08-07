Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31F0C19F2A
	for <linux-hwmon@archiver.kernel.org>; Sun,  7 Aug 2022 15:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbiHGPGW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 7 Aug 2022 11:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbiHGPGV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 7 Aug 2022 11:06:21 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010836438
        for <linux-hwmon@vger.kernel.org>; Sun,  7 Aug 2022 08:06:20 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id t22-20020a17090a449600b001f617f2bf3eso3502291pjg.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Aug 2022 08:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ccT/Lv9DDxEKJ5TBaKPOTUb8bX0L0Ec0MAdc0eVNtWM=;
        b=RU6CWGR8+WxTCtSz4MSMHQFOk23DwBdcGyr2ky5jr/aeOXBGhhn7UsTtZ/nOmZziYt
         yYhvtQvs2Pg4FmuSOnR/fCKo1Y0uedsDMxrwjaWirA/X5rO6K008Hi/Dera26neKoKCO
         E6+wwVUmr3/hiAWGDGLeIpYoBoDBon81Eqn4Zc6LroQ7AcmXzygLXqUhD/odKg/UpVGH
         Xt/4dGmygO6cm34MCe5qc9ob63izaFteyc8UkRU5ybBQoTP6hzoZOr1ZfF6alHhiyP3g
         XDbXcyU8Iy/ZJqyKVTwHyKTth2RaScWoSwzWwVzbHskFKxsLih+3WWAOQZeouX+tIxoG
         5pZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ccT/Lv9DDxEKJ5TBaKPOTUb8bX0L0Ec0MAdc0eVNtWM=;
        b=PvIYSiSxQ1aN07sUnTmvOgc2HlC4u1qaS8FFVmkDKoGa24VofOz5vEbJzQR6KBnAgs
         RGCQmHVBsLn0+s91/rJDSfdd1zv/BkdbxRhOD3XyLBC2RrF1Qbz078IGQ5YbMZvDqqS+
         jg8ecT6PbIAZCGctX24YbGU6vw1wwkChgG0erUG73E+IuC4fR2f+KZMhuInMlZBzOHRw
         O+E3TEYRQmnCsU/csd39+dxr3j49b5T+TV6indyl4zbRExbGMCrwR+FPHzHRd3z5whw5
         UMNpRnPywJB+etnw5h0WTXo2CS2JZbdt4Z8OoEXY/NlIN2zj48wRRBxn6ff4Xp637STr
         kjOA==
X-Gm-Message-State: ACgBeo0us5Ur/xOZEZpIYicUMiuwHe2jPtgOGmpU0AWM8izZncLXuOit
        KSHN1+mwBMYfjuSjQBqhT7WjGB/NiBk=
X-Google-Smtp-Source: AA6agR6ztP279UyCIJS65i6/b8KHvFooEObQZ4CPQWj4j9z2S6lly3EHhB+oU/Q3Cdo5Cdv42DNiag==
X-Received: by 2002:a17:902:e552:b0:16d:d3c0:85fb with SMTP id n18-20020a170902e55200b0016dd3c085fbmr14610522plf.38.1659884780148;
        Sun, 07 Aug 2022 08:06:20 -0700 (PDT)
Received: from [192.168.122.100] (M106072039032.v4.enabler.ne.jp. [106.72.39.32])
        by smtp.gmail.com with ESMTPSA id n14-20020a170902d2ce00b0016cbb46806asm6684386plc.278.2022.08.07.08.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Aug 2022 08:06:19 -0700 (PDT)
Message-ID: <a5b9f6a1-1884-0b38-adef-ed47abaf7091@gmail.com>
Date:   Mon, 8 Aug 2022 00:06:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] nvme: hwmon: Add support for throttling temperature
 feature
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org
References: <20220806054606.7280-1-ikegami.t@gmail.com>
 <20220806083113.GA3986075@roeck-us.net>
 <ae3a4377-440b-af9d-8033-cbfe2d76d135@gmail.com>
 <20220807060530.GA4018377@roeck-us.net>
From:   Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <20220807060530.GA4018377@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 2022/08/07 15:05, Guenter Roeck wrote:
> On Sat, Aug 06, 2022 at 08:58:49PM +0900, Tokunori Ikegami wrote:
>> Note: Sorry let me resend the mail below as text format since it was not
>> delivered to the mailing lists as contained HTML subpart.
>>
>> Hi,
>>
>> Thanks for your comments.
>>
>> On 2022/08/06 17:31, Guenter Roeck wrote:
>>> On Sat, Aug 06, 2022 at 02:46:06PM +0900, Tokunori Ikegami wrote:
>>>> NVMe drives support host controlled thermal management feature as optional.
>>>> The thermal management temperature are different from the temperature threshold.
>>>> So add functionality to set the throttling temperature values.
>>>>
>>>> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
>> I think actually the suggested attributes are not met with the throttling
>> temperatures as below.
>>
>>    temp[1-*]_emergency: Temperature emergency max value, for chips supporting
>> more than two upper temperature limits.
>>    temp[1-*]_lcrit: Temperature critical min value, typically lower than
>> corresponding temp_min values.
>>
>>    Thermal Management Temperature 1 (TMT1): This field specifies the
>> temperature, in Kelvins, when the controller begins to transition to lower
>> power active power states or performs vendor specific thermal management
>> actions while minimizing the impact on performance (e.g., light throttling)
>> in order to attempt to reduce the Composite Temperature.
>>    Thermal Management Temperature 2 (TMT2): This field specifies the
>> temperature, in Kelvins, when the controller begins to transition to lower
>> power active power states or perform vendor specific thermal management
>> actions regardless of the impact on performance (e.g., heavy throttling) in
>> order to attempt to reduce the Composite Temperature.
>>
> That happens a lot. That is neither a reason nor an argument to introducing
> new attributes to match chip descriptions. If we would do that, we would end
> up with lots and lots of different and unmanageable attributes.
>
> Please note that the functionality is associated with thermal management,
> so you might want to discuss your attributes with the thermal subsystem
> maintainers.

Okay I see and have understood as it is difficult to use hwmon 
attributes for the thermal management functionality.

Regards,
Ikegami

>
> Guenter
