Return-Path: <SRS0=JR9X=B2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09333C433DF
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 00:27:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B21C2068E
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 00:27:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="xmV5oBrn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbgHPA1N (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Aug 2020 20:27:13 -0400
Received: from mail-40138.protonmail.ch ([185.70.40.138]:33580 "EHLO
        mail-40138.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgHPA1N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Aug 2020 20:27:13 -0400
X-Greylist: delayed 5553 seconds by postgrey-1.27 at vger.kernel.org; Sat, 15 Aug 2020 20:27:12 EDT
Date:   Sun, 16 Aug 2020 00:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1597537631;
        bh=4bXrsFcXRxuTDRJ2yuhXi5kSRqCnDzRLoJjTon+lSZ8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=xmV5oBrntsOE+9GPmEw8vcdREAQV0ArTFcNyp2zJA/PLetz/p+OJFalluNnZEN1NO
         JvnTqDqsbfkJoyRBqJhQjyw79C41dzOEqHiO4i0odLkK2HnHWe+/2MMs/YWse8NQbI
         5S4lsJXREae4m2CeXK4/218RFXcQ7DL9xYp6hLms=
To:     Guenter Roeck <linux@roeck-us.net>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     jaap aarts <jaap.aarts1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH V4] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <IqRa8ZnjuWETvNkGXEMzUaLtyG7SwgZ5aZNmrh2rN_97fIHMgcHAKR7pAHteqmzuXIVEuBB5jtBN00OBzb85KA92_RyKEDaC1V8SctNLvZ8=@protonmail.com>
In-Reply-To: <99ee823b-b1fa-74a0-e377-31dc97e4d985@roeck-us.net>
References: <20200815211617.86565-1-jaap.aarts1@gmail.com> <2uSV3Shd92hhPyvj_GgPWEXYDX0o7GczgyAP4ue9S7xTHvwhqa9-4bcdMf3XNKCZ5jkq_KN7xqDRXT_X39VTcqxdvrE5x2Dft1hqNBjhXk4=@protonmail.com> <99ee823b-b1fa-74a0-e377-31dc97e4d985@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> [...]
> >> +=09=09=09if (val < (2 ^ 16) - 2)
> >
> > Did you intend to write 2 to the power of 16? Because 2^16 is not that.
> > 2 to the power 16 may be written as '(1 << 16)' or 'BIT(16)'
> > (you may need to include linux/bits.h for the latter)
> >
> > But something like this is my suggestion:
> >
> > if (val < 0 || 0xFFFF < val)
> > =09return -EINVAL;
> >
>
> I would suggest to use clamp_val; we don't expect users to know device
> specific limits. Also, FTR, I won't accept any Yoda programming.
>
> Guenter
> [...]


If you don't mind me asking, why is that? I, too, don't like Yoda condition=
s,
but I've always thought that in this specific case - when checking if a val=
ue
lies within/outside a certain range - it makes the code more easily readabl=
e
if it is written like this: (lo < val && val < hi).

Maybe I'm just too accustomed to it?

(Don't get me wrong, I'm not trying to argue with your decision about not
accepting such code, neither am I trying to convince you otherwise.)


Barnab=C3=A1s P=C5=91cze
