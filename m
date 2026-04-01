Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1AC46AF3C;
	Wed,  1 Apr 2026 17:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065187; cv=none; b=EIMlUq65Lo2/U2DvVHto94IXP5JII/x9RsaQRpfiDZCyNYnZ0Ifd8orbzQJinfrqq030hRAj/sY4c7EoNZMp60qf358EFCDkSUa7hnbc+6ePA9MlxAyfLazyH/GsZMapb4UoLhNZtwOQ/9HBLIFDJfuk7WrKKzxuUdJF2kkM9ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065187; c=relaxed/simple;
	bh=BnFmG1asfFQ84jgnyjEJvKHkn2oWL7QugAdxWpRFiLA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=uTnj0F2H20Az38t+r+zvX7BFT1CFasw3Vjb4VjvlQw6MMMViP9Viiul+zKqFDGiep9YomV/QV+c2f3UO8Ni8zX9P9SSOa/qD3KnNOzRAHKwBtxBPMpobyxgK4PXShp3+YNRx4WNfwM1K90HpYwI3Vh29z7ZYsXGG0SVApuxkiFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnHZZ+1S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnHZZ+1S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA4BC4CEF7;
	Wed,  1 Apr 2026 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775065187;
	bh=BnFmG1asfFQ84jgnyjEJvKHkn2oWL7QugAdxWpRFiLA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LnHZZ+1S3spJ8/7LX5WBJuCXyqMD8G05IcDT1uHNxVhC1INFIVpOzwB7hZv7A6yaY
	 Z/j0yRAx28qnz9kRB967rQjhl9kel5mjTN1xWlD2v/X1F/E0eEZUZT8W/nSMwQ/aj2
	 QXne6DJGGCapr4HV3QxIkbot7YJVJKyFtW5MCFAIE2ANw7ISee6a+s8eg5EQ+Mk0D3
	 tu32gXQ3wPqQMRaW4m1omNOx2rUl0GUDm2+Cl/wOc1cPljh5IEbHtrBYF5XEjk1xvN
	 ql2fv2MEcYPm58+pm8JjjEp8CMTEJfkzoMS/EXnzkZ+mJ9lOSxN50YXoL0jhdL8ioW
	 3P3/E8zZxalHw==
Date: Wed, 01 Apr 2026 12:39:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
 linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>, 
 linux-hwmon@vger.kernel.org, kernel@pengutronix.de, 
 Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
In-Reply-To: <20260401162510.1706073-2-o.rempel@pengutronix.de>
References: <20260401162510.1706073-1-o.rempel@pengutronix.de>
 <20260401162510.1706073-2-o.rempel@pengutronix.de>
Message-Id: <177506518504.947861.14670485917563381110.robh@kernel.org>
Subject: Re: [PATCH v10 1/6] dt-bindings: pinctrl: add NXP MC33978/MC34978
 MSDI


On Wed, 01 Apr 2026 18:25:05 +0200, Oleksij Rempel wrote:
> Add device tree binding documentation for the NXP MC33978 and MC34978
> Multiple Switch Detection Interface (MSDI) devices.
> 
> The MC33978 and MC34978 differ primarily in their operating temperature
> ranges. While not software-detectable, providing specific compatible
> strings allows the hwmon subsystem to correctly interpret thermal
> thresholds and hardware faults.
> 
> These ICs monitor up to 22 mechanical switch contacts in automotive and
> industrial environments. They provide configurable wetting currents to
> break through contact oxidation and feature extensive hardware
> protection against thermal overload and voltage transients (load
> dumps/brown-outs).
> 
> The device interfaces via SPI. While it provides multiple functions, its
> primary hardware purpose is pin/switch control. To accurately represent
> the hardware as a single physical integrated circuit without unnecessary
> DT overhead, all functions are flattened into a single pinctrl node:
> - pinctrl: Exposing the 22 switch inputs (SG/SP pins) as a GPIO controller
>   and managing their pin configurations.
> - hwmon: Exposing critical hardware faults (OT, OV, UV) and static
>   voltage/temperature thresholds.
> - mux: Controlling the 24-to-1 analog multiplexer to route pin voltages,
>   internal temperature, or battery voltage to an external SoC ADC.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> ---
> changes v10:
> - no changes
> changes v9:
> - no changes
> changes v8:
> - Update IRQ_TYPE_* macros include path reference in documentation from
>   interrupt-controller.h to dt-bindings/interrupt-controller/irq.h.
> - Add bias-disable, drive-open-drain, drive-open-source, and drive-strength
>   to the list of supported pin configuration properties.
> changes v7:
> - no changes
> changes v6:
> - add Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> - add Reviewed-by: Linus Walleij <linusw@kernel.org>
> changes v5:
> - Commit Message: Added justification for distinct compatible strings
>   based on temperature ranges.
> - Restricted pins property to an explicit enum of valid hardware pins
> changes v4:
> - Drop the standalone mfd/nxp,mc33978.yaml schema entirely.
> - Move the unified device binding to bindings/pinctrl/nxp,mc33978.yaml,
> - Remove the dedicated child node compatible strings (nxp,mc33978-pinctrl).
> - Flatten the pinctrl/gpio properties directly into the main SPI device
>   node.
> changes v3:
> - Drop regular expression pattern from pinctrl child node and define
>   it as a standard property
> - Reorder required properties list in MFD binding
> - Remove stray blank line from the MFD binding devicetree example
> - Replace unevaluatedProperties with additionalProperties in the pinctrl
>   binding
> changes v2:
> - Squashed MFD, pinctrl, hwmon, and mux bindings into a single patch
> - Removed the empty hwmon child node
> - Folded the mux-controller node into the parent MFD node
> - Added vbatp-supply and vddq-supply to the required properties block
> - Changed the example node name from mc33978@0 to gpio@0
> - Removed unnecessary literal block scalars (|) from descriptions
> - Documented SG, SP, and SB pin acronyms in the pinctrl description
> - Added consumer polarity guidance (GPIO_ACTIVE_LOW/HIGH) for SG/SB
>   inputs, with a note on output circuit dependency
> - Updated commit message
> ---
>  .../bindings/pinctrl/nxp,mc33978.yaml         | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260401162510.1706073-2-o.rempel@pengutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

