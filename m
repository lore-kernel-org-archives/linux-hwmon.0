Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80434C76196
	for <linux-hwmon@archiver.kernel.org>; Fri, 31 Mar 2023 18:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbjCaSQY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 31 Mar 2023 14:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbjCaSQX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 31 Mar 2023 14:16:23 -0400
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029C3DBF8;
        Fri, 31 Mar 2023 11:16:23 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-17aa62d0a4aso24064766fac.4;
        Fri, 31 Mar 2023 11:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680286582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IKPA0ADOBppfJTT2W2Ch4plvhP4oOyoQ3vJ9If7+rE=;
        b=C03V7OKKSaj4leAzfzpH/Ek9DiUU7THeouEmHQspISF0SHF90obYh9m4Cq2cwKSwgA
         37A883yrg0PSMOKS3cO0Hqfq0fxOjnVPytolvywW+6pN+EsDkE3dIn/b6ClwBQH50tIo
         DOx7P0XnNls7n/urW2HqGqMcan1Hpj+olmyOxcyxAPM9e0x7mAx8DS6ZNkGZI/bSX5CG
         S0KOCHYm3tJ98elFPRt5bc3J0yw41SsQiQsL4t4rmBognS5EKKmL5Riv87cahWIuXqBt
         2MOrtxVDonODJMjkMUAuzSXEAqkfkGfiQIuV1hFQDKdR715eq9SRJbPHtzNHlxjpwZck
         3hPA==
X-Gm-Message-State: AAQBX9d2ciIlq7h7hsk4VqItdqauWA005vtvwQ1KHEcSA6Rf1eFBMBeX
        CF0daBnRtfu3prPv/NSJhw==
X-Google-Smtp-Source: AKy350bbJ1oniqfGXQupv7Am9GdmIkPkG2rGdl3Nxbu7FwzW8n/5xV6zuPgFcSRgI+p9mG38HNZYBQ==
X-Received: by 2002:a05:6871:70c:b0:17e:f313:be68 with SMTP id f12-20020a056871070c00b0017ef313be68mr16700497oap.37.1680286582313;
        Fri, 31 Mar 2023 11:16:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s15-20020a0568301e0f00b006a1508d348dsm1423158otr.22.2023.03.31.11.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 11:16:21 -0700 (PDT)
Received: (nullmailer pid 1883565 invoked by uid 1000);
        Fri, 31 Mar 2023 18:16:21 -0000
Date:   Fri, 31 Mar 2023 13:16:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lakshmi Yadlapati <lakshmiy@us.ibm.com>
Cc:     krzysztof.kozlowski+dt@linaro.org, linux@roeck-us.net,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        joel@jms.id.au, jdelvare@suse.com, andrew@aj.id.au,
        devicetree@vger.kernel.org, eajames@linux.ibm.com,
        robh+dt@kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: trivial-devices: Add acbel,fsg032
Message-ID: <168028658037.1883248.3391058874077647984.robh@kernel.org>
References: <20230322114623.2278920-1-lakshmiy@us.ibm.com>
 <20230322114623.2278920-3-lakshmiy@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322114623.2278920-3-lakshmiy@us.ibm.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On Wed, 22 Mar 2023 06:46:20 -0500, Lakshmi Yadlapati wrote:
> Add new Acbel FSG032 power supply to trivial devices.
> 
> Signed-off-by: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

