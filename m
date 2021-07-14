Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E65BC11F66
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jul 2021 15:50:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 526206128D
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jul 2021 15:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232318AbhGNPwy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Jul 2021 11:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239625AbhGNPwy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Jul 2021 11:52:54 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84992C061760
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jul 2021 08:50:01 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id u13so4355723lfs.11
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jul 2021 08:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HuXyhV/rL3PyLi43cKtfEQ2MV0dm3XNpKrIgVwhAo/g=;
        b=O+eL5JfgUWl3FK4aDNAd+bfpq+d1EBxA6jE62lV7yCdUkQ3J1+i/SIxkjuNanOCJoK
         4Xc+nH+p0h/QuPmLQPDk44OT5tdfacRRetqXWOEe//JPJG1VwK0vCmXBG8uAmSLBWm1X
         GGC/H8p/3DARC1NznBRiF2PhLmOhPZuM+E8q6B/LysmqA3Mgo7fymui7wtm8ahIXbwr2
         /eaz6ulg9XGKakQMXlUsFwItaaBMxhQSBb0Mv5Krh3puatHRztJLiF6xkw4tZkJp0Mmd
         85q+amkFusTapVyIDFGIvYXT2fph+RsYRRiWtuV05ChZxfqcAPDSKKCd8YFjBCZRjwqN
         XAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HuXyhV/rL3PyLi43cKtfEQ2MV0dm3XNpKrIgVwhAo/g=;
        b=rKnzwIaipz18Sc7OOE7KVitPIaVol2SPDGoYdz/MUq9cosdnYnyKO/WDCHIuBQaJZS
         tjXtiop1HiN8upe2TyGYzlhzdzL2oB+r40rF33Hd8ijO4r7iO7/c+ye2n+4V9l7qrXML
         rSl3mILXBg+zFBWSSE5vXn1rKz3qyg6gGmXnhkSV1sWhud/bZa08/pnwiQE5xIpjpImm
         k2YRGwLKjZ63fvgFcXmoaK9f34HMzmrf3rnmWGmQXj0drOFgOfiyzjTo1amdGcMY/hki
         ilPgwA6wR/vqDedJylxy4Xiz7kB1MCHbqsE/x8x3PgggFX2KdmDWFFQBnQxKLxjjOYHb
         GUfQ==
X-Gm-Message-State: AOAM533D8Knq6aZ8Gxj5xZO3ZqYnLEZR+oZcI6phzHsfhYaepYpW6T5C
        oR6aC+EWsVijvCLJunmCog5JvVHKDU/f9eTOf4waN0PIdEou7Q==
X-Google-Smtp-Source: ABdhPJymcEfAeRu0lBLQ1JQvUd10cmfracwv0jyItvjzzrZi+zJAyh/PuxFsLdriHMDsGDBzpRKTs3YiNdx8WsPuNOQ=
X-Received: by 2002:a05:6512:3696:: with SMTP id d22mr5358270lfs.586.1626277799889;
 Wed, 14 Jul 2021 08:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210703173456.4002549-1-linus.walleij@linaro.org> <20210712145749.GA1911897@robh.at.kernel.org>
In-Reply-To: <20210712145749.GA1911897@robh.at.kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Jul 2021 17:49:48 +0200
Message-ID: <CACRpkdZDLSA5YJtc3XCkfPZUNqo1MOWLBwVDGQ4vN8cDXD3aYg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: hwmon: Convert NTC thermistor to YAML
To:     Rob Herring <robh@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Johannes Pointner <johannes.pointner@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 12, 2021 at 4:57 PM Rob Herring <robh@kernel.org> wrote:
> On Sat, Jul 03, 2021 at 07:34:56PM +0200, Linus Walleij wrote:

> > +  compatible:
> > +    oneOf:
> > +      - const: epcos,b57330v2103
> > +      - const: epcos,b57891s0103
> > +      - const: murata,ncp15wb473
> > +      - const: murata,ncp18wb473
> > +      - const: murata,ncp21wb473
> > +      - const: murata,ncp03wb473
> > +      - const: murata,ncp15wl333
> > +      - const: murata,ncp03wf104
> > +      - const: murata,ncp15xh103
>
> All these can be 1 enum.

Yes that works fine.

> > +      # Deprecated "ntp," compatible strings
> > +      - const: ntc,ncp15wb473
> > +        deprecated: true
> > +      - const: ntc,ncp18wb473
> > +        deprecated: true
> > +      - const: ntc,ncp21wb473
> > +        deprecated: true
> > +      - const: ntc,ncp03wb473
> > +        deprecated: true
> > +      - const: ntc,ncp15wl333
> > +        deprecated: true
>
> And these too.

How? I'm lost here.

This:

  compatible:
    enum:
      - epcos,b57330v2103
      - epcos,b57891s0103
      - murata,ncp15wb473
      - murata,ncp18wb473
      - murata,ncp21wb473
      - murata,ncp03wb473
      - murata,ncp15wl333
      - murata,ncp03wf104
      - murata,ncp15xh103
      # Deprecated "ntp," compatible strings
      - ntc,ncp15wb473
        deprecated: true
      - ntc,ncp18wb473
        deprecated: true
      - ntc,ncp21wb473
        deprecated: true
      - ntc,ncp03wb473
        deprecated: true
      - ntc,ncp15wl333
        deprecated: true

Yields this:

uamel.yaml.scanner.ScannerError: mapping values are not allowed here
  in "<unicode string>", line 81, column 19:
            deprecated: true
                      ^ (line: 81)
make[3]: *** [../Documentation/devicetree/bindings/Makefile:20:
Documentation/devicetree/bindings/hwmon/ntc-thermistor.example.dts]
Error 1
make[3]: *** Deleting file
'Documentation/devicetree/bindings/hwmon/ntc-thermistor.example.dts'
../Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml:81:19:
[error] syntax error: mapping values are not allowed here (syntax)

This does not happen with oneOf const:s.

Yours,
Linus Walleij
