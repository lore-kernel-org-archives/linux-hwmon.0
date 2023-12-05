Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D47A60B9B;
	Tue,  5 Dec 2023 16:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obFibu4W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A66C433C9;
	Tue,  5 Dec 2023 16:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701793098;
	bh=skGWck3nbB+RkjcKTf0FjT9rDXOSS+ftDqayM91Nr4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obFibu4Wq0IzsvCu6Y/x19+H23mj2jgS23itwp4A5TxZwqBaKWQndXUkSFDADmKZo
	 EhhEk3mv8fhGbmMMtDfnCcDpTsScv6MX9hKktPyolWutBsWMwn/1YD4l1B8vwjqiXI
	 vQXu3GV1RYTV+Yg3p+uTJKsJt/z0j49Ld+lA4jMy7iz9pEgyH6yYF2D01S8egsYyGV
	 OCoYMsN6iNXSSgs/KNrDjZk3+pn422gkULqGRbfwZduucVg6Na8ePtPkAD7hM8Qgqc
	 SCSvjlcwl17a4ysvOyZl7o6oatPqlpxWwKMHhlw+e+JgtxeT7I/EUJhL5vueAUD3oJ
	 TjV5fKnBNGKPg==
Date: Tue, 5 Dec 2023 16:18:14 +0000
From: Conor Dooley <conor@kernel.org>
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add LTC4282 bindings
Message-ID: <20231205-cognitive-propose-aa71278f65ea@spud>
References: <20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com>
 <20231205-ltc4282-support-v3-1-e0877b281bc2@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TCGmBQZDRv9fq6jh"
Content-Disposition: inline
In-Reply-To: <20231205-ltc4282-support-v3-1-e0877b281bc2@analog.com>


--TCGmBQZDRv9fq6jh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 05, 2023 at 04:22:55PM +0100, Nuno Sa via B4 Relay wrote:

> +  adi,overvoltage-dividers:
> +    description: |
> +      Select which dividers to use for VDD Overvoltage detection. Note that
> +      when the internal dividers are used the threshold is referenced to VDD.
> +      The percentages in the datasheet are misleading since the actual values
> +      to look for are in the "Absolute Maximum Ratings" table in the
> +      "Comparator Inputs" section. In there there's a line for each of the 5%,
> +      10% and 15% settings with the actual min, typical and max tolerances.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [external, vdd_5_percent, vdd_10_percent, vdd_15_percent]
> +
> +  adi,undervoltage-dividers:
> +    description: |
> +      Select which dividers to use for VDD Overvoltage detection. Note that
> +      when the internal dividers are used the threshold is referenced to VDD.
> +      The percentages in the datasheet are misleading since the actual values
> +      to look for are in the "Absolute Maximum Ratings" table in the
> +      "Comparator Inputs" section. In there there's a line for each of the 5%,
> +      10% and 15% settings with the actual min, typical and max tolerances.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [external, vdd_5_percent, vdd_10_percent, vdd_15_percent]

> +  adi,gpio1-mode:
> +    description: Defines the function of the Pin. It can indicate that power is
> +      good (PULL the pin low when power is not good) or that power is bad (Go
> +      into high-z when power is not good).
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [power_bad, power_good]
> +
> +  adi,gpio2-mode:
> +    description: Defines the function of the Pin. It can be set as the input for
> +      the ADC or indicating that the MOSFET is in stress (dissipating power).
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [adc_input, stress_fet]

None of these properties have a default nor are required.
What happens when they are omitted?

Thanks,
Conor.

> +
> +required:
> +  - compatible
> +  - reg
> +  - adi,rsense-nano-ohms

--TCGmBQZDRv9fq6jh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW9NRgAKCRB4tDGHoIJi
0vYPAQD48g59oBMSVov7YeTWFAOYsFD45qlfwhfxThDyisoVRgEA61ZIF8dlu+EI
MHu+Al7JW2jF6j5E19wmeYIewmgntgI=
=GeCO
-----END PGP SIGNATURE-----

--TCGmBQZDRv9fq6jh--
