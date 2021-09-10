Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B4AC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Sep 2021 15:54:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64F3860F6C
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Sep 2021 15:54:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234499AbhIJP4E (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Sep 2021 11:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbhIJP4E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Sep 2021 11:56:04 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24098C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Sep 2021 08:54:53 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id i28so3915744ljm.7
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Sep 2021 08:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TMo3mcFlWrKvJ3L++zESEDnavMYSDAorclHmS0MxK7w=;
        b=RSx/YdU6H50e6thHR57fuiVCi1zCAOJEzQfEp1aEN5KOcS4/GhfwPSmwqT0qLdmxG/
         k160zewwoZQ6qb61EnC8ixFfaKf4nKr1U0gPeQPimvouYFoHRFZKsZ+Cth9HNqrELhqe
         uGdEJ0Q0uIhyXFRoyE3YuPuJxuyYRNPAqGyzgIBBhuE1+snCxE5Rqr0NyNjmKt1XMeAB
         I3+FaqAFvHcnO58uWQ4VB7oABH724fgEkIoFfJc7WwnVUuYeJlDo2Zhev/3AdaiQbVp6
         x9AnorvbXMm62S4+i5H8gU+rHo8hMUhvhw8TqlV+tU/J65ODFYE1ZZ+zWWarXuAY3zfi
         K0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TMo3mcFlWrKvJ3L++zESEDnavMYSDAorclHmS0MxK7w=;
        b=bhqBGRH1hGXxruBNya064ZHxeUpxEIudfvEuMJjbR8kwcFEKs2iBH5OVtb3M3AxJy2
         d7jbImdOX0L04o19PaimQEhMbnAl5l+lB0f32uCa1qiW5VnxGtVY0QnfsnMa8yrIzrGe
         3JBjwuxVJqNLXdm8AaRl+j+jC+Dqv35DgtNeNoTDKfxfKC5YymXyds7l6aNQQLJnS0Ty
         1Ax15v2jIIFKdmcSylpO3PY96OTBU1yhNZCtQf4oGGlf17NDX+5volHqbZJ0OVwgTRDE
         a5oGkg4ibGYyWvkEXDlr0qNtlg7iROElTy8q3nwQ6I4CLGOlFolYpsn04dNVyh3Jl5Px
         oqkQ==
X-Gm-Message-State: AOAM532VWZNA97vZeHMA3QxC5xNfVlUJejVYJIF1F46CydGtakcFmSjG
        ryjwpzdeSmj4HBlGQaxSaO6goQ5SqXdZGaCAQoT+JRViOodZ0Q==
X-Google-Smtp-Source: ABdhPJxj93rUdHZe2RDmmtQ/sjKk2wRx5njUF+hbEesEivVMLm9GF3A4Cg1/U6/tJBUO6hE1tl/PIdtTNKOuUhRxQVM=
X-Received: by 2002:a05:651c:178e:: with SMTP id bn14mr4813834ljb.521.1631289291268;
 Fri, 10 Sep 2021 08:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcTEjKYwnFS1dB+-rGCM9BYvFBY1T1_M0OpdjqAy+M8SCQ@mail.gmail.com>
 <20210909170230.GD3973437@roeck-us.net> <CABoTLcT_EMexwCFuRAFVqZmrdCe05ec4U7CD8-+BLzEAd5QkgQ@mail.gmail.com>
 <6d6ac8fd-f014-6196-a9c6-a5b066c98fc1@roeck-us.net>
In-Reply-To: <6d6ac8fd-f014-6196-a9c6-a5b066c98fc1@roeck-us.net>
From:   Oskar Senft <osk@google.com>
Date:   Fri, 10 Sep 2021 11:54:35 -0400
Message-ID: <CABoTLcQ9zbwxijAY3VQKOYmDKHzXszjPwnbdi-Z-E6gv8kHKZw@mail.gmail.com>
Subject: Re: nct7802 mode selection for RTD1,2,3 via device tree?
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> > I just sent two separate patches, one to add the device tree bindings
> > and an independent patch to add the RTD modes configuration.
> > I hope that was right?
> Kind of. In the future please send such patch series as series.
Argh, I'm sorry. I wasn't sure if a series would be better, since
there is a slightly different set of maintainers. But I guess people
can just filter out what doesn't apply to them. Next time! (or in a V2
patch if needed)

Thanks
Oskar.
