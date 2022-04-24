Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9920C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Apr 2022 05:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbiDXFQr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 24 Apr 2022 01:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiDXFQp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 24 Apr 2022 01:16:45 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A715625FC
        for <linux-hwmon@vger.kernel.org>; Sat, 23 Apr 2022 22:13:45 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id v65so8945230oig.10
        for <linux-hwmon@vger.kernel.org>; Sat, 23 Apr 2022 22:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=+zI2qfPfsTQw9A2O0lT8lxIfKgwTmvZXVz3dFSP1fho=;
        b=kVBes2/6/9l/IBryjlauI0Tb9GTWvFXtsP2jXRiyzlbn3ZPx+y3eIM2Jk6zZfGfgA9
         34D/FBlCeFEKGcK3u51K06skbzmj1VhCXpncGXFjWagss8oKW0vpA5R4S0h4tAHWKBAG
         knYU9FQhRi9RwWbm6Da/ZcL37IEUKhmoHtxVFW37Z1c3B5uijY173XokTvIPqmZNqBGc
         ksiRXljV3GQyifetk1bFDNC0/Wyfr6lPTyTlbSfU6L6FmNCkyGtFQfY1Swv3rXTPxlI1
         aTzVb1C6FWbQINJpgdQUc1Cew/hfJBaelYQskMy8+C+7uoPiujqsytynMoJbjaB1r9hr
         oYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition;
        bh=+zI2qfPfsTQw9A2O0lT8lxIfKgwTmvZXVz3dFSP1fho=;
        b=t0d1LtaMbmpTm2BzfAL5ZrqjjP05zRoMeEdIhD1bCUjIN/y8MyMT3y1JJ8jZzqJbbP
         9i5EsaQpa15izq8iifwnJNy/AXw82lVAQ7h1+WLdcGqmg6Q8LmKkAc8HU28addDiadd+
         WCyNdH5+/nMhJI4NIa1N81pQG/pjzS3ii2KV5Jrlxt8NpnGh7OB9SO2EEz+aSEbkHs+H
         tANKIdOKFeuGPXsx7ttuAG+WC4q6kOs+rvqmJirSlZ/0O1YTNmAW99MN+3qgZo1atzx6
         K/a6heJBJ39el4pStuYk/zxaKC6JU/pKdH/p4XQMIFEwpLFS8a+u2I+P/TEk+etLzYEe
         hxhQ==
X-Gm-Message-State: AOAM532Mj4yNQ920xun2uLk267nZIwMv9eKsxNOW4VbZvgiEyOrcFf11
        AjyWbC0QuaXtUePNt0y8Nlo=
X-Google-Smtp-Source: ABdhPJyCaxLMHO/ArrvBJvZBWI7GH90SR+N96xOqKnDRB4RNgSwRMylnDFfTjtDctcE6viE4YXUDzg==
X-Received: by 2002:a05:6808:a07:b0:322:4551:8f5d with SMTP id n7-20020a0568080a0700b0032245518f5dmr5744939oij.276.1650777225079;
        Sat, 23 Apr 2022 22:13:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 14-20020aca0f0e000000b003222ac151eesm2424696oip.1.2022.04.23.22.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 22:13:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Apr 2022 22:13:43 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Oleksandr Shamray <oleksandrs@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH 1/1] hwmon: (jc42) Add support for S-34TS04A
Message-ID: <20220424051343.GA209794@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 18, 2022 at 03:12:59PM +0300, Oleksandr Shamray wrote:
> S-34TS04A is a JC42 compatible 2-wire serial EEPROM with temperature sensor
> from Seiko Instruments/ABLIC.
> 
> Signed-off-by: Oleksandr Shamray <oleksandrs@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/jc42.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
> index f40df2f..07f7f8b 100644
> --- a/drivers/hwmon/jc42.c
> +++ b/drivers/hwmon/jc42.c
> @@ -63,6 +63,7 @@ static const unsigned short normal_i2c[] = {
>  #define STM_MANID		0x104a  /* ST Microelectronics */
>  #define GT_MANID		0x1c68	/* Giantec */
>  #define GT_MANID2		0x132d	/* Giantec, 2nd mfg ID */
> +#define SI_MANID		0x1c85	/* Seiko Instruments */
>  
>  /* SMBUS register */
>  #define SMBUS_STMOUT		BIT(7)  /* SMBus time-out, active low */
> @@ -156,6 +157,10 @@ static const unsigned short normal_i2c[] = {
>  #define STTS3000_DEVID		0x0200
>  #define STTS3000_DEVID_MASK	0xffff
>  
> +/* Seiko Instruments */
> +#define S34TS04A_DEVID		0x2221
> +#define S34TS04A_DEVID_MASK	0xffff
> +
>  static u16 jc42_hysteresis[] = { 0, 1500, 3000, 6000 };
>  
>  struct jc42_chips {
> @@ -186,6 +191,7 @@ static struct jc42_chips jc42_chips[] = {
>  	{ ONS_MANID, CAT34TS04_DEVID, CAT34TS04_DEVID_MASK },
>  	{ ONS_MANID, N34TS04_DEVID, N34TS04_DEVID_MASK },
>  	{ NXP_MANID, SE98_DEVID, SE98_DEVID_MASK },
> +	{ SI_MANID,  S34TS04A_DEVID, S34TS04A_DEVID_MASK },
>  	{ STM_MANID, STTS424_DEVID, STTS424_DEVID_MASK },
>  	{ STM_MANID, STTS424E_DEVID, STTS424E_DEVID_MASK },
>  	{ STM_MANID, STTS2002_DEVID, STTS2002_DEVID_MASK },
> -- 
> 2.8.4
> 
