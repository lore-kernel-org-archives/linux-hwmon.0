Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AD22E92DD;
	Tue,  2 Sep 2025 08:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756802385; cv=none; b=Pm0e/Ow8G9rUYjUjJpQpYwPPR65tUIcmB2ObKM8GzlQbE0xRmR1xRWUVYpaNcvI46ZH4+p6yAlLXsDUBMCHOu4gej1GVdZV8RImQv9UalsLHVY1gh0lqaA3aOHVIdXXqIXv0sjuXJQL4Bydmd5YqihWZsdKXmL3y0fqhtryB9/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756802385; c=relaxed/simple;
	bh=pCX1etlH1LuViL2VgyPA4QXKv1ighlM6KMk0tP7dn28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQL5K0LBD3vsj6qEHITnybHWpbheqY+lfi4MfvGg1/+4Aq0KFiEWgoNjM30E2ZTgpXTFC/utuBsNrXHOIP3e2EPm/wTayZrX4xdLMiJMLlzQsbw1Wl8RyU7PUEHAqc0CweK/1Lz1v+5r+yQRWkLqfxDy2jI485TdEqIOGee+lMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tisHRrgF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tisHRrgF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94308C4CEED;
	Tue,  2 Sep 2025 08:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756802385;
	bh=pCX1etlH1LuViL2VgyPA4QXKv1ighlM6KMk0tP7dn28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tisHRrgFmWpcqn8WhzS9FB3hSrylwFo6fK/OP+9EHDRGfU3EMrGOjMusPhqazUMZu
	 L03GMPbOfXg8+RgMyBpvBjV8iLyPJcQdXgJz1uRyJ2irGRcbjK9WFY048VdeTAyloi
	 4RseR7tnudqGVsEpVT2+DfJFGlPh4OlGTwc+eqGdEm8AFgOKNAvRUMfCy8BXmEiDiW
	 /ZSobAVZAaUDsp7kvFZvVBv4vMbrKP/7a1nJhNDp9mYzuRLJpApEI3eRdPdWrfAIDC
	 Hyd+oEgCD4xO5fxI4fCf0cfeDAB+0ZnbnX0OFISG1ATMsJC5dO/5Zj5UEIJEMFSUlQ
	 wsAJAVa5iSLnA==
Date: Tue, 2 Sep 2025 10:39:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	Christian Kahr <christian.kahr@sie.at>
Subject: Re: [PATCH] dt-bindings: hwmon: ti,ina2xx: Add INA700
Message-ID: <20250902-purring-lively-aardwolf-dca3e4@kuoka>
References: <20250901215648.2696843-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901215648.2696843-1-linux@roeck-us.net>

On Mon, Sep 01, 2025 at 02:56:48PM -0700, Guenter Roeck wrote:
> Add a compatible string for INA700. The chip is register compatible with
> INA780 but implements different ADC ranges and thus needs a separate
> compatible entry.
> 
> Cc: Christian Kahr <christian.kahr@sie.at>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Please mention in commit msg where is any user of that.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

