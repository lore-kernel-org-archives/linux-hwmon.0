Return-Path: <SRS0=JJyj=QI=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB79C282D8
	for <linux-hwmon@archiver.kernel.org>; Fri,  1 Feb 2019 11:41:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B408121872
	for <linux-hwmon@archiver.kernel.org>; Fri,  1 Feb 2019 11:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htTQ31DI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbfBALlY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 1 Feb 2019 06:41:24 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:36243 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfBALlY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 1 Feb 2019 06:41:24 -0500
Received: by mail-qk1-f196.google.com with SMTP id o125so3818968qkf.3
        for <linux-hwmon@vger.kernel.org>; Fri, 01 Feb 2019 03:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t5DbGBsbl1Q9SgDhBN6f3lM5IIY89JlrCZIHOzSGjA0=;
        b=htTQ31DIHXcukG6VoKKV+YI2Hp3HARfdT5xuCNz1Ti8KuxkuR5OZt/roA34e9vIgEF
         dK5AVY8GKXjTDlDfHME4SKLZmPWexp759rColuFvHxweEQqPcnAsUpR8RSzFpWkwFbFp
         XIlyvt6zOKl6B2F7wE+WDSAsU/0KJ/crafJHBuXO7g+/xREfep1xC5nN0SAvxKiE7e9v
         t0XoYInESEc3YCPNOIpZta8l2GFMAL5sQehhPnzqBvinIV0lJ6kPMFmU0M6xdzkNkYFT
         xNRaXzCUaTfxEkWpsQK69QjtpM84crrTpaDUYcCMZ5t+uuSOpeFdxvtQag6pi56dDceL
         ftvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t5DbGBsbl1Q9SgDhBN6f3lM5IIY89JlrCZIHOzSGjA0=;
        b=Nw1PTj97Ma9ZNtYWiqs2laMzAvvHqAERyIbGD/PRo8zpY7a6NWosQkMbYQ1gh8Xoma
         +rt9ZSmKbW+yo/ALmzNqQtpa0/Z462kxjzpXlakpImMcRlC5xr4PY5Upr8jS1aVid/0V
         +W5MLBl7ZpsVP2WEbMAqRsgfyn4Ug7HpydMwAIwSxqquycpLXh5acsIUxGENNFm3iJ03
         NXE0yPAKERr9+STLu1ZB+G6I1hVAnx0QoX0TdlVUnSsxDMsC7vz8te3GePB56LgA/fXZ
         vW0pS74aFrXBkZXfBNgWSZTQ27+TAWCbXzErXWMWNK9Ao/mO91XuwN0HyJYroc/Q2YgC
         iBTg==
X-Gm-Message-State: AJcUukfjoWFbI/aATtdM9X5NDnDL0b+TL6CMNPe09xlAyfQq1j+1A4ky
        mXewICIPDwpwT1aqPU8LYsb516yGiyNw4lhZvELyLw==
X-Google-Smtp-Source: ALg8bN6YeY4pZvKIcylXmT19n4MIrhfNI2k+AJbVHonbTsi72jo+hOKPk2DYf1RCCbD3bmBa8IVq1idURPhPyZAx1UQ=
X-Received: by 2002:a37:953:: with SMTP id 80mr35592124qkj.48.1549021282947;
 Fri, 01 Feb 2019 03:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20190128170034.24348-1-wilburm@gmail.com> <20190128170034.24348-2-wilburm@gmail.com>
 <20190131181143.GA17285@roeck-us.net>
In-Reply-To: <20190131181143.GA17285@roeck-us.net>
From:   Matt Wilbur <wilburm@gmail.com>
Date:   Fri, 1 Feb 2019 06:41:11 -0500
Message-ID: <CAGQJtpOn-gVuuCrY=eGHACOkQAHDk6QXDuaRyg2tOOwj2DaKmw@mail.gmail.com>
Subject: Re: [PATCH 1/1] Fix swapped coeffs for LM5066 and LM5066i iin
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jan 31, 2019 at 1:11 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi,
>
> On Mon, Jan 28, 2019 at 12:00:34PM -0500, Matt Wilbur wrote:
> > ---
>
> Unfortunately, your patch is not signed, and I can not apply it.
> Also, the explanation should be part of this patch. Please
> also note the expected subject line, which should start with
> "hwmon: (pmbus/lm25066)".
>
> On top of that, while the subject claims to also address LM5066i,
> it does not really do that.

I will give it another shot - but I did switch the coefficients for
the LM5066i current measurement.

Since this was my first attempt at submitting a patch, I wanted to
work through the process.
I also need to swap power coefficients and add the b coefficient for
the LM5066 and LM5066i.

Matt


>
> Guenter
>
> >  drivers/hwmon/pmbus/lm25066.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> > index 53db78753a0d..9d917b5f0a81 100644
> > --- a/drivers/hwmon/pmbus/lm25066.c
> > +++ b/drivers/hwmon/pmbus/lm25066.c
> > @@ -156,11 +156,11 @@ static struct __coeff lm25066_coeff[6][PSC_NUM_CLASSES + 2] = {
> >                       .R = -2,
> >               },
> >               [PSC_CURRENT_IN] = {
> > -                     .m = 10753,
> > +                     .m = 5405,
> >                       .R = -2,
> >               },
> >               [PSC_CURRENT_IN_L] = {
> > -                     .m = 5405,
> > +                     .m = 10753,
> >                       .R = -2,
> >               },
> >               [PSC_POWER] = {
> > @@ -197,13 +197,13 @@ static struct __coeff lm25066_coeff[6][PSC_NUM_CLASSES + 2] = {
> >                       .R = -2,
> >               },
> >               [PSC_POWER] = {
> > -                     .m = 1701,
> > -                     .b = -4000,
> > +                     .m = 861,
> > +                     .b = -965,
> >                       .R = -3,
> >               },
> >               [PSC_POWER_L] = {
> > -                     .m = 861,
> > -                     .b = -965,
> > +                     .m = 1701,
> > +                     .b = -4000,
> >                       .R = -3,
> >               },
> >               [PSC_TEMPERATURE] = {
> > --
> > 2.17.1
> >
