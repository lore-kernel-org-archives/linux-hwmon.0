Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9A128136F;
	Wed, 24 Dec 2025 11:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766576458; cv=none; b=VDz+9MtcgTWOKDWQNTvXHrq2TF/M8IR+mUUvWIXFnbFrR8QjxlB5umxrlu7lLWqJ1+dUMs3v+Mg+46QqfzfGqzp+go9WodFzPtXoZNhdwqy8LtvDm/GFUIVJGa9W6Ao49hY6SAeQ5AXea7q9QFEedRC5iPT28P36Yc0q3Ez4/7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766576458; c=relaxed/simple;
	bh=msUfCHnq6IT846TxdXXu4y0aVrtXvP2bQdJRJkhwX4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIyqm3B5cXYvCwmQ+JfKDxqO0maMhco8IauAa1Hll2exMOTfphfFDFfHVV2VZDtyNZN7F9Yf3E/GtfPpLU18FGknwOUGJMU/KfXw/4T2XdBS4WQXYo7kTsYROGob/oM+kcl2IfUD/9k19AVbh/N+ZQmG5KSdDi5Gxvp9+Cvn/tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKMllrXY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKMllrXY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0CFC4CEFB;
	Wed, 24 Dec 2025 11:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766576458;
	bh=msUfCHnq6IT846TxdXXu4y0aVrtXvP2bQdJRJkhwX4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKMllrXYduedmwwo18WL3KPUJ2zNHR22wRosaFCqtsinr4xfugbm11N1XdfezogeA
	 JOsCwindsVqXfCRCQQMmjc2CtzmM1+HruAUl+asT1vBnrOtHDgv5ZNqJDKcJQAQ2t1
	 IH2srZkEnK9/nyg1tlZZJi7cQiGlij/KO3FDRAgAg4hrFygedsyo1Vyi7MywOc+FdQ
	 MBL+fkHZzrufpHokObZEBfieUe7J+wbc5ap006QOUq2c8URhI94l91zeabx0mQA6ag
	 FeRhjf31xA0mATQXYUwslf7wOXeWeV6iwyJIgb3Tb1ySuz7Rdy4j08QTondFN0o4jd
	 qRzGnIu0Iss/Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 99C7B1AC56B3; Wed, 24 Dec 2025 20:40:53 +0900 (JST)
Date: Wed, 24 Dec 2025 11:40:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: Add TPS65185 driver
Message-ID: <aUvRRUOIJUlfXvmj@sirena.co.uk>
References: <20251222-tps65185-submit-v1-0-34986b504d5f@kemnade.info>
 <20251222-tps65185-submit-v1-2-34986b504d5f@kemnade.info>
 <84fdaf7c-4d4b-491f-975c-ebb14350fafd@sirena.org.uk>
 <20251222144522.33d7c734@kemnade.info>
 <2e850c1c-67ed-44af-94b1-2ccc35e50bb8@sirena.org.uk>
 <20251224010440.46ad717a@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iSQoylSRSVXylmEG"
Content-Disposition: inline
In-Reply-To: <20251224010440.46ad717a@kemnade.info>
X-Cookie: Think big.  Pollute the Mississippi.


--iSQoylSRSVXylmEG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 24, 2025 at 09:12:35AM +0100, Andreas Kemnade wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > Every little helps, and not every I2C controller is a model of
> > efficiency and programmability.  Note that we do have core support for
> > GPIO enables, it's not really any effort to support them.

> If the GPIO is wired... There are a half a dozen different implementations
> of this driver in the wild, and I remember one not using a GPIO
> probably for a device without the enable gpio wired up to the SoC.
> So I think the i2c way of enabling things is required at least
> as a fallback option. So we need some if (enable_gpio) somewhere.

This is utterly standard for devices with GPIO enables, the core will
handle this gracefully.

> > It does feel like something where if we're going to do it we should
> > update the core to take runtime PM references rather than open coding it
> > in a driver that's otherwise able to use the standard helpers.  I do
> > worry about the impact on enable times (you'd have to power up the
> > supply and sync the register cache) but I guess people could disable
> > runtime PM for specific devices if it's an issue, and it'll never apply
> > to primary PMICs anyway.

> hmm, we have REGULATOR_MODE_FAST to maybe disable some pm. I have used

That's a very different thing and completely inappropriate here.

--iSQoylSRSVXylmEG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlL0T0ACgkQJNaLcl1U
h9BGkwf7BmpdpNxRaw+dnS3jNtXtX7yBI8l6Ryhp1B4YFHvHu+DeARnEcpIFVRVF
sPsEwQBBdvW1IMssWCQsjfT5ZKmLyS8jKFKD4K9tMNv6eP6JyyTFdnixytSC/lnW
G1IOJUHKT+KasrRlQAc0+sFkhCx4TAehW6hWHkRiurEVdJONKQ1I5GityY/r/Utx
NLIe0yqtggw0qcL5Oq2NmNrbXc/FIV9gQuNTN4ymr6TM71yag7YVf/6ANFAbZQ9x
uywjt6tUEKOYYmFCir3H4T2VZGXFQNnX0mpEee5+6AgkzSGyGGt/OXAlsAo8qGL2
/C2y6pic1akB3e8xBijS59Us/2YdrA==
=OYig
-----END PGP SIGNATURE-----

--iSQoylSRSVXylmEG--
