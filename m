Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B0AC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jun 2022 13:49:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343673AbiFENtI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jun 2022 09:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbiFENtH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jun 2022 09:49:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6A01E19007
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Jun 2022 06:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654436945;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BRPkzB0Obt6oYcl++dMZO0Ti3gSuzY9Z9516AYxuh28=;
        b=iYbcbovqefE7uqcmV4Fa18RWImfewPAI8pDD3LTUKyX8N4gm+Ws17UdC2lDvAgKbEANYh2
        +Ubc6SGdh6J9x+CJo2qKLpAhLDprlJjlvHnRBVlZpTJvUFBcGXcqLeongizS47NzOM01op
        SKW/Jq3Qat4cvbujS082h4opLtKX2r8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-6yCaz8fkOomgNOusFEJ-8g-1; Sun, 05 Jun 2022 09:49:04 -0400
X-MC-Unique: 6yCaz8fkOomgNOusFEJ-8g-1
Received: by mail-ed1-f72.google.com with SMTP id z20-20020a05640235d400b0042dfc1c0e80so8307976edc.21
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Jun 2022 06:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BRPkzB0Obt6oYcl++dMZO0Ti3gSuzY9Z9516AYxuh28=;
        b=pLeoTv1DjwDqoDC+n+TGX3NQPtedfGT++ZG5L44/GJJxwFznukaB2niwwFe0noeDVI
         b8WxBq/mZkH+CDYeaaA/PQQlzHFtpDUu5A7Yh2nFZeHZtCBIZSeikH5FUlY4K+Z5y8/n
         HKU/FjFU1b+QGgnxXcO/Ud7pmFfAA7Fxp5iuFTtWfPZ8PHqJtc7kkMOYtqHd2mhvVyjI
         BzLmR9rIiK/RgWvJ7Swi1YH71tGExYq11Bc9qTQCZ7ib3U7Rb+POzzmIsdTAc8FidJ1J
         7TPRnBpzhMon1+aTKYHFvLdJUxx6iXiftk+LwnuLOdMlpFrQB1YlFTLTJwLPWERZAwM4
         iz0Q==
X-Gm-Message-State: AOAM532SQ0Mjdh8skauixhcFy/Snf+3CCvUPesFRnxfSJiRBYBu9Fmbv
        X9bdYH1PsNQJLZ2thk50QzUDcUvuGEg6whlhfRCWVBqk7lAUKvf+39F7FFIk99NnuWJlATNIZI9
        S9MIR0ezWUcyFr0JQS2/rpDI=
X-Received: by 2002:a17:907:3fa4:b0:6fe:b83b:d667 with SMTP id hr36-20020a1709073fa400b006feb83bd667mr17092617ejc.481.1654436942636;
        Sun, 05 Jun 2022 06:49:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWFfGXlzscREcCMsyioSn2fmCXwK2n/wGKr/8cR3r52Gskf6dMa5m3+foLX/QTDCr1pd//kQ==
X-Received: by 2002:a17:907:3fa4:b0:6fe:b83b:d667 with SMTP id hr36-20020a1709073fa400b006feb83bd667mr17092601ejc.481.1654436942399;
        Sun, 05 Jun 2022 06:49:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id h14-20020aa7c94e000000b0042e03eed448sm5734417edt.20.2022.06.05.06.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jun 2022 06:49:01 -0700 (PDT)
Message-ID: <f50994ad-0682-960a-a566-6e143f81e258@redhat.com>
Date:   Sun, 5 Jun 2022 15:49:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] hwmon: (sch56xx-common) Add DMI override table
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220604220200.2567-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220604220200.2567-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 6/5/22 00:02, Armin Wolf wrote:
> Some devices like the Fujitsu Celsius W380 do contain
> a working sch56xx hardware monitoring device, but do
> not contain the necessary DMI onboard device.
> 
> Do not check for the presence of an suitable onboard device
> on these machines. The list of affected machines was created
> using data collected by the Linux Hardware Project.
> 
> Tested on a Fujitsu Esprimo P720, but sadly not on a affected
> machine.
> 
> Fixes: 393935baa45e (hwmon: (sch56xx-common) Add automatic module loading on supported devices)
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/hwmon/sch56xx-common.c | 44 ++++++++++++++++++++++++++--------
>  1 file changed, 34 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common.c
> index 3ece53adabd6..de3a0886c2f7 100644
> --- a/drivers/hwmon/sch56xx-common.c
> +++ b/drivers/hwmon/sch56xx-common.c
> @@ -523,6 +523,28 @@ static int __init sch56xx_device_add(int address, const char *name)
>  	return PTR_ERR_OR_ZERO(sch56xx_pdev);
>  }
> 
> +static const struct dmi_system_id sch56xx_dmi_override_table[] __initconst = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CELSIUS W380"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "ESPRIMO P710"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "ESPRIMO E9900"),
> +		},
> +	},
> +	{ }
> +};
> +
>  /* For autoloading only */
>  static const struct dmi_system_id sch56xx_dmi_table[] __initconst = {
>  	{
> @@ -543,16 +565,18 @@ static int __init sch56xx_init(void)
>  		if (!dmi_check_system(sch56xx_dmi_table))
>  			return -ENODEV;
> 
> -		/*
> -		 * Some machines like the Esprimo P720 and Esprimo C700 have
> -		 * onboard devices named " Antiope"/" Theseus" instead of
> -		 * "Antiope"/"Theseus", so we need to check for both.
> -		 */
> -		if (!dmi_find_device(DMI_DEV_TYPE_OTHER, "Antiope", NULL) &&
> -		    !dmi_find_device(DMI_DEV_TYPE_OTHER, " Antiope", NULL) &&
> -		    !dmi_find_device(DMI_DEV_TYPE_OTHER, "Theseus", NULL) &&
> -		    !dmi_find_device(DMI_DEV_TYPE_OTHER, " Theseus", NULL))
> -			return -ENODEV;
> +		if (!dmi_check_system(sch56xx_dmi_override_table)) {
> +			/*
> +			 * Some machines like the Esprimo P720 and Esprimo C700 have
> +			 * onboard devices named " Antiope"/" Theseus" instead of
> +			 * "Antiope"/"Theseus", so we need to check for both.
> +			 */
> +			if (!dmi_find_device(DMI_DEV_TYPE_OTHER, "Antiope", NULL) &&
> +			    !dmi_find_device(DMI_DEV_TYPE_OTHER, " Antiope", NULL) &&
> +			    !dmi_find_device(DMI_DEV_TYPE_OTHER, "Theseus", NULL) &&
> +			    !dmi_find_device(DMI_DEV_TYPE_OTHER, " Theseus", NULL))
> +				return -ENODEV;
> +		}
>  	}
> 
>  	/*
> --
> 2.30.2
> 

