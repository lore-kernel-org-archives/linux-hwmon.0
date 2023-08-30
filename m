Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF69C6FA8F
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Aug 2023 18:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243183AbjH3SrE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242742AbjH3J3H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Aug 2023 05:29:07 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E73CCB
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2023 02:29:04 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-48d0eb04c8cso1654648e0c.0
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2023 02:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693387744; x=1693992544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ua10WRdnN+RWxN4RDGFmwcoDFTemva9EtdTfd5rYkW0=;
        b=MYXqpdvQ4Yj3Nf/ERhEtaHO6jgkrb6KyjJT6SOER++CXO0yBnMn/DYG00emi0MpMx1
         PND2pnlfsCC8uYkqoXHVgY0ZfTbQbAABRbUiVHpihvaPJFUeG6jYN07T9MXPfNkvn6e7
         ImMMxAUD3SvbRELu/96gEkJVDUyJ4MtbDTRKZn2BHD9KDvfKiJXkQiRtYURvahtcwMFT
         5gTrrrWmkDd7Z6gmxu0o2ZEHNK2THmQRRKNX4lcGAfSSXuwuIDUJSO8g8nZ50cgZi2Za
         3TDWVPUQNGIFEeIiK7lmZbRb64xfiLB/siMn4pPeRhBpmlF4qcqgW8RTodK5jylkQMAg
         c2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693387744; x=1693992544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ua10WRdnN+RWxN4RDGFmwcoDFTemva9EtdTfd5rYkW0=;
        b=g6seXwplAtRXWXlnJZ7jagnyN3AKZYvlwev1abu6PzbqQRlm5DBGOtXB8A8q/LaS1i
         3bYKVxeJ0kmNelAxwdRVjXZxi/aX4AY9A9ATMcVC68Sl8At6RsUAwZwhYU0+Cq3R8j0G
         O2aOV9vi8EBpFm5Tpcc8OPaeJJrgD306RfwlJTViZY42S7ORQi0xSi0iHDzaE7Rfcv/3
         Ad5qtwh63m8y6ApRrMDC+3wpIqq+91xxJdUJGaghhKlrenAxceSuB8lTl5UvAx2dina/
         tJ2QQgWjBTc4q3Fsia7en2VSDn5i/7e9VghkIuKYz4uYJILUqHMyUQ0/bcl2zXERSGzd
         nxMw==
X-Gm-Message-State: AOJu0Ywj9cm2FSdSijgjJhV9AFw8TlEWgE2SKqKiBpFgdoiiRlMB0e/G
        zYrykihyHhwoNJc7nLW4XIIgROTwcT3vxP8G1g2GzcFLwD0=
X-Google-Smtp-Source: AGHT+IG32hmtOjb3+AwcXeiJ4ZuT7ja3p3wxWcrVIIwQlHh8gO3kMLvOiM3gXadJKziZhU2+vqs9dKkuFETlWUOzXKk=
X-Received: by 2002:a1f:4886:0:b0:48d:d3b:7dcc with SMTP id
 v128-20020a1f4886000000b0048d0d3b7dccmr1094566vka.5.1693387743635; Wed, 30
 Aug 2023 02:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAOdCjQtTzQpsko+vqkF9zW5RPe1520r4B5kFsJzHjSkK+KxvMw@mail.gmail.com>
 <CAOdCjQv-dCsd_EDnmWN786H57=cN2U8GBZLS96gXme6hfYpC4A@mail.gmail.com> <d41992ac-9670-44af-963b-d171bfcdd8f9@roeck-us.net>
In-Reply-To: <d41992ac-9670-44af-963b-d171bfcdd8f9@roeck-us.net>
From:   Pankaj Pandey <pankaj.embedded@gmail.com>
Date:   Wed, 30 Aug 2023 14:58:52 +0530
Message-ID: <CAOdCjQvEvqoQQQLUX3tuLzuY0sedi2mGzA=aMJg4UY+uMtcr0g@mail.gmail.com>
Subject: Re: Fwd: Regarding pmbus_core.c
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

Thanks for the pointer. Actually during bmr454 probing during kernel boots-=
up it
called system reset/crash. For reference please find bmr454 probing log bel=
ow:

[   14.910630] pmbus 7-0010: bmr454 BMR status word : 0x2
[   14.922945] pmbus 7-0010: bmr454 BMR status cml : 0x2

---> Immediately after above bmr454 probing it reset/crash the system
and jump to u-boot.

Using debug prints I observed system got resettted after reaching to
_pmbus_write_byte  function. But
sometimes probing is fine, not observing any system reset/crash.

Regards,
Pankaj Pandey


On Wed, Aug 30, 2023 at 7:38=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Wed, Aug 30, 2023 at 07:16:46AM +0530, Pankaj Pandey wrote:
> > ---------- Forwarded message ---------
> > From: Pankaj Pandey <pankaj.embedded@gmail.com>
> > Date: Wed, Aug 30, 2023 at 4:42=E2=80=AFAM
> > Subject: Regarding pmbus_core.c
> > To: <linux@roeck-us.net>
> >
> >
> > Hi Guenter Roeck,
> >
> > I am facing an issue at drivers/hwmon/pmbus/pmbus_core.c of linux-5.10 =
kernel.
> > I am using the bm454 driver from drivers/hwmon/pmbus/pmbus.c.
> > Observed sometimes my Powepc based target board called for reset from
> > inside int pmbus_write_byte_data(struct i2c_client *client, int page,
> > u8 reg, u8 value)  function.  It is not consistent, sometimes not
>
> Sorry, I don't understand what you mean with "called for reset from
> inside int pmbus_write_byte_data". Please clarify.
>
> If I recall correctly, bmr454 is very picky when it comes to i2c bus
> speed. If it acts up, you might have some success with picking a differen=
t
> bus speed.
>
> Thanks,
> Guenter
>
> > observed any reset and bmr454 initialized fine.  Please suggest any
> > pointers to debug this issue.
> >
> > Regards,
> > Pankaj Pandey
