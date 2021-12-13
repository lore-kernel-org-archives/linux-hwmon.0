Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD38C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Dec 2021 13:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236166AbhLMNfr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Dec 2021 08:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232936AbhLMNfr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Dec 2021 08:35:47 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49570C061574
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 05:35:47 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id t23so23175808oiw.3
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 05:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HS8EKG2LYP1H3GvQt1T5QIy1f9BYgPCvuDmtfZWShfs=;
        b=LjUu10a2VzSMpUTuYxPPidHwUWPN90wyO0t1w4zwQ+Yhn+bXJ/EJDYxqQTfZJZD/No
         4Tn1xIjRmkdaKU9Ur/WBjdbTazp7IfzgRtASIGJ4Btca9uKwTpPuIOyLFVVGNn2QDu+e
         yPSG3NAMCGFd5WIwG3I8ZSWMpZQUA5Y3Ijf2y9HFD2RuwnKcgilApZw8Gl5bEc2W74rD
         WKbEhuLcsbGDqHTNoR2nqSdohZ+vJKcQwYkReEIsIcmCbFp/tR/LdgTo3Q7C1PEmMnJ3
         UlG0ffdpFEUc2hP0C0YU8LyM+JzBOar+F4YeSWZI5R2nlv4DWezmlyE+iOgmqFYWrmta
         70SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HS8EKG2LYP1H3GvQt1T5QIy1f9BYgPCvuDmtfZWShfs=;
        b=PER0nhrmkwl7akHmNGenUzIu+4TbeTdITCo3bmppNvoIvECqQSzuidoHP3WvnlsLy/
         sxeWRTp1wRusVsrn14GNQc6ucfJ5Qy+9AG2xDGS6mpxY+GtguIJMsrN7KlHIPuefKsrO
         2ILOWj/hQq4CnieAcXsvwwYnaj4wtalisiNH3ByRBCUEb7SuVFEvCxlZ/9s3n4RWmhsF
         r5ZpCH0HqdI8NJUldvQXcfqqnW3N2AFcBY5digFqdr1rpgkKpfqXIHMU+GSup22oCKYj
         orHlVzg+REcTTMruoWrBWKo0vZUaVON3iphypuOnqH23L18pxNMO50ExXIMdbH4yNpzF
         yxdg==
X-Gm-Message-State: AOAM5306cbO+UmH/lXPObYDtwxrwJXKDu4DjKMQq1n1gDeJ9d8y/1OX1
        r6X8sKJNvpDTlI9FDj5sLWrU5U6WhH4=
X-Google-Smtp-Source: ABdhPJycXFWT3fOI+RmTrdNzQLhRShtGsnSibjBJVGmPr1PfBWpgSu/OPlSW76Vy38/rkook9pdTIg==
X-Received: by 2002:a05:6808:68f:: with SMTP id k15mr26547604oig.5.1639402546605;
        Mon, 13 Dec 2021 05:35:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g61sm2235350otg.43.2021.12.13.05.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 05:35:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     arthur@aheymans.xyz, linux-hwmon@vger.kernel.org
Cc:     patrick.rudolph@9elements.com
References: <20211213101902.146179-1-arthur.heymans@9elements.com>
 <20211213101902.146179-3-arthur.heymans@9elements.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/3] ir38064: Expose a regulator
Message-ID: <4d600920-da57-ffc4-ef21-42dc999a9da0@roeck-us.net>
Date:   Mon, 13 Dec 2021 05:35:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211213101902.146179-3-arthur.heymans@9elements.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/13/21 2:19 AM, arthur@aheymans.xyz wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>   drivers/hwmon/pmbus/Kconfig   |  6 ++++++
>   drivers/hwmon/pmbus/ir38064.c | 17 +++++++++++++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index d2b178a902f0..fdfe1cd54799 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -131,6 +131,12 @@ config SENSORS_IR38064
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ir38064.
>   
> +config SENSORS_IR38064_REGULATOR
> +	bool "Regulator support for IR38064 and compatibles"
> +	depends on SENSORS_IR38064 && REGULATOR
> +	help
> +	  Uses the IR38064 or compatible as regulator.
> +
>   config SENSORS_IRPS5401
>   	tristate "Infineon IRPS5401"
>   	help
> diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
> index 429577b027b4..61cbe5063688 100644
> --- a/drivers/hwmon/pmbus/ir38064.c
> +++ b/drivers/hwmon/pmbus/ir38064.c
> @@ -17,8 +17,15 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/of_device.h>
> +#include <linux/regulator/driver.h>
>   #include "pmbus.h"
>   
> +#if IS_ENABLED(CONFIG_SENSORS_IR38064_REGULATOR)
> +static const struct regulator_desc ir38064_reg_desc[] = {
> +	PMBUS_REGULATOR("vout", 0),
> +};
> +#endif /* CONFIG_SENSORS_IR38064_REGULATOR */
> +
>   static struct pmbus_driver_info ir38064_info = {
>   	.pages = 1,
>   	.format[PSC_VOLTAGE_IN] = linear,
> @@ -33,9 +40,19 @@ static struct pmbus_driver_info ir38064_info = {
>   	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
>   	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
>   	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +#if IS_ENABLED(CONFIG_SENSORS_IR38064_REGULATOR)
> +#ifdef PMBUS_HAVE_VOUT_COMMAND
> +		| PMBUS_HAVE_VOUT_COMMAND
> +#endif
> +#endif

Please drop. PMBUS_HAVE_VOUT_COMMAND is not defined in the upstream kernel.
Yes, code introducing it was suggested two years ago, and I rejected it.
The reasons are still valid. If you have out-of tree code which enables
setting voltages values and voltage margins with hwmon sysfs attributes,
please keep it out-of-tree.

Thanks,
Guenter

>   	    | PMBUS_HAVE_POUT,
> +#if IS_ENABLED(CONFIG_SENSORS_IR38064_REGULATOR)
> +	.num_regulators = 1,
> +	.reg_desc = ir38064_reg_desc,
> +#endif
>   };
>   
> +
>   static int ir38064_probe(struct i2c_client *client)
>   {
>   	return pmbus_do_probe(client, &ir38064_info);
> 

