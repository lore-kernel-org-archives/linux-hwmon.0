Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82282367CF;
	Fri,  6 Feb 2026 16:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770396456; cv=none; b=oBg3QCup8CLL0dp41F+wQ6uJMazy/7Tn5iebLU05UrRrLC2fQtGLnEFRXcQSWk7qx7kYNDV3oZ0V7M3/4jn+5S6lkiDaVOWpNz8haRxlffX0AVRlcdAxTaceWa02kyL86YnOjxG3XfDc4qpYBmfIfrQojMO+QWd5o2WQTtMXH1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770396456; c=relaxed/simple;
	bh=8ni2wyMhJ8YY1Q56zt2R6P4WRq1z9vdPykPrpeyDO00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oDjj0gpP7kUYM/IowLfTkTlvoZtzquvL3QsfruVleLYT7yan5YtJGm80s8xPFhRh5Ki8mhUFZmGjvOZLZkJozATDuP3Qhsq+fbxpeWT887T/NtZcf+qczC4sxiINd3bvOD4DzNvwP4RMpL2RTWIdy/5+EnHqRimvkvx4zIWbZvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEWrQfhB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEWrQfhB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D253EC116C6;
	Fri,  6 Feb 2026 16:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770396456;
	bh=8ni2wyMhJ8YY1Q56zt2R6P4WRq1z9vdPykPrpeyDO00=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KEWrQfhB8ij0qK+sIIb2mdun5UyVkmF8NKV+EWRP1aF4QA317jEHXzKZZCS7b5ud5
	 AW9aDZEJjcTPRJMQw61eMxc/1zMWtdafPIeLtrdhEdt4sL7jQL5tUrJphD5/HLvlGS
	 ASXN5KjW9AtK6X+WCeeAPl6sziJkycl63+s+Jh65BOABWdeDENB1ZSxRucHxMmZPvb
	 7R62ZzYfKrthDXJTQnCqQxCS3zZ74vLXKBsaKlJGdoKcVhrWmTf5cTv0DmKms2szEG
	 JoprrHLGHY07h2/22YSQ0ec5cgMMif0h+BAq7zXwD4urQ+frqvOtlUZ/xlduSw5je5
	 DwkquriYlGL4Q==
Message-ID: <a9d4b53f-d8c2-4b31-aa13-901838c2933c@kernel.org>
Date: Fri, 6 Feb 2026 17:47:31 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: add support for MCP998X
To: victor.duicu@microchip.com, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net
Cc: marius.cristea@microchip.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260127151823.9728-1-victor.duicu@microchip.com>
 <20260127151823.9728-2-victor.duicu@microchip.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260127151823.9728-2-victor.duicu@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/01/2026 16:18, victor.duicu@microchip.com wrote:
> From: Victor Duicu <victor.duicu@microchip.com>
> 
> This is the devicetree schema for Microchip MCP998X/33 and
> MCP998XD/33D Multichannel Automotive Temperature Monitor Family.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
> ---
>  .../bindings/hwmon/microchip,mcp9982.yaml     | 205 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 211 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml b/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
> new file mode 100644
> index 000000000000..05ea3c6a5618
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
> @@ -0,0 +1,205 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/microchip,mcp9982.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MCP998X/33 and MCP998XD/33D Temperature Monitor
> +
> +maintainers:
> +  - Victor Duicu <victor.duicu@microchip.com>
> +
> +description: |
> +  The MCP998X/33 and MCP998XD/33D family is a high-accuracy 2-wire
> +  multichannel automotive temperature monitor.
> +  The datasheet can be found here:
> +    https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/MCP998X-Family-Data-Sheet-DS20006827.pdf
> +
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
> +    items:
> +      - description: Signal coming from ALERT/THERM pin.
> +      - description: Signal coming from THERM/ADDR pin.
> +      - description: Signal coming from SYS_SHDN pin.

As Guenter pointed out - code is wrong (thanks Guenter!)

This does not match your if:then:.

> +
> +  interrupt-names:
> +    items:
> +      - const: alert-therm
> +      - const: therm-addr
> +      - const: sys-shutdown

Neither this.


...

> +    then:
> +      properties:
> +        interrupts-names:
> +          items:
> +            - const: alert-therm
> +            - const: sys-shutdown

So three interrupts, but two AND three interrupt-names? This is mess.

> +      required:
> +        - microchip,power-state
> +    else:
> +      properties:
> +        interrupts-names:
> +          items:
> +            - const: alert-therm
> +            - const: therm-addr

Where are all b4 lore links for previous versions so I can trace the
actual review happening here? Why aren't you using b4?

Best regards,
Krzysztof
