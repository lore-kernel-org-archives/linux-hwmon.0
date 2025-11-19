Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581D121CC5C;
	Wed, 19 Nov 2025 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763536815; cv=none; b=mpXN6oxegRlMWeYkSmFzWWh3LHmzWovjFaLq84Tn0S80smWdM3fTwq0ibys2soUxRVWwutnH7YEWYe/UKPbRfnP9mbtR0rE9pzpHQbegACwLIxFI48tyfeegx7cuwBxfvHk9dEIJxvbJVc/ogD5TYXmsNUX/fKrIHbsEL/VMP1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763536815; c=relaxed/simple;
	bh=RSm/suJ/Pepr1yB59pObwuGdY4AF0Z9ZtGNsBqUmi+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noz9JCImeJQS8Zn+EeUFYOC1OTjY5oEE0d02t2FG6it2VELzKL+nk/i7Wnq7OPdP7hk324mfdWSbd+o+qq335KS4E4vcqZxuJpga0UcJqwBsnrxnocZkDBHtStC4+D2I3sKMDFCvX3YNoHdZDyjoIpqZsV6XGQTcJbLLCqvJCRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gm15Ny59; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gm15Ny59"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49EEC19423;
	Wed, 19 Nov 2025 07:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763536814;
	bh=RSm/suJ/Pepr1yB59pObwuGdY4AF0Z9ZtGNsBqUmi+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gm15Ny59BIhiuZbk0udrxSlQTJ4Z3Htko5cmlrG3kyhS4JMXkb3ohZfTTSszP7Op3
	 8Y+mjg170oQM59KieR7Zp9/GcYyl9gFPkcgOM0xG/C6SqhgTLlEbSUAhFdZ+epL1iU
	 8JIVITlUGB5ox9lkpJbCI1nKnqJ/rkL7yceFclWYtLc3cC7GKDSj63rI6sVckdULfG
	 J7GLuhA9pyDn1673wGKFra6+VvMnn206vs4GrCDwTCoth9cYlMfJdt8OTESoSr9lmm
	 qyyWskspgyrzzpG1ekyzKUpRbjizuHMzI4z5VGhpfJbZzOROk/27gDX53g26v+TAsG
	 EpIxh4Eig07OQ==
Date: Wed, 19 Nov 2025 08:20:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add AST2700 compatible
Message-ID: <20251119-married-vehement-nautilus-3542a6@kuoka>
References: <20251118-upstream_pwm_tach-v2-0-4d9bc13d34f9@aspeedtech.com>
 <20251118-upstream_pwm_tach-v2-1-4d9bc13d34f9@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118-upstream_pwm_tach-v2-1-4d9bc13d34f9@aspeedtech.com>

On Tue, Nov 18, 2025 at 05:11:53PM +0800, Billy Tsai wrote:
> Adds support for the AST2700 PWM/Tach controller by extending the
> compatible string enumeration in the device tree binding.
> 
> The AST2700 PWM/Tach hardware is compatible with the existing binding
> schema and requires no additional properties or modifications beyond
> the new compatible string.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml          | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> index 9e5ed901ae54..8b579321915f 100644
> --- a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> @@ -18,9 +18,13 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - aspeed,ast2600-pwm-tach
> -
> +    oneOf:
> +      # AST2700 with fallback to AST2600

Drop the comments, useless and redundant. We can read the schema.
Inflating code with obvious comments is not making it better.

> +      - items:
> +          - const: aspeed,ast2700-pwm-tach
> +          - const: aspeed,ast2600-pwm-tach
> +      # Only AST2600
> +      - const: aspeed,ast2600-pwm-tach

And why are you removing blank line?

>    reg:

Best regards,
Krzysztof

