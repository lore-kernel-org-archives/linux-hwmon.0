Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A9723EA99;
	Thu, 16 Oct 2025 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631612; cv=none; b=Fd4jMHC/ME/4Q6F3Z95wTU45MyebgMImnSitrhK9dnQjR7IFBBry4v/kE1+Pt1Gl/Ij5rRRdhvhEcL9pvAgh9XvGuTAGNkDl5PcYocV8D5AmGodw/vVo1ip9oLDm8M+JzJqQYwy6dIhHYuFsbXywinrI3If0sHOg9MkUOvoi0A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631612; c=relaxed/simple;
	bh=uRq8rDbyvnffct2L+mTXMKKgwWdS/YT9utbctOFf4KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzcgXU1gleLJmHKMMZqcEpdcR5MYZU2o4V1MT6g3Ai4JH+h3DMlXjVy8Tfqal3AKRBAQB/DDJr/Zv6rCIhuQP/XBOmoXeR6mo3BGx6mvRMUa5YTkcnu1IH28Zh9iV03icoZ2Fxz9e3d9eKsP762JnueP2AL+t3BuxhQuVxewtPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKXP14u0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKXP14u0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0646DC4CEF1;
	Thu, 16 Oct 2025 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760631611;
	bh=uRq8rDbyvnffct2L+mTXMKKgwWdS/YT9utbctOFf4KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kKXP14u0Nj43rkALcSvmUZmCGYsUWojel/9WwFIcgjkzEcQuK/8rkmmvhJ8qpTloo
	 YhMaU74v4m+rUTEW7AEigYXBsHm9az8qHd0mggcN1gr3EUIgjtOI3YpnWoGx+pEorV
	 Qq+ztuN/TygIICycf7yUKmaOKwJUW33p/Mk3k6IH+R9U8bkiJ3kI05ON8lp+EfnO0o
	 bX60Z/lPlJU7P5XYgk8piX8+nWx1X+ENvRKoRrVan+7ab7+f7M5FqS1yVRvcjdHXwz
	 g+uzjoM7d6GLYMdPi+W22bmfMK1aLHoxIGt21O4oOJwo1XjDcATDD2xVIrSRSaB170
	 gK+9kexGwbI/g==
Date: Thu, 16 Oct 2025 17:20:07 +0100
From: Conor Dooley <conor@kernel.org>
To: nuno.sa@analog.com
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/3] dt-bindings: trivial-devices: add ADT7410, ADT7420
 and ADT7422
Message-ID: <20251016-unbutton-phoenix-bdf5cddd8d4c@spud>
References: <20251015-dev-add-adt7422-v1-0-7cf72d3253ad@analog.com>
 <20251015-dev-add-adt7422-v1-1-7cf72d3253ad@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MI2PLkpVn6gCRQFY"
Content-Disposition: inline
In-Reply-To: <20251015-dev-add-adt7422-v1-1-7cf72d3253ad@analog.com>


--MI2PLkpVn6gCRQFY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--MI2PLkpVn6gCRQFY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEbNwAKCRB4tDGHoIJi
0o8rAP445VtPvGol+Xx7ICjHuFruyASpgI2ufCkHr3Y+YWtv9AEAsPioWnAtNa26
HVpdGHLAo2jFt3DroDaDQztIDkUt4AM=
=exnt
-----END PGP SIGNATURE-----

--MI2PLkpVn6gCRQFY--
