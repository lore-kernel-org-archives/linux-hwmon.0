Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D783C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:57:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF0CF60FC3
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:57:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243411AbhJOW7f (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Oct 2021 18:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243393AbhJOW7e (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Oct 2021 18:59:34 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48363C061570;
        Fri, 15 Oct 2021 15:57:27 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id d21-20020a9d4f15000000b0054e677e0ac5so26285otl.11;
        Fri, 15 Oct 2021 15:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nJBtwx/eNmqIudoWs3/AEQekxNYHKKnfv5N6vimsMuo=;
        b=pDhPyhmUb1pSx81TY2JwkBxOkHH/rEiaDOrevlvZYZ0AqOpYYZ+AiCw+5i0eEoAcrG
         eMP7hLo2HfRq9Qqq7p+4L1oLiOnP8QKL9ApeKRxoNX5IIrdhTSuDIwZoOMVyL6Mh9MHg
         fP74iBbx9N0Tqw+v3JLsBrl2VbSWCrawhI06twDjPTqF8f3O5/fznpjQ2Ueon5lnPcIX
         VBZeEUw5G+Eaclmw8IhF36K7ffjVP3pob+KEOlGGo7qle3PZ5IIVH3Gv2ZDmgEM+/ma7
         pbOFpRPZEn75QEgcubIsRso0bH7ITVU91RWw8+vXE5Ukqc9UnKcc+PDchWTSC67ZpXhJ
         lk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=nJBtwx/eNmqIudoWs3/AEQekxNYHKKnfv5N6vimsMuo=;
        b=b36NtexptVWw9h8E4UhXjsFSuCcF3Mf4cyonNRYdWPEGACeUy5UorqlYB+nR9BhJi2
         EbK0C5zWsI5iXtFV615TFz9LYt87uTqHRbwvDOc8DrrI0XGdPsO8C63xeDrDlz4zTxbw
         4xNBJmVMAWa6IU6x2shp4yB/eluG2Nr/tUxa8cIjsIQGwnM8NTUpMpd/vKHwRfpgC4/t
         zuxPWAkfGCowmJSHdakTte6Bj86IkstuqKzjJA/84Rm/DSxjOI81BdGxRxYrAe28+/tp
         Fls6XnqQ3UUsRTI69gEPL6/OA2/6QD4mWdtHNqATmMPYnM7eq1Jj61p4pr3IGrDA2uWQ
         +CSg==
X-Gm-Message-State: AOAM532A+58o9Y/URTZAsQ2x6M27SznCmHY+liRbeP9vyzmCuRCvCeJg
        7E9zq2wkSZGuElwY1Ta8Ako=
X-Google-Smtp-Source: ABdhPJwSQfjWicPFTJzdImVCc3FRp/7/lKSH0hpMnuZjW8VVAXmwIP/1vIMTLYZ4NWOIta6LfuI4aQ==
X-Received: by 2002:a9d:725e:: with SMTP id a30mr10160917otk.62.1634338646712;
        Fri, 15 Oct 2021 15:57:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f10sm1470054otl.57.2021.10.15.15.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:57:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 15 Oct 2021 15:57:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 9/9] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <20211015225725.GA1486397@roeck-us.net>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
 <d1721a50efc0f88728614b5b07c0d9332ae4971c.1634206677.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1721a50efc0f88728614b5b07c0d9332ae4971c.1634206677.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 14, 2021 at 03:11:49PM +0200, Krzysztof Adamski wrote:
> Add binding description for the per temperature channel configuration
> like labels and n-factor.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, again after 's/^  / /"

Guenter

> ---
>  .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> index 47040ace4f73..36f649938fb7 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> @@ -24,12 +24,50 @@ properties:
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
> +  "^channel@([0-3])$":
> +    type: object
> +    description: |
> +      Represents channels of the device and their specific configuration.
> +
> +    properties:
> +      reg:
> +        description: |
> +          The channel number. 0 is local channel, 1-3 are remote channels
> +        items:
> +          minimum: 0
> +          maximum: 3
> +
> +      label:
> +        description: |
> +          A descriptive name for this channel, like "ambient" or "psu".
> +
> +      ti,n-factor:
> +        description: |
> +          The value (two's complement) to be programmed in the channel specific N correction register.
> +          For remote channels only.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        items:
> +          minimum: 0
> +          maximum: 255
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
>  examples:
>    - |
>      i2c {
> @@ -41,3 +79,32 @@ examples:
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
> +        channel@0 {
> +          reg = <0x0>;
> +          ti,n-factor = <0x1>;
> +          label = "local";
> +        };
> +
> +        channel@1 {
> +          reg = <0x1>;
> +          ti,n-factor = <0x0>;
> +          label = "somelabel";
> +        };
> +
> +        channel@2 {
> +          reg = <0x2>;
> +          status = "disabled";
> +        };
> +      };
> +    };
