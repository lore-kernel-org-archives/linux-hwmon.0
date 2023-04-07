Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FC2C6FD1D
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Apr 2023 18:53:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234448AbjDGSxs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Apr 2023 14:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234570AbjDGSxe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Apr 2023 14:53:34 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DAF11150
        for <linux-hwmon@vger.kernel.org>; Fri,  7 Apr 2023 11:51:19 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id g18so10250764ejx.7
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Apr 2023 11:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680893395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u29Ba3A0btMM/Efd0jQfFxdcE+1OqKc3tXksWr+mPkI=;
        b=oLosmmGjsDVZsw4n1UPDv7gcUuB3AGv12Lr41gdR0QsSFA6+t09rDFFaXR0mggzPdt
         cpUI8QklvqOAIsCUOlBnoIPGBksqXhaBsqQ7fG1o0CRpQbk/3n6OeU2Wq23SpX9ERTG0
         pzBO4oAnNw1RsPUl+jQ/C3rjOxk3pr0XhH1Fz9d1pkRCv2Uwl0z8KuxTuSD341jhexSl
         oxk/E4CatmwVokAVISinDpli+aKphx7YRwzgr0Wp7g9U0Uh4q55iuLI8XVixw8jjeopn
         cV3IGQRhKsgn5cWWH1jRLqWpjImdDLqhouNJEx+W4ky8zs8nS/yevr65/fQO5m0KtAYC
         hx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680893395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u29Ba3A0btMM/Efd0jQfFxdcE+1OqKc3tXksWr+mPkI=;
        b=os+WB6mztRiaAt/TrA4CwtO7pkPVRAyIXL+Gbv8bycf2cddpMKbpoXsidc5SjJvsCy
         IIn5VBnsWBPh4NwYTh3weqVU7aBP+NVOqjxEiMyqGlweB5w1QVYRFLiciRDpvMBdW60L
         GvtvowSuVk/iF4PZiNq6UaWpOFGupda8fUweo2+jzgmZygrVJQXCzeBhxMCtAi9JZWjk
         gBSL83gniHGMrj4yv3nM6BJV9YI9x56JUpYa2VGaNJc5NvdZNQjuBPG1wunmZ8yu3/zX
         fy7fk6IwsO23cW03G9ToyP69uRH1YcZYgbRcL39PtGu6+NuVE/9Tv9AFFDeWTtypfCKs
         xR1g==
X-Gm-Message-State: AAQBX9dg84xJcbDrnfkVdChMt6UoVfdVUksQrXGjJAJ8iSBZwAYCdR1S
        aNRo2o4VGQqoUrHI8ldETQvJBhNkG4sVFkIH9wU=
X-Google-Smtp-Source: AKy350YTwzJR8lBmYxKZMMC4/3TaxSz87x/xBEz7SeY88Vs1xsTZzSx2evDp9ZBzSus6HOsdufzG4Q==
X-Received: by 2002:a17:906:6d3:b0:8b1:2c37:ae97 with SMTP id v19-20020a17090606d300b008b12c37ae97mr366112ejb.43.1680893395164;
        Fri, 07 Apr 2023 11:49:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b20f:8824:c926:8299? ([2a02:810d:15c0:828:b20f:8824:c926:8299])
        by smtp.gmail.com with ESMTPSA id a4-20020a17090680c400b009495db4787esm2293272ejx.222.2023.04.07.11.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 11:49:54 -0700 (PDT)
Message-ID: <bb4f40e7-fd06-1e94-02ab-b26d1418e782@linaro.org>
Date:   Fri, 7 Apr 2023 20:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ufs: hwmon: constify pointers to hwmon_channel_info
Content-Language: en-US
To:     Bart Van Assche <bvanassche@acm.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <20230407150137.79947-1-krzysztof.kozlowski@linaro.org>
 <59929dca-6d70-c3a2-292b-91f7274dd12e@acm.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <59929dca-6d70-c3a2-292b-91f7274dd12e@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 07/04/2023 20:30, Bart Van Assche wrote:
> On 4/7/23 08:01, Krzysztof Kozlowski wrote:
>> -static const struct hwmon_channel_info *ufs_hwmon_info[] = {
>> +static const struct hwmon_channel_info * const ufs_hwmon_info[] = {
>>   	HWMON_CHANNEL_INFO(temp, HWMON_T_ENABLE | HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LCRIT),
>>   	NULL
>>   };
> 
> A nit: to me the use of whitespace in this patch does not seem to be 
> compliant with the Linux kernel coding style.

You mean it should be:
	hwmon_channel_info *const ufs_hwmon_info
?

I think the pointer * is tied only to variable name, but not to const.
Majority seems to choose similarly:

git grep "\*const" | wc -l
2763
git grep "\* const" | wc -l
16204

But if this is more than a nit, but your preference, I can fix it.

Best regards,
Krzysztof

