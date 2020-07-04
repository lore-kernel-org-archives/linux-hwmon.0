Return-Path: <SRS0=THek=AP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DA3C433DF
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Jul 2020 21:25:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AECA720CC7
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Jul 2020 21:25:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="c+au6WCF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgGDVZh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 4 Jul 2020 17:25:37 -0400
Received: from mail-40130.protonmail.ch ([185.70.40.130]:18313 "EHLO
        mail-40130.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgGDVZh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Jul 2020 17:25:37 -0400
Date:   Sat, 04 Jul 2020 21:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1593897934;
        bh=P+ofcdnr7MAADe40y1avBoOBGhBWyLKgxdUlM6qKNMo=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=c+au6WCFdTK49+RgfBB/sjWsGyfsHYAw36BvRpuaXsIaJ4IveTrwqaWwHEyNgCJUh
         rkgQXWzMwqgHmoIwqFVux+ghkayHfzxHT5hvd/yfhDzIr4gWhndfkRvCN1rjvUNr9u
         Gzv66EFru+XoNYlO6Lf+G3KzPKcP2yveJTqtO5fE=
To:     Guenter Roeck <linux@roeck-us.net>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [QUESTION] fan rpm hwmon driver
Message-ID: <vCYQSnYIKROnbBCa77NtCP1VqtQUNl8cItazgNFjTJfmzRogHKpxkUThwzQnv-HXuISOOhhZ_J_gM2Pm-Y8dwfp2c6IxY2LYirIgdbriYwQ=@protonmail.com>
In-Reply-To: <3b92f53f-fd3f-a432-aae1-620582701286@roeck-us.net>
References: <xU_nzuNaKzomGSEsIdtEGvDVgR0MuUoti45TC5WzkVu0FscRsOEp7dzY4tGOoUkvrG9QPJethyosMSnxcXFuE-xcpqJ6DQwfnPkPlFiEcbY=@protonmail.com> <3b92f53f-fd3f-a432-aae1-620582701286@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

2020. j=C3=BAlius 4., szombat 22:54 keltez=C3=A9ssel, Guenter Roeck =C3=
=ADrta:
> On 7/4/20 12:50 PM, Barnab=C3=A1s P=C5=91cze wrote:
>
> > Hello all,
> > I am completely new to Linux kernel development. I have written a kerne=
l module for my laptop that integrates the fan speeds available in the embe=
dded controller memory into the hwmon subsystem.
> > My first question would be: can such a driver be merged into the mainli=
ne? I ask this because it is a device specific driver, and I am not sure if=
 such drivers are wanted in the mainline.
>
> There are several device/platform specific drivers in drivers/hwmon;
> that is not a problem. Question is more how the EC is accessed, and

It is accessed using the acpi/ec driver.


> who is going to maintain the driver after the initial submission.
> This might be easier to evaluate if we had a patch or a pointer to,
> for example, an out-of-tree driver at a public repository site such
> as github.
>

I uploaded it to github, I hope it helps: https://github.com/pobrn/xmg_fusi=
on_15_fans
I apologize for stylistic inconsistencies and such in the code, this is mor=
e or less a work in progress (at least in terms of making it an "acceptable=
" kernel module).


> > Depending on the answer to my first question, my second question is: wh=
ere should such a driver reside in the source tree? Initially, I thought of=
 drivers/hwmon, but that seems to be occupied by drivers for external(?) de=
vices (I am not sure, but that is the idea I get). So I am now thinking of =
drivers/platform/x86. However, I have failed to find any fan hwmon drivers =
there, so I am not sure about that one, either.
>
> hwmon drivers should in general reside in drivers/hwmon, unless hardware
> monitoring functionality is part of other functionality and would be
> difficult to extract from the main driver (example: various Ethernet
> or graphics controllers).
>
> Guenter


Thanks for the reply.

Barnab=C3=A1s P=C5=91cze
