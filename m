Return-Path: <peda@axentia.se>
Return-path: <peda@axentia.se>
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>, Guenter
 Roeck <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
Subject: [PATCH 0/2] hwmon: (ntc_thermistor) sort thermistors
Date: Wed, 21 Nov 2018 16:03:35 +0000
Message-ID: <20181121160327.16772-1-peda@axentia.se>
References: <b732b7e0-0076-9cb3-a146-4d0cd80d2658@roeck-us.net>
In-Reply-To: <b732b7e0-0076-9cb3-a146-4d0cd80d2658@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

Hi!

These patches are on top of https://patchwork.kernel.org/patch/10687455/
("hwmon: (ntc_thermistor): add support for B57891S0103 from Epcos")

I suspect the bots will be confused since that patch is not applied yet.

Also, patch 2 of this series has a false positive check-patch issue [1].
At least with my copy of check-patch. I suspect check-patch warns about
the macro in case it is ever used to something other than to initialize
an array, but I fail to see how that would be possible and am therefore
ignoring the issue.

Further, check-patch warns about patch 1 since I appear to add DT
compatibles that are not documented. But of course, I'm not adding them,
I'm just moving them about, so I'm ignoring that too.

Cheers,
Peter

[1] check-patch output is as below

CHECK: Macro argument reuse 'compensation' - possible side-effects?
#28: FILE: drivers/hwmon/ntc_thermistor.c:323:
+#define NTC_TYPE(ntc, compensation) \
+[(ntc)] =3D { .comp =3D (compensation), .n_comp =3D ARRAY_SIZE(compensatio=
n) }


Peter Rosin (2):
  hwmon: (ntc_thermistor) sort thermistor id lists alphabetically
  hwmon: (ntc_thermistor) use a table to lookup the thermistor type

 drivers/hwmon/ntc_thermistor.c               | 129 +++++++++++++++--------=
----
 include/linux/platform_data/ntc_thermistor.h |   6 +-
 2 files changed, 73 insertions(+), 62 deletions(-)

--=20
2.11.0
