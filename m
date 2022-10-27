Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DC6ECAAA1
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Oct 2022 13:32:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236140AbiJ0NcI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Oct 2022 09:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236138AbiJ0NcF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Oct 2022 09:32:05 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AAEC18024D
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Oct 2022 06:32:04 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso918471otb.6
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Oct 2022 06:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JytoD7QmPaEyFjNrEFgLJTIixBMHxRWNjaMlTk772o=;
        b=UFEMsANyVz4hlG4iQL8bSabWu1aCI796M8J6rTLucAUIiwchaVUZZBCFlFogUE3PC6
         0oU6B6cuPGIDRRQkhkecB+D9G3otAlGec1YYpVPjfxW/rflNl91C/489ZclLW8bd4ywR
         Q5FQNoO18ZDm5zvah4xgY1zybATQsMAVUnwQPifStfcy/3tNc7eaRlgMJgPJQaGnMYvE
         1q+0RDqBsXcgVedd9NQIHT34cv7Wbn7KnmZ0V+UQzSfWXr6jG0ZV+NnsvGFRaG2d7w4l
         iazDlEnhoNr0eeGmupHSLf+D3iRd9kTSgC28gzbmyALR1HjITfL5flaX606dnFdnckHM
         SMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JytoD7QmPaEyFjNrEFgLJTIixBMHxRWNjaMlTk772o=;
        b=zWLUCfK+HyC3Sc8ILYSbYDCIeq3WYsQf+eQOuWwc6BujCu+m47rgT0YLSgWZeWcf2d
         ti1zoj6iVzEG3S5NQEeqYwXaAH0CeWx3KayxURmow9to1ZyOeiX/M6JMQxUGjzGqgBW/
         C5d4xTJIRIUkVaU6rWMMuH3M1MNZyuqPew1t8e+z5ap1WIo0dxcn7MEWUILXvQsGcyJP
         BczIwMsJRbDMwU94APqS46QC0Egg/v3Csi3GlxJGIXxCRXcFzQsQl08xVfXXESKXSzM8
         hZQ1Zd4oyNdfX77sr8ke4sArMYd2yHIRJLzRFLrrwyebeQ3TsP5dxaqFewJS35ajLfF7
         I8Gg==
X-Gm-Message-State: ACrzQf2zLwkV4+coGlMdP17nHNJPyAc3nWdSEn3yfiRgGnfVFGhGugo1
        sWUzlxpPJeizyqfu7Cm6TCmsGtoIKfo=
X-Google-Smtp-Source: AMsMyM49KcqHcXCA+91rbSKY7WzQkUGuYGoe53s3aUK3xGyVh1+m2ILqeIpieZ/VPViGIkvDWPXpFw==
X-Received: by 2002:a9d:3642:0:b0:655:f25f:be55 with SMTP id w60-20020a9d3642000000b00655f25fbe55mr4522216otb.13.1666877523675;
        Thu, 27 Oct 2022 06:32:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id be25-20020a056870589900b0011bde9f5745sm536375oab.23.2022.10.27.06.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 06:32:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 27 Oct 2022 06:32:01 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (pmbus/ltc2978) add support for LTC7132
Message-ID: <20221027133201.GA566451@roeck-us.net>
References: <20221027090026.9370-1-Felix.Nieuwenhuizen@etas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027090026.9370-1-Felix.Nieuwenhuizen@etas.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 27, 2022 at 11:00:26AM +0200, Felix Nieuwenhuizen wrote:
> Add support for LTC7132.
> The relevant registers in the LTC7132 are identical to the LTC3883.

Should that be LTC7880 ? LTC3883 is unpaged, second page registers are
slightly different, and the LTC_NOT_PENDING bit in the MFR_COMMON
register is not supported on LTC3883.

> So it's just a matter of adding the chip id.
> 
> Signed-off-by: Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
> ---
>  drivers/hwmon/pmbus/ltc2978.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> index 6d2592731ba3..a3ce95861a53 100644
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
> @@ -903,6 +907,7 @@ static const struct of_device_id ltc2978_of_match[] = {
>  	{ .compatible = "lltc,ltc3887" },
>  	{ .compatible = "lltc,ltc3889" },
>  	{ .compatible = "lltc,ltc7880" },
> +	{ .compatible = "lltc,ltc7132" },

Please stick with alphabetic order.

Thanks,
Guenter

>  	{ .compatible = "lltc,ltm2987" },
>  	{ .compatible = "lltc,ltm4664" },
>  	{ .compatible = "lltc,ltm4675" },
