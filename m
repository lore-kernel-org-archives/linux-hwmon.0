Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CDCC04A6A
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Aug 2023 10:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234439AbjHKKm3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Aug 2023 06:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjHKKm3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Aug 2023 06:42:29 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 787E910D
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Aug 2023 03:42:28 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-56530cfee38so1227069a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Aug 2023 03:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1691750548; x=1692355348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qYA1iNOdZVJpj3OPfnwO45/gsMVIQDNWbkZ3zGXB3GI=;
        b=JiepBe3WMoCqwCRY18Uu3PFgmiY5SXx/aLVlXzjYYHTCVh+Towp8JcI+0/Qwc6jSzi
         v8j7X41vkHKLwJPv+LGET0Y163CMJd/03vaUUJUs7khw6wjN/w5qNvlNeBpfj7tJeDZL
         Kzolt7uyEDghagAKuB6rbpvDCOxmslAEgu4eFH0EFQY82cPfAvDjCW8lzrj0TKbOOmUc
         WCBTXfWt4xYeN8DOMb+Gue2/h33Kg5PQa0smV5phrMIychRglNhK0Nv5REfG3dOUpUNL
         CPob/j+UYtt7E0lrDxyX16VvqSHs8hEvBPUrlRWO+rfWj+DRFi6fnmJ3iGakYeff7uCu
         L6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691750548; x=1692355348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYA1iNOdZVJpj3OPfnwO45/gsMVIQDNWbkZ3zGXB3GI=;
        b=Dtva9mu3aa3m8ZSXNnBYhuW4nyE2Z+5/UNAOFR4qkvQzy0FPy1oV1GZ3jijvmma1h2
         LRtClm1oUa8PzSKtIbQnN5n2zzxF3RrN9y9JWQATjic84qwfgXbd5dmup6kHcGTwPjV2
         17Gh5Z0dU0n8ucQxYAxMiClZEB4vkMNaDfyW+ZlD9nH2bmspztk6ABx6KecihWpiSDA9
         WmBGuj8eW57RPUKRpOi0YMpoxvkTKTwsEG2B5DPLZrgRV7fKwzLFFnck44bBsu4TjRLU
         Nlsokt694AsKPyQFBAseIOqCiUe7YnVVsB7jsdjT6nsxW5HwqOm7wsXRB5bp7vt0ki6N
         Zycg==
X-Gm-Message-State: AOJu0Yzz8PJRsrvTNaGvr9ZnB02jX26WgVIbshzYMmHQbKjpohAxkbbK
        M3p0OobruWfidkhm4tiLvzCZCleIxNHsBUeaHvGY9Q==
X-Google-Smtp-Source: AGHT+IGOnefdVaHW0OP86gn8IWJab70m3Ff9dUcKRomfTG1N5U2HOK6fszRhsfwloDKXmrXTLIg6gAqvgES+w8qyhxs=
X-Received: by 2002:a17:90a:db55:b0:268:36a2:bd0 with SMTP id
 u21-20020a17090adb5500b0026836a20bd0mr774080pjx.8.1691750547480; Fri, 11 Aug
 2023 03:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230803144401.1151065-1-Naresh.Solanki@9elements.com>
 <20230804-tamper-numbness-0117bb53a921@spud> <3f947ad6-eed6-59ff-e4e6-8b21d90eb803@roeck-us.net>
 <20230810231142.GA1506309-robh@kernel.org>
In-Reply-To: <20230810231142.GA1506309-robh@kernel.org>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Fri, 11 Aug 2023 16:12:18 +0530
Message-ID: <CABqG17hzvyVLFkNRHSs2ye5k2+dp7XkLk0MC3OmwSguz1uG0rg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add MAX6639
To:     Rob Herring <robh@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Conor Dooley <conor@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        Jean Delvare <jdelvare@suse.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcello Sylvester Bauer <sylv@sylv.io>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rob,


