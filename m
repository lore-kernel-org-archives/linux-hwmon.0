Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7242FC6FA82
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Sep 2022 16:09:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbiIDQJm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 4 Sep 2022 12:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiIDQJd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 4 Sep 2022 12:09:33 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7505E26E7
        for <linux-hwmon@vger.kernel.org>; Sun,  4 Sep 2022 09:09:32 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id o4so6320548pjp.4
        for <linux-hwmon@vger.kernel.org>; Sun, 04 Sep 2022 09:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=Ghow1D/agce01fJv+ajd4N8TtOpqVLg9DR2PiBIzXII=;
        b=ciTewzkKGnTZq9GZCZSsU7BF4LPmUnoRN7JFFpS0dGjv9EF8ljTENJY85RseXUobcX
         oZjMTVEk0wggYAtvljB240skKUwFqxNql1HRowodpXLHyWASiCIMLYxOKojYMaRqj5qy
         fY/RhpMjX4YQrmclGahrmH26B/JlxtkajMKefG+aeDdH7bOVtw6RXokgdUOaDuYK2F1V
         6PgfWmhOjEYasgYXfiE/nw9MHZ3B7rmGmB6hpAsbr9NQdqsorzgXf2+NB3qbVCVyKe1h
         IuFdpIZ3vhZjFVrwX8TPxLdbqabxiMNDR9uyHarrSJwp+mZl77OIcVqxyH2lXgaT2v0w
         XZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ghow1D/agce01fJv+ajd4N8TtOpqVLg9DR2PiBIzXII=;
        b=iWjNF39nDas/BXf1dZx0q+Y+BQA+Bkglvrgrk8co0c5FObdJlngDshZ8b/6ntiHDRD
         vxRiHesnkTTd55ofFc7ndj1yvq/4GcE0EJGYHtVgv1qqIPMlIqlUgvyR8YlCVNq+XL4a
         AwzZ1+CpgIupLIYYhFWOQCsQ48HpGuDbwterN3z6+dmxiVDGCg5b7hh38XtGzJWVbk6L
         8w4t5Iv4xhq/KcSMtA+CR0Ai2GekxWGWlG8DXIiyRhGfI/DITyA+iDyhrtYwgeiVIQ13
         gr7rvN27pnmed6lCPZcGWZbPKxXk2Udm8NDSVkxcgZ8cZZlTqDEKjjoJstRVx5pNcmGy
         fXQQ==
X-Gm-Message-State: ACgBeo0K7LNkKcVInGEi5pdQDsthIwd1NZ4FLA6NoQJMgTuOWI842Ows
        cPTR38SUqW2zT5HkP8a1intm1wL1xUReyg==
X-Google-Smtp-Source: AA6agR46ekFXGARmg2vF2r7qwGgUA4//7CMBwxnFwyAlO2uLFXwQDEh+YKcaFrF87E+B1Iu9roNdLw==
X-Received: by 2002:a17:902:b715:b0:174:dba3:8bca with SMTP id d21-20020a170902b71500b00174dba38bcamr31157752pls.51.1662307771971;
        Sun, 04 Sep 2022 09:09:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d6-20020a170902654600b00174be817124sm650772pln.221.2022.09.04.09.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 09:09:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 4 Sep 2022 09:09:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v5 4/4] MAINTAINERS: Add maintainer for hwmon/max31760
Message-ID: <20220904160930.GA3007468@roeck-us.net>
References: <20220901125906.929-1-Ibrahim.Tilki@analog.com>
 <20220901125906.929-5-Ibrahim.Tilki@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901125906.929-5-Ibrahim.Tilki@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 01, 2022 at 03:59:06PM +0300, Ibrahim Tilki wrote:
> Add maintainer for hwmon/max31760 driver
> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 589517372..932a12de9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1334,6 +1334,15 @@ F:	drivers/iio/amplifiers/hmc425a.c
>  F:	drivers/staging/iio/*/ad*
>  X:	drivers/iio/*/adjd*
>  
> +ANALOG DEVICES INC MAX31760 DRIVER
> +M:	Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> +S:	Maintained
> +W:	http://wiki.analog.com/
> +W:	https://ez.analog.com/linux-software-drivers
> +F:	Documentation/devicetree/bindings/hwmon/adi,max31760.yaml
> +F:	Documentation/hwmon/max31760.rst
> +F:	drivers/hwmon/max31760.c
> +
>  ANALOGBITS PLL LIBRARIES
>  M:	Paul Walmsley <paul.walmsley@sifive.com>
>  S:	Supported
