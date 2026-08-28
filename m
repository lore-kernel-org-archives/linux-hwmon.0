Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F47F57C9F;
	Fri, 28 Aug 2026 09:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907635; cv=none; b=Ufo8cKRDleZMnxWXz6xEFTakmgJ8yd2CpTdCfHC94ihuCoSYSpFiN3w07CQ6iZoDbg9tggcDd1V7Tu7Ei4iubGuVY/1oUVnuu4HA9I/IyZP+9r/lSihEc0ONqVkf09CmT3We4+TT/vEspNpU26XfthkK1OoDcv0L15dFztOQrFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907635; c=relaxed/simple;
	bh=HzJo9X/GHj0KdA/Oytf9ZOr3X4GryInLd/+c5MlJlzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5PuWMAn9L5n7NCyHtcN1AdVPefsV7PjiiaVyJpNLWyFTCAGfkNJnm6lmXg4Dk3RRcZ0T1YXcjm2LiHTqfj9dVllWmnQMAa3fFA+G7vn/43gge0XBJZ4honNwPlTRPZ9p/KOS57F+nRtQF85TGSlA0+r91x6wOhw4hSysEXBbRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fm32441u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fm32441u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA991F00A3A;
	Fri, 28 Aug 2026 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787907633;
	bh=l98xIy55knSNDWbjx9VGLix+RpwvD+inMHMWp1tpjFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fm32441uh815AjOn4sWiRU7kPXbj9zKXtM/Y95eOT0WTz04OOF4zXmO9yE9VBc/F4
	 3cGHcEiz6DelClc2EsKOImgUjmi4MfAxzD3ErmLdY7DPN6rZGGjEt7lOSf7HqaeSF+
	 pB40uMBhsthC+Tu8vJeLwJHbXRc13OQixVqcNySVzijXPhcoDcxhoKKrIcXrto9hxG
	 W5UqFAVBVaLmhz6YEPNGl/8iOWP/e2+e8uBf2hqy9IOVY9JGcf8MYtfC3iKF3WGCa6
	 +KqiNKJ00s4DXlTh4phMhghf92bDTsvTC4Dm98NH/lcDZPrXfYNoaJ9DpqfXcYr9yv
	 wS6ilD8PY7TAg==
Date: Fri, 28 Aug 2026 11:00:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Srinivas Kandagatla <srini@kernel.org>, 
	Robert Marko <robert.marko@sartura.hr>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: fix typos in various bindings
Message-ID: <20260828-stalwart-brave-zebra-02e72c@quoll>
References: <20260821105605.1967718-1-hanzhijian1991@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821105605.1967718-1-hanzhijian1991@gmail.com>

On Fri, Aug 21, 2026 at 06:56:05PM +0800, hanzhijian wrote:
> Fix spelling errors found by the kernel's scripts/spelling.txt
> and codespell in several devicetree binding documents:
> 
>   - "curent" -> "current" in adi,ltc2991.yaml
>   - "deivce" -> "device" in zii,rave-sp-eeprom.yaml
>   - "ouput" -> "output" in delta,tn48m-gpio.yaml
>   - "redudant" -> "redundant" in trivial-devices.yaml
> 
> Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>

Your name looks a bit like login. Usually Latin transliterations have
space and use capital letters, but honestly I cannot judge.

But here you used different identity:
https://lore.kernel.org/all/20260825141526.3911472-1-hanzhijian1991@gmail.com/

Please use a consistent one.

> ---
>  Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml    | 2 +-
>  Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml        | 2 +-
>  Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml | 2 +-
>  Documentation/devicetree/bindings/trivial-devices.yaml          | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Best regards,
Krzysztof

