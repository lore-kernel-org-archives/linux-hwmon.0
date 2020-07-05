Return-Path: <SRS0=nCRF=AQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBCFC433DF
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jul 2020 15:15:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4594B20674
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jul 2020 15:15:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wrrvkh8a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgGEPPo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jul 2020 11:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgGEPPn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jul 2020 11:15:43 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9284FC061794
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Jul 2020 08:15:43 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d10so2332755pll.3
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Jul 2020 08:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=9EEeOIWxhtfXWzpdso1O9YJh+Le6Yw20Pvs6SJ/MbaU=;
        b=Wrrvkh8aqeagPFG7uf5QLd6vM+4FQVGSCGRBTRcWMMNwct0b9I1kcITWVYwRO+i4MJ
         MNozuGLkxVwJGiFoB8yvDWLPabSOs+96IG9rCgK6cccgn/kt1GdHGY/wNAyHfrmZ2Z9r
         +pq3U7rrKF4e7nkgV3G0jDHzP3n2u/EeHVa07/KN6lMHaXHX5DShx9Kgy4MEK0p/5pdd
         p9S+PZbqwoGPWp/RpUfrj+wA2vlDghm4CxTRWJUkoPFgDnVRyEU91tBujZofu5VdssPe
         DfdiMxXtdFZZW5tXhWnHZ27PsLauXXxEjsU+CeAlXeGE8LRsux3n8ZcX69gXDo4z5SEh
         05HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=9EEeOIWxhtfXWzpdso1O9YJh+Le6Yw20Pvs6SJ/MbaU=;
        b=O67zX1kGKlOcV5ZDEOj2P5ChU7oN9iY7HCrQexAm6WSycGeqklgt/LwJFoxGU9lnS6
         wYGoNfZDB8CXO29HfT7AvAcE+LEe5RAlE65NXFEjndiOpmmDQElXP0Gobrxcc/EUEbsr
         DKTYC+DH0IEfFTGwXNQD2giAULk2KJsdCDKrMVoYRGEJApJkXXFPlt7V3bZnxiOL/L5K
         2pe9YVlYRXRtNVSv0l2N/nUqx9fP1/Gexn5yqsHZN7p7SXYqiKGbsEoF3qtSFKcUUgZq
         sc3qpaYim1FHTVvU6AY4lI3hykDVeI3WTR+AeTJDZbfYRLYgCfXmPKqI7jjSfuMlKC8U
         f80w==
X-Gm-Message-State: AOAM533F50jNVEhnYUCbDlqWV3m95hGy0R5jqTU1JsH1S2Dl8DFeJ2um
        7apofxuTach1lTJyWxe9DJ0=
X-Google-Smtp-Source: ABdhPJxXtD4S27dP0EkD2ZP+SzpDZcbVVFaG5xrUA/xyCtcugKIG6n0OiOXr49GhgHH1XPjVqZpCTA==
X-Received: by 2002:a17:902:b682:: with SMTP id c2mr29158844pls.273.1593962143077;
        Sun, 05 Jul 2020 08:15:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v2sm10836462pje.19.2020.07.05.08.15.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 08:15:42 -0700 (PDT)
Date:   Sun, 5 Jul 2020 08:15:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [QUESTION] fan rpm hwmon driver
Message-ID: <20200705151541.GA5663@roeck-us.net>
References: <xU_nzuNaKzomGSEsIdtEGvDVgR0MuUoti45TC5WzkVu0FscRsOEp7dzY4tGOoUkvrG9QPJethyosMSnxcXFuE-xcpqJ6DQwfnPkPlFiEcbY=@protonmail.com>
 <3b92f53f-fd3f-a432-aae1-620582701286@roeck-us.net>
 <vCYQSnYIKROnbBCa77NtCP1VqtQUNl8cItazgNFjTJfmzRogHKpxkUThwzQnv-HXuISOOhhZ_J_gM2Pm-Y8dwfp2c6IxY2LYirIgdbriYwQ=@protonmail.com>
 <3259b471-c3b6-ef22-e5c6-813313395cef@roeck-us.net>
 <gPUUkJgSquQcl0TQu3m4-RdGPCj7xKAyRqgZlbIcu0FoA3egKZHq6VUMpNDMLJSp5Vs9GTRV7QWOfKJR3Mv4zgKof9JtJn_bAjAZu6Rykkk=@protonmail.com>
 <097a08db-2afb-f220-75d3-caa9d37fd1f9@roeck-us.net>
 <OiRhgUQ7biZw0KwFjt27l2MOveHFmJ5I2LevL0Uh84m1lPTioycSKybzJlMzjkGpcQkVnOOI4kiY7vKQ2Yzw7-uHub8OsCUir6RsmFIE9go=@protonmail.com>
 <1507eedb-c78c-7333-84ec-880e1ea1b1c8@roeck-us.net>
 <DHROZx6CXFIpnoRAMmpc1kubP3PaZnOhmjA3lnNsC651w4Zk-bIxrYhAdrVPofTDFj3ODQDmHfIKDDTRmok1FpYJAXF77qAYb9wmP2R9b14=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DHROZx6CXFIpnoRAMmpc1kubP3PaZnOhmjA3lnNsC651w4Zk-bIxrYhAdrVPofTDFj3ODQDmHfIKDDTRmok1FpYJAXF77qAYb9wmP2R9b14=@protonmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Jul 05, 2020 at 02:43:46PM +0000, Barnabás Pőcze wrote:
> 2020. július 5., vasárnap 15:23 keltezéssel, Guenter Roeck írta:
> > On 7/5/20 4:34 AM, Barnabás Pőcze wrote:
> > [ ... ]
> >
> > > > > Furthermore, did it help answer the "who is going to maintain the driver after the initial submission" question of your previous email?
> > > >
> > > > A driver is not write-and-forget. It has to be maintained, preferably by someone
> > > > with access to the hardware. Otherwise it is going to bit-rot. Do you plan to
> > > > volunteer to do that ?
> > >
> > > I have no clue what that entails, but I am assuming: fixing bugs, accepting, reviewing patches for that driver, then forwarding them upstream, maybe also updating the code base according to the best practices at the moment from time to time, correct?
> >
> > You would not have to forward patches upstream (I see them anyway), but
> > correct for the rest.
> >
> 
> I see, thank you for the clarification.
> 
> 
> > > I would certainly volunteer if it is needed.
> >
> > That would be great.
> >
> > Something else that came to my mind: Did you examine the DSDT ?
> > If the board vendor did the right thing, it should include an abstract
> > means to read the fan data through ACPI. That would be much better than
> > having to read it from the EC directly.
> >
> > Thanks,
> > Guenter
> 
> 
> I agree that it would be better, I tried this approach because the Control Center software provided for Microsoft Windows uses direct port i/o, so I didn't really put much thought into the possible existence of an ACPI method to get the data, I am not familiar with ACPI either.
> 
> I did, at least I tried to examine the DSDT, but I could not really find anything fan related. Now I looked again, same results. Maybe it's that I don't know what exactly I should be looking for. And I feel like the acpi/fan driver should have picked it up, no? I could identify the EC, however. But I don't see anything relevant there, either. That's not to say there isn't, I just couldn't find it.
> 

No worries; at least you tried. Interesting that Windows doesn't use ACPI;
that is exactly what it is supposed to be used for, and Microsoft was
involved in writing its specification. Oh well, it is what it is.

Thanks,
Guenter
