Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from anholt.net ([50.246.234.109]:55104 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731545AbeGZTeU (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jul 2018 15:34:20 -0400
From: Eric Anholt <eric@anholt.net>
To: Guenter Roeck <linux@roeck-us.net>,
        Peter Robinson <pbrobinson@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] hwmon: rpi: add module alias to raspberrypi-hwmon
In-Reply-To: <48b9e013-b1f2-4f11-d70d-9b13e69c639f@roeck-us.net>
References: <20180720230212.26006-1-pbrobinson@gmail.com> <48b9e013-b1f2-4f11-d70d-9b13e69c639f@roeck-us.net>
Date: Thu, 26 Jul 2018 11:16:18 -0700
Message-ID: <87d0v9uakt.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Guenter Roeck <linux@roeck-us.net> writes:

> On 07/20/2018 04:02 PM, Peter Robinson wrote:
>> The raspberrypi-hwmon driver doesn't automatically load, although it doe=
s work
>> when loaded, by adding the alias it auto loads as expected when built as=
 a
>> module. Tested on RPi2/RPi3 on 32 bit kernel and RPi3B+ on aarch64 with
>> Fedora 28 and a patched 4.18 RC kernel.
>>=20
>> Fixes: q3c493c885cf ("hwmon: Add support for RPi voltage sensor")
>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> CC: Stefan Wahren <stefan.wahren@i2se.com>
>> CC: Eric Anholt <eric@anholt.net>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> Florian, I think the driver is in your tree - can you take this patch ?

Florian's been on vacation for a bit, but hopefully when he gets back
(next week, iirc?) he can just apply it with my r-b as well :)

Thanks, Peter!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAltaD/IACgkQtdYpNtH8
nujiSA//ShzMwyXjXT1yUJlZaiqk7us/kNWlr5FN9S3Nf7e2fycfssc/ptwmyTjY
xSTqYGOGb5g7JjDMscBoAXxJZq5251ZzIOxz7iqe5q3TkeCuG6TSs2pvac74rFz8
DeMTmzx3ume//ZZkB4twvXIS5C9gHmqkqvi1W1JiwrKRf7vrFco//yqQFm5zp0RV
bBG0zrSNx5tZfcrYbDzllZ7+MsfAN47NIz4ca2jtkaL/fwRfwWfn2zlRG8b/qAKQ
lZM6LLBfQLixSvuTCkNNkDxJUc9OiPXqHe72Agtfc/jjXX7W1L0C2NfD3iZuOhoG
FFUn9Ew4JNFYdB6LGX2f1Jgx2V6jzFJ6GFE+IOpRP2sNo0Y84jkyDpPPUU+YJuLE
CC8jz/0SLL/sNlvK9wkJpEwhCVVQZNYKwrNv+xHpTVm/ACifU1Th6SEJPWh6MkHw
PA4UxMnSNGW43BDVXy24gzVtHcN+fgEpwIpKpg+oR+vY7T1bWMY/Ri1SzIVIJLqN
CwBhdpShg6uBPLsPgZiUz9S1cozNYjsvEYF38Re6lrsyx3L4NKltv0I1ObqmavoU
mjnQ9bKkal4Qlf0qtOHCzPyW/XUZKFakLrGt7UHB5bCweTYczf4CbpJ8TA/nX9BG
8RPQ66cgk3+w7L6FwhR9xwldouv/PulE+xqfFGlFjojdKEqaI3o=
=87AL
-----END PGP SIGNATURE-----
--=-=-=--
