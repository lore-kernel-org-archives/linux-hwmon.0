Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BEBC05027
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Feb 2023 15:22:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjBLPWN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 12 Feb 2023 10:22:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjBLPWM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Feb 2023 10:22:12 -0500
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2791026D
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Feb 2023 07:22:11 -0800 (PST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-16dcb07b805so6039325fac.0
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Feb 2023 07:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vJLXUjfqndEWaC1vgosgMMuEiAVyDHLSBWG8sIDikQs=;
        b=qJ73JVmTSMfoNBB8GM0ApVX8nl66YKufvQp4UMSmVoy3Jb1O7YMB1RUACW7dwE6Bsa
         qs5g7CjCDrh1tHwMV/Nx2xPJUQKnjdqYbIswh6zlvbMjmAdg200/uAzs8uMCv0WO8K+D
         Kf2BUmMToP5525vX56KhJ26CO49WbqbRSsDB8qb2kCMp34xP2lua9BfSMUa6cLzFJEll
         zR8QkTh9CQd4pfv40PY+vd0GoimozL78qliRnbmPVO33MAtvG9PuhVQtnmXjxVty+/IS
         gFpYNQaNF28HtLs5205lYDOUJ5neAR6t1YofiwWDso6Ri9CB/PfscG77LuuXXvEW1fHZ
         x5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJLXUjfqndEWaC1vgosgMMuEiAVyDHLSBWG8sIDikQs=;
        b=koz5TxyB3VQrFtqKdB4FGFyzWL2n3kGXS1JDlDoEc3Hb0S2YZK2Iik6csmb8SJYb+g
         ZsN61j1kAi1zR8b/Mk/iPmn8r5Wwx067ZjtNhQ1GjG36Tgm1yf9kAWUInIkAOossafeV
         k+1gg1qbQ4bAO/esx2++LSg840QHCoWptvXGaUUeyrKVZGuo2jaW3833zhZu1gi18mt3
         4gar4+uREVLkcCiP16nnR3JNWgKwCuj6BOo51GZEa2TiQj06pNsh8Ef2CCGym8gcUjnV
         qZUhOzvqxIiXXrYpi0bXNjbU990xwp0oSh6o3lBH7ksk08R1YRecFIHun0zuX0dUedlG
         sArA==
X-Gm-Message-State: AO0yUKVPhdUXOVJrJn/43v0ZMutQ9Oo5F38Q807F6RNx3++12HwQ9R/r
        p+qUJa/v2Aqot0ilDElNE2ScdTj2OKo=
X-Google-Smtp-Source: AK7set8BTbF/l8GZ3IyeZ1CuL1KPoMx9JzR044WjIcU6c4waR39c3cFog+WJPi9f/7QZP5FbxrcoVg==
X-Received: by 2002:a05:6870:c14f:b0:169:eb19:e766 with SMTP id g15-20020a056870c14f00b00169eb19e766mr13421186oad.3.1676215330417;
        Sun, 12 Feb 2023 07:22:10 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id dv18-20020a056870d89200b0016dbf59175bsm2348952oab.47.2023.02.12.07.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 07:22:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b13231fb-a0e9-b8f6-ebee-40ba9cc40cb4@roeck-us.net>
Date:   Sun, 12 Feb 2023 07:22:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH hwmon 1/1] hwmon: (mlxreg-fan) Return zero speed for
 broken fan
Content-Language: en-US
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20230212145730.24247-1-vadimp@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230212145730.24247-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/12/23 06:57, Vadim Pasternak wrote:
> Currently for broken fan driver returns value calculated based on error
> code (0xFF) in related fan speed register.
> Thus, for such fan user gets fan{n}_fault to 1 and fan{n}_input with
> misleading value.
> 
> Add check for fan fault prior return speed value and return zero if
> fault is detected.
> 
> Fixes: 65afb4c8e7e4 ("hwmon: (mlxreg-fan) Add support for Mellanox FAN driver")
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Thanks,
Guenter

> ---
>   drivers/hwmon/mlxreg-fan.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index b48bd7c961d6..96017cc8da7e 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -155,6 +155,12 @@ mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   			if (err)
>   				return err;
>   
> +			if (MLXREG_FAN_GET_FAULT(regval, tacho->mask)) {
> +				/* FAN is broken - return zero for FAN speed. */
> +				*val = 0;
> +				return 0;
> +			}
> +
>   			*val = MLXREG_FAN_GET_RPM(regval, fan->divider,
>   						  fan->samples);
>   			break;

