Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435EEC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 Oct 2021 14:15:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E2AD6126A
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 Oct 2021 14:15:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236139AbhJEORg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 5 Oct 2021 10:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235717AbhJEORW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Oct 2021 10:17:22 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC3AC061769;
        Tue,  5 Oct 2021 07:14:59 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id v10so2181322oic.12;
        Tue, 05 Oct 2021 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HI6VRbTKK1AP3BY4b0yKJ6quCFNI60OtzuTOhWYibI0=;
        b=FeBBa/D0QziwFl80qarwkQD2zjQ3gllce/62OKvoA5ZintXCTvYYjTidKwZwGB3nEn
         +CxyhrL6CivXy0eg1XzEnXnduk9r8lBC+8orBy2FUOpBNqUAEiHPi90f+9h2eAL/cLMN
         +WSP4unl337v+FZrILX8nnpKh7jV/ylRBJcme+J1tzaYIZkOhPTZKTjqMJJea0xLHNV2
         0IGePrlGitAAY87lAkn2JVLaXcWLv57ByLMolpE1XK06HZmHqW550UZEhgpsPFCxgDHv
         6eWFD1NoT65nk5jDuMPPj/tvEDNhLIsVIFH9++czov0YnUVhh+eKc7i1BWdQaRg8ugJP
         Mirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=HI6VRbTKK1AP3BY4b0yKJ6quCFNI60OtzuTOhWYibI0=;
        b=2+6SFS6Q9X9knOvpnfW7UMTt+md24SbnrUJZ8pQserMV4GhTODrUqdlPfSI+BB88Oc
         g7n+AinK+55evgPnnd9uigPL3fYlCqGNNb+AL95aqaHfrax8nSyauOZSajd/QHCj8XPe
         FmoyOEpmcZNcgn3WLkxNs6WqXGCxcZ4PVQZKOZ9UiVcmQGvUJlM/epor2pxNClReXIAI
         ATCF3f5u488wkGPrrCl1wd0OhrJWTmHFYSWR/HG4YYj7kai3tFjLvpic3h+9+eqLZmCo
         29UdsHl6pF6uiD8nXWcbBz/G4s6adP0jeKlYDvnooa/RHX0pymP/jKk772SJ34erI11i
         6lLQ==
X-Gm-Message-State: AOAM531pZ1h1EDKEYO0ApjqKO9Kqj1CAWfZLEwYrVZrmbyM8K8KoTp7/
        n5l+0t2B7kHtfdwzG7WBttE=
X-Google-Smtp-Source: ABdhPJySbUtDUFfNDEUVKEis4xxDEXK2HD7qBjDo6p4nffMgQ7BgeQbmEMZD1riUMV+SYy0XOh/3DA==
X-Received: by 2002:a05:6808:187:: with SMTP id w7mr2783226oic.140.1633443299203;
        Tue, 05 Oct 2021 07:14:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x8sm3061906otg.31.2021.10.05.07.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 07:14:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 5 Oct 2021 07:14:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 11/11] dt-bindings: hwmon: allow specifying channels
 for tmp421
Message-ID: <20211005141457.GB2395636@roeck-us.net>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
 <3ff7b4cc57dab2073fa091072366c1e524631729.1632984254.git.krzysztof.adamski@nokia.com>
 <20211002142219.GC34532@roeck-us.net>
 <YVqu92dUgNKlYMlG@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YVqu92dUgNKlYMlG@localhost.localdomain>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 04, 2021 at 09:36:23AM +0200, Krzysztof Adamski wrote:
> Dnia Sat, Oct 02, 2021 at 07:22:19AM -0700, Guenter Roeck napisał(a):
> > On Thu, Sep 30, 2021 at 09:19:49AM +0200, Krzysztof Adamski wrote:
> > > Add binding description for the per temperature channel configuration
> > > like labels and n-factor.
> > > 
> > > Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> > > ---
> > >  .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 66 +++++++++++++++++++
> > >  1 file changed, 66 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> > > index 47040ace4f73..0d4ea2209500 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
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
> > 
> > Was there agreement on "input" ? It is a somewhat odd name for a temperature
> > sensor. If that name can be used to distinguish child sensor types, it might
> > make sense to have a well defined name to state that this is a temperature
> > sensor.
> 
> Nope, no conclusion on that, yet, thus I did not change that and I was
> still using the same approach I had on v1. For me it can be a "channel@X", a
> "temperature@X".. whatever you decide.
> 

My question was more on mandating a single string instead of letting
users decide. I don't care either if it isn't used for anything in
particular, but you specifically mandate "input" as the only valid
string. I am not a DT expert, but it seems to me that mandating the
content of that string and then not using it other than to ensure that
the user really specified "input" doesn't make much sense to me.
Having said that, if this is the DT way of things, it is ok with
me.

> However I'm in favor of some generic name, like "channel" or "input",
> and using some "type property", if required, instead of calling the
> nodes "temperatue@X", "voltage@X".
> 

It does open up a nother dimension for multi-type sensor chips, though,

For a chip with voltage and temperature sensors:

	temperature@0 {
		reg = <0>;
	};

	voltage@0 {
		reg = <0>;
	};

vs:

	temperature-sensors {
		xxx@0 {
			reg = <0>;
		};
	};

	voltage-sensors {
		xxx@0 {
			reg = <0>;
		};
	};

This is way out of my league in terms of what is appropriate,
except that "xxx" isn't always easy to determine if the string is fixed
as you suggest. What should it be for a sensor measuring an output voltage ?

	input@0 {
		reg = <0>;
		label = "output voltage";
	};

Anyway, maybe Rob has an idea how to name this properly.

Guenter

> > > +    type: object
> > > +    description: |
> > > +      Represents channels of the device and their specific configuration.
> > > +
> > > +    properties:
> > > +      reg:
> > > +        description: |
> > > +          The channel number. 0 is local channel, 1-4 are remote channels
> > 
> > Which of the supported chips has 4 remote channels ?
> 
> True, there is no TMP424. I will fix that in v4.
> 
> > 
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
> > n-factor or "ti,n-factor" ? The unit is chip specific, after all.
> 
> Or ti,nfactor, as used by tmp513? Again, there was no clear conclusion
> so I didn't change that. Let me know what is your decision and I will
> obey that.

Not my call to make about nfactor or n-factor, really. I'll leave that
for Rob to decide.
> 
> > 
> > > +        description: |
> > > +          The value (two's complement) to be programmed in the channel specific N correction register.

[ side note: Since the value is just a register value, "two's complement" seems
  unnecessary and confusing; in the context of the DT description it doesn't
  really matter what the register values actually mean. ]

> > > +          For remote channels only.
> > > +        items:
> > > +          minimum: 0
> > > +          maximum: 1
> > 
> > Is this the correct value range ? The value range (in integer form) is
> > -128 .. 127 (or 0 .. 255 as unsigned), not 0..1.
> 
> True, I must have misunderstood this minimum/maximum and confused it
> with the number of items or something. Now, since DT does not really
> handle signed values and considers everything an unsigned, should I use
> 0..255 or -128..127?
> 

I suspect it should be 0..255. After all, the values reflect register values,
not their meaning. But I don't really know. Rob ?

Guenter
