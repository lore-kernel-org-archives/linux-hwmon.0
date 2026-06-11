Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638A042982C;
	Thu, 11 Jun 2026 16:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781197073; cv=none; b=UGYBGeIpiCg5w3ZGx8vAe/MwAyNuUogsBv12Ox+pwx+TCTAjsF+CkGjD+b0NPLYRHqeSm3BBKW4YD4AL/JmDWMftz/3j2scbrqwgzz+DkBTaFhD0AsbcykgSa2MmD5KorjF3L0YbwsZG3NizPWZYD6oYe/nTY1CDphSrzQsgbbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781197073; c=relaxed/simple;
	bh=hnkFGH4KwU6LQOleIMNqsCarVqt2OFDrG6PEaWktw7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjRQ+jd/kQsWf4KgZE9ADish7LSPPpdeAD2Atd+tnCivZhhXW3LCtKvVDdahdC3TZf9RQuln60MfSgJOgdJH/0tFwFFoo6dCK0FL9kOaHiWMJEu+Ts1dhZCEE7QDieqxhGY3VSGBwG1ysRDAuR0hPU8u5sM+QHkDkvlTqnTGmVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KfMtzAZ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KfMtzAZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399601F00893;
	Thu, 11 Jun 2026 16:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781197072;
	bh=V5U1v/LIdkzxkBZ+yiiK88nusplHyLBpqyvcjnUOU3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KfMtzAZ2MiyY2Eyb+Pe6mKoo8Wz8dqAGCR9214Fa41aHfLE4kd15aE+uGi//WJ2bu
	 hW3TbCpAJYuCYPhrSI9yJ6+hRJP/5LU6Jzodr07hdtaF48nceWs5h1+4lviPJdHoEJ
	 1j2qZp6L5USFJzFCyPn7rzMazRkfPyhQw5nBf2sGWNczX7rxMxLcenqo6cAKgc38A2
	 lbXp4wAUtAH8QTsQlvdN2Q+nmagMh670iH9BGkT/pPUWNlu90TH0mdKAazgc821/Xg
	 AULF5EnsL1WC8134ioQIkUQ6WTTGw1oWseI+6ZacTcJickrRRqArASGjXbMk6pwn+d
	 oeE93fth13ISA==
Date: Thu, 11 Jun 2026 17:57:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
Message-ID: <20260611-strained-cadet-7ea5fd2cba19@spud>
References: <20260611-blank-footprint-5504b819baec@spud>
 <20260611151316.685561F00893@smtp.kernel.org>
 <20260611-disaster-cadmium-91745bc1931d@spud>
 <4a5f47d6-90ac-4365-b4ae-02d4ca4d31d4@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Oj21ByAg3SdU6FxE"
Content-Disposition: inline
In-Reply-To: <4a5f47d6-90ac-4365-b4ae-02d4ca4d31d4@roeck-us.net>


--Oj21ByAg3SdU6FxE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 09:41:49AM -0700, Guenter Roeck wrote:
> On Thu, Jun 11, 2026 at 05:21:41PM +0100, Conor Dooley wrote:
> > On Thu, Jun 11, 2026 at 03:13:16PM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 3 potential =
issue(s) to consider:
> > > - [Medium] Negative values written to `update_interval` are incorrect=
ly clamped to the maximum interval instead of returning an error or clampin=
g to 0.
> > > - [Medium] Reading `update_interval` inconsistently under-reports the=
 configured value due to integer division truncation.
> > > - [Medium] Hardware sensors are enabled in `probe` but are not disabl=
ed on probe failure or driver unbind.
> > > --
> > >=20
> > > commit 91a403f5c5eef9fbcfcab3857179dc2f03ad3c89
> > > Author: Lars Randers <lranders@mail.dk>
> > >=20
> > > hwmon: add a driver for the temp/voltage sensor on PolarFire SoC
> > >=20
> > > Add a driver for the temperature and voltage sensors on PolarFire SoC.
> > > The temperature reports how hot the die is, and the voltages are the
> > > SoC's 1.05, 1.8 and 2.5 volt rails respectively.
> > >=20
> > > > diff --git a/drivers/hwmon/tvs-mpfs.c b/drivers/hwmon/tvs-mpfs.c
> > > > new file mode 100644
> > > > index 0000000000000..48de8d98b3444
> > > > --- /dev/null
> > > > +++ b/drivers/hwmon/tvs-mpfs.c
> > >=20
> > > [ ... ]
> > >=20
> > > > +static int mpfs_tvs_interval_read(struct mpfs_tvs *data, u32 attr,=
 long *val)
> > > > +{
> > > > +	u32 tmp;
> > > > +
> > > > +	if (attr !=3D hwmon_chip_update_interval)
> > > > +		return -EOPNOTSUPP;
> > > > +
> > > > +	regmap_read(data->regmap, MPFS_TVS_CTRL, &tmp);
> > > > +	*val =3D FIELD_GET(MPFS_TVS_INTERVAL_MASK, tmp);
> > > > +	*val *=3D MPFS_TVS_INTERVAL_SCALE;
> > > > +	*val /=3D 1000;
> > >=20
> > > [Severity: Medium]
> > > Will this return an incorrectly truncated value for certain intervals?
> > >=20
> > > Since integer division is used both here and in mpfs_tvs_interval_wri=
te(),=20
> > > the truncation can cause the readback value to be lower than what was=
 written.
> > > For example, writing 7 ms calculates `(7 * 1000) / 32 =3D 218`. Readi=
ng it back
> > > computes `(218 * 32) / 1000 =3D 6` ms.=20
> > >=20
> > > Should DIV_ROUND_CLOSEST be used for these conversions to ensure the =
value
> > > survives the round trip?
> >=20
> > Hmm, this is actually a good point that I overlooked.
> > What is the desired rounding behaviour here?
> > IOW, should asking for 7 ms produce the closest interval less than 7 ms=
 or
> > the closest interval greater than 7 ms?
> >=20
> > A consistent rounding is better than rounding to the closest IMO, if bo=
th
> > update_interval and update_interval_us are going to be supported
> >=20
>=20
> Not sure what you mean with "consistent rounding". Effectively the current

What I meant was that it would round to an interval that would either be
at least (always down) or at most (always up) as frequently as requested.
If, for example, the interval was set to 7400 or 7600 us via
update_interval_us, and then read back from update_interval, that the
rounding used for that would do the same thing as operating entirely via
update_interval and always display an interval that was at least as or
as most as frequent as the configured value.
Rounding closest would of course produce different results for 7400 and
7600, with one being more frequent and one less frequent than reality.

> code is rounding down. I personally like using DIV_ROUND_CLOSEST() for bo=
th
> read and write conversions because it gives the most accurate result. So
> (7 * 1000) / 32 =3D 218.75 would result in 219 and (219 * 32) / 1000 =3D =
7.008
> would result in 7.

--Oj21ByAg3SdU6FxE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCairpDAAKCRB4tDGHoIJi
0hD6AP0bHtf1c33Tcwwd/ZBEDRyK0eyWnDddDiIzde1dyIkMVgD/aSNtE5xPe51K
ulqjgEhrWD5X8CmUHbgtaNHPGeETrQQ=
=MRct
-----END PGP SIGNATURE-----

--Oj21ByAg3SdU6FxE--
