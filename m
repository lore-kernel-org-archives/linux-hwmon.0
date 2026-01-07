Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC3831A56B;
	Wed,  7 Jan 2026 16:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802497; cv=none; b=u61zT5eF9Xa7IFPrrD6CxfOl/kKyB8MWPYjY60LktKGbPO9vLRJXcNp/Pp4DkYyEgJ7al0xwa3KqMe2QsvztU8gw8OgomabaCdTw+LFLeLesMxa2O0HV12n+lM6gtCKwLVLFe/81dLcx0yB6o++x+pagFZu3s9b823nYAajB2eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802497; c=relaxed/simple;
	bh=GuxFc4xkGa7Z7cKfyhvJuI0lTHahCkaf/jELlyRcIrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ma/HdNdbHQHA9erZA40275XWwrMQ3GHsS3cqVaCeCZsW32b5vNYaSJKT3KLfnVL+s0s+NCJvRGXZJ404Tqdud9CdX69K0PYP+OGf51ZTuZ4hklDReHQ3z/oIkHU3uNSIRAcGd9lJmHARlF+msplnmwTWMLrcvrg1TE+UbPpriAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNbybd76; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNbybd76"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DB2C4CEF1;
	Wed,  7 Jan 2026 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767802497;
	bh=GuxFc4xkGa7Z7cKfyhvJuI0lTHahCkaf/jELlyRcIrc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PNbybd76KrOij1n1aUe+p9EmMjeMjF6nwzacMyAJrjUaI9P7XM/NO/hRhuzpjrSkR
	 a7d+UV0cJ8sxYl+Rc1PfzW5UpXYobFzZy92m8fEJ+A2pMshdckRkCqrYR1I9iSPzGM
	 +s4OqFUV4RKIHJ2iFYQ984SHcf0iAVTlErfPWnbIUIK0ccq7hhHT1UYWhd8AidYVxt
	 cdQ+jFDVej4EmkA8SrIPbeQqrNNhS/kZmkXM/6Muh3I6QFk62/O3Jl0gZ0627VVQay
	 dPboEjzsdPJGY+6MhzJj11GK9Zm38ICnfJwKExCYSG+5Vkq/3tTHVrKvUtNigmu8Bb
	 P9Qd2f2OMXAeA==
Message-ID: <7bf30b16-c98e-4c18-816c-58f632fcf939@kernel.org>
Date: Wed, 7 Jan 2026 17:14:53 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon/pmbus: Add Infineon TDA38740A
To: ASHISH YADAV <ashishyadav78@gmail.com>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ASHISH YADAV <Ashish.Yadav@infineon.com>
References: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
 <20260107144507.46491-2-Ashish.Yadav@infineon.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260107144507.46491-2-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/01/2026 15:45, ASHISH YADAV wrote:
> Document the TDA38740A/25A device tree binding.
> 
> Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>
> 
> ---
> Changes in v2:
>  - Review comments address:

You need to write here what you exactly changed.


> https://lore.kernel.org/all/2ee75453-0869-4348-ad92-f7ff71aca75d@kernel.org/
> 
> Driver code in review process:
> https://www.spinics.net/lists/kernel/msg5985470.html
> ---
>  .../hwmon/pmbus/infineon,tda38740a.yaml       | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml
> new file mode 100644
> index 000000000000..cd4102350a15
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Infineon TDA38740A and TDA38725A Synchronous Buck Regulator with I2C
> +
> +maintainers:
> +  - ASHISH YADAV <Ashish.Yadav@infineon.com>
> +
> +description: |
> +  The Infineon TDA38740A/TDA38725A is a 40A/25A Single-voltage Synchronous
> +  Buck Regulator with I2C designed for Industrial use.
> +
> +  Datasheet:
> +  https://www.infineon.com/assets/row/public/documents/24/49/infineon-tda38740a-tda38725a-datasheet-en.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - infineon,tda38725a
> +      - infineon,tda38740a
> +
> +  reg:
> +    maxItems: 1
> +
> +  infineon,vout-voltage-multiplier:

vout of what? Of input supply? But there is no input supply... Maybe you
just want to set output regulator supply?


> +    description: |
> +      TDA38740/25 pin strap parts are available in two flavors of 1:1 & 1:2
> +      vout scale loop.
> +      For the 1:1 vout_scale_loop version, there is no need for any resistor
> +      divider as output voltage sense pins are directly connected to
> +      the output.
> +
> +      For a 1:2 scale loop version, it is recommended to use 499 ohms each for
> +      top and bottom across the feedback path.
> +      However, in some applications customers tend to use an intentional
> +      resistor divider across the output with a different divider ratio other
> +      than 1:1 or 1:2 to alter the actual output voltage.
> +
> +      For example, if pin strap part is set to Vboot of 0.7V,they use a
> +      resistor divider to generate 0.75V using the equation provided in
> +      Section 13.3 of the datasheet.In this case, as there are only two
> +      vout_scale_loop options of 1:1 and 1:2 that the IC can identify,
> +      Read_Vout would still read as 0.7V in the telemetry and the baseboard
> +      management controllers would use this telemetry data to monitor the
> +      rail parameters leading to false tripping of the system.
> +      This multiplier is used to offset the telemetry output voltage Read_Vout
> +      so that the telemetry data is reported correctly to the monitoring
> +      controller,in this example the multiplier would be 0.75/0.7 = 1.071.
> +
> +      This multiplier is required only for any external monitoring of the rail
> +      output voltage. All the other Vout related parameters are used
> +      internally by the IC and there is only a slight impact on the fault
> +      thresholds.The impact can be calculated using equations in Section 13.3
> +      of the datasheet.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +


So this was a regulator before, now it is not. Confusing... Parts of the
description are saying this is regulator, so you miss regulator.yaml
reference in top-level. Anyway, I am not doing full review with such
incomplete changelog.


Best regards,
Krzysztof
