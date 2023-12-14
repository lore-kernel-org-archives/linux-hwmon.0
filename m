Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B8B5EE77;
	Thu, 14 Dec 2023 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FoDeJCzJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECA9C433C9;
	Thu, 14 Dec 2023 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702569991;
	bh=wkImo7XAo+VFQNn4C2g8MW4Pkzbmlf9isLTuwH9Lfi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FoDeJCzJfBNnIjHGFgcZ80PxKHztgEM0fWwFOIJzdaBdwxN62LZzsR5kLsf8AKPga
	 VryBRijy6u5mbsp/gUNm+Q8zhhqR3fceEeUQhwKB+dUaNeYSYch8QWWi+8mmPz/EfE
	 nrwcB1ev8ib2YMnxlVgaE6nA2I9caLhGdhgvluo8YAhYzVLSbG7nIj5pbmfSIHayw0
	 WN8sD0ynvazEivztc/VPUHlXYAPwr48yfRuWr14EIta2qWkf+ZPBq3N3cPNEdLF6kG
	 oL8ObkSXLdVB3ccKmxHOVS4Prqa7QR3N9erkpGjvp6Mt2CtvAntMGmq6wanhNunFD3
	 9pFhIMptUdbfQ==
Date: Thu, 14 Dec 2023 16:06:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: linux@roeck-us.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jdelvare@suse.com, corbet@lwn.net, broonie@kernel.org,
	naresh.solanki@9elements.com, vincent@vtremblay.dev,
	patrick.rudolph@9elements.com, luca.ceresoli@bootlin.com,
	bhelgaas@google.com, festevam@denx.de,
	alexander.stein@ew.tq-group.com, heiko@sntech.de,
	jernej.skrabec@gmail.com, macromorgan@hotmail.com,
	forbidden405@foxmail.com, sre@kernel.org, linus.walleij@linaro.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	cosmo.chou@quantatw.com
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: add Astera Labs
 PT5161L
Message-ID: <20231214-oblivion-hardship-88c20287c235@spud>
References: <20231214060552.2852761-1-chou.cosmo@gmail.com>
 <20231214060552.2852761-3-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mmP3xN3OuvnzrPEQ"
Content-Disposition: inline
In-Reply-To: <20231214060552.2852761-3-chou.cosmo@gmail.com>


--mmP3xN3OuvnzrPEQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 02:05:51PM +0800, Cosmo Chou wrote:
> Add dt-bindings for pt5161l temperature monitoring.
>=20
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
> index c3190f2a168a..bc3ab1aedb12 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -47,6 +47,8 @@ properties:
>            - adi,lt7182s
>              # AMS iAQ-Core VOC Sensor
>            - ams,iaq-core
> +            # Temperature monitoring of Astera Labs PT5161L PCIe retimer
> +          - asteralabs,pt5161l
>              # i2c serial eeprom (24cxx)
>            - at,24c08
>              # i2c trusted platform module (TPM)
> --=20
> 2.34.1
>=20

--mmP3xN3OuvnzrPEQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXsoAAAKCRB4tDGHoIJi
0nJ7AP9asMPcDeniZcuWs68i/FvZjusH9RTTcm8cxLERZVERFwD8DODimEi0aeSX
zQ66xDBM2nM29FFP5zjaSiJKhbigegU=
=r+7G
-----END PGP SIGNATURE-----

--mmP3xN3OuvnzrPEQ--
