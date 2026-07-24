Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DB53DA7F6;
	Fri, 24 Jul 2026 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883165; cv=none; b=LWUHlylnz2uEPqLoT3BQjrfRTDOOTMYsjUO5TIJPoSEdAJrziqhkIwze0+omhDT2eX8GKU7bSNcxV6F5apXhOrOURlwbzkhtbhfBY3F0bvxZqYjQll0GsNnTZrUNrr36oC6J7Yky6z45jYoVnBLlqx78Vju8CxQ0xEDXtw2VvDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883165; c=relaxed/simple;
	bh=UwIigYRtc1AmBTXJvsm6gULZsAez8F4tFOM0UXglwzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PP0bubHu7M0blu7ZIFKogQOTvoNCe8SDHKSA3zDkikkRFuKN3B5FYAYR3hNi+qvUuCQXGdkGYE3X7zLTsVGjZpmRnm7EUtuzcjKYPztowryjRWiUGHGYZTNtlmrB473iCXY8FwlXHj3616S6sDr7QK0zOdVCy1kJHqe1y4SbA6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kbdg1vQ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kbdg1vQ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0438A1F000E9;
	Fri, 24 Jul 2026 08:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784883163;
	bh=QA1ewnmvFybMFFharCth40UqvsKiu0e3slmBsaM1R+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kbdg1vQ7GIRP2uUIDmHgXgmfWmIbNY8tNt1SIn4ZBnfqyq1lQTvD+pij3XFBkZ5PA
	 6TAhPknKJ7VIpW9XOfvr1+5MNhJXDinrUoOb4QAYMPl11Q3jPGYiLM5dQIYD1OISgI
	 RtUFJPyc+L/w1OBkg8cVTI79EjOGeMO5UHoSEMBB+peBAeitNR2GfkkAX12aKuH+9U
	 RCsT7Xg4mDAagv2jtXRskMTzbrmM0vo6lLyyh+vDj15VAS0Peqr4WZzJUp17meF5ez
	 pyN1E7B5VkVvw2PChctSlxXk2XFc3vZkWoItoCsMGgh3cV/qmpwfv5dcWW7ZmXOByG
	 jotMg+9PM7+1g==
Date: Fri, 24 Jul 2026 10:52:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"linux@roeck-us.net" <linux@roeck-us.net>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Message-ID: <20260724-coral-spider-of-greatness-bbee4b@quoll>
References: <20260723164249.199442-1-sanman.pradhan@hpe.com>
 <20260723164249.199442-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723164249.199442-2-sanman.pradhan@hpe.com>

On Thu, Jul 23, 2026 at 04:43:46PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> Add device tree binding documentation for the Analog Devices MAX16545 and
> MAX16550, and the Volterra VT7505 PMBus controllers.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
> Changes in v2:
> - Represent the severe-OCP deglitch filter in microseconds
>   (renamed to adi,ocp-severe-filter-us, values 0/1/2/10).
> 
>  .../bindings/hwmon/pmbus/adi,vt7505.yaml      | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml
> new file mode 100644
> index 000000000000..6096e03cb80a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/adi,vt7505.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices MAX16545/MAX16550 and Volterra VT7505 PMBus controllers
> +
> +maintainers:
> +  - Sanman Pradhan <psanman@juniper.net>
> +
> +description: |
> +  The Analog Devices MAX16545 and MAX16550, and the Volterra VT7505, are PMBus
> +  controllers that provide input/output voltage, input/output current,
> +  input power and temperature monitoring over the PMBus interface.
> +
> +  The MAX16545 uses the same programming model as the VT7505.
> +
> +  Datasheets:
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/max16545b-max16545c.pdf
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/max16550.pdf
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - adi,max16550
> +          - adi,vt7505
> +      - items:
> +          - const: adi,max16545
> +          - const: adi,vt7505
> +
> +  reg:
> +    maxItems: 1
> +
> +  adi,rload-ohms:
> +    description:
> +      Resistance in ohms of the external current-report resistor connected
> +      between the ILOAD pin and ground. It is used to scale the reported
> +      input and output current and power.

Isn't this the same as shunt resistor? There is a property: shunt-resistor-micro-ohms

> +    minimum: 1
> +    default: 4750
> +
> +  adi,ocp-severe-filter-us:
> +    description:
> +      Deglitch time, in microseconds, applied to the severe
> +      overcurrent-protection comparator, programmed into the
> +      MFR_CONFIG[15:14] field. The MAX16550 and VT7505 expose this field.
> +      On the MAX16545 the severe overcurrent delay is fixed and these bits
> +      are reserved.
> +    enum: [0, 1, 2, 10]
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

Place it after "allOf:" block.

> +
> +allOf:
> +  # The severe OCP deglitch filter is fixed on the MAX16545, so the property
> +  # is only valid for the MAX16550 and VT7505.
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: adi,max16545
> +    then:
> +      properties:
> +        adi,ocp-severe-filter-us: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        regulator@40 {
> +            compatible = "adi,vt7505";
> +            reg = <0x40>;
> +            adi,rload-ohms = <4750>;

Why no adi,ocp-severe-filter-us? There is no default, so how does the
hardware work?

Best regards,
Krzysztof

