Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE4B356766;
	Mon,  7 Sep 2026 07:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767016; cv=none; b=UOpvDgXUlv9riorlbhcsWH+91zGtFpBSr3+vXNLRRksKJRFqm/wghnmbOXTQQ96zWWhOLp3IYz5aNuqpNQUqRfGp0NETj0UNB6aSH7TtsEvgETlh0RElpV8utNmiDAe25I9+j1MBAjOqgdJaoKxDBmjYhjmWjZf6X8617v2qKug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767016; c=relaxed/simple;
	bh=73N7HaWOUvi6JeCbvZyrIKBy85Hn4IFBjMhnzDo2vMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rvxujp/bCi4eR0d0uNUKdfc9zfogguIjFLmA5euJnTHyqS7CBpHbl8aYbo5S71CkrldbjheWb3z4y/aaw8Jr2w1JUIsD0Xr6GazsEszrVY6UB5iywG6Yj3a3bqRNT4m6E6CIDtmRp7rvgPdYfSt0fc0jDdnTfj2C5erv+UUG2lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+SF3Vf8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+SF3Vf8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736B71F00A3A;
	Mon,  7 Sep 2026 07:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788767014;
	bh=2U0LJa2+6NGYuS6YPV73PvwnOOrnGHIqZijxTc6txuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b+SF3Vf86nNpzU2W5TO6XWzNuHH58klFKzIhjAWiy83h3bcOJRNJM6EtszA1GfHal
	 3kJTEEz4CxizL98R8RK5nLLfiaZnAs2o0mlwGlB9KIgpzUT1qFYYY62DUHxDdfxack
	 uI985PKfaByayo7fKTBOtyPf7U88ssTb+CXWggvPQQu+wWL4SxB5dOAoA1miWi2JZJ
	 o2kx28+TbgTinqnOYrp1D5bV+jnDJAKZQMWSY7/eMTnDP0TFXwKEi+wdql0EqptzNQ
	 mmiIHbIa/tTr4uGrzf6jXUt0eEffXi2XFMf6RacdH892NbSWMvOTEk4pUr3U/f+m9m
	 3YYeeAuT68yrg==
Date: Mon, 7 Sep 2026 09:43:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: hwmon: ti,tmp401: add
 #thermal-sensor-cells
Message-ID: <20260907-subtle-able-cicada-67535a@quoll>
References: <20260902-for-upstream-dt-tmp401-vcc-tsc-v3-1-49c484d2f08b@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902-for-upstream-dt-tmp401-vcc-tsc-v3-1-49c484d2f08b@free.fr>

On Wed, Sep 02, 2026 at 03:54:00AM +0200, Vincent Jardin wrote:
> Since commit

Stray blank line. It's one sentence "commit foo....".

>   a3b61ba2558e ("hwmon: (tmp401) register with thermal subsystem")
> the driver sets HWMON_C_REGISTER_TZ, so the hwmon core calls
> devm_thermal_of_zone_register() for every temperature channel and the
> device can be referenced as a thermal sensor.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

