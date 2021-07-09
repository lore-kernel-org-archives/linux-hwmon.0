Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE3CC07E99
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Jul 2021 20:57:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6B27611AF
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Jul 2021 20:57:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbhGIVAV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Jul 2021 17:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhGIVAV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Jul 2021 17:00:21 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ADD8C0613DD
        for <linux-hwmon@vger.kernel.org>; Fri,  9 Jul 2021 13:57:36 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id e85-20020a4a55580000b02902579a1a1393so2602371oob.6
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Jul 2021 13:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W5Hudz0Qy4v8a0FYA2DGeFeXUhUyVhj9O4MLNvLtUUo=;
        b=ey2exAWx6d772afNaKxTCt6XqdpPjaqGBdbqrqMBW8drSP0M+tfW32A2IGohHMXYlM
         DjsXXSaGVJhEQMuNnUwr0uoaTCkFotAzflW2rqge1VjmZKBN8HFiMVnQrNDMJmGkrdUQ
         +87/lH/fx+7DpBbxppzJrcMmzatodfwQU+BVcDCxbWQkLEFfOxrHrJAfdjj5qwBrc19w
         fpSDWtPU6n1q33y/BQX+MRhgylAmSfZhyuqRjbTzgOMCE3OfRuYe/RSHzoXUTrTcfoME
         pinT7oOc5xw4DRbXO1AI7dKLQC6hOSYTKeyVzspcBXo+41CeZb7Q4FwJSb64nyRPrBfp
         ZeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W5Hudz0Qy4v8a0FYA2DGeFeXUhUyVhj9O4MLNvLtUUo=;
        b=cdXdwXy7x2BMX94gWRn1oZza1HFyVKsbQ/Nxa3FGpnbzfcWMG0EDoYXN44rXhfMfTq
         Jqm4PaNnDcbF2D286UH3lIol+iidwMIqlrjASET0aWZz+ApejF6h8bKdavCAKhh6l2XJ
         jURKJpfk7/GSVQH7TdkgRctEcIipSPfSRqYwvK7/FgCKRVnEmIV5aFmk8UmrLT71Z5ND
         DRcCKoQbbsIE2aNq9nYllzxu7rD8TOymx1b5I6UsJJXhBmCk/155T6BmaAlIz2yMGALK
         lptpfODf4jrG+8kLCe1zwgrBnlHdAE8+98dQgqExnOYIUCjBLkGDQjmh6mUjfmHOZjKG
         AEvw==
X-Gm-Message-State: AOAM533Ufk/8rnWp32FDCCUrbRPMy5rZVCYsc005cPATvxAXGX61VGC1
        6Vh0zmZQIJnwdHCVYv6HWVC/NgME5ck=
X-Google-Smtp-Source: ABdhPJxx0SFeC8BXkBU5+I7P60MADbHTHJAQYlald9HC+UvsPwnqVOifJTPkMpCOgimNvsFW8g9nGg==
X-Received: by 2002:a4a:9b0f:: with SMTP id a15mr28392152ook.4.1625864255354;
        Fri, 09 Jul 2021 13:57:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 39sm1353501otg.36.2021.07.09.13.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jul 2021 13:57:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 0/3] hwmon: (w83627ehf) Cleanups
To:     W_Armin@gmx.de
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210709184501.6546-1-W_Armin@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <889eea88-7eca-1019-a140-0314f6b34e09@roeck-us.net>
Date:   Fri, 9 Jul 2021 13:57:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709184501.6546-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/9/21 11:44 AM, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> This patch series is cleaning up the pm, init and exits
> paths of the w83627ehf driver.
> This mainly makes the code more readable.
> 
> 
> Armin Wolf (3):
>    hwmon: (w83627ehf) Use platform_create_bundle
>    hwmon: (w83627ehf) Remove w83627ehf_remove()
>    hwmon: (w83627ehf) Switch to SIMPLE_DEV_PM_OPS
> 
>   drivers/hwmon/w83627ehf.c | 118 +++++++-------------------------------
>   1 file changed, 21 insertions(+), 97 deletions(-)
> 
> --
> 2.20.1
> 
Series applied.

Thanks,
Guenter

