Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC1AC001B0
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 20:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbjGOUDI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 16:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbjGOUDH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 16:03:07 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B07268B
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 13:03:03 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b89cfb4571so25057195ad.3
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 13:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689451383; x=1692043383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QI+H1yn3w+/q4ipMcAe/GImKHbFi63VXw6xveJYj2II=;
        b=rbTcbG55VFdG8rSqrF6MMadu5E50S0PvvDCivnK/y7s4GBtrRcZWnZO5mAPBvuQV3m
         xbOWx16GkR1Ov8BBf8VIv5BDDDLG1fDRn9UIobR1V/XgDqdCaJgyN5lpIuc9fJsDO+5p
         bNnDZV/XjAdrhkbrdrBk7A3iupVE3ae0fnIXDJh+EhB6ZnvCPHkwakqZngJzJL2XIdYK
         I1dl1sDPCQWuAmak6cUNPZlTaI3cd2cf08C4yOrupHMDW6fhctntNlQ8J6I//j0JNmvI
         JvN7ahH2CDSg4b1RIq3V5ikloTQkDczxohtfTb3W6gV8jop+MKuskwR7lXK9XRy2kGNd
         +2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689451383; x=1692043383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QI+H1yn3w+/q4ipMcAe/GImKHbFi63VXw6xveJYj2II=;
        b=D0DBbFJ9dWl5VNPe8H+q3H43nWd4LqOFoCWI9zoBioD5E5peodwU1kHzD+R9Tq12Y8
         x7B8nGK0VQO1MNzNT9U2cAxAlig1dQOxsVKubccWxWRIEEcE7qsO92uVtE9CUjzEhSgB
         eNAeAjtFi6cEShhCBnRGgxtzU1CbvSgDIcNX/wqQxXMy/HA3H27+ELcUmVBjYtLZ+fpt
         BJ9KWbV3FPtpN4Y6SmbYwxI/J9uiw2INxgRaqatley2WaE0WSiEIOanaxyJlQMqHsZKI
         r74HxWDOtIl2zmUOjMPk8gkmXLNXzZt9ZwmLTeK9/RYqNp7raaUxwqimmFThWJ2fytCP
         9wRQ==
X-Gm-Message-State: ABy/qLYmwEPiX1N8hLa0Scj1i/RFs8wzM6xTrW3cC0DMUYOwviNOWS1P
        jLVDwiSwvLvrMqW/Yq2wOis=
X-Google-Smtp-Source: APBJJlEOo+VdSGNNp/4TdSKe/OiioM2Pmxji5shtBQblf8KpiiiqfgHqXcpdnFqibT4i+ZIsQATZbg==
X-Received: by 2002:a17:902:f549:b0:1b8:4f93:b210 with SMTP id h9-20020a170902f54900b001b84f93b210mr10689513plf.45.1689451383123;
        Sat, 15 Jul 2023 13:03:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j6-20020a633c06000000b0051b36aee4f6sm9677496pga.83.2023.07.15.13.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 13:03:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 15 Jul 2023 13:03:01 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (nct6775) Change labels for nct6799
Message-ID: <7efc779a-88e3-46d4-b3f0-592f6d6fd0c1@roeck-us.net>
References: <20230715195244.1334723-1-ahmad@khalifa.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230715195244.1334723-1-ahmad@khalifa.ws>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Jul 15, 2023 at 08:52:44PM +0100, Ahmad Khalifa wrote:
> nct6799d-r and nct6796d-s are very similar and chip_id is only
> different in the version nibblet.
> 
> Since both will be detected by the driver anyway due to the
> chipid mask, they should be labeled together for dmesg msg.
> 
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>

Applied. Please add change logs to future versions of your patches.

Thanks,
Guenter

> ---
>  Documentation/hwmon/nct6775.rst  | 11 ++++++++++-
>  drivers/hwmon/nct6775-core.c     |  3 ++-
>  drivers/hwmon/nct6775-platform.c |  2 +-
>  3 files changed, 13 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> prerequisite-patch-id: 36e3467bd9ea72cb3ad2bef638a8389a9537d111
> 
> diff --git a/Documentation/hwmon/nct6775.rst b/Documentation/hwmon/nct6775.rst
> index 5ba8276aad4b..9d7a10de61a7 100644
> --- a/Documentation/hwmon/nct6775.rst
> +++ b/Documentation/hwmon/nct6775.rst
> @@ -80,7 +80,13 @@ Supported chips:
>  
>      Datasheet: Available from Nuvoton upon request
>  
> +  * Nuvoton NCT6796D-S/NCT6799D-R
>  
> +    Prefix: 'nct6799'
> +
> +    Addresses scanned: ISA address retrieved from Super I/O registers
> +
> +    Datasheet: Available from Nuvoton upon request
>  
>  Authors:
>  
> @@ -277,4 +283,7 @@ will not reflect a usable value. It often reports unreasonably high
>  temperatures, and in some cases the reported temperature declines if the actual
>  temperature increases (similar to the raw PECI temperature value - see PECI
>  specification for details). CPUTIN should therefore be ignored on ASUS
> -boards. The CPU temperature on ASUS boards is reported from PECI 0.
> +boards. The CPU temperature on ASUS boards is reported from PECI 0 or TSI 0.
> +
> +NCT6796D-S and NCT6799D-R chips are very similar and their chip_id indicates
> +they are different versions. This driver treats them the same way.
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 236dc97f4d22..029344b933ed 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -33,7 +33,8 @@
>   *                                           (0xd451)
>   * nct6798d    14      7       7       2+6    0xd428 0xc1    0x5ca3
>   *                                           (0xd429)
> - * nct6799d    14      7       7       2+6    0xd802 0xc1    0x5ca3
> + * nct6796d-s  18      7       7       6+2    0xd801 0xc1    0x5ca3
> + * nct6799d-r  18      7       7       6+2    0xd802 0xc1    0x5ca3
>   *
>   * #temp lists the number of monitored temperature sources (first value) plus
>   * the number of directly connectable temperature sensors (second value).
> diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
> index a409d7a0b813..81bf03dad6bb 100644
> --- a/drivers/hwmon/nct6775-platform.c
> +++ b/drivers/hwmon/nct6775-platform.c
> @@ -35,7 +35,7 @@ static const char * const nct6775_sio_names[] __initconst = {
>  	"NCT6796D",
>  	"NCT6797D",
>  	"NCT6798D",
> -	"NCT6799D",
> +	"NCT6796D-S/NCT6799D-R",
>  };
>  
>  static unsigned short force_id;
