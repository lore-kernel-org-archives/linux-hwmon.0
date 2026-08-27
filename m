Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBF041D628;
	Thu, 27 Aug 2026 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850097; cv=none; b=rHvn7zfNT2t90y7KY/MYRokY6nMfO6von4T5ZSE4z/TIypj32N+ujS2fbppca88A4RvURktAdMxb8uaMxoaQwG1jl034ovV2VIM25x4Ivjo6R+BuWUrbAu0RD9LNAEg7yBY0H3cSe7i8QIcn9qCWfwxwS8tU7nCaZ9DMyxJSHTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850097; c=relaxed/simple;
	bh=nP1BAOK13Iaaxhmj8/SQpfYfixH2N8GcCObbunsd9TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnlVZIFRA2RAzhM40LR1L4z54aKe+h3WPUKAtAYvKZSO67F/fMcjEYS0ZKEAgfWsLKvwDwY03/j+ThLNakOPF1dn7aeeVswqjO77/zFtXrT7L/TPUKESMbd6jGAUVHnGasBBAJ4SmgimwKTs6uTIdJ06pvrqYVnGCmsf7KoIGLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kz8vGjN0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kz8vGjN0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320471F000E9;
	Thu, 27 Aug 2026 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787850092;
	bh=QrfCtURGKGftDusM3epVvUzOHv7Dl/l68YZYJ7kvjZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kz8vGjN0NHssLGxSJP1T6MKmU4hBkdcx/UEcB3xQCgo14Is2rRk0BQGllrux9wEd3
	 zsS/bZebEegjmwHOVitF6gZ2b05volv0cqP7jiGNGvhh/aRGYhqpqW6ac0mkpbvdLn
	 AyMX/mZIAjYK8HjvmepJ9RdWv7ySptLUXjdbD/seFFVg5zohO1uVcyClSvQrngu15e
	 hDy3OXQ277PZgs/DJ2zBqw72S7oBm/6MxfGZpisKDQbcbEKdDbW1a4F5Jaxdj4OgTh
	 h3C16DkTB9CNhMJsxJ8TvV+YrzcpBXgtOo9Ij4TkPRG+D7T1m2S9YdmkSZ4uWNqKJx
	 Aj/jokslwgUnQ==
Date: Thu, 27 Aug 2026 18:01:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: national,lm90: Fix channel
 constraints for temperature offset
Message-ID: <20260827-stooge-polish-b23739e44224@spud>
References: <20260826184750.4798-1-flaviu.nistor@gmail.com>
 <20260826184750.4798-2-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FcJi8mongErY1AVh"
Content-Disposition: inline
In-Reply-To: <20260826184750.4798-2-flaviu.nistor@gmail.com>

--FcJi8mongErY1AVh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 09:47:48PM +0300, Flaviu Nistor wrote:
> Limit temperature-offset-millicelsius to remote channels only, since
> channel 0 is local and this property does not apply to it.
> Channel 2 is only valid on devices with two remote sensors, so reject
> channel 2 for compatibles that do not support a second remote channel.
>=20
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
> Changes in v2:
> - Use else statement in if/then block as suggested by Conor Dooley.=20
> - Link to v1: https://lore.kernel.org/all/20260824183900.8983-2-flaviu.ni=
stor@gmail.com/
>=20
>  .../bindings/hwmon/national,lm90.yaml         | 28 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> index 164068ba069d..a8b2a24501b3 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> @@ -113,6 +113,23 @@ allOf:
>        properties:
>          ti,extended-range-enable: false
> =20
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - adi,adt7481
> +                - dallas,max6695
> +                - dallas,max6696
> +    then:

> +      patternProperties:
> +        "^channel@[0-1]$":
> +          properties:
> +            reg:
> +              enum: [0, 1]

Is this needed? If channel@2 is false, then you won't be able to get to
this point to begin with, right?

Conor.

> +        "channel@2": false
> +
>    - if:
>        properties:
>          compatible:
> @@ -134,6 +151,11 @@ allOf:
>          "^channel@([0-2])$":
>            properties:
>              temperature-offset-millicelsius: false
> +    else:
> +      patternProperties:
> +        "channel@0":
> +          properties:
> +            temperature-offset-millicelsius: false
> =20
>    - if:
>        properties:
> @@ -149,7 +171,7 @@ allOf:
>                - onnn,nct1008
>      then:
>        patternProperties:
> -        "^channel@([0-2])$":
> +        "^channel@([1-2])$":
>            properties:
>              temperature-offset-millicelsius:
>                maximum: 127750
> @@ -172,7 +194,7 @@ allOf:
>                - winbond,w83l771
>      then:
>        patternProperties:
> -        "^channel@([0-2])$":
> +        "^channel@([1-2])$":
>            properties:
>              temperature-offset-millicelsius:
>                maximum: 127875
> @@ -186,7 +208,7 @@ allOf:
>                - ti,tmp461
>      then:
>        patternProperties:
> -        "^channel@([0-2])$":
> +        "^channel@([1-2])$":
>            properties:
>              temperature-offset-millicelsius:
>                maximum: 127937
> --=20
> 2.34.1
>=20

--FcJi8mongErY1AVh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapBtaAAKCRB4tDGHoIJi
0on2AQCfdtHpo59/qQNwC0Z9FJI7YX0IrI2xHnVnyJoEDRRDagD/elBK22Uzi5ST
cpY5dNU3Go8pF6ewbeb/Rjo/VMB2SgU=
=COuj
-----END PGP SIGNATURE-----

--FcJi8mongErY1AVh--
