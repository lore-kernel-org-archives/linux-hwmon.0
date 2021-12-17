Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4333C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Dec 2021 15:48:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233461AbhLQPsx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Dec 2021 10:48:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbhLQPsx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Dec 2021 10:48:53 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5899C061574;
        Fri, 17 Dec 2021 07:48:52 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id p2-20020a4adfc2000000b002c2676904fdso813545ood.13;
        Fri, 17 Dec 2021 07:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6dm4pOYGFOUOnd9TBndDBcAp1Msui/lpdLLescsGmQA=;
        b=MsyAIMi0rI6dnluKwifLKBjgw8MSA/nu+AxFriSzfgy8u63mTZjxqKW/csPHbRk/LU
         z5IKRn04aNy9X7PEIV2twi23dM3LV86s7LDdAYc0uRKQlpjafphFv/EjqXr/oZUUpOA5
         Hj8sSooRsCVcCixaPCG1tv1mosUkULpk1DV9CNCdPWdkAmT4I/s4rMIn0jdAg7jSn3Bk
         NDyxO9ubTSyLLE/Sj5ecyT3FEnPMdTV+E19VHDqWPZ0NXDnp027/RjdX1Ioqu9ZXGzex
         gm5h8qjf/CQJv9WcxZlqM6AsBEkx+OfM/hs+mJYd39XmZuV/1uFrUaCc4Qv4T9dQ5nUH
         YRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=6dm4pOYGFOUOnd9TBndDBcAp1Msui/lpdLLescsGmQA=;
        b=m0y9wrJVgvN2ouu9iZI8r4rJ2SeaybpkZZUCRUDHACwNhde/yLBZKHx5Azx/CrKqT/
         Jjxe0QXgurhl2b9zsc4pLWzQkIMz2kzdlDjQQ3g5mPI/W4/FO16y9dHBkAmuqJ/8zzGv
         2HNRfr3xIlOIs05BG9cOhPHq94R0/bBolmVPQhuRfuloInQVK/Ry+yaI8gn9ILhesFeu
         ZSsX216xakuOgzwaIdG/9vDKV0wlbzzbI7liVUK8l0EiJX34OoWg29h0C8F/OZE67Vxu
         ayjALBz6o0GB7wT4LJ71N8tTLCrEBqzAcoti12Rw6rnBP1IglfRuCapvxOlx9cIiV9uB
         kaFQ==
X-Gm-Message-State: AOAM531Y93yNsjHOutYUfb3HM+JhNnOgE96b8HOKzUJYM5Z3BWFNvxbA
        GHUc1Y9oV50QOY2S+/lZok4=
X-Google-Smtp-Source: ABdhPJy4vDAoMqy1suYtcDZ5UF0RmpzzS+JQbYdAFRDtXk7bkPcIiomXqooHg3rF3Mi9zza1gK/0lQ==
X-Received: by 2002:a4a:d284:: with SMTP id h4mr2323424oos.31.1639756132252;
        Fri, 17 Dec 2021 07:48:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c41sm1746402otu.7.2021.12.17.07.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 07:48:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 17 Dec 2021 07:48:50 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: add Delta AHE-50DC fan control module
Message-ID: <20211217154850.GA2969063@roeck-us.net>
References: <20211208213703.2577-1-zev@bewilderbeest.net>
 <20211208213703.2577-3-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208213703.2577-3-zev@bewilderbeest.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 08, 2021 at 01:37:03PM -0800, Zev Weiss wrote:
> This is the integrated fan control module of the Delta AHE-50DC Open19
> power shelf.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Acked-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 791079021f1b..1c43cc91f804 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -73,6 +73,8 @@ properties:
>            - dallas,ds4510
>              # Digital Thermometer and Thermostat
>            - dallas,ds75
> +            # Delta AHE-50DC Open19 power shelf fan control module
> +          - delta,ahe50dc-fan
>              # Delta Electronics DPS-650-AB power supply
>            - delta,dps650ab
>            # Delta Electronics DPS920AB 920W 54V Power Supply
