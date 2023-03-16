Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF68BC6FD1D
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Mar 2023 02:15:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjCPCPV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Mar 2023 22:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjCPCPT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Mar 2023 22:15:19 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5413725E3E
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Mar 2023 19:15:17 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id t129so165245iof.12
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Mar 2023 19:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678932916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHoxSYT1L1AyYBNhzdoLONSzC/KsOCLb5T1sT9oDavY=;
        b=A9lOl760Mf1rK8gic6eyusNGVbnCc20Asr5QCF0/r3qXW+xasBKmvXLaU7D7VCHGTs
         Uf6PI2YPhEcH6EAo2R+fZwKKZP9M/Hg1s2hSH6NZWO1JC54lPbYGAbFsxeXe2AXlZEKO
         lK/kw6a3pPV2LQYCNE6tkDFDXPxeew8C9gRJBNzzQjdy0OFxbrew6QNQnVINgO4f3Zpw
         nnwDlw4Q4l5iOohKQFd8JN+vKwxkiWcDfpWYEHL3Zo7d9OtvoYJbZwvsjHEN8bzBiKE4
         HI3sYmC2gG8hqXBLky8Llo4icy+fge+VI3L70t+6+foNxVt0655ujX64/DquT2iAIo5p
         2H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678932916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHoxSYT1L1AyYBNhzdoLONSzC/KsOCLb5T1sT9oDavY=;
        b=dYsDjiOfG2RJO15jIpYz8wEaoeFd9HBmebF+nxEtm9sFl6mRqSAJXgdT9LZU6oANGD
         4lgvaKpSQW6LPUq4ePLLznFErMZNaA7GOB9gFzH42qAcQ3wAYqJSlSulnwqUVLf8G2ls
         WEGAuJv5qRgaPcDImbWv7ou+OzUV2LrwrRHOTbkS9y3XLQkuYFsgUeqUoQcGAJmbGs92
         VGZHcWVWYRA+ZQ6u61fNsyqRpQ5Epb5vVoWl498eWRFp4ByFLlFmk4/Ofo+BxkU1+GXz
         0J1xC6mlDwgGOJ0AlOFuZHR7wp8u1Y+os5GYbsUiW+9yR5rRhNYb57yLwTSMLGTSonKZ
         QHag==
X-Gm-Message-State: AO0yUKUEXxvNNJPlqVCYp+cVbylaARbXvilF3bdDutZJvIPzFIopw1/C
        l1wMKw5wX90eCuCNRe1kffw=
X-Google-Smtp-Source: AK7set+4ZtcAr94zTMEEkRxNBG/eeXiT1OfDmW5V+RFCxXLqFF2Yg568QIRFsyj0s6YXUPpvlN6lDQ==
X-Received: by 2002:a6b:6a06:0:b0:74c:e43e:48f7 with SMTP id x6-20020a6b6a06000000b0074ce43e48f7mr24780160iog.13.1678932916588;
        Wed, 15 Mar 2023 19:15:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g16-20020a02b710000000b004038a45ad89sm2157554jam.85.2023.03.15.19.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 19:15:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 15 Mar 2023 19:15:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Alexandru Tachici <alexandru.tachici@analog.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (ltc2992) Set `can_sleep` flag for GPIO chip
Message-ID: <ad54092b-3e91-4058-a7fa-94d19732e113@roeck-us.net>
References: <20230314093146.2443845-1-lars@metafoo.de>
 <20230314093146.2443845-2-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314093146.2443845-2-lars@metafoo.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Mar 14, 2023 at 02:31:46AM -0700, Lars-Peter Clausen wrote:
> The ltc2992 drivers uses a mutex and I2C bus access in its GPIO chip `set`
> and `get` implementation. This means these functions can sleep and the GPIO
> chip should set the `can_sleep` property to true.
> 
> This will ensure that a warning is printed when trying to set or get the
> GPIO value from a context that potentially can't sleep.
> 
> Fixes: 9ca26df1ba25 ("hwmon: (ltc2992) Add support for GPIOs.")
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ltc2992.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/ltc2992.c b/drivers/hwmon/ltc2992.c
> index 88514152d930..69341de397cb 100644
> --- a/drivers/hwmon/ltc2992.c
> +++ b/drivers/hwmon/ltc2992.c
> @@ -323,6 +323,7 @@ static int ltc2992_config_gpio(struct ltc2992_state *st)
>  	st->gc.label = name;
>  	st->gc.parent = &st->client->dev;
>  	st->gc.owner = THIS_MODULE;
> +	st->gc.can_sleep = true;
>  	st->gc.base = -1;
>  	st->gc.names = st->gpio_names;
>  	st->gc.ngpio = ARRAY_SIZE(st->gpio_names);
