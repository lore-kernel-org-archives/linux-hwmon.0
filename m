Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30016C15A
	for <linux-hwmon@vger.kernel.org>; Sat, 17 Feb 2024 22:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708207231; cv=none; b=bt1CGgr0E2YsdUmCDJcORL+M3AMj/nOjEVjoebVe9qEqaxN1fIp4U/8CsM6P92gM8/EI9JG7d8YiSgfmaFpEHtDnHrvGiZOGIlGJ9Gx3seg4ksKA8xteYfyf7lQaALRApbuDumZ2yRyn6wE0peGwBX2awyWv8mPBKxCHGivDg9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708207231; c=relaxed/simple;
	bh=dsfM6+dBOY7b01KJVzPIYFUIx5nDHFvbGd2kD96qofI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6nBxONHkKPt3ICD9KO+0ghayp15o3/ZdKXTpkYEBCda5LxY6TWKcI+pQI0ztyRDQcsRI3Yi+XgdWTapDr0lmEs3/nX2n9mv4+wNN6vA/15y97vOL8z86VoKz/OC2l33LrAnIJJYzSYzRswEKyvA2Kd1RN2yeBEMxXLgbr98ios=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqiKVTlX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqiKVTlX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6215C433F1;
	Sat, 17 Feb 2024 22:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708207230;
	bh=dsfM6+dBOY7b01KJVzPIYFUIx5nDHFvbGd2kD96qofI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqiKVTlXX450olcI/ISTWsPouT3nDnGfJBjUH6nnO+k3RK3AqBZ3p1KO6emxPZQeD
	 wsvygEUPIRL0oUM0i4nBhha3hykeMbICbroTd5rkiJ0RXhU5f9Un0v/XaKE4oc3K4Y
	 52+EUbjUc32npHAdxHiPkP8gUM0br5IldolaSOUUo9ynq3eE2g3wJ6KaD7WOy7rbxf
	 c9Fv5Iv0hlk8fNpGHZxOPR/+f6lIg/SIp/b3uFJGI3Kh5nrJ4nYJRCCOvXmE9PjEOp
	 BR3yXzBIhknGwkAjLkxJZP3qdXE6+qFqt2Kl8DZ6qpMXutdj96ILdwvPjPriRsxntp
	 b9ieYyW/n3sBw==
Date: Sat, 17 Feb 2024 22:00:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>
Subject: Re: [PATCH 0/3] hwmon: (pmbus) Use PMBUS_REGULATOR_ONE to declare
 regulators with single output
Message-ID: <20240217-sliced-company-6c6fa2a40369@spud>
References: <20240214194342.3678254-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bcSRJwF0epciZUpb"
Content-Disposition: inline
In-Reply-To: <20240214194342.3678254-1-linux@roeck-us.net>


--bcSRJwF0epciZUpb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 11:43:39AM -0800, Guenter Roeck wrote:
> If a chip only provides a single regulator, it should be named 'vout'
> and not 'vout0'. Declare regulators for chips with a single ouput using
> PMBUS_REGULATOR_ONE() to make that happen.

If we're gonna do this, we should go ahead and document each of these
regulators. If Naresh sends a v2 for the tda, I could do the others.

>=20
> ----------------------------------------------------------------
> Guenter Roeck (3):
>       hwmon: (pmbus/tda38640) Use PMBUS_REGULATOR_ONE to declare regulator
>       hwmon: (pmbus/lm25066) Use PMBUS_REGULATOR_ONE to declare regulator
>       hwmon: (pmbus/ir38064) Use PMBUS_REGULATOR_ONE to declare regulator
>=20
>  drivers/hwmon/pmbus/ir38064.c  | 2 +-
>  drivers/hwmon/pmbus/lm25066.c  | 2 +-
>  drivers/hwmon/pmbus/tda38640.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

--bcSRJwF0epciZUpb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdEsewAKCRB4tDGHoIJi
0iNmAQDjA4XUOAgFFF6RZYx24DwzBs+ZQiZdSZk1YCVs38KYDQD+I3853pVYqau7
Lu2SXtRPHOukbQKvzT4iXt3UCmrcJgM=
=aPqB
-----END PGP SIGNATURE-----

--bcSRJwF0epciZUpb--
