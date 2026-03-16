Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9503639022A
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 10:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658191; cv=none; b=ooqPSU4xqo3q2MecWZlMc6Ok2ZTvUhs3/HwDYNkJzEDIXoLl6cNCEaFieutdutx1D6qpYEWzfwMOU9P5/hBHaVTy4bVrRsDhkQtYpmdEhto37d3EWity/XlkVAx3zCNLP2ErgqGcz98cuH+Q+yRaOqDSDtAAjivOO3SmjqqYApk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658191; c=relaxed/simple;
	bh=HHOsISjCw6STMOS1IkdFbgNlHwOBzhyTNrxlUafEby4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKgtSa6pqf7r70iy9eCGpKoXXgAuLpF/4+CF4tTNqSPiF91v9WiuYVw4oLQiY6lqf8+1dyLU0tTAdCXo9O1Zp9BS1hTrEl43/2jGmXFbawA4mwa3yzrbxzEuF63HDJw+vQEkWUCqu3V/C7alyl7kBFY98DsZ+RGwvni1Gn2Jw8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w25Vm-0007z9-9V; Mon, 16 Mar 2026 11:49:26 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w25Vl-000YUs-1M;
	Mon, 16 Mar 2026 11:49:25 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w25Vl-00000005Q1P-1Hwo;
	Mon, 16 Mar 2026 11:49:25 +0100
Date: Mon, 16 Mar 2026 11:49:25 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH v4 1/6] dt-bindings: pinctrl: add NXP MC33978/MC34978 MSDI
Message-ID: <abfgNaCp4VeKZUWE@pengutronix.de>
References: <20260313140218.1213393-1-o.rempel@pengutronix.de>
 <20260313140218.1213393-2-o.rempel@pengutronix.de>
 <20260313-shortwave-baguette-5914f1af60f8@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260313-shortwave-baguette-5914f1af60f8@spud>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

On Fri, Mar 13, 2026 at 05:16:31PM +0000, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 03:02:12PM +0100, Oleksij Rempel wrote:
=2E..
> > +maintainers:
> > +  - David Jander <david@protonic.nl>
> > +  - Oleksij Rempel <o.rempel@pengutronix.de>
> > +
> > +description: |
> > +  The MC33978 and MC34978 are Multiple Switch Detection Interface (MSD=
I)
> > +  devices with 22 switch inputs, integrated fault detection, and analog
> > +  multiplexer (AMUX) for voltage/temperature monitoring.
> > +
> > +  Pin numbering:
> > +  - Pins 0-13: SG0-SG13 (Switch-to-Ground inputs). These pins monitor
> > +    contacts closed to ground and typically require GPIO_ACTIVE_LOW
> > +    flags when used as digital inputs.
> > +  - Pins 14-21: SP0-SP7 (Programmable inputs). These can be configured
> > +    as SG (Switch-to-Ground) or SB (Switch-to-Battery) inputs. SB
> > +    inputs monitor contacts closed to the battery voltage and typically
> > +    require GPIO_ACTIVE_HIGH flags when used as digital inputs.
> > +
> > +  Output Emulation:
> > +  The hardware lacks standard push-pull output drivers. Outputs are em=
ulated
> > +  by toggling the programmable wetting current sources (acting as pull=
-ups
> > +  or pull-downs) and the hardware tri-state registers. Because of this
> > +  physical constraint:
> > +  - Consumers using pins as outputs MUST flag them with GPIO_OPEN_DRAI=
N or
> > +    GPIO_OPEN_SOURCE in the device tree.
> > +  - Push-pull configurations are physically unsupported.
> > +  - The active polarity depends entirely on the external circuit (e.g.=
, how
> > +    an LED is wired) and must be flagged accordingly by the consumer.
> > +
> > +allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nxp,mc33978
> > +      - nxp,mc34978
>=20
> What's different about these that a fallback is not suitable?

The difference are operation temperature ranges. But, it is not
detectable by software. This information can be reused for the hwmon.

> > +patternProperties:
> > +  '^.*-grp$':
> > +    type: object
> > +    $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +    additionalProperties: false
> > +    description: Pin configuration subnodes.
> > +    properties:
> > +      pins: true
>=20
> This seems overly permissive, think it should only allow the couple of
> options that your hardware has. Probably just make it an enum? Shouldn't
> have to check the driver to know what the acceptable pin names are.

Some thing like this?

      pins:
        items:
          enum: [ sg0, sg1, sg2, sg3, sg4, sg5, sg6, sg7, sg8, sg9,
                  sg10, sg11, sg12, sg13, sp0, sp1, sp2, sp3,
                  sp4, sp5, sp6, sp7 ]

Best Regards,
Oleksij
--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5=7F555=
 |
