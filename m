Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDFBC433DB
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Mar 2021 00:22:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBD7C61997
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Mar 2021 00:22:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhC3AV7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 29 Mar 2021 20:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbhC3AVi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Mar 2021 20:21:38 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A41C061762
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Mar 2021 17:21:36 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id c3so6213934qvz.7
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Mar 2021 17:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+ZkXqYoDX+FAm0xvt3yNtCo8uOVPksVsoKc/yRnHv20=;
        b=LlooFwGiDqHlX93thuHZmLBhQhle4oxNY85pRZKt7MEVMwacDPvwKGhOlPxcxSpI5v
         MGlsuMT2cBZvk6bvTnjJgP7v2bcUwx41pRyjwYDFp2q48cb5xgPxNsqaBSGX5L6U+FnW
         UKCEQ0OZR3tEZlleNIucf8FBJn2hwA9upfkoA+OPaMo5T+/ecSvKRIjM8Zmw/AcCzRHM
         z62EcDIzAPOjPOgnUV2/XOpdaXsC/AUFfefvE5xyjoZRZJ2hgzhexxtLP4uOZzwoIm0D
         sfdpA2FMiAl7uhhmaB1yTY1nK4NQOv6C2jOHjGSGT9CC7uDgycrRtDjSfkdGQS2sLgZ4
         bgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+ZkXqYoDX+FAm0xvt3yNtCo8uOVPksVsoKc/yRnHv20=;
        b=QOagtYs3KRheu/RPuikAckQag05BsuQ1FN29CHkN1jTkSTijWbruE6uhTYPkAbdi6I
         qPXd4WAQGx/ijTDhY8jIO+KOUMHBKd2PWZRzbrUU0M6n84Cz0HXZJsaVhsYgM33RwXS/
         AK8pLNNyGKvogajN/m3Y4ywdxDACxUfe2r+YwnpE7rcS1eaM+BysYX4bwVkREY1lTEnR
         4pFINsv+yzQ/6HiHCDeA1PQLzc4BkFTUG3ur7iCfoOXRZNDslcBcUxFOxqH0QFSewq1z
         frQFMHTeQ1fiZ3wzZ1VnOMR4oFQLrkQ9ZmQxHC4F1QdeCJewN9frQR+le3z4a6efrBo2
         L6JA==
X-Gm-Message-State: AOAM530gn04GPujqwlflxWxpauxlYvZh/g9g8VZ2rKTRFT1GS3DijW0y
        LxjRU2wMEpELM0t7QXLH1a7h/A==
X-Google-Smtp-Source: ABdhPJwp2jMLY8S9kaEns2gA8JXnhvKTOIvu66IT+dRu/S7AidGLZj8p1bPAKRSYl/IzVlurKuBIaw==
X-Received: by 2002:ad4:4e0d:: with SMTP id dl13mr27462620qvb.56.1617063695349;
        Mon, 29 Mar 2021 17:21:35 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5a:802e:bdc9:ded9:cc08:a4e9])
        by smtp.gmail.com with ESMTPSA id o36sm12317011qtd.89.2021.03.29.17.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 17:21:34 -0700 (PDT)
Date:   Mon, 29 Mar 2021 21:21:31 -0300
From:   Jonas Malaco <jonas@protocubo.io>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nzxt-kraken2) mark and order concurrent accesses
Message-ID: <20210330002131.s2qz3dr6bwr6jz25@calvin.localdomain>
References: <20210329082211.86716-1-jonas@protocubo.io>
 <20210329215339.GH220164@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210329215339.GH220164@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Mar 29, 2021 at 02:53:39PM -0700, Guenter Roeck wrote:
> On Mon, Mar 29, 2021 at 05:22:01AM -0300, Jonas Malaco wrote:
> > To avoid a spinlock, the driver explores concurrent memory accesses
> > between _raw_event and _read, having the former updating fields on a
> > data structure while the latter could be reading from them.  Because
> > these are "plain" accesses, those are data races according to the Linux
> > kernel memory model (LKMM).
> > 
> > Data races are undefined behavior in both C11 and LKMM.  In practice,
> > the compiler is free to make optimizations assuming there is no data
> > race, including load tearing, load fusing and many others,[1] most of
> > which could result in corruption of the values reported to user-space.
> > 
> > Prevent undesirable optimizations to those concurrent accesses by
> > marking them with READ_ONCE() and WRITE_ONCE().  This also removes the
> > data races, according to the LKMM, because both loads and stores to each
> > location are now "marked" accesses.
> > 
> > As a special case, use smp_load_acquire() and smp_load_release() when
> > loading and storing ->updated, as it is used to track the validity of
> > the other values, and thus has to be stored after and loaded before
> > them.  These imply READ_ONCE()/WRITE_ONCE() but also ensure the desired
> > order of memory accesses.
> > 
> > [1] https://lwn.net/Articles/793253/
> > 
> 
> I think you lost me a bit there. What out-of-order accesses that would be
> triggered by a compiler optimization are you concerned about here ?
> The only "problem" I can think of is that priv->updated may have been
> written before the actual values. The impact would be ... zero. An
> attribute read would return "stale" data for a few microseconds.
> Why is that a concern, and what difference does it make ?

The impact of out-of-order accesses to priv->updated is indeed minimal.

That said, smp_load_acquire() and smp_store_release() were meant to
prevent reordering at runtime, and only affect architectures other than
x86.  READ_ONCE() and WRITE_ONCE() would already prevent reordering from
compiler optimizations, and x86 provides the load-acquire/store-release
semantics by default.

But the reordering issue is not a concern to me, I got carried away when
adding READ_ONCE()/WRITE_ONCE().  While smp_load_acquire() and
smp_store_release() make the code work more like I intend it to, they
are (small) costs we can spare.

I still think that READ_ONCE()/WRITE_ONCE() are necessary, including for
priv->updated.  Do you agree?

Thanks,
Jonas

P.S. Architectures other than x86 are admittedly a niche case for this
driver, but I would not rule them out.  Not only can the cooler be
adapted to mount on silicon other than mainstream Intel/AMD CPUs (and
there even exists a first-party adapter for graphics cards), but it can
trivially also be controlled by a secondary, possibly non-x86, system.
