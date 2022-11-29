Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A130C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Nov 2022 08:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiK2IQt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Nov 2022 03:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiK2IQp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Nov 2022 03:16:45 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBF156EF5
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 00:16:44 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so8304576pjm.2
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 00:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqqcI3upkMKe9jgtqKPfvBFqEpkKc3bYwpA9ihzXqPc=;
        b=LYQWMzk8fwk1ZXmPY95LWiyuQwTHRdE8/013KjievETTzx7IAC0a5IzM3gOqgC0N3h
         BGZ1rjgpjork3tK/0TK52o+jQ+jjaW2ofjci1U6dboFGw+qeAsPq0uT0FKeSKqwnyACB
         kOrJEL3QlRQkEIotOyBICUKPrGdcz5zjn3uqcYM0+kf7Om+1snmCOvnldmlzL4wDcZS8
         BCrnYIhR1I9KJowh4A1THFz6kMKwHKfFdkd0qUwcZ0LFSmBhg1SWgApm7CEjNac7HMPq
         AiEJvP377sA56YM4wOxpq+je/NbGuUodZGmFcfVeZg8/jwo0USFj7N3t8MBwdS8oJx2s
         QqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqqcI3upkMKe9jgtqKPfvBFqEpkKc3bYwpA9ihzXqPc=;
        b=Kqc7zreKvt2dPLGCxGERm6p5vfWwuetkrovmbJma7mVWhjoT9E+I6hDzZbNltqNq+n
         PX+Z1jnxMDzfJ/35HOFDxu05By5upHy558j3viZ17CX285QTMeTl9pv81jgECmjul0AK
         t3uNBHKKMdUGtUBs+wjhfUV/0UJdIvdmnkA/Wmh/LOHcPOvP+ZvgOx2lm+yjwxGURJz7
         dcSPERsauaeTTAqPgVSLzatGgqYZL0kEEw1VwonuC5syuDV97JkqNSijDItsSzykCAAX
         MN4tXkGjYLmmVGh6MACO2piyPyzE5akeYW0kZegMatHqUCRk5RrRMBHb3oFmrF2aTan+
         xJlQ==
X-Gm-Message-State: ANoB5pntaaKYUmvF9irudraizoQLPMUVMjh5y3GM5HkSrxae+i2N7M7G
        3EQlufBIHzSp/ug7z2KwWtuy4g==
X-Google-Smtp-Source: AA0mqf7WLgfLUvX+Ih5A322VuHGcPluj23ukCLLsh8ExG1Cct3WD55Q/hYioCdzGlv/r/Hf9XAQIyQ==
X-Received: by 2002:a17:90a:307:b0:213:ff80:b37f with SMTP id 7-20020a17090a030700b00213ff80b37fmr65116475pje.118.1669709804401;
        Tue, 29 Nov 2022 00:16:44 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id w13-20020aa7954d000000b00574740c99e9sm9302290pfq.129.2022.11.29.00.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 00:16:44 -0800 (PST)
Message-ID: <1b015a86-0d65-8597-0512-b313769e307b@9elements.com>
Date:   Tue, 29 Nov 2022 13:46:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus/core): Implement irq support
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org
References: <20221128174715.1969957-1-Naresh.Solanki@9elements.com>
 <20221128174715.1969957-3-Naresh.Solanki@9elements.com>
 <bda19726-74f3-b76d-c30c-eb2543979690@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <bda19726-74f3-b76d-c30c-eb2543979690@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On 29-11-2022 04:39 am, Guenter Roeck wrote:
> On 11/28/22 09:47, Naresh Solanki wrote:
>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>
>> Implement PMBUS irq handler to notify regulator events.
>>
>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> 
> As I am sure I have mentioned before, this needs to primarily handle
> sysfs notifications to hwmon status attributes and to generate kobject
> events. Regulator events are secondary / optional.

Based on previous feedback, PMBus interrupt handler is made generic
Based on the use case I have in my machine, my application need to 
monitor regulator event as soon as they occur and hence the patch.

> 
> Thanks,
> Guenter
> 
Regards,
Naresh
