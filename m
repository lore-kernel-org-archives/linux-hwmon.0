Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA4C6FB8;
	Sat, 25 Nov 2023 11:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOHUEXLU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15B3C433C8;
	Sat, 25 Nov 2023 11:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700913400;
	bh=E0Zr+egiMJ/+xOqX2qVfwLXHyKLW5t+4UoMKnb/2C5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOHUEXLUcdlch6TK3FbEftGhE82d7JxQ0j7GKEXv4zp3RvKJpRJiTU6uhKbM4Ta1Y
	 U6taVrAUQ7OW9XeBZRyQ9n97/ZATY8vrxUppZSRJyKwW9/laenZmJ11u/IZMVtnNbc
	 4dN3u1An2BYNKEvEDz06cES3csSUHwezoFuW5JSoRRGMc8hsSWCaXwYF0Z0D2UpLk4
	 tzdSaD4iTnmtLNJ13yajyiRLdPRwZ6gQ/cYt7DuJJEjWJ1pWi0Px8Hj7znwhVinxVn
	 J5ADZbYGRysi98QdUS5DRjeg83ykLp2kT70m2twTiSmSJ2hnaFMUZnQ7swocgqnQLi
	 ewUtROxgZp2Bg==
Date: Sat, 25 Nov 2023 11:56:35 +0000
From: Conor Dooley <conor@kernel.org>
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add LTC4282 bindings
Message-ID: <20231125-chivalry-bargraph-cb6bb2b1ed66@spud>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
 <20231124-ltc4282-support-v2-1-952bf926f83c@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tbbD+6H8Maf5Hea6"
Content-Disposition: inline
In-Reply-To: <20231124-ltc4282-support-v2-1-952bf926f83c@analog.com>


--tbbD+6H8Maf5Hea6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 24, 2023 at 03:18:16PM +0100, Nuno Sa via B4 Relay wrote:

> +  adi,gpio1-mode:
> +    description: Defines the function of the Pin.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [gpio, power_bad, power_good]
> +
> +  adi,gpio2-mode:
> +    description: Defines the function of the Pin.
> +          0 - GPIO Mode.
> +          1 - Acts as an input pin and it is feeded into the ADC.
> +          2 - Pulls Low when the MOSFET is dissipating power (stress).

These three descriptions here probably need to be updated, one for being
too short and these two for still having the integer stuff in the
descriptions. Otherwise I think this is looking okay.

Cheers,
Conor.

> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [gpio, adc_input, stress_fet]
> +
> +  adi,gpio3-mode:
> +    description: Defines the function of the Pin.
> +          0 - GPIO Mode.
> +          1 - Acts as an input pin and it is feeded into the ADC.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [gpio, adc_input]

--tbbD+6H8Maf5Hea6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWHg8wAKCRB4tDGHoIJi
0kWkAP9NH4LlhOZpAf+rkKbIB9cc4kjTupdqkcAiTqUNMCNSsgD/dulH1nyCtezk
0W6K0ahTrfwhvYbRu+WqYhl+tgK8jQI=
=WIN/
-----END PGP SIGNATURE-----

--tbbD+6H8Maf5Hea6--
