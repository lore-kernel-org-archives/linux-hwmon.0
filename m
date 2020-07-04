Return-Path: <SRS0=THek=AP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E12C433E0
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Jul 2020 23:09:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 060E1208B8
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Jul 2020 23:09:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="EG286gDn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbgGDXI7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 4 Jul 2020 19:08:59 -0400
Received: from mail4.protonmail.ch ([185.70.40.27]:30064 "EHLO
        mail4.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727816AbgGDXI7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Jul 2020 19:08:59 -0400
Date:   Sat, 04 Jul 2020 23:08:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1593904136;
        bh=YRkZmCLBFKn60Slo/Fq0vNtg0d3TquGN/vH9GQoDH/g=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=EG286gDnvuVTkk8YFxUy6COKnSzqdy1d5LQZOY+BpfUXdQvTz+/e+bajo3OqQ9l2O
         DYenLPgvvsCIPuTxzaK6TUmNdU3GZ4iORoncAvkEYehkEq6zeIrqrYO0yxiUoN9yyt
         ACb+9IP34Fpr2lXKocbBvYiqgQBzbes4FnTjZ7Aw=
To:     Guenter Roeck <linux@roeck-us.net>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [QUESTION] fan rpm hwmon driver
Message-ID: <gPUUkJgSquQcl0TQu3m4-RdGPCj7xKAyRqgZlbIcu0FoA3egKZHq6VUMpNDMLJSp5Vs9GTRV7QWOfKJR3Mv4zgKof9JtJn_bAjAZu6Rykkk=@protonmail.com>
In-Reply-To: <3259b471-c3b6-ef22-e5c6-813313395cef@roeck-us.net>
References: <xU_nzuNaKzomGSEsIdtEGvDVgR0MuUoti45TC5WzkVu0FscRsOEp7dzY4tGOoUkvrG9QPJethyosMSnxcXFuE-xcpqJ6DQwfnPkPlFiEcbY=@protonmail.com> <3b92f53f-fd3f-a432-aae1-620582701286@roeck-us.net> <vCYQSnYIKROnbBCa77NtCP1VqtQUNl8cItazgNFjTJfmzRogHKpxkUThwzQnv-HXuISOOhhZ_J_gM2Pm-Y8dwfp2c6IxY2LYirIgdbriYwQ=@protonmail.com> <3259b471-c3b6-ef22-e5c6-813313395cef@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

2020. j=C3=BAlius 5., vas=C3=A1rnap 0:44 keltez=C3=A9ssel, Guenter Roeck =
=C3=ADrta:
> On 7/4/20 2:25 PM, Barnab=C3=A1s P=C5=91cze wrote:
>
> > 2020.  j=C3=BAlius 4., szombat 22:54 keltez=C3=A9ssel, Guenter Roeck =
=C3=ADrta:
> >
> > > On 7/4/20 12:50 PM, Barnab=C3=A1s P=C5=91cze wrote:
> > >
> > > > Hello all,
> > > > I am completely new to Linux kernel development. I have written a k=
ernel module for my laptop that integrates the fan speeds available in the =
embedded controller memory into the hwmon subsystem.
> > > > My first question would be: can such a driver be merged into the ma=
inline? I ask this because it is a device specific driver, and I am not sur=
e if such drivers are wanted in the mainline.
> > >
> > > There are several device/platform specific drivers in drivers/hwmon;
> > > that is not a problem. Question is more how the EC is accessed, and
> >
> > It is accessed using the acpi/ec driver.
> >
> > > who is going to maintain the driver after the initial submission.
> > > This might be easier to evaluate if we had a patch or a pointer to,
> > > for example, an out-of-tree driver at a public repository site such
> > > as github.
> >
> > I uploaded it to github, I hope it helps: https://github.com/pobrn/xmg_=
fusion_15_fans
> > I apologize for stylistic inconsistencies and such in the code, this is=
 more or less a work in progress (at least in terms of making it an "accept=
able" kernel module).
>
> Way too noisy, way too too many empty lines, and you should drop the "nod=
etect"
> module option as it is way too risky. Otherwise I don't have major proble=
ms
> with it.
>
> Guenter
>

Thank you for the feedback, I will definitely try to fix those problems if =
I submit it as a patch. What I gather from your response is that it is poss=
ible that such driver is included under drivers/hwmon, correct?

Furthermore, did it help answer the "who is going to maintain the driver af=
ter the initial submission" question of your previous email?


> > > > Depending on the answer to my first question, my second question is=
: where should such a driver reside in the source tree? Initially, I though=
t of drivers/hwmon, but that seems to be occupied by drivers for external(?=
) devices (I am not sure, but that is the idea I get). So I am now thinking=
 of drivers/platform/x86. However, I have failed to find any fan hwmon driv=
ers there, so I am not sure about that one, either.
> > >
> > > hwmon drivers should in general reside in drivers/hwmon, unless hardw=
are
> > > monitoring functionality is part of other functionality and would be
> > > difficult to extract from the main driver (example: various Ethernet
> > > or graphics controllers).
> > > Guenter
> >
> > Thanks for the reply.
> > Barnab=C3=A1s P=C5=91cze


Barnab=C3=A1s P=C5=91cze
