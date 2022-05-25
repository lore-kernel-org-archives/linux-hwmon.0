Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C467C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 May 2022 12:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236085AbiEYMoI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 08:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233719AbiEYMoH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 08:44:07 -0400
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDB31057F;
        Wed, 25 May 2022 05:44:05 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-f2c296d320so1652668fac.8;
        Wed, 25 May 2022 05:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=p5CYTgAX8K8u4bnsP29ZIWvZEA8+eTTLk6hO/pi9fro=;
        b=731cJuKa3rE71gdNlesv4tsAnz/E3QYlVkLA067a6lKQdHY715Lh+xQJXh1Q0uWESr
         P+9Be7/dxb1AQE4MpafNVLbyIwo0Nft0mpjvQ7nKGLdHiHY+4ytBfowSvchd8VZ7JPhd
         3OeniONGeOAJHbDDi0YuJXmorM5n3QqzN4+FpriU0izikk6nkoFuh7VwcIk8ZGBYZJIY
         ZKC1G4FBRiWjOXBixVTSLTN/4ABO4ER/WA1V+krL0vMowTgGBveY8cQQK29pQmHoW+qk
         xbqrafI8YjcUNnI2qAYLcakoLuCAb4PuPZN51TCR94ydMP7Lo64hiukhj7tVxS/8mDKJ
         72WQ==
X-Gm-Message-State: AOAM531plWfRVBfvkp9xF04AGyEuOQ2tli9laAz/2cHS04RaJQEteufh
        qrbyfYRMwGlDVGKy8oBzLQ==
X-Google-Smtp-Source: ABdhPJwN33KKYR9Abvw94TG0zy2LwgIN6td85neRCKNuiTaWClSTdJBS75XpFC147g/Wt3rrf6FZRw==
X-Received: by 2002:a05:6870:f708:b0:f2:8a04:25e5 with SMTP id ej8-20020a056870f70800b000f28a0425e5mr5537659oab.280.1653482645114;
        Wed, 25 May 2022 05:44:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s16-20020a4aa550000000b0035eb4e5a6c8sm6482022oom.30.2022.05.25.05.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 05:44:04 -0700 (PDT)
Received: (nullmailer pid 1760898 invoked by uid 1000);
        Wed, 25 May 2022 12:44:01 -0000
From:   Rob Herring <robh@kernel.org>
To:     michaelsh@nvidia.com
Cc:     linux-hwmon@vger.kernel.org, robh+dt@kernel.org, vadimp@nvidia.com,
        linux@roeck-us.net, devicetree@vger.kernel.org
In-Reply-To: <20220524161755.43833-3-michaelsh@nvidia.com>
References: <20220524161755.43833-1-michaelsh@nvidia.com> <20220524161755.43833-3-michaelsh@nvidia.com>
Subject: Re: [PATCH hwmon-next v2 2/3] dt-bindings: hwmon: add Microchip EMC2305 fan controller.
Date:   Wed, 25 May 2022 07:44:01 -0500
Message-Id: <1653482641.598528.1760897.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 24 May 2022 19:17:54 +0300, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Add basic description of emc2305 driver device tree binding.
> 
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v1->v2
> - Fix dt binding check errors;
> - Add descriptions;
> - Add missing fields;
> - Change the patch subject name;
> - Separate pwm-min, pwm-max per PWM channel.
> ---
>  .../bindings/hwmon/microchip,emc2305.yaml          | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/hwmon/microchip,emc2305.example.dts:23.23-26.19: Warning (unit_address_vs_reg): /example-0/fan/microchip,pwms/pwm@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/hwmon/microchip,emc2305.example.dts:27.23-30.19: Warning (unit_address_vs_reg): /example-0/fan/microchip,pwms/pwm@1: node has a unit name, but no reg or ranges property

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