On Fri, 11 Aug 2023 at 04:41, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Aug 04, 2023 at 09:10:37AM -0700, Guenter Roeck wrote:
> > On 8/4/23 08:48, Conor Dooley wrote:
> > > On Thu, Aug 03, 2023 at 04:43:59PM +0200, Naresh Solanki wrote:
> > > > From: Marcello Sylvester Bauer <sylv@sylv.io>
> > > >
> > > > Add binding documentation for Maxim MAX6639 fan-speed controller.
> > > >
> > > > Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> > > > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> > > > ---
> > > > Changes in V3:
> > > > - Update title
> > > > - Add pulses-per-revolution, supplies & interrupts
> > > > Changes in V2:
> > > > - Update subject
> > > > - Drop blank lines
> > > > ---
> > > >   .../bindings/hwmon/maxim,max6639.yaml         | 60 +++++++++++++++++++
> > > >   1 file changed, 60 insertions(+)
> > > >   create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> > > > new file mode 100644
> > > > index 000000000000..b3292061ca58
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> > > > @@ -0,0 +1,60 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Maxim MAX6639 Fan Controller
> > > > +
> > > > +maintainers:
> > > > +  - Naresh Solanki <Naresh.Solanki@9elements.com>
> > > > +
> > > > +description: |
> > > > +  The MAX6639 is a 2-channel temperature monitor with dual, automatic, PWM
> > > > +  fan-speed controller.  It monitors its own temperature and one external
> > > > +  diode-connected transistor or the temperatures of two external diode-connected
> > > > +  transistors, typically available in CPUs, FPGAs, or GPUs.
> > >
> > > > +  fan-supply:
> > > > +    description: Phandle to the regulator that provides power to the fan.
> > >
> > > > +  pulses-per-revolution:
> > > > +    description:
> > > > +      Define the number of pulses per fan revolution for each tachometer
> > > > +      input as an integer.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    enum: [1, 2, 3, 4]
> > > > +    default: 2
> > >
> > > Apologies if I am digging up old wounds here, since there was quite a
> > > bit of back and forth on the last version, but these two newly added
> > > properties look to be common with the "pwm-fan" and with
> > > "adi,axi-fan-control". At what point should these live in a common
> > > schema instead?
> > >
> > > Otherwise, this looks okay to me, although I'll leave things to
> > > Krzysztof since he had a lot to say about the previous version.
> > >
> >
> > Rob has said that he won't accept any fan controller bindings without a generic
> > schema. At the same time he has said that he expects properties such as the
> > number of pulses per revolution to be attached to a 'fan' description, and he
> > wants pwm related properties of fan controllers to be modeled as pwm controllers.
> > And now we have a notion of a regulator providing power to the fan (which again
> > would be the fan controller, at least in cases where the fan controller
> > provides direct voltage to the fan). On top of that, this fan-supply property
> > should presumably, again, be part of a fan description and not be part of the
> > controller description. I don't think anyone knows how to make this all work
> > (I for sure don't), so it is very unlikely we'll see a generic fan controller
> > schema anytime soon.
>
> I thought what was done earlier in this series was somewhat close. And
> there are some bindings that already look pretty close to what a common
> binding should. But it seems no one wants to worry about more than their
> 1 device.

The DT binding for common fan properties is:
https://lore.kernel.org/lkml/20221130144626.GA2647609@roeck-us.net/t/#m15ce07c3c43c46506acc389bf24d616646e05653

I wasn't sure on how to address properties for DC controlled fans.

Regards,
Naresh
>
> In case it's not clear, as-is, this binding is a NAK for me.
>
> > Given that neither fan-supply nor pulses-per-revolution is implemented in the
> > driver, and given that I am not aware of any fans which would have a value for
> > pulses-per-revolution other than 2, my personal suggestion would be to add the
> > chip to trivial devices and be done with it for the time being.
>
> I'm fine with that too. Just keep kicking that can...
>
> Rob
