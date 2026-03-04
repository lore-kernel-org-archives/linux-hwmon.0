Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF1F351C36;
	Wed,  4 Mar 2026 07:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611185; cv=none; b=KMZ4NkwCBECeZkPKzqjm7YW3aomCYy1up9GlGE30mfZMeq+M6bzoof8ewHVQPsbLKvtQ0beeJGkb4Zj4oZ0xRkcG218w2opP5mMm+p7h0oSwRq2yeWvj05yJq21MVEJMHDl7WgaZINVo/ggKHTi3tTAsPy39RBLgXOvYa3LtmWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611185; c=relaxed/simple;
	bh=sXxkucJhzBsmj5GZg9EW7DJVOjewv5IYmNMzVOziemc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgGpM7hknL3B5kdkPVW6auCKFbz/PmvqMJYhZ0DTSBMizpvi/W/WVRSXXplYPvn1rJJVn2J/blRib7HobTSbBF+1vXo9nWMB8jnMd8FeN5Bl5Yx76s+hmKUBnc6EbNBaW2z0030BB3dUXLiG5urLrnwsD3AIgneAo8Xz/XFgdjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4yUDowT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4yUDowT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB29C19423;
	Wed,  4 Mar 2026 07:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772611184;
	bh=sXxkucJhzBsmj5GZg9EW7DJVOjewv5IYmNMzVOziemc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4yUDowTfd81DMsLBlK7uOaNQ/FX4mVq4+VgNrW6lsw6rIGhdbBtLFDQjKgsd1/CH
	 RAxA5TLuckHQfZRRloIRa18GYP5ABSlsTAuEg83xVSXhg25q5SdwxQ9gz6qjhhPoWl
	 ChBYXUOIQVAvWv3iXJGEz8nAHWxtHcqFZvdLPq4bn0NltuOiyCFqSeSLFaMJ7fbDFj
	 +1qWiOV2khaZ7G7OdXTSQ/URcTVypWiadGa3T1x3QS+QugDpJzyqp8N+EkdjhkIP+E
	 hSaRKRaIapgoP/O5g9rRJ0/uDGpazocLUzarpj/7Rr0g9ki7uPDTKFjlxT4nWPMGp5
	 jrCmOMFOfR1kA==
Date: Wed, 4 Mar 2026 08:59:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
Message-ID: <20260304-bald-flashy-cuckoo-00a3e6@quoll>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
 <20260303133947.1123575-2-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303133947.1123575-2-o.rempel@pengutronix.de>

On Tue, Mar 03, 2026 at 02:39:41PM +0100, Oleksij Rempel wrote:
> +  '#mux-control-cells':
> +    const: 0
> +    description:
> +      Present if the device AMUX selector is used as a mux provider.
> +      Consumers (e.g. io-channel-mux) must provide settle-time-us for the
> +      external ADC sampling path.
> +
> +  vddq-supply:
> +    description: Digital supply voltage
> +
> +  vbatp-supply:
> +    description: Battery/power supply
> +
> +patternProperties:
> +  "^pinctrl(@.*)?":

Drop @ part. Your binding does not allow addressing anyway.

> +    type: object
> +    $ref: /schemas/pinctrl/nxp,mc33978-pinctrl.yaml#
> +    description:
> +      Pinctrl and GPIO controller child node for the 22 switch inputs.
> +
> +required:
> +  - compatible
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - interrupts
> +  - reg

Odd order. Keep the same as in the list of properties.

> +  - vbatp-supply
> +  - vddq-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        msdi: gpio@0 {
> +            compatible = "nxp,mc33978";
> +            reg = <0>;
> +            spi-max-frequency = <4000000>;
> +
> +            interrupt-parent = <&gpiog>;
> +            interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +
> +            vddq-supply = <&reg_3v3>;
> +            vbatp-supply = <&reg_12v>;
> +
> +            #mux-control-cells = <0>;
> +
> +            pinctrl {
> +                compatible = "nxp,mc33978-pinctrl";
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +            };
> +

Stray blank line

> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> new file mode 100644
> index 000000000000..f8257d55d466
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nxp,mc33978-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP MC33978/MC34978 Pinctrl/GPIO Driver
> +
> +maintainers:
> +  - David Jander <david@protonic.nl>
> +  - Oleksij Rempel <o.rempel@pengutronix.de>
> +
> +description: |
> +  Pin control and GPIO driver for the MC33978/MC34978 MSDI device.
> +
> +  Pin numbering:
> +  - Pins 0-13: SG0-SG13 (Switch-to-Ground inputs). These pins monitor
> +    contacts closed to ground and typically require GPIO_ACTIVE_LOW
> +    flags when used as digital inputs.
> +  - Pins 14-21: SP0-SP7 (Programmable inputs). These can be configured
> +    as SG (Switch-to-Ground) or SB (Switch-to-Battery) inputs. SB
> +    inputs monitor contacts closed to the battery voltage and typically
> +    require GPIO_ACTIVE_HIGH flags when used as digital inputs.
> +
> +  Output Emulation:
> +  The hardware lacks standard push-pull output drivers. Outputs are emulated
> +  by toggling the programmable wetting current sources (acting as pull-ups or
> +  pull-downs) and the hardware tri-state registers. Because of this physical
> +  constraint:
> +  - Consumers using pins as outputs MUST flag them with GPIO_OPEN_DRAIN or
> +    GPIO_OPEN_SOURCE in the device tree.
> +  - Push-pull configurations are physically unsupported.
> +  - The active polarity depends entirely on the external circuit (e.g., how an
> +    LED is wired) and must be flagged accordingly by the consumer.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,mc33978-pinctrl
> +      - nxp,mc34978-pinctrl
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  ngpios:
> +    const: 22
> +
> +patternProperties:
> +  "^.*-grp$":
> +    type: object
> +    $ref: pincfg-node.yaml#
> +    additionalProperties: false
> +    description:
> +      Pin configuration subnodes.
> +    properties:
> +      pins: true
> +      bias-pull-up: true
> +      bias-pull-down: true
> +      bias-high-impedance: true
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +unevaluatedProperties: false

additionalProperties instead

> +
> +examples:
> +  - |
> +    pinctrl {
> +        compatible = "nxp,mc33978-pinctrl";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        ngpios = <22>;
> +
> +        door-grp {
> +            pins = "sg0";
> +            bias-high-impedance;
> +        };
> +    };
> -- 
> 2.47.3
> 
