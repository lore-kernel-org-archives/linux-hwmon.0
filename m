Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C423C4557;
	Mon, 30 Mar 2026 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871464; cv=none; b=caEB7RG1G5BS4Gg5MPtd8zSFzAtjvzAEIKOZjp/20/6ej0dFI6qV/+ZNLxxgXWc6yzNbO01hBUA3srH9HBD4fboy8bu55oB7z7UFMBd0llJ5C+lqpndsWN5I5RlJL4G5sa3wcpn33uUnR6N8NS9Ip760DCBa35LTigVLsKYukO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871464; c=relaxed/simple;
	bh=KDbZP1GpFsEb6gBANWtBQbCXt0XP4RU9prwmZvnqZ04=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=NdFrnU9fmk3/71Lrj0mkf1jM2+Rq2PB4GWTLYSSDOXKuOky8BPpR3XSPPNUY/NkXa6QPAJg8M4G5CoRl5ymi/xY3hElxhXJCSYbTM2d4pJXwz49sKTIHn3WvLjrETWeu+7KSOMQzp0/kLP3MsfB0J1VxPvPBJcpyzUgR43PVh0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehCpAECF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehCpAECF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4D2C4CEF7;
	Mon, 30 Mar 2026 11:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774871464;
	bh=KDbZP1GpFsEb6gBANWtBQbCXt0XP4RU9prwmZvnqZ04=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ehCpAECFKdpHvgiv51l7cAikkl/NwB+fFiPK+MImDexibtiA/bL34XQwFeqSNu0nd
	 kGVsx2RU4wkgvrtjXnCp5DoNMkeZDxncFfN9aZyiqOAG44zheuTGwX0+Gj6gsf1/Go
	 okgAcWJ8eoXBaew8ElHINA73NoFgYgbkotwtMm7ks6oW0J8ao3fbGetxBoxK11ZB31
	 yF321/8kn51/RAq2xnhskGs+Sr2dZUoxpNy7htr9Em/PKmF1Vq/SqznlfqkrWkgtZ/
	 ee3mKL3vCwH/JKcrPSeRHA6c3qlqt6I49YFYyLy78AlFVyBvJFetjN9DoEFZINvXYk
	 /rNSRB0LwirgQ==
Date: Mon, 30 Mar 2026 06:51:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ashish Yadav <ashish.yadav@infineon.com>, 
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org
To: ASHISH YADAV <ashishyadav78@gmail.com>
In-Reply-To: <20260330102345.37065-2-Ashish.Yadav@infineon.com>
References: <20260330102345.37065-1-Ashish.Yadav@infineon.com>
 <20260330102345.37065-2-Ashish.Yadav@infineon.com>
Message-Id: <177487146147.2070608.2849563543220120287.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720


On Mon, 30 Mar 2026 15:53:44 +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add documentation for the device tree binding of the XDP720 eFuse.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---
> 
> This patch introduces a YAML schema describing the required and optional
> properties for the XDP720 eFuse device node. It includes details on the
> compatible string, register mapping, and rimon-micro-ohms(RIMON).
> 
> The RIMON resistance is installed between the Imon pin and the ground
> reference.
> ---
>  .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml: properties:infineon,rimon-micro-ohms: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml: properties:infineon,rimon-micro-ohms: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.example.dtb: hwmon@11 (infineon,xdp720): infineon,rimon-micro-ohms: 1098000000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.example.dtb: hwmon@11 (infineon,xdp720): infineon,rimon-micro-ohms: 1098000000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260330102345.37065-2-Ashish.Yadav@infineon.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

