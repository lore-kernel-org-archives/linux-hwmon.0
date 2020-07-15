Return-Path: <SRS0=YkMd=A2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C290C433E4
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jul 2020 14:20:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 726512070E
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jul 2020 14:20:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oeoL5IV8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728252AbgGOOUX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Jul 2020 10:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728153AbgGOOUW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Jul 2020 10:20:22 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 732BFC061755;
        Wed, 15 Jul 2020 07:20:22 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a14so2161387pfi.2;
        Wed, 15 Jul 2020 07:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=crY5PdtmONkmu7EllSHMlxQjp0bQxtu9Ntocx7fW940=;
        b=oeoL5IV89uCxspor2dySk6emE8JK3DjpxTAaXsMMODH87Jq44Fp2lADfvONj8icga1
         WYQlkZdvlk2nThgFkvrlhICTW6rurGpPz8obz3Ecq5kSOyoJAh/2VvS6/HDcGfPvjfRp
         7AkQ3jJY4lvgyM8VcPgdCzlWSHxmg13BZyQWogi46H4cVXV3wp98uvWJo90iJIoErX9g
         ZpfatQFMXEBhVJDYfoSfRLuxeBR87Zqmi2QJ1JXXKdhfmjkVU3n2ktfgNB6wrP/EixeE
         NgnI+AmhBoV/P1nIFXVZWu6KDxRPVIvjvyyVDwp1CnvLFO6u+h909SG0wVHfGrD3kLq5
         BSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=crY5PdtmONkmu7EllSHMlxQjp0bQxtu9Ntocx7fW940=;
        b=aCUkax4G7JMUV+57wOTWDO8hnbgpr7kRAlRRXT/CZLgMGwnZI6+3+mIoLfemTCWCXc
         xQ04iq40yg8cYQaGrHnrjxJAbRedoPoMTu0ozNSOMBUZ/F7lWeKguhkzCvOte4zlfyky
         kFpJHkFztNIAZzrS7KYSkzddhn0/WMYRtwDMZsVFHjZUzBgxMGCLHjP9yUDGlPvN69ko
         pyhJkhxk+MHh5ddREf5l/TlGvoA+ncLTzhsg3/3De4jZv8EpOoX8Yb5jnvjlBqAjKYeZ
         /STh4FaAEd5xrOTVE6De8a5yosam/Qlw0OGHQfd35wtYCLqsbu+qqPMZLRJHyw+0eBY8
         m/UA==
X-Gm-Message-State: AOAM533BccYOE28tXS1mYYT6D62F1Ko6Nt0zuZCCKlAsd4OXbMVpijW3
        dDTV5vMjRQC6grVofLOGbigg0rGL
X-Google-Smtp-Source: ABdhPJyo8lxu6cti37xEA4uvlViaUZR222Ba2zucd+OXm19pyFNMF5zLeRk7cTTvBhXarfyPP3yJgA==
X-Received: by 2002:a63:5a01:: with SMTP id o1mr8163204pgb.337.1594822821933;
        Wed, 15 Jul 2020 07:20:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o128sm2354485pfg.127.2020.07.15.07.20.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 07:20:21 -0700 (PDT)
Date:   Wed, 15 Jul 2020 07:20:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marius Zachmann <mail@mariuszachmann.de>
Cc:     jaap aarts <jaap.aarts1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <20200715142019.GA201840@roeck-us.net>
References: <20200714100337.48719-1-jaap.aarts1@gmail.com>
 <20200715030740.GB164279@roeck-us.net>
 <2845728.4EH8KBbfVN@marius>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2845728.4EH8KBbfVN@marius>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jul 15, 2020 at 02:17:37PM +0200, Marius Zachmann wrote:
> On 15.07.20 at 05:07:40 CEST, Guenter Roeck wrote
> > On Tue, Jul 14, 2020 at 12:03:38PM +0200, jaap aarts wrote:
> > > Adds fan/pwm support for H1000i platinum.
> > > Custom temp/fan curves are not supported, however
> > > the presets found in the proprietary drivers are avaiable.
> > > 
> > > Signed-off-by: Jaap Aarts <jaap.aarts1@gmail.com>
> > 
> > +Marius Zachmann for input.
> > 
> > Questions:
> > - Does this really have to be a different driver or can it be merged into
> >   the corsair-cpro driver ?
> >
> 
> From what I can see the protocol has quite a few differences.
> A merged driver would need to implement functions like e.g. set_pwm for
> each device seperately. Also error handling and buffer sizes would be
> seperate for each device.
> If there were more usb/hid drivers in hwmon it maybe could make sense
> to have an additional abstraction layer, but for now I do not see
> anything which could be gained by this.
> 
Ok.

Thanks,
Guenter
