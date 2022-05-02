Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2566AC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 15:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385801AbiEBPhC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 11:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385776AbiEBPhB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 11:37:01 -0400
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AEB1B853;
        Mon,  2 May 2022 08:33:31 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-ed8a3962f8so4527319fac.4;
        Mon, 02 May 2022 08:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Y6XB2Cr0TBco5WX98Ze46NuWq5sLmSH3T0SPQmcQyC8=;
        b=7Av6iHT0mlyv9V9jumZFbUCB6rI8enUYvRNKbICZBd9UTSzEbSy8drwueQBX9o/WnR
         jBzW/kRD9zACO7XixDiPsaN/ufaFoa+5/Xo6/yCWEh6d/R5xJPkMyPYJ3QOQ4pOBmFia
         VvW87dhvt0Gv8X0bao4OaBSCMC9iJWN1FrvpfpH4WqMSDszA0YrbcXpqIGKwtIu5FTWL
         fdrByH4ajcQZAsaU8Cuuqf0LKMpbjHJdUp0Egon4gDrk/pAMVT78L88vg7jyk6p5pabd
         HJKctt/+uJ9x2/b5WsGr9HXPCjXoRKVj2uWDKNOzjv6/yaJNGQsoDPT+RtRypfjUgkpt
         s7xg==
X-Gm-Message-State: AOAM530GhTOpokWEzxMuDMLUKFrlwNHFDc4GJqpfEZ/TwmSwtEvOPMTW
        wOUlKMSiOkuwT6nnGZ2JxZbNAFv/9Q==
X-Google-Smtp-Source: ABdhPJwlQgJwwbkB6u3k/9PNaKLwUkrUeU1I+yXjAuvNMbaiSDuzVpd5HAs3vlI2j8keLTjoGFYQQA==
X-Received: by 2002:a05:6870:6005:b0:e6:515c:da5a with SMTP id t5-20020a056870600500b000e6515cda5amr4998476oaa.183.1651505610564;
        Mon, 02 May 2022 08:33:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s5-20020a05682003c500b0035eb4e5a6casm498626ooj.32.2022.05.02.08.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 08:33:30 -0700 (PDT)
Received: (nullmailer pid 1161766 invoked by uid 1000);
        Mon, 02 May 2022 15:33:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     michaelsh@nvidia.com
Cc:     linux@roeck-us.net, robh+dt@kernel.org, vadimp@nvidia.com,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20220430114905.53448-3-michaelsh@nvidia.com>
References: <20220430114905.53448-1-michaelsh@nvidia.com> <20220430114905.53448-3-michaelsh@nvidia.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: hwmon: add microchip,emc2306.yaml dt binding description.
Date:   Mon, 02 May 2022 10:33:29 -0500
Message-Id: <1651505609.441636.1161765.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, 30 Apr 2022 14:49:04 +0300, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Add basic description of emc2305 driver device tree binding.
> 
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  .../bindings/hwmon/microchip,emc2305.yaml          | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml:28:17: [error] empty value in block mapping (empty-values)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emcs205,max-state:description: None is not of type 'string'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: 'optional' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emc2305,pwm-channel: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maxItems' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emc2305,pwm-channel: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emc2305,pwm-channel: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emcs205,max-state: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maxItems' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emcs205,max-state: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emcs205,max-state: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emc2305,cooling-levels: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maxItems' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emc2305,cooling-levels: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emc2305,cooling-levels: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emc2305,pwm-max: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maxItems' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emc2305,pwm-max: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emc2305,pwm-max: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emc2305,pwm-min: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maxItems' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emc2305,pwm-min: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: properties:emc2305,pwm-min: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
./Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml: ignoring, error in schema: properties: emcs205,max-state: description
Error: Documentation/devicetree/bindings/hwmon/microchip,emc2305.example.dts:25.13-14 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/hwmon/microchip,emc2305.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

