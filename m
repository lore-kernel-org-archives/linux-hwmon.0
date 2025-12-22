Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C7B26CE05;
	Mon, 22 Dec 2025 15:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416053; cv=none; b=CVM2ZaGVmFSsD77s/KJJLSKbUNeqSSC6ivtwuhSd4Al4WRL0uRVbb+tMey48SpP7ClWRIOJOonJCkXVlomPsA5FW/Ze/RmxIMUupl6Vg9qnwkOgNT0qg6c3niWAsjXlqjsLw3tVn5MIUNPHPa9a4XGJ/lhPRUcEGgNLpF0nB/CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416053; c=relaxed/simple;
	bh=n24GBhvAvBMltS9mF9GmhmK1Fc4IRbcCrliteW2XgqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9MlWF63z7UNXUiQywZ6NxvXw3sAAypzwVoLo9dpoRdVnyyh75OaKFoNFpZ1iotpy/TGFENAxfHMWE2eax6NOdz9tnaTDIgYFxT6dPoyI9XonEIJdHqSU1LrWWUzGePMU9cdy37bUgejpLpPOXi/aTwLGtlcetcWjXOtTVXrCyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOfac077; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOfac077"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA691C4CEF1;
	Mon, 22 Dec 2025 15:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766416052;
	bh=n24GBhvAvBMltS9mF9GmhmK1Fc4IRbcCrliteW2XgqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOfac0770JyqmHO67mYIW0IiJSfQkq178k9kfZFdLXZQCSNKPtFL9n1/mPqLxIi1Y
	 cYjlK9TsByM9c9Bfm5LCA7abDOh6jCmFJezTqA+GPAGR0QGmUDq6lL1ZZfgwTISAi+
	 6OiAuOyRjP/TttFgikWE8gDuQ6CZ4g81xZRPg2scdZ53WXQuxUZ2rxwYixOtsq+O+G
	 y69vYkzhWVz3xT07H0yNkIT10uryA7quszckSLPvlKJLHGuqBOAMl/zqjIJXtAK7r5
	 jTSXd97+kU1fG7PidvaqjwYJ4VT7MTtGDuhx512o8BHe/42TPAfGUKCQjm+mohENVf
	 EOEkbx+p6xO/A==
Date: Mon, 22 Dec 2025 15:07:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: Add TPS65185 driver
Message-ID: <2e850c1c-67ed-44af-94b1-2ccc35e50bb8@sirena.org.uk>
References: <20251222-tps65185-submit-v1-0-34986b504d5f@kemnade.info>
 <20251222-tps65185-submit-v1-2-34986b504d5f@kemnade.info>
 <84fdaf7c-4d4b-491f-975c-ebb14350fafd@sirena.org.uk>
 <20251222144522.33d7c734@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kPlSyEmGk/3dQI4m"
Content-Disposition: inline
In-Reply-To: <20251222144522.33d7c734@kemnade.info>
X-Cookie: Be different: conform.


--kPlSyEmGk/3dQI4m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 02:45:22PM +0100, Andreas Kemnade wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > The reason for having GPIO controlled enables on devices with register
> > maps is that it's generally substantially faster to update a GPIO than
> > to do I2C I/O.

> well we are talking about 30ms turning on time here.

> [  130.816647] tps65185 1-0068: turning on...
> [  130.849970] tps65185 1-0068: turned on

> So if we have 100khz i2c, so, we have around 0.1ms per byte, so
> the read/modify/write sequence should be done in <1ms. So I guess that is
> neglectible and allows the flexibility to not have that pin.

Every little helps, and not every I2C controller is a model of
efficiency and programmability.  Note that we do have core support for
GPIO enables, it's not really any effort to support them.

> > > +{ =20

> > Implementing runtime suspend in a regulator is *very* non-idiomatic and
> > is leading to large amounts of open coding throughout the driver.
> > What's the story here?  I'm very surprised that this wasn't in the
> > changelog.

> OK, lets look around in the datasheet. We are apparently dealing
> with 130=B5A here which can be saved. But that should be acceptable to be
> only done on system suspend even if the regulator is off most times.
> So no really strong technical reason here. I am just too used to testing
> power management using runtime suspend.

It does feel like something where if we're going to do it we should
update the core to take runtime PM references rather than open coding it
in a driver that's otherwise able to use the standard helpers.  I do
worry about the impact on enable times (you'd have to power up the
supply and sync the register cache) but I guess people could disable
runtime PM for specific devices if it's an issue, and it'll never apply
to primary PMICs anyway.

> > > +static irqreturn_t tps65185_irq_thread(int irq, void *dev_id)
> > > +{

> > This unconditionally reports an interrupt even if none was detected.

> Hmm, this seems like some common pattern, if some irq occurs,
> check some registers and if something is set, do something about it,
> and then unconditionally return IRQ_HANDLED.

It is a common bug but it's a bug nontheless, it means that genirq can't
detect and mitigate stuck interrupts and that the interrupt can't be
shared.

--kPlSyEmGk/3dQI4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlJXq8ACgkQJNaLcl1U
h9DI8wf9GLCZd220kTXGUaVL3vUwotSL6Wq8pcMK/Z4kK8JiOp4qt9f3MSdOBln0
+IXWGhMkJS2MlWvcnbpcuN2Jp8rClZamZ7WiUlOzn6br5Z8NVMAqzPznWeG0IQh1
/4QlOL1mRvtAlmT57eFIxkWhcziaHz1gxYwWZxOY7xhUhU/y9D43hencthnPLIMQ
qw4rn7syvFjjOMuhpQXYG29XxmeLq4DPQPJ1PvjMDhGPvqs0v6aKjkvBBj0zbXjw
w2EwQVI0ehyiVA2XfaTQS4bmd/6iDoWOOkbFQjfeM88yTLQrvrxQlI9SqgQ8I2/6
f2Jpdb+7suGZRjx04rLK38PZmolcfQ==
=OJM+
-----END PGP SIGNATURE-----

--kPlSyEmGk/3dQI4m--
