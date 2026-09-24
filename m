Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323DB486436;
	Thu, 24 Sep 2026 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269153; cv=none; b=M0SmT+f9hB1W8BA8uRXmnlpzkMBf6BqD/VlyDawvCTkmFQj6ULJ1g6KyW/PCMNtaXSYUW2iHKy2sqaCdJ9aDQihY+NYmXwPD9L0RFXmkOoPms277QJynxuIrGOw65VeSZSJk/lJACg8CVKMj2XVXyftrVbT1RtHBRsM0jx6zbuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269153; c=relaxed/simple;
	bh=7MrADAT3pJxaA7yfhAryGDF0wV3MD4vHy706KHaFbVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvgbDw0bKge4JVrotOSqEVDbAb9B0zbq10KnS8a75VggSxgtw257FtxjwRzz8f0UGNyonmEEfcTa9bNzcvCjoGgSDP3j1teC9wmrAlIJnhofOUADE0rpf509dcHZ/jSiTVgrILG08DwrhOAuHoqUjJEHW7lCW3N9mqdHRViemyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DY0adfjg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DY0adfjg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35311F000FF;
	Thu, 24 Sep 2026 16:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790269152;
	bh=U8FssP7OiNsbrh+H8QKNJEenMZkalOzxaENsczMx87Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DY0adfjgVgdJYcoNH8o4wB+eXaRT4avo+EonWWfl4mXYK6UMfQEg3qP0vPSua3p8z
	 zZlXblCJ2xR9svLnOT2RUbqCktR1gY351VWZFkJIg0NOXdk1d7/wggfRtK8JqnEu20
	 oYP/H8tFbgfOuXOvedZq8ct52Fk2u0HucrfH+UMRNRGV8ztw5EEeLg/uS9Fbm4Rx9u
	 4XCEVywGLCYNpGVdkxxfWs+PaYPwvOOtziQ+nRlGPLLzPzfebfng06kjzCBQaTyDFU
	 38dRM+r+HEyy2jNm6d2oMvnzKWITsEFWfa2oyHqJCBhZ6CHO00RFxKVMOfVaqnUKlX
	 F9C2dhuJX60mg==
Date: Thu, 24 Sep 2026 17:59:07 +0100
From: Conor Dooley <conor@kernel.org>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: lm75: add MAX31875
Message-ID: <20260924-enjoyer-slit-b55f55fac07c@spud>
References: <20260924084121.82-1-johnerasmusmari.geronimo@analog.com>
 <20260924084121.82-2-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1KdV1XWkvBgs1aHu"
Content-Disposition: inline
In-Reply-To: <20260924084121.82-2-johnerasmusmari.geronimo@analog.com>

--1KdV1XWkvBgs1aHu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 04:41:19PM +0800, John Erasmus Mari Geronimo wrote:
> Add MAX31875 compatible string to lm75 dt-bindings.

Commit message should explain why this is not compatible with exisiting
devices.
pw-bot: changes-requested
With one,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analo=
g.com>
> ---
>  Documentation/devicetree/bindings/hwmon/lm75.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Document=
ation/devicetree/bindings/hwmon/lm75.yaml
> index b48bf3fd721fe..d56f3ec299105 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> @@ -14,6 +14,7 @@ properties:
>    compatible:
>      enum:
>        - adi,adt75
> +      - adi,max31875
>        - ams,as6200
>        - atmel,at30ts74
>        - dallas,ds1775
> --=20
> 2.34.1
>=20

--1KdV1XWkvBgs1aHu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVW2wAKCRB4tDGHoIJi
0saFAP9ujrYHUP/CqPz4niWARa46yOU620Fx1Pm54CYu8w52FQEAvK1ThxmNNQEc
+Gp875eety2d9Kn5bZSwsvxtUntBYgc=
=7HrM
-----END PGP SIGNATURE-----

--1KdV1XWkvBgs1aHu--
