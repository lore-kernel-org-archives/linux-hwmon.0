Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA03C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Oct 2023 19:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233401AbjJaTIB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Oct 2023 15:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233231AbjJaTIB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Oct 2023 15:08:01 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5E5F3
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 12:07:58 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231031190754euoutp01244bde642bee2ac8fc627cf0065611f8~TRr-wfFyb2780727807euoutp01Z;
        Tue, 31 Oct 2023 19:07:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231031190754euoutp01244bde642bee2ac8fc627cf0065611f8~TRr-wfFyb2780727807euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698779274;
        bh=DDfeCQzF6T6XGiaKOHJHBvQObdxj4bCUunftE3PL7Lc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c2CBkR5d+AXdPkFSEZfBFjVvVzKmjInrUFcYFtqZwNQ/1Tnnzb+1BIOk4WaPDD475
         QfOrg1e2CKJu699RJ7UH7836BWbpQj9dKxDQPo0XggfRpX2FCxIhdugZbeblLEUf1K
         Y9MaK/eAp8HxWqL5mLIBoA0Kiy9K+fmL+bfQA/sc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231031190754eucas1p2715559240e63b30ad63938da8cc891d4~TRr-NLiwO1660816608eucas1p2Q;
        Tue, 31 Oct 2023 19:07:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 10.4E.11320.98051456; Tue, 31
        Oct 2023 19:07:53 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231031190753eucas1p25afeef1c5372a0da4549ebea01ec0ea9~TRr_sLaMy1474414744eucas1p2J;
        Tue, 31 Oct 2023 19:07:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231031190753eusmtrp28be2e5395e34ac6334c80f7630d57ba5~TRr_rr3GF1307213072eusmtrp2M;
        Tue, 31 Oct 2023 19:07:53 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-fe-65415089b2f8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id B0.D5.10549.98051456; Tue, 31
        Oct 2023 19:07:53 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20231031190753eusmtip18ae007650da089f21af6bce532805eca~TRr_c_aFS0344103441eusmtip1c;
        Tue, 31 Oct 2023 19:07:53 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     James Seo <james@equiv.tech>
