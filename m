Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4835832AAAE;
	Mon, 22 Dec 2025 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411131; cv=none; b=SXNy+oFfgVZKBHCm0iTW5n9qUsLwDEUXBFUsFi41cas5l44L8pM6v7iVirmdpREK6tx56cSfG3wc2vm5F6/gMRLyfIEC3vcrzzt+y6UQK79q0gQJTHcjRU67vahSg/S/4pS1FCibRHhBFcGVaaNZqi7ZnGr9LwwRE/u4O9ng8hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411131; c=relaxed/simple;
	bh=K6fMSQKfy7O1SsEMV3ZNGq9J4xccAIk/q6VfsHJB0ak=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZTjvSnPVM5AmI8KEFvavQivfsjULTYtSH2oxmeQXSdff93Jb3UA55Msr56b5jx6QN17mlZ7TRBNx326nsE/q/BnXrR/XgSo8/LVzCKlFLo3SKCXUmLSl58L4s2SG6wttvMYDeuztxSNdGS1lrqlYb6BKfNO3ApZVDiF4yHWXYYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Gpbp0JQf; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Gpbp0JQf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=V1GVF8Zwz0WMTnqNWRKGE/8ENEVjUN/l7wfc6+UaUyM=; b=Gpbp0JQf3WKd1kUhrcy61H8ij8
	kYkM2xeCMnW9xDy54Jb1O1z97v5ZTB4EmPh6p9vLAWLn7He/8nYYQZ0oRCBls+NUjLVhAEKvrheHc
	PJdp+fhCZ8b61wrD7jSRHrUJkj1tC2X4lnK73U6PSQvFgfLw/bI9D4lObZa4Ujjnjzh8lxEkbn5Nq
	bNdj3QWZSRfSaorT1b07SlkLWOsRcDnEQm7YBYNyb99gzyk7ZxYiwj28xGwSmFGDjOt/Zq3Ynx9MA
	jUU/LipUEjNFDH8pO6aa6RkcRlKh2OJAi5enqs3aU3two21WmnvR8Tl4p14TLTg7GWYQYkgngbMiw
	74Ri5NdA==;
Date: Mon, 22 Dec 2025 14:45:22 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: Add TPS65185 driver
Message-ID: <20251222144522.33d7c734@kemnade.info>
In-Reply-To: <84fdaf7c-4d4b-491f-975c-ebb14350fafd@sirena.org.uk>
References: <20251222-tps65185-submit-v1-0-34986b504d5f@kemnade.info>
	<20251222-tps65185-submit-v1-2-34986b504d5f@kemnade.info>
	<84fdaf7c-4d4b-491f-975c-ebb14350fafd@sirena.org.uk>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Dec 2025 12:36:02 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Mon, Dec 22, 2025 at 01:18:31PM +0100, Andreas Kemnade wrote:
>=20
> > Add a driver for the TPS65185 regulator. Implement handling of the vari=
ous
> > gpio pins. Because the PWRUP (=3Denable) pin functionality can be achie=
ved
> > by just using two bits instead, just ensure that it is set to a stable
> > value. =20
>=20
> The reason for having GPIO controlled enables on devices with register
> maps is that it's generally substantially faster to update a GPIO than
> to do I2C I/O.
>=20
well we are talking about 30ms turning on time here.

[  130.816647] tps65185 1-0068: turning on...
[  130.849970] tps65185 1-0068: turned on

So if we have 100khz i2c, so, we have around 0.1ms per byte, so
the read/modify/write sequence should be done in <1ms. So I guess that is
neglectible and allows the flexibility to not have that pin.

> > +static bool tps65185_volatile_reg(struct device *dev, unsigned int reg)
> > +{
> > +	switch (reg) {
> > +	case TPS65185_REG_TMST_VALUE:
> > +	case TPS65185_REG_ENABLE: =20
>=20
> Why is the enable register volatile?  I can't see anything in the
> datasheet that suggests that it should be.
>=20
Bit 7/6 are volatile. They reset automatically after operation done
Quote: "NOTE: After transition bit is cleared automatically"

> > +static int tps65185_runtime_suspend(struct device *dev)
> > +{ =20
>=20
> Implementing runtime suspend in a regulator is *very* non-idiomatic and
> is leading to large amounts of open coding throughout the driver.
> What's the story here?  I'm very surprised that this wasn't in the
> changelog.
>=20
OK, lets look around in the datasheet. We are apparently dealing
with 130=C2=B5A here which can be saved. But that should be acceptable to be
only done on system suspend even if the regulator is off most times.
So no really strong technical reason here. I am just too used to testing
power management using runtime suspend.

> +       if (data->wakeup_gpio) {
> +               ret =3D gpiod_set_value_cansleep(data->wakeup_gpio, 0);
> +               if (ret)
> +                       return ret;
> +       }
>=20
> This would usually be used for system suspend.
>=20
> +       if (data->vin_reg) {
> +               ret =3D regulator_disable(data->vin_reg);
> +               if (ret)
> +                       goto reenable_wkup;
> +       }
>=20
> Can the device really operate without power?
>=20
No, it cannot. So yes, if we require the regulator we have
simplier code here.

> > +static irqreturn_t tps65185_irq_thread(int irq, void *dev_id)
> > +{
> > +	struct tps65185_data *data =3D dev_id;
> > +	unsigned int int_status_1, int_status_2;
> > +	int ret;
> > +
> > +	/* read both status to have irq cleared */
> > +	regmap_read(data->regmap, TPS65185_REG_INT1, &int_status_1);
> > +
> > +	ret =3D regmap_read(data->regmap, TPS65185_REG_INT2, &int_status_2);
> > +	if (!ret) {
> > +		if (int_status_2 & BIT(0))
> > +			complete(&data->tmst_completion);
> > +	}
> > +
> > +	dev_dbg(data->dev, "irq status %02x %02x\n", int_status_1, int_status=
_2);
> > +
> > +	return IRQ_HANDLED;
> > +} =20
>=20
> This unconditionally reports an interrupt even if none was detected.

Hmm, this seems like some common pattern, if some irq occurs,
check some registers and if something is set, do something about it,
and then unconditionally return IRQ_HANDLED.

Regards,
Andreas
