Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D5C1E571A;
	Tue,  5 Nov 2024 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730830717; cv=none; b=TtcxtW3dpIxmEHdxxeXkbzKUM3dWTlIUz6RMjdoLC2FcqhVuxs4yavvJ3HB/9nwiNXElpprH5nOg1fOpm5JhmgJS6ASXM4ke8TbRF7hr94LTGBZYwpHe8kS1a4hWT9RKeLoP2zJp1YGjSQ5oJzSyjgCJnXGZy5+OkhbROwQvMf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730830717; c=relaxed/simple;
	bh=nBIG5rWdpNBhBcj6jUFiMB071F5saYr4spyqmz/+t7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gy8uWAEmefurlv7kWFCr+7uVyuWMQEIZZCQQh5AEJV0HMby0V0ZHwS1KdVlRI8xlL/LtAOOXgjXXmVgSFVLTVIaDYtR/V/IGitVEUY5Z7f4B7yf9Cydbd5aWW2ZGaxPp3CV/lT5ElERFa+9jWrrTZOl0pe/oc1wH63bQtOFPw1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8R4Fc6w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8R4Fc6w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7D3C4CED1;
	Tue,  5 Nov 2024 18:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730830716;
	bh=nBIG5rWdpNBhBcj6jUFiMB071F5saYr4spyqmz/+t7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8R4Fc6wrUoJl+L+VYYKNNXlamPbGW3zwimqrRlgqwJV+A6X4bKWg1FNjRuVhEC9v
	 rp6yTYcn82cCRnEWh95nI/euctDfBC4ont01ctK5TF8okct7C91BdWMWjqWEKHAzvH
	 acmr4O4bj8WDA4zRhKnCvFYUW8D1huN38A2id/eN1cqiVp40AO1eaM2ZobyISQSPDV
	 UYWeL8Le751AlpLKYSmncEEqqp9OSA3HajE0xHcOvkQYxfu6TPZDjwmK47ufaAbVay
	 37mCD51Xa4dsYLygr+vUxGHSAhcFm7LzgGTnacx6Y5G0wAbJZOX5x1iAY99HPmg7HJ
	 wqfcAdG2Kracg==
Date: Tue, 5 Nov 2024 18:18:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document start from
 dead stop properties
Message-ID: <20241105-sensuous-lather-d9edfb9c0196@spud>
References: <20241105135259.101126-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qGy9xWgkR3+wDVgW"
Content-Disposition: inline
In-Reply-To: <20241105135259.101126-1-marex@denx.de>


--qGy9xWgkR3+wDVgW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 02:52:15PM +0100, Marek Vasut wrote:
> Delta AFC0612DB-F00 fan has to be set to at least 30% PWM duty cycle
> to spin up from a dead stop, and can be afterward throttled down to
> lower PWM duty cycle. Introduce support for operating such fans which
> need to start at higher PWM duty cycle first and can slow down next.
>=20
> Document two new DT properties, "fan-dead-stop-start-percent" and
> "fan-dead-stop-start-usec". The former describes the minimum percent
> of fan RPM at which it will surely spin up from dead stop. This value
> can be found in the fan datasheet and can be converted to PWM duty
> cycle easily. The "fan-dead-stop-start-usec" describes the minimum
> time in microseconds for which the fan has to be set to dead stop
> start RPM for the fan to surely spin up.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Docum=
entation/devicetree/bindings/hwmon/pwm-fan.yaml
> index 4e5abf7580cc6..f1042471b5176 100644
> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> @@ -31,6 +31,17 @@ properties:
>        it must be self resetting edge interrupts.
>      maxItems: 1
> =20
> +  fan-dead-stop-start-percent:
> +    description:
> +      Minimum fan RPM in percent to start from dead stop.
> +    minimum: 0
> +    maximum: 100
> +
> +  fan-dead-stop-start-usec:

s/usec/us/ and you get the type from property-units.yaml automagically.

> +    description:
> +      Time to wait in microseconds after start from dead stop.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
>    pulses-per-revolution:
>      description:
>        Define the number of pulses per fan revolution for each tachometer
> --=20
> 2.45.2
>=20

--qGy9xWgkR3+wDVgW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZypheAAKCRB4tDGHoIJi
0n5mAP99NIET0o+gGftjjKd0IQJoj5WFHzLRefxK/4uFdNI/KwD/WsljTlf8AZqq
vISz6iB7f+zuD3DPD1nT+DuAbGj38Ak=
=iaNX
-----END PGP SIGNATURE-----

--qGy9xWgkR3+wDVgW--
