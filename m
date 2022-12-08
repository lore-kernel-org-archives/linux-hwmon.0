Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2EEC4708E
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Dec 2022 02:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbiLHCNP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Dec 2022 21:13:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbiLHCNF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Dec 2022 21:13:05 -0500
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F226710DE
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Dec 2022 18:13:04 -0800 (PST)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1433ef3b61fso315030fac.10
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Dec 2022 18:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cc79ZfaQDExNDfbwGZnqPZEUvowRmsEBSmTVEGjMUAY=;
        b=kZAsllyElj42KNAD+q7NtyI/jwzCC5a5m1KDLlhK1W745XFYm0RPmA03i96vX1teBA
         UfhJJFI3xCMu4t1xm9jR4Hf7FjiI/DNx6/F14VEFBdzUTdLlmksTrNwIRXjW0h1f28AA
         sPH1CNXAH9v+3n3+P6CExXmrJxOa8/upRMpYwATuoRb8GWuYCkvUHXoebzovJHG/6t5a
         Lyru2fskxT3R2WfXs8dvJU/02DIm6pIuhn4RVNgx8P8RRv3C0tcptUbqdzcLMSCxOPkB
         AUkgcmj5mws9LTbiPxiNYI1B5ZXP06BKZKqxOr1hB80D4PA6usByIuz6lv4pnSgoJSK6
         nqvw==
X-Gm-Message-State: ANoB5pk429L3oMBjXi63DPXrVIJAV6OizC4Uh1MTT2axDL5JmtPT0PET
        lSuIzYbkqmb2Ci6VqWHs3gGf8cTgCA==
X-Google-Smtp-Source: AA0mqf5gFsbvpHjPjanh/RxPMSR825OQhpOstJsXCAKGh+1Y14+PsnSqs++xShSBX+L0widQm6f0eQ==
X-Received: by 2002:a05:6870:ea98:b0:13c:765a:3140 with SMTP id s24-20020a056870ea9800b0013c765a3140mr40614043oap.5.1670465584024;
        Wed, 07 Dec 2022 18:13:04 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o31-20020a056871079f00b00143065d3e99sm13056407oap.5.2022.12.07.18.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 18:13:03 -0800 (PST)
Received: (nullmailer pid 3375302 invoked by uid 1000);
        Thu, 08 Dec 2022 02:13:03 -0000
Date:   Wed, 7 Dec 2022 20:13:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
Cc:     linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2] hwmon: (pmbus/ltc2978) add support for LTC7132
Message-ID: <20221208021303.GA3373033-robh@kernel.org>
References: <0221027133201.GA566451@roeck-us.net>
 <20221027145135.31802-1-Felix.Nieuwenhuizen@etas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027145135.31802-1-Felix.Nieuwenhuizen@etas.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 27, 2022 at 04:51:35PM +0200, Felix Nieuwenhuizen wrote:
> Add support for LTC7132.
> The relevant registers in the LTC7132 are identical to the LTC7880.
> So it's just a matter of adding the chip id.
> 
> Signed-off-by: Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
> ---
>  drivers/hwmon/pmbus/ltc2978.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> index 6d2592731ba3..79f480b4425d 100644
> --- a/drivers/hwmon/pmbus/ltc2978.c
> +++ b/drivers/hwmon/pmbus/ltc2978.c
> @@ -23,7 +23,7 @@ enum chips {
>  	/* Managers */
>  	ltc2972, ltc2974, ltc2975, ltc2977, ltc2978, ltc2979, ltc2980,
>  	/* Controllers */
> -	ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887, ltc3889, ltc7880,
> +	ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887, ltc3889, ltc7132, ltc7880,
>  	/* Modules */
>  	ltm2987, ltm4664, ltm4675, ltm4676, ltm4677, ltm4678, ltm4680, ltm4686,
>  	ltm4700,
> @@ -45,15 +45,14 @@ enum chips {
>  #define LTC2974_MFR_IOUT_PEAK		0xd7
>  #define LTC2974_MFR_IOUT_MIN		0xd8
>  
> -/* LTC3880, LTC3882, LTC3883, LTC3887, LTM4675, and LTM4676 */
> +/* LTC3880, LTC3882, LTC3883, LTC3887, LTM4675, LTM4676, LTC7132 */
>  #define LTC3880_MFR_IOUT_PEAK		0xd7
>  #define LTC3880_MFR_CLEAR_PEAKS		0xe3
>  #define LTC3880_MFR_TEMPERATURE2_PEAK	0xf4
>  
> -/* LTC3883, LTC3884, LTC3886, LTC3889 and LTC7880 only */
> +/* LTC3883, LTC3884, LTC3886, LTC3889, LTC7132, LTC7880 */
>  #define LTC3883_MFR_IIN_PEAK		0xe1
>  
> -
>  /* LTC2975 only */
>  #define LTC2975_MFR_IIN_PEAK		0xc4
>  #define LTC2975_MFR_IIN_MIN		0xc5
> @@ -79,10 +78,11 @@ enum chips {
>  #define LTC3884_ID			0x4C00
>  #define LTC3886_ID			0x4600
>  #define LTC3887_ID			0x4700
> -#define LTM2987_ID_A			0x8010	/* A/B for two die IDs */
> -#define LTM2987_ID_B			0x8020
>  #define LTC3889_ID			0x4900
> +#define LTC7132_ID			0x4CE0
>  #define LTC7880_ID			0x49E0
> +#define LTM2987_ID_A			0x8010	/* A/B for two die IDs */
> +#define LTM2987_ID_B			0x8020
>  #define LTM4664_ID			0x4120
>  #define LTM4675_ID			0x47a0
>  #define LTM4676_ID_REV1			0x4400
> @@ -547,6 +547,7 @@ static const struct i2c_device_id ltc2978_id[] = {
>  	{"ltc3886", ltc3886},
>  	{"ltc3887", ltc3887},
>  	{"ltc3889", ltc3889},
> +	{"ltc7132", ltc7132},
>  	{"ltc7880", ltc7880},
>  	{"ltm2987", ltm2987},
>  	{"ltm4664", ltm4664},
> @@ -651,6 +652,8 @@ static int ltc2978_get_id(struct i2c_client *client)
>  		return ltc3887;
>  	else if (chip_id == LTC3889_ID)
>  		return ltc3889;
> +	else if (chip_id == LTC7132_ID)
> +		return ltc7132;
>  	else if (chip_id == LTC7880_ID)
>  		return ltc7880;
>  	else if (chip_id == LTM2987_ID_A || chip_id == LTM2987_ID_B)
> @@ -831,6 +834,7 @@ static int ltc2978_probe(struct i2c_client *client)
>  	case ltc3884:
>  	case ltc3886:
>  	case ltc3889:
> +	case ltc7132:
>  	case ltc7880:
>  	case ltm4664:
>  	case ltm4678:
> @@ -902,6 +906,7 @@ static const struct of_device_id ltc2978_of_match[] = {
>  	{ .compatible = "lltc,ltc3886" },
>  	{ .compatible = "lltc,ltc3887" },
>  	{ .compatible = "lltc,ltc3889" },
> +	{ .compatible = "lltc,ltc7132" },

This compatible string is not documented. Please add it to the bindings.

Rob
