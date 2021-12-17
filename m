Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2EFC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Dec 2021 16:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238358AbhLQQLC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Dec 2021 11:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238858AbhLQQLC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Dec 2021 11:11:02 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F16A3C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Dec 2021 08:11:01 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id bk14so4279800oib.7
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Dec 2021 08:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LkCGv3EewzBYiNifona/R+xS67ymk6F9AxjOGq7qnnM=;
        b=DC4gd/a/hYmcmcwaVZt+JJb2+uEy1gOhkKU+FP6Zql5T5Ux8V7aHWzUkE2sGNbI7d7
         oyZ4VZpayCapQ2vqFM1/NkGqcyHxQXkWBfYO730D00x+8Vzx55lzqsRRc6K+bK4+ewsS
         66tth/xpGKXE8ItlLDxnmxeAWgwTlA0rjz3h32VTbnj+y4cTFuH/nTuasAE4VjKvu3Nf
         WS9c3VpyMTpnzR57Yv0gUnTqzZqJlsnNlpTeMnp/U1rU1uOQi7wI83vETS3iur/pVk0+
         ppsOlpExoEj4d+wWTULEgpJBQTKmNIinZja2VPHizoIuehE0/XiWKitl39EPMEfbRsJm
         GWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=LkCGv3EewzBYiNifona/R+xS67ymk6F9AxjOGq7qnnM=;
        b=4SzzvSc8QDlo94CYxaq0oy2ARbNf3rVnaQXoAU/WYZg88e6c0riTbVbT+JefI6/DVe
         EvW4CUglgE8Boz66mp2NaLlAEYKWjGSBh82jIEeSx6gXypAx5S6WLAw65sYDmQZPlB0c
         Ln4Lk8hfZ0xhAvLT9L/SywYZJWK9zNnggPx/U9vVQ71fQR+yMR7WYZ7XFQPsIUt4eNzb
         AzBEC8/LY0BrEbSgePU7LmyeJUk1KmuTFuuLjuqhAv9PaM/JT7Ih3G7IeZ+t7wCdSSVg
         yts73g0Ojbp7ik053v/4RhsokZBXOc20kLjMEKvo7MvPD8BfEd+JHIzbmEFcp5u8ih25
         yH3w==
X-Gm-Message-State: AOAM5317/SZtea1a7KatI6CTbdZL77l5COZHse+oH5Hm5y+cW9iXF4Hh
        dgiezEKgAtMIK2EIISdp155vDARm01c=
X-Google-Smtp-Source: ABdhPJwZRIWtXDJF4ujD/+mum6y8v7sEZ0Ed/YttVElBnIgsQUr/K6924OSetUjixlE9MHefbZ4RoQ==
X-Received: by 2002:aca:acc4:: with SMTP id v187mr8354161oie.35.1639757461047;
        Fri, 17 Dec 2021 08:11:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n26sm1691680ooc.48.2021.12.17.08.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:11:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 17 Dec 2021 08:10:59 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     arthur@aheymans.xyz
Cc:     linux-hwmon@vger.kernel.org, patrick.rudolph@9elements.com,
        Arthur Heymans <arthur.heymans@9elements.com>
Subject: Re: [PATCH v2 1/3] hwmon/ir38064: Add support for IR38060, IR38164
 IR38263
Message-ID: <20211217161059.GA3428228@roeck-us.net>
References: <20211213142814.264802-1-arthur.heymans@9elements.com>
 <20211213142814.264802-2-arthur.heymans@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213142814.264802-2-arthur.heymans@9elements.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Dec 13, 2021 at 03:28:12PM +0100, arthur@aheymans.xyz wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
> The IR38060, IR38164 and IR38263 can be supported using this driver.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Arthur Heymans <arthur.heymans@9elements.com>

Series applied.

Thanks,
Guenter

