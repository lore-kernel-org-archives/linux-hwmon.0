Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A64D38C2C3;
	Tue, 23 Jun 2026 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782236171; cv=none; b=fFHppYQtf+BuePB2kwjIlQGiD0r3acv62WeeXWXe9OaJWwa0yxqtA1vpmuUxsrYbJijqfK4px7HNge4Z4ouWy9C/EhteaqQPZRogIoCQfN8v2meNRbwLlklr/5YdXtDOoYF/na8Wm4+x61fiApUYR7hQEwst4MkNoeLe2nqt6ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782236171; c=relaxed/simple;
	bh=y1qJtc7ng0dCOWVbMwEhMDR6b3x8Nv5erfwUmiM2oWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEVZBjAw5xxoZtU2BaBTSxPOpOfAW7ATNnyPYgJWbhxywUxf+3fMO+uFiB6fjsnufhEmIM6O9PjZCKN/c9BNcG3tGjMbDlscermjF9VcnshnKL0tsXQ8NnuyyGy6nUyLx9Ti2Y/TPGRI5qtE1uIkzFO6edC8jfc5JCl7oxzSxAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbZp2Md/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbZp2Md/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D611F000E9;
	Tue, 23 Jun 2026 17:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782236170;
	bh=qi/jSwvOEDOKKa14c7iFr4Cmv7LaMJ54Xw33KCqa6os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UbZp2Md/QsJASeGKrBovcPDcCCYLG8px709WAnSRLfE7DEbiYZiWp/Q9VEnSb5r6q
	 GVpQqBP/L2ZDWWVp5m3EVuxVZCxVCGp7fkTEbpbU+NrS7J6gDV3C/7W0SCLcmp6jb3
	 5gOj+yx8SCPLVOfDENBtCmEas/VSbrrIeassoWT6TN8iR0GdSgTrL8Gwqk1aWXYY0D
	 dd6RxdoRf0st3Ofj0IMZmWV1TLBM6Qm9nNkaH9Zaad6R7UoLKPjnnq+uTn2/9OZalx
	 B0OuP5axqT/iX5HPgJKrRBlboQ8X1svEbIxE+iKmGp38YhR53RKpkc48dyUhK/6/dl
	 IW07PMKNmLJBw==
Date: Tue, 23 Jun 2026 18:36:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Selvamani.Rajagopal@onsemi.com
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's
 FD5121
Message-ID: <20260623-anybody-gutter-e6ca04f53bdb@spud>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
 <20260622-support-fd5121-from-onsemi-v1-2-b31767689c65@onsemi.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nNUv3Ue/fcUdZ8T0"
Content-Disposition: inline
In-Reply-To: <20260622-support-fd5121-from-onsemi-v1-2-b31767689c65@onsemi.com>


--nNUv3Ue/fcUdZ8T0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 10:55:38PM -0700, Selvamani Rajagopal via B4 Relay =
wrote:
> From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
>=20
> Add devicetree schema for onsemi FD5121, FD5123, and
> FD5125 dual rail, multi-phase digital controllers.
>=20
> Signed-off-by: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
> ---
>  .../bindings/hwmon/pmbus/onnn,fd5121.yaml          | 41 ++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/onnn,fd5121.ya=
ml b/Documentation/devicetree/bindings/hwmon/pmbus/onnn,fd5121.yaml
> new file mode 100644
> index 000000000000..b0453b0634f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/onnn,fd5121.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/onnn,fd5121.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: onsemi's multi-phase digital controllers

Can someone explain to me what a "digital controller" actually is?
Seems very generi and that a word may have been left out, were it not
for the fact that this wording is used several times in the patch.

> +
> +maintainers:
> +  - Selvamani Rajagopal <selvamani.rajagopal@onsemi.com>
> +
> +description:
> +  onsemi multi-phase digital controllers with PMBus.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - onnn,fd5121
> +      - onnn,fd5123
> +      - onnn,fd5125

Your /OF/ match data in your driver suggests that you intended to permit
fallback compatibles here?

|+#ifdef CONFIG_OF
|+static const struct of_device_id fd5121_of_match[] =3D {
|+       { .compatible =3D "onnn,fd5121" },
|+       { }
|+};
|+MODULE_DEVICE_TABLE(of, fd5121_of_match);
|+#endif

pw-bot: changes-requested

Cheers,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      fd5121@50 {
> +        compatible =3D "onnn,fd5121";
> +        reg =3D <0x50>;
> +      };
> +    };
>=20
> --=20
> 2.43.0
>=20
>=20
>=20

--nNUv3Ue/fcUdZ8T0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajrEBQAKCRB4tDGHoIJi
0hHeAP4oKgrpS2qCVz/7ODVGFkKjS9WeVrY9WRU2VoFRwu94LAD/cWvC5fHHab1e
08TsiaHzIQKJUchGnnu1pP0VNTlNvwQ=
=+IXw
-----END PGP SIGNATURE-----

--nNUv3Ue/fcUdZ8T0--
