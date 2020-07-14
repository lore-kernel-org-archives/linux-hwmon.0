Return-Path: <SRS0=kNNy=AZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF567C433E2
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 17:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C347322574
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 17:19:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="cUokA0Gl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbgGNRTp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jul 2020 13:19:45 -0400
Received: from mout.gmx.net ([212.227.17.22]:44875 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726817AbgGNRTp (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jul 2020 13:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1594747166;
        bh=bdNNPnAzzCjjFzaJMpQKUdTA9EJE+5WBe9aFic5ZUdI=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
        b=cUokA0Gltct/LFx4kISoYnmD+1gY2x3De1we7sJzMCSahCNxdQaZsNheyfeR35NZn
         j1z0YhefJtF/4RQ5WZ3gaPZZnvBMuUkUL/H5LZ6XYlTqQI2WrZdYhNMGelGiMx3BTy
         r5XsrhMDgm4SDPIJp/CUkaJJ1L6gKc0UdGMnUt4g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.2] ([84.190.135.167]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXUN-1kC6en1EwB-00Jbs2; Tue, 14
 Jul 2020 19:19:26 +0200
Message-ID: <52295e37be06909c6bfe22ba43e287a8a7764280.camel@gmx.de>
Subject: Re: hwmon (nct6775): Please fix Invalid temperature source error
 for NCT6798D
From:   Stefan Dietrich <roots@gmx.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Date:   Tue, 14 Jul 2020 19:19:25 +0200
In-Reply-To: <2569643c-d050-1663-7da7-641211618aee@roeck-us.net>
References: <66053ce744dafbad6925df53b6ef2db1e2859740.camel@gmx.de>
         <e4ad12d1-3dca-2ff5-a0a6-12dc6dc22c83@roeck-us.net>
         <48f415c34f4ca3f5239650711daaf1e11342da8e.camel@gmx.de>
         <d54732db-255c-54be-ab43-997369e0da87@roeck-us.net>
         <e02ef4f8633e035ecf6019abb72e3a22bfc29732.camel@gmx.de>
         <20200712224620.GA19097@roeck-us.net>
         <119b8c4d3791bafae015f1643b4fba9114d3eb65.camel@gmx.de>
         <2569643c-d050-1663-7da7-641211618aee@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7PcwdGmxSGWTbjlQI/W45S+juzSMiEeK5oUzU5gQo2atHqGx1A+
 a6MpbBM7nitWdsIRzdSl1Strx7cQ/OeEDUtzFHHbNgqnmrlJOY0/vO2pvSkYqMXujfJByXJ
 jZA07EH243pYtGLZ5YNrZCG/SQX7rajjdkgPtobidZNVq+VXnbw2MTGrPKdHwJ2RDlPs6qP
 yGnBH7diA0bDyF+bbdm+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SfoppzktGVk=:6lflKIizQJ9KZpt3Yqha5G
 ddxUdH/1+Mhw7m8Ad0alDunruMsEBiDddvLzgKIGiI83ZKVYNOabQzsyIvO/6eZrNS9lIT/IU
 s7UuAvBmDW4aRde5YOF8kUMgTx+FAztfffiOGU9+t9zffl9VnPjEnoOwvpqehP3yQKHkheUCh
 bex6LuRMLNvhgQua0uFB6hvc2M7/hIZBBc2Qva24KHblLDXvpE10fy1PXonxoV3hYdT/bGgli
 +QSTVbBaQ/sHT1EODCKlS9y7LnTnu29hK+uD58v3MK/PgtPIa/22cfNrl/+zMel9iUf03t5KL
 Kn7Y0iJ2V5klBtqoPmqIR1VUCFnAAjwqq/FNRVSv+UxR/VbhvxHfmF/552yod/fAogRRqcHOP
 KC8Zb5fg5YPH5nuBY5rcSoXA50nnGtjmmiKr3V7nuR84MEL855JYbsD8DQRbg5PRYCm+zrEJ+
 PeS/13YuCequAMLOFadyQJjYYpQrVVLdrXU2wLdW9kFiJPQeD0/kBHhVtGVZnMQbLCoHcncgf
 g7jgNlmaiULZCBzGYydtww4qWbuZ5L/L3VuwqwSfddflRvh5xHtHfnmtkPVRD0biZ2xM2Qzl4
 MEqax8EuO8r+2bCxW+fjM2BN1lg9N7GSxaWWkefUiezH+Ysf+DTdeYzpY+bPnjGMEPJ/CVIlS
 rjxTSnFI/cPT5pdTtjVOPi+HP5G6VSgeZvgpc8i/uFYl/9OOx0kbJYcUP1IZin/dhF4xRmKv6
 hSj7eKryFND2udVRUH1r0ry2og5ffXqpurx+mo2yuiSaddTQAU/QMcPQ/vFtsRcX83/uHZE0l
 f9AKdm0/APwvAT/aCDQFTh3zveunj/QUokX21dWCJFkyS+rxkgdyT7CQHkMKLx9gfgpRgekXh
 zQ71Afnmxnjw79GHEzkbz03J6fNYWryupTnbRQPUcAiKQxbb/EFw+xm0jqf11giQgplabJ2YI
 PfewMx4s1WBkADaCaiPsbd5CJ69WslKTbhhS5bv9Nr5DaJbIjMc+q/OA53Uzk26RGsuC7XuK0
 6eFx/vSIXg+g18e2uawVMdDmUovYdMt1lgF6WIVi9BnWcRoW00aeUShgcAq5vJWjiaOzrPCB0
 Sq4aPUHxG8NunGaVKzLYXYusY6iX2P4Z1Tie6riNMomzzNrHhjrVXHTdr3g0SLYo+rxRDwYGi
 gTWsTEUwPVXNATeEBeKgLMYqP7DfF6/MckektUMT1Q2QocdZMz/qXjDzn5s27NPoZvkrjbgYt
 ZFWC1D1B2Lnlcjn7O
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 2020-07-13 at 22:18 -0700, Guenter Roeck wrote:
> On 7/13/20 10:40 AM, Stefan Dietrich wrote:
> > On Sun, 2020-07-12 at 15:46 -0700, Guenter Roeck wrote:
> > > On Sun, Jul 12, 2020 at 09:51:42AM +0200, Stefan Dietrich wrote:
> > > > On Sun, 2020-07-05 at 07:21 -0700, Guenter Roeck wrote:
> > > [ ... ]
> > > > Would you mind giving me a pointer on how this would be done? I
> > > > assume
> > > > for those familiar with the driver it will be less than a
> > > > handful
> > > > of
> > > > lines of code?!
> > > > I will certainly report back as soon as I have obtained any
> > > > results.
> > >
> > > Something like the diffs below should do. Caution - this is cut-
> > > and-
> > > paste,
> > > so you'll have to make the changes manually.
> > >
> > > Guenter
> > >
> > > ---
> > > diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
> > > index 7efa6bfef060..ec427ce503f0 100644
> > > --- a/drivers/hwmon/nct6775.c
> > > +++ b/drivers/hwmon/nct6775.c
> > > @@ -786,9 +786,9 @@ static const char *const nct6798_temp_label[]
> > > =3D {
> > >         "Agent1 Dimm1",
> > >         "BYTE_TEMP0",
> > >         "BYTE_TEMP1",
> > > -       "",
> > > -       "",
> > > -       "",
> > > +       "Unknown28",
> > > +       "Unknown29",
> > > +       "Unknown30",
> > >         "Virtual_TEMP"
> > >  };
> >
> > Dankeschoen - I just tried that, but I'm still getting
> >
> > [  324.901595] nct6775 nct6775.656: Invalid temperature source 28
> > at
> > index 0, source register 0x100, temp register 0x73
> > [  324.901637] nct6775 nct6775.656: Invalid temperature source 28
> > at
> > index 1, source register 0x200, temp register 0x75
> > [  324.901679] nct6775 nct6775.656: Invalid temperature source 28
> > at
> > index 2, source register 0x300, temp register 0x77
> > [  324.901722] nct6775 nct6775.656: Invalid temperature source 28
> > at
> > index 3, source register 0x800, temp register 0x79
> > [  324.901765] nct6775 nct6775.656: Invalid temperature source 28
> > at
> > index 4, source register 0x900, temp register 0x7b
> > [  324.901807] nct6775 nct6775.656: Invalid temperature source 28
> > at
> > index 5, source register 0xa00, temp register 0x7d
> >
> > I double checked that it really is the modified driver that is
> > loaded.
> > Now does that mean the diffs did not do the trick, or that there's
> > really nothing to see here?
> >
>
> I forgot: Also change NCT6798_TEMP_MASK to 0xffff0ffe.

The error messages are gone and sensors now shows a value for source
Unknown28. However, I did not figure out which component's temperature
it corresponds to. It is definitely not one of the three 2-pin
temperature sensor headers on the mainboard, as I swapped external temp
sensors on these without impact on the reported value. The shown value
is in the range of the CPU core temperatures (that is, somewhere
between roughly 30 and 80=C2=B0C) and varies with 0.5=C2=B0C resolution.

However - thanks a lot for your assistance. If I may be of help in
further debugging for that particular NCT chip / mainboard, please let
me know!

Thanks,
Stefan

