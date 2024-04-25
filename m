Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F5C4500E;
	Thu, 25 Apr 2024 16:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714061919; cv=none; b=FQc0ntFWWjIJVk0iusEYJpIHXnjukA3X4ZocngqY+L356ye4HYMXCKtZSc4RfPsZigkmIOlO82MUih1QA6aM8AuAwqp3z+336sDaSyIaFcgg/ziy329nxmhy7m5hoq9kXr9wvKTwfV8qzczW6OB/bD+o8J66aPC5+Bh1ZnatvO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714061919; c=relaxed/simple;
	bh=j5K+XWcl0chvZ7/dqCKO6yG3g+3qdI7sBq8eARToBW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBIMm4bIf+GykmF0EVmqk90tqwL7uarfzzVV2owCy4mTT9LLJdCiZtZaEJlQb3P+rDbtBjejv9eUPuKVs8eA++F9RPGWDk4eEI54ssqErD9rVfs3QQrkkbW3MN4mJ7xLwYwg1ya+Q85G5hdZdtK8Ec+2+U0M2smRdXFZZgxW3fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hnt1FSvY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hnt1FSvY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF468C113CE;
	Thu, 25 Apr 2024 16:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714061919;
	bh=j5K+XWcl0chvZ7/dqCKO6yG3g+3qdI7sBq8eARToBW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hnt1FSvYKGAmhiiYtEr7fD13FTD0a7HWso0JT0JgQw5iA88j+QgLx6ZS45KiWbgJx
	 lZAJSS+ZM3IUz2eDvgAlQ+mI5e0CZmTpYSRqkNhoW+Z+K7WvqAnanO2GvRvOXOQHW6
	 IB46BhLxV13slFDvqtSftNQGLhawKhBWhsJzeC/G1b2/qZxRxU6Rz3eIeD0zN6qWXr
	 TXc0TWGghB4eqgJkcXCorNR5LGvlt7tB/GlvPaun8K98nnglNYAWo23XHgkO5LSoTO
	 F+sfLgfUkfj7NLK8mZrSQUl8c+eoYIVI2GGPd5Zr1XkFiMIvSMzHPLSHyFgFg22ZJJ
	 huClX5crPo0Mw==
Date: Thu, 25 Apr 2024 11:18:36 -0500
From: Rob Herring <robh@kernel.org>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm
 property
Message-ID: <20240425161836.GA2779509-robh@kernel.org>
References: <20240424202448.19033-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424202448.19033-1-peter@korsgaard.com>

On Wed, Apr 24, 2024 at 10:24:47PM +0200, Peter Korsgaard wrote:
> Similar to target-rpm from fan-common.yaml but for the default PWM setting
> (0..255).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
> Changes since v1:
> - Rename to default-pwm
> 
>  Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> index 4e5abf7580cc..70f062b30985 100644
> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> @@ -46,6 +46,14 @@ properties:
>  
>    "#cooling-cells": true
>  
> +  default-pwm:
> +    description:
> +      The default fan PWM to use.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    default: 255

See my comments on v1. Please give time for other reviewers a chance to 
comment.

Rob
