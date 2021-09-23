Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D5CC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 16:41:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D38160F41
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 16:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbhIWQnH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Sep 2021 12:43:07 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:34772 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233541AbhIWQnG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Sep 2021 12:43:06 -0400
Received: by mail-ot1-f45.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so3635560otb.1;
        Thu, 23 Sep 2021 09:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zK5aaLbOqNMgD2uk1mXBXU6R8gwUSZbuznuqk9+2icg=;
        b=O3mklFipkvgF51IoqotauVmpWfGw/fGG1pbgCybvmdFwVf7Vm2wMq/RpXpLN7mJWI5
         M3JTdTJ5fAzmzbHN5xopGCQZ5KwRdBeTu0/IKFl1tqmEK2NCNm7+D8QM7gbiEiZOkwdf
         o8fa8lj8lUk4m2UAVQy8Unl6Nq8k1Ihaw8TZkKMaC4LlNOFNeD2cOlVblIyI4UZFw8Vk
         wSygeXWJ9CxZoqVmTl6zqR0/REAaM8modx/AbKOQmxXePS+4og7DG3VlOxz5iMyVjO3l
         YPX2JJM6PIliP2RjDpt40cbKsVsyktSd/Kh8mgKFgp1DIhaBIVrifZPqQc9Avu3NZrED
         ddMQ==
X-Gm-Message-State: AOAM531HTTcFQYp+ZRSdxkKrYSW6WD78GGzuxss1Cmxn/EPBA1oSwG0B
        5IQTjCyIZIGDtKperiVGgYKf6Wsckg==
X-Google-Smtp-Source: ABdhPJykutT3S7hJsCKtUdgjGNccAYmpHCljPRxKL8uru8G+C+53Utn+lr7BXt3QmNSQQ1/Dz01zlQ==
X-Received: by 2002:a9d:4694:: with SMTP id z20mr5233830ote.379.1632415294458;
        Thu, 23 Sep 2021 09:41:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 14sm1424571otl.50.2021.09.23.09.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 09:41:33 -0700 (PDT)
Received: (nullmailer pid 3140814 invoked by uid 1000);
        Thu, 23 Sep 2021 16:41:32 -0000
Date:   Thu, 23 Sep 2021 11:41:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Guenter Roeck <linux@roeck-us.net>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Jean Delvare <jdelvare@suse.com>,
        Johannes Pointner <johannes.pointner@gmail.com>,
        linux-hwmon@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3] dt-bindings: hwmon: Convert NTC thermistor to YAML
Message-ID: <YUyuPAfE2Jb5qBQZ@robh.at.kernel.org>
References: <20210922233901.1871274-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922233901.1871274-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 23 Sep 2021 01:39:01 +0200, Linus Walleij wrote:
> This converts the NTC thermistor DT bindings to YAML. Some care had to
> be taken since I had to add some illustrations to make the connection
> layouts graspable.
> 
> Cc: Javier Martinez Canillas <javier@dowhile0.org>
> Cc: Johannes Pointner <johannes.pointner@gmail.com>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Rebase on v5.15-rc1
> - Drop comment reference to thermal-sensor.yaml
> - Keep the oneOf rather than using an enum for the compatible:
>   I can't figure out how to make deprecated work for enums?
>   https://lore.kernel.org/linux-hwmon/CACRpkdZDLSA5YJtc3XCkfPZUNqo1MOWLBwVDGQ4vN8cDXD3aYg@mail.gmail.com/
> ChangeLog v1->v2:
> - Realize I need to CC devicetree@vger.kernel.org on this.
> - Fix Javier's mail address.
> - Drop Naveen's mail (bouncing)
> ---
>  .../bindings/hwmon/ntc-thermistor.yaml        | 141 ++++++++++++++++++
>  .../bindings/hwmon/ntc_thermistor.txt         |  44 ------
>  2 files changed, 141 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
> 

The error introduced can be fixed in a separate patch, so:

Reviewed-by: Rob Herring <robh@kernel.org>
