Return-Path: <SRS0=YkMd=A2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9668CC433E1
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jul 2020 14:47:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F46320658
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jul 2020 14:47:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFIKu/Le"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbgGOOrk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Jul 2020 10:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbgGOOrj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Jul 2020 10:47:39 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D3AC061755;
        Wed, 15 Jul 2020 07:47:39 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id b92so3077392pjc.4;
        Wed, 15 Jul 2020 07:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IobntdAqLAzNgS0yAcf/LHLYgenUrNt8J69zxWu5ZI8=;
        b=TFIKu/Le87nO5WhRBvJE/vQpIXVsvp3RU/xHgrEp0JyyBWIjJB825cU6brBbukXg+t
         4MdofblkumBS9UKuloX1sL7kCuObDWOZdrWvkmjwtUVX6ITEm72ysKGuS2WIUM+NdAZy
         6kUkEZS/wgd2m2BW5zX1lpTyGMiS6/+HuT+PJYSTbC/Vz9tO8B9iD79fGIvzLyZ3PqZn
         oB8i0Y8825CvklsheX9769cjT2AZugyGtMebcVEE9N1qyQvVgakZ8sJOq61Q6ipVeisa
         9fBVWc0V6TCzRRgEOXtLMM/kUo3i1+Zfg7bTmpp7STNdgVXndQ9EOhq49D1rEov1JEbL
         n7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=IobntdAqLAzNgS0yAcf/LHLYgenUrNt8J69zxWu5ZI8=;
        b=p+yV+h0hciomBVzDjW3Dx/8dELIQ8lGJWIsQjGsf3H4VbaZDUUktMN+UPyoZtzN0UE
         NSYNdwZM/O6bTMAYLQNrERiZ95LYC5MA7pmyZ9Aes23cXohbCctpb1t29ILziFnstVfb
         bTZ6eeRhi5tuEvc2EFUX3BV0wpbsDbPGLuuKEprXggDCY/GQm9VuHqnFnvY/159xYTOw
         +IlHMl+G7dBzLsC6WFiiX2uwARu8gYzpo1DGKGr0IPg66TDDzw87PTXy0hbmDnN9UPZO
         cp3NiWKLVneFbBV4gZgplgGZ/rL7JqTI33wTjxu69LNXrt0uRNuKnYdevHS8+ZaXxvTR
         8KYQ==
X-Gm-Message-State: AOAM530DvnDYUgcu15HFcroMpNie5kjM0XraBao2li+E5XcYbDF8FHyK
        3mdS/qx/zoFkACE39i3E+O4=
X-Google-Smtp-Source: ABdhPJyIek86YypCOAOmpgOAQ+dVNaGUZYqbJRGVa8r1wS8KE5TxAJy493iJVxLtJ6w7giFSTXPDJA==
X-Received: by 2002:a17:90b:4910:: with SMTP id kr16mr808pjb.126.1594824459473;
        Wed, 15 Jul 2020 07:47:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s187sm2835660pfs.83.2020.07.15.07.47.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 07:47:38 -0700 (PDT)
Date:   Wed, 15 Jul 2020 07:47:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     jaap aarts <jaap.aarts1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-usb@vger.kernel.org, Marius Zachmann <mail@mariuszachmann.de>
Subject: Re: [PATCH] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <20200715144737.GD201840@roeck-us.net>
References: <20200714100337.48719-1-jaap.aarts1@gmail.com>
 <20200715030740.GB164279@roeck-us.net>
 <CACtzdJ1XNjF7d4WcMCtxWkGiWHoF37aQfYNMn+9UtKHeo07X1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACtzdJ1XNjF7d4WcMCtxWkGiWHoF37aQfYNMn+9UtKHeo07X1g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jul 15, 2020 at 01:18:58PM +0200, jaap aarts wrote:
> On Wed, 15 Jul 2020 at 05:07, Guenter Roeck <linux@roeck-us.net> wrote:
> >
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
> I cannot find this driver at the moment, the only corsair driver I can find
> is the HID driver. As far as I know all asetek gen 6 products use the same
> interface. Out of curiosity I contacted asetek to confirm, but other userland
> drivers have used the same code for all products of previous generations.
> > - What about HID vs. USB driver ?
> This is not really a HID. I asked in the kernel newbies mailing list and
> I was told HWMON is probably the right place. Most of the code is
> related to HWMON so this seems to be the right place to me as well.

Question is if this identifies itself as HID device. If it does,
it would either have to be blacklisted in the HID core, or it would
have to be implemented as hid driver. The latter would be preferred,
since otherwise a userspace application accessing it directly would
no longer work. Either case, the driver can and should still reside
in hwmon; that was not the question.

Thanks,
Guenter
