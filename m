Return-Path: <SRS0=9kW7=DA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3751CC2D0A8
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Sep 2020 20:16:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD4F9206D9
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Sep 2020 20:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600892181;
	bh=5Ot9vgDxrHjAf/rn/LLC3tsaOiD5QAWwzYvkRM1uQNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FgZ2IsHBJQOXxYwxMx2GVf53UJ4/YNimZ5umvCk8k7dUZ+iklayr1JXUYQMED2RJS
	 b3sb0x0KWH2bucQBj4MhHv8xwgo/ZXupfY9qFaC/IFUUAh6ApTzGiUakZMxMHKG9uN
	 /97ZD+SItqJlwJeCfdIgyGeM28xaZMcSvCc+SaT8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgIWUQR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Sep 2020 16:16:17 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:33139 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgIWUQR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Sep 2020 16:16:17 -0400
Received: by mail-il1-f194.google.com with SMTP id y2so910509ila.0;
        Wed, 23 Sep 2020 13:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aV+c8Zyc5zaGGhkqmMJRFxmFFIgQ8+YjHi3mykMRU5Q=;
        b=e9iyPjvi/PNI9XBT1KrWi5xk2pDUoDA41c1Cf6GCebgzraGwVdVrqrrD29tba5XooR
         /K44MLkTLSUIHCaXGP9/TSBFqqdU/s4STVGHv7zlYgnBWBWZVgyWbpd8PqDCkcM8YjZy
         sKUWQzF/fwkOGZSDa5YjwE5PryGtA7Mr3S6qc41nlKY2GmJpDQa71Bzd5m+kO/aSqd2m
         8IB3mTSTmC924cEjyPAaZ1ZTTvSc8tSHl3Y+eSnUrZF+u+sg472DMFmd9HekAFu1VGKk
         M01BX9LZIh5f2LteZETRv/k8x34cbrApRKAFHilNyeT/RqR/47AMQWzTfMTusjrJoo4Q
         lMIw==
X-Gm-Message-State: AOAM530vHkU3zeyqxFSOcC9CSDhfDu+ez8RkAnfITeTRxKsHkjJz1vEI
        aSSJCsj008SqkZ/kpizSlw==
X-Google-Smtp-Source: ABdhPJwUSgiMehhJrBl139LHgcCuSW/KGsiMjB79zMZlUXUwS1MoSUtIgnlgUG4exph0w3jLZSlc1A==
X-Received: by 2002:a92:bb94:: with SMTP id x20mr1329424ilk.86.1600892175924;
        Wed, 23 Sep 2020 13:16:15 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id e8sm390227ill.42.2020.09.23.13.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 13:16:15 -0700 (PDT)
Received: (nullmailer pid 1228571 invoked by uid 1000);
        Wed, 23 Sep 2020 20:16:14 -0000
Date:   Wed, 23 Sep 2020 14:16:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alban Bedel <alban.bedel@aerq.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: Add the +vs supply to the lm75
 bindings
Message-ID: <20200923201614.GA1227183@bogus>
References: <20200917101819.32045-1-alban.bedel@aerq.com>
 <20200917101819.32045-3-alban.bedel@aerq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917101819.32045-3-alban.bedel@aerq.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 17, 2020 at 12:18:18PM +0200, Alban Bedel wrote:
> Some boards might have a regulator that control the +VS supply, add it
> to the bindings.
> 
> Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
> ---
>  Documentation/devicetree/bindings/hwmon/lm75.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> index 78d6291fcdcc..1a4405b17924 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> @@ -43,6 +43,10 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  vs-supply:
> +    maxItems: 1

*-supply is always 1, so drop.

> +    description: phandle to the regulator that provides the +VS supply
> +
>  required:
>    - compatible
>    - reg
> @@ -52,4 +56,5 @@ examples:
>      sensor@48 {
>              compatible = "st,stlm75";
>              reg = <0x48>;
> +            vs-supply = <&vs>;
>      };
> -- 
> 2.25.1
> 
