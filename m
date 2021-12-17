Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11050C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Dec 2021 15:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234811AbhLQPmt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Dec 2021 10:42:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233615AbhLQPmt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Dec 2021 10:42:49 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4E7C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Dec 2021 07:42:49 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id w64so4127070oif.10
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Dec 2021 07:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iVLnzt65hNfyC/2Mk7rtAC4VBUHvhufxkSlK8d66kUo=;
        b=HGdrRrq/kRJGNPlKNRS0ERNSONj9KkuZyj7IwrCTeOpb472ccv1H1wiI4UwMIKi1mF
         qQ6F8WXbOhvV6aLuEcONu1Q+FicDU0mrRmR8zDmeNkaiXlnVvKxNF3vU8aW9O/N9GVJd
         c309qffmXYy8JAN8fWWSYt611k5L4R8J/GCSqcQlSYQMwsGtbarg9whp9fNjsWqxA56S
         ME/HF6VwErfbTtqIoRgv9TXaAPH91Y+EriYtKn9DK1fybPqV+WsNhMdykTsfMGs5qirb
         wdR1ZTc7/1d40pQDPLZwnHirvRyApTTwWQhyjXBCvffwJg1G2dpmaIWleSDUHwfBSeCp
         EjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=iVLnzt65hNfyC/2Mk7rtAC4VBUHvhufxkSlK8d66kUo=;
        b=5FcE9731sEq6hxzOCj6FjKVh8Srdlzs9LmB0GRq/zoLcElCblUBq4CFDp3ejLQ88YD
         cmhIIdisf1CugOxn1frpNmqUuQTnpsYXbV4gBUvYthqZ3q6GLWW7+qcN1AlbTfjNJHl1
         gtgyTAH8TyJ8+yrN6KpQt7NEWdFpPr4gnf5oqRZ0GTydkhVZqL6ilIGjJZTyLfBzhWqX
         g5u/yvh4OffCzWj8N16LEyqntN66mHjyC+tmxNxPiIvSgPHqY2dnQiMpkQGe2+gB57ac
         dAye2jkaNTv4RmvURJCySJ9cXU/BRYIzdm+zwQUKCepoOrWKG2v+x7SjW/59/SIKUeyX
         2sPQ==
X-Gm-Message-State: AOAM533Mp+cOyaIm+2MeqBONlnWVzoXyvMVEhdwnHr8sg3dlNQ9Z+lYv
        DFP+RWR3U+DPH9A2+FvUJrKBzK6sZqM=
X-Google-Smtp-Source: ABdhPJyOQtsihgfI6em+F53WqN4wlpqnjN+32QzprqiruoNpqDJfwbCinEPkjkuDg6+Ekc3k6vYVWQ==
X-Received: by 2002:aca:1c02:: with SMTP id c2mr2564050oic.53.1639755768624;
        Fri, 17 Dec 2021 07:42:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m23sm1651122otj.39.2021.12.17.07.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 07:42:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 17 Dec 2021 07:42:46 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: Re: [PATCH] hwmon: (ntc_thermistor): Drop OF dependency
Message-ID: <20211217154246.GA2812844@roeck-us.net>
References: <20211215142933.1409324-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215142933.1409324-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 15, 2021 at 03:29:33PM +0100, Linus Walleij wrote:
> The driver has been augmented to just use device properties
> so the OF dependency can be dropped.
> 
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Chris Lesiak <chris.lesiak@licor.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e491e8f354bb..f4938f123815 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1415,7 +1415,6 @@ config SENSORS_PC87427
>  
>  config SENSORS_NTC_THERMISTOR
>  	tristate "NTC thermistor support"
> -	depends on OF
>  	depends on IIO
>  	depends on THERMAL || !THERMAL_OF
>  	help
