Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8915812D21B;
	Fri, 27 Mar 2026 00:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774569828; cv=none; b=JO4q9kHW1T62YB2J9/sX/rz1fcmIq53XyemBy4pFOKP0vfvMuoI2kQmznb4Wwdf7savv7tPcZOCsG3RqQE/LgCpe3s9vfooktVIKZxz9zsF4RWw6FNVvtOTcMx9oWruGiN75nWAK6FjWV1FSt/25Woa3Sqg6rWgTrdG9zRK7yPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774569828; c=relaxed/simple;
	bh=kY4LJHK66UoT+YP3TWjaxw1cvyqFuLr0jljvTP3V7tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtUqNNIN9ozxwiJLS/Mr7RwGSkwOVAcZn2JaEgeyZLg8Qmgv9X2ofJ86K+VFRwuczFOwu6DybEo5XFMa6tolp6Jeu9rTuvSDnEE8DBQVO9KsGNxVdpfY7DKNXOdxPXlaYTUylFk4tuDqwgihPVF7xUUMLyDFjNKxtrcuzR7meJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBANd970; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBANd970"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE01C116C6;
	Fri, 27 Mar 2026 00:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774569827;
	bh=kY4LJHK66UoT+YP3TWjaxw1cvyqFuLr0jljvTP3V7tU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBANd970I9p6rmcM9IIKqPcPs90DHv/ifgVatC3MHU/eN0+i4PG+MGBcZC9lsLuG9
	 /totE4rP7jkFgHKY57gxGNo2xt/djsNRBt9MG3Uqi+Aci56dtkEc2iQRyMMQPwMRQY
	 xKOAU0Q78oiifiXffcxoyl5RQCLWPShui+ADqdvGnSQ7ci87/k+OscwaoJi/Lhj3VA
	 R+HyAMCFNep9tAlSRC892ALiTB7YT0tSo1KKNzIqBRaqLfXoKqaU64HFpwZs4pjjBZ
	 vsPk1hCZf3Ho7hcgEqu65wW8WvyM3DYQ4ka7iflzDTLhbIPJInFAs7W4/xxEFf5i4n
	 RhNlpmQRo94tQ==
Date: Fri, 27 Mar 2026 00:03:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Zaixiang Xu <zaixiang.xu.dev@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Roman Gushchin <kfree@google.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Message-ID: <20260327-clubbing-crushed-e73c4c994737@spud>
References: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1774429690-129139-3-git-send-email-zaixiang.xu.dev@gmail.com>
 <20260325-napping-turmoil-de37168fb072@spud>
 <09105b02-3d85-4808-ba0a-f3799787425a@roeck-us.net>
 <20260326-lullaby-elevator-3a3d25e9a6c0@spud>
 <20260326-opposing-footsie-33a0deb2ba90@spud>
 <ba8848a3-03f0-4113-8db4-d6dd46a57959@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z6hkhhkGkT69qmD0"
Content-Disposition: inline
In-Reply-To: <ba8848a3-03f0-4113-8db4-d6dd46a57959@roeck-us.net>


--z6hkhhkGkT69qmD0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 04:55:39PM -0700, Guenter Roeck wrote:
> On 3/26/26 10:45, Conor Dooley wrote:
> > On Thu, Mar 26, 2026 at 05:42:30PM +0000, Conor Dooley wrote:
> > > On Wed, Mar 25, 2026 at 06:05:22PM -0700, Guenter Roeck wrote:
> > > > On 3/25/26 11:20, Conor Dooley wrote:
> > > > > On Wed, Mar 25, 2026 at 05:08:08PM +0800, Zaixiang Xu wrote:
> > > > > > Add YAML devicetree binding schema for Sensirion SHT30 series.
> > > > > > Use fallback compatibles for compatible chips and add optional
> > > > > > interrupts and vdd-supply properties.
> > > > > >=20
> > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > Closes: https://lore.kernel.org/r/202603212044.BRPaiz86-lkp@int=
el.com/
> > > > >=20
> > > > > The robot did not report that this binding was missing.
> > > > > It also told you not to add these tags.
> > > > >=20
> > > > > You also ignored my and Krzysztof's reviews.
> > > > >=20
> > > > > NAK.
> > > > >=20
> > > >=20
> > > > Maybe we should just point to AI feedback:
> > > >=20
> > > > https://sashiko.dev/#/patchset/1774429690-129139-1-git-send-email-z=
aixiang.xu.dev%40gmail.com
> > > >=20
> > > > and only get involved after AI does not report any problems.
> > > >=20
> > >=20
> > > The presentation of info in that is weird, it creates a pseudo-commit
> > > message, and then goes on to talk about things that the pseudo-commit
> > > message has had culled.
> >=20
> > How good is this LLM stuff at figuring out if previous review feedback
> > has been resolved? Or is it not capable of looking at earlier revisions?
>=20
>=20
> Both are interesting questions. For the first one, I had noticed that, but
> to me it seemed that the pseudo-commit message is an attempt to create a =
concise
> version of the commit message, and I have not seen evidence that the later
> comments did not also apply to the real commit message.

Yeah, the comments did apply to the real commit message. I was just
confusing to me to see what looked to me like a commit message not
contain the info that was being referred to later on. I thought that the
LLM was hallucinating the comments until I went back to this mail and
realised the text was here.

>=20
> Anyway, copying Roman for feedback on both.
>=20
> Thanks,
> Guenter
>=20

--z6hkhhkGkT69qmD0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacXJXwAKCRB4tDGHoIJi
0tCBAPYuyBj4Y5qUmG4iUNaDxDutif8mBRaGIbkHwOtZLkA3AQCZ58/iAbtJn9Oy
7PdULvFpVku4cVfgi9oHhmzAJI/6Dg==
=VJPT
-----END PGP SIGNATURE-----

--z6hkhhkGkT69qmD0--
