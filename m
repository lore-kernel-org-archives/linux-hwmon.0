Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DC5C19F2A
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Aug 2022 17:45:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbiHDRpx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Aug 2022 13:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbiHDRpx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Aug 2022 13:45:53 -0400
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233C3634F;
        Thu,  4 Aug 2022 10:45:52 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id i84so243362ioa.6;
        Thu, 04 Aug 2022 10:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=r5fIHS4i41Nwdm/9buRQQW9UtvOL0tkeiIZZl06Sy6s=;
        b=1tf3mfjYc3t5TjRrRmSIIClA9J7PzvVM3SVJUgeUhmNOwzf+wAnSuvO49KXJJWS2Bt
         /EpSnBiGgiaNC2Qt0UtXUfTjAYLW6CVEbVUaeE8v2c0FixQxj+jlTYosZ9L4HWaByVSf
         JmQJx2gXfkzzK7QL4Jxw8ecP7odSdUGJOleRPsS2Wz1H6CQ0eH5r2K0Mj9NueOsK26Ig
         e4MW7nLIU3JOYtAF5p/5ymVH4CYVQ3Dd0sK+jnart9hv9x7Gp3Aiu9qSqXAXDKGLSsrr
         hE0JgNJJ9BF4CN2LaOGKuhzrIOx0iazFNyMPV9VkJca2Y6IV6C50GYkYcX4hszGI2Nak
         ispQ==
X-Gm-Message-State: ACgBeo3p4vRjbXEuKfALlqXt8KYra2buVhnZ3/fP6j++VNFYiDDkBKry
        zABvYMJV0XhsLuuJzxY/YY7GjDCRbg==
X-Google-Smtp-Source: AA6agR7ttXcmRYN0gSflgLc/FXkw/VZvIl+1z383cMJZ+v/MK9q4ScFa2ZWnHCf190zAKglHVgFrig==
X-Received: by 2002:a5e:8811:0:b0:682:8a6a:cf40 with SMTP id l17-20020a5e8811000000b006828a6acf40mr1120481ioj.136.1659635151292;
        Thu, 04 Aug 2022 10:45:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c12-20020a02330c000000b00342a03e834esm41736jae.3.2022.08.04.10.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 10:45:50 -0700 (PDT)
Received: (nullmailer pid 96985 invoked by uid 1000);
        Thu, 04 Aug 2022 17:45:48 -0000
Date:   Thu, 4 Aug 2022 11:45:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Michael Shych <michaelsh@nvidia.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: Re: [PATCH hwmon-next v4 2/3] dt-bindings: hwmon: add Microchip
 EMC2305 fan controller.
Message-ID: <20220804174548.GB4145453-robh@kernel.org>
References: <20220623165217.59252-1-michaelsh@nvidia.com>
 <20220623165217.59252-3-michaelsh@nvidia.com>
 <20220630221157.GA3402568-robh@kernel.org>
 <DM6PR12MB40747C492C3197BDD64027FCD48C9@DM6PR12MB4074.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR12MB40747C492C3197BDD64027FCD48C9@DM6PR12MB4074.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 18, 2022 at 12:38:58PM +0000, Michael Shych wrote:
> Hi,
> 
> Sorry for long delay in getting back to you.
> Please see below.
> 
> Thanks,
>    Michael.
> 
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Friday, July 1, 2022 1:12 AM
> > To: Michael Shych <michaelsh@nvidia.com>
> > Cc: linux@roeck-us.net; linux-hwmon@vger.kernel.org;
> > devicetree@vger.kernel.org; Vadim Pasternak <vadimp@nvidia.com>
> > Subject: Re: [PATCH hwmon-next v4 2/3] dt-bindings: hwmon: add Microchip
> > EMC2305 fan controller.
> > 
> > On Thu, Jun 23, 2022 at 07:52:16PM +0300, michaelsh@nvidia.com wrote:
> > > From: Michael Shych <michaelsh@nvidia.com>
> > >
> > > Add basic description of emc2305 driver device tree binding.
> > >
> > > Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> > > Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> > > ---
> > > v2->v3
> > > Changes pointed out by Rob Herring and Guenter Roeck:
> > > - Describe separate channels of fan-controller;
> > > - Remove pwm_max property;
> > > - Fix compatible property.
> > > Changes added by Michael Shych:
> > > - Fix dt binding check warnings.
> > > v1->v2
> > > - Fix dt binding check errors;
> > > - Add descriptions;
> > > - Add missing fields;
> > > - Change the patch subject name;
> > > - Separate pwm-min, pwm-max per PWM channel.
> > > ---
> > >  .../bindings/hwmon/microchip,emc2305.yaml          | 106
> > +++++++++++++++++++++
> > >  1 file changed, 106 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > new file mode 100644
> > > index 000000000000..d054ba46ae23
> > > --- /dev/null
> > > +++
> > b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > @@ -0,0 +1,106 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +
> > > +$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Microchip EMC2305 RPM-based PWM Fan Speed Controller
> > 
> > RPM-based? So there is a tach signal too? Don't those need the number of
> > pulses per revolution that the fan provides.
> > 
> It's not relevant. The driver implements Direct setting mode according 
> to the Datasheet: https://www.microchip.com/en-us/product/EMC2305
> I can add this note to the documentation patch.

For the binding, it doesn't matter what a driver currently implements. 
That's one driver at one point in time. Bindings shouldn't be evolving 
and need to support more than 1 OS.

The binding needs to be able to describe the h/w. If there's a tach 
connection, you need to describe that and the properties of the fan's 
tach pulses. 

> 
> > To repeat what I say for every fan controller binding now, until there's a
> > common binding to describe fan controllers, fans and their relationship to
> > each other, I'm not signing off on any fan binding doing its own thing.
> > 
> I'm confused here as I thought that I already changed to common fan-controller with advice of 
> Gunter in patch series V3.
> Do you mean that we should use some common FAN/PWM/ TACHO etc. generic binding
> mechanism that fits all drivers?
> Could you advise if it's already existed and reference to example?

It doesn't exist. Probably the closest binding to something as a basis 
for something common is npcm750-pwm-fan.txt.

> If it doesn't exist, it'll be too complicated to provide such a new generic description within 
> the submission of a driver for EMC2305 device.
> We can just completely remove OF interface and pass the necessary configuration through
> the platform data.

That's your choice...

Rob
