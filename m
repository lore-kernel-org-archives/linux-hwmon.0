Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4065D3EE1D7;
	Thu, 19 Mar 2026 17:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773939929; cv=none; b=SQlkCBubpg9ZlttM1DB0WxFtLc0Fe4JCUybMOtj3VSZGbxaWvqGrVPofG3hprZbrLiF+mO3ELguISr+7Hc+1vftEgDPwIlTHANSyX3s4Ktp6A9N4TSY3YeoCRJUso2x7b6pEK9ydgJU67dyuz/GgrunDyQTZ9mDVkieEplYlyvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773939929; c=relaxed/simple;
	bh=MjMsM5OAWRzkucIZMCtisN6Lzjk51fV2pc4AC1MITco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4ShUazWMMTZREPWsceZNefVxSBUiOFYZosB8QkACDraAU1RyQZyV5lqFHD3998CmqsP3ZDbVccDjnKHe+3jXUz9S9G7U0UfLWP9H841ReB+LgO9cyeONCqbd6Su0Sca/0sml1gXbygKvGq/WT7TddpE0czK3L5yoztATA6qMSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kqf3bRoM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kqf3bRoM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9E5C19424;
	Thu, 19 Mar 2026 17:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773939928;
	bh=MjMsM5OAWRzkucIZMCtisN6Lzjk51fV2pc4AC1MITco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kqf3bRoMBtlMMciA76bL/PBjGrVgAtkIrmTaOiy3/LzDXg602ZkYLDwR+rP434VKO
	 JIEP49ptkRem6DNAHGnMD3dyNEk9QiNE3VHBuxdFnzWkHl693w8WArLnowx7la9DzV
	 /1CC1ZFzJScaN3VrR8pa4OguHm6qZs/Dq2JxoObEKITUCwBifOud6aEtq116p3/HKi
	 7ymsSH0uUEVrcKXO8KTr82WuLYvp2K/uvxbY38B/yvc4AX5pALXhGv95Inpk+AcUpW
	 os3PADbfPhKI72bC40lHg9Yo+gSagL+TgdK7OP17emrUkCUzshcwNER5sZUbtZsDfo
	 MEQ2N465vlGMw==
Date: Thu, 19 Mar 2026 17:05:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: hwmon: Add Sensirion SHT3x and GXCAS
 GXHT30
Message-ID: <20260319-matcher-private-103adc8d3252@spud>
References: <1773920314-17755-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1773920314-17755-3-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H77iOZ0X/I/mqJ4Y"
Content-Disposition: inline
In-Reply-To: <1773920314-17755-3-git-send-email-zaixiang.xu.dev@gmail.com>


--H77iOZ0X/I/mqJ4Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 07:38:33PM +0800, Zaixiang Xu wrote:
> Add YAML devicetree binding schema for Sensirion SHT3x series and GXCAS G=
XHT30 humidity and temperature sensors.

Overly long line.

>=20
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> ---
>  .../bindings/hwmon/sensirion,sht3x.yaml       | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht=
3x.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml=
 b/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml
> new file mode 100644
> index 000000000000..47dbb743e2ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/sensirion,sht3x.yaml#
> +$schema: http://devicetree.org/meta-schema.yaml#
> +
> +title: Sensirion SHT3x Humidity and Temperature Sensor
> +
> +maintainers:
> +  - Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> +
> +description: |
> +  The SHT3x series is a family of humidity and temperature sensors by Se=
nsirion.
> +  It also includes compatible sensors like GXCAS GXHT30.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sensirion,sht3x

Typically, we don't permit wildcards in compatible strings.
You need to have an explanation in your commit message for why using
specific compatibles for each model is okay. Even then, should really
use a compatible that represents a real device, in case a sht38 comes
out that isn't compatible with the sht31 etc.

> +      - sensirion,sts3x
> +      - sensirion,sht85
> +      - gxcas,gxht30

None of these devices have any match data, and the driver only seems to
care about sts versus !sts. Fallbacks look like they should be used for
the sht devices and the gxht30.

pw-bot: changes-requested

Cheers,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address (usually 0x44 or 0x45)
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
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        sensor@44 {
> +            compatible =3D "gxcas,gxht30";
> +            reg =3D <0x44>;
> +        };
> +    };
> \ No newline at end of file
> --=20
> 2.34.1
>=20

--H77iOZ0X/I/mqJ4Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabws1AAKCRB4tDGHoIJi
0nPyAQC/m/FwLKjOtOTEPvV8mwPh+UfeppxOLt64VMK9e5OB7gD/S1dZJlwy+Ii9
kgwp2y9ZR79kFpYizBinYs0ahWsqigQ=
=eEw3
-----END PGP SIGNATURE-----

--H77iOZ0X/I/mqJ4Y--
