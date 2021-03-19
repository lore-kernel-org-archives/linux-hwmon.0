Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC91C433E9
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Mar 2021 00:17:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D321864F33
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Mar 2021 00:17:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233295AbhCSAQ3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Mar 2021 20:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232570AbhCSAQJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Mar 2021 20:16:09 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C36FC06174A
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Mar 2021 17:16:09 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id g15so1217224qkl.4
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Mar 2021 17:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i5KDOaUSmTUaar1Hct6l+MHBLaHk1XjZboRNxdbAAmc=;
        b=PN5NHz/1Fk3m8x4m2ta4VqdobXOWX8YSvAY+zEb8JKx94eFneybNs8l9BkXmA5Nb/h
         Hohse4s6VEfk2yQo2z+xWOnxVAPezFB6GGXFSvw1zDKKNrEXZbL93hXFZlquZBsJO7wn
         6qF56X/9nd7KNfeuR/oMIiHXp8nJe4rOb6Y3K5nOLf74FEtIjDXj1aUJRmvoASUv26Os
         pML3PBeErzNMwkedGI3Dn/i5KqrJvYH4pXO9FuVz9LS9UTn+tuu6F1VPuseXlTRIWfEy
         yX7cyZDTCjenOPtC4awz5cfWgN9R8VHJoGvYcn8yjDf7H2CsHnn54zv2U5OQfxXgBK0N
         QjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i5KDOaUSmTUaar1Hct6l+MHBLaHk1XjZboRNxdbAAmc=;
        b=Ee8qF3SwGphoSG5giKxUfNCFeay9ykevR5USxcNUnv5EXv0Ae3znragMkbEdTyNJ7g
         nZgRYxz9FAGuZKviglCz3TyeIqhOI2xpM2C6D4krrhLaFHeiqQb9NpEmUZqFF3I4ZfQ9
         uOKgC2uw0zFOzqdgVUEtrCCoM8Rz0GzGrtWu4NW3xZ9EdOC8UJetKU7UQyJ2M3On3bXU
         heFrlDqcMNWc3UQaOL1Tqh9woJTsFla7W6Jz4XUrZjHGxhqFE5438WyLXLWj9haJV3O8
         IxgTsFG34KqjQtNcpZCEiq9n+Qc1Vnuht0vfNroB1p3BoFupixrNd70KvIBAPagm6gs3
         SCTQ==
X-Gm-Message-State: AOAM531lJI/muO+fuqqgE/rcjl+64KrLoPGruhQguZGsslp+TGu4vYLj
        P3O29lOvx4ESkl3eQJMQQoe/5A==
X-Google-Smtp-Source: ABdhPJxOSauyRuNgkLNGet+IZSxoGTt23FyQDc+yoi2rGEqdx8ZQ8V1Uh7L2X7IbgY1fDdl4Fuh1vQ==
X-Received: by 2002:a37:a2c8:: with SMTP id l191mr7086297qke.413.1616112968757;
        Thu, 18 Mar 2021 17:16:08 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5a:802e:bdc9:ded9:cc08:a4e9])
        by smtp.gmail.com with ESMTPSA id o7sm3199097qkb.104.2021.03.18.17.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 17:16:08 -0700 (PDT)
Date:   Thu, 18 Mar 2021 21:16:04 -0300
From:   Jonas Malaco <jonas@protocubo.io>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: add driver for NZXT Kraken X42/X52/X62/X72
Message-ID: <20210319001604.ta7tgnm5uyqz4lvn@calvin.localdomain>
References: <20210318164824.21374-1-jonas@protocubo.io>
 <8d59a1fe-e38d-3f1b-601d-26a9bcf7272f@roeck-us.net>
 <20210318231506.v4dvz4jtvqazdoo2@calvin.localdomain>
 <20210318233608.GA140894@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210318233608.GA140894@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Mar 18, 2021 at 04:36:08PM -0700, Guenter Roeck wrote:
> On Thu, Mar 18, 2021 at 08:15:06PM -0300, Jonas Malaco wrote:
> 
> [ ... ]
> 
> > > Either case, the spinlocks are overkill. It would be much easier to
> > > convert raw readings here into temperature and fan speed and store
> > > the resulting values in struct kraken2_priv_data, and then to
> > > just report it in the read functions. That would be much less costly
> > > because the spinlock would not be needed at all, and calculations
> > > would be done only once per event.
> > 
> > Oddly enough, this is very close to how the code read last week.
> > 
> > But I was storing the values in kraken2_priv_data as longs, and I'm not
> > sure that storing and loading longs is atomic on all architectures.
> > 
> > Was that safe, or should I use something else instead of longs?
> > 
> 
> Hard to say, but do you see any code in the kernel that assumes
> that loading or storing a long is not atomic, for any architecture ?

No, I don't think so.

> 
> Also, I don't see how u16 * 1000 could ever require a long
> for storage. int would be good enough.

Oh, that's true.

I'll submit a v2 shortly.

Thanks again,
Jonas

> 
> > > 
> > > > +	memcpy(priv->status, data, STATUS_USEFUL_SIZE);
> > > > +	spin_unlock_irqrestore(&priv->lock, flags);
> > > > +
> > > > +	return 0;
> > > > +}
> > > 
> > > For my education: What triggers those events ? Are they reported
> > > by the hardware autonomously whenever something changes ?
> > > A comment at the top of the driver explaining how this works
> > > might be useful.
> > 
> > The device autonomously sends these status reports twice a second.
> > 
> > I'll add the comment for v2.
> > 
> That would be great, thanks.
> 
> > > 
> > > Also, is there a way to initialize values during probe ? Otherwise
> > > the driver would report values of 0 until the hardware reports
> > > something.
> > 
> > The device doesn't respond to HID Get_Report, so we can't get valid
> > initial values.
> > 
> > The best we can do is identify the situation and report it to
> > user-space.  Am I right that ENODATA should be used for this?
> > 
> Yes, I think that would be a good idea, and ENODATA sounds good.
> 
> Thanks,
> Guenter
