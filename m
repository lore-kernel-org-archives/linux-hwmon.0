Return-path: <PeterHuewe@gmx.de>
From: Peter =?windows-1252?q?H=FCwe?= <PeterHuewe@gmx.de>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Conversion of w83627ehf to hwmon_device_register_with_info ?
Date: Tue, 21 Mar 2017 11:46:24 +0100
Cc: linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 linux-kernel@vger.kernel.org
References: <201703030133.01363.PeterHuewe@gmx.de> <bb297d0e-e87a-83a9-7a2a-9cc0e6f51164@roeck-us.net>
In-Reply-To: <bb297d0e-e87a-83a9-7a2a-9cc0e6f51164@roeck-us.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201703211146.24674.PeterHuewe@gmx.de>
List-ID: <linux-hwmon@vger.kernel.org>

Hi

On Friday 03 March 2017 03:56:01 Guenter Roeck wrote:
> Hi Peter,
>=20
> On 03/02/2017 04:33 PM, Peter H=FCwe wrote:
> > Hi,
> >=20
> > is anybody else working on the conversion of the w83627ehf to the new
> > hwmon_device_register_with_info interface?
>=20
> I don't think so.
>=20
> > Otherwise I will probably update the driver to this interface within the
> > next days - but since it's a lot of work I wanted to check for
> > duplication first.
>=20
> Go ahead.

So I'm close to have to conversion done,
the current diff stat is about
647 insertions(+), 787 deletions(-)
for the whole conversion.

Should I try to break it down into smaller chunks for easier review?

Although this would mean to convert stuff from A to B and then from B to C -
otherwise the intermediate steps would be not fully functional.=20
(since the sysfs nodes partially would exist under hwmon1/ and partially un=
der=20
hwmon1/device/ (as they currently are)).

or just submit it?

It saves about 20k in compiled size, so the savings from reduced boilerplat=
e=20
are huge. (and I think it's more readable)



> I would suggest to drop nct6775/nct6776 support to simplify the
> code when you do that. Maybe as separate commit, though.
Hehe - I'm testing on a nct6776 :)
I'll look into it once the first conversion has been accepted.





Thanks,
Peter
