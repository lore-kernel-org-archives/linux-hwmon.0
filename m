Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FF739BFF6;
	Thu, 26 Mar 2026 17:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774547138; cv=none; b=RUoaIuC8WjjlxW42MvcK2ygrFDbbQZ1q4hdZGfe3IFTWwwKeyxzPNJQT+8dyahkofp6P0Ma7A2PkzVa2b+7yJGYZ7pMpGnJpI9/XQWUhtRXDEKCcmN1QX7RonUgoY8+rLDEw+8L6F5eDBbeWae70AJGFC7E3Epm+zEAb/yAsMOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774547138; c=relaxed/simple;
	bh=kxNYsTSUOAGQeVxK433Pg8jeWXPC6fLTd5Mnx0qyrg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhOvuGSCCIgHbVq3yn2s4n6YBhAxu3haiylD3lJx0MW/E1khip5mHdJKFLnyzF6Bn0xNizd8rfy7llAungDYkmSqysg0sobCRQ/fUYnW3Q/rR4yXelHIX01xr5RmwCpvgkEr0CaHkd1jcl9BWoptL/Yfn64Fir5rjxUdlvULHIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mq+0ETiL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mq+0ETiL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6492C2BCB0;
	Thu, 26 Mar 2026 17:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774547137;
	bh=kxNYsTSUOAGQeVxK433Pg8jeWXPC6fLTd5Mnx0qyrg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mq+0ETiLFCw6bN/xd7ulu6ogS9wpllmtuOacfbkWiJPeJHrgOg1OpxO5ZWpRRuebB
	 bktiqIVCCKmFnvKgIxRZJ4S1Vep3KNO3r7WemVJmTKl8K/5Ftb2I52dz7ajOiq0g7B
	 lxy8mL446tPRnjpNqkBh0KxRlSe+MVz40tgQ+aJuk3oqpUvT1ZujmmSyMjPfnEQ8wM
	 WywqM1a08ca4BaxFSCx722NhLPw5dWi0A4NTA6+fnIwHfIJ8cnCywKUAxgye46Nloi
	 Gaf7CdUjq5WSaBkqNGb7F7D9mX1FkXQjyFuYzCNBzTyH74rFd5TduHELNRWTwmU22c
	 CBCN8zpIPj+Qw==
Date: Thu, 26 Mar 2026 17:45:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Zaixiang Xu <zaixiang.xu.dev@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Message-ID: <20260326-opposing-footsie-33a0deb2ba90@spud>
References: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1774429690-129139-3-git-send-email-zaixiang.xu.dev@gmail.com>
 <20260325-napping-turmoil-de37168fb072@spud>
 <09105b02-3d85-4808-ba0a-f3799787425a@roeck-us.net>
 <20260326-lullaby-elevator-3a3d25e9a6c0@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yqiArGzkRvrAykub"
Content-Disposition: inline
In-Reply-To: <20260326-lullaby-elevator-3a3d25e9a6c0@spud>


--yqiArGzkRvrAykub
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 05:42:30PM +0000, Conor Dooley wrote:
> On Wed, Mar 25, 2026 at 06:05:22PM -0700, Guenter Roeck wrote:
> > On 3/25/26 11:20, Conor Dooley wrote:
> > > On Wed, Mar 25, 2026 at 05:08:08PM +0800, Zaixiang Xu wrote:
> > > > Add YAML devicetree binding schema for Sensirion SHT30 series.
> > > > Use fallback compatibles for compatible chips and add optional
> > > > interrupts and vdd-supply properties.
> > > >=20
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes: https://lore.kernel.org/r/202603212044.BRPaiz86-lkp@intel.c=
om/
> > >=20
> > > The robot did not report that this binding was missing.
> > > It also told you not to add these tags.
> > >=20
> > > You also ignored my and Krzysztof's reviews.
> > >=20
> > > NAK.
> > >=20
> >=20
> > Maybe we should just point to AI feedback:
> >=20
> > https://sashiko.dev/#/patchset/1774429690-129139-1-git-send-email-zaixi=
ang.xu.dev%40gmail.com
> >=20
> > and only get involved after AI does not report any problems.
> >=20
>=20
> The presentation of info in that is weird, it creates a pseudo-commit
> message, and then goes on to talk about things that the pseudo-commit
> message has had culled.

How good is this LLM stuff at figuring out if previous review feedback
has been resolved? Or is it not capable of looking at earlier revisions?

--yqiArGzkRvrAykub
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacVwvQAKCRB4tDGHoIJi
0oMxAP99d/PniJzC7SasV+Tv/rGpg6lUfVbr8QApXedeYgOKRQEA8PS7SyEEJT0k
sHwiuqqUk2NdOAXbR2JJ8cmOGH1J2AA=
=Ngqb
-----END PGP SIGNATURE-----

--yqiArGzkRvrAykub--
