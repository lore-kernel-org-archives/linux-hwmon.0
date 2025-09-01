Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D256923C4F9;
	Mon,  1 Sep 2025 19:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756753429; cv=none; b=hedzHEsc5M9yi7/R6vcEMJpNltId265MUP7gzfSvTFYo333kR6nanuxSfAB+4jokSh4oo2oZPYAkQAU9IXxyoMP/y/I/uIP59mWJYJtszNgnFNCNIt7AsOqCE9MmeyluO8sMvCBZLrjP2tdLqDmbwFsFScrE+kuFry4WzD6KhjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756753429; c=relaxed/simple;
	bh=acK2bKelP2EAsnoumGxYTX5tZOvTXlUpVRLleCcP12s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HP3dF+3RfP844OKM+8lTzJf7Zj6GzOXqRuYfiJWr7Gbq/GwT64es7Qeq3GZwwE2gqVsR2NrDswfJzsu5IAlaEWBKkb1IJfAh6snwhYyaCOoSWqcO7pXNJpO5DjTLARYA61wWqk1lQngIiXuhQlvir+BAmlqnoUxdRas6cGnQEyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b57jPVJi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b57jPVJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3894C4CEF0;
	Mon,  1 Sep 2025 19:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756753429;
	bh=acK2bKelP2EAsnoumGxYTX5tZOvTXlUpVRLleCcP12s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b57jPVJi3K90nKNHnXPfH+JzLaMOkLzyJEdSq8EVQxe6XtdPbACgyBGS5zKaBYit4
	 d63USwUzU41qQOAj0G1NmNtOoXIiXbUzBui4mL3X9VjGyBuM6TX3rrgkl3VSnIaX/E
	 j227qSfK6RY3teyXz9biK7i/nKtbUdzl/Q1Xw5rP4Yd0HjFFw/PPywer2T8ZYxqoBP
	 uW+X544to0GJuIMI7Gj47F/Kp611b/DhqL1ciA3vyzLng7jH+5q/gLlUHpnjyeaJuf
	 GTRJT4OuqD/1iQ2pMc64dbwvkm28MLh/wBx9Jst3DrcCqrflygSb7qrcko88ROxeL9
	 16SEa2x/d7brQ==
Date: Mon, 1 Sep 2025 20:03:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] dt-bindings: hwmon: ti,ina2xx: Update details for
 various chips
Message-ID: <20250901-impotent-riding-88e4eb4a5bb7@spud>
References: <20250901155902.2667063-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PnzSAvF8dw5/fCet"
Content-Disposition: inline
In-Reply-To: <20250901155902.2667063-1-linux@roeck-us.net>


--PnzSAvF8dw5/fCet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 01, 2025 at 08:59:02AM -0700, Guenter Roeck wrote:
> ti,maximum-expected-current-microamp, ti,shunt-gain, and shunt-resistor
> properties are not supported on all chips described in this bindings file.
> Update the bindings accordingly.
>=20
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--PnzSAvF8dw5/fCet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLXuEQAKCRB4tDGHoIJi
0tepAQCwCYEImmrhqOebhMc3qRfrUZ7yyUgHAZAF79NbCa73HAD9G48MenaKAz99
uruiYWdjpcVlHhd4ThxpjRkRuFZOIA8=
=53Se
-----END PGP SIGNATURE-----

--PnzSAvF8dw5/fCet--
