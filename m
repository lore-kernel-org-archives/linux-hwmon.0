Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFB84C61F;
	Thu,  7 Dec 2023 20:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZcc6zBj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B985C433C8;
	Thu,  7 Dec 2023 20:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701981859;
	bh=d9aDVM2UeURdax+lpotfrVgU9kIaouVQcvPA3ammyFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FZcc6zBjxi6Hw9KA7xxdN1W62gPQWQyol1uN7QTMtxIa9WKnE8SU57t/mpAY9P/SX
	 5nNnw8aAPE/oVuer1jDxJCVlgzt2vA6TB3fwrHdGItYH8OkEyOBZH6hG4tY8bxNLtx
	 ECqcCpkgzxLdlpQxr5/zG2EG4fJL1Bh118j9IKBjVPcEfIZqGy1B+TgqzEIwj1LFpX
	 cy4pdGbKaqiT6wiuahVBs5lHs9HF5KzqCHJ5JF+B1YN0JYWzIy2fbAsWq4XbL1T0rc
	 RFmnzl1gJgB10ZwLq84RXu7RuC3M9q3od+CXqVReGoBzNmF4OWstUUC+dl/Jabh4em
	 LNxMGKpu7q8gQ==
Date: Thu, 7 Dec 2023 20:44:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 5/5] hwmon: Add support for Amphenol ChipCap 2
Message-ID: <6cce1b87-a9a9-4554-9dae-c24d1d276fb5@sirena.org.uk>
References: <20231020-topic-chipcap2-v3-0-5b3bb50a5f0b@gmail.com>
 <20231020-topic-chipcap2-v3-5-5b3bb50a5f0b@gmail.com>
 <04475f91-bdce-4677-894c-74c2bb8233d9@sirena.org.uk>
 <5b62afcb-254d-4dfc-8332-7979c62ea2c2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="84DjwU6xjfumnT6L"
Content-Disposition: inline
In-Reply-To: <5b62afcb-254d-4dfc-8332-7979c62ea2c2@gmail.com>
X-Cookie: Two is company, three is an orgy.


--84DjwU6xjfumnT6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 07, 2023 at 09:34:58PM +0100, Javier Carrasco wrote:
> On 07.12.23 21:05, Mark Brown wrote:

> > This is very buggy.  A consumer should only disable a regulator if it
> > itself enabled that regulator (or it *requires* an exclusive regulator
> > which isn't a good fit here), and there's no guarantee that disabling a
> > regulator will actually result in a power off.  Either the board might
> > not physically or through constraints permit the state to change or
> > another user may have enabled the regulator.  The driver needs to keep
> > track of if it enabled the regulator and only disable it as many times
> > as it enabled it.

> The idea is actually that if alarms are required, an exclusive regulator
> will be necessary to trigger power cycles and enter the command mode.

There is a specific API for exclusive regulators which the driver is not
using, and it's unconditionally doing the disable/enable cycle here.

> In summary there would be two options: either a regulator is defined and
> can be controlled to trigger the command mode or no regulator was
> defined for this device and therefore no command mode is available i.e.
> interrupts cannot be configured. That would be the case for example when
> the supply is always on.

The driver needs to be explicitly configured for this and have separate
code paths for normal operation and operation where the supply can be
bounced like this.  In neither code path should the supply be optional.
Right now we don't have a mechanism for discovering optionally exclusive
and enable/disablable supplies which is what the device needs, we could
potentially add that since this does seem like a viable use case and we
already have enough information in the DT to say if the supply matches
the constraints.  Probably the two properties queryable separately.  If
that API were added then the driver would do a normal regulator_get()
then check if it has the capabilities it needs and either keep the
supply on all the time (or possibly just during measurements?) or enable
the alarm functionality.

--84DjwU6xjfumnT6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVyLp0ACgkQJNaLcl1U
h9A0kwf6A9o+HV9MW3c5kq5qLVjTu0EmR00E8VExX9/QFePmhDWEVuPtI53Cky5I
vrpgnVTh4FtB23ga32jy7qHH/TpZ7knjqL1f7/iWmJED6Nl3GRQEXullQwAJoV1X
tdO3MjtjJ10YMB6CLdFE7LcNb5APUGAk46tpjigU4a8/Adkctw+G7DN9dJPDhH4U
w8pSe5reBCM7eLpW3YROF3M2j6Ucq60cYlCymE7ijJkhvU+tYvSHIXPLdK53JHxa
DRw75mqIKhSr/gMLpYq2QnyNkFzlr7YPoxTEVwp5IBbOXWbReoiOKvnx/zu4PwqF
ovHn/RKfkkdo03p4ohncAz0eThNaZw==
=5LYW
-----END PGP SIGNATURE-----

--84DjwU6xjfumnT6L--
