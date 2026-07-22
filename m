Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F5233A71A;
	Wed, 22 Jul 2026 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784743111; cv=none; b=NNxT1uUu1Jd3hZno06khsS2PNv6kQahdE/3VHmWWlE5sYYhYqS4hBnADKXeFoGX4O1K6YL6oUyY+6Bfj+z0mlUT0Jb5Lz/QR1set6ISlIFYoYiSzCzCZRWPfQyXLc+tvmdA87lcVudvxdTwieGSVDKdcEQdg9hVFczwwFHnRkDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784743111; c=relaxed/simple;
	bh=S1+d89lCfr6bB9MUvZ+GCn/uvS0hLzlsyYUdPGNv8Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwqcqTZVZT45uVeRGqp0LDX02bB0Ka/8yte8ynHB+7eVEEAb/nF3g0zIzLbvfjktFiZ+MpiK2BBkQ9W2QpAnRM2tswjcdzre53u3S9stOK9Vmr9JR5pHpEXnY1pDsuiF/CIZonuHsnUfJQd7gyjn9pHkRM6Al6zXP0FNjPdOkzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gq9Sb9aK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gq9Sb9aK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657561F000E9;
	Wed, 22 Jul 2026 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784743109;
	bh=AHEinGJr8koO2ecrlSE0uG8UPDVzEZXBfXFeSXcHZFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gq9Sb9aKnmhALsU84V3vjLROqT6XeFIlDt9pKSb8+HvkW64L2StX5qlE8ziQ/ABNT
	 u5rhGkgIf6CevX7fdxEwGZBVW1s7odxxKOj08ZGO311aAn6zQGpbJMnPy9gk1LuLob
	 BCjI0Xt/gnMDduuMF1UmZo4j92MOGJDv+85yhxqHmsGv6WvMWPUhzOufmtoZVd8hQI
	 tJrIKyHTr82/xnoT7Am9ipgQE78pkLEHxINFkrelSb8mv5AC3qqYxziRKC+W0YJT6L
	 wRh+HJ/gXRib0ZBN0pfDhIrjjx2NmAETFldw/0FRmuvczeH9XbkrmSRUGueQx54kVt
	 wAE7/9GXF+ZiA==
Date: Wed, 22 Jul 2026 12:58:27 -0500
From: Rob Herring <robh@kernel.org>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: add binding for adi,adt7470
Message-ID: <20260722175827.GB1301191-robh@kernel.org>
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
 <20260716-adt7470_thermalzone-v1-1-cc55ef35edde@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-adt7470_thermalzone-v1-1-cc55ef35edde@gmail.com>

On Thu, Jul 16, 2026 at 06:21:38PM -0300, Luiz Angelo Daros de Luca wrote:
> The Analog Devices ADT7470 is a temperature monitor and PWM fan
> controller. It supports up to 10 external temperature sensors and
> up to 4 PWM fan outputs.
> 
> Add the YAML device tree binding documentation for it. This includes
> support for the thermal framework by defining the "#cooling-cells"
> and "#thermal-sensor-cells" properties.
> 
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/adi,adt7470.yaml     | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> new file mode 100644
> index 000000000000..e0c0fdadd1cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/adi,adt7470.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADT7470 hwmon sensor
> +
> +maintainers:
> +  - Luiz Angelo Daros de Luca <luizluca@gmail.com>
> +
> +description: |

Don't need '|' if no formatting, but if the below is paragraphs, then 
you need '>' and a blank line. But it reads as 1 paragraph to me. In 
that case, your word wrap is off.

> +  The ADT7470 is a temperature monitor and multiple PWM outputs.
> +  It supports monitoring up to 10 external temperature sensors and controlling
> +  up to four fans.
> +
> +properties:
> +  compatible:
> +    const: adi,adt7470
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#cooling-cells":
> +    const: 2
> +    description: |

Don't need '|'.

> +      Cooling device exposing the 4 PWM channels.
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +    description: |

Don't need '|'.

> +      Number of cells required to uniquely identify the temperature sensors.
> +      Valid index values are 0 to 9, corresponding to temp1 through temp10.
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
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hwmon@2f {
> +            compatible = "adi,adt7470";
> +            reg = <0x2f>;
> +            #cooling-cells = <2>;
> +            #thermal-sensor-cells = <1>;
> +        };
> +    };
> 
> -- 
> 2.55.0
> 
