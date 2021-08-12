Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E42C4338F
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Aug 2021 04:37:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9F0260F21
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Aug 2021 04:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233944AbhHLEiD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Aug 2021 00:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233659AbhHLEiD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Aug 2021 00:38:03 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F39C061765
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Aug 2021 21:37:38 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id m12so2464612qvt.1
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Aug 2021 21:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bfEEufsIAwc24ABU2C9IMwZ9tCZKq2i2TMr+wUz54JU=;
        b=KLaZeuF2pbwi/SuGpl/LgMhmO3sPvjS+f1JFVzoyIbhoKd6IqsE2IjFZ3PqzRc6ALb
         Jhd2Oob8ntCKgh0i3BoQP/FG8/8PncWKeyw3Qu+7eUkeeN3E0GVcMGKpQissMJ1xSJgj
         /Xt9zBRfVG/zRKNFx5EHcNsf/y4Y770bk6Imj7DVTyLRu0Um1FBwY9zldM9uJMgNEnw3
         MDxMNIM45Z/sEdNWxPz1awRDDTHZk+Q1Qc2KoSRdHcOWb+JH55+skXB8eBAJgY/myTNX
         oocIDKVCtbIB402HOWmCffhINdHA42wRIGKAWMis0oOkfVYWHyLXLlMhgfJwMTEB356I
         vB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=bfEEufsIAwc24ABU2C9IMwZ9tCZKq2i2TMr+wUz54JU=;
        b=efQiXg31dMy6P+BUBB+agtgcRdif0viBIIoo8qDdRFt0N/pEycfVNTqvv6JhMcMEw8
         gIZtVAucOdem1pXfjAvmNV1vo2n9Kn8vKe4D77JWMOJ3fYmyYFy8gRl6NGmhUEIG1WJS
         v+8ugtMGrfbBvZzR8xuL4yoMrFFVHdK2FdUZUqyi5v8xIoEAGPJ3eZyrodzQb1+KR/yN
         PtqhoIeLVft+St4O5Onr/YsNFNop50AFTYwuKSh2bDFxhM7bMU2NX3bQeu4PY5ywqPwA
         Blg7KqCj81PWykoj2ZGmiiTtQcirYsCIUKeVdGVm8FoYOSECQaKJGD+jN5ZGWKDsOrML
         G3GA==
X-Gm-Message-State: AOAM530gDGNOKlwm60YJfrmTqkqCIOn1CiPayLJKPqywukdxks9a4YSA
        lvlmtlaQCadg9C52P91SQDY=
X-Google-Smtp-Source: ABdhPJzk14MkYofD76j9NQfnd6jjBZ7Gd8vhw0WotFW62lLJfLFBg3A+HEF3rSvW7IFLPyHjRQx6BQ==
X-Received: by 2002:a05:6214:20e4:: with SMTP id 4mr2204681qvk.18.1628743058096;
        Wed, 11 Aug 2021 21:37:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g20sm698153qki.73.2021.08.11.21.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 21:37:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 11 Aug 2021 21:37:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 1/3] hwmon: axi-fan-control: make sure the clock is
 enabled
Message-ID: <20210812043736.GA1115377@roeck-us.net>
References: <20210811114853.159298-1-nuno.sa@analog.com>
 <20210811114853.159298-2-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210811114853.159298-2-nuno.sa@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Aug 11, 2021 at 01:48:51PM +0200, Nuno Sá wrote:
> The core will only work if it's clock is enabled. This patch is a
> minor enhancement to make sure that's the case.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/axi-fan-control.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
> index e3f6b03e6764..901d1588234d 100644
> --- a/drivers/hwmon/axi-fan-control.c
> +++ b/drivers/hwmon/axi-fan-control.c
> @@ -351,6 +351,11 @@ static int axi_fan_control_init(struct axi_fan_control_data *ctl,
>  	return ret;
>  }
>  
> +static void axi_fan_control_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>  static const struct hwmon_channel_info *axi_fan_control_info[] = {
>  	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT),
>  	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_LABEL),
> @@ -406,6 +411,14 @@ static int axi_fan_control_probe(struct platform_device *pdev)
>  		return PTR_ERR(clk);
>  	}
>  
> +	ret = clk_prepare_enable(clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(&pdev->dev, axi_fan_control_clk_disable, clk);
> +	if (ret)
> +		return ret;
> +
>  	ctl->clk_rate = clk_get_rate(clk);
>  	if (!ctl->clk_rate)
>  		return -EINVAL;
