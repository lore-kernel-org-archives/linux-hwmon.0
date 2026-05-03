Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF72B39BFFE;
	Sun,  3 May 2026 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777809840; cv=none; b=DI79viKhf0WVFyOhzCInPQ+Wj9N4s2FiuD84jMm4+Dwem1RRo0N6MYLUpCpkCGGS/Y49wvOUXPLSAIvyVWDdxRQS3lJW+81K4n/eFeW4uTr5zKC5zkY7qjmcs4/eU3yFvgLP+d6gYc+9PRxNzGUOHLrbMMOFu1sivSq3OOJzXnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777809840; c=relaxed/simple;
	bh=eVnyWQFbsB7KzGskUtRfRN8z+c96n/+XlZV66LwJbOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ky5Ya+ccfuGkbJmS+JWNk45DCkSvC+EbfdasHUzQTHWBs9yFVPDXGCXZK+LvdWfrkrR0ZQKCMVoWkRvSrwQvmF+QpRFJw0DjYKHx3JwtA+swpWB0K0MspgPxsUyb+ZsFQJ6YM9vdHNYU2CqA8n6BfsFT1iZ6deeTsbOKWxBOuDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOJX/FAn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOJX/FAn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EEAC2BCB4;
	Sun,  3 May 2026 12:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777809840;
	bh=eVnyWQFbsB7KzGskUtRfRN8z+c96n/+XlZV66LwJbOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOJX/FAncCRAAHItHEVRwtr90qs2qwPuDpUPa5jorzXyPsGXEeyqQSxX75V/rQ5gw
	 QhL/ndT7dPUyaRohXMNvwPMKOABoF3eYsFP5PUM22ogqlC9sYJnDXr79z0uuqb2rRV
	 0vnUDtTSILBIrm+9v49VQCjTbun4wEkKzuhRiZMrWDG0sIqRv3j/uyhPVisgshaisv
	 LmCxF10KlA5psh1RaHTd4Hy4tpEK0GTVviD7J74ZJ2MzxxTAtXDgoQoaiXGx/7dyYk
	 JYtggvyRzNf7lPPtViS9bEkWK9iaccrwpqviLYPI4JjBocNeTiB/U4aCYg1nESty+g
	 LnYwwG9rh6huQ==
Date: Sun, 3 May 2026 14:03:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: hehuan1@eswincomputing.com
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ningyu@eswincomputing.com, 
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Message-ID: <20260503-brave-bullfinch-of-innovation-942914@quoll>
References: <20260430064107.1598-1-hehuan1@eswincomputing.com>
 <20260430064444.1615-1-hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430064444.1615-1-hehuan1@eswincomputing.com>

On Thu, Apr 30, 2026 at 02:44:44PM +0800, hehuan1@eswincomputing.com wrote:
> +
> +  label:
> +    enum:
> +      - pvt0
> +      - pvt1

No, label is user-visible name. Can be whatever user decides.

Please read writing bindings - instance IDs are not allowed.

> +
> +  resets:
> +    maxItems: 1
> +
> +  '#thermal-sensor-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - label
> +  - resets
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pvt@50b00000 {


Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Best regards,
Krzysztof

