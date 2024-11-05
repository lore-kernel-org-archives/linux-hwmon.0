Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDD11E7660;
	Tue,  5 Nov 2024 18:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730831729; cv=none; b=GQ8/IMY2XMlA9H0v2i51zi9qtru9S+PYp6aB9RBrK5F/OVdwL/R9484fKS8l7XBuajaT3d/3vZjVjNmeoyS93lk5HePi9kTi8e46V4GcrHBlpoRtcALg2toN0wuv0uI3XAWBCoN6XOb3zGNcj4Gb/dNI3b/DDwEMDSX8AuYZf1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730831729; c=relaxed/simple;
	bh=bMSQCGFq2evhThsweoqyuAkdfCwXzIXVb15Da3lP4qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyQVClAw6Sp0y4ZBpjXWwU+HxBAZ8ggi0O2T5w8EiI8zs+T/tqk26T8sVoVtTTNAzhZ9Lb4x4phmn4BDrgFb+LEWfVFH+wHv4sgkk3Wjg1m4qBUuVve86PSx/Gyv9sDhl9VJ+IoT5Np94Sx5WnqXDiV2UttLChNKOgE6R8Tt4Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SA7k0fsh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SA7k0fsh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E98C4CECF;
	Tue,  5 Nov 2024 18:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730831729;
	bh=bMSQCGFq2evhThsweoqyuAkdfCwXzIXVb15Da3lP4qA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SA7k0fshvL5dS2I1nSkDVCJN/nEU9rdY4yzqRGiVRBs5fLQwURKO4a245i0r42cs4
	 /h1/UYJgUwLkTUuX5xYO/d6w/lKrKZq+XMnDTvXhE0w0KhUYWqQkFWNvaXOFuXwrEj
	 dGH4ZyatCzMdNZB6m4ipTna6Bh3DEWUE16B3rD0WG3VkV+5uAmNm862BenNBfRaxWG
	 Xxhr6oWDCH/+AYa/7G4hSKZ/awx5NS/Q0dYCeAD1f3Q/rTG4grOY1QdVfZkn5g7cbS
	 RPn4U6fn6XbQ1vu4811msHD1+gWruDDSn3DRZn5p8dNsA41OuCKnzOHywd62wp39M4
	 N7f7bC7kRm9ug==
Date: Tue, 5 Nov 2024 18:35:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Grant Peltier <grantpeltier93@gmail.com>,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
Message-ID: <20241105-imprecise-unharmed-ec1474ad1acc@spud>
References: <cover.1730326915.git.grantpeltier93@gmail.com>
 <1dff1f63a2e122788e2c17f192472705491aa5b8.1730326916.git.grantpeltier93@gmail.com>
 <CAL_JsqJqhxcMu2yeqvJvUOJ_g3uDv3t1JwaMxAfZQGXFj3rAvw@mail.gmail.com>
 <0f855c81-ce0e-41e8-ae08-5f653d3ca8b0@roeck-us.net>
 <CAL_JsqK=kgoKvusMMqdtx7b4z2aveE5O9Q=UHXCgook5UBS4bA@mail.gmail.com>
 <2afabeb7-9cf7-4092-965d-55a9c0762948@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WmC+ioyJ71bF6Ooh"
Content-Disposition: inline
In-Reply-To: <2afabeb7-9cf7-4092-965d-55a9c0762948@roeck-us.net>


--WmC+ioyJ71bF6Ooh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 07:45:38AM -0800, Guenter Roeck wrote:
> On 11/5/24 04:19, Rob Herring wrote:
> > On Mon, Nov 4, 2024 at 7:20=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> > >=20
> > > On 11/4/24 07:08, Rob Herring wrote:
> > > > On Wed, Oct 30, 2024 at 5:41=E2=80=AFPM Grant Peltier <grantpeltier=
93@gmail.com> wrote:
> > > > >=20
> > > > > Add devicetree bindings to support declaring optional voltage div=
iders to
> > > > > the rail outputs of supported digital multiphase regulators. Some
> > > > > applications require Vout to exceed the voltage range that the Vs=
ense pin
> > > > > can detect. This binding definition allows users to define the
> > > > > characteristics of a voltage divider placed between Vout and the =
Vsense
> > > > > pin for any rail powered by the device.
> > > > >=20
> > > > > These bindings copy the vout-voltage-divider property defined in =
the
> > > > > maxim,max20730 bindings schema since it is the best fit for the u=
se case
> > > > > of scaling hwmon PMBus telemetry. The generic voltage-divider pro=
perty
> > > > > used by many iio drivers was determined to be a poor fit because =
that
> > > > > schema is tied directly to iio for the purpose of scaling io-chan=
nel
> > > > > voltages and the isl68137 driver is not an iio driver.
> > > > >=20
> > > > > Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
> > > > > ---
> > > > >    .../hwmon/pmbus/renesas,isl68137.yaml         | 147 ++++++++++=
++++++++
> > > > >    1 file changed, 147 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/hwmon/pmb=
us/renesas,isl68137.yaml
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/renesa=
s,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl=
68137.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..ed659c2baadf
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68=
137.yaml
> > > > > @@ -0,0 +1,147 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +
> > > > > +$id: http://devicetree.org/schemas/hwmon/pmbus/renesas,isl68137.=
yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Renesas Digital Multiphase Voltage Regulators with PMBus
> > > > > +
> > > > > +maintainers:
> > > > > +  - Grant Peltier <grant.peltier.jg@renesas.com>
> > > > > +
> > > > > +description: |
> > > > > +  Renesas digital multiphase voltage regulators with PMBus.
> > > > > +  https://www.renesas.com/en/products/power-management/multiphas=
e-power/multiphase-dcdc-switching-controllers
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > >=20
> > > > Somehow "isl68137" is missing from your list. "make
> > > > dt_compatible_check" reports it as not documented.
> > > >=20
> > >=20
> > > Turns out it is also documented as "isil,isl68137" in trivial-devices=
=2Eyaml
> > > (together with isil,isl69260). Both are referenced in .dts files. How=
 should
> > > that be handled ?
> >=20
> > Move those compatibles here. And this file should be renamed to
> > isil,isl68137.yaml or some other actual compatible value.
> >=20
>=20
> I guess that is a bit more complicated since Renesas acquired Intersil.
> Is there a common guidance explaining how new compatibles should be defin=
ed
> in such situations ?
>=20
> Anyway, I had the patches queued in linux-next. I dropped them until
> this is sorted out.

The old ones with existing compatibles should keep their names, the new ones
should probably match whatever is in their datasheet so that people can
have an easier time.

--WmC+ioyJ71bF6Ooh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyplbQAKCRB4tDGHoIJi
0t9tAP0Zeky4MyfN6WerUHYooW/BMdBZjvewJj2H3t4wKAlKRQEA7nrMXj5xWETF
4rCql8ak8bH5QQXLnEo2jmUAh71a0wM=
=uLS9
-----END PGP SIGNATURE-----

--WmC+ioyJ71bF6Ooh--
