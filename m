Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEB02D3EF2;
	Thu, 11 Jun 2026 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194905; cv=none; b=dwmaDSKcehFjDnjwcAVZ4n4rUrGiFokuxGdPH+FsQQjLRZ1OUO8iDwJUeRrwEtcClexHRDPTlCyoSseY81/SbKEqAE3quoDTH/HqfdiLMi6EHUKfbuzTqK0W8uuMbZTWvklNKN6e49mvNxLm2ZiCVo7+TLCUUy0bTHmwEXABAsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194905; c=relaxed/simple;
	bh=BgVKRcXjVzM9bwO7eHBXO6b+o4i2MMpKZIpzdDUd80U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJWnTIM9u2VJjaMenU3XFknp3BftTS8MTYXiMXb/ruEO2fvkxeFtvk+TtafXaSOSfa9JEDuDALmKwLpCqxfGGepuQcBM0VTObUxzi78SoGB/Y600vhSOqlP1OnwJ4OwO57g92bSD84oXfsW4/XdiDaaPYLtPHeu2VW6h2yWPs4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+iAU2+U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+iAU2+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2351F00898;
	Thu, 11 Jun 2026 16:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781194904;
	bh=rN0eZlPmK8jd/FUpsjZiMOwKDCLuIbQbAOYjVQ6GEiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V+iAU2+UdPTN2UrVxlQO1h5Dyxfha9HgMuV45HLslDJiE27Lbii2x5XxK5ggzAA8f
	 H+mSqGHiti4uX2Det3TPZWjbuP0S7EvBa+uoPo94dXMxgYN9scfo0ZAHamRLlhzRAb
	 b6h0d2zlMMDYSZ5/ywfTCgIhCGgTAcBJpMqgXFleNSZYLP3EEl+cLlr+pEtieRWqWR
	 3S0UkezBk7To4agX6MawiNTSGltG8+j/Jy9rPGIlGpyZyQvtrYBzt9rpjsDLqiQJQa
	 GrM/c8K+0Q4OUdZbsMehX39VoORo77vngCYwY+xNz10+ard8IKmT56WjAD0+XZT4Qx
	 3TGmVhB7WOg1Q==
Date: Thu, 11 Jun 2026 17:21:41 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
Message-ID: <20260611-disaster-cadmium-91745bc1931d@spud>
References: <20260611-blank-footprint-5504b819baec@spud>
 <20260611151316.685561F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sl4InEI04TzV+JzJ"
Content-Disposition: inline
In-Reply-To: <20260611151316.685561F00893@smtp.kernel.org>


--Sl4InEI04TzV+JzJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 03:13:16PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Medium] Negative values written to `update_interval` are incorrectly c=
lamped to the maximum interval instead of returning an error or clamping to=
 0.
> - [Medium] Reading `update_interval` inconsistently under-reports the con=
figured value due to integer division truncation.
> - [Medium] Hardware sensors are enabled in `probe` but are not disabled o=
n probe failure or driver unbind.
> --
>=20
> commit 91a403f5c5eef9fbcfcab3857179dc2f03ad3c89
> Author: Lars Randers <lranders@mail.dk>
>=20
> hwmon: add a driver for the temp/voltage sensor on PolarFire SoC
>=20
> Add a driver for the temperature and voltage sensors on PolarFire SoC.
> The temperature reports how hot the die is, and the voltages are the
> SoC's 1.05, 1.8 and 2.5 volt rails respectively.
>=20
> > diff --git a/drivers/hwmon/tvs-mpfs.c b/drivers/hwmon/tvs-mpfs.c
> > new file mode 100644
> > index 0000000000000..48de8d98b3444
> > --- /dev/null
> > +++ b/drivers/hwmon/tvs-mpfs.c
>=20
> [ ... ]
>=20
> > +static int mpfs_tvs_interval_read(struct mpfs_tvs *data, u32 attr, lon=
g *val)
> > +{
> > +	u32 tmp;
> > +
> > +	if (attr !=3D hwmon_chip_update_interval)
> > +		return -EOPNOTSUPP;
> > +
> > +	regmap_read(data->regmap, MPFS_TVS_CTRL, &tmp);
> > +	*val =3D FIELD_GET(MPFS_TVS_INTERVAL_MASK, tmp);
> > +	*val *=3D MPFS_TVS_INTERVAL_SCALE;
> > +	*val /=3D 1000;
>=20
> [Severity: Medium]
> Will this return an incorrectly truncated value for certain intervals?
>=20
> Since integer division is used both here and in mpfs_tvs_interval_write()=
,=20
> the truncation can cause the readback value to be lower than what was wri=
tten.
> For example, writing 7 ms calculates `(7 * 1000) / 32 =3D 218`. Reading i=
t back
> computes `(218 * 32) / 1000 =3D 6` ms.=20
>=20
> Should DIV_ROUND_CLOSEST be used for these conversions to ensure the value
> survives the round trip?

Hmm, this is actually a good point that I overlooked.
What is the desired rounding behaviour here?
IOW, should asking for 7 ms produce the closest interval less than 7 ms or
the closest interval greater than 7 ms?

A consistent rounding is better than rounding to the closest IMO, if both
update_interval and update_interval_us are going to be supported

>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static int mpfs_tvs_interval_write(struct mpfs_tvs *data, u32 attr, lo=
ng val)
> > +{
> > +	unsigned long temp =3D val;
> > +
> > +	if (attr !=3D hwmon_chip_update_interval)
> > +		return -EOPNOTSUPP;
> > +
> > +	temp =3D clamp(temp, 0U, MPFS_TVS_INTERVAL_MAX_MS);
>=20
> [Severity: Medium]
> Does this correctly handle negative input values?
>=20
> The parameter `val` is signed, but it is assigned to `unsigned long temp`=
=2E If
> a negative value is passed (e.g., -1), it undergoes an unsigned conversio=
n and
> becomes a large positive number like ULONG_MAX.=20
>=20
> When clamp() evaluates this against 8 ms, it incorrectly clamps to 8 inst=
ead of
> returning -EINVAL or properly clamping to 0.

I can definitely clamp this without casting. I considered that inputting
-1 to get the maximum was not really problematic given the documented
range and that common sense doesn't permit negative times, but since I
have to submit a v4 anyway, I'll just make this operate on the signed
value.

Cheers,
Conor.

--Sl4InEI04TzV+JzJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCairglQAKCRB4tDGHoIJi
0mjbAP0SuPpWUyxMlG5hvn+oqbV7KYYaF8un5QrKT9aIGWlS/wD/YEY8kUjDI1Hk
1/8anCACCJgYUeH3HpVSRzM4bU5DngY=
=CVAV
-----END PGP SIGNATURE-----

--Sl4InEI04TzV+JzJ--
