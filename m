Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C70038D6A2;
	Thu, 20 Aug 2026 18:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787249223; cv=none; b=AGL1xeiNYM6yVWVeHHfNv46dnSK/vEftRLKN3sUi/E4aV2SthhaZd5HRXZwN0SBlZmlw10iUPYAt1SmRAKdZPKNIZM50NHS9TmlGjN8py7hg9dgDG9ZVBoj4xbsp2o40yrHaYcvfpLObWCDr9aOmTF87s2z+/UTfSm5a6TGN0Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787249223; c=relaxed/simple;
	bh=yEt/MSt66XflYTO3c+NmhmzTagb9kQ7nI5a7D6Yx6/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oy5RQR2dLhkbalfx/GfXk0GxulkDUMq9ECbKuJD5x/lMs8Lyya4+EYXnsmoCHdMg41AMVAfSe5euch8Ie1F0Z6eRvAM07h73aPNrupucmTu0m7nlsgeSpBHBDdJO3SW0MzyjTuVDBkpGBwXvu4D57hsTOWSqHnHASgtJ3QmEEtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZbvA/5eB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZbvA/5eB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2643F1F000E9;
	Thu, 20 Aug 2026 18:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787249222;
	bh=yEt/MSt66XflYTO3c+NmhmzTagb9kQ7nI5a7D6Yx6/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZbvA/5eBJwjbJuYUHtJ7hcQ4axqj6nE1UH06+fY/4oGyb4qz9mad6WV9m1QOTnQYv
	 34isni2kwgMQeQIQySm4NRZem2vfZKHSnGIeZ3vTff8vWcCKfRMeeuuVDo1bmGdMK/
	 u4drNHqHKR4MkvI6/ff89K6cabrnjITZCudZr5yU/MvV6oA8P00+6QvBuv0Rgndz9S
	 Ovd6BwcXIqneAD75NzAwF9wPlGAdmyd92U61PCR3IZvKcGK8miDM7VATUBiInq+Yvx
	 23EDDq1QqO18r+wcqwl8wcVL2M0j16vDcj5JMPf3u7FfTmwTzxNdVlORNKYqEQJAlN
	 OJOeJMdVT3mcg==
Date: Thu, 20 Aug 2026 19:06:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Alessandro Zini <alessandro.zini@siemens.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add Sensirion STS4x
 series
Message-ID: <20260820-covenant-stench-e75f8bb4d7d0@spud>
References: <20260820145946.35468-1-alessandro.zini@siemens.com>
 <20260820145946.35468-2-alessandro.zini@siemens.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VC8ahYzfL7LASOuO"
Content-Disposition: inline
In-Reply-To: <20260820145946.35468-2-alessandro.zini@siemens.com>

--VC8ahYzfL7LASOuO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--VC8ahYzfL7LASOuO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaodCQgAKCRB4tDGHoIJi
0k1CAP9CBCAI3ygGinbmcgDs/wcbWm1HNZFPYsg7nOa/XrOWsgD+IzPWydwfOkMf
9GOhXpcqoAllNY3jfZ+zcG4NKJMKiQQ=
=7yx8
-----END PGP SIGNATURE-----

--VC8ahYzfL7LASOuO--
