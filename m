Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [94.124.121.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59468389107
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.124.121.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615276; cv=none; b=gCm5kjNacbPhp6NCx4e/GvAe2lYMtP2aaBFszi7mw8XIsAherbz6MeGcwxxSXK2UQ3qDWUqqouu7wge0fWAcP58SCoESvyzjQtL2s2T022il5Lv93g10nOVfDCDc6IkmPq7T7U3GcvLZsnnMU19EnpS/sCOdEnlnWDkuGsAEc50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615276; c=relaxed/simple;
	bh=HzGhRH94uYQhm+jiWYn+DKKu4qjvpXaVupl5oLLTzEA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ii/eqLxtRiGuuy+DnlvWyyLi0LtGjwNXb/qYdX6Xa3k/KoLOsHpU8AkJnPwi5iTVpGNVatWIhnB3htHwZH4wQtQaf2kvJKXMky+Juhc+WSG9ACtvHhCe+Sz9ER36S+TkNvSpHQAzVEPToMl0MVXVBqZYzAOGZONw7qWHzuqq3rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl; spf=pass smtp.mailfrom=protonic.nl; dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b=Xwx9n+xa; arc=none smtp.client-ip=94.124.121.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b="Xwx9n+xa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=ANgf0NirWa/yPqZ74gRfT33LDkbxijfweyinRAYArLg=;
	b=Xwx9n+xaFIhq1CObs4uX0c/ShhFw6TqnK1+/PvKSZcM0go5tDwJUPghr/UHqI5Lpw22ejAKMy6TDR
	 E2zysWfgMZRPnEGAkM6GLHuOyoUNofUEAiu99erPrqsxMLmP5S5BD2kINOoQf+5dPhlO31yQMUyXRk
	 zlwJDYie0pVavdchPu+bZjUk8xY1waITkH4HCSxAki+aMxteC04nmLL7S3lyvysT42aMSre04j+GPE
	 UJawikvRkDA3Zu67ej7X5DXJiPNo6JNYW9t4CX7/oqpKjMEAGyrW9scckueCbV2EDQ6r8IJ+LqKlJP
	 mj1eTjouyzWZff0wnrUnfVgDbEaBfgw==
X-MSG-ID: 76524656-17a9-11f1-9155-005056817704
Date: Wed, 4 Mar 2026 10:06:42 +0100
From: David Jander <david@protonic.nl>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, "Rob Herring (Arm)"
 <robh@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Rosin
 <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>,
 linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
Message-ID: <20260304100642.44d00b99@erd003.prtnl>
In-Reply-To: <20260304-graceful-sweet-bittern-98efdb@quoll>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
	<20260303133947.1123575-2-o.rempel@pengutronix.de>
	<177254885509.3251575.14819823286886805862.robh@kernel.org>
	<aacH7NmkOzZued0Y@pengutronix.de>
	<20260304-graceful-sweet-bittern-98efdb@quoll>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hi Krzysztof,

On Wed, 4 Mar 2026 09:05:11 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Tue, Mar 03, 2026 at 05:10:20PM +0100, Oleksij Rempel wrote:
> > Hi Krzysztof and Rob,
> > 
> > On Tue, Mar 03, 2026 at 08:40:55AM -0600, Rob Herring (Arm) wrote:  
> > > >  .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 114 ++++++++++++++++++
> > > >  .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 +++++++++++++
> > > >  2 files changed, 196 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> > > >   
> > > 
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > > 
> > > yamllint warnings/errors:
> > > 
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> > > 	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
> > >   
> > 
> > Folding the mux node into the parent as suggested [1] causes this error.
> > Because the parent now has #mux-control-cells, the generic
> > mux-controller.yaml forces the node name to be mux-controller. Since
> > this chip is primarily a switch/GPIO controller, naming the parent SPI
> > node mux-controller@0 is misleading.
> > 
> > What is the preferred way to go here?  
> 
> https://www.nxp.com/products/interfaces/multi-switch-detection-interface/22-i-o-msdi-programmable-current-analog-mux:MC33978
> 
> Name of the mc33978 device is "programmable analog mux" and further
> description says "analog multiplexer for reading analog inputs ", so I
> don't find "mux-controller" a confusing name. It is EXACTLY a
> mux, so mux-controller.

Sorry to chime in here. I'm afraid the NXP description on that link you posted
is a typo. It is not correct. This chip is primarily a "Switch Detection
Interface", or in other wordt a switch input interface. Wee here for the same
page for the MC34978, which is the exact same chip:

https://www.nxp.com/products/interfaces/multi-switch-detection-interface/switch-detection-interface-22-i-os-programmable-wetting-current-temp-sensor-3-3-v-5-0-v-spi:MC34978

It has an additional function that can be used as an analog MUX, but it is an
extra feature and definitely NOT its primary function.

Not sure if this is relevant, but I fear there might be some confusion.

Best regards,

> Anyway if you want gpio, then please add a patch extending the pattern
> in mux-controller.yaml to allow "gpio".
> 
> Alternative, because it is rather a mux than a controller of a mux,
> would be to call it just "mux" or "io-mux" (maybe the latter, since we
> have "i2c-mux" in the spec) and allow that pattern to be in
> mux-controller.
> 
> 
> Best regards,
> Krzysztof

-- 
David Jander
