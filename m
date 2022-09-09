Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A671FECAAD5
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Sep 2022 16:26:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbiIIQ0d (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Sep 2022 12:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiIIQ0c (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Sep 2022 12:26:32 -0400
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5FF139AE7;
        Fri,  9 Sep 2022 09:26:31 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1279948d93dso5169625fac.10;
        Fri, 09 Sep 2022 09:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FSLpBKHdqGH4UD8W7sF6FLxJt117hzi/gBY+u7RUGKo=;
        b=gq6PGvr5PRLHLP7E+SueOkuaiH1OWLLr8JdS3zZRKaFUjlQoMaR+ihrPcVngyaCyZ2
         y4pxVHyGEyGgFkDzBSC4QnDMzosGrL1cSxQs51EvE5yPkPwi5TZN8G7K+nYbTOd1jk37
         ltTw38cqWmr+TJ9/S4/hjpiZYNSz2B6ElQwjZ2l3qTSlzCSsFBtgKf33vrhUo01pCupy
         NLSR3+9IEgzV23atmnYATha0xvPfCnPGGhsUBSfSUSJY8tQfgogOH260fiE/OFtVdv/K
         Wlu/80/7TRtRQVLoc6yapu2mt8gN4iOCiDIFaPctzitLbXwIhW7YjTldQw2m1syB113G
         23hQ==
X-Gm-Message-State: ACgBeo3UBNlG9swPzTaJulcfDoDIf04b3oMqwdYVN/8SZNLjHw2qJ3/v
        9OIb6EUoOC28OXVI8DeTtA==
X-Google-Smtp-Source: AA6agR50h4wA1Te0UmCw+X7Tbg1nGPcTAQJxzL4DzY0+yoIOQzpYmU4LNZqsWXOQCMPgCUn7SRJbgA==
X-Received: by 2002:a05:6808:13ce:b0:344:dde7:79f9 with SMTP id d14-20020a05680813ce00b00344dde779f9mr3954597oiw.233.1662740790373;
        Fri, 09 Sep 2022 09:26:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g3-20020a0568080dc300b0032f0fd7e1f8sm415011oic.39.2022.09.09.09.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 09:26:30 -0700 (PDT)
Received: (nullmailer pid 1507150 invoked by uid 1000);
        Fri, 09 Sep 2022 16:26:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>
Cc:     jdelvare@suse.com, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@roeck-us.net,
        robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20220909133718.388213-4-Ibrahim.Tilki@analog.com>
References: <20220909133718.388213-1-Ibrahim.Tilki@analog.com> <20220909133718.388213-4-Ibrahim.Tilki@analog.com>
Subject: Re: [PATCH v8 3/4] dt-bindings: hwmon: Add bindings for max31760
Date:   Fri, 09 Sep 2022 11:26:29 -0500
Message-Id: <1662740789.477872.1507147.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 09 Sep 2022 16:37:17 +0300, Ibrahim Tilki wrote:
> Adding bindings for Analog Devices MAX31760 Fan-Speed Controller
> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> ---
>  .../bindings/hwmon/adi,max31760.yaml          | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,max31760.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/hwmon/adi,max31760.yaml: error checking schema file
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/adi,max31760.yaml: ignoring, error in schema: properties: reg
Documentation/devicetree/bindings/hwmon/adi,max31760.example.dtb:0:0: /example-0/i2c/fan-controller@50: failed to match any schema with compatible: ['adi,max31760']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

