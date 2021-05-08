Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88754C433B4
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 15:28:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55CFD610A2
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 15:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhEHP3t (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 May 2021 11:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhEHP3t (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 May 2021 11:29:49 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA44C061574
        for <linux-hwmon@vger.kernel.org>; Sat,  8 May 2021 08:28:47 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso10551357otm.4
        for <linux-hwmon@vger.kernel.org>; Sat, 08 May 2021 08:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Ot5vwAkBWMesxdifDyCXBdMe6K9tz/v4Pa74eXOUZ4Y=;
        b=Etb3MJ0kTQElGybzcLbh1PkVcZo2tA1UceJv/1EK4NpHOg9KIj42dcDbiGoF4PBJS+
         91igm4qsvoMTFyPykiDd3+8Bf4qvvEScOhMFCuIAJ09CIPXVr//s6G7a3jIy4NFsrdYp
         G8288GCRKVPTRE+Eb8TkqlIc/+0t4L/XCLfR07SM119o0Vjp7TRgS10OeB3sMUujT2BW
         IhHv8DXBjLR8eWnMtbMKy9jVUQvq4Ly+lt8KXmm7VJJ/kyTxs0lzXYRIUdRf26foDnzr
         HOUeFCOc6KRkHiECpLBh43NgeFJfv7QqsaJMezg9xPRHpavWbJHbDFVL/jN+5lWQusqQ
         uraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition;
        bh=Ot5vwAkBWMesxdifDyCXBdMe6K9tz/v4Pa74eXOUZ4Y=;
        b=JkydPQn9/WSYIRO/0INoFQTlQMOF5AdbBMwyAy4HRKyC9hIHVF9u99TWasWtAkVzbi
         qhX61ZKAptoPYp99OKDgHAvt3QvRGj4jWOiPixpfBWbn1a3t9S+jIalQMpC3H2TgmlHN
         GhXbQN3q2VXeIDTSkWn6ohQyx/CsHtNG431LNwXFh2NuCSLAvdetACYGRitSGmntZGiw
         lBUYsTOWJ1Fk4obcMx+TXaxZE6qxk0nLAFwJLmBLGGT4/r0EMrRSpIjcCzByO8z3aUYY
         f5Cxxds7Gzyu1M9rczhOqYvAV0nqN9qabqTYWsbQs5YW0aA0hs9/j+TTBS1xgNX5XTON
         oTMQ==
X-Gm-Message-State: AOAM530CeAD166rZ+nc4xv2nlqXQovICYD2ut8MfS/kMG1J2Gu82VjbY
        3xsYRRBGKCouOg+mIeHa3is=
X-Google-Smtp-Source: ABdhPJw1HE77SYb2IIGzE5Ef0XCiZV1IEtDa17obOHmokPmZ8DdPW8z264Atw1qA6QYsfawY6w83Gw==
X-Received: by 2002:a05:6830:23a2:: with SMTP id m2mr13371645ots.133.1620487726800;
        Sat, 08 May 2021 08:28:46 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 67sm1825885otp.68.2021.05.08.08.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 08:28:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 8 May 2021 08:28:44 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrej Picej <andpicej@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm70) Add support for ACPI
Message-ID: <20210508152844.GA3115728@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On Thu, Apr 23, 2020 at 03:27:33PM +0200, Andrej Picej wrote:
> This commit adds support for lm70 commpatible drivers with systems that
> use ACPI.
> 
> Signed-off-by: Andrej Picej <andpicej@gmail.com>
> [groeck: Fix various issues seen if CONFIG_ACPI=n]
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

An ACPI ID validation shows that all the ACPI IDs aded below
are invalid.

Are they used anywhere in actual systems ? If so, can you point
to some examples ?

Thanks,
Guenter

> ---
>  drivers/hwmon/lm70.c | 47 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
> index 4122e59f0bb4..ae2b84263a44 100644
> --- a/drivers/hwmon/lm70.c
> +++ b/drivers/hwmon/lm70.c
> @@ -25,7 +25,7 @@
>  #include <linux/spi/spi.h>
>  #include <linux/slab.h>
>  #include <linux/of_device.h>
> -
> +#include <linux/acpi.h>
>  
>  #define DRVNAME		"lm70"
>  
> @@ -148,18 +148,50 @@ static const struct of_device_id lm70_of_ids[] = {
>  MODULE_DEVICE_TABLE(of, lm70_of_ids);
>  #endif
>  
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id lm70_acpi_ids[] = {
> +	{
> +		.id = "LM000070",
> +		.driver_data = LM70_CHIP_LM70,
> +	},
> +	{
> +		.id = "TMP00121",
> +		.driver_data = LM70_CHIP_TMP121,
> +	},
> +	{
> +		.id = "LM000071",
> +		.driver_data = LM70_CHIP_LM71,
> +	},
> +	{
> +		.id = "LM000074",
> +		.driver_data = LM70_CHIP_LM74,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, lm70_acpi_ids);
> +#endif
> +
>  static int lm70_probe(struct spi_device *spi)
>  {
> -	const struct of_device_id *match;
> +	const struct of_device_id *of_match;
>  	struct device *hwmon_dev;
>  	struct lm70 *p_lm70;
>  	int chip;
>  
> -	match = of_match_device(lm70_of_ids, &spi->dev);
> -	if (match)
> -		chip = (int)(uintptr_t)match->data;
> -	else
> -		chip = spi_get_device_id(spi)->driver_data;
> +	of_match = of_match_device(lm70_of_ids, &spi->dev);
> +	if (of_match)
> +		chip = (int)(uintptr_t)of_match->data;
> +	else {
> +#ifdef CONFIG_ACPI
> +		const struct acpi_device_id *acpi_match;
> +
> +		acpi_match = acpi_match_device(lm70_acpi_ids, &spi->dev);
> +		if (acpi_match)
> +			chip = (int)(uintptr_t)acpi_match->driver_data;
> +		else
> +#endif
> +			chip = spi_get_device_id(spi)->driver_data;
> +	}
>  
>  	/* signaling is SPI_MODE_0 */
>  	if (spi->mode & (SPI_CPOL | SPI_CPHA))
> @@ -195,6 +227,7 @@ static struct spi_driver lm70_driver = {
>  	.driver = {
>  		.name	= "lm70",
>  		.of_match_table	= of_match_ptr(lm70_of_ids),
> +		.acpi_match_table = ACPI_PTR(lm70_acpi_ids),
>  	},
>  	.id_table = lm70_ids,
>  	.probe	= lm70_probe,
> -- 
> 2.25.1
