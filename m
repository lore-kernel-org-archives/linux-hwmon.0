Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98B6C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 20:52:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B43D361165
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 20:52:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234634AbhIUUyT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Sep 2021 16:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbhIUUyT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Sep 2021 16:54:19 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CE0C061574;
        Tue, 21 Sep 2021 13:52:50 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id t2-20020a4ae9a2000000b0028c7144f106so119456ood.6;
        Tue, 21 Sep 2021 13:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4uCOEvlUrcIxM24H41yB11c2ubTHQNnwRw7GlkDgvFw=;
        b=EUct38Lki9pNfD0k+vkv1ffBWgiByAa8zsmSxfZwvCsvk87owqSnkzSp3ocIvaQzMl
         rPzc/aBmdptEPGltcc5hSeHUEnaJ7RmI53woWp1dNxS+t92+ah0wRty9pdyq7Os9QCCh
         vIPAa9zrQHDumDbNkkcvsOzgYpbPTA775+Ko7XA+PYhYN8Ege6yV8W3pbkOsoO0YWXNI
         spx5ZNy5CaMDcX5W575XhYlLvXmyxzfTDclMmg102RTVS3fEWASk/BZNxMXzHUpaDKSm
         u9IubN3amxrEtnDWsHSw8P2HvV4ejV9VE5by6SccDKCdObYBQxzHWV+ULgpLiSpqKLHm
         V/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=4uCOEvlUrcIxM24H41yB11c2ubTHQNnwRw7GlkDgvFw=;
        b=6YFc851RuDOMIBxisHQb52Koqqvez5RW3Gv9FBCOLgqa5nR/Qb/ZDaKRoej/K5fUUJ
         R497LW42ulVo6us70NdGjWne5d9DRqWrFGTHOOvhH9RC/ytrwvtFC+cOZB3KZCuyRWzV
         /Jg/V7w82B/7C4vtP+Ln3hB4bP5vOuKfTwuGLQlfMqbmYx7/F01IVKQB/kVXAgY37RcH
         hlYA0ylcB2VUqk4adkUP5YodH9hcfv6JeNWKWLMfV8AL0l39KyixL9F35HasY79PrtMd
         da5AkkVYSPz00I/TMHqjuJjHZ2jHRdKg+Ncfm7pJjU4WAoEu1rVxTzCBaxMPoZuWLHOV
         lirw==
X-Gm-Message-State: AOAM5301bR3EMsDoPFSwY2ZhxkFIioGEocxLa6QtSjwnTuEh5XdkdHzU
        aHhha77Nkc+fDcKpSzpRXnomhqwrxVI=
X-Google-Smtp-Source: ABdhPJyS+80AhrIVGPl4b3zIAU2nYGnfMtdLmrreb9/adrxzC+pEHzwlDIpgPyFpsFFXE7nO4CYCoQ==
X-Received: by 2002:a4a:7452:: with SMTP id t18mr25813466ooe.20.1632257569802;
        Tue, 21 Sep 2021 13:52:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q17sm24395otc.28.2021.09.21.13.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:52:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 21 Sep 2021 13:52:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        devicetree@vger.kernel.org, Oskar Senft <osk@google.com>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <20210921205247.GA2363535@roeck-us.net>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org>
 <20210921125831.GB1864238@roeck-us.net>
 <CAL_JsqLo=inkKVKSU8N=_h90RfpDk6NNWPKdKyTXh-VvqXDCag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLo=inkKVKSU8N=_h90RfpDk6NNWPKdKyTXh-VvqXDCag@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 21, 2021 at 02:06:18PM -0500, Rob Herring wrote:
