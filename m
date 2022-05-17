Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D43C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 12:46:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239863AbiEQMqQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 08:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245280AbiEQMqA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 08:46:00 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CEB7F72;
        Tue, 17 May 2022 05:45:59 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-f17f1acffeso11450232fac.4;
        Tue, 17 May 2022 05:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XcLXYo1D2oh0OQQdvqkUVmOkXVkO7QLZc7UJl3/1xMQ=;
        b=XeMjoagCNmriIitDAJbxzBl6GCsOqTAJ4QoT4yjUv3VI7nJIm7dMFyrKc1sB4yLX6k
         gLFC1WvSNFRo8y0d0Xxovr8HzJz/bPF4uHXL5Zl4y0ULiKQ2lTBEnPA8ooSu+qBmxc1N
         HykAyjOcayKY2LOT4W3ZmYNRws3ZvALqMcVGImvgjx120Sz8lq8Eq7KHtfPcyFxBpMqH
         K920a2YLFV2yFdxGBdKGbWydB2nf1qwySa9KaNVEU9oSi5BfK7qx9nrCapRl3viXdIcP
         MiU3ky2SU2mf0Sa4UBPFqqPv7pQkEtNbJygjPXKjwBIJtwYM0PCPUhjNsphhTJcDJljw
         EmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=XcLXYo1D2oh0OQQdvqkUVmOkXVkO7QLZc7UJl3/1xMQ=;
        b=58j0sn67VPexaySW77XmBEEGK446egj17Ik52nxwe50cFEo0gNw90ZbL9GoZANampY
         XHFkj4wURuSx5fzz3iF0Q4oCJ6RPyLPEoCnwNqs9ov5SnqDmjefqNsmFjkIY9QCSP2ZL
         dOEElWFIi5vNDrrYHrDkw6pRf6DyDhz4x2LPjCwSDX/dljFV3qcMWScDDgoFoGYkpHj3
         tjkXpItaGRcYM1oVkNO4u5WKjtKxQOouHyTqFaAVNkfNp6/eSXJZEb4y5DjHbMAqszEm
         xm77WKCKlDXG+mlbfIR23XqDNBJ3T+6/0/v7JY88ou7sNiO1SUgL6ogWIe/iaDGQ3JC6
         56ig==
X-Gm-Message-State: AOAM530pLNb1e8x3X8y/z27MHvy4JbNHWrc8PV5Y+US0BKM7a4Nkv5Vp
        4dfUsPfUAPA/L+jZ+20/dvw=
X-Google-Smtp-Source: ABdhPJyLt7KmqZotuvIH195cG5zCBNURvlGgA3m4CPB6GtHXqmXGPUTc4eFr6QOh02iZ5K1nktxk9g==
X-Received: by 2002:a05:6870:6097:b0:e1:a94d:9a38 with SMTP id t23-20020a056870609700b000e1a94d9a38mr12969476oae.191.1652791558646;
        Tue, 17 May 2022 05:45:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e22-20020a4ad256000000b0035eb4e5a6cbsm5076220oos.33.2022.05.17.05.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 05:45:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 17 May 2022 05:45:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Greg.Schwendimann@infineon.com
Cc:     linux-hwmon@vger.kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: trivial-devices: Add xdp152
Message-ID: <20220517124555.GA3395300@roeck-us.net>
References: <1a600fd51db942389a5078a72c3bf411@infineon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a600fd51db942389a5078a72c3bf411@infineon.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, May 16, 2022 at 02:03:43PM +0000, Greg.Schwendimann@infineon.com wrote:
> Add Infineon Digital Multi-phase xdp152 family controllers.
> 
> Signed-off-by: Greg Schwendimann <Greg.Schwendimann@infineon.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 550a2e5c9e05..c11520347a9d 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -143,6 +143,10 @@ properties:
>            - infineon,xdpe12254
>              # Infineon Multi-phase Digital VR Controller xdpe12284
>            - infineon,xdpe12284
> +            # Infineon Multi-phase Digital VR Controller xdpe15284
> +          - infineon,xdpe15284
> +            # Infineon Multi-phase Digital VR Controller xdpe152c4
> +          - infineon,xdpe152c4
>              # Injoinic IP5108 2.0A Power Bank IC with I2C
>            - injoinic,ip5108
>              # Injoinic IP5109 2.1A Power Bank IC with I2C
