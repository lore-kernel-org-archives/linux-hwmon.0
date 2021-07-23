Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95D6C4338F
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Jul 2021 21:44:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C763C60EB6
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Jul 2021 21:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbhGWVDg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 23 Jul 2021 17:03:36 -0400
Received: from mail-il1-f177.google.com ([209.85.166.177]:38517 "EHLO
        mail-il1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbhGWVDg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Jul 2021 17:03:36 -0400
Received: by mail-il1-f177.google.com with SMTP id h18so2838032ilc.5;
        Fri, 23 Jul 2021 14:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jauEAPQML28vHg37ymcxFCbm1rxtiHmWx2icExufkOQ=;
        b=jMjzAE3IKgVJ0NjQ3ErkDt08IrbAkAu33F2d4hCQJqCfDbX6RKujuN/e6kD9mQT3Y8
         0WavnXnHSz/viLsf1gQqoi4PaofkfPup/ZoZiufQlGNvF6EUcRg1yYplagZgB1StBjqs
         7/dX0rAvZXA/pZYhR2mCV/68H09h1aJ6xS1qdlLjrN1302MiXVgbQDK5TP23JTLG3WEy
         +bl8oym4LzEqtU5Bm1Xg0smqwaoh7dGmlpJpvFLVwoCZ1/yQUOq8Khm4eUNJ2Fb+6InV
         fxE8Nc2gdHnX0i4ZxgiyKRgJF3Zd0rFenbJKN6uSQP5MtsTNOrVIzmbP4DvFnA0qOkmE
         FfDw==
X-Gm-Message-State: AOAM533Cp3I4t9W66Lk+SdRZLrTYDhraoygTmioc1t/xShUXPqVWCGRG
        6V09wxGf4yqe0Y7UStgH+Q==
X-Google-Smtp-Source: ABdhPJxO8Y0NrOIFnYw/XKpO/cYyXDnNB9L9gRiX1KzFxwgkWiGc+fz9tdBjIE5ilKkINDKEHIzOCg==
X-Received: by 2002:a05:6e02:1354:: with SMTP id k20mr4676630ilr.169.1627076647357;
        Fri, 23 Jul 2021 14:44:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r6sm19076141ioh.27.2021.07.23.14.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 14:44:06 -0700 (PDT)
Received: (nullmailer pid 2643227 invoked by uid 1000);
        Fri, 23 Jul 2021 21:44:03 -0000
Date:   Fri, 23 Jul 2021 15:44:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Cameron <jic23@kernel.org>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 14/54] dt-bindings: hwmon: Add IIO HWMON binding
Message-ID: <20210723214403.GA2641256@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-15-maxime@cerno.tech>
 <20210722102027.000035a5@Huawei.com>
 <20210722093453.2jltinepdphrajed@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722093453.2jltinepdphrajed@gilmour>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jul 22, 2021 at 11:34:53AM +0200, Maxime Ripard wrote:
> Hi Jonathan,
> 
> On Thu, Jul 22, 2021 at 10:20:27AM +0100, Jonathan Cameron wrote:
> > On Wed, 21 Jul 2021 16:03:44 +0200
> > Maxime Ripard <maxime@cerno.tech> wrote:
> > 
> > > Even though we had the iio-hwmon driver for some time and a number of
> > > boards using it already, we never had a binding for it. Let's add it
> > > based on what the driver expects and the boards are providing.
> > > 
> > > Cc: Guenter Roeck <linux@roeck-us.net>
> > > Cc: Jean Delvare <jdelvare@suse.com>
> > > Cc: Jonathan Cameron <jic23@kernel.org>
> > > Cc: linux-hwmon@vger.kernel.org
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  .../devicetree/bindings/hwmon/iio-hwmon.yaml  | 37 +++++++++++++++++++
> > >  1 file changed, 37 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml
> > > new file mode 100644
> > > index 000000000000..49dd40f663a6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml
> > > @@ -0,0 +1,37 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/hwmon/iio-hwmon.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: ADC-attached Hardware Sensor Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Jonathan Cameron <jic23@kernel.org>
> > 
> > I'd like to share the blame for this one.  Binding was originally added
> > by Guenter.
> > 
> > https://lore.kernel.org/linux-iio/1359668588-13678-4-git-send-email-linux@roeck-us.net/
> > https://lore.kernel.org/linux-iio/1359668588-13678-11-git-send-email-linux@roeck-us.net/
> > :)
> > 
> > As bindings go this one has always been controversial because
> > it's mapping between linux subsystems rather than really describing
> > hardware.  We've had various discussions over the years on how to do
> > this differently, but perhaps just documenting the current state is the
> > way to go.  That doesn't stop us moving to something better in the
> > future.
> 
> There's DT using it already, so I guess it's a bit too late to have that
> discussion indeed :)
> 
> > > +
> > > +description: >
> > > +  Bindings for hardware monitoring devices connected to ADC controllers
> > > +  supporting the Industrial I/O bindings.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: iio-hwmon
> > > +
> > > +  io-channels:
> > > +    minItems: 1
> > > +    maxItems: 1024
> > 
> > Why 1024?
> 
> Ought to be enough for anyone :)
> 
> We have to set a maximum and I couldn't find any actual maximum
> documented, if you prefer another value let me know

Just add a comment: '# Should be enough'
