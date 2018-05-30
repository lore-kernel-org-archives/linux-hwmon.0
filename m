Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from anholt.net ([50.246.234.109]:46624 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753686AbeE3TWA (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 May 2018 15:22:00 -0400
From: Eric Anholt <eric@anholt.net>
To: Guenter Roeck <linux@roeck-us.net>,
        Stefan Wahren <stefan.wahren@i2se.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Phil Elwell <phil@raspberrypi.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH V3 2/6] hwmon: Add support for RPi voltage sensor
In-Reply-To: <20180525193717.GA24967@roeck-us.net>
References: <1527276279-23876-1-git-send-email-stefan.wahren@i2se.com> <1527276279-23876-3-git-send-email-stefan.wahren@i2se.com> <20180525193717.GA24967@roeck-us.net>
Date: Wed, 30 May 2018 12:21:55 -0700
Message-ID: <87lgc1ne3w.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Guenter Roeck <linux@roeck-us.net> writes:

> On Fri, May 25, 2018 at 09:24:35PM +0200, Stefan Wahren wrote:
>> Currently there is no easy way to detect undervoltage conditions on a
>> remote Raspberry Pi. This hwmon driver retrieves the state of the
>> undervoltage sensor via mailbox interface. The handling based on
>> Noralf's modifications to the downstream firmware driver. In case of
>> an undervoltage condition only an entry is written to the kernel log.
>>=20
>> CC: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> ... assuming this will go through some arm tree.

That's fine with me, I can pull this whole set for 4.19.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlsO+dMACgkQtdYpNtH8
nug3oxAAlBRyVsZ6QhTzWCVsN0WIhFcdikUzDJB2NACRXaE6EnCIWHuomXpssLjD
VwD5lJzew2X7yl8uT6DZhp3K+eaCBtKkeNfB/etzSLEgF6Zy1JMlou/CU4APQjt8
jEv1tHxs7RzmnEx7WltRuzqYQQknVo9YEy4CGQddNxCuePIuXVDpocDy//6Hb4pk
Z5xa7GpYhMduCYqMKACA14B3lCdVTt4aVZOGdinKjzQ6seMecmchF+bR7EpPBVFR
CTTriV5qFv/shc95J/F6aGKQDtHyz7Dx2vuQ4JgyIcI+fATRXYPuTqjb7MnTrxXY
OVfOFVPldTtGXWBe2fK861uIeuu2/3SM2ajAsm5G/h7kzsQrxsSfrOdgsU1h1cK3
LNBFc0hODEdZGrkUuBT1gM/xVU2+wlTVQBbFSjU2f+9OHpGMJZBq7BOlqDSxCON5
OKkz77wnsZjg3Hoi+1z5PpdzQ97o03QwDxM7x6sSzuBrr6ghhtXBEHjyShOX/PQA
lbHit7S/rfJCc5/1zWIeDramgOZw5hUGhf7GOJZmsf8HGYVngEKgeuHZsHi9Soct
Y1T0XNTmw+lPp6SdjgqtdHAbKPJe6h23z/EFrr0zVyW2bc+ZJK9irkM3oGj4UPUC
jeI6538+6ny86V0GKEbhFdWL/ceUnwOtUQnKQftPDSSB4xz7WD0=
=xEf9
-----END PGP SIGNATURE-----
--=-=-=--
