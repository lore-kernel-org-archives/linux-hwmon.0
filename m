Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1317C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 13:10:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F727610D1
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 13:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbhIWNM1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Sep 2021 09:12:27 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:33602 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbhIWNM1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Sep 2021 09:12:27 -0400
Received: by mail-ot1-f47.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso8525813otu.0;
        Thu, 23 Sep 2021 06:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=lZyIUxf6Lbe5KXI6O5k0X1qWDOUUH9A99p9KDIfbJII=;
        b=N0NxQwMsCRa+3xAIo+Gd3uKanQKiO8TJvD9D+u7vxz29hlteOHnuBKlU/SRRFsUz0p
         j5ztad6rvsD+Ksrby9T/hVKbz7LMi/3ou9xUtoQfmkz7hI/vjxBLmnUzA2397jDVi0FE
         En5a5iBL+Q7x/ps6vs5RcOSHNm/pkpk10hi1BlbzHR73EycfP6n9PKfXIsnpQWec7JdT
         XVd5nEtrofNzUKS2OaCSFQb17Vyu0vCRz5XgqrkZeCm5U+R5tZvPBuTwrGSsWnW0kUJ2
         C5wCcUDZqMOz8MulSGmzBBNZNa71xGkQ5HJa9QJc1CItwcainEwyie6Ke0IQye2HT5UV
         Oo1w==
X-Gm-Message-State: AOAM533bjJZIUR9DOyg/9RIEK2uhFlJEtitffURBWJkI2Dcnm4yeybDT
        9xtrOiSOAqa+LhYqoqE0Mg==
X-Google-Smtp-Source: ABdhPJyVuulxabDlg3uru1GRD3XQ0SIFmj++TrmUPohVTwFPZ50EHA4FeCgJq1h1B+7Ha+psk47b9w==
X-Received: by 2002:a05:6830:2445:: with SMTP id x5mr4354977otr.10.1632402655206;
        Thu, 23 Sep 2021 06:10:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v2sm1356923ooh.28.2021.09.23.06.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 06:10:54 -0700 (PDT)
Received: (nullmailer pid 2861275 invoked by uid 1000);
        Thu, 23 Sep 2021 13:10:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
        devicetree@vger.kernel.org,
        Johannes Pointner <johannes.pointner@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
In-Reply-To: <20210922233901.1871274-1-linus.walleij@linaro.org>
References: <20210922233901.1871274-1-linus.walleij@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: hwmon: Convert NTC thermistor to YAML
Date:   Thu, 23 Sep 2021 08:10:53 -0500
Message-Id: <1632402653.551768.2861274.nullmailer@robh.at.kernel.org>
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.example.dt.yaml: ncp15wb473: $nodename:0: 'ncp15wb473' does not match '^thermistor(.*)?$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1531471

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

