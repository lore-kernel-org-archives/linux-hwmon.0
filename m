Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from butterbrot.org ([176.9.106.16]:52031 "EHLO butterbrot.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751203AbdEIJeZ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 9 May 2017 05:34:25 -0400
To: linux-hwmon@vger.kernel.org, rydberg@bitmath.org,
        rydberg@euromail.se
From: Florian Echtler <floe@butterbrot.org>
Subject: [RFC] adding TDM support to applesmc module?
Message-ID: <e6b44662-8b05-fb8d-660e-77153680d11b@butterbrot.org>
Date: Tue, 9 May 2017 11:26:57 +0200
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="013lbUpTdgLD00IAxANLMjrRILlrDVhr8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--013lbUpTdgLD00IAxANLMjrRILlrDVhr8
Content-Type: multipart/mixed; boundary="pVKMRfv9qaOm9NOG8hr45DJgprWS37Kim";
 protected-headers="v1"
From: Florian Echtler <floe@butterbrot.org>
To: linux-hwmon@vger.kernel.org, rydberg@bitmath.org, rydberg@euromail.se
Message-ID: <e6b44662-8b05-fb8d-660e-77153680d11b@butterbrot.org>
Subject: [RFC] adding TDM support to applesmc module?

--pVKMRfv9qaOm9NOG8hr45DJgprWS37Kim
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello everyone,

a brief question: I've recently found out how to enable Target Display Mo=
de
(i.e., use the iMac as a display for an external video source) when runni=
ng
Linux, namely by writing to some specific SMC keys.

Right now, this involves an ugly hacked userspace tool that can't coexist=
 with
applesmc, so I'd like to do this "properly" and integrate support for the=
se keys
in applesmc as a sysfs node.

Would this be the correct route, although applesmc is a hwmon module?

Best, Florian
--=20
SENT FROM MY DEC VT50 TERMINAL


--pVKMRfv9qaOm9NOG8hr45DJgprWS37Kim--

--013lbUpTdgLD00IAxANLMjrRILlrDVhr8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlkRi2EACgkQ7CzyshGvatjiTQCcDJ7Kv2afuU1aK8XZ/paTmHEw
JawAoIBSWihW+Kxy2sfvgz78ilCv7IN0
=yubV
-----END PGP SIGNATURE-----

--013lbUpTdgLD00IAxANLMjrRILlrDVhr8--
