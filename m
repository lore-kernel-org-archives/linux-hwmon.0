Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E02C3E8348;
	Wed, 27 May 2026 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877267; cv=none; b=RK/DGGE+f8p2YDTAeS/H0wV85H9mU97kIxBlfJ5VWOPGyiBj0GQWNArUvoqbW8BanDIKlsPDmido90QE0SA0k3anA2SWU3KeMbEJMT3Mh3AXemeVPb1Um2fuCE0Xe1C8euIVIcQ3X0dJEhaApGq/K60kgB8xAth6glo9ZBjcHcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877267; c=relaxed/simple;
	bh=rr3iUanCvxzPtflgkiF0N3PNamcGvgGaRHcgJCRhp8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IibfwS6+htYCF3H0u7wa8o2SHLhBvcOnZ0DB3Jv2PJ2R7OaBGMsbJ04+mAnXndsm9osajLZUp7n4upLyboepGHwthV8+94vOsprzMOXWD9JrTZXHU4NkMqcZpm7ltg9Su4jQJgPDdhwMQWyMcaTpNK7qBntHDWpoBpH0+40SU44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWEtAHnq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWEtAHnq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A081F000E9;
	Wed, 27 May 2026 10:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779877264;
	bh=AzruJ+BlvcpcAs2QfB2KvKS3wb5J5MmbBC6u8WBLHZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CWEtAHnq5cB5NbYhw5As2LtFMh50tegwsU7icPwU9iHTEjpylhyP4atthYrP7qhnE
	 J0lP6SkucT/xOdZyunmLjdv27HI8xT6m1Ixazy6RI9ImmUl0IE0JeV0mivElBeyJNC
	 CqcCco8v8d+10jDQJdGKy+8jWzNpfNOUVZCckAdVvLeQLREhaU4DDPwV4dRESY3Svv
	 wXZuALf4x599MuLJPwSvDuEsS1e7HtlavuuKGm16aP0k13Byv7G1ESNjnVroT6hOGg
	 9mkwLUzqw/OLFSuDh85uvQs4LNmEl3qJbuttiu1Wv1od6JysXzS5SAqAe8My4E2ltC
	 lQCOVQRkSu9sg==
Date: Wed, 27 May 2026 11:21:01 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [RFC] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
Message-ID: <20260527-unrobed-example-ab127093e448@spud>
References: <20260527-earring-bully-eb4a268c2e68@spud>
 <20260527093427.B33061F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e1it+ucShdGc6Me2"
Content-Disposition: inline
In-Reply-To: <20260527093427.B33061F00A3A@smtp.kernel.org>


--e1it+ucShdGc6Me2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 09:34:27AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 10 potential iss=
ue(s) to consider:
> - [High] Masking out the sign bit of a two's complement value incorrectly=
 reports small negative voltages as massive positive spikes.
> - [High] Hardware initialization occurs after device registration and use=
s `regmap_write`, creating a race condition and clobbering existing registe=
r state.
> - [High] Missing return value checks for `regmap_read` expose uninitializ=
ed kernel stack memory to userspace.
> - [High] Blind dereference of `pdev->dev.parent` in the probe function.
> - [Medium] The `update_interval` attribute is exposed and expected in mic=
roseconds, violating the hwmon sysfs ABI standard.
> - [Medium] Boolean sysfs enable attributes fail to properly reject negati=
ve values.
> - [Medium] The driver uses syscon APIs but its Kconfig entry does not dep=
end on or select `MFD_SYSCON`.
> - [Medium] The driver ignores return values from hardware write operation=
s, masking potential hardware failures.
> - [Low] Using a bitwise right shift (`>> 4`) on potentially negative temp=
eratures relies on implementation-defined behavior and rounds incorrectly.
> - [Low] The comment explaining the absolute zero constant is mathematical=
ly incorrect.
> --
>=20
> commit 0cc52b7af906d819cbf1265ac544bb7d896a59da
> Author: Lars Randers <lranders@mail.dk>
>=20
> hwmon: add a driver for the temp/voltage sensor on PolarFire SoC
>=20
> Add a driver for the temperature and voltage sensors on PolarFire SoC.
> The temperature reports how hot the die is, and the voltages are the
> SoC's 1.05, 1.8 and 2.5 volt rails respectively.
>=20
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 14e4cea48acc4..194c8116fd018 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
>=20
> [ ... ]
>=20
> > @@ -930,6 +930,18 @@ config SENSORS_JC42
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called jc42.
> > =20
> > +config SENSORS_POLARFIRE_SOC_TVS
> > +	tristate "PolarFire SoC (MPFS) temperature and voltage sensor"
> > +	depends on POLARFIRE_SOC_MAILBOX
>=20
> [Severity: Medium]
> Should this Kconfig entry depend on or select MFD_SYSCON?
>=20
> The driver explicitly calls device_node_to_regmap() which is provided by
> the syscon framework. If MFD_SYSCON is not enabled, the fallback stub
> unconditionally returns -ENOTSUPP, which would cause the driver to silent=
ly
> fail to probe at runtime without producing any build-time warnings.

I'm not sure why this uses the mailbox as a dep, but it depends on
MFD_SYSCON so that satisfies the condition. The deps here need rework.

