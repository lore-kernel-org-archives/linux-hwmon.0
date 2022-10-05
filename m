Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95745C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Oct 2022 18:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbiJEScH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Oct 2022 14:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiJEScG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Oct 2022 14:32:06 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD3E422C6
        for <linux-hwmon@vger.kernel.org>; Wed,  5 Oct 2022 11:32:05 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id b2so11217912plc.7
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Oct 2022 11:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=JQ8qAyXQbluE5P7625sXp1QAWEcQAT+hb0Z6n+vKKDs=;
        b=oe7wFl/J32/s/yDZaRrdSmgBDC3+CsjB3aofvwB/m07qD2cDGcXvtcookwi2m38x8v
         wRwSLkcEOQzJ53MlEQ0ZdzPaWxYtC3pisA7HMQQch2oR5NTwWeSDrivxTd+iZsnsjw5u
         o24f9zp+9M0bAYfVqytIOf5dWOz+JpWWrqX1Odf2XIDnqxLs4xJ26QcvAzICiMmYcL9x
         kh5nnHq66jdWQDk+SFcO2E8j180ZpoHB70p1d0UBYieijM67yb7Gh1lJ1EdVp2pOAduM
         qUnYuh0vtFnKNJ0uhmg75Rd/7dYZVWrMrWy3juvaSjOKBJvKMfvenXLtDL4UP+L4hgxu
         2oOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JQ8qAyXQbluE5P7625sXp1QAWEcQAT+hb0Z6n+vKKDs=;
        b=BOxJ1r+ZLr5T2gcydrAw/tWBIkiQVbC8pnBIabfUv8hqosDvGzWet03BF9xidnq+rt
         3bBfalEUX5LVOxtbutsYaVOoJ/tlbZMYUXYQcwoDVMvcTZbATy22U6Wi4NPdq9Le6Z+q
         l0wl+TDFKJyEf4Gy3JDSZtCF+926vnJCJO7hzzfmxNfn1aLce0vcHIvFcl+nLoj3pn6D
         J+rkxjo/5wY1P5ujMTdbnxs9NG/otBgwiVu9IC4dnNY12v/W5Oz9OeF5NtRRYCr3v2lj
         8IPcDLWihv8Cgtcx2yh6fa+G3qdjsJsiOtfebIK90yoXcGmB+iuFxFzV2mH0iALGfiSq
         UC/Q==
X-Gm-Message-State: ACrzQf0gyfqcHN9ZNHuRwE4ZTjXP45mIaYyCBuv7KDtEsZX6WrI3Moi4
        hHv5uGBHrkvJD+lTCvgfSqk=
X-Google-Smtp-Source: AMsMyM5bMVz06SDaDL1RIstlGycrv4hTTtpLr3wuuQgDECZkBhifvJ5GisuNQ0FQb5457flz5DrV8A==
X-Received: by 2002:a17:902:8643:b0:17a:3e74:d2a6 with SMTP id y3-20020a170902864300b0017a3e74d2a6mr825291plt.120.1664994725092;
        Wed, 05 Oct 2022 11:32:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f201-20020a6238d2000000b0052e987c64efsm8965743pfa.174.2022.10.05.11.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 11:32:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 5 Oct 2022 11:32:03 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (it87) Add param to ignore ACPI resource
 conflicts
Message-ID: <20221005183203.GA2747052@roeck-us.net>
References: <20221004210100.540120-1-ahmad@khalifa.ws>
 <20221004210100.540120-2-ahmad@khalifa.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004210100.540120-2-ahmad@khalifa.ws>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 04, 2022 at 10:01:01PM +0100, Ahmad Khalifa wrote:
> Add parameter to ignore ACPI resource conflicts as an alternate to using
> 'acpi_enforce_resources=lax'.
> 
> Some BIOSes reserve resources and don't use them and the system wide
> parameter may result in failures to certain drivers.
> 
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/it87.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 0e543dbe0a6b..c4f5500dcf3c 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -69,6 +69,10 @@ static unsigned short force_id;
>  module_param(force_id, ushort, 0);
>  MODULE_PARM_DESC(force_id, "Override the detected device ID");
>  
> +static bool ignore_resource_conflict;
> +module_param(ignore_resource_conflict, bool, 0);
> +MODULE_PARM_DESC(ignore_resource_conflict, "Ignore ACPI resource conflict");
> +
>  static struct platform_device *it87_pdev[2];
>  
>  #define	REG_2E	0x2e	/* The register to read/write */
> @@ -3261,8 +3265,10 @@ static int __init it87_device_add(int index, unsigned short address,
>  	int err;
>  
>  	err = acpi_check_resource_conflict(&res);
> -	if (err)
> -		return err;
> +	if (err) {
> +		if (!ignore_resource_conflict)
> +			return err;
> +	}
>  
>  	pdev = platform_device_alloc(DRVNAME, address);
>  	if (!pdev)
