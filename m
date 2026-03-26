Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF8834752C;
	Thu, 26 Mar 2026 17:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774546955; cv=none; b=FyKf7RgdaL9yIFU989UToFh2qdOEijudmTUMVf9wNwklSPCkLVn5MuTLs+MkvXivaIO5W08eCqgD4snSszwET0p4KALp8pGktmTb6AfkDu62z/2chqFzRom6A1YslquC1rlLGXlqj/FOLaUwTdAWmGb0x/vfRJWNQwnY4JSWplA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774546955; c=relaxed/simple;
	bh=50XB8wpgC04UGMfuOhzGdtrBvTURtgcJJSd5Quexi8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FW/YwBZUXI86RQZrRz9bw2EKK68/ksbfV9DZjrx/yZhGKvZpxgOmrapiHXIKww0XLXek8/Ftl0cAAHTyxpIaIurYP+wvNSSNUHLaYhWwZzjGt3HlkHP41Zh8SGwLIf9aQFDjeGHFNdbE7wr0FiDf1FVfwMLGronViatNOPPOyuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDkbfZxR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDkbfZxR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D745FC116C6;
	Thu, 26 Mar 2026 17:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774546954;
	bh=50XB8wpgC04UGMfuOhzGdtrBvTURtgcJJSd5Quexi8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDkbfZxRHTUdPuXiytLBrX+M7nKuTBJ+xaaunmAB6ixsK3n5LoJLawf5VGcqhbdwt
	 JVtF44JQ/MLxKxED036o6icjY0PLQgMwMTYoC1ef+4n/7dx/lJ0IxMzWYQs5+OM82K
	 ac/aGDZbIMtcVzzHEwYKCfGn6wEZyAewGWnMp4g+RtcbcqyLP8cjbogNXyc4ZBzKsS
	 htdNONedi73+Ut6UCPoG4vJh0KmfJxh+9VuDvKnXSUqtFfYkl2Kt4fL59LeCv0LoSG
	 /2AU/IstJOu1enga52/zw4XoqZSIsOxhiaKsZ7OCjBTlONeiOhvTaBg2A6tGiNf4Kl
	 dxEot4JG+lArw==
Date: Thu, 26 Mar 2026 17:42:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Zaixiang Xu <zaixiang.xu.dev@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Message-ID: <20260326-lullaby-elevator-3a3d25e9a6c0@spud>
References: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1774429690-129139-3-git-send-email-zaixiang.xu.dev@gmail.com>
 <20260325-napping-turmoil-de37168fb072@spud>
 <09105b02-3d85-4808-ba0a-f3799787425a@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="06ZbQavcbqjsNL9n"
Content-Disposition: inline
In-Reply-To: <09105b02-3d85-4808-ba0a-f3799787425a@roeck-us.net>


--06ZbQavcbqjsNL9n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 06:05:22PM -0700, Guenter Roeck wrote:
> On 3/25/26 11:20, Conor Dooley wrote:
> > On Wed, Mar 25, 2026 at 05:08:08PM +0800, Zaixiang Xu wrote:
> > > Add YAML devicetree binding schema for Sensirion SHT30 series.
> > > Use fallback compatibles for compatible chips and add optional
> > > interrupts and vdd-supply properties.
> > >=20
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/r/202603212044.BRPaiz86-lkp@intel.com/
> >=20
> > The robot did not report that this binding was missing.
> > It also told you not to add these tags.
> >=20
> > You also ignored my and Krzysztof's reviews.
> >=20
> > NAK.
> >=20
>=20
> Maybe we should just point to AI feedback:
>=20
> https://sashiko.dev/#/patchset/1774429690-129139-1-git-send-email-zaixian=
g.xu.dev%40gmail.com
>=20
> and only get involved after AI does not report any problems.
>=20

The presentation of info in that is weird, it creates a pseudo-commit
message, and then goes on to talk about things that the pseudo-commit
message has had culled.

--06ZbQavcbqjsNL9n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacVwBgAKCRB4tDGHoIJi
0oZ5AP4kccognJoL4bpEJ8veBJaFzlLAeOutZoO+o+4isL5CIgEA2u1iQkSnefHT
rvTQOFajHuPylwqSJA5uN3r3Lw3TUQQ=
=TWYf
-----END PGP SIGNATURE-----

--06ZbQavcbqjsNL9n--
