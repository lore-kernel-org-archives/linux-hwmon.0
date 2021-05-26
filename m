Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BA9C47088
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 16:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78320613B5
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 16:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbhEZQLm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 May 2021 12:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234418AbhEZQLk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 May 2021 12:11:40 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A2F4C061574
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 09:10:09 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id q17-20020a4a33110000b029020ebab0e615so408429ooq.8
        for <linux-hwmon@vger.kernel.org>; Wed, 26 May 2021 09:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oVo08vUu5cNwua8dRC2MClXRr5uC0uJF95+mS5goEW4=;
        b=cRaKlksZf80r01A5MHx1sMwNDV6lJMH3GKihIIAySXO15G1Lwwq4hgwcizsC371ck3
         722RGNJJahuuJ1KRnUv9W6B3Pgh+dBgee/AtYdTfTIDs9+IHYFSkKrGXEw0K21KHv8tU
         vQN3JqLN3f4NGBQkg55jAOcZ50wLZp5QWLu5+kGSqkPwN3d0PCDMqXXb1p/j364P5xYY
         EMsO9VtQdX0Syf78S14OtCHQbj1MjHoatPrX1dajmBbjuWLCGeqBIXVFCKF9fdCwRUs9
         sBJ+OMSDhXjrD38a10vWQfYOt4hOetpbib6KtjpI5uH0pMzp3yjoDoF/+rZa839oL+tt
         2t6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oVo08vUu5cNwua8dRC2MClXRr5uC0uJF95+mS5goEW4=;
        b=lkbibwUZn4r4VdWl0y023urb44g4ANaKjsfVqrj3vwoZj8tcGFUT4PBzOblTj56aVM
         Pfv+XGBfjK+5CP3cVx9iMmoVxA40I/AUbnGcx5iqmCJy8/3oThT/zbCHpIBt5vg3QT2p
         joVJQ3NVoGiN/0gNZ2/6IY4ClaCpBzmKbzSAKxk4GKVHwaXdjajHru+DzBBliAuFNuN+
         nPMtQIDF1udsnZZe/jRkv6ua1MGj1OinIagpTi4J0MlCp2rZReUjr9A+U0E24r0yrecT
         ZlwpAxB+ddULeZ9XyCZQYejp0ev9LUi6SQXSORLWp8mqyBgXYqWH8HkOam6JrPzINazT
         /q4g==
X-Gm-Message-State: AOAM530maAKkWBzjSpcoDRLemdgOg/mkbasamcQaltqe8KuiUESOA0EI
        D7w1zubkfb+GB6piZn5tqsnhvwmlS6w=
X-Google-Smtp-Source: ABdhPJzIxUvU1l4Fh1jKwXl5nY8xYPWo4tRvg61bgusGTcNlZhERBv9YKDKxEJVptj/C21gFYlUrUw==
X-Received: by 2002:a4a:83d3:: with SMTP id r19mr2854613oog.53.1622045408382;
        Wed, 26 May 2021 09:10:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l9sm4154320oou.43.2021.05.26.09.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 09:10:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 0/5] hwmon: (dell-smm-hwmon) Convert to new hwmon
To:     W_Armin@gmx.de, pali@kernel.org
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210519132910.14453-1-W_Armin@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ac961946-bfe4-cf47-b3f0-f173e9e5e661@roeck-us.net>
Date:   Wed, 26 May 2021 09:10:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519132910.14453-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/19/21 6:29 AM, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> This patch series is converting the dell-smm-hwmon driver
> to the new hwmon registration API. In order to do so,
> it introduces a platform device in the first patch, and
> applies some optimisations in the next three patches.
> The switch to the new hwmon registration API is done in
> the last patch.
> 
> The caching of the fan/temp values was modified to better fit
> the new hwmon API.
> 
> The patches work fine for my Dell Latitude C600, but i whould
> appreciate someone testing the code on another model too.
> 
> Armin Wolf (5):
>    hwmon: (dell-smm-hwmon) Use platform device
>    hwmon: (dell-smm-hwmon) Mark functions as __init
>    hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
>    hwmon: (dell-smm-hwmon) Move variables into a driver private data
>      structure
>    hwmon: (dell-smm-hwmon) Convert to
>      devm_hwmon_device_register_with_info()
> 
>   drivers/hwmon/dell-smm-hwmon.c | 860 ++++++++++++++++-----------------
>   1 file changed, 425 insertions(+), 435 deletions(-)
> 

Any chance to get a Reviewed-by/Tested-by: for the series from someone ?

Thanks,
Guenter


