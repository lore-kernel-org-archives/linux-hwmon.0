Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from vulcan.natalenko.name ([104.207.131.136]:19802 "EHLO
        vulcan.natalenko.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752210AbdKXM3C (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Nov 2017 07:29:02 -0500
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.de>,
        Jonathan Buzzard <jonathan@buzzard.org.uk>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mario Limonciello <mario.limonciello@dell.com>
Subject: Re: i8k_smm_func() takes enormous of time to execute
Date: Fri, 24 Nov 2017 13:28:59 +0100
Message-ID: <2978620.NBCOB6I8fo@natalenko.name>
In-Reply-To: <20171124112543.3css4fwwmbiu36bm@pali>
References: <12093169.Rm9IG5ILEB@natalenko.name> <2197616.V8s6m9LJcd@natalenko.name> <20171124112543.3css4fwwmbiu36bm@pali>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On p=E1tek 24. listopadu 2017 12:25:43 CET Pali Roh=E1r wrote:
> On Friday 24 November 2017 12:17:30 Oleksandr Natalenko wrote:
> > > There are two patches waiting to be tested in
> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D195751
> >=20
> > Tested and attached a couple of patches on top of those to the BZ. If
> > disabling fan control is the only approach here, I can confirm that this
> > works.
>=20
> Hi! Please figure out which SMM call (they are identified by eax and ebx
> registers) cause this freeze. So we would now what needs to be
> blacklisted.

Here it goes:

[ 7.191081] dell_smm_hwmon: smm(0x10a3 0x0000) =3D 0x002e (took     1837 us=
ecs)
[ 7.194007] dell_smm_hwmon: smm(0x00a3 0x0001) =3D 0xffff (took      151 us=
ecs)
[ 7.198239] dell_smm_hwmon: smm(0x00a3 0x0000) =3D 0x0002 (took     1411 us=
ecs)
[ 7.199095] dell_smm_hwmon: smm(0x02a3 0x0001) =3D 0xffff (took       71 us=
ecs)
[ 7.700493] dell_smm_hwmon: smm(0x02a3 0x0000) =3D 0x157c (took   488912 us=
ecs)
[ 7.701277] dell_smm_hwmon: smm(0x0025 0X0000) =3D 0xffff (took       71 us=
ecs)

0x02a3 is I8K_SMM_GET_SPEED.
