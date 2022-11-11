Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3A1C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Nov 2022 16:16:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbiKKQQt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Nov 2022 11:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbiKKQQs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Nov 2022 11:16:48 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF26658C
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Nov 2022 08:16:47 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id s20so3234226qkg.5
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Nov 2022 08:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9WbSXE1+IjWD0R6zxIbb9nqA+kAWghGOV6tfVbux0Cw=;
        b=deAp9oLYlxOfNFdNqnbppPdU6mm1usCTYg0GtBN4yM0i/PYLii6e0AVTQO1RoF8Nfu
         uTFdnHw5jRbxVnw+QHXSNS7MnebivOHnfo/RmGDObVtA4b8Fom8ltD5I+CUQykx+2ywl
         tjLUjFPaLi7EGijbQNyVYkGT1d+ldwbn2obLZyABqW+BEy2vqz29GX7HKGjKFj01gEGN
         D6ZAG66YtpPVSOXbQjWTlnv72CYRVjhoD6NDH4lFxHILMHcwemdVR1AiSG4Mk1DtiBjd
         KkmeACclEsznKNI2yKyj722zZsl7fUqvRr1Yxy0caMarObdVcNlfYwvlcrFb6o9GVxZ3
         FO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9WbSXE1+IjWD0R6zxIbb9nqA+kAWghGOV6tfVbux0Cw=;
        b=06lxQa4e4DnSxTm4wwj14y/R11n7dUXPFFvngIPOee7qPdfdEhHKBCCU+mW7rHjucw
         E9Xe3RaRBiltFNKdYraKxVAYTb374S+2ESR+5yoAwiNrBhHgFP1H7Bwa9w32ujO4jhlv
         O9zac6DSO0E4ZejgYuwBS3q+i4HOizPNieABuJjTZAaVjH8suPfUQFJyy35ougrLxQFL
         jooh10K8j+VwKXb1706hi0PYpUo8UzMr0lGBg15Yo9MYC1PcKf6HDnvHHhuFQORvuwdU
         wmIHpgyl7Z06ntjmCeL6i4PgnZ0MBXATXJ/0cDcKu4Q22TcAdWZoAcir1503qOSguDpg
         K3Zg==
X-Gm-Message-State: ANoB5pmIeCMEkSM9ubZSEPwZBdzdEyo9LKvFsbYVr0n/Io2KpsUhbRB+
        /iVVH8e1FZkxVPHFfl0SXhY=
X-Google-Smtp-Source: AA0mqf4yZY/EoSS4fHnnxMjZcl7gR1tyzHKjZLZzE1/9N7m7RgPeFVGK+dc/Phwgv7ZW5ebpA5Tt6A==
X-Received: by 2002:a37:80c1:0:b0:6fa:74c5:7a0d with SMTP id b184-20020a3780c1000000b006fa74c57a0dmr1644265qkd.611.1668183406991;
        Fri, 11 Nov 2022 08:16:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bp16-20020a05620a459000b006cbcdc6efedsm1684628qkb.41.2022.11.11.08.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 08:16:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 11 Nov 2022 08:16:43 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Brandon Maier <brandon.maier@collins.com>
Cc:     linux-hwmon@vger.kernel.org,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Derek Nguyen <derek.nguyen@collins.com>
Subject: Re: [PATCH] hwmon: (ltc2947) fix temperature scaling
Message-ID: <20221111161643.GA86310@roeck-us.net>
References: <20221110192108.20624-1-brandon.maier@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221110192108.20624-1-brandon.maier@collins.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Nov 10, 2022 at 01:21:08PM -0600, Brandon Maier wrote:
> From: Derek Nguyen <derek.nguyen@collins.com>
> 
> The LTC2947 datasheet (Rev. B) calls out in the section "Register
> Description: Non-Accumulated Result Registers" (pg. 30) that "To
> calculate temperature, multiply the TEMP register value by 0.204°C
> and add 5.5°C". Fix to add 5.5C and not 0.55C.
> 
> Signed-off-by: Derek Nguyen <derek.nguyen@collins.com>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Good catch. Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ltc2947-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ltc2947-core.c b/drivers/hwmon/ltc2947-core.c
> index 7404e974762fd..2dbbbac9de093 100644
> --- a/drivers/hwmon/ltc2947-core.c
> +++ b/drivers/hwmon/ltc2947-core.c
> @@ -396,7 +396,7 @@ static int ltc2947_read_temp(struct device *dev, const u32 attr, long *val,
>  		return ret;
>  
>  	/* in milidegrees celcius, temp is given by: */
> -	*val = (__val * 204) + 550;
> +	*val = (__val * 204) + 5500;
>  
>  	return 0;
>  }
