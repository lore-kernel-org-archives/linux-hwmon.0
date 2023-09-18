Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA51CD37B0
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:47:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbjIRJr3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241096AbjIRJr0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:47:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868D8128
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695030366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jdUm96uh4XhuaUSzmnrMv6v8Eolc2W5q5Ie9KD85sgo=;
        b=h7wnV/lkZ3AxJqTTcJN/DP03gQ85Uh2cH0I4RDtP+KTs4ETcyZ3G2lL8+KSy/bXIdYbu+1
        6T3nfbPBtRCH5XYd8Hr2Shy1GTHf1+nVh3Mh4fUCF+V5+Mb7/tgc5ui8spHGni3E82m3V1
        vJcV0EmzM5Xyuaz6cAhaI/nhoid9bE4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-NCxWvUOFMrWXyR1g_uUQTQ-1; Mon, 18 Sep 2023 05:46:05 -0400
X-MC-Unique: NCxWvUOFMrWXyR1g_uUQTQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9adb6dd9e94so289871666b.2
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695030364; x=1695635164;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdUm96uh4XhuaUSzmnrMv6v8Eolc2W5q5Ie9KD85sgo=;
        b=tlzu32TMwcoORgeITMjl5k24swMbay7Au6lPIAsjtMbx8NaHydgIz4xRs3a/fVhT8S
         j2s6mZbfRXkhZptHU3twKM6j5SQSBz19HkC0uuV+WDCF4B1775/v5U6RhTggd6OLWcdY
         +lBQJj+j5akK9/jTCe7ELe1gNWMWulmUvpfHKpBkovNtA3sir96AuIWUe858BE6ddn8t
         JrbbWIzUMdU7io2JPtAhtudmYMmOuEfrSeBygB+MiXcQGme+6/qtx/kAPbEO+cv4RPI4
         vp55GlCKFxYk1rKFX+30HoH9Qxv8z0tJNGQYRf7SkwLvg4ilu8ecL1mg945WErIz4U0t
         Xc5A==
X-Gm-Message-State: AOJu0Yyb0u4GC55A/pLWpenzmh4sWY8jtrGwfVRJtAGJE2RYFawT7FrC
        vwWLCFYQzMxT6h6+LZ6rxfAHA0IlE5KSE/O8C3GpT5FcE/5llsJ0Q68caBqvTiMEe+m/s1jMOAO
        pQMF7wU542MiQQeLK650+wHzmuqfHHS4=
X-Received: by 2002:a17:906:3158:b0:9ad:c763:c3fd with SMTP id e24-20020a170906315800b009adc763c3fdmr6993036eje.28.1695030364154;
        Mon, 18 Sep 2023 02:46:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOMLFUMdOIFcafmb5oNe6tnUn6HcGTJ0YkwxmoSvkCHiv+37c7OK4D5hDEk3/Hkilzom7Mkw==
X-Received: by 2002:a17:906:3158:b0:9ad:c763:c3fd with SMTP id e24-20020a170906315800b009adc763c3fdmr6993020eje.28.1695030363823;
        Mon, 18 Sep 2023 02:46:03 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id bq7-20020a170906d0c700b0099cb349d570sm6202008ejb.185.2023.09.18.02.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 02:46:03 -0700 (PDT)
Message-ID: <663624f2-b9f3-4fb3-fa39-7619cac036b0@redhat.com>
Date:   Mon, 18 Sep 2023 11:46:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/24] hwmon: (abitguru{,3}) Enable build testing on !X86
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Alistair John Strachan <alistair@devzero.co.uk>,
        linux-hwmon@vger.kernel.org, kernel@pengutronix.de
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
 <20230918085951.1234172-2-u.kleine-koenig@pengutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230918085951.1234172-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 9/18/23 10:59, Uwe Kleine-König wrote:
> The two drivers compile fine on arm64, powerpc, m68k and s390. So make
> it possible to enable the drivers in the presence of COMPILE_TEST.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/hwmon/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index ea390da7bc75..e36f58b01f2d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -40,7 +40,7 @@ comment "Native drivers"
>  
>  config SENSORS_ABITUGURU
>  	tristate "Abit uGuru (rev 1 & 2)"
> -	depends on X86 && DMI
> +	depends on (X86 && DMI) || COMPILE_TEST
>  	help
>  	  If you say yes here you get support for the sensor part of the first
>  	  and second revision of the Abit uGuru chip. The voltage and frequency
> @@ -55,7 +55,7 @@ config SENSORS_ABITUGURU
>  
>  config SENSORS_ABITUGURU3
>  	tristate "Abit uGuru (rev 3)"
> -	depends on X86 && DMI
> +	depends on (X86 && DMI) || COMPILE_TEST
>  	help
>  	  If you say yes here you get support for the sensor part of the
>  	  third revision of the Abit uGuru chip. Only reading the sensors

