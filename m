Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A25925BEF8;
	Mon, 16 Mar 2026 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658932; cv=none; b=bOMwQ33chJWDnAiD257aoQisrldq6T1qKwln4ogLUdenEvlgZkWAI4BxdDWql8tVvZZg5TXPwzZMDg+t2S3dqtwvqqEDDY2quciCmHitMAqmlwneF+qGOxKqzhIvgdUyzzh6Lx74U8o40F17p5E8BYTMJCpgiPnvIrvIkxRTRCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658932; c=relaxed/simple;
	bh=2WrmRtPPWS7QjKt1bst/l9hvGi2jFxB3qCVZ5N7Qxv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yjaa+7AnvYDqMftRTtf9tynkA3AKqgNy0LZUoP2YcN6FePNRRHn9KBmy0OZzNX30ewnEsWpSugz7hhsRVbcrZ64gQcxtDM1sua7hCl1hNfKIqy9GtusOWMcxJQlMzTZhsgdk0oGpTXzl0popA3GVvH3Xn2O+qFlmX9xWF1FcT+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQapjEjS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQapjEjS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18340C19425;
	Mon, 16 Mar 2026 11:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773658931;
	bh=2WrmRtPPWS7QjKt1bst/l9hvGi2jFxB3qCVZ5N7Qxv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gQapjEjSFbY1PwcppCIljbexVxu5r+ktpPVEa9yaNjPcqf32mS7XG3cydSQrM4Pg2
	 epUhcc96pmKJf9bsa14PX2jRFBn63gAv/ck2wUzL80/HdRrZTwuvra5uyxAu9Th14q
	 XstDIxts1dBQY1+iGEpxsJYuMujyMGrvQoFsBe9XiAr+vUZT2goJUV8ybToijumRtr
	 ME30R6T8Dm1+U90OGPrc4OYoM519BPK0BWoeBudwmWvNmJ9VQVHzsYjPGeetouQHRV
	 RWAVqRxx0ChVMXLaO3JKEjrNFvBew2L1WlgpUKZT2ovd/ZbjR0h9xB6rAmSablaD9v
	 aX3SfTX1a+61w==
Date: Mon, 16 Mar 2026 11:02:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH v4 1/6] dt-bindings: pinctrl: add NXP MC33978/MC34978 MSDI
Message-ID: <20260316-brick-corrosive-c0ce739651ac@spud>
References: <20260313140218.1213393-1-o.rempel@pengutronix.de>
 <20260313140218.1213393-2-o.rempel@pengutronix.de>
 <20260313-shortwave-baguette-5914f1af60f8@spud>
 <abfgNaCp4VeKZUWE@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GOr+HRVBfYVMkRXD"
Content-Disposition: inline
In-Reply-To: <abfgNaCp4VeKZUWE@pengutronix.de>


--GOr+HRVBfYVMkRXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 11:49:25AM +0100, Oleksij Rempel wrote:
> On Fri, Mar 13, 2026 at 05:16:31PM +0000, Conor Dooley wrote:
> > On Fri, Mar 13, 2026 at 03:02:12PM +0100, Oleksij Rempel wrote:
> ...
> > > +maintainers:
> > > +  - David Jander <david@protonic.nl>
> > > +  - Oleksij Rempel <o.rempel@pengutronix.de>
> > > +
> > > +description: |
> > > +  The MC33978 and MC34978 are Multiple Switch Detection Interface (M=
SDI)
> > > +  devices with 22 switch inputs, integrated fault detection, and ana=
log
> > > +  multiplexer (AMUX) for voltage/temperature monitoring.
> > > +
> > > +  Pin numbering:
> > > +  - Pins 0-13: SG0-SG13 (Switch-to-Ground inputs). These pins monitor
> > > +    contacts closed to ground and typically require GPIO_ACTIVE_LOW
> > > +    flags when used as digital inputs.
> > > +  - Pins 14-21: SP0-SP7 (Programmable inputs). These can be configur=
ed
> > > +    as SG (Switch-to-Ground) or SB (Switch-to-Battery) inputs. SB
> > > +    inputs monitor contacts closed to the battery voltage and typica=
lly
> > > +    require GPIO_ACTIVE_HIGH flags when used as digital inputs.
> > > +
> > > +  Output Emulation:
> > > +  The hardware lacks standard push-pull output drivers. Outputs are =
emulated
> > > +  by toggling the programmable wetting current sources (acting as pu=
ll-ups
> > > +  or pull-downs) and the hardware tri-state registers. Because of th=
is
> > > +  physical constraint:
> > > +  - Consumers using pins as outputs MUST flag them with GPIO_OPEN_DR=
AIN or
> > > +    GPIO_OPEN_SOURCE in the device tree.
> > > +  - Push-pull configurations are physically unsupported.
> > > +  - The active polarity depends entirely on the external circuit (e.=
g., how
> > > +    an LED is wired) and must be flagged accordingly by the consumer.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - nxp,mc33978
> > > +      - nxp,mc34978
> >=20
> > What's different about these that a fallback is not suitable?
>=20
> The difference are operation temperature ranges. But, it is not
> detectable by software. This information can be reused for the hwmon.

Can you note this in your commit message please?

>=20
> > > +patternProperties:
> > > +  '^.*-grp$':
> > > +    type: object
> > > +    $ref: /schemas/pinctrl/pincfg-node.yaml#
> > > +    additionalProperties: false
> > > +    description: Pin configuration subnodes.
> > > +    properties:
> > > +      pins: true
> >=20
> > This seems overly permissive, think it should only allow the couple of
> > options that your hardware has. Probably just make it an enum? Shouldn't
> > have to check the driver to know what the acceptable pin names are.
>=20
> Some thing like this?
>=20
>       pins:
>         items:
>           enum: [ sg0, sg1, sg2, sg3, sg4, sg5, sg6, sg7, sg8, sg9,
>                   sg10, sg11, sg12, sg13, sp0, sp1, sp2, sp3,
>                   sp4, sp5, sp6, sp7 ]

Yeah.

--GOr+HRVBfYVMkRXD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabfjLgAKCRB4tDGHoIJi
0sV4APwM/hhP6nB8AEEJ+l+y1n0i3Dciru0XcE5FsV3fHWqf9gEAq1xyrNzxRd8C
3Zu4SafwjPsD4RAD4zAAzQxRpmkJvgU=
=e1xM
-----END PGP SIGNATURE-----

--GOr+HRVBfYVMkRXD--
