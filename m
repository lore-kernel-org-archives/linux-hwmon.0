Return-Path: <SRS0=JR9X=B2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4072BC433E3
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 01:35:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16D4820708
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 01:35:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="xyN+QZeS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728664AbgHPBfQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Aug 2020 21:35:16 -0400
Received: from mail4.protonmail.ch ([185.70.40.27]:38587 "EHLO
        mail4.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgHPBfQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Aug 2020 21:35:16 -0400
Date:   Sun, 16 Aug 2020 01:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1597541714;
        bh=OQ50aq49q1k9+mZO27cW8fuaBup2xW21ONWv+GI7EFw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=xyN+QZeSUSR7dgmxbX3uCJRPBK/v6MDuOxq8j0QVY1mIBfbuZbAwYrEFyINkOwB8b
         5GebmE/3/zZ7ewDSgZ9rRKhWJQJ2ggWNQdCl8U4gqk6f/6By1Itp14vPHS/ME2tIAe
         eHQI0+7WvHR2FrK6VKQFSRqgLUXrMASC7fOd1bCc=
To:     Guenter Roeck <linux@roeck-us.net>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     jaap aarts <jaap.aarts1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH V4] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <jXVNMOMJ1nqEEhjQbWGsgeGm0TWaNDSHsp-YOtCWb-Sx3NqjIEGQKjUzA8FuUgvwXijS-fUWIfokZ--M3aCZUusFduP_EHXyaiMIfdPguQY=@protonmail.com>
In-Reply-To: <38cb8109-0868-c00c-e701-050cc0b20ac9@roeck-us.net>
References: <20200815211617.86565-1-jaap.aarts1@gmail.com> <2uSV3Shd92hhPyvj_GgPWEXYDX0o7GczgyAP4ue9S7xTHvwhqa9-4bcdMf3XNKCZ5jkq_KN7xqDRXT_X39VTcqxdvrE5x2Dft1hqNBjhXk4=@protonmail.com> <99ee823b-b1fa-74a0-e377-31dc97e4d985@roeck-us.net> <IqRa8ZnjuWETvNkGXEMzUaLtyG7SwgZ5aZNmrh2rN_97fIHMgcHAKR7pAHteqmzuXIVEuBB5jtBN00OBzb85KA92_RyKEDaC1V8SctNLvZ8=@protonmail.com> <38cb8109-0868-c00c-e701-050cc0b20ac9@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

2020. augusztus 16., vas=C3=A1rnap 2:51 keltez=C3=A9ssel, Guenter Roeck =
=C3=ADrta:

> On 8/15/20 5:27 PM, Barnab=C3=A1s P=C5=91cze wrote:
> >> [...]
> >>>> +=09=09=09if (val < (2 ^ 16) - 2)
> >>>
> >>> Did you intend to write 2 to the power of 16? Because 2^16 is not tha=
t.
> >>> 2 to the power 16 may be written as '(1 << 16)' or 'BIT(16)'
> >>> (you may need to include linux/bits.h for the latter)
> >>>
> >>> But something like this is my suggestion:
> >>>
> >>> if (val < 0 || 0xFFFF < val)
> >>> =09return -EINVAL;
> >>>
> >>
> >> I would suggest to use clamp_val; we don't expect users to know device
> >> specific limits. Also, FTR, I won't accept any Yoda programming.
> >>
> >> Guenter
> >> [...]
> >
> >
> > If you don't mind me asking, why is that? I, too, don't like Yoda condi=
tions,
> > but I've always thought that in this specific case - when checking if a=
 value
> > lies within/outside a certain range - it makes the code more easily rea=
dable
> > if it is written like this: (lo < val && val < hi).
> >
>
> You are suggesting (val < lo || hi < val) here, which is a bit different.
>
> Anyway, good for you. If you are signing up as code reviewer for a Linux =
kernel
> subsystem, please feel free to accept and promote such code. For me, it i=
s just
> confusing.
>
> Guenter
>

Thank you for the answer.


Barnab=C3=A1s P=C5=91cze
