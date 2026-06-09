Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87392388379;
	Tue,  9 Jun 2026 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998219; cv=none; b=DjnqrioxPmRM7bIhMQIhiCNUNcgQgCUz7RL5HHCEInIAgTo3jzpVFO751RcPXWCIyYh+v5jxXZ6woA1h8R1EglfgjYYCpMboi35WWEviOmphZk9a+Ct6ID1otbfQYR6wGJjnjYuxTNfbE8f/fYyS5G4rJqjqcMaVfXtPTK90+6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998219; c=relaxed/simple;
	bh=ljhlbfV8xQyU0p7pMuqW7QQ/HOFjkAZNjCoD7oRoZmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBsODp46MLSFeuO0Okr6qCS8nWtdq8vnXjDOMexsvCTEp5FqSmF8tIBxBpDNqQSO8p2xsdEC3QiNQAIeTTTfu4DZMgcRDVEfWuIgJJXTO4qwA6nBpaeE3b2emLsGUcXCl934WH1zQGJs/yUqIgBwH8K78dtbg0v4Zs22TTB+nK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faFNyHLx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faFNyHLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B0B1F00893;
	Tue,  9 Jun 2026 09:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780998218;
	bh=O5Y3IHSB2es0DwjOEGfsA5aQhEUjmXmXwYAnXUoXcek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=faFNyHLxIy7xEUYbUvKuYmcID6Llt0Nvwpc7cIL5c47GiHRlKCnX+7RcfNRNtpoNj
	 LwcsckOYLmBQ6AaCyvlAIMu4ORDmyffA+VqeXfJ5HG8P5RQsrDTLCPUrL6WxPous47
	 PqEmRU5w2j2ZEiq6NciFg3uZjliMbtyPwMDp4egeL+h38yu54CQ1E2plLWGU64AbTp
	 KHGNfq+AxdlXg/7GvFv9+CQCT0uH2eoaQ21L3hRejFLCoZFo6r4NK6w6BiRyZue1Bm
	 VhUTRF5yZAmksRYmcttwbb9qFonCpYHA8gSEMPb4TWG3Z9hluv1m+HDjXfrIF8u/zG
	 b+kdRrvxYpHkg==
Date: Tue, 9 Jun 2026 10:43:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Lars Randers <lranders@mail.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v2] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
Message-ID: <20260609-estrogen-entangled-da00ac932481@spud>
References: <20260603-ongoing-brunette-51e35be6d93e@spud>
 <fd92d7c9-9594-47b9-bd84-a6bd5ebae66d@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V9s2SO0z6RG2A/Gf"
Content-Disposition: inline
In-Reply-To: <fd92d7c9-9594-47b9-bd84-a6bd5ebae66d@roeck-us.net>


--V9s2SO0z6RG2A/Gf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2026 at 10:03:48AM -0700, Guenter Roeck wrote:
> On 6/3/26 06:19, Conor Dooley wrote:
> > From: Lars Randers <lranders@mail.dk>
> >=20
> > Add a driver for the temperature and voltage sensors on PolarFire SoC.
> > The temperature reports how hot the die is, and the voltages are the
> > SoC's 1.05, 1.8 and 2.5 volt rails respectively.
> >=20
> > The hardware supports alarms in theory, but there is an erratum that
> > prevents clearing them once triggered, so no support is added for them.
> >=20
> > The hardware measures voltage with 16 bits, of which 1 is a sign bit and
> > the remainder holds the voltage as a fixed point integer value. It's
> > improbable that the hardware will work if the voltages are negative, so
> > the driver ignores the sign bits.
> >=20
> > There's no dt support etc here because this is the child of a simple-mfd
> > syscon.
> >=20
> > Signed-off-by: Lars Randers <lranders@mail.dk>
> > Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Comments inline.

Cheers.

