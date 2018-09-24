Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43736 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbeIXGKG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Sep 2018 02:10:06 -0400
Date: Sun, 23 Sep 2018 17:10:25 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add ina3221 documentation
Message-ID: <20180924001025.GA7496@Asurada>
References: <20180923041118.8743-1-nicoleotsuka@gmail.com>
 <20180923041118.8743-2-nicoleotsuka@gmail.com>
 <353ccbbd-94c8-72eb-eb98-8a0507431e15@roeck-us.net>
 <20180923053151.GB9960@Asurada>
 <ce76fdf2-2894-96ad-d2f5-b2c25f197ee4@roeck-us.net>
 <20180923060120.GA8872@Asurada-Nvidia.nvidia.com>
 <fe5c9570-70f8-d54d-509e-fce3733a4145@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe5c9570-70f8-d54d-509e-fce3733a4145@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Sep 22, 2018 at 11:36:22PM -0700, Guenter Roeck wrote:
> >>>>>+  Optional properties:
> >>>>>+  - input-label: Name of the input source
> 
> Just noticed the "input-" here. Please just use "label".

Will fix in v5.

> >>>>>+  input1 {
> >>>>>+          input-id = <0x1>;
> >>>>
> >>>>We'll have to find a better name for this. Feel free to look up examples in the
> >>>>existing devicetree descriptions. The one that seems to be used most of the time
> >>>>to indicate a channel index or id is "reg". It should also start with 0 - there
> >>>>is no real reason for it to start with 1; it only makes the code more complex.
> >>>
> >>>The reason is that the port start from 1 in the datasheet.
> >>>
> >>
> >>Maybe, but for me I'll want to have something that we can reuse for other chips.
> >>Having the index start with 0 for one chip and with 1 for another would be
> >>confusing. It is bad enough that we have in[0..n] for voltages and temp[1..n]
> >>for temperatures. I would not want to see the same in devicetree files,
> >>and much less so on a per-device basis. It is also pretty common to start
> >>channel numbers with 0 in devicetree files.
> >
> >Understood. I search a bit and saw most of "*-id" start from 0,
> >although I cannot be sure whether their Datasheet/RM/schematics
> >are counting from 0 or 1.
> >
> >And I also found a transposing example:
> >     Documentation/devicetree/bindings/serial/mrvl,pxa-ssp.txt
> >
> 
> You'll always find an example for anything in the kernel. In this case,
> it is for one specific chip. I'll want this to be reusable as template for
> _all_ hardware monitoring chips.

I see.

Thanks
Nicolin
