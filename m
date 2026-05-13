Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497473AB278;
	Wed, 13 May 2026 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699850; cv=none; b=NVRmCJ4UZzMkMXzB49fdspWYtXhw9xodwwZKpM8VOIPSQcL8SIyhJf2pAUA4mNqzGYtz01cb4x3q4pT62Y7EXzHY/qlipy79neX+DHC8MRL0lQg2Al+gLZxeYUcW1NKbfimeIo6AaJeLj6ZGNocAL7hdojx8uc3ExHhWW8im5PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699850; c=relaxed/simple;
	bh=LLOWn81il7jL3Otjn4FmX247wJIwZhAWwQDgAWdaU9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGD7CVgKimkxpFdmWjIp+dhTEx3pPbGKSJETefvJEQtLfO9iPv1zT17F+5aFr3RSLX8OgMtPLQUuUlKGfK7I2oeSmNGFfhDsVidfHENPtyLtaYxh8ZxkvgUaI/TqoFSmsYPrx+HGZTAts05j959Hepp2OpPaFZB3jB5Tgj7XZ4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUg74beA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUg74beA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0CDC19425;
	Wed, 13 May 2026 19:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699850;
	bh=LLOWn81il7jL3Otjn4FmX247wJIwZhAWwQDgAWdaU9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WUg74beAtQrUpYYc/ISDEF2N45P+HsiU0o90hY5FZtNidjMh1aRqQdQQpk1IFU4bk
	 RcMpuzGU4/WC6wQDi8tgJaHghHVjNpDCdPLXNW+jCUOb4XOfO7wQP99+00pteoZ/E0
	 LnhyEIKRmymGG6cZ7w1zf7qh+5TyTlF6PxevwQhs0gbSlMbxkXkua184IBxB6ma60c
	 PDVqDmiQhMCHYrNbk161gP4IvMA3QTo0cWC0wlvm4wZyJvb4aEUu7N0CP6nU6yZNZm
	 I+MWvqW+FOOKxIuvJGgBlSXgION0JsfQR/IAf9WFHj3Pg5Jah4DJwbw2iE9+vc1xdX
	 7rYgJT9IXJxvQ==
Date: Wed, 13 May 2026 20:17:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: Add Murata D1U74T
 PSU
Message-ID: <20260513-annuity-crumpet-b6c65356a743@spud>
References: <20260512-d1u74t-v2-0-431d00fbb1c4@nexthop.ai>
 <20260512-d1u74t-v2-1-431d00fbb1c4@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T4xgA1tyh/TU+v9u"
Content-Disposition: inline
In-Reply-To: <20260512-d1u74t-v2-1-431d00fbb1c4@nexthop.ai>


--T4xgA1tyh/TU+v9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--T4xgA1tyh/TU+v9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagTORQAKCRB4tDGHoIJi
0pfrAP94Xkil++XEfXDAsG+AK2PEJafpjlAsXPgD3A+sa4yH3gEA9RNfbSP/quqG
6fniM277oii8FLFYMIfTQHKX9MtRywg=
=cDwX
-----END PGP SIGNATURE-----

--T4xgA1tyh/TU+v9u--
