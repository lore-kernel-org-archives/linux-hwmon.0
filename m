Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from vulcan.natalenko.name ([104.207.131.136]:17534 "EHLO
        vulcan.natalenko.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752848AbdKXLRd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Nov 2017 06:17:33 -0500
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Jean Delvare <jdelvare@suse.de>
Cc: Jonathan Buzzard <jonathan@buzzard.org.uk>,
        Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mario Limonciello <mario.limonciello@dell.com>
Subject: Re: i8k_smm_func() takes enormous of time to execute
Date: Fri, 24 Nov 2017 12:17:30 +0100
Message-ID: <2197616.V8s6m9LJcd@natalenko.name>
In-Reply-To: <1511518948.15084.9.camel@suse.de>
References: <12093169.Rm9IG5ILEB@natalenko.name> <1511518948.15084.9.camel@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi.

On p=E1tek 24. listopadu 2017 11:22:28 CET Jean Delvare wrote:
> Hi Oleksandr,
>=20
> On jeu., 2017-11-23 at 22:41 +0100, Oleksandr Natalenko wrote:
> > I've noticed that querying Dell Vostro 3360 hwmon sensor freezes the
> > system
> > completely (like, really completely, even mouse cursor does not move, a=
nd
> > sound playback stops) for approx. half of a second. Then, system recove=
rs
> > and runs as usual. Also, sensor readings are okay, for instance:
> >=20
> > =3D=3D=3D
> > $ sensors dell_smm-virtual-0
> > dell_smm-virtual-0
> > Adapter: Virtual device
> > Processor Fan: 5615 RPM
> > CPU:            +51.0=B0C
> > Ambient:        +36.0=B0C
> > Other:          +63.0=B0C
> > SODIMM:         +41.0=B0C
> > =3D=3D=3D
> >=20
> > So, I've used trace-cmd to check what takes that much amount of time to
> > execute, and got this:
> >=20
> > =3D=3D=3D
> > # trace-cmd record -p function_graph -l i8k_smm -F sensors
> > dell_smm-virtual-0 $ trace-cmd report
> > ...
> > sensors-23694 [002] 89099.214369: funcgraph_entry:      # 503440.746 us=
 |
> > i8k_smm();
> > ...
> > =3D=3D=3D
> >=20
> > Clearly, 0.5 s delay.
> >=20
> > Looking at i8k_smm(), it calls i8k_smm_func() on 0th CPU:
> >=20
> > =3D=3D=3D
> >=20
> >  232     ret =3D smp_call_on_cpu(0, i8k_smm_func, regs, true);
> >=20
> > =3D=3D=3D
> >=20
> > which, in turn, does some asm magic.
> >=20
> > I know that SMM is kinda "black box", and kernel has little to do with =
it,
> > but I think that under Windows, for instance, it would work without
> > freezes. So, likely, querying SMM might be done differently.
> >=20
> > I do not know how to approach this issue, thus asking for help/advice.
> > Also, CCing Jonathan since the comment before asm magic says this:
> >=20
> > =3D=3D=3D
> >=20
> >  137  * Call the System Management Mode BIOS. Code provided by Jonathan
> >=20
> > Buzzard.
> > =3D=3D=3D
> >=20
> > This was also reported in various places before, for instance, [1], but
> > unfortunately, without any solution.
>=20
> There are two patches waiting to be tested in
> https://bugzilla.kernel.org/show_bug.cgi?id=3D195751

Tested and attached a couple of patches on top of those to the BZ. If=20
disabling fan control is the only approach here, I can confirm that this=20
works.

Thanks.

Regards,
  Oleksandr
