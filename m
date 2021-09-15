Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B60C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Sep 2021 14:20:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D71AF6113E
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Sep 2021 14:20:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237755AbhIOOVj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Sep 2021 10:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237723AbhIOOVh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Sep 2021 10:21:37 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C01DCC061766
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Sep 2021 07:20:18 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id x10-20020a056830408a00b004f26cead745so3717211ott.10
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Sep 2021 07:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=82FcYfugqq1vrbSPXjwtaom1nH7U/2BIZzNM8R3luWc=;
        b=fLwgtlO1d7qkcKAGrAPVboPO6JNhZsf7EdguNA7aUgxmUCp3mzqYWhTAd4REwE8Rkn
         gZMabGybJUs7bxnMzzPLe0B16nvhlJ5AVu79IMbXSmHcpIZBVC3craV1k/LhAc6FiW2p
         uBzT50Gxk9DYKwytJ93DQt24H6EJs15E3abGp01gO4Jq5MQ6T8rVOwICuJ0E/nGadMar
         0PmlxVpkVn0HC7/HKcvuTUyQHo+YltRcaaqT6IKpyTAajI1GHazHwzklt/LdfveM26gA
         9bHnDhnv8a3beO5J0jf0XjGaRCi8+HwvmOQVQBh3i4NX4GxkWWlG7YVd2EdoShvGt4td
         UreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=82FcYfugqq1vrbSPXjwtaom1nH7U/2BIZzNM8R3luWc=;
        b=e1kdtV9TN6+PNQlgSS0sXWI7DyjAtbdTlBxouYTlanXk9VTOFK5uFuPjBjJubW7ije
         UQsQzIqYNlT6xm3bdRDub/L6kFWN7ju9hHTOcy/NVeSEgpPpMkOvluvt5/g8abxPMGhD
         DxmJYF5Nqbio4onTvOpz05w6mBja5KKc08uP5N5rnCP4c8bcbPxSn9Oxarcxqra36uZY
         odt0/7/O5CQUgLPGWaS16k8Be+d9F+KxLEKfgyztXUi1a/UDCr1Ih7X1QP8wik1znOsr
         PSZeyEy9fi/Ij99k4O0nYet811vfpFBGuXxVzGZgbdjiofP6E4qkrFtyuVy63bWmRvQc
         kKww==
X-Gm-Message-State: AOAM533VMczsugJe5kz2ff3UEgnTMWolzGj9d/7dgzO/2D8Qcy4hw2O7
        ZekGN6pyddpnVIcem1fCZuTM1bnKoeQ=
X-Google-Smtp-Source: ABdhPJwUjjxGHIoCEE+Dl+gsFB8ZNQLCchh4Bk8y+PVRpKX/8QyrmGEnVi7ks1e//+fBkJb0GCb0ww==
X-Received: by 2002:a9d:72d0:: with SMTP id d16mr126670otk.93.1631715617967;
        Wed, 15 Sep 2021 07:20:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q10sm9130otn.47.2021.09.15.07.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 07:20:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: (dell-smm) Don't build the proc interface if
 there's no /proc
To:     Adam Borowski <kilobyte@angband.pl>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20210915134718.55897-1-kilobyte@angband.pl>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7a259cc4-69a8-fc0c-e256-5d82b6f1bb35@roeck-us.net>
Date:   Wed, 15 Sep 2021 07:20:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915134718.55897-1-kilobyte@angband.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/15/21 6:47 AM, Adam Borowski wrote:
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>
> ---
>   drivers/hwmon/dell-smm-hwmon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 774c1b0715d9..f381dfe1b427 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -403,7 +403,7 @@ static int __init i8k_get_dell_signature(int req_fn)
>   	return regs.eax == 1145651527 && regs.edx == 1145392204 ? 0 : -1;
>   }
>   
> -#if IS_ENABLED(CONFIG_I8K)
> +#if IS_ENABLED(CONFIG_I8K) && IS_ENABLED(CONFIG_PROCFS)
>   

This should be expressed as Kconfig dependency: I8K should depend on PROCFS.
Otherwise the configuration flag is misleading.

Guenter
