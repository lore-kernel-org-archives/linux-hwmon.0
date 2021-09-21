Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F654C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 12:58:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 728AF6109E
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 12:58:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbhIUNAD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Sep 2021 09:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbhIUNAC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Sep 2021 09:00:02 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1BE8C061574;
        Tue, 21 Sep 2021 05:58:34 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id w206so17888727oiw.4;
        Tue, 21 Sep 2021 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l7TfEGo3SQCWA01m9m4GXi8hl+WlD1BfbycKDHuTVoY=;
        b=ivRnxr8IVb3eaYpIV+u2ILK9pqIQGpQZSF3FuKjylhGcOybTNGtm+DopZh6fZJ1LsB
         6l74Q+K3IDpFzDvixVjxSErb2VK9r/Rh1jWOqDfM6eTKx2qef1VrrTM86vZmjzaPJDUK
         xTETeLrTjPxlDkz53unZP+K3UoAlafzoz+zlgzhK0MaJEVU78Acp7Bv3B28vZk1LQ0sq
         +JWe7sy9M0Xh1hFADf8wj8Ui9Y+KezAwV5M0z3wMVJoVkEeDnXZwBpVeAv73cOgmeMgE
         FdHAMPekpw39DPVGmcWVed0M6dHFwzXazZ9fAL4cXkuNxw8MWvSB6vWip21p44rLzl7Y
         anxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=l7TfEGo3SQCWA01m9m4GXi8hl+WlD1BfbycKDHuTVoY=;
        b=OKf1Q6ZH0mCqdCYbbQBikYpegFpOauTyemL65NOMoRhWKB+R90yF5rJfImMwmtBzF3
         Sv8jJdOnSaZQMoryihOZ1n25BrPp8Aj+JNQi4Fe5dUmjWYkCMQrF/rRRHIRHllJzpUB3
         T6XCR8oZqXBpogf4j1U51O+q1f+FYQuzLvoXOlOiFbPH5diQ87gYcZKxods955xhiOYd
         R5clfqv6x38d/0ee2rdqgA3LXDcR6AS6zPRi7wtrukOPnaw9o09nNCL7KWn6XogFnLGA
         LTbDLgINumYhexVtwRI4hKNqVQ3gGcx3kIqvnVoqDGMADpBkb+1PlOLHESfLatnYvkry
         qzRQ==
X-Gm-Message-State: AOAM532fpI9Jz0fARXAEDxm1x6WeZ383D7rm2jONjGGroPQB765AMx/f
        3JC4Qlqk7Sq2eEJaxKAXsnU=
X-Google-Smtp-Source: ABdhPJwEUO10IhafCkkBJxVZ93t04XHpNYP2TvAIKcGbZYAiupSSwWezNx391W3z2/4Y47FBRBng7A==
X-Received: by 2002:aca:a984:: with SMTP id s126mr3490513oie.150.1632229113942;
        Tue, 21 Sep 2021 05:58:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a8sm932983oos.46.2021.09.21.05.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 05:58:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 21 Sep 2021 05:58:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, Oskar Senft <osk@google.com>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <20210921125831.GB1864238@roeck-us.net>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUkKCe7845uCqoy5@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 20, 2021 at 05:24:09PM -0500, Rob Herring wrote:
> On Tue, Sep 07, 2021 at 03:46:14PM +0200, Krzysztof Adamski wrote:
> > Add binding description for the per temperature channel configuration
> > like labels and n-factor.
> > 
> > Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> > ---
> >  .../devicetree/bindings/hwmon/tmp421.yaml     | 66 +++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> 
> I'd keep this separate...
> 
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/tmp421.yaml b/Documentation/devicetree/bindings/hwmon/tmp421.yaml
> > index 53940e146ee6..56085fdf1b57 100644
> > --- a/Documentation/devicetree/bindings/hwmon/tmp421.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/tmp421.yaml
> > @@ -24,12 +24,49 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> >  required:
> >    - compatible
> >    - reg
> >  
> >  additionalProperties: false
> >  
> > +patternProperties:
> > +  "^input@([0-4])$":
> > +    type: object
> > +    description: |
> > +      Represents channels of the device and their specific configuration.
> > +
> > +    properties:
> > +      reg:
> > +        description: |
> > +          The channel number. 0 is local channel, 1-4 are remote channels
> > +        items:
> > +          minimum: 0
> > +          maximum: 4
> > +
> > +      label:
> > +        description: |
> > +          A descriptive name for this channel, like "ambient" or "psu".
> > +
> > +      n-factor:
> 
> ti,n-factor

n-factor isn't just supported by TI sensors, though it isn't always called
n-factor. Maxim (eg MAX6581) uses the term "ideality factor", though they
also refer to the factor as "N" in the datasheet.

So question is if we make this ti,n-factor and maxim,n-factor, or if we make
it generic and define some kind of generic units. Thoughts ? My personal
preference would be a generic definition, but is not a strong preference.

In regard to units, the n-factor is, as the name says, a factor. Default
value is 1.008. The value range for MAX6581 is 0.999 to 1.030. For TMP421
it is 0.706542 to 1.747977. So the scondary question is if the value
written should be the register value (as proposed here) or the absolute
factor (eg in micro-units).

> 
> Needs a type reference too.
> 
> > +        description: |
> > +          The value (two's complement) to be programmed in the channel specific N correction register.
> > +          For remote channels only.
> > +        items:
> > +          minimum: 0
> > +          maximum: 1
> > +
> > +    required:
> > +      - reg
> > +
> > +    additionalProperties: false
> > +
> >  examples:
> >    - |
> >      i2c {
> > @@ -41,3 +78,32 @@ examples:
> >          reg = <0x4c>;
> >        };
> >      };
> > +  - |
> > +    i2c {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      sensor@4c {
> > +        compatible = "ti,tmp422";
> > +        reg = <0x4c>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        input@0 {
> > +          reg = <0x0>;
> > +          n-factor = <0x1>;
> > +          label = "local";
> > +        };

In the context or other sensors, question here is if we can make the
bindings generic. We have been discussing this for NCT7802Y. The main
question for me is how to handle different sensor types. TMP421 is
easy because it only has one type of sensors, but there are other
devices which also have, for example, voltage and/or current sensors.
NCT7802 is an example for that. We just had a set of bindings for that
chip proposed at
https://patchwork.kernel.org/project/linux-hwmon/patch/20210921004627.2786132-1-osk@google.com/

Would it be possible to determine a generic scheme that works for all
chips ? I can see two problems:
- How to express sensor types. The NCT7802 submission proposes another level
  of indirection, ie

  temperature-sensors {
> > +
> > +        input@1 {
> > +          reg = <0x1>;
> > +          n-factor = <0x0>;
> > +          label = "somelabel";
> > +        };
> > +
> > +        input@2 {
> > +          reg = <0x2>;
> > +          status = "disabled";
> > +        };
> > +      };
> > +    };
    };

The second question is how to express sensor index. One option is the solution
suggested here, ie to use reg=<> as sensor index. The second is the solution
suggested in the 7802 bindings, where the (chip specific) name is used as
sensor index.

+            temperature-sensors {
+                ltd {
+                  status = "disabled";
+                };
+
+                rtd1 {
+                  status = "okay";
+                  type = <4> /* thermistor */;
+                };
+            };

I personally don't have a strong opinion either way, but I would like to see
a single solution for all sensor chips.

Rob, do you have a preference ?

Thanks,
Guenter
