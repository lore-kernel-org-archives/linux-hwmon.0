Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1245B2C326F;
	Fri, 14 Nov 2025 09:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763111149; cv=none; b=hxe2GxvN/7NQfj4KRjZ0l087Qtd1JrKwIDsmsuMs3uetcJEPf+ebomPtd4PcDEeYa5BzBH5uMjZVCnv0K171x+DSsHcfsYc3tfcx/LiE2oiwJBpjRiNcaGKTr4vXJ9H/V/jxU5gfJPjzRc2wEG6DjLA3G1JIvRb+X2Z2O9f60ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763111149; c=relaxed/simple;
	bh=lw/Ole42f8XgEhtaNgpFPB558qwwyIZ07yCBMmuhB4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWwF0ghYZTKv9rgH3ivzwxIlGHpvNqytxxVq0Ox8UQhsaf/GF8a+N+oZ9n9I3U7m63FEHwYxx+WbOzMQDrGoCHlhobt9iiNgkcMD+E5U6Cbtyeb1YBL6P3tcjSX7+zp2+fWc91qkwD3SVoHhEbRDyKSbnXyoExklqG3URF77uTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDSKgpw+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDSKgpw+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1FAC2BC86;
	Fri, 14 Nov 2025 09:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763111147;
	bh=lw/Ole42f8XgEhtaNgpFPB558qwwyIZ07yCBMmuhB4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pDSKgpw+Eh7YEygTAhliignY5DieZqABI6k3B+DP2sKwbE06W3nabA5yB6a8fMHfn
	 /AQWDL+iqzpRhSrG8YO2+/BS9fQncQhYpifMjeY0AP4sj/2slV4tfUm52Jtkbp2drp
	 0WSf86FJRDLlG7zoTtTKF9UvwIznyINxYsWgMiqNJ3+l1yNqaITUnBPgm9FUMHHLfy
	 ouvmNarVBU6APeLdwXyK9Ri+RMh08KZTiCGT/em7MoSYGlkVIsbvO25WCi+CuEf9a+
	 DoNnhc/9daoC+PVf43f9g2aOy3bP517NskqA4XRObaheVKTRzLVUZx840wF4XadYvy
	 kgQ21AcDEgYsg==
Date: Fri, 14 Nov 2025 10:05:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Fitipower
Message-ID: <20251114-festive-spry-axolotl-4253cf@kuoka>
References: <20251114-fp9931-submit-v2-0-cd6998932c4c@kemnade.info>
 <20251114-fp9931-submit-v2-1-cd6998932c4c@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114-fp9931-submit-v2-1-cd6998932c4c@kemnade.info>

On Fri, Nov 14, 2025 at 12:06:41AM +0100, Andreas Kemnade wrote:
> Add Fitipower Integrated Technology Inc. to the vendor prefixes.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