> On Tue, Sep 21, 2021 at 7:58 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Mon, Sep 20, 2021 at 05:24:09PM -0500, Rob Herring wrote:
> > > On Tue, Sep 07, 2021 at 03:46:14PM +0200, Krzysztof Adamski wrote:
> > > > Add binding description for the per temperature channel configuration
> > > > like labels and n-factor.
> > > >
> > > > Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> > > > ---
> > > >  .../devicetree/bindings/hwmon/tmp421.yaml     | 66 +++++++++++++++++++
> > > >  1 file changed, 66 insertions(+)
> > >
> > > I'd keep this separate...
> > >
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/tmp421.yaml b/Documentation/devicetree/bindings/hwmon/tmp421.yaml
> > > > index 53940e146ee6..56085fdf1b57 100644
> > > > --- a/Documentation/devicetree/bindings/hwmon/tmp421.yaml
> > > > +++ b/Documentation/devicetree/bindings/hwmon/tmp421.yaml
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
> > > > +    type: object
> > > > +    description: |
> > > > +      Represents channels of the device and their specific configuration.
> > > > +
> > > > +    properties:
> > > > +      reg:
> > > > +        description: |
> > > > +          The channel number. 0 is local channel, 1-4 are remote channels
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
> > > ti,n-factor
> >
> > n-factor isn't just supported by TI sensors, though it isn't always called
> > n-factor. Maxim (eg MAX6581) uses the term "ideality factor", though they
> > also refer to the factor as "N" in the datasheet.
> >
> > So question is if we make this ti,n-factor and maxim,n-factor, or if we make
> > it generic and define some kind of generic units. Thoughts ? My personal
> > preference would be a generic definition, but is not a strong preference.
> 
> generic if the units are generic. Though if the register value is
> opaque to s/w, then maybe register value is fine.
> 
> > In regard to units, the n-factor is, as the name says, a factor. Default
> > value is 1.008. The value range for MAX6581 is 0.999 to 1.030. For TMP421
> > it is 0.706542 to 1.747977. So the scondary question is if the value
> > written should be the register value (as proposed here) or the absolute
> > factor (eg in micro-units).
> 
> A range, but the register value can only be 0 or 1?
> 
No, register values are 0x0 .. 0x1f for MAX6581, and 0x0 .. 0xff for TMP421.

> >
> > >
> > > Needs a type reference too.
> > >
> > > > +        description: |
> > > > +          The value (two's complement) to be programmed in the channel specific N correction register.
> > > > +          For remote channels only.
> > > > +        items:
> > > > +          minimum: 0
> > > > +          maximum: 1
> > > > +
> > > > +    required:
> > > > +      - reg
> > > > +
> > > > +    additionalProperties: false
> > > > +
> > > >  examples:
> > > >    - |
> > > >      i2c {
> > > > @@ -41,3 +78,32 @@ examples:
> > > >          reg = <0x4c>;
> > > >        };
> > > >      };
> > > > +  - |
> > > > +    i2c {
> > > > +      #address-cells = <1>;
> > > > +      #size-cells = <0>;
> > > > +
> > > > +      sensor@4c {
> > > > +        compatible = "ti,tmp422";
> > > > +        reg = <0x4c>;
> > > > +        #address-cells = <1>;
> > > > +        #size-cells = <0>;
> > > > +
> > > > +        input@0 {
> > > > +          reg = <0x0>;
> > > > +          n-factor = <0x1>;
> > > > +          label = "local";
> > > > +        };
> >
> > In the context or other sensors, question here is if we can make the
> > bindings generic. We have been discussing this for NCT7802Y. The main
> > question for me is how to handle different sensor types. TMP421 is
> > easy because it only has one type of sensors, but there are other
> > devices which also have, for example, voltage and/or current sensors.
> > NCT7802 is an example for that. We just had a set of bindings for that
> > chip proposed at
> > https://patchwork.kernel.org/project/linux-hwmon/patch/20210921004627.2786132-1-osk@google.com/
> >
> > Would it be possible to determine a generic scheme that works for all
> > chips ? I can see two problems:
> > - How to express sensor types. The NCT7802 submission proposes another level
> >   of indirection, ie
> >
> >   temperature-sensors {
> > > > +
> > > > +        input@1 {
> > > > +          reg = <0x1>;
> > > > +          n-factor = <0x0>;
> > > > +          label = "somelabel";
> > > > +        };
> > > > +
> > > > +        input@2 {
> > > > +          reg = <0x2>;
> > > > +          status = "disabled";
> > > > +        };
> > > > +      };
> > > > +    };
> >     };
> 
> I think the function should be within the node. Otherwise, the
> addressing becomes weird (e.g. input@3 is under current-sensors or
> something) with seemingly separate address spaces.
> 

Sorry, can you translate that for a DT non-expert ? Or, in other words,
how would / should one express a chip with sets of, say, current-sensors,
voltage sensors, and temperature sensors. Each would have a different
number of channels and different parameters.

> > The second question is how to express sensor index. One option is the solution
> > suggested here, ie to use reg=<> as sensor index. The second is the solution
> > suggested in the 7802 bindings, where the (chip specific) name is used as
> > sensor index.
> >
> > +            temperature-sensors {
> > +                ltd {
> > +                  status = "disabled";
> > +                };
> > +
> > +                rtd1 {
> > +                  status = "okay";
> > +                  type = <4> /* thermistor */;
> 
> 'type' is a bit generic. We don't want the same property name to
> possibly have multiple definitions.
> 
How about sensor-type ?

> > +                };
> > +            };
> >
> > I personally don't have a strong opinion either way, but I would like to see
> > a single solution for all sensor chips.
> >
> > Rob, do you have a preference ?
> 
> If it is how you address an instance of something which seems to be
> the case here, then 'reg' should be used.
> 
Ok.

Thanks,
Guenter
