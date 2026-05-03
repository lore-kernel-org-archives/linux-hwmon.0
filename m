Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898383563E8;
	Sun,  3 May 2026 18:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777831245; cv=none; b=ZJYvr7fSGv2DGYI71BHa0opsleQGccOMykOWV4HO+dvFUlML2mU+S1nU6ZjjACKdJCed+SX7oAkcoXBJwGqV7NhP65uVhB6E81PrqfWjsH9SuBDxT5RCUl5qpF5aQRJqA+3wwfJc+mPOlclMpoSO41ssPwKcAVwa1HsDsWjqSvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777831245; c=relaxed/simple;
	bh=WjAIhPyTjiLTsB4q4wgo4p0AAXSy+MfFCF8l2eXUmWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViACFFISdioQT40S8dkuYo2icEFJ2VmhtU+jMCpisNFThYLzDGm1APThN2SckQIBecQ41r4j50s+8iGKA7KsxSwPgnH36Is0eFPfEfZBXZzN+Wh1J7Od11/XS864cMJvUA//UyPw6ws8lMlA2PbMDJs8inJMUyxRyj6e9AhyHvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xqv3UFq1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xqv3UFq1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AE4C2BCB4;
	Sun,  3 May 2026 18:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777831245;
	bh=WjAIhPyTjiLTsB4q4wgo4p0AAXSy+MfFCF8l2eXUmWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xqv3UFq1kkUcIaEo+kVkfngOldHXqqzwn6Q5hRoB76qF15VT6M7IRyWFO7TAjRxbD
	 M2FpPe4wEPNGkMEx1Wicj6SxO20+kq+L4zZZaMDvlQQ7JXrZ3u4z8Jo0tiw8gfWfZb
	 0ape42B6Ah+2ctm4fow0UO/hQh0zZoVYVFQPR4ZFrgEJz3lSEJfI3hplFYGGV0Hv6q
	 1A1mm01109rls1L9lChVEtLEsm/p/8jHgeRCsze0V5pAaXZrrwmuqtxcNZPVAK3f/y
	 fOa86W9RKPzUnxokm4Z35OOF6obhs58vcM48NMrMwFyFuyUDj9WVDE/hFTkDguaBMG
	 YmfOAzBar0cQg==
Date: Sun, 3 May 2026 19:00:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
Message-ID: <20260503-ebook-glowing-e458635e5cc4@spud>
References: <20260501120518.3085501-1-markus.stockhausen@gmx.de>
 <20260501120518.3085501-3-markus.stockhausen@gmx.de>
 <20260501-earache-balance-3ac33716ac5a@spud>
 <92fd08f3-f6c9-4a1e-a01e-c5d12b23503f@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gf/pZwxOChRSACJ7"
Content-Disposition: inline
In-Reply-To: <92fd08f3-f6c9-4a1e-a01e-c5d12b23503f@roeck-us.net>


--Gf/pZwxOChRSACJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2026 at 12:32:47PM -0700, Guenter Roeck wrote:
> On 5/1/26 10:05, Conor Dooley wrote:
> > On Fri, May 01, 2026 at 02:05:18PM +0200, Markus Stockhausen wrote:
> > > All chips supported by this driver support configurable active-high
> > > alert polarity. This is already documented in the devicetree descript=
ion.
> > > Add support for it to the driver.
> > >=20
> > > The default polarity of the devices is 0 (active-low). So there is
> > > no need to change the clear mask. For consistency reasons adapt the
> > > hard-coded configuration value of the AS6200. It is the only device
> > > that defaults to active-high polarity.
> >=20
> > Uh, I dunno if you can do this, changing defaults is an ABI break
> > typically. What makes it okay to do that in this case?
> >=20
>=20
> Turns out the driver doesn't actually set the polarity bit due to a driver
> bug, and no one noticed. Also, _if_ active high polarity is set, the _ala=
rm
> attribute shows the wrong value due to a second bug in the driver.
> Given all that, there is no real ABI breakage.

Cool :)

--Gf/pZwxOChRSACJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafeNSQAKCRB4tDGHoIJi
0qAwAPwLAl53zwgUSEHu0sJGy5YkezkRuQ36ASRPuFg8lErbiAD6A3qPkxOtPt1m
OJIiQRf+EWc7++jr1xcWZQ6s8zflXAs=
=cfnN
-----END PGP SIGNATURE-----

--Gf/pZwxOChRSACJ7--
