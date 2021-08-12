Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC27C4338F
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Aug 2021 04:38:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57D8960F21
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Aug 2021 04:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233659AbhHLEjJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Aug 2021 00:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhHLEjI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Aug 2021 00:39:08 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D4FBC061765
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Aug 2021 21:38:44 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id n123so5088933qkn.12
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Aug 2021 21:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BRzgfA1hIuL2r3Df76Yk1rNjh11gvSAdXCHfYEkZkYY=;
        b=N2kafuaVThTRPhZGqVbzXd1u4uv2cVNoP27YEnaAcRFADEKQtyqRB+rxr2OAP4miA5
         WxrVqW/3evz2VnAbjoPts1qgCr/vmxPJ5FW2CUY22DelgtUQrIJ0UZkD/u7Om8WnOLHN
         xV6lbWQI4xmJgBtQcOfdmVcGBndAV2AozZcNns/E6BUURxMVB3c+nAizB3P/oJZNcALE
         W9rvumUZgwZRvxshRyR1yEkOOYn9QFRSLTyL+pVRzedhefRnpcWoOuvp8EdPIxy/iKY/
         cfN4VjbfXOqcgZvc3yQab/joVL5j2ur7zG273zkMlYVeO37N3QGWjQ4NayNh1he5OJC6
         pdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=BRzgfA1hIuL2r3Df76Yk1rNjh11gvSAdXCHfYEkZkYY=;
        b=TufOTM7dXUtkW5ZsDCoJO0daEVgbPGJvAEZ2CSLnysb6xZ/1qjgy1Jr8yGMe0js4wy
         Y99qOxznxo3eSN91pPg2Zto2DwXpKzMays/cc2kI0CPAqXnLY+xTOdrgsR0Q80WSHmKc
         c/cNL6whCZEhHgSZzNbJCsgg7zIE+7QCC8+rm7SNOPHqd/fcebbdBk7MAHKJC4LfcAFe
         3n0Bm+0OPF74HlmSlKyRSkYwFcbMjZe0/Ed3XSICUUgfesJHHhzVqJ4EfGfpHHTv/1Kn
         UR0kqLvSU85ewzuFUE/7vTytzgnkajZwxtONoZFx8voLEnxJIE3iwLO6AUpI5rfPiIF/
         QkIw==
X-Gm-Message-State: AOAM532ekLLo9WNm9Z0SIQ6K0TQxPcYc07F7hHESXI0P6ZSes2fDcWXM
        bZ/ROy3GH7orGLvsOvMXHlg=
X-Google-Smtp-Source: ABdhPJw+p5r6pmNB1nzUygZmJmmFqeoEvpqwKjqDnoI+Ebw7q2Pgh+Te0RhH5fNPuzo86rIkePOmLQ==
X-Received: by 2002:a37:6615:: with SMTP id a21mr2671793qkc.364.1628743123509;
        Wed, 11 Aug 2021 21:38:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c1sm638292qtj.36.2021.08.11.21.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 21:38:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 11 Aug 2021 21:38:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 2/3] hwmon: axi-fan-control: handle irqs in natural order
Message-ID: <20210812043841.GA1115561@roeck-us.net>
References: <20210811114853.159298-1-nuno.sa@analog.com>
 <20210811114853.159298-3-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210811114853.159298-3-nuno.sa@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Aug 11, 2021 at 01:48:52PM +0200, Nuno Sá wrote:
> The core will now start out of reset at boot as soon as clocking is
> available. Hence, by the time we unmask the interrupts we already might
> have some of them set. Thus, it's important to handle them in the
> natural order the core generates them. Otherwise, we could process
> 'ADI_IRQ_SRC_PWM_CHANGED' before 'ADI_IRQ_SRC_TEMP_INCREASE' and
> erroneously set 'update_tacho_params' to true.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/axi-fan-control.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
> index 901d1588234d..c898ad121dc7 100644
> --- a/drivers/hwmon/axi-fan-control.c
> +++ b/drivers/hwmon/axi-fan-control.c
> @@ -283,18 +283,9 @@ static irqreturn_t axi_fan_control_irq_handler(int irq, void *data)
>  	u32 irq_pending = axi_ioread(ADI_REG_IRQ_PENDING, ctl);
>  	u32 clear_mask;
>  
> -	if (irq_pending & ADI_IRQ_SRC_NEW_MEASUR) {
> -		if (ctl->update_tacho_params) {
> -			u32 new_tach = axi_ioread(ADI_REG_TACH_MEASUR, ctl);
> -
> -			/* get 25% tolerance */
> -			u32 tach_tol = DIV_ROUND_CLOSEST(new_tach * 25, 100);
> -			/* set new tacho parameters */
> -			axi_iowrite(new_tach, ADI_REG_TACH_PERIOD, ctl);
> -			axi_iowrite(tach_tol, ADI_REG_TACH_TOLERANCE, ctl);
> -			ctl->update_tacho_params = false;
> -		}
> -	}
> +	if (irq_pending & ADI_IRQ_SRC_TEMP_INCREASE)
> +		/* hardware requested a new pwm */
> +		ctl->hw_pwm_req = true;
>  
>  	if (irq_pending & ADI_IRQ_SRC_PWM_CHANGED) {
>  		/*
> @@ -310,9 +301,18 @@ static irqreturn_t axi_fan_control_irq_handler(int irq, void *data)
>  		}
>  	}
>  
> -	if (irq_pending & ADI_IRQ_SRC_TEMP_INCREASE)
> -		/* hardware requested a new pwm */
> -		ctl->hw_pwm_req = true;
> +	if (irq_pending & ADI_IRQ_SRC_NEW_MEASUR) {
> +		if (ctl->update_tacho_params) {
> +			u32 new_tach = axi_ioread(ADI_REG_TACH_MEASUR, ctl);
> +			/* get 25% tolerance */
> +			u32 tach_tol = DIV_ROUND_CLOSEST(new_tach * 25, 100);
> +
> +			/* set new tacho parameters */
> +			axi_iowrite(new_tach, ADI_REG_TACH_PERIOD, ctl);
> +			axi_iowrite(tach_tol, ADI_REG_TACH_TOLERANCE, ctl);
> +			ctl->update_tacho_params = false;
> +		}
> +	}
>  
>  	if (irq_pending & ADI_IRQ_SRC_TACH_ERR)
>  		ctl->fan_fault = 1;
