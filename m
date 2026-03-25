Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D1832694F;
	Wed, 25 Mar 2026 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462856; cv=none; b=iKGZRI4XGnoz65FgAmpAMgRWxXYvcVJOmSxJGQTiZCryHBUGIu9r/OB5kk6+rlG/2mM/qW1dqOPgyvy8zzrc0XdmeK5frVNoXhRA7vZuaHdwBYo0SfGT05LSNHJ8By0+yY4D6nxUagQjPyyXaNIZK+UhTFcPfp1fz7iznFSdDIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462856; c=relaxed/simple;
	bh=oMdhYSES5MvAh1wOam8EQNNBXiL4HAnHqe2eV/eCsJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyWm4zMEfd2YQfEAXj6AFbWKt0mkLz1NvHlkaIXotwnjlwzD2JCTZcLswiRx1ACZF7Y+1paNkEbIBQpgA/BJNBB6FQjr9i3gQhT1kMH0r04mqmcNQzdbjKlOgvClci5nS82A7XgheKgtPTzIJYTMdVWNvUL2uerDqtn4VtX4o14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7RZ8npT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7RZ8npT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634AAC4CEF7;
	Wed, 25 Mar 2026 18:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774462856;
	bh=oMdhYSES5MvAh1wOam8EQNNBXiL4HAnHqe2eV/eCsJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7RZ8npTmOQn2fjsJYVFhPG6gaG5CVtJMyFOWXNSl0wIr14Vaj4JEPHfOKC2frlZa
	 kp/wUNV9YJQAeQQgmKiWEadnjJf0YkzRVBeaKiUEow1+TbPoIjwkjebZgP66rQKbX3
	 qzuSnSskOuVf6AMQyutUVM4eYP966PVrF4GLYVEVOkWG5NcCzM1F63Qoto8UNTID1G
	 JIUdgPb73L0g1HZ/WOrSktjqckiAyNr4KUTtvsKX2hqQusy0Qv2HViUUX12AzsR2SH
	 ZK6CDmGHLxqKRVFDhh1oMJM5xsaHsrKwM+0huYQdZ7CoQoE8FEJczk6nG5SmdXoVgk
	 OCAmdAWZWbeEg==
Date: Wed, 25 Mar 2026 18:20:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Message-ID: <20260325-napping-turmoil-de37168fb072@spud>
References: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1774429690-129139-3-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JnVEHSX4cpxGm636"
Content-Disposition: inline
In-Reply-To: <1774429690-129139-3-git-send-email-zaixiang.xu.dev@gmail.com>


--JnVEHSX4cpxGm636
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 05:08:08PM +0800, Zaixiang Xu wrote:
> Add YAML devicetree binding schema for Sensirion SHT30 series.
> Use fallback compatibles for compatible chips and add optional
> interrupts and vdd-supply properties.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202603212044.BRPaiz86-lkp@intel.com/

The robot did not report that this binding was missing.
It also told you not to add these tags.

You also ignored my and Krzysztof's reviews.

NAK.

pw-bot: changes-requested

> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> ---
>  .../bindings/hwmon/sensirion,sht30.yaml       | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht=
30.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml=
 b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
> new file mode 100644
> index 000000000000..1b5ce822b37b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/sensirion,sht30.yaml#
> +$schema: http://devicetree.org/meta-schema.yaml#
> +
> +title: Sensirion SHT30 Humidity and Temperature Sensor
> +
> +maintainers:
> +  - Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> +
> +description: |
> +  The SHT30 series is a family of humidity and temperature sensors by Se=
nsirion.
> +  Compatible sensors like the GXCAS GXHT30 are also supported.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - gxcas,gxht30
> +      - sensirion,sht30
> +      - sensirion,sht31
> +      - sensirion,sht35
> +      - sensirion,sht85
> +      - sensirion,sts30
> +      - sensirion,sts31
> +      - sensirion,sts32
> +      - sensirion,sts35
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
> +
> --=20
> 2.34.1
>=20

--JnVEHSX4cpxGm636
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacQnhAAKCRB4tDGHoIJi
0hEpAPsEk7Wo9cQKKWjagPoB+6FaVYgR4sKnBHKTexzWM3DFpgEA6JHc2ooxZl5d
KGx8hyFJar7aV8GMm3/zdAM5LH+/8Qk=
=9niK
-----END PGP SIGNATURE-----

--JnVEHSX4cpxGm636--
