Return-path: <vasile.dumitrescu@undeva.eu>
MIME-Version: 1.0
In-Reply-To: <20170306123318.00d46184@endymion>
References: <1488580912-13578-1-git-send-email-pali.rohar@gmail.com>
 <CAHp75Ve4NxQ8=GQGOdwnURRzvgDOGYs1LAwd_NQE=qzWnUVMEg@mail.gmail.com>
 <CAHZJmOzdDhnts6-HUKBMoYC6FSj-Hkz=jpcfwV4gFTTEWdB7kg@mail.gmail.com> <20170306123318.00d46184@endymion>
From: Vasile Dumitrescu <vasile.dumitrescu@undeva.eu>
Date: Wed, 8 Mar 2017 20:25:33 +0100
Message-ID: <CAHZJmOxFc_c1B7Qtkqj3d-1NqW+OZ7a=ZFQaC526L3oqNhkOdA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9560 into DMI list
To: Jean Delvare <jdelvare@suse.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

Wow, that was easy :-).

so I did:
download the driver source and makefile
make
=3D> several new files show up including a .ko - WOHOOO
sudo rmmod dell-smm-hwmon
lsmod | grep hwmo
=3D> nothing
sudo insmod ./dell-smm-hwmon.ko
=3D> nothing
lsmod | grep hwmo
=3D> dell_smm_hwmon         16384  0

sudo sensors
=3D>
coretemp-isa-0000
Adapter: ISA adapter
Physical id 0:  +50.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=
=B0C)
Core 0:         +47.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=
=B0C)
Core 1:         +50.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=
=B0C)
Core 2:         +46.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=
=B0C)
Core 3:         +48.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=
=B0C)

acpitz-virtual-0
Adapter: Virtual device
temp1:        +25.0=C2=B0C  (crit =3D +107.0=C2=B0C)

dell_smm-virtual-0
Adapter: Virtual device
Processor Fan: 2490 RPM
Video Fan:     2493 RPM
CPU:            +48.0=C2=B0C
Ambient:        +48.0=C2=B0C
Ambient:        +44.0=C2=B0C
Other:          +40.0=C2=B0C

sudo pwmconfig
=3D> fans definitely stop and restart as the script indicates they should

Conclusion: works for me (TM) - without force or any special options

Thanks Jean, that was easy.

Looking forward to see it in some future kernel.

Kind regards
