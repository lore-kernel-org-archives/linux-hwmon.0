Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF2BC004D4
	for <linux-hwmon@archiver.kernel.org>; Sat, 21 Jan 2023 14:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjAUOEm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 21 Jan 2023 09:04:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjAUOEl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Jan 2023 09:04:41 -0500
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5075037554
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Jan 2023 06:04:40 -0800 (PST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-15085b8a2f7so9398576fac.2
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Jan 2023 06:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zqrCG0NXKogdXe0DGTdOD8Tz2xR9HK8HySqW5z38C3M=;
        b=VEDCxlLJtj5qOPW/N766XqgGgH6dh7P2dFwf0QrPKR5KyRhMWku/OpWek21izV37xv
         cRVrYsdSaFBd4C4/aPAXBg5lJH1OSrE+KtDAVznXfFiJJzPDdOxfyI12hOZ0NckZOfAL
         Tzb/f0ebygsozvvTuVGdhv+5svIFEPlvFKqdLJjLTxUiP27rZt6dOYUViWiUy2QRz3Yu
         hCOvfEnipx8Wws7WrrZcUeFV2iwBBq9DVtxiM1YSqAqYjEebKgPf8iDc9eAyL5TWyDNO
         9BXDGpU+0oGTWAuTuHf+SuTeKfT1hnaandQ5Wa55OXK07SZFkvNIh0E+zpc3MMyF5FQe
         vghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqrCG0NXKogdXe0DGTdOD8Tz2xR9HK8HySqW5z38C3M=;
        b=dEAcoucQSsd9brogPAYDuiz0ZHfDlAegKDbgcQbvT4TUxldkBj/PcK2I6I5o6J53TS
         zKp4GFTH6Jdt++lNTNoe3Ta/AytEhJV4UWFVdHqD0KWU8hdaxLLqetzZovZY6FpN9LWC
         RGoNjaxs5BcnN4rDfb6mDB3gUbC+NXwNZGVPkexHFdjc1Ifg94ZGgEHJVq/be2RLtFW+
         5Om1DUoh/iWvlgTyXmoNB3IZI4eST+m+pQskquUdMV5WzdiBPHP0sdaPD62ieMwZhgZO
         SOX1kE4VCJao2+Rr4D/0v4c+6XleI3LB8JoQEdSLnXNyDg0zfA0BPOjlfP/0hUDYBdZd
         7ffg==
X-Gm-Message-State: AFqh2kq1yfXI1JccaPPkO0rfUgbGbKI/N1G+IUa0tvJMjz1HuEpExXwu
        1j+IovgUTC9BHvzKYRfgUWPJlfeFtKU=
X-Google-Smtp-Source: AMrXdXscPh1tjS4YeGmY7w1euedgY4TETnbamsKEURX0ztF5kKbDwh1TpTswSi1MQmw2yD4JnG3pKQ==
X-Received: by 2002:a05:6870:3d96:b0:14f:eb44:afde with SMTP id lm22-20020a0568703d9600b0014feb44afdemr9570817oab.26.1674309879363;
        Sat, 21 Jan 2023 06:04:39 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q187-20020a4a4bc4000000b004a3c359fdaesm20844399ooa.30.2023.01.21.06.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jan 2023 06:04:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <31a6d8dd-b501-6e9c-aa80-d695f8aab186@roeck-us.net>
Date:   Sat, 21 Jan 2023 06:04:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 2/2] hwmon: (it87) Added driver version to distinguish
 from dev version
Content-Language: en-US
To:     Frank Crawford <frank@crawford.emu.id.au>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20230121085754.1693336-1-frank@crawford.emu.id.au>
 <20230121085754.1693336-3-frank@crawford.emu.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230121085754.1693336-3-frank@crawford.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/21/23 00:57, Frank Crawford wrote:
> Add a driver version and log it on load, to make it easier to
> distinguish between the in-tree version and any development version from
> an external source.
> 

Sorry, no. Name your out of tree version as you want.

Guenter

> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
>   drivers/hwmon/it87.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index a8a6a0ffee82..632ab3d50bc6 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -59,6 +59,8 @@
>   #include <linux/acpi.h>
>   #include <linux/io.h>
>   
> +#define IT87_DRIVER_VERSION "v1.0-official"
> +
>   #define DRVNAME "it87"
>   
>   enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
> @@ -3398,6 +3400,8 @@ static int __init sm_it87_init(void)
>   	bool found = false;
>   	int i, err;
>   
> +	pr_info("it87 driver version %s\n", IT87_DRIVER_VERSION);
> +
>   	err = platform_driver_register(&it87_driver);
>   	if (err)
>   		return err;
> @@ -3470,6 +3474,7 @@ MODULE_PARM_DESC(fix_pwm_polarity,
>   		 "Force PWM polarity to active high (DANGEROUS)");
>   
>   MODULE_LICENSE("GPL");
> +MODULE_VERSION(IT87_DRIVER_VERSION);
>   
>   module_init(sm_it87_init);
>   module_exit(sm_it87_exit);

