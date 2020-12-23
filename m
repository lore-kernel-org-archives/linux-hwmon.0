Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC62C433DB
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Dec 2020 11:28:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2BA3222F9
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Dec 2020 11:28:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbgLWL2j (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Dec 2020 06:28:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728421AbgLWL2j (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Dec 2020 06:28:39 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBE9C0613D3;
        Wed, 23 Dec 2020 03:27:58 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id y19so39175969lfa.13;
        Wed, 23 Dec 2020 03:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Mq7oGyUGa59E1kgWxLfMA1Jci1ObdTHArjOhZkOa91w=;
        b=cgwOvH1fNHe4eE0bHZQlCVZB/LJlra1wXoDb3tu2t5HFMc/IHOuLNI5MGy6veUtq6D
         l7GLpFZ8ANgItpF/g7Pfh2zlUsDuTgMuBoaR5EDo4zebl6j8MVxyQ5C1AE5dNdm1/DJv
         m5BA3qeOR+6+U1PjVMe5cX+OIwMXCJSddBCHLybeHGmuUVhzhkvvFZWslBudY+nKGHt7
         ge3MZmEPQqJbqbBYUybFMN+ZDbCkIFv1R8bTFJ8bnK3xrezvPQhl/MwgK7RXo1l3tCsJ
         usuN3YH563xngmQnHpilwrHcOZQwr6NhjiXZ1eq4Kjk6uNUibpawwfbYmbE5C2nH/DpY
         OKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Mq7oGyUGa59E1kgWxLfMA1Jci1ObdTHArjOhZkOa91w=;
        b=UipJi2/0+NJAhkkpd3tZARVUhgFePw0mXK86l9545lTSLaWunWdf81vPqvTLpy7upf
         Swd634TYwfxjIXcxiDgxcB9VntTiCCODe2Xok+7QAI629oaV2k0inY/bC+pzn8+QixDr
         sOslsVBU2GLQQurUxjwNSYBfReMTCgB/9EnM588tGoRLxLWg2GLn/OUeGGezxeiHD9L1
         pFQFCAJX1WWyFcnS7KZ5AUdzWWbKF0JhOdog8Eldp1lAHeHLrw2tTb4jpVqIOfKUlsH0
         qW+OstQ2tJ4EdPlEaTgBWcLW3mpIviXIcZKRBu5DbhQGOjSH5+vPfu6um6rh5w8KHKCE
         /iRQ==
X-Gm-Message-State: AOAM532bxPwYcUsqoJLWraDJWdZgbUN0anZqtp3ftJHY6sMfos04Tne2
        3nY+SIOvtGrDyjyt270HFUNGUPJXHTQ02vU8WQ==
X-Google-Smtp-Source: ABdhPJzFmVEWyECPcvq3nmrFAqBmpc8vLWoM++LtINdW2awkRwtsUMmHAHH16P7cOE7u7hkWk0PnM+afXZ//vgOEBJc=
X-Received: by 2002:a05:6512:491:: with SMTP id v17mr10245162lfq.148.1608722877158;
 Wed, 23 Dec 2020 03:27:57 -0800 (PST)
MIME-Version: 1.0
References: <CAEJqkgiiU7miC13iT6DufjFAsHkNZk6rBAw=KRRnHe47kTZDnw@mail.gmail.com>
 <9d621d34-e5ce-301a-1b89-92c0791fe348@roeck-us.net> <4483r6o2-245o-147-s71r-s64ss3nqr8ps@vanv.qr>
In-Reply-To: <4483r6o2-245o-147-s71r-s64ss3nqr8ps@vanv.qr>
From:   Gabriel C <nix.or.die@googlemail.com>
Date:   Wed, 23 Dec 2020 12:27:31 +0100
Message-ID: <CAEJqkgg9nbSmfByP2dZFR8RjCiTHfWpXN7sFjOkuhKoRgHLKUw@mail.gmail.com>
Subject: Re: k10temp: ZEN3 readings are broken
To:     Jan Engelhardt <jengelh@inai.de>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Wei Huang <wei.huang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am Mi., 23. Dez. 2020 um 11:41 Uhr schrieb Jan Engelhardt <jengelh@inai.de>=
:
>
>
> On Tuesday 2020-12-22 04:58, Guenter Roeck wrote:
> >On 12/21/20 5:45 PM, Gabriel C wrote:
> >> Hello Guenter,
> >>
> >> while trying to add ZEN3 support for zenpower out of tree modules, I f=
ind out
> >> the in-kernel k10temp driver is broken with ZEN3 ( and partially ZEN2 =
even ).
> >
> >[...] since I do not have time to actively maintain
> >the driver, since each chip variant seems to use different addresses and=
 scales,
> >and since the information about voltages and currents is unpublished by =
AMD,
> >I'll remove support for voltage/current readings from the upstream drive=
r.
>
> I support that decision.
>
> /proc/cpuinfo::AMD Ryzen 7 3700X 8-Core Processor, fam 23 model 113 step =
0
>
> A synthetic load (perl -e '1 while 1') x 16 shows:
> Adapter: PCI adapter
> Vcore:        +1.28 V
> Vsoc:         +1.02 V
> Tctl:         +94.8=C2=B0C
> Tdie:         +94.8=C2=B0C
> Tccd1:        +94.8=C2=B0C
> Icore:       +76.00 A
> Isoc:         +6.75 A
>
> A BOINC workload on average:
> k10temp-pci-00c3
> Adapter: PCI adapter
> Vcore:        +1.17 V
> Vsoc:         +1.02 V
> Tctl:         +94.9=C2=B0C
> Tdie:         +94.9=C2=B0C
> Tccd1:        +95.0=C2=B0C
> Icore:       +88.00 A
> Isoc:         +8.00 A
>
> The BOINC workload, when it momentarily spikes:
> Adapter: PCI adapter
> Vcore:        +1.32 V
> Vsoc:         +1.02 V
> Tctl:         +94.1=C2=B0C
> Tdie:         +94.1=C2=B0C
> Tccd1:        +96.0=C2=B0C
> Icore:       +105.00 A
> Isoc:         +7.75 A
>
> For a processor sold as a 65 W part, observing reported sensors as
> 88 A x 1.17 V + 8 A x 1.02 V =3D 111.12 W just can't be. We are off by a
> factor of about 2.

Just before I forget, even with 100% correct code you could still be off by
a factor of 2 with a broken BIOS or a vendor who is trying to bypass AMD
spec limits.

See as an example this topic:
https://cutt.ly/7h1bT48

Best Regards,

Gabriel C
