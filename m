Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F36C43219
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Dec 2021 13:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238030AbhLMNvC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Dec 2021 08:51:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238021AbhLMNvA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Dec 2021 08:51:00 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55DA1C061574
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 05:51:00 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id q25so23324927oiw.0
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 05:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nDfv7aE3HSRR2vd62uYRm9Uc/bRAlGTrHkgu71rL8Vo=;
        b=n6nYaTYE7wCVk3HvFSQh3Hk1t/UQSMhlHI5EDGF4YNwHCpP+I/NpVA9DjxwoPzzUrH
         nWhtS4aD7SWcgGilLGRyjFcXipsm65JsOcEG6DK1yjgGPLdI+8Tu3rJcyBbGVCdoX1Qt
         DiDYvTfCW6/Zxs5OYYzT3+iejfZEUEI4K1Op7prPV6QRQTuByjJh9uIqwUTvFIYdi32r
         Jez8Fz88qNGC1xQ768OB0fPUcv6u0c9mRZ2ThCUwb658sUMei1LlH49CINYPRCEN9ACl
         nHCWnJeDbyB8KmS1tgWOb+R8MkzGhfQUlUnXeXVkeCrM2WR5dhy6lkBNdyg3REHhNPQR
         ssxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nDfv7aE3HSRR2vd62uYRm9Uc/bRAlGTrHkgu71rL8Vo=;
        b=z0iUqYPAmbIOIKR5qzsVO3LW/dpLyRs9soBs9VlIVDPQazT52z9W00KjDKDODuHFqK
         pv+tMmgYpwEyXI+ddRnPb6TC7SgJ1+3SK6s14iHgTEwIhRsU+k1nLGk3cBfJen0kckJn
         zLT7hPCs/lPfjVZab1khQ8T28a8LADyteHdLMYjdI4++4FpPBelVA6b3qq6UiifCuE1Y
         c2wRZunzB2yJ0AcLKmNcks+huLT8eeX7wdSk7Tc2IOasioePqVY5AX8DryWvPPK2ZGCy
         bXucGrJXwnhAlvxGLVbefz6fp/qKNPicPzmROYbaHRUAGTPIrM0EyDbrsQimQXwxMyGY
         1jlQ==
X-Gm-Message-State: AOAM532EShCvpgWoePYuKuPQFfqrzwyH3l4saW7Fbg5g1oNEb5vsBLbx
        vkrQsoQKq6tFxi2aQyspY+o=
X-Google-Smtp-Source: ABdhPJwV/VN16z0ijTusax5AEU64hdEveXKVuIU4UuiDEMl7rwFLIW/5kRcDltRor+c958jb+GNypQ==
X-Received: by 2002:a05:6808:3c2:: with SMTP id o2mr28739816oie.112.1639403459681;
        Mon, 13 Dec 2021 05:50:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a17sm2775314oiw.43.2021.12.13.05.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 05:50:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/3] hwmon/ir38064: Add support for IR38060, IR38164
 IR38263
To:     arthur@aheymans.xyz, linux-hwmon@vger.kernel.org
Cc:     patrick.rudolph@9elements.com,
        Arthur Heymans <arthur.heymans@9elements.com>
References: <20211213101902.146179-1-arthur.heymans@9elements.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f1268553-f72b-747d-ddd9-855730f07086@roeck-us.net>
Date:   Mon, 13 Dec 2021 05:50:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211213101902.146179-1-arthur.heymans@9elements.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/13/21 2:19 AM, arthur@aheymans.xyz wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 

Description goes here. the same applies to the other patches in the series.

Guenter

> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Arthur Heymans <arthur.heymans@9elements.com>
> ---
>   .../devicetree/bindings/trivial-devices.yaml  |  6 ++++
>   Documentation/hwmon/ir38064.rst               | 28 +++++++++++++++++--
>   drivers/hwmon/pmbus/Kconfig                   |  4 +--
>   drivers/hwmon/pmbus/ir38064.c                 |  5 +++-
>   4 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 791079021f1b..38c3264b3dcb 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -121,8 +121,14 @@ properties:
>             - ibm,cffps2
>               # Infineon IR36021 digital POL buck controller
>             - infineon,ir36021
> +          # Infineon IR38060 Voltage Regulator
> +          - infineon,ir38060
>               # Infineon IR38064 Voltage Regulator
>             - infineon,ir38064
> +          # Infineon IR38164 Voltage Regulator
> +          - infineon,ir38164
> +          # Infineon IR38263 Voltage Regulator
> +          - infineon,ir38263
>               # Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz)
>             - infineon,slb9635tt
>               # Infineon SLB9645 I2C TPM (new protocol, max 400khz)
> diff --git a/Documentation/hwmon/ir38064.rst b/Documentation/hwmon/ir38064.rst
> index c455d755a267..e1148f21ea2a 100644
> --- a/Documentation/hwmon/ir38064.rst
> +++ b/Documentation/hwmon/ir38064.rst
> @@ -3,14 +3,38 @@ Kernel driver ir38064
>   
>   Supported chips:
>   
> +  * Infineon IR38060
> +
> +    Prefix: 'IR38060'
> +    Addresses scanned: -
> +
> +    Datasheet: Publicly available at the Infineon website
> +      https://www.infineon.com/dgdl/Infineon-IR38060M-DS-v03_16-EN.pdf?fileId=5546d4625c167129015c3291ea9a4cee
> +
>     * Infineon IR38064
>   
>       Prefix: 'ir38064'
>       Addresses scanned: -
>   
> -    Datasheet: Publicly available at the Infineon webiste
> +    Datasheet: Publicly available at the Infineon website
>         https://www.infineon.com/dgdl/Infineon-IR38064MTRPBF-DS-v03_07-EN.pdf?fileId=5546d462584d1d4a0158db0d9efb67ca
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
>   Authors:
>         - Maxim Sloyko <maxims@google.com>
>         - Patrick Venture <venture@google.com>
> @@ -18,7 +42,7 @@ Authors:
>   Description
>   -----------
>   
> -IR38064 is a Single-input Voltage, Synchronous Buck Regulator, DC-DC Converter.
> +IR38x6x are a Single-input Voltage, Synchronous Buck Regulator, DC-DC Converter.
>   
>   Usage Notes
>   -----------
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index ffb609cee3a4..d2b178a902f0 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -123,10 +123,10 @@ config SENSORS_IR36021
>   	  be called ir36021.
>   
>   config SENSORS_IR38064
> -	tristate "Infineon IR38064"
> +	tristate "Infineon IR38064 and compatibles"
>   	help
>   	  If you say yes here you get hardware monitoring support for Infineon
> -	  IR38064.
> +	  IR38060, IR38064, IR38164 and IR38263.
>   
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ir38064.
> diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
> index 1fb7f1248639..4e91d3e54a4a 100644
> --- a/drivers/hwmon/pmbus/ir38064.c
> +++ b/drivers/hwmon/pmbus/ir38064.c
> @@ -41,7 +41,10 @@ static int ir38064_probe(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id ir38064_id[] = {
> +	{"ir38060", 0},
>   	{"ir38064", 0},
> +	{"ir38164", 0},
> +	{"ir38263", 0},
>   	{}
>   };
>   
> @@ -59,6 +62,6 @@ static struct i2c_driver ir38064_driver = {
>   module_i2c_driver(ir38064_driver);
>   
>   MODULE_AUTHOR("Maxim Sloyko <maxims@google.com>");
> -MODULE_DESCRIPTION("PMBus driver for Infineon IR38064");
> +MODULE_DESCRIPTION("PMBus driver for Infineon IR38064 and comaptible chips");
>   MODULE_LICENSE("GPL");
>   MODULE_IMPORT_NS(PMBUS);
> 

