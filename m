Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4F4C4167B
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Nov 2023 08:15:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345136AbjKBIPU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 2 Nov 2023 04:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344839AbjKBIPT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Nov 2023 04:15:19 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE9218A
        for <linux-hwmon@vger.kernel.org>; Thu,  2 Nov 2023 01:15:13 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231102081510euoutp01111960964e12f15abcc806ee573adcb9~TwEqCuKFn1529015290euoutp01g;
        Thu,  2 Nov 2023 08:15:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231102081510euoutp01111960964e12f15abcc806ee573adcb9~TwEqCuKFn1529015290euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698912910;
        bh=GFLen3u4U5W40emCYW6ZkD36g7AR7FylXZCv5wSq3X0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LtlIPmCMtkPz3y/vNGoHH5gTWw+VfqWBblaAADfqNsdzErxsx2EhYOUhG+OCVXkkU
         baUZCXrYrMRUVZcpZmAXzgPXSfqvvhvMwYwOlYUkoox7SR792ZOaUdQUYADIMKrtqE
         f38FLAr/CuESwpS2S8Fxp4ZMtN4YkLsBf53vnU8s=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231102081510eucas1p21cde4cb6935971424a6bb6c34140177c~TwEp1cGGc2985929859eucas1p2S;
        Thu,  2 Nov 2023 08:15:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 87.3A.42423.E8A53456; Thu,  2
        Nov 2023 08:15:10 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231102081510eucas1p21c044f33cc9cb8c6c677797fae591ead~TwEphFGh72991829918eucas1p2V;
        Thu,  2 Nov 2023 08:15:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231102081510eusmtrp2e827d6afae201781535118c58a5472f0~TwEpglWWw2346623466eusmtrp2K;
        Thu,  2 Nov 2023 08:15:10 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-ae-65435a8ea88a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id B7.17.10549.E8A53456; Thu,  2
        Nov 2023 08:15:10 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20231102081509eusmtip1a28742cd79577687c3a9148a5ffda167~TwEpVgIfg3253932539eusmtip1U;
        Thu,  2 Nov 2023 08:15:09 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     James Seo <james@equiv.tech>
