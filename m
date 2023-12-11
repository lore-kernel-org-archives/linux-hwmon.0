Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F4DBD
	for <linux-hwmon@vger.kernel.org>; Mon, 11 Dec 2023 08:50:12 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCjTv-0000WD-1j; Mon, 11 Dec 2023 17:50:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCjTu-00F8t9-Ji; Mon, 11 Dec 2023 17:50:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCjTu-0012aP-8W; Mon, 11 Dec 2023 17:50:10 +0100
Date: Mon, 11 Dec 2023 17:50:10 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	kernel@pengutronix.de
Subject: Re: [PATCH 3/4] hwmon: (smsc47m1) Simplify device registration
Message-ID: <20231211165010.nm44otbolawxa3kb@pengutronix.de>
References: <cover.1701957840.git.u.kleine-koenig@pengutronix.de>
 <ab326fb9b1ad2191583b4cb3a8bd624dfedb908e.1701957841.git.u.kleine-koenig@pengutronix.de>
 <40402257-8b34-4bc8-a14b-70b4f9ed141e@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5tbfuyjdicys7x4m"
Content-Disposition: inline
In-Reply-To: <40402257-8b34-4bc8-a14b-70b4f9ed141e@roeck-us.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org


--5tbfuyjdicys7x4m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Guenter,

On Mon, Dec 11, 2023 at 06:39:02AM -0800, Guenter Roeck wrote:
> On Thu, Dec 07, 2023 at 03:09:31PM +0100, Uwe Kleine-K=F6nig wrote:
> > Use platform_device_register_full() instead of open coding this
> > function.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Applied. Removed double empty line while doing so.

Oh indeed. Thanks

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5tbfuyjdicys7x4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV3PcEACgkQj4D7WH0S
/k4A7wf9FIdlwjkd+KftXMqKhiApRDJ4NFfRK/DoaFPx2JqObgPerNsFKrkDIgGH
grTBhHtyOdCuVXJm7X673+CCNK4X2r/prU2UCxY06gFyV9rETTsTQDdxfWKKmX1F
0ilDe/p1IFhppVFCBW7231p8mWgU5VRubeAPPfC8jQFgkmNmXkrfLKTzdPGnir/Q
4FXLR1R8YNOex1Azh1vkjKgjPzDxE6LHih00lxgi0kY85Rt92Ins9vFRPX4KPaJv
FM+Khr8fRaksI9pHKCzCYCMtGQDmf2qaJyk9G8UgpqADldXF+8tElgVV5JERvvC8
LvaQ5QAHQZ2ov0JBn7LDunAzfl1Xkw==
=DCUV
-----END PGP SIGNATURE-----

--5tbfuyjdicys7x4m--
