Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06DAC77B60
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Apr 2023 12:51:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjD3Mvg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 Apr 2023 08:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjD3Mvf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Apr 2023 08:51:35 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D8192137
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Apr 2023 05:51:34 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-63b5c830d5eso1117006b3a.2
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Apr 2023 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682859094; x=1685451094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OTzd74f1RlsWQW1G51seG7SwOjNCWR9P1UgNfjM4G0=;
        b=iFxYTdXw17aN65z2ultxIKja4Z7RV4blHIMLo5mvH9CmMe7dVSw4xiuqSmQbR3b3Kw
         lMUWfjupwCkUnwzfEDbIpHotf9FfB0BASca30+FkQwYGRmbwYgFJg9Z4YKLgj8jIjggt
         HduPsiWTcI0R4Lo6ACKe1vILW+DGHIU8ByWCNP29XiLNzJRIGsX/V99xKZmAr0dwG1WR
         lxZtsHoYYszXtH6nIx/iYfLee7BbioAd6zHEwY/LYhUIBWD0bK68ztSIr0Iok7KKl0/o
         DSYsdvmxYObx9uDkc+Fb4RAAsH4U44VkGcZkVVp6NN/Vl4g/xSmhTxTRLMl0WiIedXzX
         enZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682859094; x=1685451094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OTzd74f1RlsWQW1G51seG7SwOjNCWR9P1UgNfjM4G0=;
        b=Un8Wowa7iFLD6PJt+QgnsssicF9Nh5h1C7j45mSRSNjIJU4c+27HUpuzoXgREorzci
         0ivfCAZxcO/XEeRl22Bfc2JO3PnCDF0Klpq63ICQ1Wrzp1gEFeymoEWY9wzYBRmW8W9l
         DKOpP9JVbnF6UDiG2SEnHZyBlXCh1pMPF++C5QSfPx8zy/vkEoAfzSLAD9RGDXP68MoX
         dVJQX7KwqrBltP0ckEOIk1TJ6uPRJ5/5DdopAwgZCakzcBTihLNAxvxXvAceDHHKo3uo
         Nr3tfircrbqzED1jhPgnOVSjGvAE6czL5t+n8g8lblpYQp7q1nLDatDTmkHKM4o75umh
         Oi8g==
X-Gm-Message-State: AC+VfDxXhEggNysOS6cLGTrkAX1h6mNsilTm/q+mpwNiPtKwzJMyOTN7
        tpNas6tZMZWZNoRwLsXMfGE0EZx9nuQ=
X-Google-Smtp-Source: ACHHUZ78wGLYvntCmshdv3v01/hL2N+sp6y0UZ2JxJRtdxJQjaZZuk/Q2Do7F4RNxgL63ztg6gTdKQ==
X-Received: by 2002:a05:6a00:995:b0:641:3bf8:6510 with SMTP id u21-20020a056a00099500b006413bf86510mr9283809pfg.5.1682859093781;
        Sun, 30 Apr 2023 05:51:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n41-20020a056a000d6900b00637b0c719c5sm18190782pfv.201.2023.04.30.05.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 05:51:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 30 Apr 2023 05:51:32 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1] hwmon: (it87) Allow for chips with only 4 temp sensors
Message-ID: <47dde581-cd51-42b9-83c7-429bd5c9416c@roeck-us.net>
References: <20230430045032.1723288-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430045032.1723288-1-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 30, 2023 at 02:50:32PM +1000, Frank Crawford wrote:
> Some chips are known to only have 4 temperature sensors and there is no
> requirement to test for more.  Currently only the IT8622E fits this
> category.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/it87.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 96c17660ff0f..4c3641d28a6a 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -319,6 +319,7 @@ struct it87_devices {
>  #define FEAT_CONF_NOEXIT	BIT(19)	/* Chip should not exit conf mode */
>  #define FEAT_FOUR_FANS		BIT(20)	/* Supports four fans */
>  #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
> +#define FEAT_FOUR_TEMP		BIT(22)
>  
>  static const struct it87_devices it87_devices[] = {
>  	[it87] = {
> @@ -475,7 +476,7 @@ static const struct it87_devices it87_devices[] = {
>  		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
>  		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
>  		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
> -		  | FEAT_AVCC3 | FEAT_VIN3_5V,
> +		  | FEAT_AVCC3 | FEAT_VIN3_5V | FEAT_FOUR_TEMP,
>  		.peci_mask = 0x07,
>  		.smbus_bitmap = BIT(1) | BIT(2),
>  	},
> @@ -527,6 +528,7 @@ static const struct it87_devices it87_devices[] = {
>  						     FEAT_SIX_PWM))
>  #define has_six_pwm(data)	((data)->features & FEAT_SIX_PWM)
>  #define has_pwm_freq2(data)	((data)->features & FEAT_PWM_FREQ2)
> +#define has_four_temp(data)	((data)->features & FEAT_FOUR_TEMP)
>  #define has_six_temp(data)	((data)->features & FEAT_SIX_TEMP)
>  #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
>  #define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
> @@ -3393,7 +3395,9 @@ static int it87_probe(struct platform_device *pdev)
>  	data->need_in7_reroute = sio_data->need_in7_reroute;
>  	data->has_in = 0x3ff & ~sio_data->skip_in;
>  
> -	if (has_six_temp(data)) {
> +	if (has_four_temp(data)) {
> +		data->has_temp |= BIT(3);
> +	} else if (has_six_temp(data)) {
>  		u8 reg = it87_read_value(data, IT87_REG_TEMP456_ENABLE);
>  
>  		/* Check for additional temperature sensors */
