Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0ABC4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Oct 2023 21:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbjJaVHt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Oct 2023 17:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbjJaVHs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Oct 2023 17:07:48 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0188CE4
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 14:07:43 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231031210740euoutp02d4080518452e66451d9602dc2690a039~TTUj_-LIo1725517255euoutp02D;
        Tue, 31 Oct 2023 21:07:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231031210740euoutp02d4080518452e66451d9602dc2690a039~TTUj_-LIo1725517255euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698786460;
        bh=4C5C6Zc6fPyiO3oXaMmN//X1h/hMrcSwwrwmbzx/66c=;
        h=From:To:Cc:Subject:In-Reply-To:Date:References:From;
        b=ElLVntdm+6oeqO+sJCjtt1H0VLfJjikh/V/RJoc6RaQOdscMg9QLGuwKTwveYEOIE
         yzLy8wqrAjR5SvAX2OPsOL/OLUrEw2KoFSB+K/9gIQV4H+8x3vQ+0x+DgOotVIhqsz
         Tar1QIuAHWXmnoJcQGmZMdnqfQm/Pq6uPOQsu1oI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231031210739eucas1p29b9955863a3a1174fb6988c668d6824f~TTUi848nc0942209422eucas1p23;
        Tue, 31 Oct 2023 21:07:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 0F.E1.42423.B9C61456; Tue, 31
        Oct 2023 21:07:39 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231031210738eucas1p2e4901bcc3ba9b361fb562c7936c7d558~TTUiIX25j1374313743eucas1p2p;
        Tue, 31 Oct 2023 21:07:38 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231031210738eusmtrp159f4f07418b521cf0f3ef68668fcd779~TTUiH5gXH0538805388eusmtrp1Z;
        Tue, 31 Oct 2023 21:07:38 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-46-65416c9b9762
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 4D.87.10549.A9C61456; Tue, 31
        Oct 2023 21:07:38 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20231031210738eusmtip1c2be1d00318d9850edb3f49c5f0e77fb~TTUh6KfLF3202532025eusmtip1i;
        Tue, 31 Oct 2023 21:07:38 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     James Seo <james@equiv.tech>, Armin Wolf <W_Armin@gmx.de>,
        linux-hwmon@vger.kernel.org
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
In-Reply-To: <65a80c25-5646-4928-b6c8-914fb4b63046@roeck-us.net> (Guenter
        Roeck's message of "Tue, 31 Oct 2023 12:28:09 -0700")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date:   Tue, 31 Oct 2023 22:07:26 +0100
Message-ID: <oypijdmsvyec1d.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7djP87qzcxxTDTZO5raYd+0gs0X7662M
        Fk8WnmGymPj8AKsDi8f37otMHh8+xnns/N7A7vF5k1wASxSXTUpqTmZZapG+XQJXxt6f0xgL
        DohXdDy8ztLAeE64i5GTQ0LAROLhvdWsXYxcHEICKxglbu6bzgThfGGUOPrvEhuE85lR4lL7
        EXaYlrMH70C1LGeUWPrgFFTLC0aJD42zgKo4ONgE9CTWro0AaRARUJNoPtXCBmIzC8RKbD/6
        lwmkRFggQ+Lmb2aQVk6BRkaJY9/3MIHUiApYShzf2g5WzyKgKjHj4UQWEJtXwFziRvdnJghb
        UOLkzCcsEDNzJWaef8MIMkhC4AqHxIbJF6EudZG4Of8SC4QtLPHq+BaouIzE6ck9LBAN7YwS
        TVcWskI4ExglPnc0MUFUWUvcOfeLDcJ2lJi65BczyNkSAnwSN94KQmzmk5i0bTpUmFeio00I
        olpFYl3/Hqi9UhK9r1YwQtgeEtcX7YAG1mRGiTmXmhgnMCrMQvLQLCQPzQIayyygKbF+lz5E
        WFti2cLXzBC2rcS6de9ZFjCyrmIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/dxAhMO6f/Hf+0
        g3Huq496hxiZOBgPMaoANT/asPoCoxRLXn5eqpII72FTh1Qh3pTEyqrUovz4otKc1OJDjNIc
        LErivKop8qlCAumJJanZqakFqUUwWSYOTqkGpglujNf+7VDqcDuQGGB0IH/erePv7065w8Me
        cpkjxuvDd6cm5h/GUzQ2Jiy7KfzWl319+ZLPXcs00w0ioiy0qzgmLVb9LbX6QOu0pE3L9Sb3
        q1r/S6lqSbzM9rT3jU5RXfaXm7ctznSz9Xc3XV74xerClAOrJz7n5u/zVmyR+Jmll/RGtEvh
        Qcsk0+mbxeu3flpVczzz8aLD/W3cF5f4zCrM2PPhVoJvhPvb8zE2bbODp15lCdG9lljnbFdx
        jXvH/sd50ipO7O1ZIu0GZd3zV9i8Vfuy1KiwRXHav8+T3y7/NG8226qNpX15aj/OPn7UxDPl
        ok3iuvMO03yOKr7JZnvms+1WRGGNfYr3rcgtU5VYijMSDbWYi4oTAYoNfme2AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsVy+t/xu7qzchxTDd7+57OYd+0gs0X7662M
        Fk8WnmGymPj8AKsDi8f37otMHh8+xnns/N7A7vF5k1wAS5SeTVF+aUmqQkZ+cYmtUrShhZGe
        oaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJext6f0xgLDohXdDy8ztLAeE64i5GTQ0LA
        ROLswTusXYxcHEICSxklflzYBeRwACWkJFbOTYeoEZb4c62LDaLmGaNE46SNLCA1bAJ6EmvX
        RoDUiAioSTSfamEDCTMLxEm0nnQEMYUFMiRu/mYG6eQUaGSUOPZ9DxNIuZCAvcS78wcZQWxR
        AUuJ41vb2UBsFgFViRkPJ7KA2LwC5hI3uj8zQdiCEidnPgGLMwtkS3xd/Zx5AqPALCSpWUhS
        s8Cu0JRYv0sfIqwtsWzha2YI21Zi3br3LAsYWVcxiqSWFuem5xYb6hUn5haX5qXrJefnbmIE
        xsq2Yz8372Cc9+qj3iFGJg7GQ4wqQJ2PNqy+wCjFkpefl6okwnvY1CFViDclsbIqtSg/vqg0
        J7X4EKMp0AsTmaVEk/OBUZxXEm9oZmBqaGJmaWBqaWasJM7rWdCRKCSQnliSmp2aWpBaBNPH
        xMEp1cA0Oa2mK2KunM0fVjmm/5KCDsXnG+zqjslYvE5sUumMn35/h0LxEdXdH6ZOUSoT2q96
        5aFnlOOszUyXZ16ru/kirEWpPXaL51VPSbfOibU3e17Uz0w7e11QWzhhW/PNS6bl++Wfahiz
        dhvsZZ//9P2PMrHr5XxGj3+2K154YnNg9foK75pLy7YX/srX+iazbaLCuaMvVTjWOu5e03Fx
        5svMF13X3wt2iGTvE0m6HbDfrsj9y/HLVeXH/p8/7130wLjue//3qfxF1Xc2pWdJ7zhxUcTl
        SUHzbuX5DVw35H9fP2z5Ttl8hXpixvevJXuf157Icln1QDt5gti7SUe+X1++xUHZfsZl15Kt
        FbfM2K5EKbEUZyQaajEXFScCAKyTq38qAwAA
X-CMS-MailID: 20231031210738eucas1p2e4901bcc3ba9b361fb562c7936c7d558
X-Msg-Generator: CA
X-RootMTR: 20231031210738eucas1p2e4901bcc3ba9b361fb562c7936c7d558
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231031210738eucas1p2e4901bcc3ba9b361fb562c7936c7d558
References: <65a80c25-5646-4928-b6c8-914fb4b63046@roeck-us.net>
        <CGME20231031210738eucas1p2e4901bcc3ba9b361fb562c7936c7d558@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2023-10-31 wto 12:28>, when Guenter Roeck wrote:
> On 10/31/23 12:07, Lukasz Stelmach wrote:
>
> [ ... ]
>
>>> For what it's worth, I personally don't see much value in doing much
>>> more than a machine-limited workaround for now. To me it's clear that
>>> this UTF-16 corner case is a BIOS bug and its consequences are minimal
>>> once a workaround is in place.
>>>
>>> Thoughts?
>> I am no expert regarding x86 platforms and I don't know how often
>> bugs
>> like this happen and if making it more generic makes sens. Maybe.
>>=20
>
> That really depends on the system vendor, less on the CPU architecture.

Of course it's not architecture but rather vendor landscape.  My point
is that most embedded platforms I work with can be fixed at this level
by patching device-tree, which is much easier (at least for me) than
patching BIOS/UEFI. And I've seen a number of broken BIOS-es over years
which vendors didn't care to fix. At the end of the day my *impression*
is that x86 platform users more often have to live with quirks like this
that require fixes at higher levels. But this is just my impression.

>> My solution would be to add a module option, let's name it `quirks` and
>> make it a bit field for future use, that enables the workaound. Plus an
>> additional error message when probe fails to suggest user to add the
>> option to kernel command line or whatever file that contains module
>> options. A nice touch would be to detect if the workaround is still
>> required.
>>=20
>
> Please no module option. Use DMI data or similar.

DMI data is fine when can you identify broken systems upfront. In this
case we don't know which systems are or will be affected by this bug.

For example, eariler this year I fixed a different quirk in the same
machine[1] but luckily there was a way I could apply the fix without
waiting for the patch to be merged and pulled downstream. In my case
I=C2=A0could use ALSA features to make my machine work before I got a patch=
ed
kernel.

Maybe both?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Dea24b9953bcd3889f77a66e7f1d7e86e995dd9c3
[2] https://bugzilla.kernel.org/show_bug.cgi?id=3D217008
=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmVBbI4ACgkQsK4enJil
gBCTngf+OlCzgTckIe6AFQCdEPMNy6+0jftXacm0E/bOc8hLQo8DVPALHETx7jqm
ycGTlRFU1s3qlNcwEe0YTgSZsys0SFnEecklr4MrKudqFh+izDBgZFxXasN7iF8J
F91Ye035DDnBwS98fpCNj7ScIpIR+dC4SomaCuf5/SjtNXbAYhiMh3G4ywPvUXzI
WYdaOe7MCn6+GHivfn5deXztReZiGDPNEWr+l/JwusR+qsJPN3Nwfjwl3DkXEPzA
aAYiU7ULg+9+LUthVZEwLxLG2H80b19jvLwp4yjLeXor6Gw+fUuNixP/c1ZT5xZi
i44xNn0f9Yym8+xDqKX1EW88S1n1YA==
=zhdI
-----END PGP SIGNATURE-----
--=-=-=--
