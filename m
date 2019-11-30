Return-Path: <SRS0=QRh7=ZW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04322C432C0
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Nov 2019 04:49:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA8D820725
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Nov 2019 04:49:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prvFCfSY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbfK3EtI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Nov 2019 23:49:08 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:46330 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727142AbfK3EtI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Nov 2019 23:49:08 -0500
Received: by mail-qk1-f195.google.com with SMTP id f5so9036194qkm.13
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Nov 2019 20:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YgbRlzgBm+gmqDI7d9rhQwLCik0wHRIkPMkoWN9GnJY=;
        b=prvFCfSYuXNDE7KglS27s92CF40poRB2MAw/gMUQqq9+9oORrvN4X0No9UnsvJ+ll0
         dBvDYDA7y5cWReNsLnh2UxgVpzKiKvI8OIu0u78ZsDPdHJLlQWjweTbOmDJ+O5Cb6LI8
         9uwB8rVR5fGiScwXcrtJNfGf1G2t3Ta0EUn+nM39CY+3a+kh+RUWyAHs8Plch9ZuSsBK
         x96WK66L2AB2kM3oPXncb1Ac7K4h/+VzbtbfV1AyMhi5KxyrxdUp9ozW2MncHar7MxKv
         P0rQG6yi8Sg0XvCctgVtflT1D/9sq2Ft52xl0ey75wl7FPAJQBlVYDTUsRvbaUYdZdjP
         fDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YgbRlzgBm+gmqDI7d9rhQwLCik0wHRIkPMkoWN9GnJY=;
        b=MNwlp4ErgRuDeNl0V5Li4JgeVVTepcGU4iX8ChrMY1wn2DYo2j06lOHOX9lFTB8ONu
         UaOkkNdNkOhjuI3Cb+vn61iepDRlpf+XkNpczC0e2EAlb4cvwfwspgdC6KUFtYaDqNtR
         I5Km0YRQtVp1QGTbkOJLcBQ11E/LvkQs2jjza99TQkl1YNp+Y9Hem28lf5xcbLrn9i9k
         4yb8xItZEmNkP8Uwt8fQCzNeFVllSjGtn3svR9OYkqDpJJBCiRAMHYLE+iEmyav3BFMx
         21wLg5Sc+eJb48v3quxFzEHYBnPj5ywe90V3cCrInheIHJd8HsWo27QzSUuTMdxkn2CD
         IYgw==
X-Gm-Message-State: APjAAAXcc0kP2qc+THi1ax+DqWBf8/7myEDOZC/zyYl1eOm2TUnJ5SJw
        xf3/ljiCkdxp69+o+BSAb2PpwfJjagIM2klZ0Jjw0A==
X-Google-Smtp-Source: APXvYqzJcB4/2UlvXKS8vj2ami3j8yTn1XHeSaZRNuvoa6jFfZsBir7eqQm+TqG3t3NhfjYGh4lq/gnZt1eeneooCmM=
X-Received: by 2002:ae9:e103:: with SMTP id g3mr5198797qkm.441.1575089345704;
 Fri, 29 Nov 2019 20:49:05 -0800 (PST)
MIME-Version: 1.0
References: <CALUKdZ_-pjXPouBYxdm_LriN04Jp-vR5+7SBMkCK1reV2Lq_LA@mail.gmail.com>
 <4e6fda8d-761a-741a-d4af-5dc8ea5fe072@roeck-us.net>
In-Reply-To: <4e6fda8d-761a-741a-d4af-5dc8ea5fe072@roeck-us.net>
From:   Corey Ashford <yeroca@gmail.com>
Date:   Fri, 29 Nov 2019 20:48:55 -0800
Message-ID: <CALUKdZ9pDpMNeKY4wb21gxF7Dqdp=9CJLTEmeRNtDP1N1Pw_9A@mail.gmail.com>
Subject: Re: [RFC] hwmon: add support for IT8686E to it87.c
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Nov 29, 2019 at 8:17 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/29/19 6:11 PM, Corey Ashford wrote:
> > Hello folks.  I am running a newly-built system that uses an IT8686E
> > chip.  Currently, the latest kernel from kernel.org doesn't have code
> > in drivers/hwmon/it87.c to support it, however, I found some source on
> > the net which has added support for quite a few more variants of that
> > brand of Super I/O chip:
> > https://github.com/xdarklight/hwmon-it87/blob/master/it87.c
> > I tried it out by building the module and "insmod"ing it into my
> > running system, and it appears to work fine.
> >
> > It seems the original developer had a difficult time pushing the
> > changes upstream, so he abandoned the project.
> >
>
> I abandoned the project (and dropped the driver from my github page)
> because people started _demanding_ that I push the driver from github
> upstream, without offering any assistance whatsoever.
>
> > My thought was that I could add support for just the IT8686E chip as a
> > single patch, and since I can test it locally I would have a better
> > chance of getting the patch accepted.  The changes to the source at
> > the above git tree have quite a number of changes that aren't really
> > necessary for supporting the IT8686E chip, so I think the patch could
> > be pretty small, but will still credit the original author.
> >
>
> IT8686 is a multi-page chip, meaning you'll need the entire protection
> against multi-page accesses by the EC in the system. It also supports
> the new temperature map. I don't think it is that simple.
>
> Guenter

Thanks for the quick reply!

When you said they didn't offer any assistance, do you mean assistance
with testing?  If so, how about if the support is trimmed out for the
newly-added chips that have no available test system volunteers, and
then slowly add those back as people make test systems and testing
time available.  Should I presume that you have access to one or more
systems with the added ITnnnn chips?  I volunteer my system for
testing the IT8686E support.

- Corey
