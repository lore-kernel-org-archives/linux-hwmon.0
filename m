Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962FC46A5FB;
	Tue, 21 Jul 2026 15:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648994; cv=none; b=hwD7pJt6zvoVHyI/B1aVbNfKbdowFTfqARhj+g1dewyU6GvYtR7MYmVi4OTT23vey0DKHOYGKRycV9G2KYp3l6xQ9j0DWntgY0uSnCygfinAIBBmpp+kqphpHGcxKX0TxdenYX2DH7Mf1B3tZR5VFMzw1jdPxDREQIqP7lsTLws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648994; c=relaxed/simple;
	bh=1FXmH1dz6CehON59P66DLoxdnGoJcr/J/S4LqeeBDCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0i+wxi/pOb1IS8KEbfb/v4aD0awHz8Nx1L5xquyq75k8ahSw65Kkb+o9uUhJ8hYFkb0p0uAobh6+FZo44A+IhRawkWa3dYLC9kN12FrKTcNVNSyNeIqdDk/Dm/eCR1q762asBSGyhR9W4NnjOW3D93x7YIErfNHHxOfjAI9mAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwjp08oB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwjp08oB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D611F00A3A;
	Tue, 21 Jul 2026 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784648993;
	bh=iNKKMfd2qGosuONW6vQOFUvocvWbDP1gm7vIlrl2QBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lwjp08oBJsYYjgpvLKt4LE1icTycwWsgd1B401Rjl1TJknSR33XVyovNEk5KbM2qy
	 ihTj4IxuzccCKQJ7+h1S6JQiXqnjTxGi4PRSNgQyLOfPJ0wZpC4R8yyNR/bUqgn3fd
	 M3W/ndnXpUKf2O5kL3AtRCLWRr5Wjy291N/1DkvRUc5hIhCWBeT9Uf0gRZc2I7WTa/
	 0glO1lIPCrsUUCNcbmU2WbDEHxtBuAjXy/CLJd0hGhtCsLa9V5U40xt+fWqca9WsHJ
	 IsAPtWwSAT2gxSMDmmm+bC2t1Ck63aYmiHNAtXP2mPPq5VivAMtjLHd/tZx15xR3qo
	 0ilm4K/Oeso9A==
Date: Tue, 21 Jul 2026 16:49:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Message-ID: <20260721-dill-dab-df15585090d2@spud>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DW7VXcYUmFQ8ylSM"
Content-Disposition: inline
In-Reply-To: <20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>

--DW7VXcYUmFQ8ylSM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 02:48:27AM -0700, Troy Mitchell wrote:
> Add the vendor prefix for Sensylink Microelectronics.
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 396044f368e7..22d0d26f1bbd 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1467,6 +1467,8 @@ patternProperties:
>      description: Sensirion AG
>    "^sensortek,.*":
>      description: Sensortek Technology Corporation
> +  "^sensylink,.*":
> +    description: Sensylink Microelectronics Technology Co., Ltd.

Googling the company to see what their website is, I seem to see a
different name for the company: Shanghai Sensylink Microelectronics Inc.
Their website has that with the Shanghai dropped.

Also, probably the commit message should contain
Link: https://en.sensylink.com/

pw-bot: changes-requested

Thanks,
Conor.

>    "^sercomm,.*":
>      description: Sercomm (Suzhou) Corporation
>    "^sff,.*":
>=20
> --=20
> 2.55.0
>=20

--DW7VXcYUmFQ8ylSM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCal+VHAAKCRB4tDGHoIJi
0sX2AP4oo3z9DROVtk1PKea0erVM6Ksfz8ObAp2ab2TndL/oVAD+MZjpOMyvH3M0
gvY2tGnXvqqP3J4jicrK7OmfAVU3cgc=
=KjUj
-----END PGP SIGNATURE-----

--DW7VXcYUmFQ8ylSM--
