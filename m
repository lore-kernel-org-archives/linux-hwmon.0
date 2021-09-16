Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0DDC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 20:18:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02C2A61207
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 20:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhIPUUK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 16:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhIPUUJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 16:20:09 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ECF2C061574
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 13:18:49 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id i3-20020a056830210300b0051af5666070so9912261otc.4
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 13:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nPb3tduGlGs5y68kSwmI/GsGY0TTlRdc8+R2pgaPCSo=;
        b=OMKcme8FnKPKvjGlhATcNenkN7parQiKbr347n0iFJHT5iG5WyM8Ab75Ez7Tyr7mv7
         kPZGmmdC6U63q0wmZvE2YjGY/NW4RPZEq9ZSJieqgWuonDOMIheAw249T/m6/9S8OhSv
         nNlk6yViA7kSBFqO+JdEaj7aF8qAkNtsujq/ls1GmW/JlcuYCrPVcV8TzoLKawqxBUsL
         iQV7Lb3bGUSVN9IM0ljOvXtPeWZvsEJYJ5zFYYmfuFjbuicOUBw+5476X0+gYjhwrHux
         wlxu5LW/T39Rugv0Fb0QtFxCF/0PwvKx2ySPjDrVrILlQBYWBUrDqSZ/C5y1hic8VeFN
         CaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=nPb3tduGlGs5y68kSwmI/GsGY0TTlRdc8+R2pgaPCSo=;
        b=Ac30TgDsw4nfb6MsCuCQqA96+HZN20ZhNoq0StxukbHTih7al1hO5Bk1Fzi54TfOgm
         bXjmBzp8o+kkswrcW6OXw4QPx4bJOUBS2I268nEgyJDXEDwwLR8O8gmyaF3MSB8soLTE
         YOGR5uBvU07hVY8/Esl5tHscwMRb7zT8H8QUwy6HUsufzbRfB1HlmlVW44KdSlD+DWRD
         AUlbkDKhRSW5F1rT09fzBvmTRJScx8uPY7X4QB8knZy78QHVWmLNIqhrwzm3N9x+cvbM
         Xavt9Nj1na0ydbsSMlcsF6r5eCmLzRfHzYiMO5vJynGPdPWtb9OjqNBvRCCKMucllmA5
         lzuA==
X-Gm-Message-State: AOAM532NOh7zBSbriGUAT8FcTtYxUy5jeS9xP6502IWhattgbjTr0BtH
        qwWE8YFpfROT+erF9crQEgiYGzCjdwg=
X-Google-Smtp-Source: ABdhPJwk182pgOCTcrYEGly9VV777M8kyl9kcFO7W6+9VwV1wN8IPEXf3ldj4bivURgtpZmr+TlTaQ==
X-Received: by 2002:a9d:718a:: with SMTP id o10mr6202596otj.376.1631823528515;
        Thu, 16 Sep 2021 13:18:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r20sm931296oot.16.2021.09.16.13.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 13:18:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 16 Sep 2021 13:18:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon-next v2 1/3] hwmon: (mlxreg-fan) Extend the maximum
 number of tachometers
Message-ID: <20210916201846.GB1966690@roeck-us.net>
References: <20210916194719.871413-1-vadimp@nvidia.com>
 <20210916194719.871413-2-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916194719.871413-2-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 16, 2021 at 10:47:17PM +0300, Vadim Pasternak wrote:
> Extend support of maximum tachometers from 12 to 14 in order to support
> new systems, equipped with more fans.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied, no need to resend.

> ---
>  drivers/hwmon/mlxreg-fan.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index 89fe7b9fe26b..0f5b109817a7 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -12,7 +12,7 @@
>  #include <linux/regmap.h>
>  #include <linux/thermal.h>
>  
> -#define MLXREG_FAN_MAX_TACHO		12
> +#define MLXREG_FAN_MAX_TACHO		14
>  #define MLXREG_FAN_MAX_STATE		10
>  #define MLXREG_FAN_MIN_DUTY		51	/* 20% */
>  #define MLXREG_FAN_MAX_DUTY		255	/* 100% */
> @@ -266,6 +266,8 @@ static const struct hwmon_channel_info *mlxreg_fan_hwmon_info[] = {
>  			   HWMON_F_INPUT | HWMON_F_FAULT,
>  			   HWMON_F_INPUT | HWMON_F_FAULT,
>  			   HWMON_F_INPUT | HWMON_F_FAULT,
> +			   HWMON_F_INPUT | HWMON_F_FAULT,
> +			   HWMON_F_INPUT | HWMON_F_FAULT,
>  			   HWMON_F_INPUT | HWMON_F_FAULT),
>  	HWMON_CHANNEL_INFO(pwm,
>  			   HWMON_PWM_INPUT),
> -- 
> 2.20.1
> 
