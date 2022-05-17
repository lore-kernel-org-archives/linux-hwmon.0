Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A60C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 16:46:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345609AbiEQQqb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 12:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351142AbiEQQq3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 12:46:29 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EBBD4ECE3
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 09:46:27 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-f1d5464c48so398567fac.6
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 09:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t3qHCwZV623vC12oG6z+kAginoyia2Zk4mh6iCBMIDc=;
        b=ksHJm0wjfjb1tKesUN9BaXXRaBOHkDAlZa3HfH9//bMeeIQHlqsXEJQyzRyWUpaBI7
         T0an+OKxeFYXJ8xFw/i4DTR3NjELlGWCc4AyfqpcOor2O16zcnB+WVr9oo7kGQybNgBZ
         nZkUQY78+cHL52fKUdL2LvKb/9+XttU7ma4113I3P0rOoI+fDdpHiWZmCpPAfFD4AIGi
         PuOPxvRCq+WczBZQSwhDFXiueJgNlKoDTJDLxwxsZIrajHJPLIaGMu1wn+G3q1vIv0AL
         1ZM4aQoFgSiSO3aP6F/Q4ObgtSNnivv6y1xNR2ZRw/PnIJIDa+uCPCz9xVtpoTxggR17
         y/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=t3qHCwZV623vC12oG6z+kAginoyia2Zk4mh6iCBMIDc=;
        b=BTsMCdjWeER8yyggi7neNrBv+URBclNKShd9gAdu2BICOn8SHxYdQMYF5CWIG4Bxay
         cg3s5wizNWZEzFH2r5nQS0TiLrxirhj8y3Bpoy7GgwGpz0QwswCcAYfodS8AQQQIhjlq
         SfvPKhsLCY44t9FX6s0LUK/FyIQpUSwgpGKPeCNJuMBGNnXgXfFmD/CERPbqV4YPaRU0
         qdDX5lz1SJYMMdDRlJPvKMlaWQy2AFMDP+Ath5DmgYSjFkCN8i3JCNZsL5lCsZ0e6mWP
         vh3nVLdMMl2nQk/xGEtAEzKxowwkF3LIkG1g8dxHjkar6GtXrI/dNSELliKdWKD+hDPq
         uhNw==
X-Gm-Message-State: AOAM532y39W6O/SvUQ4B1tLK9mhfoMC3G17ycjOx98q0pQC8J8d23rXi
        Pdu6MMLfnWXJnS4X16jk2oU=
X-Google-Smtp-Source: ABdhPJw5xG5TFJZSv5qYLiUOebk3xTsmib3eZTXgVAAzBB9OaSn0um+t54OP8LZPveh1q7LKIsNaIg==
X-Received: by 2002:a05:6870:14c5:b0:e9:3ce0:47e0 with SMTP id l5-20020a05687014c500b000e93ce047e0mr13135346oab.274.1652805986295;
        Tue, 17 May 2022 09:46:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m12-20020a4aedcc000000b0035eb4e5a6bbsm29742ooh.17.2022.05.17.09.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 09:46:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 17 May 2022 09:46:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Holger Brunck <holger.brunck@hitachienergy.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: lm90: add
 ti,extended-range-enable property
Message-ID: <20220517164624.GA457750@roeck-us.net>
References: <20220517135614.8185-1-holger.brunck@hitachienergy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517135614.8185-1-holger.brunck@hitachienergy.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, May 17, 2022 at 03:56:13PM +0200, Holger Brunck wrote:
> Some devices can operate in an extended temperature mode.
> Therefore add a boolean ti,extended-range-enable to be able to
> select this feature in the device tree node. Also make sure that this
> feature can only be enabled for the devices supporting this feature.
> 
> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Thanks,
Guenter

> ---
> changes for v4: 
>    - use "if:not:then" instead of "if:else"
> 
>  .../bindings/hwmon/national,lm90.yaml         | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> index 48b7065798b0..b04657849852 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> @@ -53,10 +53,29 @@ properties:
>    vcc-supply:
>      description: phandle to the regulator that provides the +VCC supply
>  
> +  ti,extended-range-enable:
> +    description: Set to enable extended range temperature.
> +    type: boolean
> +
>  required:
>    - compatible
>    - reg
>  
> +allOf:
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - adi,adt7461
> +                - adi,adt7461a
> +                - ti,tmp451
> +                - ti,tmp461
> +    then:
> +      properties:
> +        ti,extended-range-enable: false
> +
>  additionalProperties: false
>  
>  examples:
