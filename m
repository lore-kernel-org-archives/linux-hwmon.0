Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0170439012;
	Tue,  3 Mar 2026 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772548856; cv=none; b=RPOFyGR2p6X8K+LOfs4ixmJedKpvGh+ZVR4lzDI3+SzNQIJt2HeWyd2G2IAjvZz59LDwpxwvkVFHPzpxJZOuzWztYcI5uqZTfX+makm/Yj13ITCsTYQxcSZE1R0AqlHzJGkNCN4BHTZsxbM5pF0DXJwYC9sKC1FNtQ1yuF2EepM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772548856; c=relaxed/simple;
	bh=+Pr9CEDrZX6PYZmvlsYDBhSFokHFEKrUhQ1+t5IfA6A=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Hu7FMsmATPFZ45AYz7kaA/CSDSXwi1xY28M3lJaW84QLvWp6/YYJXF6hGRgDnPiU3GTuq717rpH7c+JvBLqemXws96Ksc7u3gY/Js25cQFcciWLAw06h60A8AZL6NRQ+UHU3zkoWbm1YGDzBVQEyjuMG6dw1WLl1zcAZax9tcsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JF/a2Udt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JF/a2Udt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0028C116C6;
	Tue,  3 Mar 2026 14:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772548856;
	bh=+Pr9CEDrZX6PYZmvlsYDBhSFokHFEKrUhQ1+t5IfA6A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JF/a2Udt8z09Y22wRejAGIy6oeH/a8MP2ow7vQQ0yuTqbUFsy9Dj1limX9PP7MC/R
	 ic9vyMgajzsvTWHIkbyV23SdTBQicoiRTJyi2O8Wgntt8tkNzslC9NuSnlWd0WEUkW
	 kMEU6+QWnqWid6mwsyacty/iQyFRRnZ2LT1Z4noeY7ZGht18B0oRHuJ74iP1Vr3m9D
	 PFKDt2iOONPAzH5qp3YQXwqAzGR9UP4eyzSg/go9yKUe/8TfuFNWz5dQzND7V/wD3I
	 O9Mfd/A4i6Z3chCt2rMtlZuSGsIGFMoXOltgVDiay4qBA7z84/pzedlz9zaFuZzzvt
	 2Ek+cBjoAwbVg==
Date: Tue, 03 Mar 2026 08:40:55 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, 
 kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>, 
 Lee Jones <lee@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Linus Walleij <linusw@kernel.org>, linux-hwmon@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
In-Reply-To: <20260303133947.1123575-2-o.rempel@pengutronix.de>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
 <20260303133947.1123575-2-o.rempel@pengutronix.de>
Message-Id: <177254885509.3251575.14819823286886805862.robh@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI


On Tue, 03 Mar 2026 14:39:41 +0100, Oleksij Rempel wrote:
> Add device tree binding documentation for the NXP MC33978 and MC34978
> Multiple Switch Detection Interface (MSDI) devices.
> 
> These ICs monitor up to 22 mechanical switch contacts in automotive and
> industrial environments. They provide configurable wetting currents to
> break through contact oxidation and feature extensive hardware
> protection against thermal overload and voltage transients (load
> dumps/brown-outs).
> 
> The device interfaces via SPI and provides multiple functions. To
> accurately represent the hardware without unnecessary DT overhead, the
> binding is structured as follows:
> - pinctrl: A dedicated child node managing the 22 switch inputs (SG/SP
>   pins) and their GPIO configurations.
> - hwmon: Integrated into the parent node, exposing critical hardware
>   faults (OT, OV, UV) and static voltage/temperature thresholds.
> - mux: Integrated into the parent node, controlling the 24-to-1 analog
>   multiplexer to route pin voltages, internal temperature, or battery
>   voltage to an external SoC ADC.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
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
>  .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 114 ++++++++++++++++++
>  .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 +++++++++++++
>  2 files changed, 196 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260303133947.1123575-2-o.rempel@pengutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

