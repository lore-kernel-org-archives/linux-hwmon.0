Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322459;
	b=04qoExmc3cQ5fAlgQgRcewVNjzROe75SiM7qdaPcI2v0/l+2dbgqALW/f1IjY6L8S4hS
	 Lv4vqpj18lUsL339kBzfwzBwnk4MB4EMfucYIOfHIBxqj/hyooOo+n/UM2wyNULEN2sh4
	 0Q34dQQfjwXhMIHP3BJ8tE4c3rZaTDPI6qjhrrIOez+p1u0Rkb4DUAHqhw9rOdF/s0ney
	 ShalAzSfRrXW5qbvVppThdv433H4OcKbJjJnniPZyNL+OmG1Dnp0K7K2lqmZyug/ybMqZ
	 X48gWn8yaIxR3LXFQY62TTnpdAmIfZ1/JlqhK91R8jMCjVhTqWhSLjWTtVmo9hofLlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322459;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tU70rkAg+574vgu487sbjgQCUDsnSlr+Ix8M/GBIFUk=;
	b=oiciJOzqNMxy+tW8bEB6KwLgeJqly0oC60T3awtQayzUNArgjhGgBg1rS0LdOoALTzmI
	 Cmt0++cI9hxOPalQGycl0KgsrJVysBSWDFOGd+Bqvf1bxfBmVZvmlXK/be7emHRieerhE
	 lb39UB4kgpZ3ut3GoNtJfA43wWaQE/nTujKrRnk40Pl5MU03cLW78xYL81YfC+YtDpavj
	 ZJJ3M0aKmeI8BaQOhopCfT5r519HhKZeKDuz2A3TfjCL1qvigsMJQSFLxDaowg1XAWIxx
	 6y7FEZA7Jm7QeUxr5Fse/JTioUd/C2FmJM6sdqENFSKonAqd0YAfFzIOWeInFghrV6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DP6aS3o6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD4B60A260D;
	Tue, 10 Nov 2026 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DP6aS3o6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA411F008A4;
	Tue, 10 Nov 2026 14:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794322458;
	bh=tU70rkAg+574vgu487sbjgQCUDsnSlr+Ix8M/GBIFUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DP6aS3o6jpTl7p6kQ+3Ohzu6vewKiJu6Y3pMPcN4g9pzxnDVvCQuE5ceRMSFrX+a1
	 3AXrcPapKJ1EmYUjLxBCCI4T2UoH1u9a9qoucrm0WNVciYasEQpHu0iJWFE7pWWS6j
	 boWcIX6a0VePN5jszwb7jxXJDVB7TPVMhOz5TXPepwo4PeGrrni6RtQHQU/iQZQTL7
	 dWUuWbLL+rs0bw2izuJpK4h4c0eX4+ht4/1FURWsMIupUkRmqepWvygDwPSUatg/8O
	 vcxDKawh8ysJan2gNwT45AwHSJNAaGYC586psdionq5lb3hYxnaVGlfNDjlxSqSqRx
	 cM/QUFefl6NjQ==
Date: Tue, 10 Nov 2026 08:54:14 -0600
From: Rob Herring <robh@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@roeck-us.net, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan
 controller
Message-ID: <20261110145414.GA3828324-robh@kernel.org>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>

On Mon, Nov 09, 2026 at 02:35:05PM +0100, Robert Marko wrote:
> The LAN969x fan controller has a PWM output and tachometer input in a
> register block separate from the Sparx5-compatible temperature sensor.
> Describe it with its own compatible and binding.
> 
> The optional fan child specifies PWM period and polarity, tachometer
> pulses per revolution, and thermal cooling levels.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> - Describe the fan controller in a separate binding and compatible.
> - Keep the existing temperature-sensor binding unchanged.
> 
>  .../bindings/hwmon/microchip,lan9691-fan.yaml | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
> new file mode 100644
> index 0000000000000..0b7d38a6d20ae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip LAN969x Fan Controller
> +
> +maintainers:
> +  - Robert Marko <robert.marko@sartura.hr>
> +
> +description: |

Don't need '|'

> +  LAN969x fan controller with a PWM output and tachometer input. The fan
> +  child's pwms property references this node to specify the PWM period and
> +  polarity.
> +
> +properties:
> +  compatible:
> +    const: microchip,lan9691-fan
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: System reference clock
> +
> +  '#pwm-cells':
> +    const: 2
> +    description: |
> +      Number of cells in a PWM specifier.
> +      - cell 0: PWM period in nanoseconds
> +      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
> +
> +  fan:
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      cooling-levels:
> +        description:
> +          PWM duty-cycle values corresponding to thermal cooling states.
> +        items:
> +          maximum: 255
> +
> +      pulses-per-revolution:
> +        minimum: 1
> +        maximum: 4

Drop. That's already the max in fan-common.yaml. minimum should be added 
there too as 0 would never make sense.

> +        default: 2
> +
> +    required:
> +      - pwms
> +
> +    dependencies:
> +      '#cooling-cells':
> +        - cooling-levels
> +      cooling-levels:
> +        - '#cooling-cells'

The dependencies should also go in fan-common.yaml. Perhaps 
cooling-levels without #cooling-cells might make sense sometimes?

Rob
