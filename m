Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3AEC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Dec 2021 22:06:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344599AbhLJWKG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Dec 2021 17:10:06 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:43521 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243193AbhLJWKF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Dec 2021 17:10:05 -0500
Received: by mail-ot1-f54.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so10984255otu.10;
        Fri, 10 Dec 2021 14:06:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zGf/38Vwo8eR5gshSlfvh26HPD1VlHPaMv5irQiJzic=;
        b=xA1z442YlipIQ03H5yl6+PoYya9M18b5xfTZn0oFqSJJWkvE6d9oPj08FXmsrWA15m
         /HrrmWO9drz/dAzuVxQWZW9mpKjhfnqD2oHVefHm4pGXnXSLpw9GOvThyhKqddIQ43lP
         PTVTD5KkO46+CQI+plCZicZqKTB9HzOYSW1RqZ6+viToUBAuRBfwzQcj9YSzDNyCiyUX
         4JGmmKsP0ysx96Fsq2y19qjMf0s7cth+OMdmNZRagHa9HbeDGQ2otybf3HU69eig+W3u
         MoRuD2avjoPuDoemIR/g6i+1M72g1qVkPiyBtFB9qagvto+JIEiJqHBqOZFy/w52i22P
         46lw==
X-Gm-Message-State: AOAM532/qPje5jHw1X8Joxpo6JfifzBlCyrHLzaX3sfkaWM7Mhugw/SX
        BeEs0rXvJcc2SY8oCZslhw==
X-Google-Smtp-Source: ABdhPJydz0gR7yjLFC5bPmusOYQaEY/qraySMB9ap370KXzu4GwifsBe02pFaB1/RrFgq9JjcMaZmA==
X-Received: by 2002:a05:6830:1d87:: with SMTP id y7mr13041702oti.269.1639173989753;
        Fri, 10 Dec 2021 14:06:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l23sm758023oti.16.2021.12.10.14.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 14:06:29 -0800 (PST)
Received: (nullmailer pid 2011299 invoked by uid 1000);
        Fri, 10 Dec 2021 22:06:28 -0000
Date:   Fri, 10 Dec 2021 16:06:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     Guenter Roeck <linux@roeck-us.net>, openbmc@lists.ozlabs.org,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: add Delta AHE-50DC fan control module
Message-ID: <YbPPZISviJxKsK15@robh.at.kernel.org>
References: <20211208213703.2577-1-zev@bewilderbeest.net>
 <20211208213703.2577-3-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208213703.2577-3-zev@bewilderbeest.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 08 Dec 2021 13:37:03 -0800, Zev Weiss wrote:
> This is the integrated fan control module of the Delta AHE-50DC Open19
> power shelf.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
