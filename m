Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6241AC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 16:47:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351162AbiEQQr2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 12:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351192AbiEQQrU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 12:47:20 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B365A4F451
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 09:47:02 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-f189b07f57so11399457fac.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 09:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WowNLDXZqE/84MU9LLWpLODuwh7PTrPOB3KBaNS+pKk=;
        b=NEXlCLqi5jFZtblZO/BbYL/0qsJFvEkvOnv1wecZKvG9FPmkon1yh7XgcA1Fgfb9lw
         SOJJqpVG2pd6sCG+RsC54YO+//DMe6DPywUMrz1W3/6raU+iQSqhi2Z0eE4fitniXBHj
         n4WFSM7eg4r5E8HVxgOsqlapQByeZ9dAp904xbpeziGGkrN4EbzMMyBEcCYHe18sbZ4l
         PAvhIAAu8lctR6dOur4FrsGd37SdZqEFKHv2Imv5B9iKD8m4tdtLX4CB2BOBYe8tf/b/
         EcugQB9chZA/be2YWf1BlQ+LkBkWlJES59wdPJXAzIIU4rqt10BVItQ1KD38YtXZQ+ZP
         TZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=WowNLDXZqE/84MU9LLWpLODuwh7PTrPOB3KBaNS+pKk=;
        b=JvxMFZwEFR1OxELYtfWcqUYOPelVragcw6P65d/9JipRnc9axCRh9jae12a5jBKpzw
         LzekZUX2daucDncVWYgsNronNvK7tsnDYwfYQLTD3W7ezqEUKNHLxg5iuB+D5U9gqGVj
         THXMChSmD5uOWdth5gCE5pRA9P00/wPUglh7M3tYEs+mFSzJUI8LHiGnPFKnI5AuM3dg
         uD0hXIDf1Rn2dQ+x2N+TQ38+lLdlQPXMArE0GxDGRQElbzd2Kv4UI/p6a7Jrg9rGX3Vf
         Iru/uz72B78pb9OV1FUsDPETV34JnnnPWApXD0eHyH266iBznCTQ9vHQJgVeMu/FhKLJ
         n5LQ==
X-Gm-Message-State: AOAM531Y9uRU8Gc3MUHWGIpGC4nRgiRbB5Q6+3yveHUnysm9Aqr1K+aj
        t5qGbvyUE5lJGs49qIbTrLw=
X-Google-Smtp-Source: ABdhPJyvCE+JC4tF0zP8ZMu81VRboAJn+stFiOBhS/o2hQDyKvSDo6k/ir81SV3msJFX499aFz6/4Q==
X-Received: by 2002:a05:6870:58a9:b0:f1:6256:ed78 with SMTP id be41-20020a05687058a900b000f16256ed78mr11259708oab.265.1652806022060;
        Tue, 17 May 2022 09:47:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i1-20020a4a2b01000000b0035eb4e5a6c3sm22838ooa.25.2022.05.17.09.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 09:47:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 17 May 2022 09:47:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Holger Brunck <holger.brunck@hitachienergy.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v4 2/2] hwmon: (lm90) enable extended range according to
 DTS node
Message-ID: <20220517164700.GA458051@roeck-us.net>
References: <20220517135614.8185-1-holger.brunck@hitachienergy.com>
 <20220517135614.8185-2-holger.brunck@hitachienergy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517135614.8185-2-holger.brunck@hitachienergy.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, May 17, 2022 at 03:56:14PM +0200, Holger Brunck wrote:
> Some lm90 compatible devices can operate in an extended temperature mode.
> This feature is now enabled if the property is set in the corresponding
> device tree node.
> 
> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Applied.

Thanks,
Guenter

> ---
> changes ofr v4: 
>   - add reviewd-by tag
> 
>  drivers/hwmon/lm90.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 1c9493c70813..3820f0e61510 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -1707,6 +1707,7 @@ static void lm90_restore_conf(void *_data)
>  
>  static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
>  {
> +	struct device_node *np = client->dev.of_node;
>  	int config, convrate;
>  
>  	convrate = lm90_read_reg(client, LM90_REG_R_CONVRATE);
> @@ -1727,6 +1728,9 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
>  
>  	/* Check Temperature Range Select */
>  	if (data->flags & LM90_HAVE_EXTENDED_TEMP) {
> +		if (of_property_read_bool(np, "ti,extended-range-enable"))
> +			config |= 0x04;
> +
>  		if (config & 0x04)
>  			data->flags |= LM90_FLAG_ADT7461_EXT;
>  	}
