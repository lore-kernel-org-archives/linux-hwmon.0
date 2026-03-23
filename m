Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E171A3CCA13;
	Mon, 23 Mar 2026 19:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774294423; cv=none; b=Qp7nv7UoDweTpSK+44t5H167FblM2ZMqgsw/Q9kWNfkLXrk96Z9S3tvucltx2RCi0gEkZQu/+KAc0eHyKu9tSVj/GJE4pS3w8JUlNHve0+k/pjS7onXukb1WqKumE9tbE5K3DuIXjWMmUc4rgZ1i7VmA9pxde/AFdCdRf1VBq84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774294423; c=relaxed/simple;
	bh=ibmhyDBh7qGc9VbP/g7aL8x8cQeRhvQDZhxo1BaX4DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cwb37spvmSG4M+Twi20D3gaxw9lRFVL+U0Mvnfd7JJkejSSpuN+U2ywWcm/43coXcNnGRyW+YRv1bY7YCAf9GxgaB8IznqKl6CUC2WSu0oW99T7RYOTZdCt0MjtSfY8iH7086oel7+G0DS/ZfSxWSkVmywTTHnCTON76BLDuVzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2+c6sjH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2+c6sjH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD53C4CEF7;
	Mon, 23 Mar 2026 19:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774294422;
	bh=ibmhyDBh7qGc9VbP/g7aL8x8cQeRhvQDZhxo1BaX4DY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u2+c6sjHtyuUHhhaiR/h4mWp4RVwmui4wImkkzINKbbbf9PqunL2bKf5LlQyow6UX
	 +3/K2+cMjaszwJ/5y00bUKhThiEekoQz3drS9KE/NieufxoauJjeTppK61Q7c2TOmb
	 6uYkJ0wkunhEOEUmSQGC59LcrEXtX7pDN1UMr+2BePEJc/jkoQpIMq+k0VKDYGTb0y
	 9H5ruC/qH6M8VJ+yV+SQj31m7K5vq0hydVPf3Chu9xvBuJhCZ+m/iXEexIQThkrMdY
	 qGyFFfMzqpwdOuR72lXqt2YRuhZqPqVoTvRKI0Otk2ZMP0zi2+7XH2/Ta4OJnZuf3t
	 m2n+1wCBhtVPw==
Date: Mon, 23 Mar 2026 19:33:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Anshika Gupta <guptaanshika.ag@gmail.com>
Cc: linux@roeck-us.net, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	lakshaypiplani77@gmail.com
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: Add support for NXP P3T1084UK
 temperature sensor
Message-ID: <20260323-guy-chef-4d98fa4f7c1b@spud>
References: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="14hJa/gjYwSAe/Y1"
Content-Disposition: inline
In-Reply-To: <20260323162252.15508-1-guptaanshika.ag@gmail.com>


--14hJa/gjYwSAe/Y1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 09:52:50PM +0530, Anshika Gupta wrote:
> The P3T1084UK is an NXP digital temperature sensor compatible with the
> Texas Instruments TMP108 register and protocol specification. This patch

Then why is tmp108 not used as a fallback compatible? Looks from the
driver patch like it would be suitable.

> extends the existing DT binding for "ti,tmp108" to document the
> compatible string for P3T1084UK so that the hwmon TMP108 driver can
> bind to this device.
>=20
> Signed-off-by: Lakshay Piplani <lakshaypiplani77@gmail.com>

What did Lakshay do? You're author and submitter, but their sign-off is
here. Are you missing a co-developed-by?

> Signed-off-by: Anshika Gupta <guptaanshika.ag@gmail.com>
> ---
>  Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml b/Doc=
umentation/devicetree/bindings/hwmon/ti,tmp108.yaml
> index 9f6c9f6fa561..47714df5aaff 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
> @@ -4,20 +4,21 @@
>  $id: http://devicetree.org/schemas/hwmon/ti,tmp108.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: TMP108/P3T1035/P3T1085/P3T2030 temperature sensor
> +title: TMP108/P3T1035/P3T1084/P3T1085/P3T2030 temperature sensor
> =20
>  maintainers:
>    - Krzysztof Kozlowski <krzk@kernel.org>
> =20
>  description: |
> -  The TMP108 or NXP P3T Family (P3T1035, P3T1085 and P3T2030) is a digit=
al-
> +  The TMP108 or NXP P3T Family (P3T1035, P3T1084, P3T1085 and P3T2030) i=
s a digital-
>    output temperature sensor with a dynamically-programmable limit window,
>    and under- and over-temperature alert functions.
> =20
> -  NXP P3T Family (P3T1035, P3T1085 and P3T2030) supports I3C.
> +  NXP P3T Family (P3T1035, P3T1084, P3T1085 and P3T2030) supports I3C.
> =20
>    Datasheets:
>      https://www.ti.com/product/TMP108
> +    https://www.nxp.com/docs/en/data-sheet/P3T1084UK.pdf
>      https://www.nxp.com/docs/en/data-sheet/P3T1085UK.pdf
>      https://www.nxp.com/docs/en/data-sheet/P3T1035XUK_P3T2030XUK.pdf
> =20
> @@ -28,6 +29,7 @@ properties:
>            - const: nxp,p3t2030
>            - const: nxp,p3t1035
>        - const: nxp,p3t1035
> +      - const: nxp,p3t1084
>        - const: nxp,p3t1085
>        - const: ti,tmp108
> =20
> --=20
> 2.34.1
>=20

--14hJa/gjYwSAe/Y1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacGVkQAKCRB4tDGHoIJi
0jVJAQCEpZVyW1tO5Iwwpit8j6ZNQ29BxwF/EM3OhTiJFmPkqQD/QgrmLAeYibSl
NnGv1iv7+sHZ1/uA3g2fwl2qP2ex6gI=
=8Ump
-----END PGP SIGNATURE-----

--14hJa/gjYwSAe/Y1--
