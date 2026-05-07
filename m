Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE2F32C923;
	Thu,  7 May 2026 17:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173640; cv=none; b=KusSzLDSrkyZR1Od6FOP/3VvexOaC8pTkCAohDWIJeO9eu1gQoLgmgqjWuK+i3yV7jORramGe2WyNjxXGNewqeX4ms5a26Xjy0PtG9AA8DVxjAzi+sme5mZl2lTWvBqNwwsU93dVSiVDozJyi6EqdB9JJuEjqgIhU+kkcfiVZB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173640; c=relaxed/simple;
	bh=c4gV57TC8fT2cJF8+yJXdW2q5GT1M2sibP6Ru132maY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYoJk7drxulYtNWiMJayPZyUQV9hswoqTWZSMh+C8kDtsywNyzvfbDaFrKTgMuo+AomkdLyT59y74O4QQhWDRpW8QvUmB43Y+fhwWIOX6NMBmcwyWfRNKTkx7ENDc3iSPW8uFbmOPVM/sPo7XE8cT12GK5HBUJ45aFKiCPbFO9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3gMQBJl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3gMQBJl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1875BC4AF09;
	Thu,  7 May 2026 17:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778173640;
	bh=c4gV57TC8fT2cJF8+yJXdW2q5GT1M2sibP6Ru132maY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3gMQBJlN1MSWCADLTajo0HPH5qHwTnHu3X1QxAa8OYsCd82DlrohUg2lby1g8oLp
	 vJIsAsJgGO0eWXLtd/hrLgSCwZtLMEtCkirAC8Rhb0JiKg8LeFk0R0HiGu3+Bj1EoY
	 iYKoVecuc25eD9UTuIy4vIgaxZBhZJzv+1gFRC2KsLgvVN4eXFd/Jk0VsLLZOI7AhC
	 t7WmH3ZHH2U/f2Kj34uCUmGDD7hQVxYJCIwuaP0hb1BqjKdvkaVRoZ/Fg6gnCtWJ7Q
	 PfQ7gUMCD9GrbMgZE+MJOuX+g5iL3oTpDYKfjR7yUOKsdkKTxUpVB88bHGCeSXVyLW
	 rgruAi7OyFwDA==
Date: Thu, 7 May 2026 18:07:15 +0100
From: Conor Dooley <conor@kernel.org>
To: u8813345@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Chang <kevin.chang2@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin Huang <colin.huang2@amd.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: pmbus: add Delta E50SN12051
 binding
Message-ID: <20260507-squealing-vanish-16fea3c114f5@spud>
References: <20260507-add-e50sn12051-v4-0-ff2b3768ac7e@gmail.com>
 <20260507-add-e50sn12051-v4-1-ff2b3768ac7e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PcTxrWV42aINvzPC"
Content-Disposition: inline
In-Reply-To: <20260507-add-e50sn12051-v4-1-ff2b3768ac7e@gmail.com>


--PcTxrWV42aINvzPC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 01:12:26PM +0800, Colin Huang via B4 Relay wrote:
> From: Colin Huang <u8813345@gmail.com>
>=20
> Add devicetree binding documentation for the Delta E50SN12051
> PMBus-compliant device.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>  .../bindings/hwmon/pmbus/delta,e50sn12051.yaml     | 42 ++++++++++++++++=
++++++
>  1 file changed, 42 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn120=
51.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.ya=
ml
> new file mode 100644
> index 000000000000..72aefe212d17
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/delta,e50sn12051.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Delta E50SN12051 PMBus Sensor
> +
> +maintainers:
> +  - Kevin Chang <kevin.chang2@amd.com>
> +
> +description: |
> +  Delta E50SN12051 is a non-isolated 1/8th brick DC-DC power module.
> +  It is a PMBus-compliant device accessible via an I2C/SMBus interface
> +  and provides standard telemetry such as voltage, current, and
> +  temperature measurements.
> +
> +properties:
> +  compatible:
> +    const: delta,e50sn12051
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C bus address of the PMBus device
> +
> +required:
> +  - compatible
> +  - reg

With only these two properties, shouldn't this be in trivial-devices?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        power-module@40 {
> +            compatible =3D "delta,e50sn12051";
> +            reg =3D <0x40>;
> +        };
> +    };
>=20
> --=20
> 2.34.1
>=20
>=20

--PcTxrWV42aINvzPC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzGwwAKCRB4tDGHoIJi
0qdCAPoDRX/x8dDtyITcvWtPvsglAgujnKJfndPcFrd5MaOiNQEAo3dkj9tX23oA
5+H451V3Kj9vCQ2sMmUeR8DxzbazqQI=
=J5lY
-----END PGP SIGNATURE-----

--PcTxrWV42aINvzPC--
