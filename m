Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8B1C433F5
	for <linux-hwmon@archiver.kernel.org>; Sat,  2 Oct 2021 14:22:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0E5C61242
	for <linux-hwmon@archiver.kernel.org>; Sat,  2 Oct 2021 14:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233376AbhJBOYH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 2 Oct 2021 10:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233274AbhJBOYH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 2 Oct 2021 10:24:07 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5F1C0613EC;
        Sat,  2 Oct 2021 07:22:21 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso15344792otb.11;
        Sat, 02 Oct 2021 07:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rhAlgih+BTmjGMxKoPczehCr7Ohc6WZbR6tgamkRMbA=;
        b=C8w3DIhGQGOSiiTM2rOV81H4wizNcrmvXSAP3BktonYRsd7dM9+HGsFRXw3NLJ3iU5
         kxklHgwfBdirEf/3dcj1V2LEWc9K7HmutP53ohjy3+rtLOaLU90YxBtvvey3K32gPp6/
         81Ih3NA0R4DTbbbBMb+0F4BZOf1t5vxtqaCDtDrT/apYH11XX3cCFsv1GvfK/Tl+hxs4
         yBgLpDygkukYaESLfy7RmWGTyGTzLO5X4bWfVInmsDcUSXqHXu8I/e4bn0mbi8Pc3VCq
         Qiyi1JIazx1ozYSIyHjJLfIm6YPTUEbfyZVq+8y8e8Gzs9zilo7U6p+qn1EVkGoYpqga
         EyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=rhAlgih+BTmjGMxKoPczehCr7Ohc6WZbR6tgamkRMbA=;
        b=BLTIZLxIc8aa+UluQuoxdZjZ0Ac9k0GxqUjH0BY2JUh0k52/QB70bud8rzT0/fByKP
         9MXu5tXU3b2DeDSt53SQ2581WrMEQTfjv4Qh3chh7CS72S1hTNdfwNjisUlsz6Akz8Pr
         JA+WJDnz41aUCfPaJbQl9gap2vC/e7waVzkIRxoDFR8Zxnl4dXZtTgQmt4YSVqNrHKp8
         KXPzIRNQPk2yhvHkA37ZduHyGIK4RCelklaitjBkjQ/d6Ksm/iIlisA4ppO/8el6QDuR
         d4jG8bdI1DobsgT3NNGWhC9NqdqPwZaiLiuCNWzNmv78BCg+HUa58HCPPuuvZEmzd+r8
         RP9Q==
X-Gm-Message-State: AOAM530D3G9F1UgjiCg3fGpoK2TvmHOrUEkEX9CAbIgCuQv8wB5l69rC
        I+kZJDWVGHBNIdF/qQkwLlg=
X-Google-Smtp-Source: ABdhPJyfKa2wYvuN641mTeG6/6dNc/jIgHDzT/3E1c6BIzlFSqG41pUPDxJNGWzrmxk6q2r22eYTvA==
X-Received: by 2002:a05:6830:2706:: with SMTP id j6mr2847136otu.82.1633184540954;
        Sat, 02 Oct 2021 07:22:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l13sm809940otp.32.2021.10.02.07.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 07:22:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 2 Oct 2021 07:22:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 11/11] dt-bindings: hwmon: allow specifying channels
 for tmp421
Message-ID: <20211002142219.GC34532@roeck-us.net>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
 <3ff7b4cc57dab2073fa091072366c1e524631729.1632984254.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ff7b4cc57dab2073fa091072366c1e524631729.1632984254.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 30, 2021 at 09:19:49AM +0200, Krzysztof Adamski wrote:
> Add binding description for the per temperature channel configuration
> like labels and n-factor.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>  .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> index 47040ace4f73..0d4ea2209500 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> @@ -24,12 +24,49 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
>  required:
>    - compatible
>    - reg
>  
>  additionalProperties: false
>  
> +patternProperties:
> +  "^input@([0-4])$":

Was there agreement on "input" ? It is a somewhat odd name for a temperature
sensor. If that name can be used to distinguish child sensor types, it might
make sense to have a well defined name to state that this is a temperature
sensor.

> +    type: object
> +    description: |
> +      Represents channels of the device and their specific configuration.
> +
> +    properties:
> +      reg:
> +        description: |
> +          The channel number. 0 is local channel, 1-4 are remote channels

Which of the supported chips has 4 remote channels ?

> +        items:
> +          minimum: 0
> +          maximum: 4
> +
> +      label:
> +        description: |
> +          A descriptive name for this channel, like "ambient" or "psu".
> +
> +      n-factor:

n-factor or "ti,n-factor" ? The unit is chip specific, after all.

> +        description: |
> +          The value (two's complement) to be programmed in the channel specific N correction register.
> +          For remote channels only.
> +        items:
> +          minimum: 0
> +          maximum: 1

Is this the correct value range ? The value range (in integer form) is
-128 .. 127 (or 0 .. 255 as unsigned), not 0..1.

> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
>  examples:
>    - |
>      i2c {
> @@ -41,3 +78,32 @@ examples:
>          reg = <0x4c>;
>        };
>      };
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      sensor@4c {
> +        compatible = "ti,tmp422";
> +        reg = <0x4c>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        input@0 {
> +          reg = <0x0>;
> +          n-factor = <0x1>;
> +          label = "local";
> +        };
> +
> +        input@1 {
> +          reg = <0x1>;
> +          n-factor = <0x0>;
> +          label = "somelabel";
> +        };
> +
> +        input@2 {
> +          reg = <0x2>;
> +          status = "disabled";
> +        };
> +      };
> +    };
> -- 
> 2.31.1
> 
