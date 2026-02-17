Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D194B378831;
	Tue, 17 Feb 2026 20:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771359096; cv=none; b=cLXPlBrHhRCnspNtzGwtYL0vd6vpv6y+uns32xFFYNxFCS3Kw0ux+lNj9PxbAnbiQqiFiGuJD18rDGZZao4Zvzk08RQkQOu1t4H94j4hOufAQcmywp+TiACzzJmrgqg4oQCrPkNrASzGYnCHNt2LKS63MBzi209Hw8dlq7vxkFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771359096; c=relaxed/simple;
	bh=VRortkRssClWyauWydKvrhMIGGwcbJExtslqtcY7y80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADV/HMHH98az6ZuM9rxu8kwoE7gaQAnieqe+vEHQuNy8Aoj1bjG6dW/mu1GKDMyhARdRkXdMYI7hdGMZg0JTdlo0zt7ReUER39uqSPln8TrB8tr8RlgW9p47Nj+Z3KFHGfnAPsoi8RIGTkBtJgmNE9+CoZ0iwfbybhAHrZv0+oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFB/SZR5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFB/SZR5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9DEC4CEF7;
	Tue, 17 Feb 2026 20:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771359096;
	bh=VRortkRssClWyauWydKvrhMIGGwcbJExtslqtcY7y80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFB/SZR5UsBV6GN3Tn3cXr4aXLTd++DUOgj9U8rheVXP/p3LnxZzJArqrRNdtyaOz
	 odRF5TZIrsF86DErdirBigDwXpRyVrRv9IDTIBmAyrRZjsaTnWr18FpgQ7WlrEBptu
	 xfOqxpvqaEw+oGT5rk3JECBu9nyFhgWYZ4bPTPINPrja4qhK8PZzp94TNaHEhkHyqh
	 NheWTz2q5nTY2ronvO4jG326GCJim4SWJ2yoQBsf3e4Y1+hHt3Q4pGivEIUgvvEudn
	 EP3YMc5UwJ6USBGGSmPjfizkKMF0KzLR1F4yH3hUCPZLSZ8w0qcj4GZJWh3HJv8NLL
	 u4ThXss64O2aQ==
Date: Tue, 17 Feb 2026 21:11:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Victor Duicu <victor.duicu@microchip.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, marius.cristea@microchip.com
Subject: Re: [PATCH v10 1/2] dt-bindings: hwmon: add support for MCP998X
Message-ID: <20260217-sincere-spotted-lionfish-d7abca@quoll>
References: <20260217-add-mcp9982-hwmon-v10-0-5e0aaae6f289@microchip.com>
 <20260217-add-mcp9982-hwmon-v10-1-5e0aaae6f289@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217-add-mcp9982-hwmon-v10-1-5e0aaae6f289@microchip.com>

On Tue, Feb 17, 2026 at 04:06:13PM +0200, Victor Duicu wrote:
> This is the devicetree schema for Microchip MCP998X/33 and MCP998XD/33D

"Add"

See submitting patches.

> Multichannel Automotive Temperature Monitor Family.

...


> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mcp9933
> +      - microchip,mcp9933d
> +      - microchip,mcp9982
> +      - microchip,mcp9982d
> +      - microchip,mcp9983
> +      - microchip,mcp9983d
> +      - microchip,mcp9984
> +      - microchip,mcp9984d
> +      - microchip,mcp9985
> +      - microchip,mcp9985d
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:

Your interrupt-names say 1 item is correct, so these are de-synced. They
should be always constrained the same way.

> +    maxItems: 2
> +
> +  interrupt-names:
> +    description:
> +      The chip family has three different interrupt pins divided among them.
> +      The chips without "D" have alert-therm and therm-addr.
> +      The chips with "D" have alert-therm and sys-shtdwn.
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum: [alert-therm, therm-addr, sys-shtdwn]
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  microchip,enable-anti-parallel:
> +    description:
> +      Enable anti-parallel diode mode operation.
> +      MCP9984/84D/85/85D and MCP9933/33D support reading two external diodes
> +      in anti-parallel connection on the same set of pins.
> +    type: boolean
> +
> +  microchip,parasitic-res-on-channel1-2:
> +    description:
> +      Indicates that the chip and the diodes/transistors are sufficiently far
> +      apart that a parasitic resistance is added to the wires, which can affect
> +      the measurements. Due to the anti-parallel diode connections, channels
> +      1 and 2 are affected together.
> +    type: boolean
> +
> +  microchip,parasitic-res-on-channel3-4:
> +    description:
> +      Indicates that the chip and the diodes/transistors are sufficiently far
> +      apart that a parasitic resistance is added to the wires, which can affect
> +      the measurements. Due to the anti-parallel diode connections, channels
> +      3 and 4 are affected together.
> +    type: boolean
> +
> +  microchip,power-state:
> +    description:
> +      The chip can be set in Run state or Standby state. In Run state the ADC
> +      is converting on all channels at the programmed conversion rate.
> +      In Standby state the host must initiate a conversion cycle by writing
> +      to the One-Shot register.
> +      True value sets Run state.
> +      Chips with "D" in the name can only be set in Run mode.
> +    type: boolean
> +
> +  vdd-supply: true
> +
> +patternProperties:
> +  "^channel@[1-4]$":
> +    description:
> +      Represents the external temperature channels to which
> +      a remote diode is connected.
> +    type: object
> +
> +    properties:
> +      reg:
> +        items:
> +          maxItems: 1
> +
> +      label:
> +        description: Unique name to identify which channel this is.
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - microchip,mcp9982d
> +              - microchip,mcp9983d
> +              - microchip,mcp9984d
> +              - microchip,mcp9985d
> +              - microchip,mcp9933d
> +    then:
> +      properties:

Missing constraints for interrupt:

> +        interrupt-names:
> +          not:
> +            contains:
> +              const: therm-addr

No, you need to list the items. This *must* be strictly constrained.
It's explicitly requested by writing bindings.

Best regards,
Krzysztof

