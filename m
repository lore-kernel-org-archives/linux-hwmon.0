Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605FF3AC0D7;
	Thu, 28 May 2026 17:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779990097; cv=none; b=JXmcl/ZTee/aeOIInDF+B1zc7eY0Y0dvKUDk9WYpszLn/fYnigMBYv0pmY+4Bk2bU3L40SfxKzTRRfB/1910Lnrp37mX2fQAKXsUr+eKDl7fxapdQcAJDDIRJk1tKcq7NO4cNjZLfUDDRUsZNYsylvFE2WGkB9a9btk4Vfgzk7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779990097; c=relaxed/simple;
	bh=jWDWyTChKoIviV1tKXi4im9XMN7quiaxxt7XzFkP3FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiTUKNRaGEWxjbxVLbOT6CKJz2XsNE4G3+vZuzpO40dhF9h8ZA+ohqNqpvNw0KE83kfoFpYCHsHx+jq5TnLJnaQ3z7UmprpF1sPgGVxIzZr5UoLQ8MmdB6S1LY8FhUFeWaaPVYdjymbOBpSeEnQCy4t8CHr3Fk1aMclpJeXwXt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWpf7NwB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWpf7NwB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95FD51F000E9;
	Thu, 28 May 2026 17:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779990096;
	bh=6Mscv3dyKk9BmRJdi770v/J+mBXBLTsaNpCsXPcU92s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RWpf7NwB0O+rab7qfh0TMqzYXQNQ0JTqraZo/Bu5LM/iSyP5LBUhqzsvPMCPJtgNh
	 e7wA97sEoMta5347OiQTntyhbCvb9HDvHxKWi3DVp3Vt8h+4pFwwUo6OAWkQVfzoGd
	 PSEW+RQqCRKV1nK07cELKwAJZLAJJdm89B54038i9aJ3aQmfvTkQZ359FFyU+SUdDW
	 Hd2EaR3IFo/u5IN2AanKOOVI9MmHoMtPOKYFhNdexR3FTPHorPUXk2BQN2Qr2btSNC
	 bNYZH2h+jLKnLV4xipa2uCBo1XBltk3X6tDCNg79AYZVte70kbj24ARooBrrMlOIvL
	 5Xf+7IKdzqzZA==
Date: Thu, 28 May 2026 18:41:31 +0100
From: Conor Dooley <conor@kernel.org>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Syed, Arif" <arif.syed@hpe.com>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Message-ID: <20260528-paging-alfalfa-9c3837635192@spud>
References: <20260528173424.87503-1-sanman.pradhan@hpe.com>
 <20260528173424.87503-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R17WgRC3FSG8u/9M"
Content-Disposition: inline
In-Reply-To: <20260528173424.87503-2-sanman.pradhan@hpe.com>


--R17WgRC3FSG8u/9M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 05:34:36PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
>=20
> Add devicetree binding documentation for the Analog Devices MAX20860A
> step-down DC-DC switching regulator with PMBus interface.
>=20
> Both "adi,max20860a" and "maxim,max20860a" compatible strings are
> supported. The MAX20860A was originally manufactured by Maxim Integrated,
> now part of Analog Devices.
>=20
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
> v2:
>   - Added allOf regulator.yaml reference and unevaluatedProperties

>   - Added "maxim,max20860a" as alternative compatible

No, please delete this.
I don't remember what the policy that ADI use for things that used to be
maxim products, but just pick one compatible for this device. I have a
feeling they want adi to always be used in these cases.

pw-bot: changes-requested

>=20
>  .../bindings/hwmon/pmbus/adi,max20860a.yaml   | 47 ++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max=
20860a.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.=
yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml
> new file mode 100644
> index 000000000000..f7eeb30f11b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/adi,max20860a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices MAX20860A Step-Down Converter
> +
> +maintainers:
> +  - Sanman Pradhan <psanman@juniper.net>
> +
> +description: |
> +  The MAX20860A is a fully integrated step-down DC-DC switching regulator
> +  with PMBus interface for monitoring input/output voltage, output curre=
nt
> +  and temperature.
> +
> +  Datasheet: https://www.analog.com/en/products/max20860a.html
> +
> +allOf:
> +  - $ref: /schemas/regulator/regulator.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,max20860a
> +      - maxim,max20860a

And for future reference, please use fallback compatibles when dealing
with devices that have the same programming mode.

Cheers,
Conor.

--R17WgRC3FSG8u/9M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahh+SwAKCRB4tDGHoIJi
0iKGAP0SFOOl0b3tC1ho14Gd2eEUTqX9/6cBV5YLvIjTUl3DPwD+Mopyt1J6yIPy
MMiAkePD+ofylOkR2UPURwnz/lsNEA8=
=1G8j
-----END PGP SIGNATURE-----

--R17WgRC3FSG8u/9M--