Cc:     Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>,
        linux-hwmon@vger.kernel.org
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
Date:   Thu, 02 Nov 2023 09:15:09 +0100
In-Reply-To: <ZUHnrYOvIGeH1oH9@equiv.tech> (James Seo's message of "Tue, 31
 Oct 2023 22:52:45 -0700")
Message-ID: <oypijdedh8efle.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRmVeSWpSXmKPExsWy7djPc7p9Uc6pBl27JC3mXTvIbNH+eiuj
        xZOFZ5gsJj4/wOrA4vG9+yKTx4ePcR47vzewe3zeJBfAEsVlk5Kak1mWWqRvl8CV8W3RCraC
        ZQIVF7pWsjYwfuXtYuTkkBAwkbiy/SJjFyMXh5DACkaJlQu3s0M4Xxgl1jacZoZwPjNKTFz+
        jhWm5djZO2wgtpDAckaJo605EPYLRokVR9y7GDk42AT0JNaujQAJiwgoSLTO2cAIYjMLJEss
        6exkBCkRFsiQuPmbGSTMIqAq8fviESaQMKdAusTjtT4gJq+AucSBjniQClEBS4njW9vBdvIK
        CEqcnPmEBWJgrsTM82/AzpcQuMIhcfhVFyPEkS4SyzqPsEHYwhKvjm9hh7BlJP7vnM8E0dDO
        KNF0ZSErhDOBUeJzRxMTRJW1xJ1zv6C6HSW2Pl8PdpyEAJ/EjbeCEJv5JCZtm84MEeaV6GgT
        gqhWkVjXv4cFwpaS6H21ghGixEOi55oXJJxqJVZs/Mw+gVFhFpJ3ZiF5ZxZQB7OApsT6XfoQ
        YW2JZQtfM0PYthLr1r1nWcDIuopRPLW0ODc9tdgwL7Vcrzgxt7g0L10vOT93EyMw0Zz+d/zT
        Dsa5rz7qHWJk4mA8xKgC1Pxow+oLjFIsefl5qUoivIdNHVKFeFMSK6tSi/Lji0pzUosPMUpz
        sCiJ86qmyKcKCaQnlqRmp6YWpBbBZJk4OKUamOz+uu14L2y3kN9Tf7e8/uRA7UvFX5bXs5+8
        4n1xg8CSbfHdQncMDz/6bd1/6KKO3CyLo4VHv9imySc9XVPuaaortG5CyvONWdHK9tvNmbVK
        q25+8OqUzvggl6HI+HTitpXqBewWlyc9ZZcPcUs/ZzWTw7hs07dTv1X4EwtvM3RdUNFUfr7C
        IVutes6n10bTJ8VEuX1/sVC932Kz+Cydo8deZN5NnN6jtqbstd+xzQ78canZW01TRPZvFhZd
        lDhHjOeJu404j+KP79GKsd++pbjLt0804/zYb79CnKFi2qfQAgkfu/Uz7ufWvll/1WuKz/R1
        W5ma+nVV5p/98/Jf2K7zuueqpsjE159l3lXGosRSnJFoqMVcVJwIAEZ8JdivAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsVy+t/xu7p9Uc6pBpOPMVvMu3aQ2aL99VZG
        iycLzzBZTHx+gNWBxeN790Umjw8f4zx2fm9g9/i8SS6AJUrPpii/tCRVISO/uMRWKdrQwkjP
        0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv49uiFWwFywQqLnStZG1g/MrbxcjJISFg
        InHs7B22LkYuDiGBpYwS+yZuAHI4gBJSEivnpkPUCEv8udYFVfOMUaJr8nIWkBo2AT2JtWsj
        QGpEBBQkWudsYASxmQVSJDZM6GACKREWyJC4+ZsZJCwkoCmx4tl+JhCbRUBV4vfFI2A2p0C6
        xOnjM8Em8gqYSxzoiAcJiwpYShzf2s4GYvMKCEqcnPmEBWJ6tsTX1c+ZJzAKzEKSmoUkNQto
        EjPQtvW79CHC2hLLFr5mhrBtJdate8+ygJF1FaNIamlxbnpusaFecWJucWleul5yfu4mRmCk
        bDv2c/MOxnmvPuodYmTiYDzEqALU+WjD6guMUix5+XmpSiK8h00dUoV4UxIrq1KL8uOLSnNS
        iw8xmgJ9NpFZSjQ5HxjDeSXxhmYGpoYmZpYGppZmxkrivJ4FHYlCAumJJanZqakFqUUwfUwc
        nFINTB0XBE7tUbbJ7kvgO/EoeA/f5ukxr/Y5S90LtBYt1cnXtw1NU79ftf6OyrO9SttNjxfr
        HXFd+8jr5BrbeScLl+1SC/ovNuGUlXKCa9zsYL/KgsUbuzTs4xbMnnr3z6G7nTebpq1XVter
        YTs6+bLl9is7krlYtnDH/Ji3bt3MqpRF+QZG8/n9QycbN/3Lff5La8X/PwY6qrkvlKuOiAZ+
        fN88h61d70if/U3Xo2aTmpu2PUqcK3xyE08gVwjbYitOkd6p6x6V+fNOMzgn/2H7x5elvhqn
        U2a8PeqjINx4Y+qFSaI2i48v/honmuAZ7Tb9+uG6WvY/3FcqUys3PU1Z0rxksYKFYNK6VbOM
        FW+oqSixFGckGmoxFxUnAgAYLztiKQMAAA==
X-CMS-MailID: 20231102081510eucas1p21c044f33cc9cb8c6c677797fae591ead
X-Msg-Generator: CA
X-RootMTR: 20231102081510eucas1p21c044f33cc9cb8c6c677797fae591ead
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231102081510eucas1p21c044f33cc9cb8c6c677797fae591ead
References: <ZUHnrYOvIGeH1oH9@equiv.tech>
        <CGME20231102081510eucas1p21c044f33cc9cb8c6c677797fae591ead@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2023-10-31 wto 22:52>, when James Seo wrote:
> On Tue, Oct 31, 2023 at 10:07:26PM +0100, Lukasz Stelmach wrote:
>> It was <2023-10-31 wto 12:28>, when Guenter Roeck wrote:
>>> On 10/31/23 12:07, Lukasz Stelmach wrote:
[...]
>>>> My solution would be to add a module option, let's name it `quirks` and
>>>> make it a bit field for future use, that enables the workaound. Plus an
>>>> additional error message when probe fails to suggest user to add the
>>>> option to kernel command line or whatever file that contains module
>>>> options. A nice touch would be to detect if the workaround is still
>>>> required.
>>>>=20
>>>
>>> Please no module option. Use DMI data or similar.
>>=20
>> DMI data is fine when can you identify broken systems upfront. In this
>> case we don't know which systems are or will be affected by this bug.
>
> This particular bug seems extremely rare in general, which means I'm furt=
her
> inclined towards treating it as a one-off. As G=C3=BCnter said, we can al=
ways add
> more later.
>
> Can you provide the output of `dmidecode -s baseboard-product-name` for n=
ow?

=2D-8<---------------cut here---------------start------------->8---
# dmidecode -s baseboard-product-name
870C
=2D-8<---------------cut here---------------end--------------->8---

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmVDWo0ACgkQsK4enJil
gBBcWwf/UusDy7QVvIyKlNv8dqB0uOtXYzYousRTE0P2uer/5nwR4c7BDoHnc/8B
nosvz1oXLoSC9NLCLbw1A/dn3eQk50geS+K4GtbVdifnh35cwf8Y9+O8n5aPWxRF
UPMsEG9hPpDFIIJJ8rsCl2eC5KFyUgCcCzNpnAbNQLi3Em4MbAakrbueJeCqe1Jg
NLpH3g677I8DE9/i7XeoprmPMJFKkeQNLBNPwwpBEN2ymX7afVtRMmk8nxNPFo29
BhUbjCxySDZh8Ny4Lmg9pXe3g2MD4eCEMRbmupsvQjvN6KiwYcLdeq59Y23fl+cH
JGoQRQS8Wj/LXNc/+dQX1QCqNb0W8w==
=eCuv
-----END PGP SIGNATURE-----
--=-=-=--
