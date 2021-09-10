Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C124AC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Sep 2021 15:34:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FA0961059
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Sep 2021 15:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbhIJPfS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Sep 2021 11:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbhIJPfR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Sep 2021 11:35:17 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A664C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Sep 2021 08:34:06 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id r26so3452525oij.2
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Sep 2021 08:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K1f4r0UBoAKhKO2MaSpBKlkRY9ncqpLTUFmVmZR0Om0=;
        b=Gpc58fI9/GVlQt8IRrLJgcEV2zvBRoj04oIL9pUEQFUG6OVN/u/KUl4oeX808rZX1q
         IttdwJjNHg0QWkpjeHwGT+RIjJh5GkxwU6WKKquH/FUiAxAdGHtDZJuXuCb9JfBQWdDi
         OZyfMF0vSFzozUjgtLf8sF5b74X4DhDd73KmTUKZcbKy+XOT4wcEjmKSPAnekScw6+Lk
         gdYPOkKJyGwJDRe3BWI36x/ksf9Kw2Z3GsshZ1CxwG9IjQ98VxL1vb3oLIj20EbsHZN/
         3Lb6ZiqR7aFErsKAOYNtVWIkP8kP63TLJINAShQ6DKXRD+iG90HdlDYodD9N6sjop52U
         KYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K1f4r0UBoAKhKO2MaSpBKlkRY9ncqpLTUFmVmZR0Om0=;
        b=EkmZirAhVIw7PUE1YXqdyTmZZhX7ftzBkFqEGsKIxPBM7HJ6KQis9UM9xStkaBDL/L
         5fG1Uor++dWzeOhdyRRw0v4103Br8LytI2NeuP29+y66HmABqZvwxCoCdVWkUPyNkdoD
         WXlgFtvXr3NkovSzaSqSxObYE4O64LOWBG4mH63GPjmHSGzHBaIoA1ajXNmOVtlX1CTg
         c+GKfS2KBb/JJnHgjOr7OUW8x+DXUoed9TNKMzOSMbJijPrRQD9kL1AO8ETCbAfKEcGq
         vqm9SZasnuxuyqyREZeBf2GUJ7m0sJoMEGN01IlAoU9Y6KOerkruYrf+lOV3lb1Uw/A4
         cTzw==
X-Gm-Message-State: AOAM530Erf4G6xLoyUwhPs8zUyG3i8Cg2ufImACt0gLEpCtX6/Y1/equ
        AWkDV1xM+USqArdDDQwFUI8=
X-Google-Smtp-Source: ABdhPJwG8xeqNEh/N+ROg3OypmxA3+t0f3BFYM6vcgvpaw92HgF3U8WXsymH72/bpIwd3N3FmDGG2g==
X-Received: by 2002:a54:4104:: with SMTP id l4mr4789226oic.126.1631288045742;
        Fri, 10 Sep 2021 08:34:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y24sm1351749oto.40.2021.09.10.08.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 08:34:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: dell-smm-hwmon: fix unused variable error
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
        Armin Wolf <W_Armin@gmx.de>
References: <20210910071921.16777-1-rdunlap@infradead.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <28bc2fd0-dae8-8b36-b021-edd82fe3cebc@roeck-us.net>
Date:   Fri, 10 Sep 2021 08:34:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910071921.16777-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/10/21 12:19 AM, Randy Dunlap wrote:
> When CONFIG_PROC_FS is not set, there is a build warning (turned
> into an error):
> 
> ../drivers/hwmon/dell-smm-hwmon.c: In function 'i8k_init_procfs':
> ../drivers/hwmon/dell-smm-hwmon.c:624:24: error: unused variable 'data' [-Werror=unused-variable]
>    struct dell_smm_data *data = dev_get_drvdata(dev);
> 
> Fix this by making I8K depend on PROC_FS and HWMON (instead of
> selecting HWMON -- we prefer and try hard not to select entire
> subsystems).
> 
> Build tested in all possible combinations of SENSORS_DELL_SMM,
> I8K, and PROC_FS.
> 
> Fixes: 039ae58503f3 ("hwmon: Allow to compile dell-smm-hwmon driver without /proc/i8k")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Pali Rohár <pali@kernel.org>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: x86@kernel.org
> Cc: Armin Wolf <W_Armin@gmx.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   arch/x86/Kconfig |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> --- linux-next-20210910.orig/arch/x86/Kconfig
> +++ linux-next-20210910/arch/x86/Kconfig
> @@ -1255,7 +1255,8 @@ config TOSHIBA
>   
>   config I8K
>   	tristate "Dell i8k legacy laptop support"
> -	select HWMON
> +	depends on HWMON
> +	depends on PROC_FS
>   	select SENSORS_DELL_SMM
>   	help
>   	  This option enables legacy /proc/i8k userspace interface in hwmon
> 

