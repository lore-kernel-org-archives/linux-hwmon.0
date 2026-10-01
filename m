Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B91628CF4A;
	Thu,  1 Oct 2026 19:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790882380; cv=none; b=R+b0iq8OAUDPvqnvaPAltq8Y9xp682ObpU2btNTMye73bwc5Nk5R3UtCBdSEMktr5jp5Hex7YfrhKtZXyHM3+boqaXRfjNSojbbacwr0BJFjjXrZLKXLrfAHB5ObCBNR8PEOpX/oznasA6kYxhJBBwM9RA1AYQQGTQrkL0H5u9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790882380; c=relaxed/simple;
	bh=NDVKO6z9ae8s39Np4wTUcUClLpjM3RJffgYHo+1t3KM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyoyFlUgnnT4mfj7U/rPYCNfE9Vht1epNly+Ka3gXkORQVZVQ9X3wPYN9uMYUdUCAnEJTyx4+B6GDBc3HbFB5SWHL5blw4zzgpNz6YaBMSXVypLCMgRKcJ74WACfjbfFIlEll6m6kMIKSX19dOFpwVmZJUkp5nSBk236c+9/0KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBidyppM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBidyppM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253F51F000FF;
	Thu,  1 Oct 2026 19:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790882379;
	bh=CT8yQ3Gq2o7+FTXBC0DvPFaCUnOHHEBD5RX9jtK/6Fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YBidyppM5Naw9H2O4p+I1wOaB6wx4ulIhhJLxAVqPFWPCFTQJe2CEOqyBRNJm0Hn9
	 WoG9Lo79dbQ4bWJ4XGLSSblFFfydY9b+YR9a5Fs9uEjPC2fFz8t1n9fnHV1jqw7FAF
	 +SgiI4bwBahPwIlRHu8Ux2TNIk84vtflwTtBiDXI9CavMgvw7IQ9hpMCJP7tWdM07O
	 3v969NtjhiOA+IPDjbui4ZvfVrvwQO2E7ZrezNL7SKvLbL28Wp6KbAMXYKfmKsIKxi
	 NxduCYn8b4uhNqe5AvevMVBuDpYICWeEruf6QpR8PdRXYXlwWYWGT3h7V0kA/xhlby
	 q8zTGjCHYXZiA==
Date: Thu, 1 Oct 2026 20:19:35 +0100
From: Conor Dooley <conor@kernel.org>
To: vjardin@free.fr
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Eduardo Valentin <eduval@amazon.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Message-ID: <20261001-hash-husband-663954aed7b0@spud>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-0-07d368dcc662@free.fr>
 <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-2-07d368dcc662@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="27EFFU1PLM87yezZ"
Content-Disposition: inline
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-2-07d368dcc662@free.fr>

--27EFFU1PLM87yezZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 09:28:23AM +0200, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
>=20
> Since commit
>   3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE=
")
> the PMBus core calls devm_thermal_of_zone_register() for every
> temperature input, so the devices of this binding can be referenced as
> thermal sensors.

Commit messages for bindings should reference hardware in their
justification, not what a particular OS has decided to do.

> By code review, it should work for the MPQ and MPM device bindings.
> They register a single page with PMBUS_HAVE_TEMP through
> pmbus_do_probe(), it means that one device has one
> temperature input, temp1.
>=20
> The PMBus core registers the first temperature input as sensor 0, so no
> cell is needed.

I don't understand this, if it has multiple sensors, each could be
referenced by something and it would need cells. It only has single
input, then that's the justification that needs to be provided here.
What software does, especially in generic code, should not be used to
justify a binding change.

I checked the devices supported by the mpq8785 driver and none of them
actually appear to have temperature inputs at all?

Confused,
Conor.

>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.ya=
ml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> index d7a32fb3b7af..6257a8030e53 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> @@ -34,6 +34,9 @@ properties:
>      maximum: 4095
>      default: 706
> =20
> +  "#thermal-sensor-cells":
> +    const: 0
> +
>  required:
>    - compatible
>    - reg
>=20
> --=20
> 2.43.0
>=20
>=20

--27EFFU1PLM87yezZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar6yRwAKCRB4tDGHoIJi
0tFWAP9NCfnJfQks8j8h71AR4gvQ3pJaOoPWq1XLe9VWquTr9gEAwFKxEjf5sjMx
yVJ3ergXkjeiFGuAnh9L4PKWLCzWyQc=
=nZTq
-----END PGP SIGNATURE-----

--27EFFU1PLM87yezZ--
