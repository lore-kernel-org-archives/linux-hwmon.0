Return-Path: <SRS0=NDU9=AR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC45C433E0
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jul 2020 16:38:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70F142073E
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jul 2020 16:38:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="VVxNk1Of"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729561AbgGFQiW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jul 2020 12:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729500AbgGFQiV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jul 2020 12:38:21 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5AEC061794
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2020 09:38:21 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id k6so33436939ili.6
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2020 09:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8+99WD3U/6R4HDUu0jjDRUO5gvAoEvSDisK/fWGBtg0=;
        b=VVxNk1Ofuiz7emISK2L35m+IukHuIW416oK1Ajhtd5QO4ywQLmoMfJ8fBPXhh+oFgm
         1F6/0dpmWhZaRlSl++KJQzyOwydlsOXEbgKx42Qc4ocLxtTbj4/jUGbOil7dSEi28JI+
         162nK9g9Gdmxa49RnyueixSZ58ylMRJuvdurxaA7Q050W82YpSUzggS+rWeNj7r0Zt63
         sZH2yh0k33xHOqnPZl6bhtYEFEdJ5jfjM7Qy4Vknlq6xkzbilESrkv5SLsv+R9YmOj7z
         HXs7ly1C6fa/jym29MhNWyOyJlqHPMVU7WKQ0L0lw+vWsdbe1+0YRjog7GOmpFDJSirN
         oqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8+99WD3U/6R4HDUu0jjDRUO5gvAoEvSDisK/fWGBtg0=;
        b=CFWWS5f6OxUQZ+1NmLWXX97cfdyolQWClOjADj1I/bIJfVszTfHtkkgY9r7jTsOISR
         ttvLz26fygVlhF9+H97Rrgoerskz4+JC5ENuo7/J5zDIeAwtOm46j0gf+iG+A5jq62Ko
         eJcobyOWqfQCqQSH/Jh6QVHDtEq33VDWRhD2w4NZeuCW0p3a89JdPq3G4rOb86Jtb/Y7
         6OIW5h7y8j7ORJ3nbc+1EuOUOvd1b/GosTCyGn4nj0ckmHMQNhbmPgN4BLB6TQAzs6Pw
         NF2COxL4j5lqR3TS6AY7zmhmXNbMbxM7qecufUsKrfNgMpmoh94XMo7npNfRYWm3wT0z
         u1nQ==
X-Gm-Message-State: AOAM530x+ryLgQmqQxkQ5ADogC0H6Km13lx07lupWdHpHU63O1RVjQpw
        OS5QBaJeW3HqcdH+uYU+fohgENT9dBp+vJwuyiNspA==
X-Google-Smtp-Source: ABdhPJx0SIxBz4fLuwZoUg4YqvsM3FJUy44gCdIvpRgsjRFo0Ps/VJV5gdXzkVuqIEezz8FdtGrAHOF+U2R4FhdTN3s=
X-Received: by 2002:a92:c213:: with SMTP id j19mr31504216ilo.40.1594053500918;
 Mon, 06 Jul 2020 09:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200629065008.27620-1-brgl@bgdev.pl> <20200629065008.27620-6-brgl@bgdev.pl>
 <20200702124258.GA1882489@kroah.com> <CAMRc=Mc6dWCtnFT_SMGLUsggf68i3y7Njr61NyDQ7KeQ-rSErg@mail.gmail.com>
In-Reply-To: <CAMRc=Mc6dWCtnFT_SMGLUsggf68i3y7Njr61NyDQ7KeQ-rSErg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Jul 2020 18:38:10 +0200
Message-ID: <CAMRc=McxekKgEFe2y3R1SiA0ZhLZXsUrzMXWgwXVtHtymG75ow@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] devres: provide devm_krealloc()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jul 2, 2020 at 3:11 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Jul 2, 2020 at 2:42 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Jun 29, 2020 at 08:50:07AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > Implement the managed variant of krealloc(). This function works with
> > > all memory allocated by devm_kmalloc() (or devres functions using it
> > > implicitly like devm_kmemdup(), devm_kstrdup() etc.).
> > >
> > > Managed realloc'ed chunks can be manually released with devm_kfree().
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> [snip!]
>
> >
> > That's a lot of logic that does not seem to match up with the krealloc()
> > logic in mm/slab_common.c, are you sure we need to do all of that?
> >
>
> What are you referring to exactly? The check for rodata? It's because
> devm_kfree() handles this case, while regular kfree() (or krealloc())
> doesn't - there's kfree_const() but no devm_kfree_const().
>
> > Who wants this?
>
> The hwmon commit I mentioned in my response to patch 6/6 explicitly
> mentions the lack of this helper.
>
> Bartosz

Hi Greg,

As we've established in the discussion under the iio patch that there
will in fact be more users of this - can this now be merged too?

Bart
