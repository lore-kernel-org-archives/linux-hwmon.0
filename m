Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24828500947;
	Sun, 11 Jan 2026 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768127451; cv=none; b=fQokV+Puf8/7Cpxxxk2cmz0BdF/dHezUHqFiuhDv5/UjMYf+Z13foiXwKkWVHbJy7Jm7tO4J9Aetmbb95NDGGISc8w5x1e+J11Nn5/yoZ+/0S1fs64Uu93B9C4jjsJygo5j3uLYDuYMyTwJFa+KxghkzcKtEsMe6JWDTjCWEY2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768127451; c=relaxed/simple;
	bh=O4UBp3/oXI6eXN92Cj+672GOIaoBF/yn+K2eABNZYCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m88gSvxUiVIZ/5nvXLZWrxRoFyE094AMpg889B0NHYhmSKT4jq5RAan+xosB/LRsNnx7q1QT5AFY1xssZrWS9fikQvhasmsurIgwwXKncXnXmSZUTIF0azksn099+JYr0lLA9Ay+FryF5MANviBjn4r9imPqag8eI/7BWgX9KYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lm5kvTqe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lm5kvTqe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D64EC4CEF7;
	Sun, 11 Jan 2026 10:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768127450;
	bh=O4UBp3/oXI6eXN92Cj+672GOIaoBF/yn+K2eABNZYCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lm5kvTqeGWA7QZR5mjVKfQNl19zLIcPFLeTkhHD7KTIsUb673wHjfR/ENVEx7IFFe
	 qgyriwYQ8et+IIPKwW13RBAzQbp/chCs1asDKnIInEZ/BM5mTjL47eLHrNVGRo+dwS
	 qi0LSDp15Z1qHdnzJOzpXXiGI8xfRERncAsqMOopecA2zH3Gj4jeHwqPuHZuegWuIM
	 Jkt53Eb0w5or+fwAKQKm1EeA6ROWHifvsCAtPb0MpPeD+Wt4ot27KxjtCjPN7g1hRi
	 6zZQWWbiAHrYq9Godv0ZqK1FXSgmGEWUuXL7y52pbHPnEpdjEdjak2oADa01S4ZDnm
	 Clx29542DIpww==
Date: Sun, 11 Jan 2026 11:30:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: hehuan1@eswincomputing.com
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, ningyu@eswincomputing.com, 
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com, 
	weishangjuan@eswincomputing.com
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Message-ID: <20260111-messy-raven-of-efficiency-fbce9f@quoll>
References: <20260109090718.442-1-hehuan1@eswincomputing.com>
 <20260109090836.512-1-hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109090836.512-1-hehuan1@eswincomputing.com>

On Fri, Jan 09, 2026 at 05:08:36PM +0800, hehuan1@eswincomputing.com wrote:
> From: Huan He <hehuan1@eswincomputing.com>
> 
> Add device tree binding documentation for ESWIN EIC7700 Process, Voltage
> and Temperature sensor.
> 
> The EIC7700 SoC integrates two PVT instances for monitoring SoC and DDR
> power domains respectively.
> 
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>
> ---
>  .../bindings/hwmon/eswin,eic7700-pvt.yaml     | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
> new file mode 100644
> index 000000000000..72693828a461
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/eswin,eic7700-pvt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ESWIN EIC7700 PVT Sensor
> +
> +maintainers:
> +  - Yulin Lu <luyulin@eswincomputing.com>
> +  - Huan He <hehuan1@eswincomputing.com>
> +
> +description:
> +  ESWIN EIC7700 SoC integrates embedded process, voltage and temperature
> +  sensors to monitor the internal SoC environment. The system includes two
> +  PVT sensor instances. The PVT0 monitors the main SoC power domain. The
> +  PVT1 sensor monitors the DDR core power domain.
> +

You miss ref to hwmon-common

> +properties:
> +  compatible:
> +    const: eswin,eic7700-pvt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: clk

Drop clock-names, useless. There is little sense in calling a clock
"clock".

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  label:
> +    description:
> +      Human readable identifier used to distinguish between different PVT
> +      instances and generate descriptive sensor labels. Typically "pvt0"
> +      for SoC PVT sensor and "pvt1" for DDR core PVT sensor.
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: rst

Same problem.


> +
> +  '#thermal-sensor-cells':
> +    description: Thermal sensor cells if used for thermal sensoring.
> +    const: 0
> +
> +additionalProperties: false

This goes after required block.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - label
> +  - resets
> +  - reset-names
> +
> +examples:
> +  - |
> +    pvt@50b00000 {
> +      compatible = "eswin,eic7700-pvt";
> +      reg = <0x50b00000 0x10000>;
> +      clocks = <&clocks 244>;
> +      clock-names = "clk";
> +      interrupts = <349>;
> +      interrupt-parent = <&plic>;
> +      label = "pvt0";
> +      resets = <&reset 111>;
> +      reset-names = "rst";
> +      #thermal-sensor-cells = <0>;
> +    };
> +
> +    pvt@52360000 {
> +      compatible = "eswin,eic7700-pvt";

Drop entire node, one example is enough. Do not grow your binding with
redundant data. We are not accepting commits based on number of lines.

Best regards,
Krzysztof

