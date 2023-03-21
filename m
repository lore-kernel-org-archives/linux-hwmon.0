Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062A1C74A5B
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Mar 2023 15:00:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjCUPAR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Mar 2023 11:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjCUPAO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Mar 2023 11:00:14 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 305D94C6FD
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Mar 2023 08:00:11 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id bf15so7022391iob.7
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Mar 2023 08:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679410810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObehDJNWObITVYeQw+S5YhUJFKySoTe7D10NjYwTTaQ=;
        b=DNmY6N4+h5ABaJE5HWJMyMeZRkjKQhH0quTN1Ou3c6SMt8LagI4ZsOr9nEz6qpJtEm
         h8dMAkQbA0n4c75hs6kvWjz6UfQkbEhTqtak8CH6bFBiZL7c/G8XpMJ7HwL/Ky4n+e2u
         x8gRcmgjwUDdLJeAqGp86q+graYwB/Drn7EYnKyA0zb30foQI4JpF9ramVeiEZ8RuaXT
         wtXxaY14KEtXQa8BpyFO/BHmC6woVHd7+lqs9py4puRSL+Q0UBsXQ2Nso5LfRPs3HW5/
         E2p9ehJipc9o2We4lujdhw46vsKljsmuuD5LgW559obhi+dEWsuO/0Cd8hbg572/xzSP
         qRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679410810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObehDJNWObITVYeQw+S5YhUJFKySoTe7D10NjYwTTaQ=;
        b=UQnDBl/f19c6xZmozvg7X0qomr5+6qlkSVH4WlqLCf3ycfB8getU2dWMf0+imHaAeb
         XhaA+Td+PnGVpheBmhZkhrr7iyW+u32NndFJ5tBdOC7OTz/p9TwHnRsuRwLPLmZoYqbp
         CH1SE0f6AyLIDDeaBetT7ZaFqEmzutlJobmxdd2lhxAGcU5x888M0BaZwIwBhYuQNS83
         BL01Vbz55WlXYbUoifIVxAuXSmnNDg/h4tXNygn+PdFzYFC5ybiOUcMIAFpyvtCjgJsK
         IrXSPBVcb10fjG/1RwGphcT+Fp/9GwP9E3KPvOe+QrXBlrq2c63P0Ilp+ycVp3BJupON
         bcDw==
X-Gm-Message-State: AO0yUKW4n1iuGr0OXjf4SAOIE1RKw0wzjL2h5sjA2grooBS1mejUXbig
        5Czl8jrR7dcUfJxEq/WsStc=
X-Google-Smtp-Source: AK7set962TzcJN973jWKIdS5hCNaXMH68sCxZS8s5jdS9Ee6dpa68KhykbzvdOTqhPA62MGqmzTRuQ==
X-Received: by 2002:a6b:d101:0:b0:752:6338:3d8 with SMTP id l1-20020a6bd101000000b00752633803d8mr1770925iob.6.1679410810559;
        Tue, 21 Mar 2023 08:00:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d8d03000000b0074ca38eb11fsm3735710ioj.8.2023.03.21.08.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 08:00:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 21 Mar 2023 08:00:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon (it87): Add scaling macro for recent ADC
 voltages
Message-ID: <4276ab25-fe29-4313-b925-edc76d61ab42@roeck-us.net>
References: <20230318080543.1226700-1-frank@crawford.emu.id.au>
 <20230318080543.1226700-2-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230318080543.1226700-2-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Mar 18, 2023 at 07:05:42PM +1100, Frank Crawford wrote:
> Generalise scaling to include all recent ADC values.
> 
> This includes correction of an existing error for voltage scaling for
> chips that have 10.9mV ADCs, where scaling was not performed.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied. Note that I changed both subject and description to focus on the
bug fix.

Guenter

> ---
> 
> v2:
>  * Split out the change to the scaling in a separate patch.
> 
> ---
>  drivers/hwmon/it87.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 66f7ceaa7c3f..e9614eb557d4 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -515,6 +515,8 @@ static const struct it87_devices it87_devices[] = {
>  #define has_six_temp(data)	((data)->features & FEAT_SIX_TEMP)
>  #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
>  #define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
> +#define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
> +						     FEAT_10_9MV_ADC))
>  
>  struct it87_sio_data {
>  	int sioaddr;
> @@ -3134,7 +3136,7 @@ static int it87_probe(struct platform_device *pdev)
>  			 "Detected broken BIOS defaults, disabling PWM interface\n");
>  
>  	/* Starting with IT8721F, we handle scaling of internal voltages */
> -	if (has_12mv_adc(data)) {
> +	if (has_scaling(data)) {
>  		if (sio_data->internal & BIT(0))
>  			data->in_scaled |= BIT(3);	/* in3 is AVCC */
>  		if (sio_data->internal & BIT(1))
