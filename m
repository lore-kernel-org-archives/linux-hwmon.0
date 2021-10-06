Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79C5C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 Oct 2021 20:55:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B48861163
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 Oct 2021 20:55:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239517AbhJFU5m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 6 Oct 2021 16:57:42 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:40917 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239516AbhJFU5l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Oct 2021 16:57:41 -0400
Received: by mail-ot1-f44.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so4779662otq.7;
        Wed, 06 Oct 2021 13:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PEl1Wiq7Yzxw1JyOc9TwT8faJxfEQGULJwcfWCWiJkE=;
        b=GyzGwyXw7S0wGnKixrE5Ff8odzbDciNXepCn5zlz81lUnphvA2nE8AG3CERHiCWlHN
         X/6X8Owwdn9cO7wePo4Pwt7fEIputZmAYZVBfhfKUH6PsupIpayfLZd7oWgDHzqcUDfr
         gt5GnYFL4a1sfn9WV2cUHdAI39a0/z22wd8NL7YnNuZyVO2DOf+c1RzLFVN9E/IqXEeS
         lZldztLQyW+ebpgW3ebqVHcwmEqSKzEVNOOiJ+jLOElQZ7/cmni2i6XhaF76ansJ7Vqt
         cewdo8gBshF3Q3VI9zk6Es6yJGYwK7jqANewY9nYDNR2GhzXHp2G4fImsp6q4fCpnKq+
         C5Ww==
X-Gm-Message-State: AOAM5300EXxCAWE6Y5aVWNRQVjecVd794944Tv3lJszbiIoeMRYtRyIu
        6+HNuNaUp3/xqcQ98YLr5eoOJG8fkA==
X-Google-Smtp-Source: ABdhPJyqBAjKD5LkaXGtc+EwOmuHvjB3JzySclZvRpa0XwLGhqvqXkKvpxQPFOovyl89rcbJ/Gf/8w==
X-Received: by 2002:a05:6830:9c9:: with SMTP id y9mr400716ott.6.1633553748826;
        Wed, 06 Oct 2021 13:55:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 21sm4300612oix.1.2021.10.06.13.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 13:55:48 -0700 (PDT)
Received: (nullmailer pid 2857378 invoked by uid 1000);
        Wed, 06 Oct 2021 20:55:46 -0000
Date:   Wed, 6 Oct 2021 15:55:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 11/11] dt-bindings: hwmon: allow specifying channels
 for tmp421
Message-ID: <YV4NUqf7ey5Yr55P@robh.at.kernel.org>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
 <3ff7b4cc57dab2073fa091072366c1e524631729.1632984254.git.krzysztof.adamski@nokia.com>
 <20211002142219.GC34532@roeck-us.net>
 <YVqu92dUgNKlYMlG@localhost.localdomain>
 <20211005141457.GB2395636@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005141457.GB2395636@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 05, 2021 at 07:14:57AM -0700, Guenter Roeck wrote:
> On Mon, Oct 04, 2021 at 09:36:23AM +0200, Krzysztof Adamski wrote:
> > Dnia Sat, Oct 02, 2021 at 07:22:19AM -0700, Guenter Roeck napisał(a):
> > > On Thu, Sep 30, 2021 at 09:19:49AM +0200, Krzysztof Adamski wrote:
> > > > Add binding description for the per temperature channel configuration
> > > > like labels and n-factor.
> > > > 
> > > > Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> > > > ---
> > > >  .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 66 +++++++++++++++++++
> > > >  1 file changed, 66 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> > > > index 47040ace4f73..0d4ea2209500 100644
> > > > --- a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> > > > +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> > > > @@ -24,12 +24,49 @@ properties:
> > > >    reg:
> > > >      maxItems: 1
> > > > 
> > > > +  '#address-cells':
> > > > +    const: 1
> > > > +
> > > > +  '#size-cells':
> > > > +    const: 0
> > > > +
> > > >  required:
> > > >    - compatible
> > > >    - reg
> > > > 
> > > >  additionalProperties: false
> > > > 
> > > > +patternProperties:
> > > > +  "^input@([0-4])$":
> > > 
> > > Was there agreement on "input" ? It is a somewhat odd name for a temperature
> > > sensor. If that name can be used to distinguish child sensor types, it might
> > > make sense to have a well defined name to state that this is a temperature
> > > sensor.
> > 
> > Nope, no conclusion on that, yet, thus I did not change that and I was
> > still using the same approach I had on v1. For me it can be a "channel@X", a
> > "temperature@X".. whatever you decide.
> > 
> 
> My question was more on mandating a single string instead of letting
> users decide. I don't care either if it isn't used for anything in
> particular, but you specifically mandate "input" as the only valid
> string. I am not a DT expert, but it seems to me that mandating the
> content of that string and then not using it other than to ensure that
> the user really specified "input" doesn't make much sense to me.
> Having said that, if this is the DT way of things, it is ok with
> me.

