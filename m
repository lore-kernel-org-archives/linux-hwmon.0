Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217D0C6FD1D
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Mar 2023 15:03:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbjCUPDk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Mar 2023 11:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbjCUPDj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Mar 2023 11:03:39 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831034ECDC;
        Tue, 21 Mar 2023 08:03:33 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id i19so8235085ila.10;
        Tue, 21 Mar 2023 08:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679411013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+b0RBF1TUlJAK1Wc3FXCrDrFPLmJE7FIK6+ckslK1UM=;
        b=E7caAMzMooSNt2pe3XiJhonZVZeasaCYUm7SrzGqr4y74E6AgOhnb7Cz73APKj2skz
         msoYNHa7K1y9M1plB+JkIVHOjbRr0gWho524Aj2+ISPGjZkk2ZdOde8e3S3aDgDoDPby
         B/HiphsARE9+EN0I+JSZ0m7h2W5QFQUUuHqKimJwdcO7d0biGyx8KkkV4mmM/sfBfxg6
         OnUOiN+upZDkgozFnCTcrr7VCfD0yVhPctoo+zBGuztriP+EpwtpIf2j7okKOvrJDt03
         /MHW31VrOH6t2sgG0+PVpdGJauw+RdJfmqakO9Vlr73r+5opxk8/XKlDuFnhXUGS67S5
         hk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679411013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+b0RBF1TUlJAK1Wc3FXCrDrFPLmJE7FIK6+ckslK1UM=;
        b=hmM8jcJCxsomXRAI6PmxUeZLTV7GeVAzWtGVJxB5+RfgzqCMqFtdI+Eh/vQzMMqOE1
         n3ip1zr+PErYdlv0dvHXEOUAKYfBRPctXWqeExrCTmXK9Sa/pQ2Zru8alYe04l9At8sk
         zVqPt6d9k3vrr6KfY5ZQi/m07VExkiJGqMFtosLxOJxiH40TSmqwlyEf/wUIvYcM7wqL
         aJgwxBE0R4exJPxDCH1DrApgkulXlLuIrJUoxR9IO7YftRouNHzvmRFaJQz2bI9i/vOn
         daqsuqzu+IIFeg2T0qsscDkWyp6sN8rv0SMepcbUIOWrKVn2GTcz9Q+GUPRl0UWofECa
         ruIg==
X-Gm-Message-State: AO0yUKWsvFTvB/GECjC8QHeip2Jhn7KqjXxdytK4ywfRpt+41biWUShb
        3bD4ACa6+1D2q0vdGoyMgNWXSyShca0=
X-Google-Smtp-Source: AK7set/3sflUDgwt0qW5/w8Wlv0pjmjn7s6jI5vidCC1rABDDOxIuRbf0McNEYdfq7wNV+6m/ueJoQ==
X-Received: by 2002:a92:d801:0:b0:325:b60b:e2fc with SMTP id y1-20020a92d801000000b00325b60be2fcmr656289ilm.5.1679411012715;
        Tue, 21 Mar 2023 08:03:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c33-20020a023f61000000b003e80d0843e4sm4033746jaf.78.2023.03.21.08.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 08:03:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 21 Mar 2023 08:03:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Lorenz Brun <lorenz@brun.one>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: pwm-fan: set usage_power on PWM state
Message-ID: <571a612a-9779-41da-b857-2880c8298d0c@roeck-us.net>
References: <20230309011009.2109696-1-lorenz@brun.one>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309011009.2109696-1-lorenz@brun.one>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Mar 09, 2023 at 02:10:08AM +0100, Lorenz Brun wrote:
> PWM fans are controlled solely by the duty cycle of the PWM signal, they
> do not care about the exact timing. Thus set usage_power to true to
> allow less flexible hardware to work as a PWM source for fan control.
> 
> Signed-off-by: Lorenz Brun <lorenz@brun.one>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pwm-fan.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 83a347ca35da..aa746c2bde39 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -507,6 +507,14 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  
>  	pwm_init_state(ctx->pwm, &ctx->pwm_state);
>  
> +	/*
> +	 * PWM fans are controlled solely by the duty cycle of the PWM signal,
> +	 * they do not care about the exact timing. Thus set usage_power to true
> +	 * to allow less flexible hardware to work as a PWM source for fan
> +	 * control.
> +	 */
> +	ctx->pwm_state.usage_power = true;
> +
>  	/*
>  	 * set_pwm assumes that MAX_PWM * (period - 1) fits into an unsigned
>  	 * long. Check this here to prevent the fan running at a too low
