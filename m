Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E97F3A8F7;
	Wed, 24 Dec 2025 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766563963; cv=none; b=hbwa2RBaGvAbyLA2gBa3n3Fmt94VgVvoGv3axbjXvYzWqaW27lQEgZIhF+e0nVnD4jhq/jC0TCphM/JEhLQyZ8qAIDT0vM06tY3681Be4v1oV+2Jdyvl9tS/BUBazFcYMfBvwdcTqdc9td9nuQ9c4EjRqw+B0WxUjgh6a7BKw/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766563963; c=relaxed/simple;
	bh=+2BTcmbft6EbJTSaju/QuY53Eo3hhYNJ88HBrpvNugs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nNcBuH1nM1ekjkVm4u9A/qpcn66+l+rx1w3RVcEQcy0ZjoQZfdANph/tRftOhkwugL5ySQAR9rQfbhUcBuE0n/PeiYGWotGRH2FwfC+dGKqDrn2zL6LsksUYqT1ni1814SpDgZ8LN+AzcNZCm3kwZMXI41yycXafe1G3kdB6w0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=cOB/ydiF; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="cOB/ydiF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=qDSmecXBDmz3XTt3DW+peKb6ITN3jz/ST8NVFSTwwWA=; b=cOB/ydiF1ZCWlVHPfEQLC6YW1S
	KElVEfXZXprvOTYkFFvwz/q9d18dXDhyW9NmZwxozOURUgCjaUjoQIq8x241SJmomCwXngQK7vaaw
	iXcgoXpfvEynCd2lGvqntyzZ8GcQC6rHVUZEmsfUjHcKZfFP3pxNF1WcrE5fnsZnPG/TkGy7lrY9y
	His7Q71RpeJh4+4m0Kfgl/R9I/LduMNOJQ4SwgDnNYlwyD81M0bcs8SKa915Pns5VrMm7Swma6K1b
	4gguHf1yeoQz3hd+gdguHabp0gp1dzH4IccJLbd7AbwK7qK1E+tLDoIMFpw8sqnue0sNWP3BSJ05e
	c1Di5IYA==;
Date: Wed, 24 Dec 2025 09:12:35 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: Add TPS65185 driver
Message-ID: <20251224010440.46ad717a@kemnade.info>
In-Reply-To: <2e850c1c-67ed-44af-94b1-2ccc35e50bb8@sirena.org.uk>
References: <20251222-tps65185-submit-v1-0-34986b504d5f@kemnade.info>
	<20251222-tps65185-submit-v1-2-34986b504d5f@kemnade.info>
	<84fdaf7c-4d4b-491f-975c-ebb14350fafd@sirena.org.uk>
	<20251222144522.33d7c734@kemnade.info>
	<2e850c1c-67ed-44af-94b1-2ccc35e50bb8@sirena.org.uk>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Dec 2025 15:07:28 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Mon, Dec 22, 2025 at 02:45:22PM +0100, Andreas Kemnade wrote:
> > Mark Brown <broonie@kernel.org> wrote: =20
>=20
> > > The reason for having GPIO controlled enables on devices with register
> > > maps is that it's generally substantially faster to update a GPIO than
> > > to do I2C I/O. =20
>=20
> > well we are talking about 30ms turning on time here. =20
>=20
> > [  130.816647] tps65185 1-0068: turning on...
> > [  130.849970] tps65185 1-0068: turned on =20
>=20
> > So if we have 100khz i2c, so, we have around 0.1ms per byte, so
> > the read/modify/write sequence should be done in <1ms. So I guess that =
is
> > neglectible and allows the flexibility to not have that pin. =20
>=20
> Every little helps, and not every I2C controller is a model of
> efficiency and programmability.  Note that we do have core support for
> GPIO enables, it's not really any effort to support them.
>=20
If the GPIO is wired... There are a half a dozen different implementations
of this driver in the wild, and I remember one not using a GPIO
probably for a device without the enable gpio wired up to the SoC.
So I think the i2c way of enabling things is required at least
as a fallback option. So we need some if (enable_gpio) somewhere.

> > > > +{   =20
>=20
> > > Implementing runtime suspend in a regulator is *very* non-idiomatic a=
nd
> > > is leading to large amounts of open coding throughout the driver.
> > > What's the story here?  I'm very surprised that this wasn't in the
> > > changelog. =20
>=20
> > OK, lets look around in the datasheet. We are apparently dealing
> > with 130=C2=B5A here which can be saved. But that should be acceptable =
to be
> > only done on system suspend even if the regulator is off most times.
> > So no really strong technical reason here. I am just too used to testing
> > power management using runtime suspend. =20
>=20
> It does feel like something where if we're going to do it we should
> update the core to take runtime PM references rather than open coding it
> in a driver that's otherwise able to use the standard helpers.  I do
> worry about the impact on enable times (you'd have to power up the
> supply and sync the register cache) but I guess people could disable
> runtime PM for specific devices if it's an issue, and it'll never apply
> to primary PMICs anyway.
>=20
hmm, we have REGULATOR_MODE_FAST to maybe disable some pm. I have used
the autosuspend mechanism, so we do not do the time-consuming register cache
mechanism on every enable. But putting such into regulator core should be
more sane than having it in drivers.

Using standard helpers is in many places at least not so straight forward.
See the 6- in vposneg vsel.

vcom vsel has 9bits across two registers. So that is also odd.
vposneg has 2 bits used in a kind of RS flipflop mode for enable
if the enable pin is not available.

I would agree to remove the pm runtime stuff for now, so we can get the
basics in, and care about the optimazations later.

Regards,
Andreas
