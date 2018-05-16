Return-Path: <eric@anholt.net>
Return-path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Robin Murphy <robin.murphy@arm.com>, Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 2/6] dt-bindings: hwmon: Add Raspberry Pi voltage sensor
In-Reply-To: <30fc5bac-0c4a-b2c4-a018-ea521510aaea@arm.com>
References: <1526477827-10859-1-git-send-email-stefan.wahren@i2se.com> <1526477827-10859-3-git-send-email-stefan.wahren@i2se.com> <30fc5bac-0c4a-b2c4-a018-ea521510aaea@arm.com>
Date: Wed, 16 May 2018 18:51:39 +0100
Message-ID: <874lj7cwus.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-hwmon@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Robin Murphy <robin.murphy@arm.com> writes:

> On 16/05/18 14:37, Stefan Wahren wrote:
>> Recent VC4 firmware provides a hardware-independent way to retrieve the
>> under-voltage sensor on the following Raspberry Pi boards:
>>    - Raspberry Pi B+ (via GPIO on SoC)
>>    - Raspberry Pi A+ (via GPIO on SoC)
>>    - Raspberry Pi 2 B (via GPIO on SoC)
>>    - Raspberry Pi 3 B (via GPIO on port expander)
>>    - Raspberry Pi 3 B+ (via PMIC)
>>=20
>> TODO:
>>    - try to make bcm2835 firmware a bus driver
>
> Do you actually need a DT binding? From the probe routine in patch 2 it=20
> looks like this capability can be discovered dynamically by asking the=20
> firmware, therefore it might be more straightforward for the firmware=20
> driver itself to probe that and create a child device iff the feature is=
=20
> present, which the hwmon driver can then bind to as a pure platform drive=
r.

Agreed, let's skip doing this in DT.  I just switched the bcm2835-camera
driver over to not need DT, and I think you could do something similar
(and use the pdev->dev.parent to get at the firmware device).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlr8b6wACgkQtdYpNtH8
nugfWQ/9HQ4aiwNdnBlLpznZLAUwlk7+rcBYuLb1tcC63eHCWzs28IA1pOnA67EO
uBYFedesXRu1rkT8hD3Bmt9inBtMjM67CEUaUrn28GJ4EYvGYFXJVMRFTGcRE2rt
yUmSzLVKvzywLh9QkGCJMoFGf1zs/L/8aXGk66sc7FJCdKB1w9Wkd02QoZB48Hc7
7FgW3Ct/XZ7X15qUzp2e1c/5HvKNg2VgDBJrKm6ABW/HxEtTCgXeiGiKD5peQZ9P
IzC2Hs84hhUv57PXuSInVE67hpCbLaOuz0v04lDzAo8M30yfNsHUJZGfw6HMP9YY
g1fn1BLBYpGhGtI12CJrHYHjmPIDL/xVknL6OuRcyigykhwrT8mjPttdxugP650Q
6kRLJJAdbw+inJ5IWR+9X4hXKwERuoZ/ek6N/jUkyMWqD4c0bdZ1NGHXx8tfCPsC
OypnrrCneAxuTB7xFRTwT0PZeH1EiHDaznVNwDsv4ocrq5EISYPqx9asQiyIuTrP
DPu5Ah82nQ/TtRe38kSaA1Tmj1r4pgHKwGkYY+iCpzbc8RMFGJqDoBCr4t9nvgDS
sElvx6uzUTt+sfIPoR5HgXx8QoZ6hy1O+TDdfl20eXSjGJeG9sbCf783ZKQf5pFJ
h81m3P2HtTkrZ+MlntNQlariaFANVpZsuBCXLyhf8Yh55pXOo9E=
=SRZ3
-----END PGP SIGNATURE-----
--=-=-=--
