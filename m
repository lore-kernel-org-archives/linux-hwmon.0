Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01ABEC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Sep 2021 12:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C887560F9D
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Sep 2021 12:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235935AbhIVMk7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Sep 2021 08:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235834AbhIVMk6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Sep 2021 08:40:58 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB63EC061574;
        Wed, 22 Sep 2021 05:39:28 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id z11so4248580oih.1;
        Wed, 22 Sep 2021 05:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ATJeqTXclVnaTU6OlYKqpRsa99iDhu9c6SozT+medwI=;
        b=G8q/gUm8xQW7IedlOjatTLgy3ls1E5RNm5KOrpb+goJ5Xk4YX3jkWnwEk4/BE8d9lI
         yW03lXGwYnQoHw6o0m+s4teSD61iHXyio6vEgigWbFqLOIdWVVhxh9wIn/+N200eN8HT
         D7CsHjnCrj4VXekkDBBAiz8Oec1IwNpDFxG+rTqJUSLhmaEvnfjUUWboK+HojPew/Rgl
         kraWFLWYMp97bZhz0VOrxbhkiDmVPBj+Rh+wTlTPEZWvIvZqCXOCeE6E91wB2YjRPr/I
         NqLuigF3/aO0juptgrjV4lL/pd+DtDJQAnTagZHWwiKcSpBv2Y7YWVQ3vHpLKI4KxyJp
         x+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=ATJeqTXclVnaTU6OlYKqpRsa99iDhu9c6SozT+medwI=;
        b=QaQF7quJ7zFJjjK5mLjgXXGxY4USMWKKEPgAIwLYUT2NOh0RHqpU9/gmQBoGclCJ2d
         F5dI+pTBNA/vZ+WlRknEphdpnfNeuCA06U+eqf1Z7kd7hMhIlxKfqvy+tHaaWr0AwU/o
         aiwC8mYqyDEEikMtTS4CUwrhgzCKDRMGqPpp522JPIFGzhSp8wpvh6nNGlUWoosMnA5O
         2AzZg41landaDKX32NRfO7V8B92XRLibq0AbenoJk1cM4Rp4Wlfpumbbfitabkntdf/X
         tplRX79RI/R7cU/VE1pQDBBOV4Co0Fer4OCwsiFke6Xc8chwGOVOYDg4LPl9JF48WAVJ
         V6vA==
X-Gm-Message-State: AOAM531EmlyjwOnDtTMHP5KIDuF+HDlScd9+RAkk+8J/uH8BCrZ1yHo5
        dkhyek9vqTN4Tq9b8PUXATM=
X-Google-Smtp-Source: ABdhPJxCm2PqeuEockuno6TIwl4nNORCwKB5Nnok6mZwsib7VZKpW+7JgEb2Rf3DGhiK8ufUgZWvAg==
X-Received: by 2002:a05:6808:169f:: with SMTP id bb31mr8193671oib.18.1632314368122;
        Wed, 22 Sep 2021 05:39:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l4sm456926oth.4.2021.09.22.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 05:39:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 22 Sep 2021 05:39:26 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Rob Herring <robh@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Oskar Senft <osk@google.com>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <20210922123926.GB3201379@roeck-us.net>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org>
 <20210921125831.GB1864238@roeck-us.net>
 <YUrRd3kTyLoCkLAt@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YUrRd3kTyLoCkLAt@localhost.localdomain>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 22, 2021 at 09:22:33AM +0200, Krzysztof Adamski wrote:
> Dnia Tue, Sep 21, 2021 at 05:58:31AM -0700, Guenter Roeck napisał(a):
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
> That was exactly my way of thinking here - many sensors have n-factor
> parameter and this is the name I see most often.
> 
> That being said, maybe it should be "nfactor" instead of "n-factor", as
> this is what tmp513 is using?
> 
> > In regard to units, the n-factor is, as the name says, a factor. Default
> > value is 1.008. The value range for MAX6581 is 0.999 to 1.030. For TMP421
> > it is 0.706542 to 1.747977. So the scondary question is if the value
> > written should be the register value (as proposed here) or the absolute
> > factor (eg in micro-units).
> 
> Since expressing the fractional values in DT isn't well supported and
> (at least here) hardware guys like to think in terms of register values
> so this is what I proposed. Also, I just noticed that, for example,
> TMP531 is using register values as well.
> 

I never see "someone else does that" as valid argument. Also, DT does
support fractional values, via units. It is perfectly valid to describe
a voltage as micro-volt, for example.

If the agreement is to use raw register values, I think the property name
should be prefixed with the vendor name, since it won't be a standard
property. I'll defer on Rob for that, though.

Thanks,
Guenter
