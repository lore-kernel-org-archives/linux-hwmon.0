Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11030C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 00:38:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E90C760187
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 00:38:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238706AbhIWAkL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Sep 2021 20:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238631AbhIWAkK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Sep 2021 20:40:10 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E235EC061574;
        Wed, 22 Sep 2021 17:38:39 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id o66so7176535oib.11;
        Wed, 22 Sep 2021 17:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=i6zSFlSggOZgk0+XF49/fBLOG6TWufrBNoMVsILPLYs=;
        b=A74/UzKAG7wYWTCp7sX4yVcKOp3wdHnRrBYRT/xUGymi4URYEcO++JbX+LjbLzmIa9
         8IFtgTZS+vxvSWLETzN/BkuWvNzcOvaI3DDdZhVj6TTXZ6m6WkVfXYdjZKLw5cxhZkwH
         E3eD8d73ksoCuT1SAwg8oJfRxTSFHZmtjHoJg3NVY95V+N2UXSIMbYCQ/o0IthJEuwuM
         YrsMC+SrpROKf617tKkFMWxyw8NLNzIKLjp28Dv3f93PvUDgFONW2X7PyJhTmiJ4zcOp
         NgSDoWp6EaCwZ2F9YUDPxsd5fYeAf4pCumzi9uutSb+mVRyMBY6AJtaMJeKyzFtAbPje
         TqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=i6zSFlSggOZgk0+XF49/fBLOG6TWufrBNoMVsILPLYs=;
        b=Xa0qMYfzf49rECA37dHXIN7dfNNRXeImQQUQq3h+UHqCxHf0E0ewgwUdjQ/026NSJ0
         Bx+k8kQngOZDEaljRjH/noACHcwYWpdpNt7VcB4v13gg3wBxqC/nLl/Q8qo7BUXuoY6d
         FKGHrcIwu8PkTNSS6rZSnelcFeqGLNC6Y4kvDCDqn5uT8108hL6nAe9dRVE6bwMQ7NHS
         p37Ihy9T8tFpUtCFVmzBVJxh+vWlxSAG1kUqdnz4hVdm3YStpFI+GxIZ5pbC6eXLt888
         dWHN3BtJv2Mu2O0f3H/Cy9X+uq6DIHyZ7PTOR75Vc6FV8XSnYvhmkOP8/psMi9Tu2rP7
         nawA==
X-Gm-Message-State: AOAM531fDp6k2kLabYOcbC4JBBKp/FnDCFrddVyJHTH7Z6JhIKoF8JG0
        8MNgtb4dxIWm+avG8JIiobE=
X-Google-Smtp-Source: ABdhPJz21Alh38vFhDTHuXa2gbiCmlogP1ppbWw2wTYPOyeXQVBdNfTzLF0maypnG/enK4QUEZx7Yw==
X-Received: by 2002:a05:6808:107:: with SMTP id b7mr1613262oie.146.1632357519230;
        Wed, 22 Sep 2021 17:38:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i25sm920708oto.26.2021.09.22.17.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 17:38:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 22 Sep 2021 17:38:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Rob Herring <robh@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Oskar Senft <osk@google.com>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <20210923003836.GA3214968@roeck-us.net>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org>
 <20210921125831.GB1864238@roeck-us.net>
 <YUrRd3kTyLoCkLAt@localhost.localdomain>
 <20210922123926.GB3201379@roeck-us.net>
 <YUt2oD6sUKYvZLDB@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YUt2oD6sUKYvZLDB@localhost.localdomain>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 22, 2021 at 08:32:00PM +0200, Krzysztof Adamski wrote:
> Dnia Wed, Sep 22, 2021 at 05:39:26AM -0700, Guenter Roeck napisał(a):
> > On Wed, Sep 22, 2021 at 09:22:33AM +0200, Krzysztof Adamski wrote:
> > > Dnia Tue, Sep 21, 2021 at 05:58:31AM -0700, Guenter Roeck napisał(a):
> > > > >
> > > > > ti,n-factor
> > > >
> > > > n-factor isn't just supported by TI sensors, though it isn't always called
> > > > n-factor. Maxim (eg MAX6581) uses the term "ideality factor", though they
> > > > also refer to the factor as "N" in the datasheet.
> > > >
> > > > So question is if we make this ti,n-factor and maxim,n-factor, or if we make
> > > > it generic and define some kind of generic units. Thoughts ? My personal
> > > > preference would be a generic definition, but is not a strong preference.
> > > 
> > > That was exactly my way of thinking here - many sensors have n-factor
> > > parameter and this is the name I see most often.
> > > 
> > > That being said, maybe it should be "nfactor" instead of "n-factor", as
> > > this is what tmp513 is using?
> > > 
> > > > In regard to units, the n-factor is, as the name says, a factor. Default
> > > > value is 1.008. The value range for MAX6581 is 0.999 to 1.030. For TMP421
> > > > it is 0.706542 to 1.747977. So the scondary question is if the value
> > > > written should be the register value (as proposed here) or the absolute
> > > > factor (eg in micro-units).
> > > 
> > > Since expressing the fractional values in DT isn't well supported and
> > > (at least here) hardware guys like to think in terms of register values
> > > so this is what I proposed. Also, I just noticed that, for example,
> > > TMP531 is using register values as well.
> > > 
> > 
> > I never see "someone else does that" as valid argument.
> 
> It is not an argument for "so I should be allowed too" but more like "so
> it is generic enough to make sense for more than a single case" :)
> 
> > Also, DT does support fractional values, via units. It is perfectly
> > valid to describe a voltage as micro-volt, for example.
> 
> True. But doing so for unit-less values isn't as obvious. For real
> fractions we don't even know what the resolution should be and then we
> also may have those rounding errors etc (while with register values we
> know precisely what we get). As usual, we have some pros and
> cons of both approaches. While I agree raw values are not perfect, I
> still think it makes more sense so I vote for them. But my vote,
> obviously, isn't that important here so I'll let you guys decide.
> 

I really have to pass on this one, and leave it up to Rob to decide.
Personally I really really really dislike raw values, but I understand
that this makes me biased. I do realize that converting from a fractional
value to a register value is inherently complex and open to interpretation.
For example. if we define fractional values, what should 1.007000 translate
to ? It would either be 1.008 or 1.004641. Using the register value (0xff,
or -1 for 1.004641) would definitely be simpler and avoid calculations and
rounding.

Guenter

> > If the agreement is to use raw register values, I think the property name
> > should be prefixed with the vendor name, since it won't be a standard
> > property. I'll defer on Rob for that, though.
> 
> Fair enough. If we go that route, we should use "ti,nfactor" (without
> dash) to be consistent with ti513?
> 
> Krzysztof
