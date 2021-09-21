Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF875C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 19:06:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D00F661242
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 19:06:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234141AbhIUTIA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Sep 2021 15:08:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:33974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232081AbhIUTIA (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Sep 2021 15:08:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1B3161242;
        Tue, 21 Sep 2021 19:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632251191;
        bh=+QldbduaosRO+PTBglCfkUevcz4S7/oBJnQwk1MjMEU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=it3PCaoOKtKcTIXEG1lxPPACYgVdx6HuYUzDAbZItwSFx5/0qyJPWOnCpXXoxOnEk
         f/b/hvfw9fmR+lY2DnwJntsKckx/EuYplMJQ3lw3QOZHXQXHKa+3GQu6kgsxDH/iM3
         npDiQiQiPhDlNUYjI0Jd1u0GL3PB58tNjWRnR9pblv8pM/3+q1yOl7eO+meaIxkEq5
         v+OFqL0sqCjtjHi1GifwpHS/H8omG4vtm/6yqmiEqyTmfovAONop0E3yWODFFGWgcD
         AFaN1u8aXmWpBk5D4gHe5uPNXoDKm3ka63cCznz6+iBvTjkxMp32ABIUL50rNqNMuK
         HBHc6qDKF2xqg==
Received: by mail-ed1-f43.google.com with SMTP id r5so246103edi.10;
        Tue, 21 Sep 2021 12:06:31 -0700 (PDT)
X-Gm-Message-State: AOAM5323hKR9OXZYGou1tCPrlKEZLSNaejST+26xz8omXRSmAEFuNu2U
        IYR2Y5W6V9nvMeY8BlR9zJiRll+d7Ih9ElambA==
X-Google-Smtp-Source: ABdhPJy7GkX7y7vN7XXiF8IRrrgzU6y7nz/JcckYVJV6YB7QzIfaEfGJM5IvtaJcBlUrDIhdpNyazD1906e0iMxSyAo=
X-Received: by 2002:a17:907:33ce:: with SMTP id zk14mr36622589ejb.84.1632251190223;
 Tue, 21 Sep 2021 12:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org> <20210921125831.GB1864238@roeck-us.net>
In-Reply-To: <20210921125831.GB1864238@roeck-us.net>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 21 Sep 2021 14:06:18 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLo=inkKVKSU8N=_h90RfpDk6NNWPKdKyTXh-VvqXDCag@mail.gmail.com>
Message-ID: <CAL_JsqLo=inkKVKSU8N=_h90RfpDk6NNWPKdKyTXh-VvqXDCag@mail.gmail.com>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for tmp421
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        devicetree@vger.kernel.org, Oskar Senft <osk@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 21, 2021 at 7:58 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Sep 20, 2021 at 05:24:09PM -0500, Rob Herring wrote:
> > On Tue, Sep 07, 2021 at 03:46:14PM +0200, Krzysztof Adamski wrote:
> > > Add binding description for the per temperature channel configuration
> > > like labels and n-factor.
> > >
> > > Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> > > ---
> > >  .../devicetree/bindings/hwmon/tmp421.yaml     | 66 +++++++++++++++++++
> > >  1 file changed, 66 insertions(+)
> >
> > I'd keep this separate...
> >
> > >
> > > diff --git a/Documentation/devicetree/bindings/hwmon/tmp421.yaml b/Documentation/devicetree/bindings/hwmon/tmp421.yaml
> > > index 53940e146ee6..56085fdf1b57 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/tmp421.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/tmp421.yaml
> > > @@ -24,12 +24,49 @@ properties:
> > >    reg:
> > >      maxItems: 1
> > >
> > > +  '#address-cells':
> > > +    const: 1
> > > +
> > > +  '#size-cells':
> > > +    const: 0
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > >
> > >  additionalProperties: false
> > >
> > > +patternProperties:
> > > +  "^input@([0-4])$":
> > > +    type: object
> > > +    description: |
> > > +      Represents channels of the device and their specific configuration.
> > > +
> > > +    properties:
> > > +      reg:
> > > +        description: |
> > > +          The channel number. 0 is local channel, 1-4 are remote channels
> > > +        items:
> > > +          minimum: 0
> > > +          maximum: 4
> > > +
> > > +      label:
> > > +        description: |
> > > +          A descriptive name for this channel, like "ambient" or "psu".
> > > +
> > > +      n-factor:
> >
> > ti,n-factor
>
> n-factor isn't just supported by TI sensors, though it isn't always called
> n-factor. Maxim (eg MAX6581) uses the term "ideality factor", though they
> also refer to the factor as "N" in the datasheet.
>
> So question is if we make this ti,n-factor and maxim,n-factor, or if we make
> it generic and define some kind of generic units. Thoughts ? My personal
> preference would be a generic definition, but is not a strong preference.

generic if the units are generic. Though if the register value is
opaque to s/w, then maybe register value is fine.

> In regard to units, the n-factor is, as the name says, a factor. Default
> value is 1.008. The value range for MAX6581 is 0.999 to 1.030. For TMP421
> it is 0.706542 to 1.747977. So the scondary question is if the value
> written should be the register value (as proposed here) or the absolute
> factor (eg in micro-units).

A range, but the register value can only be 0 or 1?

>
> >
> > Needs a type reference too.
> >
> > > +        description: |
> > > +          The value (two's complement) to be programmed in the channel specific N correction register.
> > > +          For remote channels only.
> > > +        items:
> > > +          minimum: 0
> > > +          maximum: 1
> > > +
> > > +    required:
> > > +      - reg
> > > +
> > > +    additionalProperties: false
> > > +
> > >  examples:
> > >    - |
> > >      i2c {
> > > @@ -41,3 +78,32 @@ examples:
> > >          reg = <0x4c>;
> > >        };
> > >      };
> > > +  - |
> > > +    i2c {
> > > +      #address-cells = <1>;
> > > +      #size-cells = <0>;
> > > +
> > > +      sensor@4c {
> > > +        compatible = "ti,tmp422";
> > > +        reg = <0x4c>;
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        input@0 {
> > > +          reg = <0x0>;
> > > +          n-factor = <0x1>;
> > > +          label = "local";
> > > +        };
>
> In the context or other sensors, question here is if we can make the
> bindings generic. We have been discussing this for NCT7802Y. The main
> question for me is how to handle different sensor types. TMP421 is
> easy because it only has one type of sensors, but there are other
> devices which also have, for example, voltage and/or current sensors.
> NCT7802 is an example for that. We just had a set of bindings for that
> chip proposed at
> https://patchwork.kernel.org/project/linux-hwmon/patch/20210921004627.2786132-1-osk@google.com/
>
> Would it be possible to determine a generic scheme that works for all
> chips ? I can see two problems:
> - How to express sensor types. The NCT7802 submission proposes another level
>   of indirection, ie
>
>   temperature-sensors {
> > > +
> > > +        input@1 {
> > > +          reg = <0x1>;
> > > +          n-factor = <0x0>;
> > > +          label = "somelabel";
> > > +        };
> > > +
> > > +        input@2 {
> > > +          reg = <0x2>;
> > > +          status = "disabled";
> > > +        };
> > > +      };
> > > +    };
>     };

I think the function should be within the node. Otherwise, the
addressing becomes weird (e.g. input@3 is under current-sensors or
something) with seemingly separate address spaces.

> The second question is how to express sensor index. One option is the solution
> suggested here, ie to use reg=<> as sensor index. The second is the solution
> suggested in the 7802 bindings, where the (chip specific) name is used as
> sensor index.
>
> +            temperature-sensors {
> +                ltd {
> +                  status = "disabled";
> +                };
> +
> +                rtd1 {
> +                  status = "okay";
> +                  type = <4> /* thermistor */;

'type' is a bit generic. We don't want the same property name to
possibly have multiple definitions.

> +                };
> +            };
>
> I personally don't have a strong opinion either way, but I would like to see
> a single solution for all sensor chips.
>
> Rob, do you have a preference ?

If it is how you address an instance of something which seems to be
the case here, then 'reg' should be used.

Rob