> > v2:
> > - Fix some minor things pointed out by Sashiko including inaccurate
> >    comments, bounds checking of values read from sysfs and Kconfig
> >    dependencies.
> > - Make update_interval use milliseconds instead of microseconds
> >    (I'll add update_interval_us support when that lands, there's a
> >    proposed workaround for the erratum circulating internally, so it'll
> >    probably come alongside alarm support).
> >=20
> > CC: Guenter Roeck <linux@roeck-us.net>
> > CC: Jonathan Corbet <corbet@lwn.net>
> > CC: Shuah Khan <skhan@linuxfoundation.org>
> > CC: Conor Dooley <conor.dooley@microchip.com>
> > CC: Daire McNamara <daire.mcnamara@microchip.com>
> > CC: linux-hwmon@vger.kernel.org
> > CC: linux-doc@vger.kernel.org
> > CC: linux-kernel@vger.kernel.org
> > CC: linux-riscv@lists.infradead.org
> > CC: Valentina.FernandezAlanis@microchip.com

> > +Usage Notes
> > +-----------
> > +
> > +update_interval has a permitted range of 0 to 8.
> > +
> > +
>=20
> It might make sense to document what "0" means.

Sure. The interval governs how much of a delay there is between the end
of one measurement and the start of the next one. Zero means no delay,
both here and in the register. Think that answers your question below
too?

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
> "Invalid argument" can not be correct for data read from the chip.
> I don't know what this means. It should be either -ENODATA (no data avail=
able)
> if this is transient or -EIO (I/O error) if it is a permanent problem.
> The same applies to other validation checks.

-ENODATA then. It's realistically only possible to hit this when the
channel is disabled, although in you can also hit it in the gap
between the channel being enabled and the first measurement becoming
available.


> > +	regmap_read(data->regmap, MPFS_TVS_OUTPUT1, &tmp);
> > +	*val =3D FIELD_GET(MPFS_OUTPUT1_TEMP_MASK, tmp);
> > +	*val -=3D MPFS_TVS_K_TO_C;
> > +	*val =3D (1000 * *val) >> 4; /* fixed point (11.4) to millidegrees */
> > +
> > +	return 0;
> > +}

> > +static int mpfs_tvs_interval_write(struct mpfs_tvs *data, u32 attr, lo=
ng val)
> > +{
> > +	unsigned long temp =3D val;
> > +
> > +	if (attr !=3D hwmon_chip_update_interval)
> > +		return -EOPNOTSUPP;
> > +
> > +	temp *=3D 1000;
>=20
> This is likely to result in overflow issues (for example if val =3D=3D LO=
NG_MAX).
>=20
> > +	temp /=3D MPFS_TVS_INTERVAL_SCALE;
> > +
> > +	/*
> > +	 * The value is 8 bits wide, but 255 is described as
> > +	 * "255=3D Do single set of transfers when scoverride set"
> > +	 * but there's no scoverride bit in the tvs register region.
> > +	 * Ban using 255 since its behaviour is suspect.
> > +	 */
> > +	if (temp > 254)
> > +		return -EINVAL;
>=20
> Hardware monitoring drivers should use clamp() and not return -EINVAL
> for ranges such as this. Since the valid range (in ms) is 0..8, I would
> suggest to clamp val to (0, 8) before any calculations to also avoid

Sure, I'll do that.

> the overflow issue mentioned above. That makes me wonder: What does "0"
> stand for ? 32 us or 0 us ? It does not make a difference here, but it
> may be relevant when microsecond intervals are implemented.

I think I answered this above, but 0 means 0 us between the end of a
measurement/conversion and the start of the next one.=20

> > +
> > +	temp <<=3D MPFS_TVS_INTERVAL_OFFSET;
> > +	regmap_update_bits(data->regmap, MPFS_TVS_CTRL,
> > +			   MPFS_TVS_INTERVAL_MASK, temp);
>=20
> If regmap never returns errors this needs to be documented in the driver.

It's an mmio regmap via a syscon, it evaluates to readl()/writel() so
there's nothing that can fail /and/ return an error.
I mean, I can add if (ret) return ret, there's not a clean place to put
a comment about it I don't think.


--V9s2SO0z6RG2A/Gf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaifgRQAKCRB4tDGHoIJi
0nq+AQCW3GCcqCPvY3ZyM5DZlJqxBXeuu68yTxmuMIeBl3Q+SQD+I+d/5QHgNtT6
ZxGg5/6q4WVGvDdHIsS5xulYSSC94Qg=
=131q
-----END PGP SIGNATURE-----

--V9s2SO0z6RG2A/Gf--
