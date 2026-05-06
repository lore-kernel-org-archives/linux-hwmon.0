Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1DE204F93;
	Wed,  6 May 2026 01:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778030758; cv=none; b=fwO+u49dZv/GL4Hmcnhp6UKA/yFG/42yD/qTHno+JdE6uD8o3y1YbVDeEen/a3CSQnaAy0qmOgI2JHowi/j5pApVrQhxKBhpDCyNG4Hnnxcqh0pEXBFn4ownyFVfT0sA7DVdLjHqR8GSDSwySwNiGn45WobhJUCU4QUZ2JYHOlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778030758; c=relaxed/simple;
	bh=7XqJAINRGOIrXlZLOK6eK3oz0SKwRLEWMQhNHaZGhu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3nVnl9kRfyHiJ+lIXqVRdWqwOxqZLVJi9crv5t3VFz78nnzg5ublEweyWcFq+pYk9+e81Vr9DJLITEewAxknsI0mZYm61noEtdtvVqYUGWA2EaZOUQYxb4hyICsnn/v+pk22eKsSSQvdmchTk/pkcjHzRz0HuZrSoyYkvSYavU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uiHCivsv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uiHCivsv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3803FC2BCB4;
	Wed,  6 May 2026 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778030758;
	bh=7XqJAINRGOIrXlZLOK6eK3oz0SKwRLEWMQhNHaZGhu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uiHCivsv7jc8PG4ySgH1N4AemPKi9n46X8G+I3KCPPU4OtX5rukWQqxWGXKnMqGb6
	 0lJQKB3oSD7AyS+Q3nhM/HrQV+Vq2E0hfkxOz14qEEa0RmtG83lsvss/DJBHBdbAqL
	 GfYeiPn8BJumA+nVx2m2+dR0Mr7kjtnCuLEDChDw4825cjRJl7e8L1pxL/4fM2bp7E
	 ZqZQSiQGPWgNcK/PHrQgTn5wU2A3yHJYaToQTWtpnoFQkj4p2Oy5fCkUu6FhAIFGwz
	 4mqm5AQBJ1li/a65LCqg132ddmXW35uUVwaqZhxbdVs+X+iBwF/YuZvKMNKE0iy6zD
	 YA5IwvC0AAmeg==
Date: Tue, 5 May 2026 20:25:56 -0500
From: Rob Herring <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Message-ID: <20260506012556.GB248179-robh@kernel.org>
References: <20260428082337.743546-1-changhuang.liang@starfivetech.com>
 <20260428082337.743546-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428082337.743546-2-changhuang.liang@starfivetech.com>

On Tue, Apr 28, 2026 at 01:23:36AM -0700, Changhuang Liang wrote:
> Add compatible "starfive,jhb100-fan-tach" for StarFive JHB100 Fan-Tach
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../hwmon/starfive,jhb100-fan-tach.yaml       | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
> new file mode 100644
> index 000000000000..fdc8539ec804
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/starfive,jhb100-fan-tach.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 Fan-Tach controller
> +
> +maintainers:
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +description:
> +  The StarFive Fan-Tach controller can support up to 16 fan tach input.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - starfive,jhb100-fan-tach
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^fan@[0-9]+$":

Unit-addresses are hex.

> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +    required:
> +      - reg
> +      - tach-ch

You need constraints on the 'reg' values. Also, what does 'reg' 
represent in this case?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    fan-tach-controller@11be0000 {
> +        compatible = "starfive,jhb100-fan-tach";
> +        reg = <0x11be0000 0x400>;
> +        interrupts = <128>;
> +        clocks = <&per2crg 33>;
> +        resets = <&per2crg 5>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        fan@0 {
> +            reg = <0>;
> +            tach-ch = /bits/ 8 <0x0>, <0x8>;

How do you have 1 fan with 2 tach signals?

Rob
