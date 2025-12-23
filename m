Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DD5328B79;
	Tue, 23 Dec 2025 12:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494704; cv=none; b=jL7eOeSNPNW/ZAWpPPH4izvIXaKn4FQbCm16t7QJjwz/iq4/pGnYrnghPlFTIot57UnBn/G4TIkjcEVg/WHbHhl42nvhApf3M3VB6FrcKPKTrhFxjdHQFMvhz2s8rI0d0rn5sbabgRwV3QR/RVqKIaxjlP7dghlqGQ7aaoXc+9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494704; c=relaxed/simple;
	bh=GelePM2/rzKVnTx6xZkND24wIhH+GyObS5uf8hoVE9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJPnJuqlSe+rc1L0NMxNhWBvpcaAycbaqpuqtLXibpy+ni9BLxk6Bxo1FX3jr3caGtxJCsZktK4DMVBtNaWZJtXHjaJD1zI38CWoEb4e10qBnzhOA6n8hYXY8pjq2u/kcUUAOfufoSss3ovWyvV8I+LXhjDpuXBjztU/Fxn08rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibrV99l8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibrV99l8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE669C113D0;
	Tue, 23 Dec 2025 12:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766494703;
	bh=GelePM2/rzKVnTx6xZkND24wIhH+GyObS5uf8hoVE9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibrV99l8yC9mtRis5bOw5djBep9SwSZ2NeVCvmcu32HrM7M2VdL9QH/SkCMCQeZNs
	 EpGkmF1cAz4LHE5PtNs28eCP7y1i4WHvbJKSVCZZmJpA2BO1qBZ3S58dwXwicPY6AP
	 /Q7PkufHXRNkSNgeAgUWYCFecV97K5CnT7/Vh4BzHSaY3NOLOGX515eNdnrpDV9bFY
	 r2gFMgAEq958KhHmuV+1f+hbWRpuigvGlaMbCmhz+XKwiOvZWXTc/cNlPR+lPhTynw
	 UnlAFc/ISIkLzbjkQa8oAD4zPg/B+6DCxQ+/orP1g4DylY/OpH3vnGQAGb9CWcFiHE
	 /ZHGKmGtbdIIw==
Date: Tue, 23 Dec 2025 13:58:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charles Hsu <hsu.yungteng@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: add STEF48H28
Message-ID: <20251223-hissing-wonderful-sawfly-1b41ce@quoll>
References: <20251223014832.1813114-1-hsu.yungteng@gmail.com>
 <20251223014832.1813114-2-hsu.yungteng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223014832.1813114-2-hsu.yungteng@gmail.com>

On Tue, Dec 23, 2025 at 09:48:31AM +0800, Charles Hsu wrote:
> Add device tree bindings for the hot-swap controller STEF48H28.
> 
> Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
> ---
>  .../bindings/hwmon/pmbus/st,stef48h28.yaml    | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
> 

I do not understand what happened here and nothing is explained WHY in
the cover letter.

You did not respond to any comments

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
> new file mode 100644
> index 000000000000..e4711c4ef38a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/st,stef48h28.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Infineon XDP730 hot-swap controller with PMBus interface
> +
> +maintainers:
> +  - Charles Hsu <hsu.yungteng@gmail.com>
> +
> +description: |
> +  The STEF48H28 is an advanced 30A integrated electronic fuse for
> +  the 9-80V DC power lines.
> +
> +  Datasheet:
> +    https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf
> +
> +allOf:
> +  - $ref: /schemas/regulator/regulator.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stef48h28
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        stef48h28@11 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +            compatible = "st,stef48h28";
> +            reg = <0x11>;

Incomplete. Where are all other regulator properties (you claim this is
regulator), suplies, etc.

Best regards,
Krzysztof