Cc:     Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>,
        linux-hwmon@vger.kernel.org
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
Date:   Tue, 31 Oct 2023 20:07:42 +0100
In-Reply-To: <ZUEIcOBpVzxC/+c1@equiv.tech> (James Seo's message of "Tue, 31
 Oct 2023 07:00:16 -0700")
Message-ID: <oypijdsf5qehkx.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djPc7qdAY6pBo/PmFvMu3aQ2aL99VZG
        iycLzzBZTHx+gNWBxeN790Umjw8f4zx2fm9g9/i8SS6AJYrLJiU1J7MstUjfLoEr48T3l2wF
        z3Qrnp+cy9bAeFili5GTQ0LARGJN3yLWLkYuDiGBFYwS99tWMIMkhAS+MEq8O8APkfjMKPH6
        wVw2mI73jzZCdSxnlLh5fSIjhPOCUeJM72Ogdg4ONgE9ibVrI0AaRAQUJFrnbGAEsZkFkiWW
        dHYygpQIC2RI3PwNtoxFQFVi7qHdYCWcAukSkxZ2s4LYvALmEv8e7wWLiwpYShzf2s4GEReU
        ODnzCQvEyFyJmeffgJ0gIXCFQ6Jj2wJmiENdJBadb2OEsIUlXh3fwg5hy0j83zmfCaKhnVGi
        6cpCVghnAqPE544mJogqa4k7535BvewosWDeYjaQqyUE+CRuvBWE2MwnMWnbdGaIMK9ER5sQ
        RLWKxLr+PSwQtpRE76sVUDd4SLzfupMJErq1ErPm/2KcwKgwC8k/s5D8MwtoKrOApsT6XfoQ
        YW2JZQtfM0PYthLr1r1nWcDIuopRPLW0ODc9tdgoL7Vcrzgxt7g0L10vOT93EyMw4Zz+d/zL
        Dsblrz7qHWJk4mA8xKgC1Pxow+oLjFIsefl5qUoivIdNHVKFeFMSK6tSi/Lji0pzUosPMUpz
        sCiJ86qmyKcKCaQnlqRmp6YWpBbBZJk4OKUamKZJC5rdPndS7IXZEVHJRxOdFBWfbW2dv2sN
        n/CjOQcvZq1gm3i6h5nd7Ljspz/G/x9zeGibNl7dGPVJ8su04OfJAp0LXBW2zd1ssz69dpen
        7pSaA1O2sQVvzrdYPrFJ5vHeBYbqPEYPwnY5KOyt2Tn9f0b+kwi9/rlfF2oYquUHbX138d3b
        6RLL5tqz7Of5ZbbK++nOa3pM69h3X+fvy59R7WPnasj4JJHJ3dLx896F589n2Pumzn7ziDFJ
        e/mqF1kHwwrnLNHJ4zsXmni/1WVlrGSD/pP1Ym48K4MzExaz1Lzcfea8n7R7cbZdC1to7oYf
        cifqr6s51lxlbJMLPeLcWLHwR16+nmTmQ2AiU2Ipzkg01GIuKk4EACEeprCzAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsVy+t/xu7qdAY6pBu/OilrMu3aQ2aL99VZG
        iycLzzBZTHx+gNWBxeN790Umjw8f4zx2fm9g9/i8SS6AJUrPpii/tCRVISO/uMRWKdrQwkjP
        0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv48T3l2wFz3Qrnp+cy9bAeFili5GTQ0LA
        ROL9o42sXYxcHEICSxkljv64wNLFyAGUkJJYOTcdokZY4s+1LjYQW0jgGaPE1ElcICVsAnoS
        a9dGgIRFBBQkWudsYASxmQVSJDZM6GACKREWyJC4+ZsZolNTYurCrWAlLAKqEnMP7QazOQXS
        Jb592wZWwytgLvHv8V6wuKiApcTxre1sEHFBiZMzn7BAjM+W+Lr6OfMERoFZSFKzkKRmAW1m
        Blq3fpc+RFhbYtnC18wQtq3EunXvWRYwsq5iFEktLc5Nzy021CtOzC0uzUvXS87P3cQIjJRt
        x35u3sE479VHvUOMTByMhxhVgDofbVh9gVGKJS8/L1VJhPewqUOqEG9KYmVValF+fFFpTmrx
        IUZToNcmMkuJJucDYzivJN7QzMDU0MTM0sDU0sxYSZzXs6AjUUggPbEkNTs1tSC1CKaPiYNT
        qoHJZKd4x3eGso1zbeJTFDmnfa66avlxisZWK2uNVLaamuWXdOaeiPw75eu0HTNvcvU9j7/U
        0bj43Euu3Rt02x7cXHd8pf3uxfEVXjumzl2efvlqncthS6f9JXLm1z2YF7JonPKxEHlZ2H5K
        Y2Ld07oPLJNX71Wr3rH9F/fmvgOxK/zjmves5RDb7aZ0+uxSthqWl9IHHbIZuT5dcCjZV9v0
        513qzZVz9Xc+W3gm6L9SnrPT9K83P6lt/jPjoMYFiyLfArbAQ9kRElJGfnOuPTu4TnrduteZ
        pctfLuee4MCkJD2pIN1kwzxzg162D/OmPl90ntHDNH8Wa6fi0+z73kyOva9+is68veD1zK0H
        qgx+zVBiKc5INNRiLipOBAAPFjiCKQMAAA==
X-CMS-MailID: 20231031190753eucas1p25afeef1c5372a0da4549ebea01ec0ea9
X-Msg-Generator: CA
X-RootMTR: 20231031190753eucas1p25afeef1c5372a0da4549ebea01ec0ea9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231031190753eucas1p25afeef1c5372a0da4549ebea01ec0ea9
References: <ZUEIcOBpVzxC/+c1@equiv.tech>
        <CGME20231031190753eucas1p25afeef1c5372a0da4549ebea01ec0ea9@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2023-10-31 wto 07:00>, when James Seo wrote:
> On Tue, Oct 31, 2023 at 11:20:00AM +0100, Lukasz Stelmach wrote:
>> I am attaching dsdt.dat. It is the only file that contains the
>> "HPBIOS_BIOSEvent" string and the above UUID.
>
> OK, I think I've figured it out.
>
> Earlier, I focused on "probe of 8F1F6435-9F42-42C8-BADC-0E9424F20C9A fail=
ed"
> (the GUID of HPBIOS_BIOSNumericSensor), and missed it when you said the f=
ailure
> is happening when check_wobj() is called from check_platform_events_wobj(=
).
> So the issue is actually with HPBIOS_PlatformEvents.Name, since any insta=
nces
> of that WMI object are examined during driver init as well.
>
> After using iasl to decompile the DSDT you sent to ACPI Source Language (=
ASL),
> everything looks fine with HPBIOS_BIOSNumericSensor. Not that I'm particu=
larly
> familiar with ASL, but search for "Name (SEN1, Package (0x06)" and read o=
n to
> the "Method (_INI, 0, NotSerialized)" and the "Method (WQAE, 1, Serialize=
d)"
> lines below. It certainly looks like that's how the BIOS on that system is
> generating HPBIOS_PlatformEvents instances at runtime.
>
> For HPBIOS_PlatformEvents instances, that BIOS seems to generate them in =
two
> places. The driver is interested in those from "Method (WQBC, 1, Serializ=
ed)",
> which rely on the section above that beginning at "Name (EVNT, Package (0=
x0D)".
> There are also some generated in "Method (WQPE, 1, Serialized)", relying =
on:
>
>         Name (CBWE, Package (0x02)
>         {
>             Package (0x05)
>             {
>                 Unicode ("4BIOS Configuration Change"), // Oops.
>                 "BIOS Settings",=20
>                 0x04,=20
>                 0x05,=20
>                 0x02
>             },=20
>
>             Package (0x05)
>             {
>                 "BIOS Configuration Security",=20
>                 "An attempt has been made to Access BIOS features unsucce=
ssfully",=20
>                 0x04,=20
>                 0x0A,=20
>                 0x06
>             }
>         })
>
> So yes, Armin was right, UTF-16 is the culprit. And it's only for this one
> instance of HPBIOS_PlatformEvents on this one system's BIOS.
>
> Can you find the wonky object instance in the debugfs interface? I imagine
> its name shows up as either "4" or an empty string, depending on the UTF-=
16
> byte order.

