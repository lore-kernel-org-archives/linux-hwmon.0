Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CE7C19F2D
	for <linux-hwmon@archiver.kernel.org>; Sat,  6 Aug 2022 11:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbiHFL6z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 6 Aug 2022 07:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiHFL6y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 6 Aug 2022 07:58:54 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3EC114026
        for <linux-hwmon@vger.kernel.org>; Sat,  6 Aug 2022 04:58:53 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id p8so4708552plq.13
        for <linux-hwmon@vger.kernel.org>; Sat, 06 Aug 2022 04:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=W6YVXdOJyNzhjVV/R81dl8NKiSjcLc3yzGQII4mktQY=;
        b=IZsPWEUKUc4BhILCAKFCNpkVj/ZfnWXuHI/mQQwiytzd4OS6NaiO3OE9pY0nvZ35cs
         WOzGXk9oDtpY1RPgazYzzLgCzNyyxlQ+SnK5khPY5Q5tdYCQcBKG+pucl1LgSVcEn5iN
         7V8tcL2Vma0PHWwlzqD7/23Ncowf5PrY9g9v4i93vgnU35dx8A2MS3WU+tP+FeVub0iI
         CQg3WAYFpXKiGV5eEzwHZrd6KloOzW6MN5XjYttMs3FxE+F8zP+HJoh3S9/fIWO2jNKL
         l+Cjxl+WP8toqIXzif6CH2F37kwbmwI3npRS65LManbbVBbYMno92T+V8SZm5AMQbtHs
         QN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=W6YVXdOJyNzhjVV/R81dl8NKiSjcLc3yzGQII4mktQY=;
        b=Rdh6jTkmG16gINI3502BWVYj2pjG33mEA6fEUyJ0/llxHXg7Q/pDALl4hY+v9k0jwh
         LgnkqgfLVWNqBhr5zJ/Tg6XvKmyub0D5RqCuRU8rjZuPhNRPu6TuT0dyY2b2Du7jbAdI
         CrZyVXhmZ0Q2UT9hyY8EzvTpBFma2ImGQG/Gg7jm0y/mROB5YK/mcSpWQZI1T6MUGHL7
         ffA51nYg4fFo4+PbK0O8G205cY5Ny7iY08JkqNJfs64B573mNXyNSFdYgIpOgBHAiEnE
         Kb8cHY/3vnZQYhXsueqw44+rrPbrXXMSBBkgctrtNOQ6JgbLLHiNI/TSMXSEHBhEgyZU
         rkAQ==
X-Gm-Message-State: ACgBeo3cjhmWKI9XhJ8M2KOwHVhqx6+ewrelF03qweys+xLodAg10Ph0
        /r07+QHDTMnZojfwewi4h5nH+i3VsFo=
X-Google-Smtp-Source: AA6agR45FeIVBJ1NbRMwECJlVlbKw/vgIEHaTJx7Yj18ae9woUI6Dw/k/EWVRBKPACne+OmBoj4buQ==
X-Received: by 2002:a17:90b:358:b0:1f5:5c55:752e with SMTP id fh24-20020a17090b035800b001f55c55752emr12292394pjb.151.1659787133063;
        Sat, 06 Aug 2022 04:58:53 -0700 (PDT)
Received: from [192.168.122.100] (M106072039032.v4.enabler.ne.jp. [106.72.39.32])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902f70d00b0016f0c2ea158sm4796519plo.157.2022.08.06.04.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Aug 2022 04:58:52 -0700 (PDT)
Message-ID: <ae3a4377-440b-af9d-8033-cbfe2d76d135@gmail.com>
Date:   Sat, 6 Aug 2022 20:58:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] nvme: hwmon: Add support for throttling temperature
 feature
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org
References: <20220806054606.7280-1-ikegami.t@gmail.com>
 <20220806083113.GA3986075@roeck-us.net>
From:   Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <20220806083113.GA3986075@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Note: Sorry let me resend the mail below as text format since it was not 
delivered to the mailing lists as contained HTML subpart.

Hi,

Thanks for your comments.

On 2022/08/06 17:31, Guenter Roeck wrote:
> On Sat, Aug 06, 2022 at 02:46:06PM +0900, Tokunori Ikegami wrote:
>> NVMe drives support host controlled thermal management feature as optional.
>> The thermal management temperature are different from the temperature threshold.
>> So add functionality to set the throttling temperature values.
>>
>> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>

I think actually the suggested attributes are not met with the 
throttling temperatures as below.

   temp[1-*]_emergency: Temperature emergency max value, for chips 
supporting more than two upper temperature limits.
   temp[1-*]_lcrit: Temperature critical min value, typically lower than 
corresponding temp_min values.

   Thermal Management Temperature 1 (TMT1): This field specifies the 
temperature, in Kelvins, when the controller begins to transition to 
lower power active power states or performs vendor specific thermal 
management actions while minimizing the impact on performance (e.g., 
light throttling) in order to attempt to reduce the Composite Temperature.
   Thermal Management Temperature 2 (TMT2): This field specifies the 
temperature, in Kelvins, when the controller begins to transition to 
lower power active power states or perform vendor specific thermal 
management actions regardless of the impact on performance (e.g., heavy 
throttling) in order to attempt to reduce the Composite Temperature.

> NACK. There are several existing limit attributes which can be used
> for this purpose. I would suggest to use EMERGENCY and LCRIT attributes.
>
> Furthermore, one can not just extend the hwmon ABI without discussion,
> much less as part of a patch introducing its use. Any attribute introduced
> into the ABI must benefit more than one device, and a matching
> implementation in the sensors command and the lm-sensors library is
> expected.

Sorry I am not sure about the hwmon ABI situation but if possible could 
you please consider or discuss to extend the attributes from this patch 
review since the suggested attributes seem difficult to use instead? (Is 
it difficult?)
By the way I have already created the lm-sensors pull request below.
   <https://github.com/lm-sensors/lm-sensors/pull/406>

Regards,
Ikegami

>
> Guenter
