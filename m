Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D344C2989BC;
	Wed, 11 Feb 2026 21:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770846018; cv=none; b=AngXm3/EB/kPS9rmdgSDywZQvHiSHYb7Kc/ViSFRM389bZcZiF33pyI2us9FYjMXRO/HzVy4kYr/mn/cLGmodQIV5QrCX8BxHaVfNqJ/OK/Y2K1Ij8AJf8dLgOuKgghHypWMm0Th+8eRtztAv7zf9A/Y/34DqIyQkhFiWU8fZms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770846018; c=relaxed/simple;
	bh=1ON6GaGmF0/TaofBjCmUtGuI5mGNnmlfjg25WlFka0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkXU3hjHt7rEBHjC+ues9Pu6yJmZcpb+CKu24NwLvZW+cL5vAN3nM81qKxIVnlGNL2JGa+mq7qKKycFbJLPe4+c+duEcE0ZXczTL59JYBSRjRD72xVONpvLRT6ussSzkz9tSYiC/yfY3PPC4OHQVyln/1qsT4xdQDBOj3RzPnWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4lZwcRc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4lZwcRc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3969BC4CEF7;
	Wed, 11 Feb 2026 21:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770846018;
	bh=1ON6GaGmF0/TaofBjCmUtGuI5mGNnmlfjg25WlFka0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F4lZwcRcUBYW9l/AHoM9PNyTTcHFmOa8WygnosvJeEFr7KKXNim/zPeLJ0qTd+719
	 XWekh9fPI8kGwCddMISXJLRDBL+hUkoRB+mzwzLy7WYqJ9CJk7wYtmVfg9WsSxEOvC
	 1bKG8mcY0FJHPSChbkXYYBJtp4JHgNJSDoTYOaMJM6EkipECU5TcCqH8npxQvD6v17
	 03utrnXm7hThQLg24XREuALXP3MrMkKkTYC8TzDs+gYYk1VAWiUTDTYxu/cwjzC3B7
	 217aqVy5vYFMSM3c1DjAFloUj25HPzW0LQaMfqW/Ybrfj5fsMnu1W16ZJOMIThaMq5
	 +Ult7sVr31n8Q==
Date: Wed, 11 Feb 2026 15:40:17 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com,
	tali.perry1@gmail.com, linux@roeck-us.net, krzk+dt@kernel.org,
	conor+dt@kernel.org, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, openbmc@lists.ozlabs.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: hwmon: convert npcm750-pwm-fan to DT
 schema
Message-ID: <20260211214017.GA3930589-robh@kernel.org>
References: <20260210154117.1126857-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210154117.1126857-1-tmaimon77@gmail.com>

On Tue, Feb 10, 2026 at 05:41:17PM +0200, Tomer Maimon wrote:
> Convert the Nuvoton HWMON PWM and FAN controllers binding to schema
> format.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/hwmon/npcm750-pwm-fan.txt        |  88 ------------
>  .../bindings/hwmon/npcm750-pwm-fan.yaml       | 132 ++++++++++++++++++
>  2 files changed, 132 insertions(+), 88 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml


> diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml
> new file mode 100644
> index 000000000000..954ba7d38b93
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml

nuvoton,npcm750-pwm-fan.yaml for filename.

> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NPCM7xx/NPCM8xx PWM and Fan Tach Controller
> +
> +maintainers:
> +  - Tomer Maimon <tmaimon77@gmail.com>
> +
> +description: |

Don't need '|'.

> +  The NPCM7xx/NPCM8xx family includes a PWM and Fan Tachometer controller.
> +  The controller provides up to 8 (NPCM7xx) or 12 (NPCM8xx) PWM channels and up
> +  to 16 tachometer inputs. It is used for fan speed control and monitoring.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm750-pwm-fan
> +      - nuvoton,npcm845-pwm-fan
> +
> +  reg:
> +    maxItems: 2
> +    description: Register addresses for PWM and Fan Tach units.
> +
> +  reg-names:
> +    items:
> +      - const: pwm
> +      - const: fan
> +
> +  clocks:
> +    maxItems: 2
> +    description: Clocks for the PWM and Fan Tach modules.
> +
> +  clock-names:
> +    items:
> +      - const: pwm
> +      - const: fan
> +
> +  interrupts:
> +    description: |
> +      Contains the Fan interrupts with flags for falling edge.
> +      For NPCM7XX, 8 interrupt lines are expected (one per PWM channel).
> +      For NPCM8XX, 12 interrupt lines are expected (one per PWM channel).

Blank line between paragraphs. Or remove '|' and re-wrap at 80. Same 
problem elsewhere...

> +    minItems: 8
> +    maxItems: 12
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^fan@[0-9a-f]+$":
> +    type: object
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: |
> +          Specify the PWM output channel. Integer value in the range 0-7 for
> +          NPCM7XX or 0-11 for NPCM8XX, representing the PWM channel number.

items:
  items:
    maximum: 11

> +
> +      fan-tach-ch:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array

This is defined as 8-bit.

> +        description: |
> +          The tach channel(s) used for the fan.
> +          Integer values in the range 0-15.

items:
  maximum: 15
 
> +
> +      cooling-levels:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array

already has a type. Drop.

> +        description: |
> +          PWM duty cycle values in a range from 0 to 255 which
> +          correspond to thermal cooling states. This property enables
> +          thermal zone integration for automatic fan speed control
> +          based on temperature.

items:
  maximum: 255

> +
> +    required:
> +      - reg
> +      - fan-tach-ch
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    pwm_fan: pwm-fan@103000 {
> +        compatible = "nuvoton,npcm750-pwm-fan";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        reg = <0x103000 0x2000>, <0x180000 0x8000>;
> +        reg-names = "pwm", "fan";
> +
> +        clocks = <&clk NPCM7XX_CLK_APB3>, <&clk NPCM7XX_CLK_APB4>;
> +        clock-names = "pwm", "fan";
> +
> +        interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pwm0_pins &fanin0_pins>;
> +
> +        fan@0 {
> +            reg = <0>;
> +            fan-tach-ch = <0 1>;
> +            cooling-levels = <64 128 192 255>;
> +        };
> +
> +        fan@1 {
> +            reg = <1>;
> +            fan-tach-ch = <2>;
> +        };
> +    };
> -- 
> 2.34.1
> 
