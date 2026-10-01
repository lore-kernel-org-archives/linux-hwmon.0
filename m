Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBC831ED83;
	Thu,  1 Oct 2026 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842655; cv=none; b=diZ9BNDJb0sIClo8MCYo68UhG1BGhru0UhGzrWifLKMucv5wGe8rW2ZPZB47ryWY0Mu7fZ94Qzl+ey06gkjDzzJC9t7N8m8hwRZk67ctrTqeWxuQ2INSYe8a1fW9E2bgM1mYeaNTRg+Mx/7pST/bd3MWlXfUfRiZdDgbhLVQSTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842655; c=relaxed/simple;
	bh=C8h6OI3UO/Zgrmh9+n/8orlJGde7REXnfxQAFIosoMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2qfs0K4/tLW4HqhoAvYmMSZEU+YY/BA7P3DVk7DLRklAUpkWV6GTfRGDVsqORC67z+goYkHvbCHXSBPmrNWAHOUoMD3Oi19820JX6zt49yk8BtwSIu2QPBrHsk0NGQ39rw5S2RWWTi7WEXdu+lK6p0JfSekE2dK63zayDU0dd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbjWOMJe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbjWOMJe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8440A1F000FF;
	Thu,  1 Oct 2026 08:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790842645;
	bh=Boaufn0aUnE5Zt5cwsradz7FLIyOzXYWO6yRvZuwmi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hbjWOMJejQy0Csbox2Kbp3EiZmGTA3RWUep+6/wMyLRMmgCNQ/vKJeOhgfoGVTXEf
	 upi5ZD79bwZdL73Cfh0po6b7vkEU98es4VK8ReoCFyPsn1/YUAmBdFKJM4rG8fPn6J
	 xWJeZMX+bzrv4YxzNgCHTVrCbjM6/57XoRICIITa2TQfCMyGlzQpOm2YyS+lYAiUM/
	 /QGtYt0gULYXZU+D9wjpI0ZIvzwWxILqunUMq4wu4oIkOD2Xzdf0CAhp7dVrfnwnOz
	 CdmaLQq3bnBa6i8hJjcJULoucs6LggsupZwCP3p6dsFliOZioROuTWWHhBq9XmfPcW
	 h5SpNc2gYOOZw==
Date: Thu, 1 Oct 2026 10:17:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luna Hart <lhart.opensource@witekio.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Flaviu Nistor <flaviu.nistor@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add TI
 TPS389004/TPS389006/TPS389008
Message-ID: <20261001-greedy-skink-from-sirius-b13f9e@quoll>
References: <20260929-lhart-dev-tps38900x-v1-0-7045c5894152@witekio.com>
 <20260929-lhart-dev-tps38900x-v1-1-7045c5894152@witekio.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929-lhart-dev-tps38900x-v1-1-7045c5894152@witekio.com>

On Tue, Sep 29, 2026 at 04:04:04PM -0700, Luna Hart wrote:
> Add a binding for the TI TPS389004, TPS389006, and TPS389008 I2C
> voltage supervisors and monitors, which provide 4, 6, and 8 voltage
> inputs respectively. Each input may be described by an optional child
> node, containing additional properties including the label and ADC
> scaling factor.
> 
> Based on an earlier binding by Flaviu Nistor.
> 
> Signed-off-by: Luna Hart <lhart.opensource@witekio.com>
> ---
>  .../devicetree/bindings/hwmon/ti,tps38900x.yaml    | 137 +++++++++++++++++++++

Preference is to name after compatible, so ti,tps389004

>  1 file changed, 137 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tps38900x.yaml b/Documentation/devicetree/bindings/hwmon/ti,tps38900x.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..cdd74ddd03e748f271628f1cd2f2551b9c983785
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tps38900x.yaml
> @@ -0,0 +1,137 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/ti,tps38900x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TPS38900x voltage monitor
> +
> +maintainers:
> +  - Luna Hart <lhart.opensource@witekio.com>
> +
> +description: |
> +  Voltage monitor from TI (TPS389008, TPS389006, TPS389004) on I2C bus.
> +
> +  Datasheets:
> +    https://www.ti.com/lit/ds/symlink/tps389006.pdf
> +    https://www.ti.com/lit/ds/symlink/tps389006-q1.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tps389004
> +      - ti,tps389006
> +      - ti,tps389008
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    description: Required only if a child node is present.

Drop description, obvious. Schema and DT spec tells that.

> +    const: 1
> +
> +  "#size-cells":
> +    description: Required only if a child node is present.

Ditto

> +    const: 0
> +
> +patternProperties:
> +  "^vmon@[0-7]$":

How is this called for other devices? "channel"?

> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      The node may have optional child nodes for each voltage channel.
> +      There are either 4, 6, or 8 available depending on the specific part
> +      being used.

Drop sentence, schema will tell that.

> +      If no child nodes are present, all channels will be exposed for
> +      monitoring. Otherwise, only the provided nodes will be created.

That's a bit odd behavior. Is it expected for hwmon?

> +    type: object
> +    additionalProperties: false

Blank line

> +    properties:
> +      reg:
> +        description: |

Do not need '|' unless you need to preserve formatting.

> +          Must be 0 to 7, corresponding to respective
> +          ports of the TPS38900x.
> +        enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
> +
> +      label:
> +        description: Name of the input source.
> +
> +      ti,4x-scaling:
> +        description: |

Same, drop |

> +          Enables the high range ADC voltage monitoring range. Default ADC
> +          settings will read from 0.2V to 1.475V using 5mV steps. In the 4x
> +          mode, the valid range is 0.8V to 5.9V using 20mV steps.
> +        type: boolean
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg

Best regards,
Krzysztof

