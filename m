Return-Path: <floe@butterbrot.org>
Return-path: <floe@butterbrot.org>
Subject: Re: [RFC] adding TDM support to applesmc module?
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 rydberg@bitmath.org, rydberg@euromail.se
References: <e6b44662-8b05-fb8d-660e-77153680d11b@butterbrot.org>
 <c88c2d6f-2ed0-0fbf-fc90-6fd113021b8d@roeck-us.net>
From: Florian Echtler <floe@butterbrot.org>
Message-ID: <0612a141-845f-c233-bfe3-5e6b0caa757a@butterbrot.org>
Date: Fri, 16 Jun 2017 10:17:06 +0200
MIME-Version: 1.0
In-Reply-To: <c88c2d6f-2ed0-0fbf-fc90-6fd113021b8d@roeck-us.net>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="bu7p76iJUwF9xtbTdSFxwxC2LuLpn4J93"
List-ID: <linux-hwmon@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bu7p76iJUwF9xtbTdSFxwxC2LuLpn4J93
Content-Type: multipart/mixed; boundary="AExWweVufJfgHIjf9bR8DVNoMxCB50KlW";
 protected-headers="v1"
From: Florian Echtler <floe@butterbrot.org>
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 rydberg@bitmath.org, rydberg@euromail.se
Message-ID: <0612a141-845f-c233-bfe3-5e6b0caa757a@butterbrot.org>
Subject: Re: [RFC] adding TDM support to applesmc module?
References: <e6b44662-8b05-fb8d-660e-77153680d11b@butterbrot.org>
 <c88c2d6f-2ed0-0fbf-fc90-6fd113021b8d@roeck-us.net>
In-Reply-To: <c88c2d6f-2ed0-0fbf-fc90-6fd113021b8d@roeck-us.net>

--AExWweVufJfgHIjf9bR8DVNoMxCB50KlW
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 25.05.2017 03:02, Guenter Roeck wrote:
> On 05/09/2017 02:26 AM, Florian Echtler wrote:
>> a brief question: I've recently found out how to enable Target Display=
 Mode
>> (i.e., use the iMac as a display for an external video source) when ru=
nning
>> Linux, namely by writing to some specific SMC keys.
>>
>> Right now, this involves an ugly hacked userspace tool that can't coex=
ist with
>> applesmc, so I'd like to do this "properly" and integrate support for =
these keys
>> in applesmc as a sysfs node.
>>
> Just stumbled over this and realized I never answered. I don't really h=
ave
> a strong opinion either way; the driver seems to be pretty much messed =
up as-is
> and might ask for a rework as mfd driver. Adding another attribute woul=
d not make
> that any worse. I'd expect Henrik to agree to any changes, though.

After a bit more research, I've found that we will probably need a separa=
te ACPI
platform driver anyway. So my current approach would be to modify applesm=
c only
minimally to export the applesmc_{read,write,has}_key functions, and then=
 call
those functions from the platform driver when the display hotplug event h=
appens.

Would this be feasible? AFAICT the applesmc functions already perform pro=
per
locking internally, so it shouldn't be an issue to call them from another=

driver, correct?

Best, Florian
--=20
SENT FROM MY DEC VT50 TERMINAL


--AExWweVufJfgHIjf9bR8DVNoMxCB50KlW--

--bu7p76iJUwF9xtbTdSFxwxC2LuLpn4J93
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAllDlAIACgkQ7CzyshGvatigVwCdETvodZ/lOYV8ILTJGdaIMHFG
0PAAoMXzBk7ZdCoX+l3Ht5acDWGT2lIz
=1HXg
-----END PGP SIGNATURE-----

--bu7p76iJUwF9xtbTdSFxwxC2LuLpn4J93--
