Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE4E34B682;
	Wed,  2 Sep 2026 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359201; cv=none; b=smCnyEAx7ZSvikkkSY0zrYsjcjMsUyGmQoqAHbZyWTFSjLrKGMefFs8DGU7ua18b8scVI2gQcvfweAi844L4z+0JVE7ytiIuAmlr0+MWZwm3gnWg3vRsWv/Wdh8hETMi7Ob6s+Brtuz8fZ9JIqKJ8NDS727kLKYRYrrkGeYUV0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359201; c=relaxed/simple;
	bh=6pnUS24KLxJU8vsNrCQ35P3B4gSS5eeN0K9s/ckslV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFQmFOBm9r4FRJFK6ywcnRBipQDSadTVbI6kY2uiQ8ltiXi+dp+wuuW6/eh4E6ugvq0lq2h+0MKUZLfzW16dCZb7C2yKAIFEMc/oRKkhjeiCd06KVFIrGvotYKsvP2PySBh40EDMHLdrAiaHarnLtzm9tTC89PSJtWu/fsVDxQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=KKjvJebU; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="KKjvJebU"
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id E0AE3780507;
	Wed,  2 Sep 2026 16:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1788359197;
	bh=6pnUS24KLxJU8vsNrCQ35P3B4gSS5eeN0K9s/ckslV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKjvJebUIvQiOpAfLjhUJAFJfeUpVKWcSdYodH9AiJvDlcml3yvC12dmkntFpkwyA
	 sPW+b1/G1XdO6lT2U22K4KKdwQ9ZJC07u30I3c0f+bRfuybUcJ369Lic5C5AP8j70u
	 Dd+WBMtf6mmVEwe2i2L5XZejjl8Hsqb8viO8LnBi6wgW77oz/4AQ4BZBZhkpGpmTnq
	 4r0S5WmN0Blbhl8dh+MWJ0fAmeODn3i/RV9NKgGTgv2aKtUO98WrflJxnXu8+z+jkc
	 lhyxsc4CBHVYBEhKGSN1cuex4/B28i6MrkCxKhDOVuilFblhB6CHMW+NO2Az0s7KnH
	 zoDkXVNn+XZ5w==
Date: Wed, 2 Sep 2026 16:26:27 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: ti,tmp401: add
 #thermal-sensor-cells
Message-ID: <apgyEzLFXnyXEkPF@L30177.local>
References: <20260825-for-upstream-dt-tmp401-vcc-tsc-v2-1-cbc360ec51d9@free.fr>
 <20260828-weightless-ferret-of-pluck-ef2baa@quoll>
 <bc51c907-a523-4b99-bf3a-b23c5823fd56@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc51c907-a523-4b99-bf3a-b23c5823fd56@roeck-us.net>

Hi Guenter,

> The driver does register thermal zones. Since #thermal-sensor-cells is
> mandatory for using it, I would think that the property is needed.

agree. thanks.

> However, not all chips supported by the driver (and this bindings file)
> have more than one channel, so I suspect that the value range might
> need to be "enum: [0, 1]".

I could switch to "enum: [0, 1]" if you would still prefer it, but
tmp401_probe() sets temp_channel_config[0] and [1] unconditionally (local plus
one remote diode) and tmp432 adds [2] for its second remote.
So each case in this binding has at least two channels and the channel index is always
meaningful. That is why "const: 1" is used, matching national,lm90.yaml,
which covers a mix of 2 and 3 channel chips.

I'll send a v3, that does not change the yaml by that applies the proper comments
per Krzysztof's feedbacks.

best regards,
  Vincent
