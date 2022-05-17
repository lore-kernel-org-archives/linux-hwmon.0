Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8699C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 12:51:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346456AbiEQMvv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 08:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346440AbiEQMvu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 08:51:50 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D50621814
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 05:51:45 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id r1so22119874oie.4
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 05:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=apVC+qm/pEqZZpWyHXGaxYps+2zdyhj6TGnTOt481ds=;
        b=fWrfEzbYtvT/6/GyCZHl6C0vq2adojeNWdre0+CCOps/XDP/+pDJusvHCrgQXWh1bH
         w7JQH5+/ydv2HYvZOConeMNu29L/hklwy8gRy9kbzS+R7hkFVdJH5kdgFUlpjWW6AJqe
         WOOBERSEPipIa24htuhJmqpu+OPSbNZagF391ndwhOBIyCQP8Q5Jvlk3XdyZFr5ImdW9
         nLmuIFvhl1B5cedFE1tF9qUhJ44sV/44hvBIwVvf64BofXLEuU9dRFOLOTxKyS1hvtg6
         BBw/rAlzJWAbRYP0IKE1nRR06c9OkFcq2SoHKtG4nlXDM58AlbhbGrGsdrISC62NDF4q
         izxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=apVC+qm/pEqZZpWyHXGaxYps+2zdyhj6TGnTOt481ds=;
        b=rQwvTiyl/tgh3+cTLQtnFye0usRZXb2hOLFZBP2Y/t+fKn+mStDr4jB3qO76ZYs4Zu
         SRtCe+UPWAMCKGnXfY72daMlRsAnqcefm/TO0+DLP/m3BJKAml2mzJsYf44mEwKBPe7H
         OpxQey+ND+qQ8H2aU5pWEmYJ2+JifzA3RoYBhdVJGNfq/LNncASgeufsGatbJzsJcxRl
         7Nbssyh9d3CaU7MRFjFPigMUdCoUKf49BT984MfemsT2v1vpHBuqmp8FbfzwFuYeh48x
         kOBhxTe2RTy54gkecqP7d7EP56X5xMlIC8Ank2wRTtcMxJ5znzA/7E8XZWDHDclhcb07
         TGCw==
X-Gm-Message-State: AOAM5310MIPNYKnsS9YelU39SAV9dVjzMMWBHPlcULivT1mOjXtJE5Qq
        G8YuUF83gCsOh/vmbXJ7zlBS0umQ07BEVA==
X-Google-Smtp-Source: ABdhPJw9y355bKvhD3Mgttr3t8sQU2y4prx1XCpRgVpRTub4dpWu8JV1aXaxVFAct1oXHsoh3b09vw==
X-Received: by 2002:a05:6808:1693:b0:2f7:2aac:b47f with SMTP id bb19-20020a056808169300b002f72aacb47fmr16076826oib.104.1652791905058;
        Tue, 17 May 2022 05:51:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q84-20020acaf257000000b00326cb6225f8sm4754748oih.44.2022.05.17.05.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 05:51:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 17 May 2022 05:51:43 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Holger Brunck <holger.brunck@hitachienergy.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [v3 1/3] dt-bindings: hwmon: lm90: add missing ti,tmp461
Message-ID: <20220517125143.GA3521446@roeck-us.net>
References: <20220517075626.16809-1-holger.brunck@hitachienergy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517075626.16809-1-holger.brunck@hitachienergy.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, May 17, 2022 at 09:56:26AM +0200, Holger Brunck wrote:
> This sensor is already supported from the driver, but is missing in the
> list of compatible devices in the yaml file.
> 
> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Thanks,
Guenter

> ---
> changes for v3:
>   - new in this patch serie
> 
>  Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> index 30db92977937..48b7065798b0 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> @@ -34,6 +34,7 @@ properties:
>        - nxp,sa56004
>        - onnn,nct1008
>        - ti,tmp451
> +      - ti,tmp461
>        - winbond,w83l771
>  
>  
