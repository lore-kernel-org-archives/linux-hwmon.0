Return-path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "linux@roeck-us.net" <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>
CC: Jonathan Corbet <corbet@lwn.net>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2 3/3] hwmon: (adt7475) temperature smoothing
Date: Wed, 3 May 2017 08:14:00 +0000
Message-ID: <d254788e161f42348a45cc2f94a25e3f@svr-chch-ex1.atlnz.lc>
References: <20170503004009.23769-1-chris.packham@alliedtelesis.co.nz>
 <20170503004009.23769-4-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

On 03/05/17 12:40, Chris Packham wrote:=0A=
> When enabled temperature smoothing allows ramping the fan speed over a=0A=
> configurable period of time instead of jumping to the new speed=0A=
> instantaneously.=0A=
>=0A=
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
> ---=0A=
> Changes in v2:=0A=
> - use a single tempN_smoothing attribute=0A=
>=0A=
>  Documentation/hwmon/adt7475 |  4 ++=0A=
>  drivers/hwmon/adt7475.c     | 99 +++++++++++++++++++++++++++++++++++++++=
++++++=0A=
>  2 files changed, 103 insertions(+)=0A=
=0A=
I've had some feedback internally on this patch around making =0A=
show_temp_st() smaller and using "enh_acoustics" instead of "enh_acou". =0A=
I'll wait for a while to see if there's any more feedback from the list =0A=
before sending out v3.=0A=
