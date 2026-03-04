Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EEC2D949B;
	Wed,  4 Mar 2026 08:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611514; cv=none; b=CTFUsQfYJ1akykrFpyrvmRXwiTQTypKHpnWuv6jNtSa1b7TzJ/4jn4vRNW5YQUYny2dyACNRaXoWfzVAyad9tXYW5ppHbc/btm8mmSJmKg+FKYDO/Z3ReZ05KmbHF/gbcsxL8Q97sqELEKVasK34LgoX/6F8/O9NpnhHjin2vrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611514; c=relaxed/simple;
	bh=4lBmas6Yc1Cbg618q03+tEbWjkoIYs7jUuIuVDV3AdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZ9edRxLVw3MspZgLRLzAaKkLKdjyeJjkMX3eRJVThT6ZRwjuXLKklUOYiexdsgTZiFhJj2Q+6EAUAvk++fkfJLCXnNXZIWwxMUugjW/soVMZC56who2yXlCJFWV5oAVMLqevZ3yHUX7GapTQdP+apoBZNkEzrfjlmRIWmaenhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tr9mEzuk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tr9mEzuk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595F9C19423;
	Wed,  4 Mar 2026 08:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772611513;
	bh=4lBmas6Yc1Cbg618q03+tEbWjkoIYs7jUuIuVDV3AdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tr9mEzukeNORkoWW+zARw5P8AqxGXl+qHYgIhhElrJOHgzVAukYzarhAkK6XWQMAp
	 Sfr7ledD7SZ3T+UQ+jUQRLqKkek3a+Dl9ghCosrH4sFARg/JdwP0lmxm4Rb3mZyozG
	 kMkQa6VXWjF0VWgKV3iuvVNgh80fNf/eW/2NO+y+D+K8TK2AhU0dDcY68bFUGsLa9c
	 g+Hi0IaXKjWC4KaW+5esFcLFCi4yBsPaAkNrEVeH+E7U2Hjnyr93u28zJr0rPKBmQL
	 EF6krH+UnHoBeBKbE1YzLHokgxsIsY78JqDgeEi53KBdHgQCgRfRZCnF85FQMHK7Ak
	 xcs7RUmP4KxLw==
Date: Wed, 4 Mar 2026 09:05:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>, Lee Jones <lee@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
Message-ID: <20260304-graceful-sweet-bittern-98efdb@quoll>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
 <20260303133947.1123575-2-o.rempel@pengutronix.de>
 <177254885509.3251575.14819823286886805862.robh@kernel.org>
 <aacH7NmkOzZued0Y@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aacH7NmkOzZued0Y@pengutronix.de>

On Tue, Mar 03, 2026 at 05:10:20PM +0100, Oleksij Rempel wrote:
> Hi Krzysztof and Rob,
> 
> On Tue, Mar 03, 2026 at 08:40:55AM -0600, Rob Herring (Arm) wrote:
> > >  .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 114 ++++++++++++++++++
> > >  .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 +++++++++++++
> > >  2 files changed, 196 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> > 	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
> > 
> 
> Folding the mux node into the parent as suggested [1] causes this error.
> Because the parent now has #mux-control-cells, the generic
> mux-controller.yaml forces the node name to be mux-controller. Since
> this chip is primarily a switch/GPIO controller, naming the parent SPI
> node mux-controller@0 is misleading.
> 
> What is the preferred way to go here?

https://www.nxp.com/products/interfaces/multi-switch-detection-interface/22-i-o-msdi-programmable-current-analog-mux:MC33978

Name of the mc33978 device is "programmable analog mux" and further
description says "analog multiplexer for reading analog inputs ", so I
don't find "mux-controller" a confusing name. It is EXACTLY a
mux, so mux-controller.

Anyway if you want gpio, then please add a patch extending the pattern
in mux-controller.yaml to allow "gpio".

Alternative, because it is rather a mux than a controller of a mux,
would be to call it just "mux" or "io-mux" (maybe the latter, since we
have "i2c-mux" in the spec) and allow that pattern to be in
mux-controller.


Best regards,
Krzysztof

