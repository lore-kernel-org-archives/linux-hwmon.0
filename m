Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0548C3DA7D
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Jan 2023 02:58:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234326AbjADC62 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Jan 2023 21:58:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjADC61 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Jan 2023 21:58:27 -0500
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7856317595
        for <linux-hwmon@vger.kernel.org>; Tue,  3 Jan 2023 18:58:26 -0800 (PST)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-14fb3809eaeso32833419fac.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Jan 2023 18:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NnT5z5SMg5lyByEMeGvjg98LQCubisxAhd8VSYd7RhY=;
        b=nLX6nLytqRZW3AOK2dJ77I96LifgF7oLAZQMPGbcJZu34svRVK+tNi6DXV9Ha8iNU3
         R+d0eBjhv5NEz5tTRQzUAghOMpG71ps2HA3NUE/RgjmvSmLSr9uWdge5+wRuDdeFGPFM
         6SwcM9LjJGCNNm3rgVQtva5L/7fWx8UcWi92O8DZXizqpZ4e00dg36fI4wy0B6QExC5J
         i8gbTItiDWRNc07RQFfdjabDNZ4repKzXzBAp4T6ZcKjACWZVOJuZPU8mZ/Dm80CNbMt
         +/gwUnuO8Dmp0PtWZlqkwNDacbN6Z368beEZJe1iiuzyPSXLfhdjiaql+ELspyRYg2Hw
         2CQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NnT5z5SMg5lyByEMeGvjg98LQCubisxAhd8VSYd7RhY=;
        b=HDbZwEUXwqx1KcsxQE2ruHxqZ9p+qnYQuqeNlefZADCQDG4cPXI77U79SPhbo31ko4
         7IUETtTHAsa4j8MGhMkc1bjub5AMjivUwjFE3efWq1AeYRDTK/NMXROv9pEOq6Lb1dYE
         bRRTnL0luVJdPJsGK39LB3VhPHCJyFP5H13omzZ1U0gV9vu+rl6j/h+SQoUes+J9SrTA
         OKS14fWRNuy+UVyUMauDpXes6oart06mMIZKHqTB06X0IA02c6yF/TwCcecle5ySJku8
         eRn9V3H5atLJ6yuGFn46SWcUwNIqOP1Zs50pxvJrXXxA1pU0WfXpuWXBgjT4lWlD1Nnd
         CciQ==
X-Gm-Message-State: AFqh2kr7F8vAPuNc6qSsoQhPD8+zzU91e++Gutac/tnz2mRy+tH5SbAH
        3x6cud8CqiPVbu0WXl8IrPS6AcIgSig=
X-Google-Smtp-Source: AMrXdXsrUmocWAszEJu8jIH3BXtSr7vFWbGNi3NYHx/ysNKMEoE4CsAXXM7WAkrjmqZpi21ucUmF3A==
X-Received: by 2002:a05:6870:ed86:b0:144:81f0:d098 with SMTP id fz6-20020a056870ed8600b0014481f0d098mr24085725oab.45.1672801105767;
        Tue, 03 Jan 2023 18:58:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r17-20020a056870415100b0014c8b5d54b2sm15069623oad.20.2023.01.03.18.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 18:58:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 3 Jan 2023 18:58:23 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 1/2] hwmon: (it87) Allow calling superio_enter outside
 mux
Message-ID: <20230104025823.GA227163@roeck-us.net>
References: <20230103064612.404401-1-frank@crawford.emu.id.au>
 <20230103064612.404401-2-frank@crawford.emu.id.au>
 <20230103183707.GA204971@roeck-us.net>
 <164ad5b0da8309728955ff06b7cae863c8d8f3df.camel@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <164ad5b0da8309728955ff06b7cae863c8d8f3df.camel@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jan 04, 2023 at 11:37:28AM +1100, Frank Crawford wrote:
> On Tue, 2023-01-03 at 10:37 -0800, Guenter Roeck wrote:
> > On Tue, Jan 03, 2023 at 05:46:11PM +1100, Frank Crawford wrote:
> > > Allow for superio_enter to be called outside mux, in particular for
> > 
> > "outside mux" is really a bad wording. I had to look into the code
> > to understand what it means. "without requesting the muxed memory
> > region", maybe.
> > 
> > Guenter
> 
> Will update with better wording, such as you suggest.
> > 
> > > initialisation of the second chipset, which must be entered, but
> > > never
> > > exited.
> > 
> > The second chipset is not "entered", it must enter configuration
> > mode (or be put into configuration mode). The name of the function
> > does not reflect the associated functionality.
> > 
> > Please rephrase.
> 
> Will do.
> 
> Do you believe the function should be renamed as well?

No. "enter" in the function name is short for "enter configuration mode".
That is good enough for a function name. Description and documentation need
to be more elaborate, though.

Guenter

> > 
> > Thanks,
> > Guenter
> 
> Regards
> Frank
> > 
> > > 
> > > Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> > > ---
> > >  drivers/hwmon/it87.c | 13 +++++++++----
> > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> > > index 9997f76b1f4a..4ebce2c661d7 100644
> > > --- a/drivers/hwmon/it87.c
> > > +++ b/drivers/hwmon/it87.c
> > > @@ -87,6 +87,14 @@ static struct platform_device *it87_pdev[2];
> > >  #define        DEVID   0x20    /* Register: Device ID */
> > >  #define        DEVREV  0x22    /* Register: Device Revision */
> > >  
> > > +static inline void __superio_enter(int ioreg)
> > > +{
> > > +       outb(0x87, ioreg);
> > > +       outb(0x01, ioreg);
> > > +       outb(0x55, ioreg);
> > > +       outb(ioreg == REG_4E ? 0xaa : 0x55, ioreg);
> > > +}
> > > +
> > >  static inline int superio_inb(int ioreg, int reg)
> > >  {
> > >         outb(reg, ioreg);
> > > @@ -124,10 +132,7 @@ static inline int superio_enter(int ioreg)
> > >         if (!request_muxed_region(ioreg, 2, DRVNAME))
> > >                 return -EBUSY;
> > >  
> > > -       outb(0x87, ioreg);
> > > -       outb(0x01, ioreg);
> > > -       outb(0x55, ioreg);
> > > -       outb(ioreg == REG_4E ? 0xaa : 0x55, ioreg);
> > > +       __superio_enter(ioreg);
> > >         return 0;
> > >  }
> > >  
> > > -- 
> > > 2.38.1
> > > 