> > +/*
> > + * For all of these the value in millivolts is stored in 16 bits, with=
 an upper
> > + * sign bit and a lower 2 bits of decimal. These masks discard the sig=
n bit and
> > + * decimal places, because if Linux is running these voltages cannot b=
e negative
> > + * and so avoid having to convert to two's complement.
> > + */
> > +#define MPFS_OUTPUT0_V1P8_MASK	GENMASK(30, 19)
> > +#define MPFS_OUTPUT0_V1P05_MASK	GENMASK(14, 3)
> > +#define MPFS_OUTPUT1_V2P5_MASK	GENMASK(14, 3)
>=20
> [Severity: High]
> Does discarding the sign bit cause issues with slight negative readings?
>=20
> If the hardware measures a slightly negative voltage due to sensor noise
> (for example, -1 mV), wouldn't the two's complement representation have t=
he
> integer bits set to all 1s?
>=20
> Since the driver discards the sign bit and extracts the remaining bits via
> FIELD_GET, it seems this could result in reporting the maximum positive
> integer (4095 mV) instead of clamping to 0.

The comment covers this.

> > +static int mpfs_tvs_voltage_read(struct mpfs_tvs *data, u32 attr,
> > +				 int channel, long *val)
> > +{
> > +	u32 tmp, control;
> > +
> > +	if (attr !=3D hwmon_in_input && attr !=3D hwmon_in_enable)
> > +		return -EOPNOTSUPP;
> > +
> > +	regmap_read(data->regmap, MPFS_TVS_CTRL, &control);
>=20
> [Severity: High]
> Can a failed regmap_read() leave the control variable uninitialized?
>=20
> If the underlying bus read fails, the control variable remains uninitiali=
zed,
> and this function could extract bits from uninitialized kernel stack memo=
ry
> and return it to userspace via sysfs. This also appears to happen with the
> tmp variable in the other read functions below.

It's an MMIO bus, I've never bothered checking the results of
regmap_read() etc cos I can't check the result of readl().

> > +static int mpfs_tvs_temp_read(struct mpfs_tvs *data, u32 attr, long *v=
al)
> > +{
> > +	u32 tmp, control;
> > +
> > +	if (attr !=3D hwmon_temp_input && attr !=3D hwmon_temp_enable)
> > +		return -EOPNOTSUPP;
> > +
> > +	regmap_read(data->regmap, MPFS_TVS_CTRL, &control);
> > +
> > +	if (attr =3D=3D hwmon_temp_enable) {
> > +		*val =3D FIELD_GET(MPFS_TVS_CTRL_TEMP_ENABLE, control);
> > +		return 0;
> > +	}
> > +
> > +	if (!(control & MPFS_TVS_CTRL_TEMP_VALID))
> > +		return -EINVAL;
> > +
> > +	regmap_read(data->regmap, MPFS_TVS_OUTPUT1, &tmp);
> > +	*val =3D FIELD_GET(MPFS_OUTPUT1_TEMP_MASK, tmp);
> > +	*val -=3D MPFS_TVS_K_TO_C;
> > +	*val =3D (1000 * *val) >> 4; /* fixed point (11.4) to millidegrees */
>=20
> [Severity: Low]
> Does using a bitwise right shift on a potentially negative temperature
> value rely on implementation-defined behavior?
>=20
> Subtracting MPFS_TVS_K_TO_C can yield a negative number. An arithmetic
> right shift rounds towards negative infinity rather than towards zero like
> standard division, which might introduce minor inaccuracies for sub-zero
> temperatures.

Does this matter?

> > +static int mpfs_tvs_probe(struct platform_device *pdev)
> > +{
> > +	struct device *hwmon_dev;
> > +	struct mpfs_tvs *data;
> > +
> > +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	data->regmap =3D device_node_to_regmap(pdev->dev.parent->of_node);
>=20
> [Severity: High]
> Could pdev->dev.parent be NULL if the platform device is instantiated
> manually?
>=20
> If a privileged user writes to sysfs to instantiate the device or it is
> bound such that pdev->dev.parent is NULL, would this unconditional
> dereference trigger a NULL pointer dereference?

I don't think I have ever seen code check this.

> > +	if (IS_ERR(data->regmap))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(data->regmap),
> > +				     "Failed to find syscon regmap\n");
> > +
> > +	hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, "mpfs_=
tvs",
> > +							 data,
> > +							 &mpfs_tvs_chip_info,
> > +							 NULL);
> > +	if (IS_ERR(hwmon_dev))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(hwmon_dev),
> > +				     "hwmon device registration failed.\n");
> > +
> > +	regmap_write(data->regmap, MPFS_TVS_CTRL, MPFS_TVS_CTRL_ENABLE_ALL);
>=20
> [Severity: High]
> Does registering the device before enabling the sensors create a race win=
dow?
>=20
> The thermal core or userspace might attempt to read sensors after
> devm_hwmon_device_register_with_info() completes but before they are
> enabled.

Is this a realistic concern? Moving it is effectively free I think
anyway, not really even worth turning them off in a remove callback.

> Also, does this regmap_write() clobber the update_interval field?
> Overwriting the entire control register with MPFS_TVS_CTRL_ENABLE_ALL
> appears to zero out bits 15:8, destroying any interval settings made duri=
ng
> the race window or pre-configured by the bootloader.

Intentionally, to get a known-good state.

--e1it+ucShdGc6Me2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahbFjQAKCRB4tDGHoIJi
0tuIAQCdL4bfdgFo8xNvtOXzyO/OwsDd1Y1RIjgwTB8UhnLxVwD/c42grZjuJLbZ
8sXY6hMs6qhG3S25WIK5yIDGTH8WaAw=
=VBjd
-----END PGP SIGNATURE-----

--e1it+ucShdGc6Me2--
