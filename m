Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E976DC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Feb 2022 18:53:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234360AbiBGSwv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Feb 2022 13:52:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235276AbiBGSvQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Feb 2022 13:51:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0A332C0401DC
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Feb 2022 10:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644259874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4tMxQxcJ5rizEoS5UTJCaiSckKkfeW6Chcez0Web9VY=;
        b=el7LP5E3u2JxKzZW0POVD9LtNxLgSrAQqrr7tkwZU3Q+6NAD9pNZIJUVie3ucLlFuezSGq
        pb1h94HcG/LLOiiseFShecu6c7tK00NFEe92NR9RfM22evQNzVuCNK9t4M+Em8nUpE7JTi
        pM7IKnPWKsG3R0caUdXwKHWOz6Lmv+U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-MR_36QqIP7WTjrtm7f1--A-1; Mon, 07 Feb 2022 13:51:12 -0500
X-MC-Unique: MR_36QqIP7WTjrtm7f1--A-1
Received: by mail-ej1-f69.google.com with SMTP id qo24-20020a170907213800b006c7479720ddso1938496ejb.2
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Feb 2022 10:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4tMxQxcJ5rizEoS5UTJCaiSckKkfeW6Chcez0Web9VY=;
        b=rGIWE4y/oLiyG0qZXWmPULzAw7+62UIwwivabYLG50jqNlw8LD/NwK9WLBmVSwc5GA
         NxYnaeOX5sS4qsQJllZYD4+cyhaTwgJ5JOKvSkSEqhoh5HQji3bvDUefvW/gVIR0C8e0
         EDZhobfTftUEj4mS+K/68BQ7Yxi/pHtwu81U3ddzurUnI+DlwqmiXRYSeH30uuCa6lME
         zkntfvYFfvHTfNyAOKMhvq42luRL09+UFiOXl7z1uF79612Nrv3QOcWzebhpcmoCvcyg
         oJSq0Ovebci3Fe1l3/37otF24EuPifDl57ht/c51Zyt1eHNI5sHJfJEnAbI/rm0lXxEw
         8rpA==
X-Gm-Message-State: AOAM532FCpmNjk6ZzeNgWIZ+shCX1ckD5TrrizrgADyNJ3W6VDLLlKze
        jekdSlBiNQyMOQsgGMYX9xAkBe/AZY11mSYzte0WzlVuuFovUvQsTCTp7IkqIiOIsUOvxc6EzNU
        feOvozOlzCpzq3ildq1trxqA=
X-Received: by 2002:a17:906:2ed1:: with SMTP id s17mr869872eji.174.1644259871585;
        Mon, 07 Feb 2022 10:51:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZg/imwISIvk/tGi32MzWQSLQ+HCYDyUuOQuH46m+YuILwYJ63JRBI8JsIMyKkYrAEhfiE3w==
X-Received: by 2002:a17:906:2ed1:: with SMTP id s17mr869857eji.174.1644259871386;
        Mon, 07 Feb 2022 10:51:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id b17sm2491962ejd.34.2022.02.07.10.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 10:51:10 -0800 (PST)
Message-ID: <43bfd6d9-58a3-6f9c-0848-4ef147552afb@redhat.com>
Date:   Mon, 7 Feb 2022 19:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] x86/Kconfig: move and modify CONFIG_I8K
Content-Language: en-US
To:     =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-hwmon@vger.kernel.org
Cc:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Gross <markgross@kernel.org>
References: <20220207182940.242838-1-mat.jonczyk@o2.pl>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220207182940.242838-1-mat.jonczyk@o2.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 2/7/22 19:29, Mateusz Jończyk wrote:
> In Kconfig, inside the "Processor type and features" menu, there is
> the CONFIG_I8K option: "Dell i8k legacy laptop support". This is
> very confusing - enabling CONFIG_I8K is not required for the kernel to
> support old Dell laptops. This option is specific to the dell-smm-hwmon
> driver, which mostly exports some hardware monitoring information and
> allows the user to change fan speed.
> 
> This option is misplaced, so move CONFIG_I8K to drivers/hwmon/Kconfig,
> where it belongs.
> 
> Also, modify the dependency order - change
>         select SENSORS_DELL_SMM
> to
>         depends on SENSORS_DELL_SMM
> as it is just a configuration option of dell-smm-hwmon. This includes
> changing the option type from tristate to bool. It was tristate because
> it could select CONFIG_SENSORS_DELL_SMM=m .
> 
> When running "make oldconfig" on configurations with
> CONFIG_SENSORS_DELL_SMM enabled , this change will result in an
> additional question (which could be printed several times during
> bisecting). I think that tidying up the configuration is worth it,
> though.
> 
> Next patch tweaks the description of CONFIG_I8K.
> 
> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> Cc: Pali Rohár <pali@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>

For other reviewers, the only consumer of the CONFIG_I8K
option is drivers/hwmon/dell-smm-hwmon.c
which has a couple of:
"#if IS_ENABLED(CONFIG_I8K)" checks to enable its old
legacy /proc/i8k interface.

So this move definitely makes sense.

I wonder if it would not be better to just completely drop
the old  /proc/i8k interface though ?

With that said, this series looks good to me, so:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans




> ---
>  arch/x86/Kconfig      | 17 -----------------
>  drivers/hwmon/Kconfig | 15 +++++++++++++++
>  2 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 9f5bd41bf660..71d4ddd48c02 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1275,23 +1275,6 @@ config TOSHIBA
>  	  Say Y if you intend to run this kernel on a Toshiba portable.
>  	  Say N otherwise.
>  
> -config I8K
> -	tristate "Dell i8k legacy laptop support"
> -	depends on HWMON
> -	depends on PROC_FS
> -	select SENSORS_DELL_SMM
> -	help
> -	  This option enables legacy /proc/i8k userspace interface in hwmon
> -	  dell-smm-hwmon driver. Character file /proc/i8k reports bios version,
> -	  temperature and allows controlling fan speeds of Dell laptops via
> -	  System Management Mode. For old Dell laptops (like Dell Inspiron 8000)
> -	  it reports also power and hotkey status. For fan speed control is
> -	  needed userspace package i8kutils.
> -
> -	  Say Y if you intend to run this kernel on old Dell laptops or want to
> -	  use userspace package i8kutils.
> -	  Say N otherwise.
> -
>  config X86_REBOOTFIXUPS
>  	bool "Enable X86 board specific fixups for reboot"
>  	depends on X86_32
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 8df25f1079ba..dd244aa747ad 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -505,6 +505,21 @@ config SENSORS_DELL_SMM
>  	  When option I8K is also enabled this driver provides legacy /proc/i8k
>  	  userspace interface for i8kutils package.
>  
> +config I8K
> +	bool "Dell i8k legacy laptop support"
> +	depends on SENSORS_DELL_SMM
> +	help
> +	  This option enables legacy /proc/i8k userspace interface in hwmon
> +	  dell-smm-hwmon driver. Character file /proc/i8k reports bios version,
> +	  temperature and allows controlling fan speeds of Dell laptops via
> +	  System Management Mode. For old Dell laptops (like Dell Inspiron 8000)
> +	  it reports also power and hotkey status. For fan speed control is
> +	  needed userspace package i8kutils.
> +
> +	  Say Y if you intend to run this kernel on old Dell laptops or want to
> +	  use userspace package i8kutils.
> +	  Say N otherwise.
> +
>  config SENSORS_DA9052_ADC
>  	tristate "Dialog DA9052/DA9053 ADC"
>  	depends on PMIC_DA9052
> 