Kind of a catch-22. Node names weren't consistent nor checked, so 
we can use them. 

> > However I'm in favor of some generic name, like "channel" or "input",
> > and using some "type property", if required, instead of calling the
> > nodes "temperatue@X", "voltage@X".
> > 
> 
> It does open up a nother dimension for multi-type sensor chips, though,
> 
> For a chip with voltage and temperature sensors:
> 
> 	temperature@0 {
> 		reg = <0>;
> 	};
> 
> 	voltage@0 {
> 		reg = <0>;
> 	};

Not valid because you have same address twice.

> 
> vs:
> 
> 	temperature-sensors {
> 		xxx@0 {
> 			reg = <0>;
> 		};
> 	};
> 
> 	voltage-sensors {
> 		xxx@0 {
> 			reg = <0>;
> 		};
> 	};
> 

Didn't we already discuss this?

> This is way out of my league in terms of what is appropriate,
> except that "xxx" isn't always easy to determine if the string is fixed
> as you suggest. What should it be for a sensor measuring an output voltage ?

Does measuring a voltage have a direction?

> 
> 	input@0 {
> 		reg = <0>;
> 		label = "output voltage";
> 	};
> 
> Anyway, maybe Rob has an idea how to name this properly.

No, I don't have a sense of the range of h/w...

> 
> Guenter
> 
> > > > +    type: object
> > > > +    description: |
> > > > +      Represents channels of the device and their specific configuration.
> > > > +
> > > > +    properties:
> > > > +      reg:
> > > > +        description: |
> > > > +          The channel number. 0 is local channel, 1-4 are remote channels
> > > 
> > > Which of the supported chips has 4 remote channels ?
> > 
> > True, there is no TMP424. I will fix that in v4.
> > 
> > > 
> > > > +        items:
> > > > +          minimum: 0
> > > > +          maximum: 4
> > > > +
> > > > +      label:
> > > > +        description: |
> > > > +          A descriptive name for this channel, like "ambient" or "psu".
> > > > +
> > > > +      n-factor:
> > > 
> > > n-factor or "ti,n-factor" ? The unit is chip specific, after all.
> > 
> > Or ti,nfactor, as used by tmp513? Again, there was no clear conclusion
> > so I didn't change that. Let me know what is your decision and I will
> > obey that.
> 
> Not my call to make about nfactor or n-factor, really. I'll leave that
> for Rob to decide.

ti,n-factor

> > 
> > > 
> > > > +        description: |
> > > > +          The value (two's complement) to be programmed in the channel specific N correction register.
> 
> [ side note: Since the value is just a register value, "two's complement" seems
>   unnecessary and confusing; in the context of the DT description it doesn't
>   really matter what the register values actually mean. ]
> 
> > > > +          For remote channels only.
> > > > +        items:
> > > > +          minimum: 0
> > > > +          maximum: 1
> > > 
> > > Is this the correct value range ? The value range (in integer form) is
> > > -128 .. 127 (or 0 .. 255 as unsigned), not 0..1.
> > 
> > True, I must have misunderstood this minimum/maximum and confused it
> > with the number of items or something. Now, since DT does not really
> > handle signed values and considers everything an unsigned, should I use
> > 0..255 or -128..127?
> > 
> 
> I suspect it should be 0..255. After all, the values reflect register values,
> not their meaning. But I don't really know. Rob ?

That's fine.

You can define it as a signed type, but the validation there is not 
working due to dts->dt.yaml losing the sign.

Rob
