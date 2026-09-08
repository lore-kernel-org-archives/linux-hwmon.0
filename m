Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C392596505;
	Tue,  8 Sep 2026 18:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890531; cv=none; b=I2hps/L8Of62G8e4RdWrHZ/d5GKagDeq1QuweV/YqsiUnhMEG2nAPdE7rCZTBvRz39ceJYMbK2Q0sfd1zWru4IvKDS0OkwqetyznKZ21j+VYBhDUwVy99DRLF6XYv8q3n8SnLcZjK57XWwDsLDdNIN8Tkhk9aJFOeHlNsHLV81M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890531; c=relaxed/simple;
	bh=n3V2a4c6aHGm1K1u+YJE1Ibm8+iKORtrh4Rp+upx/Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtVwZvNT4mOomcq9jKZD8QLU4ByPG+6J0iUC0T5OHVGlUJr6V6jbCtgnQLZoxaDXvrBexJ6pC94F4l41CyOg5Q/UA1fuMl6uW8mPbhQKgd1WRyIPX3rOtbrnCWFE3pnUTfmswxYuFtNb9BRd09UaH8TSR47qdmeQ9zAEIU823Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijGlZgsU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijGlZgsU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC351F00A3A;
	Tue,  8 Sep 2026 18:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890530;
	bh=fnf44b1jijqB+HDIBPwbGQPtA9lAXufRWz5wUuQaZSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ijGlZgsU2yTb9NyG/QXKLC1OxtHXgcftO+TLwbSpqVB1i/LaJHK7y2Z3ociQBBpn7
	 J0E714ZLZWyLhqCo5uZM7LWNAuT5cH168wHrL2h4ALlgI7OQdtTiej7MGSfuPAYAJw
	 3UWTpbFhI0O9uFkwGRRFEYrCDGqprluXuAo26DQlmKgtCAn8ngaOob83sRbBCW1Yln
	 33+3GlTT0kTd9oCzZBccDUq59gKBED9Okayoj4bN/lH9yXjQYekZshTVTPnk+O+QKB
	 qDC99trMPLvEULwITneKTN2DyDYWbXxDr96zAgIaEwPHKlxFMwjJGwiv6ekG2yo3Ta
	 w1pQ53B8dKVWw==
Date: Tue, 8 Sep 2026 19:02:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Colin Huang <colin.huang2@amd.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Colin Huang <u8813345@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
Message-ID: <20260908-prozac-bunch-5dc2a7fb4d9b@spud>
References: <20260908-add-raa229639-and-raa229640-v2-0-83c75b61139d@gmail.com>
 <20260908-add-raa229639-and-raa229640-v2-1-83c75b61139d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WmcQSSsc7lRDv8Rj"
Content-Disposition: inline
In-Reply-To: <20260908-add-raa229639-and-raa229640-v2-1-83c75b61139d@gmail.com>

--WmcQSSsc7lRDv8Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 03:04:26PM +0800, Colin Huang wrote:
> From: Colin Huang <u8813345@gmail.com>
>=20
> Add Device Tree compatible strings for Renesas RAA229639 and
> RAA229640 PMBus devices.
>=20
> A fallback compatible is not introduced because the available
> documentation does not establish DT-level compatibility with
> any existing supported device.

Please don't respin before people have a chance to actually respond to
the thread. Please see my commentary on V(this - 1) on the compatiblity
of the devices being added.
pw-bot: changes-requested

Thanks,
Conor.

>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.=
yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> index 8216cdf758d8..3537c7ddfb09 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> @@ -60,6 +60,8 @@ properties:
>            - renesas,raa229001
>            - renesas,raa229004
>            - renesas,raa229621
> +          - renesas,raa229639
> +          - renesas,raa229640
> =20
>        - items:
>            - enum:
>=20
> --=20
> 2.34.1
>=20

--WmcQSSsc7lRDv8Rj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBNnQAKCRB4tDGHoIJi
0qCqAP93CNX9DUdipEyXLoFlvbRCevHnT+5WqQND5mfXnKGAAAD/fvbukVzEP/Vg
aNPFloqtMrOIPefD7tnRcRsqM2irwwk=
=190V
-----END PGP SIGNATURE-----

--WmcQSSsc7lRDv8Rj--
