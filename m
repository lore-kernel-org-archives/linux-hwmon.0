Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEE5C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jun 2022 17:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbiFERyT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jun 2022 13:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351339AbiFERyR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jun 2022 13:54:17 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A881A4C79A;
        Sun,  5 Jun 2022 10:54:15 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-e5e433d66dso16722715fac.5;
        Sun, 05 Jun 2022 10:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WoIHHLHXcE/EiOt9HmFH1n6IZYmnWVDAXMW+FXz4smQ=;
        b=Ly3J7cPASztn9LZTGZR8JtFJxCIOskmU+DPLD+PNW6WCI4lVx9lnG00hne72Z40vHQ
         aMlEfn5IVf03HwvAJL4bXUagrrVqaiCYSBtiEaGp8ZjV/sDcbldMOVluE4pyXkQedtDv
         ygeoEyhSOtQELJv+JfmSski3xZmJp6QcsreUEOnbVkAEV6zTwqiujjkHEjJG91KAHPbG
         MHoRmredQzEQd1u6w9DuEQuqgZGAx7RUL0nvX6N4VLAfN4WsrXjh8LAkUV/M6+VjWgYt
         I5rbD06h6gnqmG/qLTMbd3zeYa8bV0K6d200wkqGDF9jiEJ4tS8luGF7Fz9DtJGnaERz
         +Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=WoIHHLHXcE/EiOt9HmFH1n6IZYmnWVDAXMW+FXz4smQ=;
        b=kCgg+UVA4m4+WN9JpwraEcuUMBE9xvcNN1u9o7d9pJqcJHoiJz+DnsOfXEY9XQjjW0
         ILQ2/7tTXloo7NwCrR8JYjb3ZF34JPg8FeqmAiC7GPzqVZ5TaGKxfejEbDHVZ5JRhK+S
         upi0HHTHpRjUDhgPsQcvUaQ20fzAYtfgCaZQRNYxDW2Q4ZZfYpdqqGKvlT5m1Tb6vUFo
         rzWwQTjy/O4XsLTJ4zEDYoTxSa4Qljve1P6d45Fd1ZISg60fQh8STk6xnAw+Ia3QOMuv
         YBwmF8SF1ZKgpBc9BTqrZ7u7IsVGurjG5yGwPt2mzP6dOPnKB4+5NeRsjj51LwZAXFa8
         5/Tw==
X-Gm-Message-State: AOAM5313ucV42qpWTEh0ePP4vOcig7lVW4A2RuZZKZKpyEgRis+AJlSd
        TjtONWGvcmHhZIUAPkus0XU=
X-Google-Smtp-Source: ABdhPJz8yp0CBYOpYV7uhGqhRntF6XrYBJRV9xC25XoDkFRVm/1Sc3d5X6j2jMDgrfV8Uf9eMqWLrQ==
X-Received: by 2002:a05:6870:e245:b0:de:9321:9ea3 with SMTP id d5-20020a056870e24500b000de93219ea3mr11205532oac.79.1654451655000;
        Sun, 05 Jun 2022 10:54:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p12-20020a05680811cc00b0032c14a97747sm6990615oiv.56.2022.06.05.10.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 10:54:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 5 Jun 2022 10:54:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        slawomir.stepien@nokia.com
Subject: Re: [PATCH 3/7] hwmon: (lm90) Add compatible entry for adt7481
Message-ID: <20220605175413.GA3150945@roeck-us.net>
References: <20220525073657.573327-1-sst@poczta.fm>
 <20220525073657.573327-4-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525073657.573327-4-sst@poczta.fm>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 25, 2022 at 09:36:53AM +0200, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> This will allow binding the driver with the device from the device tree.
> 
> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/lm90.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 4c25c9ffdfe9..02b211a4e571 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -294,6 +294,10 @@ static const struct of_device_id __maybe_unused lm90_of_match[] = {
>  		.compatible = "adi,adt7461a",
>  		.data = (void *)adt7461a
>  	},
> +	{
> +		.compatible = "adi,adt7481",
> +		.data = (void *)adt7481
> +	},
>  	{
>  		.compatible = "gmt,g781",
>  		.data = (void *)g781
