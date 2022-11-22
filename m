Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4C2C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Nov 2022 18:46:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbiKVSqr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Nov 2022 13:46:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234598AbiKVSq2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2022 13:46:28 -0500
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE31D8B12B
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 10:46:25 -0800 (PST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-12c8312131fso18284003fac.4
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 10:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwrO9d17kQ2kZSOqFgMFnQHFu0mZKWncEjzHHR5biJE=;
        b=JtBMhuyyeruYbX4cXaEh/g0V/+KwgqGMMRWcyQ9cmdJ86EM5d321b7yxrLbFNc0FY0
         keK2Dl/ZdDKbcAZfphxqyzQak10is45VvMhiyxiGZQD/ivvpGU9IOWqglBQBD8oLIU0O
         BcqrcQTS1ZXv8pweQdYZMiAOVJkHhVutzx0rggvIDodCcEh8Jca84vw+rROzRj6aBfOh
         4+q6z751JilteUyBBGrKQO3MMOBcVYewuf0swq/YlAL7prDCLCdH0ukzw81R3n4ls+Z/
         OY6VSDms9dZ8yQ/jtyCT95Rl2kgvJgB3CUOTTxAw0JRHgnP8GW6isU3z9wV3JFf0nzjr
         VLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwrO9d17kQ2kZSOqFgMFnQHFu0mZKWncEjzHHR5biJE=;
        b=Rq/5aFyPrDOOGXxuAzrqkknjfblIC/YWx3SthnaeJSv7BIstBqy2eh6MD4PQ2X/1OT
         5Z/8sF9beZFTTTJAM7KjWwxz16RYjtdi5Dc+3+h1fMwtnntEO9tGwPExj/m8hXR53Qgo
         n60XnwSC0bxcitCcChN5aWRpqRW9zdcT4djNg62Oy6Mv7MCbqxSsVJCoN0Bta6qxrlFb
         8JsLFrkNnixmcGXHZpkDwqOtGDWhNQjlLyRlpHbeXzIqTSe+Me2zsI8E+PXi/tt6K//+
         AMyDH8Rk1beb1u5uRiyI8QJrtZhcbzuJJpT1d1vWKQN8/d0Q8+rk9glnWG9P/HdFD6+w
         9vUg==
X-Gm-Message-State: ANoB5plzTosYVE5TECq9+zHQXq7x4mK95YtuKSZoHHMQW8sisCwSzBcB
        VvawIW15xVBxrr0GoVMkdLU=
X-Google-Smtp-Source: AA0mqf7ymz/RlYztTnaqnQr8XsHWDIdUWZP2eFO2kM4rZ3yRdNyC0dMkhmB8+1vKa6QWGoDpLsGadA==
X-Received: by 2002:a05:6870:460c:b0:13c:33d0:22e2 with SMTP id z12-20020a056870460c00b0013c33d022e2mr7759126oao.14.1669142784988;
        Tue, 22 Nov 2022 10:46:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k5-20020a056870d0c500b0014185b2b3d5sm5909334oaa.18.2022.11.22.10.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 10:46:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 22 Nov 2022 10:46:23 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/1] hwmon: (it87) Automatic handling of ACPI resource
 failure
Message-ID: <20221122184328.GA553935@roeck-us.net>
References: <20221121025718.160667-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121025718.160667-1-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Nov 21, 2022 at 01:57:18PM +1100, Frank Crawford wrote:
> On some Gigabyte boards sensors are marked as ACPI regions but not
> really handled by ACPI calls, as they return no data.
> Most commonly this is seen on boards with multiple ITE chips.
> In this case we just ignore the failure and continue on.
> 
> This is effectively the same as the use of either
>     acpi_enforce_resources=lax (kernel)
> or
>     ignore_resource_conflict=1 (it87)
> but set programatically.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---

Sorry, I can not accept this patch. Ignoring resource conflicts
may have unintentional side effects and _has_ to be explicitly
requested by the user.

Guenter