> ---
>  .../devicetree/bindings/trivial-devices.yaml  |  6 ++++
>  Documentation/hwmon/ir38064.rst               | 28 +++++++++++++++++--
>  drivers/hwmon/pmbus/Kconfig                   |  4 +--
>  drivers/hwmon/pmbus/ir38064.c                 |  5 +++-
>  4 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 791079021f1b..38c3264b3dcb 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -121,8 +121,14 @@ properties:
>            - ibm,cffps2
>              # Infineon IR36021 digital POL buck controller
>            - infineon,ir36021
> +          # Infineon IR38060 Voltage Regulator
> +          - infineon,ir38060
>              # Infineon IR38064 Voltage Regulator
>            - infineon,ir38064
> +          # Infineon IR38164 Voltage Regulator
> +          - infineon,ir38164
> +          # Infineon IR38263 Voltage Regulator
> +          - infineon,ir38263
>              # Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz)
>            - infineon,slb9635tt
>              # Infineon SLB9645 I2C TPM (new protocol, max 400khz)
> diff --git a/Documentation/hwmon/ir38064.rst b/Documentation/hwmon/ir38064.rst
> index c455d755a267..e1148f21ea2a 100644
> --- a/Documentation/hwmon/ir38064.rst
> +++ b/Documentation/hwmon/ir38064.rst
> @@ -3,14 +3,38 @@ Kernel driver ir38064
>  
>  Supported chips:
>  
> +  * Infineon IR38060
> +
> +    Prefix: 'IR38060'
> +    Addresses scanned: -
> +
> +    Datasheet: Publicly available at the Infineon website
> +      https://www.infineon.com/dgdl/Infineon-IR38060M-DS-v03_16-EN.pdf?fileId=5546d4625c167129015c3291ea9a4cee
> +
>    * Infineon IR38064
>  
>      Prefix: 'ir38064'
>      Addresses scanned: -
>  
> -    Datasheet: Publicly available at the Infineon webiste
> +    Datasheet: Publicly available at the Infineon website
>        https://www.infineon.com/dgdl/Infineon-IR38064MTRPBF-DS-v03_07-EN.pdf?fileId=5546d462584d1d4a0158db0d9efb67ca
>  
> +  * Infineon IR38164
> +
> +    Prefix: 'ir38164'
> +    Addresses scanned: -
> +
> +    Datasheet: Publicly available at the Infineon website
> +      https://www.infineon.com/dgdl/Infineon-IR38164M-DS-v02_02-EN.pdf?fileId=5546d462636cc8fb01640046efea1248
> +
> +  * Infineon ir38263
> +
> +    Prefix: 'ir38263'
> +    Addresses scanned: -
> +
> +    Datasheet:  Publicly available at the Infineon website
> +      https://www.infineon.com/dgdl/Infineon-IR38263M-DataSheet-v03_05-EN.pdf?fileId=5546d4625b62cd8a015bcf81f90a6e52
> +
>  Authors:
>        - Maxim Sloyko <maxims@google.com>
>        - Patrick Venture <venture@google.com>
> @@ -18,7 +42,7 @@ Authors:
>  Description
>  -----------
>  
> -IR38064 is a Single-input Voltage, Synchronous Buck Regulator, DC-DC Converter.
> +IR38x6x are a Single-input Voltage, Synchronous Buck Regulator, DC-DC Converter.
>  
>  Usage Notes
>  -----------
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index ffb609cee3a4..d2b178a902f0 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -123,10 +123,10 @@ config SENSORS_IR36021
>  	  be called ir36021.
>  
>  config SENSORS_IR38064
> -	tristate "Infineon IR38064"
> +	tristate "Infineon IR38064 and compatibles"
>  	help
>  	  If you say yes here you get hardware monitoring support for Infineon
> -	  IR38064.
> +	  IR38060, IR38064, IR38164 and IR38263.
>  
>  	  This driver can also be built as a module. If so, the module will
>  	  be called ir38064.
> diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
> index 1fb7f1248639..4e91d3e54a4a 100644
> --- a/drivers/hwmon/pmbus/ir38064.c
> +++ b/drivers/hwmon/pmbus/ir38064.c
> @@ -41,7 +41,10 @@ static int ir38064_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id ir38064_id[] = {
> +	{"ir38060", 0},
>  	{"ir38064", 0},
> +	{"ir38164", 0},
> +	{"ir38263", 0},
>  	{}
>  };
>  
> @@ -59,6 +62,6 @@ static struct i2c_driver ir38064_driver = {
>  module_i2c_driver(ir38064_driver);
>  
>  MODULE_AUTHOR("Maxim Sloyko <maxims@google.com>");
> -MODULE_DESCRIPTION("PMBus driver for Infineon IR38064");
> +MODULE_DESCRIPTION("PMBus driver for Infineon IR38064 and comaptible chips");
>  MODULE_LICENSE("GPL");
>  MODULE_IMPORT_NS(PMBUS);
