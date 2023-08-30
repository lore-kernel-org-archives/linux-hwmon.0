Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EF0C6FA8F
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Aug 2023 20:01:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240295AbjH3UBM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Aug 2023 16:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239137AbjH3UAt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Aug 2023 16:00:49 -0400
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1C11736
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2023 12:37:01 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7a50bd29064so70722241.3
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2023 12:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693424095; x=1694028895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=femUbnNkI0dPgRYRrDdrRsJ5hRpAu998V7jEmuAfMrw=;
        b=g73fJn6H38Pkm7rwBvv5S8bpgVMcV5I3+RupYUh2+3jknr751Yi+KTl1NqRMr4jnfi
         RhMw+mytlvk/OpkarvTf2pPgEU35NDUCHkDFmnWIIBYL2xye5OjegfHKPR9Ev9L/kLj1
         cEMyyymV9gamoHybQ4OWLIeho5NsHBrMjEuSDm80QvJpmZyn9XMKSn/1qanOpLKkyne+
         EBNkZQEpnVWLS6MJFjGnZVNEGIKLrDX6P71/S1y+i+MfHi8dJLC0kgIKWz2Mqo7kLNVx
         QeVm8NEsn0OpNpMBgWoaTuEaXcWYF+1voQ/m5U2y9VIAf6krfcRj7IJYB9JmdekMbqgv
         qZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693424095; x=1694028895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=femUbnNkI0dPgRYRrDdrRsJ5hRpAu998V7jEmuAfMrw=;
        b=R21aeyMceS8wjFPloybM5VGJRPG4QiRmS7YbtVdfn036yx2iyzTVBmMXrsknS2pT3g
         moiamTc769ttaZON6QI5shAecbISJDRJ4aZe2l5PpIA5NKHOSbmcMZ9nYUDWbHN3BzNS
         6A+ucYFz0FkHySaFj6ERZ2lUfAZ92Q0zam5fnont2BCfOT4ueC7MFtG4NAx/XTWhJogQ
         enW3yZizXPW0gdRelifWsdy7bGSeotgPU1+4+pYyn2N1OfvOGproYrHO8dN5co++8dec
         /Dj9CrcXydtkut35i43uCsGnnwS8tSIRzZXd+B4kbDMzT/Pa4l9q/jofNuPCqWyLMQjU
         82Gg==
X-Gm-Message-State: AOJu0Yy6BAbthIGmj23Dt8GF2/YRnARRvXsdeCDaeBDmsyTdxDYOincW
        k3m7Xa+0CTyPQ5XcM47LKDlZqyeMgVviKFEErVBk7bb7
X-Google-Smtp-Source: AGHT+IFia5ollVps8fAWA2izAZcbD2vMJY6o+IbWybBDjiGt+MAhLxVXY1ew+u7HRnri1BYyUPCxLPoVtCLHXmN1flU=
X-Received: by 2002:a67:f98d:0:b0:44e:8ef9:336d with SMTP id
 b13-20020a67f98d000000b0044e8ef9336dmr2765521vsq.1.1693424094794; Wed, 30 Aug
 2023 12:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAOdCjQtTzQpsko+vqkF9zW5RPe1520r4B5kFsJzHjSkK+KxvMw@mail.gmail.com>
 <CAOdCjQv-dCsd_EDnmWN786H57=cN2U8GBZLS96gXme6hfYpC4A@mail.gmail.com>
 <d41992ac-9670-44af-963b-d171bfcdd8f9@roeck-us.net> <CAOdCjQvEvqoQQQLUX3tuLzuY0sedi2mGzA=aMJg4UY+uMtcr0g@mail.gmail.com>
 <a148cb9e-e108-5513-39f1-b307d517d8b2@roeck-us.net>
In-Reply-To: <a148cb9e-e108-5513-39f1-b307d517d8b2@roeck-us.net>
From:   Pankaj Pandey <pankaj.embedded@gmail.com>
Date:   Thu, 31 Aug 2023 01:04:43 +0530
Message-ID: <CAOdCjQuMU9kJq_KhM2Z6pjqSwVVTm_o8C3-GGtvgAQMQzaxpSg@mail.gmail.com>
Subject: Re: Fwd: Regarding pmbus_core.c
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thanks for the suggestion !!

On Wed, Aug 30, 2023 at 8:56=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Pankaj,
>
> On 8/30/23 02:28, Pankaj Pandey wrote:
> > Hi Guenter,
> >
> > Thanks for the pointer. Actually during bmr454 probing during kernel bo=
ots-up it
> > called system reset/crash. For reference please find bmr454 probing log=
 below:
> >
>
> First of all, please don't top-post.
>
> > [   14.910630] pmbus 7-0010: bmr454 BMR status word : 0x2
> > [   14.922945] pmbus 7-0010: bmr454 BMR status cml : 0x2
> >
>
> Bit 1 of the CML status register suggests that there is a communication
> problem. Per PMBus standard:
>
> Bit 1 - A communication fault other than the ones listed in this table ha=
s occurred
>
> > ---> Immediately after above bmr454 probing it reset/crash the system
> > and jump to u-boot.
> >
>
> I don't think anything _called_ system reset/crash. There is no code
> in the driver that would do that.
>
> > Using debug prints I observed system got resettted after reaching to
> > _pmbus_write_byte  function. But
> > sometimes probing is fine, not observing any system reset/crash.
> >
>
> My best guess is that the i2c communication with the chip is unstable,
> and that the write causes it to do something that causes the reset.
> How it would do that - I don't know. Maybe one of the module pins is wire=
d
> to the system's reset pin (though I can not imagine why that would be
> the case), or the miscommunication causes a chip reset. Either case,
> maybe the problem is in the I2C bus speed. If you can, I would suggest
> to lower it to 100 KHz to see if that makes a difference.
>
> Guenter
>
>
> > Regards,
> > Pankaj Pandey
> >
> >
> > On Wed, Aug 30, 2023 at 7:38=E2=80=AFAM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> On Wed, Aug 30, 2023 at 07:16:46AM +0530, Pankaj Pandey wrote:
> >>> ---------- Forwarded message ---------
> >>> From: Pankaj Pandey <pankaj.embedded@gmail.com>
> >>> Date: Wed, Aug 30, 2023 at 4:42=E2=80=AFAM
> >>> Subject: Regarding pmbus_core.c
> >>> To: <linux@roeck-us.net>
> >>>
> >>>
> >>> Hi Guenter Roeck,
> >>>
> >>> I am facing an issue at drivers/hwmon/pmbus/pmbus_core.c of linux-5.1=
0 kernel.
> >>> I am using the bm454 driver from drivers/hwmon/pmbus/pmbus.c.
> >>> Observed sometimes my Powepc based target board called for reset from
> >>> inside int pmbus_write_byte_data(struct i2c_client *client, int page,
> >>> u8 reg, u8 value)  function.  It is not consistent, sometimes not
> >>
> >> Sorry, I don't understand what you mean with "called for reset from
> >> inside int pmbus_write_byte_data". Please clarify.
> >>
> >> If I recall correctly, bmr454 is very picky when it comes to i2c bus
> >> speed. If it acts up, you might have some success with picking a diffe=
rent
> >> bus speed.
> >>
> >> Thanks,
> >> Guenter
> >>
> >>> observed any reset and bmr454 initialized fine.  Please suggest any
> >>> pointers to debug this issue.
> >>>
> >>> Regards,
> >>> Pankaj Pandey
>
