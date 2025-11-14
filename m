Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE23043C5;
	Fri, 14 Nov 2025 09:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763111255; cv=none; b=Pntj0/wFhLc+AhpQhc5KSLH3n2IFK42+yLtYOzd/fad6tXzQqT7oulJzuuIgBxnBO8hDKhLuCa+BBGuO8ImjVwZEeNLmNa0DzSpXMgoQunIkWCJ9WSMMtakvAQquLtp4pWQ7LsB9ljZI+0qdvlZJE5nuU99aBLg7GbeppIeEm6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763111255; c=relaxed/simple;
	bh=/ddBCSwdHl1U+woLbqOY8Qw0SMVSB++DuvPnSGHgf68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufrKQpJKJ3infzXAl+mdgAAvN/9s4ex64vckyMOaQ5hYtzjEaFhEmLu0VPWoJrOEJRuG/Mo1R5blVCsahOoiwd6b5RPKwYHtTTUXZxbl4D2Tmo0eLBR3otWcPd1vcdTx7uchTdIUtA5ltc7Awb1pcBp4lrDWmMzBfkCDfwF4Z8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rq8hZUJ7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rq8hZUJ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AACC4CEFB;
	Fri, 14 Nov 2025 09:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763111255;
	bh=/ddBCSwdHl1U+woLbqOY8Qw0SMVSB++DuvPnSGHgf68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rq8hZUJ7KxLqX2hz4Gm2yRPi9m8yJC0TKK4zhQI714DypRul9nEq2IB2fMkTHUsBc
	 TOvqnXJJxPzc/f7YEq44+jaZgIyIKeRmK7RaKk0LP9b1bJpkqBy/Dgr+VjgfvEwHNh
	 3GOu3HJWH0b4cjDMu6e9KrOF/p38TWBIzI2oIN7Rx1VJqRrbrZqm6MZI/luJK9cyLn
	 2/7zhFthEeLU1c7fhHr54p+zB5inhrEz97CODcHFfXcAMXF5XGnWCBV2+LXVkoufBS
	 h3XJrVS7gh4HU7Gfg6/i4UyTMpzygpwqVKMfABLYM3m3+ZIPzJ7cQjVCH7izcC60/S
	 jgI1jm8czNetQ==
Date: Fri, 14 Nov 2025 10:07:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: regulator: Add Fitipower
 FP9931/JD9930
Message-ID: <20251114-important-jacamar-of-memory-291cbb@kuoka>
References: <20251114-fp9931-submit-v2-0-cd6998932c4c@kemnade.info>
 <20251114-fp9931-submit-v2-2-cd6998932c4c@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114-fp9931-submit-v2-2-cd6998932c4c@kemnade.info>

On Fri, Nov 14, 2025 at 12:06:42AM +0100, Andreas Kemnade wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@18 {
> +          compatible = "fitipower,fp9931";

If there is going to be new version, please use consistent indentation,
4 spaces. I think I missed this last time.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

