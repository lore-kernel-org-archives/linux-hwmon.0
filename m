Return-Path: <SRS0=nCRF=AQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094DDC433DF
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jul 2020 14:43:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C15F2073E
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jul 2020 14:43:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="SVFJ2t3C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgGEOnz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jul 2020 10:43:55 -0400
Received: from mail-40135.protonmail.ch ([185.70.40.135]:43818 "EHLO
        mail-40135.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgGEOnz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jul 2020 10:43:55 -0400
Date:   Sun, 05 Jul 2020 14:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1593960232;
        bh=hkiuszVQyyYsmkKGPQZAtyDgftT14KhrpkWy1AJcbaA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=SVFJ2t3CXWQVmZmIb/w1kx3gnzW6CxIfWP7m9O+oIZ4Jech0VjMAd3Y8gjuTrGXcA
         B7ZvwBNuT/dLEh87d/6lWOiNp93HIeXf0EtHpDcp8EllAf3XrQOkerIoIU+QLMj1r0
         TjDpBplrM3xiw3HOWhtuYL8ure2h6ar6fcd+nVzg=
To:     Guenter Roeck <linux@roeck-us.net>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [QUESTION] fan rpm hwmon driver
Message-ID: <DHROZx6CXFIpnoRAMmpc1kubP3PaZnOhmjA3lnNsC651w4Zk-bIxrYhAdrVPofTDFj3ODQDmHfIKDDTRmok1FpYJAXF77qAYb9wmP2R9b14=@protonmail.com>
In-Reply-To: <1507eedb-c78c-7333-84ec-880e1ea1b1c8@roeck-us.net>
References: <xU_nzuNaKzomGSEsIdtEGvDVgR0MuUoti45TC5WzkVu0FscRsOEp7dzY4tGOoUkvrG9QPJethyosMSnxcXFuE-xcpqJ6DQwfnPkPlFiEcbY=@protonmail.com> <3b92f53f-fd3f-a432-aae1-620582701286@roeck-us.net> <vCYQSnYIKROnbBCa77NtCP1VqtQUNl8cItazgNFjTJfmzRogHKpxkUThwzQnv-HXuISOOhhZ_J_gM2Pm-Y8dwfp2c6IxY2LYirIgdbriYwQ=@protonmail.com> <3259b471-c3b6-ef22-e5c6-813313395cef@roeck-us.net> <gPUUkJgSquQcl0TQu3m4-RdGPCj7xKAyRqgZlbIcu0FoA3egKZHq6VUMpNDMLJSp5Vs9GTRV7QWOfKJR3Mv4zgKof9JtJn_bAjAZu6Rykkk=@protonmail.com> <097a08db-2afb-f220-75d3-caa9d37fd1f9@roeck-us.net> <OiRhgUQ7biZw0KwFjt27l2MOveHFmJ5I2LevL0Uh84m1lPTioycSKybzJlMzjkGpcQkVnOOI4kiY7vKQ2Yzw7-uHub8OsCUir6RsmFIE9go=@protonmail.com> <1507eedb-c78c-7333-84ec-880e1ea1b1c8@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

2020. j=C3=BAlius 5., vas=C3=A1rnap 15:23 keltez=C3=A9ssel, Guenter Roeck =
=C3=ADrta:
> On 7/5/20 4:34 AM, Barnab=C3=A1s P=C5=91cze wrote:
> [ ... ]
>
> > > > Furthermore, did it help answer the "who is going to maintain the d=
river after the initial submission" question of your previous email?
> > >
> > > A driver is not write-and-forget. It has to be maintained, preferably=
 by someone
> > > with access to the hardware. Otherwise it is going to bit-rot. Do you=
 plan to
> > > volunteer to do that ?
> >
> > I have no clue what that entails, but I am assuming: fixing bugs, accep=
ting, reviewing patches for that driver, then forwarding them upstream, may=
be also updating the code base according to the best practices at the momen=
t from time to time, correct?
>
> You would not have to forward patches upstream (I see them anyway), but
> correct for the rest.
>

I see, thank you for the clarification.


> > I would certainly volunteer if it is needed.
>
> That would be great.
>
> Something else that came to my mind: Did you examine the DSDT ?
> If the board vendor did the right thing, it should include an abstract
> means to read the fan data through ACPI. That would be much better than
> having to read it from the EC directly.
>
> Thanks,
> Guenter


I agree that it would be better, I tried this approach because the Control =
Center software provided for Microsoft Windows uses direct port i/o, so I d=
idn't really put much thought into the possible existence of an ACPI method=
 to get the data, I am not familiar with ACPI either.

I did, at least I tried to examine the DSDT, but I could not really find an=
ything fan related. Now I looked again, same results. Maybe it's that I don=
't know what exactly I should be looking for. And I feel like the acpi/fan =
driver should have picked it up, no? I could identify the EC, however. But =
I don't see anything relevant there, either. That's not to say there isn't,=
 I just couldn't find it.


Barnab=C3=A1s P=C5=91cze