> 
> Changes in this patch set:
> 
> * Add a flag, set in the DMI table, for ignoring ACPI resource conflict.
> 
> * Print an message if a conflict occurs, but otherwise ignore the issue.
> 
> * Add known, tested boards to the DMI table.
> 
>  drivers/hwmon/it87.c | 62 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 9997f76b1f4a..991f1ab5f82c 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -570,6 +570,7 @@ struct it87_data {
>  /* Board specific settings from DMI matching */
>  struct it87_dmi_data {
>  	u8 skip_pwm;		/* pwm channels to skip for this board  */
> +	bool skip_acpi_res;	/* ignore acpi failures on this board */
>  };
>  
>  /* Global for results from DMI matching, if needed */
> @@ -3264,7 +3265,9 @@ static int __init it87_device_add(int index, unsigned short address,
>  
>  	err = acpi_check_resource_conflict(&res);
>  	if (err) {
> -		if (!ignore_resource_conflict)
> +		if (dmi_data && dmi_data->skip_acpi_res)
> +			pr_info("Ignoring expected ACPI resource conflict\n");
> +		else if (!ignore_resource_conflict)
>  			return err;
>  	}
>  
> @@ -3322,6 +3325,21 @@ static struct it87_dmi_data nvidia_fn68pt = {
>  	.skip_pwm = BIT(1),
>  };
>  
> +/*
> + * On some Gigabyte boards sensors are marked as ACPI regions but not
> + * really handled by ACPI calls, as they return no data.
> + * Most commonly this is seen on boards with multiple ITE chips.
> + * In this case we just ignore the failure and continue on.
> + * This is effectively the same as the use of either
> + *     acpi_enforce_resources=lax (kernel)
> + * or
> + *     ignore_resource_conflict=1 (it87)
> + * but set programatically.
> + */
> +static struct it87_dmi_data gigabyte_acpi_ignore = {
> +	.skip_acpi_res = true,
> +};
> +
>  #define IT87_DMI_MATCH_VND(vendor, name, cb, data) \
>  	{ \
>  		.callback = cb, \
> @@ -3332,7 +3350,49 @@ static struct it87_dmi_data nvidia_fn68pt = {
>  		.driver_data = data, \
>  	}
>  
> +#define IT87_DMI_MATCH_GBT(name, cb, data) \
> +	IT87_DMI_MATCH_VND("Gigabyte Technology Co., Ltd.", name, cb, data)
> +
>  static const struct dmi_system_id it87_dmi_table[] __initconst = {
> +	IT87_DMI_MATCH_GBT("TRX40 AORUS XTREME", it87_dmi_cb,
> +			   &gigabyte_acpi_ignore),
> +		/* IT8688E + IT8792E/IT8795E */
> +	IT87_DMI_MATCH_GBT("Z390 AORUS ULTRA-CF", it87_dmi_cb,
> +			   &gigabyte_acpi_ignore),
> +		/* IT8688E + IT8792E/IT8795E */
> +	IT87_DMI_MATCH_GBT("Z490 AORUS ELITE AC", it87_dmi_cb,
> +			   &gigabyte_acpi_ignore),
> +		/* IT8688E */
> +	IT87_DMI_MATCH_GBT("B550 AORUS PRO AC", it87_dmi_cb,
> +			   &gigabyte_acpi_ignore),
> +		/* IT8688E + IT8792E/IT8795E */
> +	IT87_DMI_MATCH_GBT("B560I AORUS PRO AX", it87_dmi_cb,
> +			   &gigabyte_acpi_ignore),
> +		/* IT8689E */
> +	IT87_DMI_MATCH_GBT("X570 AORUS ELITE WIFI", it87_dmi_cb,
> +			   &gigabyte_acpi_ignore),
> +		/* IT8688E */
> +	IT87_DMI_MATCH_GBT("X570 AORUS MASTER", it87_dmi_cb,
> +			   &gigabyte_acpi_ignore),
> +		/* IT8688E + IT8792E/IT8795E */
> +	IT87_DMI_MATCH_GBT("X570 AORUS PRO WIFI", it87_dmi_cb,
> +			   &gigabyte_acpi_ignore),
> +		/* IT8688E + IT8792E/IT8795E */
> +	IT87_DMI_MATCH_GBT("X570 I AORUS PRO WIFI", it87_dmi_cb,
> +			   &gigabyte_acpi_ignore),
> +		/* IT8688E */
> +	IT87_DMI_MATCH_GBT("X570S AERO G", it87_dmi_cb,
> +			   &gigabyte_acpi_ignore),
> +		/* IT8689E + IT87952E */
> +	IT87_DMI_MATCH_GBT("X670E AORUS MASTER", it87_dmi_cb,
> +			   &gigabyte_acpi_ignore),
> +		/* IT8689E - Note there may also be a second chip */
> +	IT87_DMI_MATCH_GBT("Z690 AORUS PRO DDR4", it87_dmi_cb,
> +			   &gigabyte_acpi_ignore),
> +		/* IT8689E + IT87952E */
> +	IT87_DMI_MATCH_GBT("Z690 AORUS PRO", it87_dmi_cb,
> +			   &gigabyte_acpi_ignore),
> +		/* IT8689E + IT87952E */
>  	IT87_DMI_MATCH_VND("nVIDIA", "FN68PT", it87_dmi_cb, &nvidia_fn68pt),
>  	{ }
>  
