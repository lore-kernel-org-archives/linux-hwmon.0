Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5460BC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 May 2022 01:54:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345183AbiEZByV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 21:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238794AbiEZByV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 21:54:21 -0400
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0A3A76E7;
        Wed, 25 May 2022 18:54:20 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-f2cbceefb8so643926fac.11;
        Wed, 25 May 2022 18:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rlq8AUIcgToYif8G3Np0hH7cuaoTbNUl6Zjv3F+sy3I=;
        b=W8MhFpDfowRJ8IIbXOFjFGNY/WVy+skbPKsp6M0GVdDIPl84XZZs1ZrzHep4Df/raS
         elz1AdQjltXdmIIr7HIXzI6xqXNPynkRVnT4VjT3iSe89mfO+PgR3fbLdNIfYozxX8I0
         HizNHl2XJX4pBvNo6diV2Cgxl1qSohnwiwz2Fp2feT+Jpbg2GpkhD+8LSK8jdmiQpZhg
         tCTQoh3ohE1nTZVORufDG5QRjEkg4OFExMqS1100mZmTbvNo8XbdkSdlKTjkeo7y3IbN
         TZPMgfkTKcppHVQyXQICMp3u9CAEOCFgpziOqWifjC9HHYhYs6vGr5jJ67PbDtqp4AAz
         mG/g==
X-Gm-Message-State: AOAM532lpGmqz1NUN0CD5aRQs7SqGGam2yqHOZE2oa3PSKQbXeTNt39V
        HYQh9QQCUQKrPMo6I8TS42CGMmwIyw==
X-Google-Smtp-Source: ABdhPJwOWNSYhdHxg3QamWotUPArm8ukNBdBRKLtF95UaowkJc2uuDjT/untDurwg6uN7GwDGzWtlw==
X-Received: by 2002:a05:6870:3512:b0:f2:6dfc:cd5b with SMTP id k18-20020a056870351200b000f26dfccd5bmr29939oah.100.1653530059840;
        Wed, 25 May 2022 18:54:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m1-20020a9d6081000000b0060b128b935csm125056otj.39.2022.05.25.18.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 18:54:19 -0700 (PDT)
Received: (nullmailer pid 2891655 invoked by uid 1000);
        Thu, 26 May 2022 01:54:18 -0000
Date:   Wed, 25 May 2022 20:54:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     slawomir.stepien@nokia.com, krzysztof.adamski@nokia.com,
        linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jdelvare@suse.com,
        robh+dt@kernel.org, przemyslaw.cencner@nokia.com,
        devicetree@vger.kernel.org, alexander.sverdlin@nokia.com
Subject: Re: [PATCH 1/7] dt-bindings: hwmon: Add compatible string for
 ADT7481 in lm90
Message-ID: <20220526015418.GA2891602-robh@kernel.org>
References: <20220525073657.573327-1-sst@poczta.fm>
 <20220525073657.573327-2-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525073657.573327-2-sst@poczta.fm>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 25 May 2022 09:36:51 +0200, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> This will allow binding the driver with the device from the device tree.
> 
> This device can work in extended temperature measurement mode, so add it
> also to the list of devices that support 'ti,extended-range-enable'.
> 
> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
> ---
>  Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
