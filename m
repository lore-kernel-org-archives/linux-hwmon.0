Return-Path: <floe@butterbrot.org>
Return-path: <floe@butterbrot.org>
Subject: Re: [PATCH] export applesmc_{read,write,has}_key functions
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, rydberg@bitmath.org, rydberg@euromail.se
References: <1497603751-22360-1-git-send-email-floe@butterbrot.org>
 <20170616164133.GA31274@roeck-us.net>
From: Florian Echtler <floe@butterbrot.org>
Message-ID: <75907138-41aa-0e3b-8369-027c0af02278@butterbrot.org>
Date: Wed, 21 Jun 2017 11:15:11 +0200
MIME-Version: 1.0
In-Reply-To: <20170616164133.GA31274@roeck-us.net>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="5UMpvhxT8q9s1FlXprmeg7EcpnngbxID7"
List-ID: <linux-hwmon@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5UMpvhxT8q9s1FlXprmeg7EcpnngbxID7
Content-Type: multipart/mixed; boundary="X1XsCFrPdoXpmF4VNKsfKHXvb865sghql";
 protected-headers="v1"
From: Florian Echtler <floe@butterbrot.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, rydberg@bitmath.org, rydberg@euromail.se
Message-ID: <75907138-41aa-0e3b-8369-027c0af02278@butterbrot.org>
Subject: Re: [PATCH] export applesmc_{read,write,has}_key functions
References: <1497603751-22360-1-git-send-email-floe@butterbrot.org>
 <20170616164133.GA31274@roeck-us.net>
In-Reply-To: <20170616164133.GA31274@roeck-us.net>

--X1XsCFrPdoXpmF4VNKsfKHXvb865sghql
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 16.06.2017 18:41, Guenter Roeck wrote:
> On Fri, Jun 16, 2017 at 11:02:31AM +0200, Florian Echtler wrote:
>> This patch exports the SMC key access functions from applesmc.c to all=
ow
>> access from other drivers, in particular, the yet-to-be-written ACPI=20
>> driver for Target Display Mode (TDM).
>=20
> It is structurally deficient to have the hwmon driver export those func=
tions.
> If used by another driver, the functions should be moved to a common
> driver, possibly in mfd. This driver would then also be responsible to
> instantiate its child drivers.

Hm, this sounds like a major rework? AFAICT, that would roughly mean to m=
ove all
code up to, but not including, applesmc_calibrate to mfd and leave the re=
st in
hwmon?

What's the mechanism to auto-load another kernel module?

Best, Florian
--=20
SENT FROM MY DEC VT50 TERMINAL


--X1XsCFrPdoXpmF4VNKsfKHXvb865sghql--

--5UMpvhxT8q9s1FlXprmeg7EcpnngbxID7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAllKOR8ACgkQ7CzyshGvatiTGwCbBkeVPEdWrQERbS71PHBffmMz
KnoAn24nu3tSwwJ/1AGcPwPmF+oQS4/X
=YKQY
-----END PGP SIGNATURE-----

--5UMpvhxT8q9s1FlXprmeg7EcpnngbxID7--
