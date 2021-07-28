Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE726C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:43:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A95C461019
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:43:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbhG1WnZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 18:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbhG1WnZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 18:43:25 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A19C061757
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jul 2021 15:43:23 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id 184so3964846qkh.1
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jul 2021 15:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mrqHhigs3BEPW27K8W09HkhywYLyiNqpZRn4PUhcLo8=;
        b=TQCo9W6aSEIYH32wkyiUCBkiKUrsm+1g5DZzGQEsFt3+K2xULk2AiuZaSbi4igSKkL
         grYTz5G8IIUgvy/Jw8iNTjGi8Gna3la0Veim0j2o2kBUmVHOKkV+KxY5fauh6v0e5ddh
         Z7LTk+o9O7r9Fy/ipkG6dyabjCZqYqZRuXZ3gjuDH6h3Tljmn48WrTAHDuSdM8HmnJG+
         GR5K26rYg0rDWyRHU9FFxF980LjcKix/sreL2laI3R0tGQEA6WPNXrY1fcTZ1Cam01LB
         6uwDDrV4UKoJUW5bV8WKtvUQwTDMPrL5QBlO1eHz/r/frC2Et0hjK2MuwW16WfgjrqZy
         /hLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mrqHhigs3BEPW27K8W09HkhywYLyiNqpZRn4PUhcLo8=;
        b=B3RCeHMyLLdN7iGIP4seAXGMRs+nsB6G9YqvfsbNlmWjU59AmZr3P5ZHwvMEvmc1XZ
         zfQ4NqRyC9jqrNvzlt5NodV4V6U8ggTJoSWZ1lkmHNe+wLbYcfnDVKUllOTuNZoLCxwP
         7/b9+tEmVleu9XT9nCJumj0NphYkE/WU6CRq/k93IP+PE0T+HfNpChQvDWxC/1sLNELm
         EM/G+DjvPQTjrayWGvnDSQTL9ROlwwwtB6pc7bYcueMgBMplWWy1j7/NCXbKaBAQeOPw
         1hcvP47ryRdee31tBK/u9QxpmMDj3kTvpTzOVvUeDSPbk1lPrsFndtmgVri042vT7XF7
         9pdA==
X-Gm-Message-State: AOAM531IW68/ouw7rvzn7SE56vtLFtZf0i4kok6SKr7V+vlpcvBgbIop
        9+Ub1p/jVl9VCPm0DEi7zxPhMr8BNIQ=
X-Google-Smtp-Source: ABdhPJxhMTaokiqbPWAZEjSmci5WE9lhLOP+1qRUFSjUyeVFApUW5PAi38eGfCKJEXQe48lOrrGK/w==
X-Received: by 2002:a05:620a:448c:: with SMTP id x12mr2088055qkp.39.1627512202147;
        Wed, 28 Jul 2021 15:43:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k7sm722509qkj.79.2021.07.28.15.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 15:43:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v7 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon
 registration api
To:     W_Armin@gmx.de, pali@kernel.org
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210728221557.8891-1-W_Armin@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <fb82b50e-fa7d-c735-262b-0ac930c4d8ee@roeck-us.net>
Date:   Wed, 28 Jul 2021 15:43:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728221557.8891-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/28/21 3:15 PM, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> This patch series is converting the dell-smm-hwmon driver
> to the new hwmon registration API. In order to do so,
> it introduces a platform device in the first patch, and
> applies some optimisations in the next three patches.
> The switch to the new hwmon registration API is done in
> the next patch. The last patch is fixing a small bug.
> 
> The caching of the fan/temp values was modified to better fit
> the new hwmon API.
> 
> The patches work fine for my Dell Latitude C600, but i whould
> appreciate someone testing the code on another model too.
> 

At this point I'd suggest to queue the series up in -next and see
what happens. I don't think we'll get additional feedback.

Thought ? Objections ?

Guenter

> Changes in v7:
> - Add commit explaining why pwm1_enable has to be write-only
> 
> Changes in v6:
> - Make pwm1_enable permissions write-only
> - Do not test fan speed in dell_smm_is_visible()
> 
> Changes in v5:
> - Fix checkpatch warning after patch 5/6
> - Hide fanX_label if fan type calls are disallowed
> 
> Changes in v4:
> - Make fan detection behave like before patch 5/6
> - Update coverletter title
> 
> Changes in v3:
> - Update description of patch 1/6 and remove empty change
> - Let pwm1_enable remain write-only
> - Include a small bugfix
> 
> Changes in v2:
> - Fix coverletter title
> - Update docs regarding pwm1_enable
> 
> Armin Wolf (6):
>    hwmon: (dell-smm-hwmon) Use platform device
>    hwmon: (dell-smm-hwmon) Mark functions as __init
>    hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
>    hwmon: (dell-smm-hwmon) Move variables into a driver private data
>      structure
>    hwmon: (dell-smm-hwmon) Convert to
>      devm_hwmon_device_register_with_info()
>    hwmon: (dell-smm-hwmon) Fix fan mutliplier detection for 3rd fan
> 
>   drivers/hwmon/dell-smm-hwmon.c | 853 ++++++++++++++++-----------------
>   1 file changed, 425 insertions(+), 428 deletions(-)
> 
> --
> 2.20.1
> 

