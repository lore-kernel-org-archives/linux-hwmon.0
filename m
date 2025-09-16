Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B49932D5D4;
	Tue, 16 Sep 2025 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758049803; cv=none; b=cLkKRvFTMnvpOTeMbc0A99bA4bVktBdSs8vXI4y9aW8DpaFsg9z1YOI31cWoG51O1TkKma02oqzzwMQ6JSj0bYJbPoUTyP5RdS28H3uBYxEjG0Gt6x+2wv+Wu+BZcDHUJISnqQ6wGvofnmvwXudTfq63bZcU1Kl7vzGhHHIZcmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758049803; c=relaxed/simple;
	bh=4FAi1nnQEXe8qe7/RS8zNbvXMo40vBuWy2ijWiT/nkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtIQkv/FVoPo9OegYf+zMRNDhPSwVFJhQhEf3rwV9Qg0lP44mJ39/h+6CHsEKSDReaA9k6y4LLjQfWvQUV1HnwLNLoX55k4hGL/Kr3Zs8hXuwtQ+P8/wuStRvpujyRFEmmROWHdnlrmlqo2s6iPZjPbC8URGI5hVvPlHs9lYcR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmi666f2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmi666f2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E457C4CEFA;
	Tue, 16 Sep 2025 19:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758049803;
	bh=4FAi1nnQEXe8qe7/RS8zNbvXMo40vBuWy2ijWiT/nkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hmi666f2EzPU6VJtELbB/UWWcEfltRfNqUjulDuAcdaTp19xo5HTXY3XN9nvHHxNP
	 iPyFeUx3B6TyDCgV1FfsshQ+APiC0dzljMM13um88GbNPJtTgIBNGZmT3HKl14R9W1
	 bT9Yp6PnYr80iLzostIv3nVLWl0SrBh+wAG0+6QhVm3ztcUXoi6HOkxAfr6nKrBLsi
	 GpNQQ1mZfUmU9wz4LZ9tClyJgAsJ1ZddV1fr22u4n0DpqIDAAu2IbAhLOoi/02CG3u
	 UaX3P3uZMKsuSwGFTauFw42NzG0SMDm9a4UFM58paKR28gLTEuLMHPMO/GK8grpUNu
	 moMIHFapgz79w==
Date: Tue, 16 Sep 2025 20:09:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, linux@roeck-us.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, cosmo.chou@quantatw.com
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: add mps,mp5998
Message-ID: <20250916-reputable-underpaid-378a32991a0f@spud>
References: <20250916095026.800164-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i6z8pyC4GU/gMqXf"
Content-Disposition: inline
In-Reply-To: <20250916095026.800164-1-chou.cosmo@gmail.com>


--i6z8pyC4GU/gMqXf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--i6z8pyC4GU/gMqXf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMm2BgAKCRB4tDGHoIJi
0qz2AQDpQJuVuwTZNp80QnUkD6Lfbzwi8tUNBsjNw44URPmFUwEAsNMJy7GjJhdX
D4PrdXnFdT7rac8L2HO3B3DxP95m6AE=
=J39R
-----END PGP SIGNATURE-----

--i6z8pyC4GU/gMqXf--
