Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:60780 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753577AbeCFMkE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Mar 2018 07:40:04 -0500
Date: Tue, 6 Mar 2018 13:40:02 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
        gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net,
        benh@kernel.crashing.org, andrew@lunn.ch,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a
 document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
Message-ID: <20180306124002.GA13950@amd>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  .../devicetree/bindings/peci/peci-aspeed.txt       | 73 ++++++++++++++++=
++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.txt
>=20
> diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.txt b/Doc=
umentation/devicetree/bindings/peci/peci-aspeed.txt
> new file mode 100644
> index 000000000000..8a86f346d550
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
> @@ -0,0 +1,73 @@
> +Device tree configuration for PECI buses on the AST24XX and AST25XX SoCs.

Are these SoCs x86-based?

> +Required properties:
> +- compatible
> +	"aspeed,ast2400-peci" or "aspeed,ast2500-peci"
> +	- aspeed,ast2400-peci: Aspeed AST2400 family PECI controller
> +	- aspeed,ast2500-peci: Aspeed AST2500 family PECI controller
> +
> +- reg
> +	Should contain PECI registers location and length.

Other dts documents put it on one line, reg: Should contain ...

> +- clock_frequency
> +	Should contain the operation frequency of PECI hardware module.
> +	187500 ~ 24000000

specify this is Hz?

> +- rd-sampling-point
> +	Read sampling point selection. The whole period of a bit time will be
> +	divided into 16 time frames. This value will determine which time frame
> +	this controller will sample PECI signal for data read back. Usually in
> +	the middle of a bit time is the best.

English? "This value will determine when this controller"?

> +	0 ~ 15 (default: 8)
> +
> +- cmd_timeout_ms
> +	Command timeout in units of ms.
> +	1 ~ 60000 (default: 1000)
> +
> +Example:
> +	peci: peci@1e78b000 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0x0 0x1e78b000 0x60>;
> +
> +		peci0: peci-bus@0 {
> +			compatible =3D "aspeed,ast2500-peci";
> +			reg =3D <0x0 0x60>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			interrupts =3D <15>;
> +			clocks =3D <&clk_clkin>;
> +			clock-frequency =3D <24000000>;
> +			msg-timing-nego =3D <1>;
> +			addr-timing-nego =3D <1>;
> +			rd-sampling-point =3D <8>;
> +			cmd-timeout-ms =3D <1000>;
> +		};
> +	};
> \ No newline at end of file

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqejCIACgkQMOfwapXb+vLaLQCcDjI/E5KqNtK+MwWD+At6Hvze
Wb8An3DjmGPHUBCIvAPa11iSMb/A6KuP
=YJ4Q
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
