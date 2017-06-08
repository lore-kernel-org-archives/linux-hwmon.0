Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1496903262.23335.1.camel@aj.id.au>
Subject: Re: [PATCH v3] hwmon: Add support for MAX31785 intelligent fan
 controller
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Joel Stanley <joel@jms.id.au>, Matthew Barth
 <msbarth@linux.vnet.ibm.com>,  linux-hwmon@vger.kernel.org, Jean Delvare
 <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Timothy Pearson
 <tpearson@raptorengineering.com>,  OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Thu, 08 Jun 2017 15:57:42 +0930
In-Reply-To: <20170607173752.GA7167@roeck-us.net>
References: <20170606070230.32669-1-andrew@aj.id.au>
	 <91cbe313-7fab-5424-7274-929cc7b31732@roeck-us.net>
	 <49c93415-8e92-68f5-b97a-0b270c40e3c6@linux.vnet.ibm.com>
	 <CACPK8Xd4B0o_1e1L_RwNTY7rmYy-09ucgF_O2MrxL27h6z0H=g@mail.gmail.com>
	 <1496817906.8159.31.camel@aj.id.au> <20170607173752.GA7167@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-koRit8N+p/UXs5DxN/QU"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-koRit8N+p/UXs5DxN/QU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-06-07 at 10:37 -0700, Guenter Roeck wrote:
> On Wed, Jun 07, 2017 at 04:15:06PM +0930, Andrew Jeffery wrote:
> > On Wed, 2017-06-07 at 12:18 +0930, Joel Stanley wrote:
> > > On Wed, Jun 7, 2017 at 1:50 AM, Matthew Barth
> > > > > > > > <msbarth@linux.vnet.ibm.com> wrote:
> > > >=20
> > > > On 06/06/17 8:33 AM, Guenter Roeck wrote:
> > > > >=20
> > > > > On 06/06/2017 12:02 AM, Andrew Jeffery wrote:
> > > > > > Over and above the features of the original patch is support fo=
r a
> > > > > > secondary
> > > > > > rotor measurement value that is provided by MAX31785 chips with=
 a revised
> > > > > > firmware. The feature(s) of the firmware are determined at prob=
e time and
> > > > > > extra
> > > > > > attributes exposed accordingly. Specifically, the MFR_REVISION =
0x3040 of
> > > > > > the
> > > > > > firmware supports 'slow' and 'fast' rotor reads. The feature is
> > > > > > implemented by
> > > > > > command 0x90 (READ_FAN_SPEED_1) providing a 4-byte response (wi=
th the
> > > > > > 'fast'
> > > > > > measurement in the second word) rather than the 2-bytes respons=
e in the
> > > > > > original firmware (MFR_REVISION 0x3030).
> > > > > >=20
> > > > >=20
> > > > > Taking the pmbus driver question out, why would this warrant anot=
her
> > > > > non-standard
> > > > > attribute outside the ABI ? I could see the desire to replace the=
 'slow'
> > > > > access
> > > > > with the 'fast' one, but provide two attributes ? No, I don't see=
 the
> > > > > point, sorry,
> > > > > even more so without detailed explanation why the second attribut=
e in
> > > > > addition
> > > > > to the first one would add any value.
> > > >=20
> > > > In the case of counter-rotating(CR) fans which contain two rotors t=
o provide
> > > > more airflow there are then two tach feedbacks. These CR fans take =
a single
> > > > target speed and provide individual feedbacks for each rotor contai=
ned
> > > > within the fan enclosure. Providing these individual feedbacks assi=
sts in
> > > > fan fault driven speed changes, improved thermal characterization a=
mong
> > > > other things.
> > > >=20
> > > > Maxim provided this as a 'slow' / 'fast' set of bytes to be user
> > > > compatible(so the 'slow' rotor speed, regardless of which rotor, is=
 in the
> > > > first 2 bytes with the 'slow' version of firmware as well). In some=
 cases,
> > > > mfg systems could have a mix of these revisions.
> > >=20
> > > Andrew, instead of creating the _fast sysfs nodes, I think you could
> > > expose the extra rotors are separate fan devices in sysfs. This would
> > > not introduce new ABI.
> >=20
> > I considered this approach: I debated whether to consider the fan unit
> > as a single entity with two inputs, or just separate fans, and ended up
> > leaning towards the former. To go the latter path we need to consider
> > whether or not to expose the writeable properties for the second input
> > (given they also affect the first) and how to sensibly arrange the
> > pairs given the functionality is determined at probe-time. Not rocket
> > science but decisions we need to make.
> >=20
>=20
> There are many other examples with one writeable and multiple readable
> attributes. Temperature offset attributes are an excellent example.
> Next question would be what exactly would be writable. pwm attributes are
> commonly completely independent of fan attributes. pwm1 output doesn't
> mean that fan1 is the matching input; in fact, most of the time it isn't.
> The only question would be numbering (is the pair numbered fan1/2 or
> fan1/fan(1+X) ?) which is just a matter of personal preference. However,
> everything is better than coming up with non-standard attributes which
> can not be used with any standard application beyond the application of t=
he
> person submitting the driver. It is bad enough if a non-standard attribut=
e
> describes something really driver specific. But a non-standard attribute
> for a fan speed reading ? Please no.=20

Yes, I've received loud and clear that I made the wrong choice :)
Apologies.

Thanks again for your feedback.

Andrew


--=-koRit8N+p/UXs5DxN/QU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZOO5eAAoJEJ0dnzgO5LT5GtIP/312kz1t7cv63wLVqMa2/khD
+vFQhh6WRsHe1I0I6+BSesUwC2jvDdaOiOLCgUqXATHgtih50cJfJDM3r3RTm0zL
iyjjPqJoQCH3KtrIS15tfKfboESJMZOnHH01sboQq//k6vYFSZZcRVDpfTri10ov
V4PEih7ucFEul/w1Y5yispRY9eKBdp9P4ojrCt8iR/2J4SA8fBCpUrJUuzhPGBob
kucQKvqtTBWHcdemv7VPuuwhKho9fT3qMLhKhpsylJOqRjURNFVwB3gPPKB/KNrC
dRSpKNDWEnoOVtkQsUpG//wp3YOD44Iqtr7PU2YtBHMV9PllGxzZlsdwteIx416L
W1/khFP9hBNWBEnPhQEnwErcAcHotcTnnKxodw8x89bHRyNem8OwXGetiohdOLAK
9vSPOLflh7uxKQToWmfu1w4UvDjJFjrLq2YPAvRe/WN7qrvgJCvAtlhJCIRDBd86
8DKo9suDbZRBJc3haxC/xNxp1hseW7+9BtZFbmt3+Xe/cv8G8xhPesU0VmQ8pUdj
pTkaCDKquUNRACa3O1RnxPs4PdtkKNNutthn3JILW7MXNcKKyjLKTWrOlYloXspB
24MNcKdI4viSQcWaxM56xDI8NKf+7s63digqpdVeyNV48DsoWUKRtBbAg5DFrnit
SeVktG8Ghz/XwUcg12TP
=4Kng
-----END PGP SIGNATURE-----

--=-koRit8N+p/UXs5DxN/QU--
