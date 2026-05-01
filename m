Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57B03939B4;
	Fri,  1 May 2026 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655144; cv=none; b=FaPFwvh5OTdXh2A60ycZrsP5cO+DHxBr/QJcrJIGf8it82+qtKF25mgF7WpvcCBqj9+zEIiOTHE4mwjiTNrez7IO8DgE55xRscxStOjqMEEmyCZVb+m3h94aFrdCV81SNOTRktGb3lJZyPh8l0QIP+9fRNkQabTGMDp6OPSHlh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655144; c=relaxed/simple;
	bh=Zky/w8roGFiUskCftirIBIfMhxs+OSpIo7CAX+36NS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuMl6eBLg+CXZNQKsOaW5bbExC37gCiZaAeBZKbqwMuiN+0hJUnIor0vyViIbvDErz2yOeRXzX9UuZvzB4524YjrcY23yV0o4WFsx3E80iSZohxr72WZjnG9/spSzTz7FlrYQ0kE5a8OKQ1i5E6alkhZLSPz5ymnWLCgr3zMvYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtH5hMsv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtH5hMsv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FA5C2BCB4;
	Fri,  1 May 2026 17:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777655144;
	bh=Zky/w8roGFiUskCftirIBIfMhxs+OSpIo7CAX+36NS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QtH5hMsvh1iRv05XWNAfD5QvbGiCBqqoCOnRFj8pkOvmZu4lQIZI7yk5Z3afewJEN
	 P9KZt3qbDUvj6EMnD77W2JSTbqssTn8tvc2SQQT6dNlZ8ZIsDXrHSFjlkGSYY4odtT
	 d0pJXRYJ9NfXlH8UMMYlTbgq7PrfpXpO8c1Hjk/bcjYMwTCCALqclcmv2zSEhNM0ez
	 KkaXMKOvFyfhlDEZ5IlFSrt8S1Cf2fDGtMx8p1Y7f0dq1dvWNPhm9BHQNW281LgK3n
	 iBzXBUSoQ4niJachMKcBa7X1H3mq+b628v1/kMP10EThlQpmJliQ4Xs1/DJ6do4k4Y
	 z3zjOzOF2ZYIA==
Date: Fri, 1 May 2026 18:05:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
Message-ID: <20260501-earache-balance-3ac33716ac5a@spud>
References: <20260501120518.3085501-1-markus.stockhausen@gmx.de>
 <20260501120518.3085501-3-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="io1WObltbTbzSrNV"
Content-Disposition: inline
In-Reply-To: <20260501120518.3085501-3-markus.stockhausen@gmx.de>


--io1WObltbTbzSrNV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2026 at 02:05:18PM +0200, Markus Stockhausen wrote:
> All chips supported by this driver support configurable active-high
> alert polarity. This is already documented in the devicetree description.
> Add support for it to the driver.
>=20
> The default polarity of the devices is 0 (active-low). So there is
> no need to change the clear mask. For consistency reasons adapt the
> hard-coded configuration value of the AS6200. It is the only device
> that defaults to active-high polarity.

Uh, I dunno if you can do this, changing defaults is an ABI break
typically. What makes it okay to do that in this case?

>=20
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> ---
>  drivers/hwmon/lm75.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index f1a1e5b888f6..4b075a7b1cd7 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -123,7 +123,9 @@ struct lm75_data {
> =20
>  static const u8 lm75_sample_set_masks[] =3D { 0 << 5, 1 << 5, 2 << 5, 3 =
<< 5 };
> =20
> -#define LM75_SAMPLE_CLEAR_MASK	(3 << 5)
> +#define LM75_ALERT_POLARITY_HIGH_8_BIT	(BIT(2))
> +#define LM75_ALERT_POLARITY_HIGH_16_BIT	(BIT(2) << 8)
> +#define LM75_SAMPLE_CLEAR_MASK		(3 << 5)
> =20
>  /* The structure below stores the configuration values of the supported =
devices.
>   * In case of being supported multiple configurations, the default one m=
ust
> @@ -137,7 +139,7 @@ static const struct lm75_params device_params[] =3D {
>  	},
>  	[as6200] =3D {
>  		.config_reg_16bits =3D true,
> -		.set_mask =3D 0x94C0,	/* 8 sample/s, 4 CF, positive polarity */
> +		.set_mask =3D 0x90C0,	/* 8 sample/s, 4 CF */
>  		.default_resolution =3D 12,
>  		.default_sample_time =3D 125,
>  		.num_sample_times =3D 4,
> @@ -728,6 +730,7 @@ static int lm75_generic_probe(struct device *dev, con=
st char *name,
>  	struct device *hwmon_dev;
>  	struct lm75_data *data;
>  	int status, err;
> +	u16 set_mask;
> =20
>  	data =3D devm_kzalloc(dev, sizeof(struct lm75_data), GFP_KERNEL);
>  	if (!data)
> @@ -762,8 +765,15 @@ static int lm75_generic_probe(struct device *dev, co=
nst char *name,
>  		return err;
>  	data->orig_conf =3D status;
> =20
> -	err =3D lm75_write_config(data, data->params->set_mask,
> -				data->params->clr_mask);
> +	set_mask =3D data->params->set_mask;
> +	if (of_property_read_bool(dev->of_node, "lm75,alert-polarity-active-hig=
h")) {
> +		if (!data->params->config_reg_16bits)
> +			set_mask |=3D LM75_ALERT_POLARITY_HIGH_8_BIT;
> +		else
> +			set_mask |=3D LM75_ALERT_POLARITY_HIGH_16_BIT;
> +	}
> +
> +	err =3D lm75_write_config(data, set_mask, data->params->clr_mask);
>  	if (err)
>  		return err;
> =20
> --=20
> 2.54.0
>=20

--io1WObltbTbzSrNV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafTdZAAKCRB4tDGHoIJi
0sRhAP9cz2sSId3JiEBRhI4GSGt2Qgvy5RMclPY8f9aBBTPKuQD6A3T7JxhBNWz2
D6FjAoSfQHoFQJSD0UF5ZrDHQRHmXgI=
=cLHo
-----END PGP SIGNATURE-----

--io1WObltbTbzSrNV--
