Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EC53EA83;
	Tue, 22 Oct 2024 20:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729630290; cv=none; b=qT0xP2mdrL3p8zNZmleEsQVNJbJVG6ZBAUsz/d2b/2r9phbRX7lx/IatZFjPeRQkkMTQMEYRjZ0PlyyIqra0jWF/kA7ge5NcVxcZcTkBQuA0uj6XAPV3mxhRBzJbG/OMN40+FHA3eH1WUVpGKm9bhIaOVG1NZjAz75Rhx6NLBHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729630290; c=relaxed/simple;
	bh=T7ynAVUY7DBCuv9NfDUAka/Z40tskGF/joAaV59XcUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpcA4U7lWzbq8nALI9LXmU3Z/+KqXsA3LDiw2Prsk65oecFxfzGjdqKihqB33KEym02vRhNO1r5OXiVgc9pSzaj0jUJ8rQG73gi6NZVaIXMAZ/Z814uTdpXL6e7qUIs9ogDKzWxjcKUTkBJkmqkjDEw0Htd9picIkL1Zljcph1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knKEmJZS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knKEmJZS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942B2C4CEC3;
	Tue, 22 Oct 2024 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729630289;
	bh=T7ynAVUY7DBCuv9NfDUAka/Z40tskGF/joAaV59XcUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knKEmJZSYqLQIaaZtBeoA41e4uMeb1eqHSRrGS7kcS/+Jfxekw/2eakFDBBQKzZez
	 /NXwau8cr/9XvQmLfD+Oi6y0n+7jvK+9ktTVjiYfQD3uiNqOSrNHATLxPhUiwHhBib
	 EUSxFkiBfIe71nS+MYEND4mul3aAop5nIpWeIXPj0aFMykCu4b4qYZbkXF2+r094KI
	 lW/c7X5GHxsIaSZv4LDwDnjtqtYP6iYuZwNQwdwYkO9ZJSco8oYUfCIcs+ytFy+UST
	 UjVtxyfwyy3arDvWIpxqpQkD0oOg03rFr+dJQwo2QkFc8xRd94TK4p7LqoavNu3gex
	 Kw0Sg/jaSXsaA==
Date: Tue, 22 Oct 2024 15:51:28 -0500
From: Rob Herring <robh@kernel.org>
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: linux@roeck-us.net, geert+renesas@glider.be, magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
Message-ID: <20241022205128.GA1535894-robh@kernel.org>
References: <cover.1729622189.git.grantpeltier93@gmail.com>
 <858d8af3ae9d15b62e36dc3deb50275f9c9869b0.1729622189.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <858d8af3ae9d15b62e36dc3deb50275f9c9869b0.1729622189.git.grantpeltier93@gmail.com>

On Tue, Oct 22, 2024 at 02:25:39PM -0500, Grant Peltier wrote:
> Add devicetree bindings to support declaring optional voltage dividers to
> the rail outputs of supported digital multiphase regulators. Some
> applications require Vout to exceed the voltage range that the Vsense pin
> can detect. This binding definition allows users to define the
> characteristics of a voltage divider placed between Vout and the Vsense
> pin for any rail powered by the device.
> 
> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
> ---
>  .../hwmon/pmbus/renesas,isl68137.yaml         | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
> new file mode 100644
> index 000000000..12004da53
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/pmbus/renesas,isl68137.yaml
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Digital Multiphase Voltage Regulators with PMBus
> +
> +maintainers:
> +  - Grant Peltier <grant.peltier.jg@renesas.com>
> +
> +description:

You need '>' to preserve paragraphs.

> +  Renesas digital multiphase voltage regulators with PMBus.
> +
> +  https://www.renesas.com/en/products/power-management/multiphase-power/multiphase-dcdc-switching-controllers
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,isl68137
> +      - renesas,isl68137
> +      - renesas,isl68220
> +      - renesas,isl68221
> +      - renesas,isl68222
> +      - renesas,isl68223
> +      - renesas,isl68224
> +      - renesas,isl68225
> +      - renesas,isl68226
> +      - renesas,isl68227
> +      - renesas,isl68229
> +      - renesas,isl68233
> +      - renesas,isl68239
> +      - renesas,isl69222
> +      - renesas,isl69223
> +      - renesas,isl69224
> +      - renesas,isl69225
> +      - renesas,isl69227
> +      - renesas,isl69228
> +      - renesas,isl69234
> +      - renesas,isl69236
> +      - renesas,isl69239
> +      - renesas,isl69242
> +      - renesas,isl69243
> +      - renesas,isl69247
> +      - renesas,isl69248
> +      - renesas,isl69254
> +      - renesas,isl69255
> +      - renesas,isl69256
> +      - renesas,isl69259
> +      - renesas,isl69260
> +      - renesas,isl69268
> +      - renesas,isl69269
> +      - renesas,isl69298
> +      - renesas,raa228000
> +      - renesas,raa228004
> +      - renesas,raa228006
> +      - renesas,raa228228
> +      - renesas,raa229001
> +      - renesas,raa229004
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^channel@([0-3])$":
> +    type: object
> +    description: |
> +      Represents

???

> +
> +    properties:
> +      reg:
> +        description: |

Don't need '|' if there's no formatting.

> +          The channel (rail) index.
> +        items:
> +          minimum: 0
> +          maximum: 3
> +
> +      vout-voltage-divider:

Needs a vendor prefix.

> +        description: |
> +          Resistances of a voltage divider placed between Vout and the voltage
> +          sense pin for the given channel (rail). It has two numbers
> +          representing the resistances of the voltage divider provided as
> +          <R1 R2> which yields an adjusted Vout as
> +          Vout_adj = Vout * (R1 + R2) / R2 given the original Vout as reported
> +          by the Vsense pin.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 2
> +        maxItems: 2
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      isl68239@60 {
> +        compatible = "renesas,isl68239";
> +        reg = <0x60>;
> +      };
> +    };
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      isl68239@60 {
> +        compatible = "renesas,isl68239";
> +        reg = <0x60>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        channel@0 {
> +          reg = <0>;
> +          vout-voltage-divider = <1000 1000>;  // Reported Vout/Pout would be scaled by 2
> +        };
> +      };
> +    };
> -- 
> 2.39.5
> 
