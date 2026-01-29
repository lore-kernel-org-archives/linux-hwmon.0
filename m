Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC19E23D7FB;
	Thu, 29 Jan 2026 16:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769704947; cv=none; b=Ho0NfnpevVuVAQ3QZk7kWhMu6pJjdTzC7FupYDe93YXU51hzc7OMUrg7e4Fa280CovhoCIs8B/mCXgAlJoQcFBKxES9Ywcpe3ibiJTTJY0FHKzpo2RChUTV1URgn9MlbM6hZDAR6mjj139zAkGXSDSY3oaeMZMgGpoGXq7b9wEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769704947; c=relaxed/simple;
	bh=MjSJtMvZpbLeRi5hKFATkbKnCdhgimVWL1xQigfa44c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQ9bFIccUS16g0lLpUmyDLF9EHvbaleos2wbJWFyJUfemp4WbWE41lCm7bbYzM8ony1S980Qs/dut0DYw2VjAkqA3wDnsMv5bgeB+OXE2bfp4dv9qfpNVfwRmxGhMEzZYJ7OlW7mTDTJHeXR0GuL7NOCfo2DjjZrYQLOr0d3XdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lp6WJh3c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lp6WJh3c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C40C116D0;
	Thu, 29 Jan 2026 16:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769704947;
	bh=MjSJtMvZpbLeRi5hKFATkbKnCdhgimVWL1xQigfa44c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lp6WJh3clUn8xDF2MaDqthFZpJrwkg0byUJTaldvgPvmWoaAdtrGpx3qWicjaYqIR
	 Hw/LMb7/NL8w/+Iq27KkeqZ2l5rCH9RjyulAQt7eRNxPy1A6JX1vY7nTTlkdmuStnl
	 owaDjndIWL2lcQPQY6lWsEc5kz6nUI+tWhKABl0oaFx2qrPSDUHFYGm6WX+xwbG6mV
	 PHUmvLBSS+ENdBYlxxHdQsFCXDqe1wXXucK7bnKTKgIJixtsfs9MR+TnN7yIXKl6Yo
	 /0gvRqRTYb8jnQrDUanA7TeEDpFDhTU6w8T/rYxl8PtgDQM3QhAroJjVaVCeJuIoze
	 M7tdyVImiVD6g==
Date: Thu, 29 Jan 2026 16:42:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Huan He <hehuan1@eswincomputing.com>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com
Subject: Re: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT
 sensor
Message-ID: <20260129-unpainted-educated-3017ed90c817@spud>
References: <20260128101400.859-1-hehuan1@eswincomputing.com>
 <20260128101636.914-1-hehuan1@eswincomputing.com>
 <20260128-amperage-handstand-36fa4b3ec447@spud>
 <372016a8.2e10.19c07b74792.Coremail.hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g6ZhVvMwrvslNMWu"
Content-Disposition: inline
In-Reply-To: <372016a8.2e10.19c07b74792.Coremail.hehuan1@eswincomputing.com>


--g6ZhVvMwrvslNMWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 11:06:17AM +0800, Huan He wrote:
> > >=20
> > > Add device tree binding documentation for ESWIN EIC7700 Process, Volt=
age
> > > and Temperature sensor.
> > >=20
> > > The EIC7700 SoC integrates two PVT instances for monitoring SoC and D=
DR
> > > power domains respectively.
> > >=20
> > > Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> > > Signed-off-by: Huan He <hehuan1@eswincomputing.com>
> > > ---
> > >  .../bindings/hwmon/eswin,eic7700-pvt.yaml     | 70 +++++++++++++++++=
++
> > >  1 file changed, 70 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/hwmon/eswin,eic=
7700-pvt.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pv=
t.yaml b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
> > > new file mode 100644
> > > index 000000000000..f4ba228924fe
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
> > > @@ -0,0 +1,70 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/hwmon/eswin,eic7700-pvt.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: ESWIN EIC7700 PVT Sensor
> > > +
> > > +maintainers:
> > > +  - Yulin Lu <luyulin@eswincomputing.com>
> > > +  - Huan He <hehuan1@eswincomputing.com>
> > > +
> > > +description:
> > > +  ESWIN EIC7700 SoC integrates embedded process, voltage and tempera=
ture
> > > +  sensors to monitor the internal SoC environment. The system includ=
es two
> > > +  PVT sensor instances. The PVT0 monitors the main SoC power domain.=
 The
> > > +  PVT1 sensor monitors the DDR core power domain.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/hwmon/hwmon-common.yaml#
> >=20
> > FYI, including this is kinda pointless because you have the label
> > property defined below and your "additionalProperties: false" blocks
> > shunt-resistor-micro-ohms from being used.
>=20
> I plan to keep the $ref: /schemas/hwmon/hwmon-common.yaml in use, change
> the original additionalProperties: false to unevaluatedProperties: false,
> and remove the label definition from our schema since it is already
> provided by hwmon-common.yaml. Could you please confirm if this
> modification conforms to the community standards?

That's fine. Does the shunt resistor property apply on your platform?

--g6ZhVvMwrvslNMWu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXuN7gAKCRB4tDGHoIJi
0pswAQDqAtHzV3m8hgEKWpJNXIH6FLzWxTmnfQGnTQwIrw9fngEA6Ty1ED1GMtw/
qVRlKSeSGCot+fVl1k1IlgjONoXujwI=
=CO+l
-----END PGP SIGNATURE-----

--g6ZhVvMwrvslNMWu--
