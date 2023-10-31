Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBE4C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Oct 2023 12:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235622AbjJaMGn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Oct 2023 08:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235728AbjJaMGm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Oct 2023 08:06:42 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3C35B91
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 05:06:09 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231031120606euoutp02cbf9b9d6e33eafe8b8f18466fe669fc5~TL7uDBOar0877908779euoutp02Y
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 12:06:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231031120606euoutp02cbf9b9d6e33eafe8b8f18466fe669fc5~TL7uDBOar0877908779euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698753966;
        bh=KYadIii/tmfDp/Xhqt5ciql9XBQkD9yNlJK0JXn1J74=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ff5BvwUVB7ILRvBh/IFWYV49XzReBN7R5jasSTDAduysSPR2P6vG+UGN6pdQJu3DV
         463Kq9txl5sXjQNCY8g9L2tv+R89K55GjU1oPS1WmYKHRitmPiG4pw9X2K9uiyw0S/
         GAf7YaHdwMPcOinl84F1z2VvxevyGSw/KSgJtcdI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20231031120606eucas1p1b9f30033e6dd91a3d4339377455ecf10~TL7t5qjT_1465714657eucas1p1n
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 12:06:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 49.31.52736.EADE0456; Tue, 31
        Oct 2023 12:06:06 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231031120606eucas1p143e898fc11b3465f3a13fe987f9c2b7b~TL7tgt0Qm1531915319eucas1p1k
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 12:06:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231031120606eusmtrp295548d1a4ba070356219772c570984c0~TL7tgGyyV0151101511eusmtrp2S
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 12:06:06 +0000 (GMT)
X-AuditID: cbfec7f5-41295a800000ce00-72-6540edae7490
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 32.1E.10549.EADE0456; Tue, 31
        Oct 2023 12:06:06 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20231031120606eusmtip2f2f0e73790b260363f2087ab6d3fca6c~TL7tSpl1G2467124671eusmtip2X
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 12:06:06 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     linux-hwmon@vger.kernel.org
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
Message-ID: <oypijd5y2nf60f.fsf%l.stelmach@samsung.com>
Date:   Tue, 31 Oct 2023 13:05:54 +0100
In-Reply-To: <ZT1U/zE6cApQKC2h@equiv.tech> (James Seo's message of "Sat, 28
 Oct 2023 11:37:51 -0700")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUyMcRz3e56n67mba89d4etCc9Qck0xGJGXMjbSY6YXh0k9Fd3FPR97r
        cMct5C061gtGpc5FIkl2pbwVGjehobytu6aWZrLQ9WPz3+f7efl9X/Zjael3RsYmaVKxVqNK
        lgtETEX9j6bJls5QHPAiy3em0XEdhSJlz9UxkShWFByPk5O2YO2UkLWixO/Vv9CmkrFpHY/t
        bulon7cJCVngAsH8yUCZkIiVcoUIvpUdEbgEKZdNwdueDUQ4SUFRfgbzL6E/XuNGhEsIsipK
        aVKYKKj6YHU3IZYVcP5QWhrtCnhxPnC4OBO5aE8uEVp+0i5azM2A9v5Xg80YzhfK7TmD7wu5
        BLhb5xj0DOOCoOG6UUD8EniQ82HQQ3NqyHniRK62wJ1koez+QZoMNx8uXXv1F3tCR0O5O8Gj
        4HdlHkUCRgT65wVupMhC0HNATxHXbHjT1CcgOAyaq95QrqmB84CXnRLS2QOOVZyiCS2GAwYp
        cY8Hy5Hbfw8kg0MdhYhgJdRmHkTkortgf28VnYV8zP/tY/5vH/PAqzSngCu3phB6ElwscNAE
        zwGL5SuTj9yK0Qis49UJmJ+mwVv9eZWa12kS/NelqK+igf/w6FdD701U2NHtb0MUi2xo/EC4
        zXr5KZIxmhQNlnuJa6eHYqk4XrVtO9amrNHqkjFvQ94sIx8h9o33wVIuQZWKN2K8CWv/qRQr
        lKVTQdGNjWe+2IPn3bDGi4URtsOmDI/MO3t1dzavyusVNo8zx55T9BiWLRjWabfHLCquf20v
        zN6TK3OGV2dEVdmXrv+YIWbWWLt7017WfuuPi6r3SyrxrG7egfUX2ha/GB0Ze8Lqi9L0dcEK
        hVO5JCqk9dmzJuM8CR93PnzkEMvK1PL37IR7O8McZ+pE/RGtjlsLxxqEbS0BOqfQ6VdSPX+O
        NMica+uqae9Ox8rdMSL8cPlnSYz6x1vJ3FLP1q6C8BB1a1/28Fl8i18gJ6jP7gqoDIyrUQ2d
        fr7MePRspXyRonH1wsCnjj7v9oAVlGHD/nujlU3RirDJp90jwt+tKhrTJ2f4RNXUibSWV/0B
        IULo7IoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsVy+t/xe7rr3jqkGtzq5bRof72V0YHR4/Mm
        uQDGKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2M
        73v/MRasUax4deYaawNji3QXIyeHhICJRNPk/axdjFwcQgJLGSXe7b0A5HAAJaQkVs5Nh6gR
        lvhzrYsNoqaDSWLBrmlgNWwCehJr10aA1IgIyEv0rephBAkLC2RI3PzNDBLmFTCXePz3FhuI
        LSSgKfH97jMWEJtFQFViy7WZYDanQLpE/9Rp7CC2qIClxPGt7WwQvYISJ2c+AathFsiW+Lr6
        OfMERv5ZSFKzkKRmAW1mBlqxfpc+RFhbYtnC18wQtq3EunXvWRYwsq5iFEktLc5Nzy021CtO
        zC0uzUvXS87P3cQIDOxtx35u3sE479VHvUOMTByMhxhVgDofbVh9gVGKJS8/L1VJhPewqUOq
        EG9KYmVValF+fFFpTmrxIUZToHcmMkuJJucDYy6vJN7QzMDU0MTM0sDU0sxYSZzXs6AjUUgg
        PbEkNTs1tSC1CKaPiYNTqoHJP2HG6U+/7M7/m/zckqE95AXH9tVLqiYv2HFIf22v05QPu+//
        fJB+4qSv6pOs+ibdc8pNpbY8J6zjpTJ9JlRFTExZeVC9zv6Dpb653IXtd1Xy1O3fKWwoFM6Z
        yW/1vTPSebfzWZFIozCPTI6j/ZrRLNsnlPtqKl9/7lnMO3+TsJhGp+1qxqWJ8xQj775on8/t
        qtYU+HWpfd26zn1X89TbdTjUGBQv9K+bs63p+SbnIKNSs9ZvNzjDfNUvfQnbdkFpevV0HxnN
        0y+q/omeuHFe2MV5SgdvpP1GTj7jYIZ2LtN7jBVuFfeD+U76pZb5WF2pcw6vrZ5v3iooHvLX
        VZ5d+JecS+Pvwsmq6xZ8VGIpzkg01GIuKk4EAPSVWBABAwAA
X-CMS-MailID: 20231031120606eucas1p143e898fc11b3465f3a13fe987f9c2b7b
X-Msg-Generator: CA
X-RootMTR: 20231031120606eucas1p143e898fc11b3465f3a13fe987f9c2b7b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231031120606eucas1p143e898fc11b3465f3a13fe987f9c2b7b
References: <ZT1U/zE6cApQKC2h@equiv.tech>
        <CGME20231031120606eucas1p143e898fc11b3465f3a13fe987f9c2b7b@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2023-10-28 sob 11:37>, when James Seo wrote:
> On Fri, Oct 27, 2023 at 05:07:09PM +0200, Lukasz Stelmach wrote:
>> Hi,
>
> Hi =C5=81ukasz, thanks for the report.

I've got sensor I'd like to read (-;

>> I've got HP EliteDesk 800 G6 Tower PC running Linux 6.1 from Debian=C2=
=A012.
>> I managed to build the hp-wmi-sensors out of tree. When I loaded it I
>> got EINVAL.
>>=20
>>     hp-wmi-sensors: probe of 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed=
 with error -22
>>=20
>> I managed to track it down. And it happens in check_wobj() called from
>> check_platform_events_wobj() because in the for loop when prop=3D=3D0 the
>> type is ACPI_TYPE_BUFFER instead of ACPI_TYPE_STRING. When I bypass this
>> particular check like this
>>=20
>>     if (prop =3D=3D 0 && type =3D=3D ACPI_TYPE_BUFFER)
>>             continue;
>>=20
>> everything else works like charm and I can read senosrs via sysfs.
>
> I'm surprised that your bypass is working!

Me too, honestly (-; but hey...

> That check is intended to make it safe to assume
> HPBIOS_BIOSNumericSensor.Name is a ACPI_TYPE_STRING. Which the driver
> continues to do, of course.
>
> Maybe .Name is being erroneously reported as an ACPI_TYPE_BUFFER on
> just that model, but is in reality still a string?

I wouldn't be surprised at all.

> Dealing with that string in e.g.  hp_wmi_strdup() would still work
> because .string.pointer and .buffer.pointer seem to end up at the same
> offset in a union acpi_object, at least for now.
>
>> I'd like to perpare a proper patch, but I've got no idea how to do prope=
rly
>> work this quirk around. What are your suggestions?
>
> Could you share output from acpidump

I am attaching dsdt.dat. It is the only file that contains the
"HPBIOS_BIOSEvent" string and the above UUID.

[ The attachment is too big for linux-hwmon list to handle. I am sending
this copy of the message only to the list without the attachment. ]

> and sensors before we go any further?

The readings of hp_wmi_sensors-virtual-0 look sensible and they change
reasonably under load.

=2D-8<---------------cut here---------------start------------->8---
coretemp-isa-0000
Adapter: ISA adapter
Package id 0:  +34.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 0:        +31.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 1:        +32.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 2:        +32.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 3:        +31.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 4:        +34.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 5:        +31.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 6:        +33.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Core 7:        +33.0=C2=B0C  (high =3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)

pch_cometlake-virtual-0
Adapter: Virtual device
temp1:        +49.0=C2=B0C=20=20

hp_wmi_sensors-virtual-0
Adapter: Virtual device
CPU Fan Speed:          1006 RPM
Rear Chassis Fan Speed:  901 RPM
Power Supply Fan Speed:  803 RPM
CPU Temperature:         +33.0=C2=B0C=20=20
Chassis Temperature:     +28.0=C2=B0C=20=20

ucsi_source_psy_USBC000:001-isa-0000
Adapter: ISA adapter
in0:           0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
curr1:         0.00 A  (max =3D  +0.00 A)
=2D-8<---------------cut here---------------end--------------->8---


=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmVA7aIACgkQsK4enJil
gBCZzgf/cshxy2HfVs+8aa849IcIVH4yTZu/drGT1wt5YpbEilLBx10zrLshH0qh
AW6pt7SYxYSLlyAKMKLYgS+C6kFguD0qiiJpq0MiUHEKCTqzVWVHPyei6WvNE9eX
ngy3GOzoPlu8Kq2fN2SdRn2i+H80CWrPoJJHd3Mz5XjTN3nYxgN6GVMkTEocxz8P
AoT6M91satllGNY/ih8jzUyWx9yG7iSu+NVy6jSaJCu/MVqI4JUmc4YbkgAKJmwL
KVzZaGCd5M7F7fVcFTC6kkhUvU5Gway8enr9AkCNu+lt9KVJygDtWTljRJ6CNsk6
Rlp3+MY12XRvZ2A1flYu0ch4tMswzA==
=KgBm
-----END PGP SIGNATURE-----
--=-=-=--