Indeed there is one

=2D-8<---------------cut here---------------start------------->8---
# grep -r "" /sys/kernel/debug/hp-wmi-sensors-0/platform_events/0/
/sys/kernel/debug/hp-wmi-sensors-0/platform_events/0/possible_status:2
/sys/kernel/debug/hp-wmi-sensors-0/platform_events/0/possible_severity:5
/sys/kernel/debug/hp-wmi-sensors-0/platform_events/0/category:4
/sys/kernel/debug/hp-wmi-sensors-0/platform_events/0/source_class:HPBIOS_BI=
OSEvent
/sys/kernel/debug/hp-wmi-sensors-0/platform_events/0/source_namespace:root\=
wmi
/sys/kernel/debug/hp-wmi-sensors-0/platform_events/0/description:BIOS Setti=
ngs
/sys/kernel/debug/hp-wmi-sensors-0/platform_events/0/name:4
=2D-8<---------------cut here---------------end--------------->8---

> I'm also curious how it looks in Windows (I used WMI Explorer [1] during
> development). The WMI namespace should be "\\.\root\HP\InstrumentedBIOS".

I'll see if I can find such machine with Windows. It may take a few days
thou.

>> The readings of hp_wmi_sensors-virtual-0 look sensible and they change
>> reasonably under load.
>
> Good. I guess that part working wasn't so surprising after all :)
>
> Regarding how we proceed from here, I think the main question is
> whether a workaround should be limited to only specific machines
> (maybe detected using DMI data), and if so, to specific WMI object
> types and instances (cf.  hp_wmi_get_wobj(), though limiting on
> instance number would be fragile if BIOS updates change instance
> numbering). Other questions are how thoroughly to validate UTF-16 in a
> buffer and whether to convert to UTF-8 internally.
>
> For what it's worth, I personally don't see much value in doing much
> more than a machine-limited workaround for now. To me it's clear that
> this UTF-16 corner case is a BIOS bug and its consequences are minimal
> once a workaround is in place.
>
> Thoughts?

I am no expert regarding x86 platforms and I don't know how often bugs
like this happen and if making it more generic makes sens. Maybe.

My solution would be to add a module option, let's name it `quirks` and
make it a bit field for future use, that enables the workaound. Plus an
additional error message when probe fails to suggest user to add the
option to kernel command line or whatever file that contains module
options. A nice touch would be to detect if the workaround is still
required.

Thouths.

> Also, if you'd prefer to let me handle it, I'd be glad to write a
> patch myself.

I am fine with that, I know a bit more about device-tree than about ACPI
(-; and PCs in general. I'll be glad to test the patch thou.

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmVBUH4ACgkQsK4enJil
gBApjAgAj3C3yYahkRmckb1BTCz+JFNzskkJBkbUyHOumOvFbm5RUiQhu2wwhQIj
22UT6ZyKxCKp4lQIN18Os2+/6mHzN0tz2IKhHEFAaqd79LpzC51xhfqTnWVeMEpZ
H29BLKuXRWiy/AwXrRQ2tyEBtsU1Z3HlSxB5H2y8PCSgfVXY9VwMOPwf9UBaLnPU
93AEYYhd/kMjvcUthjr9ZAEW2uMzjj9aDQMWs0WcY8PVIi5QdzUx4HSVb8xCudKD
AWglMMcUrUxCVMBvIbdrjIu9OScNzq3uJulsu5zaa2nQ1RQiZUw6hj3AFr13o9n7
XLVx4qgvHMqDiPtuaBPUAJLlRBo3NA==
=s9xF
-----END PGP SIGNATURE-----
--=-=-=--
