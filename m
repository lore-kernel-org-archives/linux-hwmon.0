Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BB4C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 May 2022 13:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237330AbiEKNMg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 09:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237031AbiEKNMf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 09:12:35 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0053164BE7
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 06:12:33 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-e656032735so2807178fac.0
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=x8V0Evc55pQ4mpStcVrvqqfRi6QToCz+mnWmg+ob/Fw=;
        b=PxPw+hvdAdL1+SyGm9Wknm6olIMznRCuo15s++eq1P3a2tmaJjjFAkmPwzM0kxRBEM
         0TVawXv04BkY9M8lZnVfXlco3ZMnyINBEfT4ffDlypM57kFKXps/tlDMfm1s+WJ0ONE7
         Z1/DMZhNIJzOoqGQ0gU6S01M8MfvHfFApJvFI4dW2w3QnVEhav7IK8J1lVow704JSRii
         cBpuYlRlMR6578XMXUpZxWVtt7kDIFEcc0sxs3OSxxj8hG6NyT2sUvL8UC2tLt7B177i
         oaPSFhPnS+x5wWyNxf+DEJd9SX7cmOPT70C1VLNR23cVq00rsxtkc7VoGM4Ku7dDLVsZ
         byUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=x8V0Evc55pQ4mpStcVrvqqfRi6QToCz+mnWmg+ob/Fw=;
        b=jciO1eOv3PPb+KerNa7E7wRbflrSrt4JSpsZYC47Rv5CxhXpwSZYVgXzCnfYE6gyTf
         F//GInTAdcGWepepnAT0wrJ7e6cMvZXnZF5leBRsGri15MqvvzfHhbP9PkCgykM7MZEW
         EjP/T998fE+5Oebzs9MeeMBtI7+LvRctPQsyNJlD8fv9WwoTN8i7zDT8BbMqWeGJTYhz
         wmC3uynqb4qa1tPrFaRx+/n795CgyNPZOAh8tcbUEz02shg7KxU10PHHtuBLfQjlNXgD
         qnZO0Mb4Rlb4vUVrDDlx0QVYlkCK2AdoXzUxRJWLCzKSqvj56z8TNjyZISiAH1KQXMyw
         TnBw==
X-Gm-Message-State: AOAM533EwTy9lzHI0ARsFgJcyI3cUgCJSw5aLJXxRXqkd7wzL69xAlCI
        rLbt1x+/vA1FKCUwxwCmXMeJRakoUmk/hQ==
X-Google-Smtp-Source: ABdhPJzQTkdmobOmMOAeoUDtlelSj6F0DsxtjJps3A4wXNeuIUK1HBO7BPUWx/+s3dbKx7NTjvvqMQ==
X-Received: by 2002:a05:6870:b40a:b0:d7:5c87:64ab with SMTP id x10-20020a056870b40a00b000d75c8764abmr2643314oap.168.1652274753269;
        Wed, 11 May 2022 06:12:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 22-20020aca2116000000b00325cda1ff8esm728937oiz.13.2022.05.11.06.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 06:12:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b72b9ec1-666c-e4b0-0b6f-8b745857af78@roeck-us.net>
Date:   Wed, 11 May 2022 06:12:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Zhang Rui <rui.zhang@intel.com>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@intel.com,
        Corentin Labbe <clabbe@baylibre.com>
References: <20220511075444.3376950-1-rui.zhang@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH] hwmon: (acpi_power_meter): Convert to
 hwmon_device_register_with_info
In-Reply-To: <20220511075444.3376950-1-rui.zhang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/11/22 00:54, Zhang Rui wrote:
> The acpi_power_meter driver doesn't create any standard hwmon sysfs
> attributes under its hwmon device node, but instead, the driver has its
> own code to create the hwmon style sysfs attributes in the ACPI device
> node of the ACPI Power Meter device.
> I'm not clear why it was designed in that way.
> 
> In order to elimite
> [   79.960333] power_meter ACPI000D:00: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
> convert the driver to use the new API, no chip_info or sysfs_groups
> parameter needed.
> 
> The only difference brought by this patch is that the "name" attribute
> will be created under the hwmon device node. Not sure if this matters or
> not.
> 
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>

No, this is not a conversion and not acceptable. Corentin Labbe is
working on the real thing. See
https://patchwork.kernel.org/project/linux-hwmon/patch/20220509063010.3878134-3-clabbe@baylibre.com/

Guenter

> ---
>   drivers/hwmon/acpi_power_meter.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index c405a5869581..81a982dda5af 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -890,7 +890,8 @@ static int acpi_power_meter_add(struct acpi_device *device)
>   	if (res)
>   		goto exit_free_capability;
>   
> -	resource->hwmon_dev = hwmon_device_register(&device->dev);
> +	resource->hwmon_dev = hwmon_device_register_with_info(&device->dev,
> +				ACPI_POWER_METER_NAME, NULL, NULL, NULL);
>   	if (IS_ERR(resource->hwmon_dev)) {
>   		res = PTR_ERR(resource->hwmon_dev);
>   		goto exit_remove;

