Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30751D552;
	Tue, 19 Dec 2023 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIv5vl6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17667C433C7;
	Tue, 19 Dec 2023 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703003952;
	bh=wb/5N6aX2kjkjlR4kVdnXgTy0oMj0gu75axHsjnB4PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZIv5vl6IreD9nGU/VDUpb+sY4WBiwLYSC8jIVQHXFnYn3dozFnK6aae9ze6jzP+IB
	 f0yy4lMoX4yZyB/ygkzL9l9L7lKzxYhdxM83nCE9eSxgppSkna4ZijtGt4UvQ09Beo
	 m0pjHxErJYM5EHjYxbuXqqcCCajkpQg11JEcAKVCbUDhxGIsGq0sLKffjj9jIU2sHS
	 eUzZQsegL9aqQ1mXLlg7uIe8mcgnxLFFsUZzU02JgAOCdDmKwrVawp8NTPBsaMGReG
	 KjQG9T2OJfxr9s0v5oNWh0JQe+QkIoyM3X9zTOpxpqQAs3XFm7I4icrWsJwJaK4kQ1
	 e5qr+q2LanG9w==
Date: Tue, 19 Dec 2023 16:39:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Nuno Sa <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: Add LTC4282 bindings
Message-ID: <20231219-cusp-bottom-f96757a74ad4@spud>
References: <20231218-b4-ltc4282-support-v4-0-4fc51f7d04f0@analog.com>
 <20231218-b4-ltc4282-support-v4-1-4fc51f7d04f0@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yy/w6T2nb8yOn8tB"
Content-Disposition: inline
In-Reply-To: <20231218-b4-ltc4282-support-v4-1-4fc51f7d04f0@analog.com>


--Yy/w6T2nb8yOn8tB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 18, 2023 at 05:29:42PM +0100, Nuno Sa wrote:
> Add bindings for the LTC4282 High Current Hot Swap Controller with I2C
> Compatible Monitoring.

I'm not sure what to look for to confirm that the gpio2/gpio3 muxing was
fixed in this version, but the default stuff was fixed, so on that basis
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--Yy/w6T2nb8yOn8tB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYHHKwAKCRB4tDGHoIJi
0nVlAQDNeZWK5iII4yxy5MQ1drX9id82jc3ID1sbffV6YvgNJAD+P6cRIDrzsCyK
lkd0RHUeC/b6KHCce35s3CtwOi64BQI=
=hlD/
-----END PGP SIGNATURE-----

--Yy/w6T2nb8yOn8tB--
