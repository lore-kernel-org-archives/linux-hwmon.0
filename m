Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659043DB620;
	Mon, 27 Jul 2026 07:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136439; cv=none; b=GzApR+21rnfxOu7big5CgEACwIBgBBXewv1wAbIXTA97f2mG93f2LpewZNJP47/A+tp9xwmNgoPU4CgZEPALHtq81nXA5erwyRPAao7SSSPMUxGkcIaqKqrubqJftAD7yduJ9rjBjJuu44Dn9P7Hy0bX1vy2VfQsLgHAOhL+gOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136439; c=relaxed/simple;
	bh=h0eqh7f4ppY44KpZDOkZ1Xk27Dd3KcxRq26UsGkC/Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTlRxCfJW8iLgx4fEs680whpQl3F+aqSNnOPzA5xkIyBjEMY5NiVKsEkFx31UVyCdqvPFld8S658j/7myl/67HQEFc1LrX/FUPs9QJOgztSBaAmX2NZFzsA0EwBiWpulW7sHwGm0vZNkszLQaDI/xdL/c6A6Nv29llsoN19LgYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxz1hxsP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxz1hxsP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DE41F000E9;
	Mon, 27 Jul 2026 07:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785136438;
	bh=oL8PbXdXGvB5nO8Lp7u+Dn63v903sBuyMZIFs+3GCbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fxz1hxsPOSok76PogK8qo5wONKplywRlfdiirkJl6YYSQPhS7XxRHcD2hQiwkagGz
	 HgocGCCew9EP+hqjT4zwQ6rR/6vJMu0y/k4ShquGaQg1rNB48gY6MZhsDxR9/5h7ql
	 vI9jM1sGP1+reyRli+2nZDTbq9TcyhU9jSIyUOGZAthUiQRvWTd7GLyLmZfC5Jd2oe
	 6T+U5G1pW3AbLQ/cy9TuYOYeNcon6nFLw6pAeYNdEDOKZq9VwhbcmtyFQQMIE2u4Ws
	 7MKKsCNFAtXh0V/AMbZBpL5JvOILT4rq/hUbRs91LxHHzyX4oxJL/Khp+/NJlHtQw1
	 J3nC/2wOmg3IQ==
Date: Mon, 27 Jul 2026 09:13:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: hwmon: pmbus: add MPS MPQ8646 binding
Message-ID: <20260727-sceptical-finicky-waxbill-d7ecbf@quoll>
References: <20260724-mpq8646_v0-v5-0-5915b5ae9aa2@free.fr>
 <20260724-mpq8646_v0-v5-2-5915b5ae9aa2@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724-mpq8646_v0-v5-2-5915b5ae9aa2@free.fr>

On Fri, Jul 24, 2026 at 01:55:28AM +0200, Vincent Jardin wrote:
> Add a device-tree binding for the Monolithic Power Systems
> MPQ8646 step-down converter as a PMBus device.
> 
> The schema is inspired from the mpq8785e:
> same mps,vout-fb-divider-ratio-permille property (maximum: 2047),
> and const: mps,mpq8646.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> ---
>  .../bindings/hwmon/pmbus/mps,mpq8646.yaml          | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8646.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8646.yaml
> new file mode 100644
> index 000000000000..7acf4f235b12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8646.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2026 Free Mobile - Vincent Jardin <vjardin@free.fr>
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/mps,mpq8646.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Monolithic Power Systems MPQ8646 PMBus Step-Down Converter (extended)
> +
> +maintainers:
> +  - Vincent Jardin <vjardin@free.fr>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  MPS MPQ8646 PMBus step-down converter.
> +
> +properties:
> +  compatible:
> +    const: mps,mpq8646
> +
> +  reg:
> +    maxItems: 1
> +
> +  mps,vout-fb-divider-ratio-permille:
> +    description:
> +      The feedback resistor divider ratio, expressed in permille
> +      (Vfb / Vout * 1000). This value is written to the
> +      PMBUS_VOUT_SCALE_LOOP register and is required for correct output
> +      voltage presentation.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 2047
> +    default: 706

Everything is the same as mps,mpq8785.yam, so why it cannot be added
there? Just grow the list of if:then: to cover your specific
constraints.

Even default is the same... I do not get why looking at other schema
which combines different devices with same default and same maximum
value, you still decided to create a new file.

Best regards,
Krzysztof

