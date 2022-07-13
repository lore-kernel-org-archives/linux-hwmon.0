Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0476C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Jul 2022 13:35:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235637AbiGMNfb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Jul 2022 09:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235134AbiGMNf1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Jul 2022 09:35:27 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9FA26121
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Jul 2022 06:35:26 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 23so10444985pgc.8
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Jul 2022 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+iHC9tPXj5dYX0soiuuuM3jTCpfXKYFvlMNnQBLYWVs=;
        b=kE41HeKfnBtVLukUpwAvpX8lr6ebiVPzL7Pa8loXfI31T/yIRi2M6fzwJvTmoW/LJD
         dF4n/vAI3Zs0apt4/IhgJcPisKDeahxPB3N5aejgw6HBXcYpxsCHhmnt0ssO9y0PDYkW
         PdVhtHWO+APrvOphd6dqbbRYj8V7HHjybzyQUeuJX1lpAgngxe4wEElM+7QRHOQcgFeb
         sxJb5nCwXVdczgTJlpRYsZOeWM91Zt5nun/fRup71CYx2xetjL+hgcTFXEZuv2nxZCPZ
         bk4ONZQKJ2oVm8Ih4wNK/hyCs5eu1qxKwkOeduBDA8zKP09gPFrylrwaTF6Hm3jhM2Uj
         TdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=+iHC9tPXj5dYX0soiuuuM3jTCpfXKYFvlMNnQBLYWVs=;
        b=6EUse5aDJ8TMj0AdlFOFtWnYzSTRJzYjyYFDCquJZXisO5zUWgr/TDyib3/DR0WBDk
         5FOlA2FUyOV3dMz+Pbrye1HnGeNtzB5BKhpcLQ1Nl1/eaHIIhr/wP7+fNS/zFcjuGBPE
         8aDL5EtMwBAqTjX6PquH6U9LCunI0xmGc1M7BnAVdDzHtQv6WctMMhEBk44gQQxesnw+
         YfyN1eo0psGcyDqmc9f6DAm8N/Xb6CkeD63YhCBqNHVB4MMfRnv1EX9TkIkp2SadDWCH
         LpdPwE72XQVsHqSgseKBynBvC2PkW510M7j1YQuS8TYccjVhNGTLjlWOZXa22xx29/kx
         uyYw==
X-Gm-Message-State: AJIora/o5Hv0peaN0WKypA3fHuIFsOz//65oma+SQfOMCTOhsXBMjJHm
        qJu4980+3diQ8bJ+Mezp/SFElwkqNC1s0A==
X-Google-Smtp-Source: AGRyM1tHNlUs7Bf9G3sEx6emyjB/HJA5EUIbMjrohOvFdh6UT9hJ0DKhiv3YYsqfSGFTk4dtWPjFqw==
X-Received: by 2002:a05:6a00:10c1:b0:52a:d621:138a with SMTP id d1-20020a056a0010c100b0052ad621138amr3441387pfu.67.1657719326190;
        Wed, 13 Jul 2022 06:35:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t6-20020a632246000000b0041296135280sm3509805pgm.88.2022.07.13.06.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 06:35:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 13 Jul 2022 06:35:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: drivetemp: Add module alias
Message-ID: <20220713133524.GA3662638@roeck-us.net>
References: <20220712214624.1845158-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712214624.1845158-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 12, 2022 at 11:46:24PM +0200, Linus Walleij wrote:
> Adding a MODULE_ALIAS() to drivetemp will make the driver easier
> for modprobe to autoprobe.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/drivetemp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
> index 1eb37106a220..5bac2b0fc7bb 100644
> --- a/drivers/hwmon/drivetemp.c
> +++ b/drivers/hwmon/drivetemp.c
> @@ -621,3 +621,4 @@ module_exit(drivetemp_exit);
>  MODULE_AUTHOR("Guenter Roeck <linus@roeck-us.net>");
>  MODULE_DESCRIPTION("Hard drive temperature monitor");
>  MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:drivetemp");
