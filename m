Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35EBC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 14:16:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C87F461042
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 14:16:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhJHOR4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Oct 2021 10:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbhJHORz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Oct 2021 10:17:55 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B13C061570
        for <linux-hwmon@vger.kernel.org>; Fri,  8 Oct 2021 07:16:00 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id 24so14056077oix.0
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Oct 2021 07:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mEuR+QxNv8F64gWk90Q8unGJl1h7wepFAxqyU+OVJ6o=;
        b=pxv0PqdyiR7mjb8Dmm4vxb28xRPkcxodcp6bf5qR2BgBFjP98Mgj4O00tqUk+CCTkN
         eldW1PTkYS4zW0SA8UXjuafjw/SJY+Ws9r7vz1wM1QEFuA4MOjqKeKP5CGzJDlFrqhpj
         omVLCHE05aH8JTgRSVM+oMn09amb36KPuz/dqKcKXyfDbhQcwOygRd5/tWp8/FELefek
         ZUlobGrgODNDgDDzJZjYgyj5uY5VSnyY1ZetZ+QHBlYSgBDSWPuyaaxl0DO5yT+RzFbE
         nGDqkXG6hjRpVHxyp28dsaQwk7YxaDMQO0VPVPr3H3fp41lGA2Fg3yFt2C/Bdd2hw6HC
         Vdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=mEuR+QxNv8F64gWk90Q8unGJl1h7wepFAxqyU+OVJ6o=;
        b=Qlm/hhoO+S9zBOIls3lI3Sa1r7AXAzZJN6WPLKq4ajgpbodxLebdxQQezSM8+81P+Q
         oKrNHSaZB//E5SNId6Kc31P4oz0g1AREnlY/ntuXLkkCCJv0wtIIorBF00Zgs8YP0WC+
         UJdFHp3tMm2Cfwp5Y5EnpRd2I0CVUMnPhWzD2Opo++AfSHIcqimE6DDXKXrCu7bcAerN
         9s4hr76UVeQGf03ekluOvfyq/tn/Pf1ykm1Wh/yGJepKVthzePclQaoErSyd3zE2aWTY
         gsuOpg8JhM1rbXNWScxE0x8sQTbzP00UQ/8Z3VWurjmZB27iKqo6pCQUclwyS2m4K7C6
         kbKQ==
X-Gm-Message-State: AOAM533hrLkS9tofSTn9E9vBLOqKrD9lM/1PbuwfnhOaK6QVy+QA6z7D
        uiRtZeIspbY8BJuTQJPjjdgyjdl+COw=
X-Google-Smtp-Source: ABdhPJzW7WfeuXby8qrgwk+X5rO3pKUA/AUQUHAOiRLwNIyDo02JWDEtyqbFOIDL/xwxSPK/1xtMAQ==
X-Received: by 2002:aca:ea83:: with SMTP id i125mr16217848oih.26.1633702559793;
        Fri, 08 Oct 2021 07:15:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 21sm641596oix.1.2021.10.08.07.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 07:15:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 8 Oct 2021 07:15:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon-next 1/2] hwmon: (mlxreg-fan) Modify PWM
 connectivity validation
Message-ID: <20211008141558.GA2156970@roeck-us.net>
References: <20210926053541.1806937-1-vadimp@nvidia.com>
 <20210926053541.1806937-2-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926053541.1806937-2-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Sep 26, 2021 at 08:35:40AM +0300, Vadim Pasternak wrote:
> Validate PWM connectivity only for additional PWM - "pwm1" is connected
> on all systems, while "pwm2" - "pwm4" are optional. Validate
> connectivity only for optional attributes by reading of related "pwm{n}"
> registers - in case "pwm{n}" is not connected, register value is
> supposed to be 0xff.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/mlxreg-fan.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index feab9ec6a6ca..8e5cd6991929 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -488,9 +488,14 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>  				return -EINVAL;
>  			}
>  
> -			err = mlxreg_pwm_connect_verify(fan, data);
> -			if (err)
> -				return err;
> +			/* Validate if more then one PWM is connected. */
> +			if (pwm_num) {
> +				err = mlxreg_pwm_connect_verify(fan, data);
> +				if (err < 0)
> +					return err;
> +				else if (!err)
> +					continue;
> +			}
>  
>  			fan->pwm[pwm_num].reg = data->reg;
>  			fan->pwm[pwm_num].connected = true;
