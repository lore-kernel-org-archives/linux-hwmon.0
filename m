Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC947869B
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Feb 2024 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708000413; cv=none; b=oFZ0OnK9UCiGYRLr9f7F4UZnpkCNWuWTOikEMWhIAqfc0aaymheXAxatC3pFmJrWpkhFtXDmES/Cf4QhJisVhpGRBWhfU7iyaZWFvsntuFIblilO0UiIGD89K/f92LkJBfsimpujMvAiFOahre6Hct4FNIAw4CdhbLMif19McqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708000413; c=relaxed/simple;
	bh=qaQ6+CEhds0Yq3NDOr6mhwnCFPmxvTUSG44mMq5NqVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJ2rayo0aFDS6U1Ki1OtrNfnggg8VDGZTNZx63OZIPOx30bWoVopGUf9xFtFK07YQ1NNxXOwAQS0Fm0b6yfTSvYjD/kLjXVQGzZXG/6Bb8PgTE2OA1phvohn+l43/w6xZzpSHhBC+7TKZlGPZ78wEgsGqUaLdTq5t5tAipecpp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfKvElP8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfKvElP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1E4C433C7;
	Thu, 15 Feb 2024 12:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708000412;
	bh=qaQ6+CEhds0Yq3NDOr6mhwnCFPmxvTUSG44mMq5NqVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IfKvElP8NPYpZJK8UV3uamFwD9AjG98CZ9H58Sb+N7CdaePzqBP7O0uzLq2hXo+tP
	 A4FyquUvhoRD15fPes0roB5uRQPChBJQpGkG7aG2zG5Nwz7MuRJu2vApW8rHGlqL69
	 /JHXHRB2hhyaDg4Fis2LAyapq/3iC1MW5QdmSEvO7N06p0/SY3fWRJ6i7H2YWWq2Cc
	 xXJF+Cu6KRJRL7lD2/2/Hd/z6YPfU6k6on1mfWsod+Y627QPn4FVtn2yIFXyjdryOE
	 eQPV1skaaFRyRaKxYMjId5l94Ak0cZ3HDql9FKqoaLGBbvHASQFAWrm63Ms9ly/Ug0
	 ozhO6wP0aY+8w==
Date: Thu, 15 Feb 2024 12:33:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Hardware Monitoring <linux-hwmon@vger.kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>
Subject: Re: [PATCH 2/3] hwmon: (pmbus/lm25066) Use PMBUS_REGULATOR_ONE to
 declare regulator
Message-ID: <20240215-doable-cackle-13c09fbd5e70@spud>
References: <20240214194342.3678254-1-linux@roeck-us.net>
 <20240214194342.3678254-3-linux@roeck-us.net>
 <8669f426-38a6-4ea8-ae4b-0d29c1d09a29@hatter.bewilderbeest.net>
 <a3b6f833-b8a1-44af-b90b-ed7370b12815@roeck-us.net>
 <ec7914ac-64a2-445c-b896-71a0087fb33e@hatter.bewilderbeest.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x8mGNgWAXkL45a4g"
Content-Disposition: inline
In-Reply-To: <ec7914ac-64a2-445c-b896-71a0087fb33e@hatter.bewilderbeest.net>


--x8mGNgWAXkL45a4g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 02:14:37AM -0800, Zev Weiss wrote:
> On Wed, Feb 14, 2024 at 05:22:35PM PST, Guenter Roeck wrote:
> > On 2/14/24 17:04, Zev Weiss wrote:
> > > On Wed, Feb 14, 2024 at 11:43:41AM PST, Guenter Roeck wrote:
> > > > If a chip only provides a single regulator, it should be named 'vou=
t'
> > > > and not 'vout0'. Declare regulator using PMBUS_REGULATOR_ONE() to m=
ake
> > > > that happen.
> > > >=20
> > >=20
> > > Hi Guenter,
> > >=20
> > > This will necessitate a DTS update on at least one platform to mainta=
in compatibility (Delta ahe50dc BMC, [1]).=A0 I'm not sure offhand if there=
 are process/policy rules about mixing code changes and device-tree changes=
 in the same commit, but changing either one without the other would break =
things.
> > >=20
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts?id=3D8d3dea210=
042f54b952b481838c1e7dfc4ec751d#n21
> > >=20
> > >=20
> >=20
> > Sigh. Agreed, especially since changing the dts file in the kernel
> > won't change the dtb files on actual hardware.
> >=20
> > I really have no good solution for this. We (Well, I) didn't realize th=
at
> > there are regulator naming conventions/restrictions when we introduced
> > regulator support into PMBus drivers. My bad. Let's see what others say.
> >=20
> > Guenter
> >=20
>=20
> Well, perhaps mitigating that slightly: I don't see any obvious cases of =
any
> other platforms' device-trees having any dependencies on the regulator
> naming that would be affected by this (judging by 'git grep vout0
> arch/*/boot/dts' anyway),

Which is a good thing, as none of these devices' bindings actually allow
regulator. Aspeed devicetrees are a mess of non-compliance with the
bindings, so I suppose that this is not surprising, but somewhere in the
wall of complaints there is a:
aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/bus@1e78a000/i2c-bus@40/pca9541@79/i=
2c-arb/efuse@12: failed to match any schema with compatible: ['lm25066']

I mentioned this on the other thread, but I guess the kernel is actually
using the i2c_device_ids to probe the driver and not the compatible,
since the documented compatible and the compatibles in the driver have a
vendor prefix?

> and at least with OpenBMC on the ahe50dc (the
> primary and AFAIK only user of that device-tree) the dtb would also be
> updated along with any kernel update.
>=20
> So I wouldn't expect it to cause anyone any actual problems if we went ah=
ead
> and changed it anyway; as long as the dts & driver do stay in sync with e=
ach
> other, maybe we could let it slide if it's otherwise a desirable change to
> make?

I think having "vout0" when there's nothing else looks a bit odd, but
I'm not gonna lose sleep over "vout0" being used if its used in device
documentation or is convention.

Whatever is done, please document the regulator child node in the
binding for this device and fix the dts to use a real compatible.

Cheers,
Conor.

--x8mGNgWAXkL45a4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc4EmAAKCRB4tDGHoIJi
0v6yAP9DWxriDwD/XAcLncezXrw39qdwkozz67Sta63E8ssN7AEA9U+SmJecpOyM
+6oxC1CUOubv3qSbTmMcOGubP/2Tjww=
=uX/N
-----END PGP SIGNATURE-----

--x8mGNgWAXkL45a4g--
