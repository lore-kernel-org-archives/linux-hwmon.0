Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D7352033;
	Thu, 28 May 2026 22:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780007686; cv=none; b=TAEAaYnrzmIKy5ViWM3GL55MVvssiZi/Wt9Hem2AiUAaLTIsGmThWzSGSDW4UIVmc0TaptK89mxM/iXQvPdgnYJ/oHtujYU6EDrLWD+V2CNK5G6qzogKd64ewPQJiq/1vCr874zQviM7dUouexq+3dht8wJWI71BKmjI0MCU07c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780007686; c=relaxed/simple;
	bh=T+A8B0Lkq8CucUJxIXZD63zdSoO1bk3N54bukijHHms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mECBLH/Yo+NN4lzSEG6JMB7l6VHFOMuTiOP/I2HDStTP/V7KUXHBubXsT0f1KVInWb9vi+i3q4K+XcELLgp0RMtI6CnBMHsVqWTK2VaP73GNvLcjbsTP0s4OlAQT1NY5CT+SaUDVidMmj/ujHvVF3kFKsUp319yLPv9YX+2jeBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wixk+w0z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wixk+w0z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990D61F000E9;
	Thu, 28 May 2026 22:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780007684;
	bh=T+A8B0Lkq8CucUJxIXZD63zdSoO1bk3N54bukijHHms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wixk+w0zrDvzUA9+b715i8Nur/PrQSMHRzRElj+lxfCwP2zEBGYfdtDffUNEG2gEz
	 mcrTTh9lXiLPw6iEFXOPBgNqjmx5pp0CRQLy7miWuMmgqZ2UkTLe6uA9vwEw0WUn6w
	 08eeTuPI45sC8JYHcgyqYR2qPqDt/z6eADE9v0kPx7ExN0U+GAMPR+FHtnWJzaLbAZ
	 0T8ZkEAlVLDRqCM58Vdd4S5du5fRVxI7JvMDo7OZUsVpL8KsYUvND+QDo/2fryq7lY
	 Zyil7d9oGYL2nrSETAwqRDmpeWQMzR1u74OKEwl5/ynx2hzRq+C8yepizpdIUXiPbD
	 aG/KrVbf6hL/Q==
Date: Thu, 28 May 2026 23:34:40 +0100
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
Subject: Re: [RFC] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
Message-ID: <20260528-defog-lasso-84891a72775a@spud>
References: <20260527-earring-bully-eb4a268c2e68@spud>
 <b49d4781-0827-4f26-9ca2-ccd177f90237@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/dY6UJR7eVAiYQsM"
Content-Disposition: inline
In-Reply-To: <b49d4781-0827-4f26-9ca2-ccd177f90237@roeck-us.net>


--/dY6UJR7eVAiYQsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 09:07:20PM -0700, Guenter Roeck wrote:
> On Wed, May 27, 2026 at 10:06:11AM +0100, Conor Dooley wrote:
> > From: Lars Randers <lranders@mail.dk>
> >=20
> > Add a driver for the temperature and voltage sensors on PolarFire SoC.
> > The temperature reports how hot the die is, and the voltages are the
> > SoC's 1.05, 1.8 and 2.5 volt rails respectively.
> >=20
> > The hardware supports alarms in theory, but there is an unconfirmed
> > erratum that prevents clearing them once triggered, so no support is
> > added.
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
> > ---
> > Guenter, there's one question here about the unit that update_interval
> > is in, I didn't see anyone else using us, but I assume that's okay since
> > the resolution that ms would give would be 8 steps only?
> > RFC cos the question is also in the driver as a comment.
> >=20
>=20
> That just came up in a different context. We'll add a new standard attrib=
ute
> update_interval_us. The existing attribute MUST use ms. Everything else
> would be an ABI violation.

Cool. Sounds like Ferdinand is working on that based on the other
thread.

Do you think I should support both update_interval and update_interval_us in
this driver?

If yes, should I do the ms version now and add the us version later once
Ferdinand's work is complete?

Cheers,
Conor.

--/dY6UJR7eVAiYQsM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahjDAAAKCRB4tDGHoIJi
0umqAQCFXSx/b46Px06mubHpDqQJZ3Dlo4pIUwEr8Pe8FDNJVQD/SkBJj7iAvvsa
IVlWnxRmcMZb0DAcbwlLRhhdwJdPOgc=
=0zap
-----END PGP SIGNATURE-----

--/dY6UJR7eVAiYQsM--
