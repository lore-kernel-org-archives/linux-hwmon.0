Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A347C4361B
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Dec 2020 09:05:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1847B22225
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Dec 2020 09:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgLOJE0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 15 Dec 2020 04:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727727AbgLOJEU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Dec 2020 04:04:20 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E80C0617A6
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Dec 2020 01:04:04 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id o11so18636140ote.4
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Dec 2020 01:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Os33hzl1I4JrVcBc2NboLIV9AXajTqEGTG/MO5gIIA=;
        b=JSyKIzas5kymBH6tBxEg4KYgJIS7B1ABlQS0ZgbHcDVUhMtOJOIBkUG8oVUf2xyE38
         Yi/DwKl/rcy7yjH3AulYbMJTt0+ojd4c4GkFRfUDBUXDhhdGL1N0TDOAvVIxD+4+acjU
         mONy013pwy8tLKUjRRdsuZz+CRSx1++cmK49I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Os33hzl1I4JrVcBc2NboLIV9AXajTqEGTG/MO5gIIA=;
        b=m+awyAMYxCqCiVpsSDuIBPABKGWwS8sx8lbz5bWor1DdGyBIGV7l7Y3F6HsExCVXym
         0wKzIQFI166ja8dOhWeZj32NEO/jcy4zqC1E6B0iHbwdPfDYDmI7qYX945keqfpn/JJV
         PRUsCGhqHhpVUWNYDHZC4CV+Tu6BoC7qOrplde8uuaTmp4Zc2XeeSDVveNS4lbFKozlQ
         AR102Ntc+xEieNm2KtXIcM+ZpFzIy+AMpd/WxBikmZ5RDQFo9PjNhzuafF/G8ZlQ8SGn
         jl49EhXWR9Re1Y6Y5blqQr0h2hYvQP2XELSLIiwqs6V/9DFMWrcTuu6Kn8zb0mB+pca4
         VUlg==
X-Gm-Message-State: AOAM530qkxkelqt+OYKStd1g+CkiwOxA68Y/2Fi/IsLuvkCNhiw7MCKh
        8OngP2TfAnqTds4KvLvfED4JGffqHiY595tJnGgB9GmiERw=
X-Google-Smtp-Source: ABdhPJyFYzqWRHlZ726aYfoNePEegTQzd/kmmERgpbYpHGtgjMjXkYZ33v0YYXoHy1iJRlrBAen1+2smr+YM4qBD52o=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr22482636otm.305.1608023044378;
 Tue, 15 Dec 2020 01:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20201214213044.27252-1-linux@roeck-us.net> <CAM9ZRVs3gBoYYQ+M1qUiLpuFTD0c_vxdNgDTXoXisne-Y8ZwQg@mail.gmail.com>
 <20201215005406.GA232073@roeck-us.net>
In-Reply-To: <20201215005406.GA232073@roeck-us.net>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Tue, 15 Dec 2020 09:03:55 +0000
Message-ID: <CAM9ZRVvdPTK79m-fRJ=++3=hUy2onApMVP8EQ2PaYcdVuq_irw@mail.gmail.com>
Subject: Re: [GIT PULL] hwmon updates for v5.11
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 15 Dec 2020 at 00:54, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Dec 14, 2020 at 10:06:23PM +0000, Paul Barker wrote:
> > On Mon, 14 Dec 2020 at 21:32, Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > Paul Barker (3):
> > >       dt-bindings: hwmon: pwm-fan: Support multiple fan tachometer inputs
> >
> > Should this one go in at this stage? The patches to implement support
> > for multiple fan tachometer inputs are still outstanding. So the
> > dt-binding will be left documenting a feature which isn't yet
> > supported.
> >
> I don't see a problem with that, the patch has been in -next for weeks,
> and I announced that I applied it.
>
> Is that a formal objection ?

No, you know the process better than me, I just wanted to ensure the
status was clear. If the patch is ok to be included in this state then
I'm happy.

-- 
Paul Barker
Konsulko Group
