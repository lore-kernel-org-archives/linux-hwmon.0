Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCB83E120D;
	Thu, 11 Jun 2026 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781198870; cv=none; b=eLTMMyyDSSMQSUGsWIA2lNrJxDn6T9jT/PTCbnjsS0JPbnUsQ31GGPyOOU0b0XFlde4rDyGYT76NuH5hl1uOU9sl+VRx6zgwnRTSX7g+BnTWP8bVQwwrc15vU1ubjRwmmgrlSqUSGFtA1ABBS9y0VaTHRd4MNRRk/OueaNKTo8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781198870; c=relaxed/simple;
	bh=b/hhVd7KaxWhY86vEkpXaK6AnnxxrEg11wvKnvc3e0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lx9gS4zGunlh6pXMlDPm5QPStkqlGwnpDoYMUIp9a/efOa/tOyDzLHVss7EPoi43Pq1Bk4yn34bfsXjEBJFrL0Owk4MZFARsY3FQuymg6mPHB8aNRqgNL+DW6xjLhQyv0MzsVD5l9aMixmhJi+dHB01L4EnhFMk7SbOVP1EVSwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlaCtOVy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NlaCtOVy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1A71F00893;
	Thu, 11 Jun 2026 17:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781198867;
	bh=wJWA9gvosXyA5bNok8kbiFm5CMrpRkHSulsXb0OT+6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NlaCtOVyE2ompHHQcG4CLt3VLe0eO0yptGDZOT+zjKB0r15mJMQ055f3G2d57jyz+
	 yZQYMVuVw5H40+PgCQunrcGjOktN28baI3Z+rwiI891h24h+GUbDMZPKbqjrhawVjG
	 i/fUOMmWlWYNFl6DJW455MyxcvavcCNRye4aLArTpMsgFFwK94I5pkvUN20q5Gokaq
	 SL13P1AVuklnbwQShEmHmD+lolPYWnrhSWuVZt1dKa05QyhMDHytWMUZMQSNXHHhyO
	 mrdSgkCy9Ig9ocq5vGjAnSfxpCEZzGYfa8sTlmPrAmAsc570aXZq+sm9H7PHDEKKZT
	 S2iGhE3xIEUKQ==
Date: Thu, 11 Jun 2026 18:27:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@qunatatw.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current
 limit properties
Message-ID: <20260611-mocha-strive-a7f3265dd3f4@spud>
References: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
 <20260611-lm25066-cl-config-v1-1-02e567bf3d91@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m/YblVf65E0KJM9Q"
Content-Disposition: inline
In-Reply-To: <20260611-lm25066-cl-config-v1-1-02e567bf3d91@gmail.com>


--m/YblVf65E0KJM9Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 05:58:44PM +0800, Potin Lai wrote:
> Add mutually exclusive 'ti,cl-smbus-high' and 'ti,cl-smbus-low' boolean
> properties to configure the device's Current Limit (CL) behavior using
> SMBus settings instead of physical pins.
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml  | 20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yam=
l b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> index a20f140dc79a..95ea7c26dec2 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> @@ -46,6 +46,26 @@ properties:
> =20
>      additionalProperties: false
> =20
> +  ti,cl-smbus-high:
> +    description: |
> +      Configure the Current Limit (CL) to use the SMBus high setting.
> +    type: boolean
> +
> +  ti,cl-smbus-low:
> +    description: |
> +      Configure the Current Limit (CL) to use the SMBus low setting.
> +    type: boolean

What's smbus specific about this? If the pin was connected to a GPIO,
you'd then need to have different properties or use these ones with an
inaccurate name.

Please also spell out "current-limit".

pw-bot: changes-requested

Thanks,
Conor.

> +
> +dependencies:
> +  ti,cl-smbus-high:
> +    not:
> +      required:
> +        - ti,cl-smbus-low
> +  ti,cl-smbus-low:
> +    not:
> +      required:
> +        - ti,cl-smbus-high
> +
>  required:
>    - compatible
>    - reg
>=20
> --=20
> 2.52.0
>=20

--m/YblVf65E0KJM9Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCairwDwAKCRB4tDGHoIJi
0ov/AQCyDou6NfDCNsjoAQI5YHPSVVXRTOpI8qO2Knc+pcCtKAD9GgBs6fdBn54u
twODIcebNrfFYkC+hqr/5jUg0vRE6wc=
=mjlg
-----END PGP SIGNATURE-----

--m/YblVf65E0KJM9Q--
