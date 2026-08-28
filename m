Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C153E3166;
	Fri, 28 Aug 2026 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911332; cv=none; b=n2lwy6K+Udfsw5AdpZXoB17OhqCp+qqApqbIChWu/KMhB0HNcx9DGY66aOsQbaK++wwzYG0YtqRl6QybeI+QrK8XRi8QKxG27ibRlsQFsU25BsKjBXNNwzk1/fxdRw896vf3RNrSNGURGV/JeXNK0sUAPHjl78gpP6wv35F27gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911332; c=relaxed/simple;
	bh=bWTsBLn9Zi8pkuCX3I/yaIC/rl+jr2FlvVFaaAu0eJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3lOtfMcXfb5fBCviEojaR+yBHK3QhLIfsVHq58BOpqt/ImE6UeQmMTuWjPL+Fbxj9BuFk9urTLOp3M8LfYlRJ86lqRNGTKP89Nhx262kKwjMg8KBM8ORzZm+I3LeBcK597MPrpC7wnzTsMkPlKiZLYehzIcs1bLj6Dpmhpr4xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHWKdvjb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHWKdvjb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4F81F000E9;
	Fri, 28 Aug 2026 10:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787911331;
	bh=CdzP0rcBfvAaEJiCxHa7caervMCqRxSGKElJK3cb35k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FHWKdvjb6bOxosoawZN7GRp+ZQdranBZybCP2X4n4jWaDSeWlcsg9tSyyMhWb2AjQ
	 49BxPdWFhREOk+xxO06HZiJis0Luoi8CnXzmtTcTrWNgiiXGrAsi1nJ4090IlcXX0V
	 4+gjW8AE8E4fCp0wZjbz+MwWANBEy7vLh/RzJSuvX4hhH4gQOnq0cs37hoDReyh3fl
	 UZQP81FNinOlTQXYcq1t4O9uJTPtgQM19mgKc4eOlVFbPFPDowxF89x4QkEY2B4XfY
	 7ZWokTkJxqDVkZt+cg15PMYfbI0RpAV0UR+iksBs1RynrZgo5Iw9yYujq5tnRKADec
	 NlLkEwSXzuwhg==
Date: Fri, 28 Aug 2026 12:02:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: ti,tmp401: add
 #thermal-sensor-cells
Message-ID: <20260828-weightless-ferret-of-pluck-ef2baa@quoll>
References: <20260825-for-upstream-dt-tmp401-vcc-tsc-v2-1-cbc360ec51d9@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260825-for-upstream-dt-tmp401-vcc-tsc-v2-1-cbc360ec51d9@free.fr>

On Tue, Aug 25, 2026 at 12:13:18AM +0200, Vincent Jardin wrote:
> The property is missing, so a board that uses it with a thermal zone fails
> with dtbs_check:
> 
>   tmp411@4c (ti,tmp411): '#thermal-sensor-cells' does not match any of the

Cannot find such node.

How can I reproduce this warning? If it is non-reproducible, then it is
not a valid reason for a change and instead driver implementing thermal
sensor would be the proper reason.


>   regexes: '^pinctrl-[0-9]+$'

Best regards,
Krzysztof

