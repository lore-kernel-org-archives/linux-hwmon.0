Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A60C7619A
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Apr 2023 15:00:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjDLPAh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Apr 2023 11:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjDLPAg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Apr 2023 11:00:36 -0400
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3515E6A;
        Wed, 12 Apr 2023 08:00:28 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id v9-20020a05683024a900b006a42896c456so598219ots.8;
        Wed, 12 Apr 2023 08:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681311628; x=1683903628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBMZhaY83xymj5F7/BlB7Ny2DX8/Qy/kIs0QCA62b9Q=;
        b=gZu3a73tSctB3gIXYZCDqOWWSjlQHMtuaCdN1WIl2lv74zRBOMzxnmfKGSJsacTiPZ
         E2jhRJAEJ3BH/m0C8Nmrv0SyLCWVHgRvPiEqeGUssFcwP9Q+G2AfmRHcMYHArLHBgNGd
         BU0PvI0FPmYAGGgenqOj6KT3UpxE84EeiLLJLIKfOyqhmra0LK07xFgIsQOe+A+GIN/Q
         7guQPIOiaz1QvRBj7XlnXzdZVYcb60gQ12AKhAD1nWjlQ3RyYe3hXtxDqdmbSTXQ9ybx
         FbyAiBjvY5I5F2n/TR1gX+Agh7yRMncsugMthwKO20XT4J+vcJu2JiyjkoiqfNCwswOv
         bP6g==
X-Gm-Message-State: AAQBX9fcMUtT+h0SGhK5d5r/zfwYHJdmB1Lh8GaOKJnvST7fkVxMfRdF
        p7EUJllh4WJKQS2925ToiQ==
X-Google-Smtp-Source: AKy350ahlmVSiwp7FG1xKGZNzu7vJjWneYgychGJ+F3aGGp0Y7040kEhN0CWo57q96lllDT4cSrbbw==
X-Received: by 2002:a9d:6ad9:0:b0:69c:dd41:563b with SMTP id m25-20020a9d6ad9000000b0069cdd41563bmr1397566otq.15.1681311628006;
        Wed, 12 Apr 2023 08:00:28 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v21-20020a9d5a15000000b00684152e9ff2sm6605779oth.0.2023.04.12.08.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 08:00:27 -0700 (PDT)
Received: (nullmailer pid 2361155 invoked by uid 1000);
        Wed, 12 Apr 2023 15:00:26 -0000
Date:   Wed, 12 Apr 2023 10:00:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: ina2xx: add supply property
Message-ID: <168131162651.2361092.17375907489297100764.robh@kernel.org>
References: <20230407160508.20479-1-clamor95@gmail.com>
 <20230407160508.20479-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407160508.20479-2-clamor95@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On Fri, 07 Apr 2023 19:05:07 +0300, Svyatoslav Ryhel wrote:
> Add vs-supply property.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

