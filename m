Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D716C677F1
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 Jan 2023 22:02:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjAQWCL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 Jan 2023 17:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbjAQWAG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Jan 2023 17:00:06 -0500
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABA553FA2;
        Tue, 17 Jan 2023 12:40:34 -0800 (PST)
Received: by mail-oi1-f182.google.com with SMTP id p185so5875459oif.2;
        Tue, 17 Jan 2023 12:40:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=67/7qFGKU8v+ncCe98IgRm1sBY7EEsIFhO8RWKpy1ms=;
        b=oLwIjmnbd11o+N3onDhjd/7mDTpHICkyYMhzyFd9cv4tSiWTWEJwgk+IuMfQUrpZFH
         R5tK3lY9XiW0Jy8D7hVkhIewhTnDlQufCOTVcnm6oq56F4KKtDduEv/pcG8x7MoDhnsQ
         gw/yHid/NNd+bAL6K8UHJuqPhYziu6kXNj+ZuZ8/lSBVl4D4UuWx4FYHIMhw+QMwrbrE
         gvdUg01b7ynsHVprZfhzkhaNXBAaUsvQoYtB3087c1rtj2LWg7k53pEiYxrOZZgYCkIq
         41nFtLOK7U6uY6qxF41jV+63F8kRHJFHf2nal3lweh1kxXC/MUGYSIbsP7egq61H+Hb9
         qGBg==
X-Gm-Message-State: AFqh2kpwcAFaXMZw2tMreQ+37SWVx/0L7O/q/GW0YFyP0nPIFGYg5pzc
        2pHWPNP5gD9wo37smdGfuQ==
X-Google-Smtp-Source: AMrXdXure+5iEtDRLsla/oJrLqVm1rjH+eOc28MjSr7MGs42Rvef5APfJfN9jWPwzpWJRiZswegkGw==
X-Received: by 2002:a05:6808:193:b0:364:3de0:f933 with SMTP id w19-20020a056808019300b003643de0f933mr11257851oic.52.1673988033446;
        Tue, 17 Jan 2023 12:40:33 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o9-20020a0568080f8900b0035e461d9b1bsm15272517oiw.50.2023.01.17.12.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 12:40:33 -0800 (PST)
Received: (nullmailer pid 3669412 invoked by uid 1000);
        Tue, 17 Jan 2023 20:40:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Mario Kicherer <dev@kicherer.org>
Cc:     linux@roeck-us.net, robh+dt@kernel.org, corbet@lwn.net,
        linux-hwmon@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jdelvare@suse.com, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20230117161340.1310936-3-dev@kicherer.org>
References: <20230117161340.1310936-1-dev@kicherer.org>
 <20230117161340.1310936-3-dev@kicherer.org>
Message-Id: <167398779869.3664156.14251778655302872617.robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: hwmon: add nxp,mc34vr500
Date:   Tue, 17 Jan 2023 14:40:32 -0600
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On Tue, 17 Jan 2023 17:13:39 +0100, Mario Kicherer wrote:
> This patch adds dt-bindings for the NXP MC34VR500 PMIC.
> 
> Signed-off-by: Mario Kicherer <dev@kicherer.org>
> ---
>  .../bindings/hwmon/nxp,mc34vr500.yaml         | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/hwmon/nxp,mc34vr500.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230117161340.1310936-3-dev@kicherer.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

