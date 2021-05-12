Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE05C433B4
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 23:11:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A6E561221
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 23:11:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237707AbhELXMY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 May 2021 19:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443344AbhELWR4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 May 2021 18:17:56 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FBEC061355
        for <linux-hwmon@vger.kernel.org>; Wed, 12 May 2021 15:09:42 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso22097125ote.1
        for <linux-hwmon@vger.kernel.org>; Wed, 12 May 2021 15:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/4+dwCm55gl1/JdlbrOpsHTPAZRpmwVGuSeQ8dT9+Io=;
        b=dq0g7DWxdII1BfhsHlXKjgQnlpD8wY15NQm/WWigg59+caHMRWGDaraoNwhNHcakmJ
         7jHcFn09jj3/SveEvWAyDijRJuZZKZoMdAniqRPCqGchDarbs4l0IbyhpMJo9Z6FkECr
         6o8G0hUUGxDnAPHxd296sV1JE7yJyeNV+YE1h4kgPCCv3eAJdyCkkTuqsGWOvBXmpFd6
         XUJbxnh1Cl1cThMllEtflbfLIMFwMZxZlEyMqC4UjDe8C41Fij81+EDqaKzDxoJPxIza
         CpWtg+ffv/Bk0HnOfjhkGE6ofkhwQ5m3htUAMxAI33+3vwIlXoeGzc+WhwhNl79FZWoo
         5cIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/4+dwCm55gl1/JdlbrOpsHTPAZRpmwVGuSeQ8dT9+Io=;
        b=Q7Tg48cmvl7VIYebxGnKt2a5rCNAZ4sYgrvvYBQHmFjU5gqS/4notRBwoW6s/SdVcB
         0ZyL8lmdiFp3nco4nJ0STnQGg+7GFf+RKNh5rqpcSO2m37AIGs5IW32hJrMbVksx9FY5
         M6FLf3IdSRBlyGqIUs0O/XLoOQQ5tHMNA2C+9ig4PfgnwSabyQfNAUzm1NurkjZhHKEr
         gVTkZGnQGz2eQHNfkD8FJuvh5fXcHDjX6poyzXG7iBNl6fHNoqo2jSVHwdsV234tZfaD
         at1D0NzitZBssSQO9aFi3ATYYDp7oJRTAeUsLJW/qXYGRcyoY90i65mIHtDRdm7YGk3k
         ocCQ==
X-Gm-Message-State: AOAM530Kcwhmd6IzJTRKqxbXzpF3wfzNUwfn+YC1qqDrG8k1+3Va6CGw
        G6V5FwizFKMIYjlsPNAZavybThBkuYc=
X-Google-Smtp-Source: ABdhPJxWN34mFsIjj2lKxH2zEm2pyMTF1krQ96QMISG6m3JJ1S+JyEYuGX3KYk3bYX9QIFXsLFxnpA==
X-Received: by 2002:a05:6830:2093:: with SMTP id y19mr8610495otq.128.1620857381535;
        Wed, 12 May 2021 15:09:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k21sm248877otr.3.2021.05.12.15.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 15:09:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (adm9240) Convert to
 devm_hwmon_device_register_with_info API
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20210311073302.221954-1-linux@roeck-us.net>
 <20210311073302.221954-3-linux@roeck-us.net>
 <590366ea-2c8c-8d92-171a-87807dedabd6@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b853d6b2-11df-bedf-ccc0-dbb1cb88ffb3@roeck-us.net>
Date:   Wed, 12 May 2021 15:09:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <590366ea-2c8c-8d92-171a-87807dedabd6@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/12/21 2:54 PM, Chris Packham wrote:
> Hi Guenter,
> 
> On 11/03/21 8:33 pm, Guenter Roeck wrote:
>> Also use regmap for register caching. This change reduces code and
>> data size by more than 40%.
>>
>> While at it, fixed some warnings reported by checkpatch.
>>
>> Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> I've just been informed by our QA team that it looks like the
> configuration of limits (e.g. by writing to sysfs) has been broken.
> Probably by this change. I'm just starting to dig into it now but I
> though I'd give you a heads up.
> 

Thanks for the heads up.

It looks like voltage maximum writes use the wrong register,
ADM9240_REG_IN instead of ADM9240_REG_IN_MAX.
Odd, I'd have assumed that my module test code catches that.
I'll have to check why it doesn't.

Anyway, anything more specific ?

Thanks,
Guenter
