Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F057C43334
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jun 2022 17:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346564AbiFERwk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jun 2022 13:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbiFERwk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jun 2022 13:52:40 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5BC2B191;
        Sun,  5 Jun 2022 10:52:38 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-f3381207a5so16753889fac.4;
        Sun, 05 Jun 2022 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f3dA/DYXJh6vkxG9o6pm4Tv3wyZL8CJuZGYKRytVcsY=;
        b=ouXH3EtmVTBS4swgJYY9Zx7fP92qbZ8t959EPmePNWNZG+l8QrNi5xW6K9BkWI2DDa
         DHDc072CjmhB62qLsimgvhEWdW1gc9crVWjX8gQvfZWQfBpnOakoRVWgi2H1Koe4Pw7z
         IytXfvKQEkwQ13SoE/EoaOBmf5vHDTDMJTaWtQfphMR/usOYBUfnB9jIUBaywJRmOG2H
         8TVPIwRF1vCaDfYOLacmB0/YpWFVh7TD6B2TKkqNvfLaVHP8jWw9b4y3aohWrN9+CpK0
         Ktkw4pQ3pj9JrEaBgO+1xn8lb9YB2Qj0meurxW1NdVAN0Tt5gNk4nHbIqR14WNntm1FV
         z3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=f3dA/DYXJh6vkxG9o6pm4Tv3wyZL8CJuZGYKRytVcsY=;
        b=VfZHQkd/ooD5p/1Oz55yUzzHe75HOGD0UMJlXg27ELN6EA6VzehpZ+Sz2OA/PGwVDM
         Dp+Ses8sCskx0pyrH4wZeEKaRirC3cqzbeDhSrI1L+cQdSTO2T4JWs9lT6Umsjnn3xqx
         dXI3qV7hI2IFv/TvUwL5vBf0AfHalA2UKWEXcMwxuojTwU06E4SqYQTYsUYyY/eygaSQ
         pKZk/QE3R47JlM4TlEYlBoav/39nklp0yOQ5nT751mncmodL/mqEP8cUON+qUkT1OKU9
         rjVlFnN9I9bKzoEBRvmOJIFoDcOsndHzcDbUBvHSBaQogJx39XOMii7c9zLnMin3eK7H
         yq1w==
X-Gm-Message-State: AOAM5335Kh6hawVpRtQgF6CQzXKABaCDBBhthVVk6ug9ao1NXD7cLztH
        +2qxWlsF2OO6vt0UwPoI66s=
X-Google-Smtp-Source: ABdhPJy3Uk3lUNytG0ZSYcnnYbODViKhvYoQmp0ybP72kT6LhRB3/rV0h4lqT96xYVJNtgfhZKIQxA==
X-Received: by 2002:a05:6871:892:b0:fb:451e:9e43 with SMTP id r18-20020a056871089200b000fb451e9e43mr2126873oaq.162.1654451558020;
        Sun, 05 Jun 2022 10:52:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f3-20020a05680807c300b00325cda1ffa8sm6706130oij.39.2022.06.05.10.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 10:52:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 5 Jun 2022 10:52:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        slawomir.stepien@nokia.com
Subject: Re: [PATCH 1/7] dt-bindings: hwmon: Add compatible string for
 ADT7481 in lm90
Message-ID: <20220605175236.GA3150698@roeck-us.net>
References: <20220525073657.573327-1-sst@poczta.fm>
 <20220525073657.573327-2-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525073657.573327-2-sst@poczta.fm>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 25, 2022 at 09:36:51AM +0200, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> This will allow binding the driver with the device from the device tree.
> 
> This device can work in extended temperature measurement mode, so add it
> also to the list of devices that support 'ti,extended-range-enable'.
> 
> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> index b04657849852..82fce96498c7 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> @@ -16,6 +16,7 @@ properties:
>        - adi,adm1032
>        - adi,adt7461
>        - adi,adt7461a
> +      - adi,adt7481
>        - dallas,max6646
>        - dallas,max6647
>        - dallas,max6649
> @@ -70,6 +71,7 @@ allOf:
>                enum:
>                  - adi,adt7461
>                  - adi,adt7461a
> +                - adi,adt7481
>                  - ti,tmp451
>                  - ti,tmp461
>      then:
