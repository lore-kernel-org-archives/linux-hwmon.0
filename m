Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C8E3750CB;
	Mon, 24 Aug 2026 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787590812; cv=none; b=ruWlEx12X0MY0P1QMXM48ciUPLRWmC2uEdsM1eMgNOYzfFejj2GMLUomcRGSbHdcvnWf+ksgRyXaRGP1R/YX3HPm6FgENVddtAC/tSYeDWdP/qvS4RKsQbhqeKZiymWUFqXHBmabuvv9HYgpZ5ZqxVxhurGyMaCX2FHq2w71JkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787590812; c=relaxed/simple;
	bh=m0pGvoGKqFFa4fJPRRTh+DIFuLPs8Wi9Rx8mt+EGeWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJSORmccePmzPBVW3BwXDFJ18A0na6lF23jBw3amkcBhpr/cKozhKiw9JRonKMA4T77YJxzxSmZdczBcCZoYW19lCFQugRS6rFzQRQOc30VTLAFWkTtO5yizpoq403Ik1nngcXmgCodUB7mmu45NYMfNqVbYix5MnnngGlBbALk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkHpo3Hv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkHpo3Hv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E79B1F00A3D;
	Mon, 24 Aug 2026 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787590810;
	bh=0iQZtq/06HuVi0Cnk5yLnj5kQcM3jND8hKuQqwUer0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jkHpo3HvT12iIkkuq25fu+CEOjpJDnncEUxBU3g/oEVaaKLyKQKKAM7eBpZom5mb1
	 UJKe55hDyNopLYSbrymIZz5LBoEv4F0faSNlY4wH69NEwGkoLV1rqyfYH10slT+B8l
	 bDDOvz4T0v2qQ5GH5BRzNaZEPtoQQaTNoaqCQyWQFbTkwYOce+LJwMYCIAhBNPANlD
	 CBT1ZRRfKQjvDTgBGNkcYBpXO2a2Tm1wNhnX7N8S3m94Je4p8C/x5a/VsuMHMBdQaG
	 rw4gsigkZKHen0XfSLBtv/PcS5HeTh7tS84JEmeI4MxuluMFAw105zInmwJ/GKPQOI
	 RBDHygm5jT86w==
Date: Mon, 24 Aug 2026 18:00:06 +0100
From: Conor Dooley <conor@kernel.org>
To: vjardin@free.fr
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: microchip,emc2305: add vcc-supply
 and #cooling-cells
Message-ID: <20260824-flashcard-renewably-badc0e011949@spud>
References: <20260824-for-upstream-dt-emc2305-vcc-cooling-v1-1-cd3b53dfb5d4@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qad3kUMeTf4JW6rQ"
Content-Disposition: inline
In-Reply-To: <20260824-for-upstream-dt-emc2305-vcc-cooling-v1-1-cd3b53dfb5d4@free.fr>

--Qad3kUMeTf4JW6rQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 05:42:59PM +0200, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
>=20
> Both properties are missing, so a board that supplies either fails with
> dtbs_check:
>=20
>   fan-controller@2c (microchip,emc2305): '#cooling-cells', 'vcc-supply'
>   do not match any of the regexes: '^fan@[0-4]$', '^pinctrl-[0-9]+$'
>=20
> The #cooling-cells property belongs to the controller node, which is
> where the driver actually registers.
>=20
> Two cells is what that registration needs: a cooling-maps entry
> references the fan as <&emc2305 min max>.
>=20
> Two cells also documents what the driver supports today. The
> pwm-separate path registers one cooling device per PWM against the same
> node, and they all get cdev_id 0, so no cell count can tell them apart.
> That is a driver issue, noted here but not addressed.
>=20
> The examples in this binding put that property on the fan@N subnodes
> instead, which does not match what the driver does: they are left alone
> here rather than changed blind.

That seems correct though and putting it in the device node when there's 4
fans that could interact with different zones seems wrong. Shouldn't the
driver be fixed instead?

> vcc-supply describes the chip's own rail, which matters on boards where
> the sensor sits behind a switched supply.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.ya=
ml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> index 8c2548539d7fd..47640214de100 100644
> --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> @@ -44,6 +44,11 @@ properties:
>             - 0 (Open-Drain)
>             - 1 (Push-Pull)
> =20
> +  vcc-supply: true
> +
> +  "#cooling-cells":
> +    const: 2
> +
>  patternProperties:
>    '^fan@[0-4]$':
>      $ref: fan-common.yaml#
>=20
> ---
> base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
> change-id: 20260824-for-upstream-dt-emc2305-vcc-cooling-251655c99ef8
>=20
> Best regards,
> --=20
> Vincent Jardin <vjardin@free.fr>
>=20
>=20

--Qad3kUMeTf4JW6rQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaox4lgAKCRB4tDGHoIJi
0pH0AQDMAyBy97dRC/xHLvoSY/pG34asw8zUpXooByN18iWoPAD/W9aWkyf37bLf
q2dD8397c4nXklll+9solKDzoojFdwM=
=wIzG
-----END PGP SIGNATURE-----

--Qad3kUMeTf4JW6rQ--
