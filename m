Return-Path: <oleksandr@natalenko.name>
Return-path: <oleksandr@natalenko.name>
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Jonathan Buzzard <jonathan@buzzard.org.uk>
Cc: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>
Subject: i8k_smm_func() takes enormous of time to execute
Date: Thu, 23 Nov 2017 22:41:03 +0100
Message-ID: <12093169.Rm9IG5ILEB@natalenko.name>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-hwmon@vger.kernel.org>

Hi, Jonathan, Mario et al.

I've noticed that querying Dell Vostro 3360 hwmon sensor freezes the system=
=20
completely (like, really completely, even mouse cursor does not move, and=20
sound playback stops) for approx. half of a second. Then, system recovers a=
nd=20
runs as usual. Also, sensor readings are okay, for instance:

=3D=3D=3D
$ sensors dell_smm-virtual-0
dell_smm-virtual-0
Adapter: Virtual device
Processor Fan: 5615 RPM
CPU:            +51.0=B0C =20
Ambient:        +36.0=B0C =20
Other:          +63.0=B0C =20
SODIMM:         +41.0=B0C=20
=3D=3D=3D

So, I've used trace-cmd to check what takes that much amount of time to=20
execute, and got this:

=3D=3D=3D
# trace-cmd record -p function_graph -l i8k_smm -F sensors dell_smm-virtual=
=2D0
$ trace-cmd report
=2E..
sensors-23694 [002] 89099.214369: funcgraph_entry:      # 503440.746 us | =
=20
i8k_smm();
=2E..
=3D=3D=3D

Clearly, 0.5 s delay.

Looking at i8k_smm(), it calls i8k_smm_func() on 0th CPU:

=3D=3D=3D
 232     ret =3D smp_call_on_cpu(0, i8k_smm_func, regs, true);
=3D=3D=3D

which, in turn, does some asm magic.

I know that SMM is kinda "black box", and kernel has little to do with it, =
but=20
I think that under Windows, for instance, it would work without freezes. So=
,=20
likely, querying SMM might be done differently.

I do not know how to approach this issue, thus asking for help/advice. Also=
,=20
CCing Jonathan since the comment before asm magic says this:

=3D=3D=3D
 137  * Call the System Management Mode BIOS. Code provided by Jonathan=20
Buzzard.
=3D=3D=3D

This was also reported in various places before, for instance, [1], but=20
unfortunately, without any solution.

Thanks.

Regards,
  Oleksandr

[1] https://bugs.launchpad.net/ubuntu/+source/acpi/+bug/10490
