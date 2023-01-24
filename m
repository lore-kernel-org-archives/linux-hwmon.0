Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDAFC25B4E
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Jan 2023 13:54:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234110AbjAXNyj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Jan 2023 08:54:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234668AbjAXNy1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2023 08:54:27 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E702047EFA
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 05:52:26 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id r9so13293971oie.13
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 05:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4CxMjFXAztob//KrW4rLhMCRq0sdIk880iwjKfZL+M=;
        b=bAi+puFU7syBwasARor0T9NrOgK8iymBEktT8wMxS7lULCz7uAy1WZQT4vh4AqPA39
         6mH1+cBnFbm8UQ7/LM01n96I5LWJ0HP4o31mMaYi3jaA5HqdkJwzqxHENdhdCN6QHm6n
         bc93lckImNR6kguLlxX5Cz40UQ52C6Cb6QDo8wdvXfRoT4WTF5bEjJ5fk4zqs6mthIf8
         xWfcAxFp64orQ99EsLAHqBoCS8bVY0xltbFQIO4Va5mwWacDTzv05ADRxnxqN7gcjPyk
         gFHFXgEJ4TrhIZYb7NXevcQ0V/SAXmCimRonQ8caf26UF1P9kZlUCLi/u1hwdBuv1wRB
         foZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4CxMjFXAztob//KrW4rLhMCRq0sdIk880iwjKfZL+M=;
        b=ThKlbzdQuWCKtGpCzMS483ApMY4cbuYlENuWKyYy81FUhn56kqDwRWUYDnjf1NGljx
         ZFI7qx333Pvi42Id48480X4fWUzctB1XaPS4MOcYkWJkHUp1fa44jyd7vX1xIRbC6iIS
         Y3psEDrqf+TGSrhKs3J2UbuKKWFlQDhOLJ7szPCRSmKMBBMoZa8PIyLaTeub+WU1VOKL
         DUoefhzdleI/jHefjTweESdSLvqz7VmwhxWOktcS8BfYNarxhNq2p2htxPvcYNk/DNbI
         JpUWZKHZZ2y7jZr4rLCsKLnYN9RW0JNmLzlF0iRWJQyQ+/Gxf0Kt3oQUt8Ceg3SWknYy
         HVpg==
X-Gm-Message-State: AFqh2koKXnk1oYybpogZAPVQBWBXDmEuBgFZPPMiC27NzsZdA41qIryk
        RR8xPG351Z8XCgUBU7Ebsd9PoG4rb+I=
X-Google-Smtp-Source: AMrXdXszwBMdXjwQzhLgAPVDlIhzh1UZisH58F7MSlO6beou6pitEe5CBLe/jZgphf/HA7v39c4PiA==
X-Received: by 2002:a05:6808:286:b0:368:ea29:7b32 with SMTP id z6-20020a056808028600b00368ea297b32mr12780487oic.9.1674568296647;
        Tue, 24 Jan 2023 05:51:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h4-20020a056808014400b0035028730c90sm1042628oie.1.2023.01.24.05.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 05:51:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 24 Jan 2023 05:51:35 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 1/2] hwmon: (it87) Group all related MODULE_PARM
 definitions together
Message-ID: <20230124135135.GA36662@roeck-us.net>
References: <20230121085754.1693336-1-frank@crawford.emu.id.au>
 <20230121085754.1693336-2-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230121085754.1693336-2-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Jan 21, 2023 at 07:57:53PM +1100, Frank Crawford wrote:
> Group the MODULE_PARM definitions together to make them easier for
> future maintenance, rather than having them spread across the file.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied to hwmon-next.

Guenter

> ---
>  drivers/hwmon/it87.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index ee48e238e46f..a8a6a0ffee82 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -65,14 +65,6 @@ enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
>  	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
>  	     it8792, it8603, it8620, it8622, it8628 };
>  
> -static unsigned short force_id;
> -module_param(force_id, ushort, 0);
> -MODULE_PARM_DESC(force_id, "Override the detected device ID");
> -
> -static bool ignore_resource_conflict;
> -module_param(ignore_resource_conflict, bool, 0);
> -MODULE_PARM_DESC(ignore_resource_conflict, "Ignore ACPI resource conflict");
> -
>  static struct platform_device *it87_pdev[2];
>  
>  #define	REG_2E	0x2e	/* The register to read/write */
> @@ -181,6 +173,12 @@ static inline void superio_exit(int ioreg)
>  #define IT87_SIO_VID_REG	0xfc	/* VID value */
>  #define IT87_SIO_BEEP_PIN_REG	0xf6	/* Beep pin mapping */
>  
> +/* Force chip ID to specified value. Should only be used for testing */
> +static unsigned short force_id;
> +
> +/* ACPI resource conflicts are ignored if this parameter is set to 1 */
> +static bool ignore_resource_conflict;
> +
>  /* Update battery voltage after every reading if true */
>  static bool update_vbat;
>  
> @@ -3457,11 +3455,20 @@ static void __exit sm_it87_exit(void)
>  
>  MODULE_AUTHOR("Chris Gauthron, Jean Delvare <jdelvare@suse.de>");
>  MODULE_DESCRIPTION("IT8705F/IT871xF/IT872xF hardware monitoring driver");
> +
> +module_param(force_id, ushort, 0);
> +MODULE_PARM_DESC(force_id, "Override the detected device ID");
> +
> +module_param(ignore_resource_conflict, bool, 0);
> +MODULE_PARM_DESC(ignore_resource_conflict, "Ignore ACPI resource conflict");
> +
>  module_param(update_vbat, bool, 0);
>  MODULE_PARM_DESC(update_vbat, "Update vbat if set else return powerup value");
> +
>  module_param(fix_pwm_polarity, bool, 0);
>  MODULE_PARM_DESC(fix_pwm_polarity,
>  		 "Force PWM polarity to active high (DANGEROUS)");
> +
>  MODULE_LICENSE("GPL");
>  
>  module_init(sm_it87_init);
