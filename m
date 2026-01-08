Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2576A349B17;
	Thu,  8 Jan 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862476; cv=none; b=l7HODvSFbNAi+AtevsXRykq/31jkQD2FpJ+9kMsU0sEylXeQbWiFKWHy6Xsnd9dqLd2wbrTKmqmXGh+EMuluZFPUcL7py2fUpRfvdb/y8+jUF2Qu9PnbaUrpjk/sT1T/ghoUqla7pyhbFA5Hyn3XdermpY75WWG6mHfa+3yDX2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862476; c=relaxed/simple;
	bh=Ziy9aaHAgwvY2cPjnsyJ6rbWWo+AZCS0Bl5tdRjqMMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2rXXP16lH71EbR8Wb6F3OrcYqx3/d1Z3vEOPnwEikkCmiohYd0gZBKibNlzmOv6zZ74MfvNhzjj/TV3E3v48egNmzy7dVcsa+zi/ft0Yvpg57Tjp4lMWKtyvtO5vSZgyIs3whinmspBU92C46MEarHANLVcznWHJtVwpwSfF7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aC5sDkZD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aC5sDkZD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1959EC116C6;
	Thu,  8 Jan 2026 08:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767862474;
	bh=Ziy9aaHAgwvY2cPjnsyJ6rbWWo+AZCS0Bl5tdRjqMMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aC5sDkZDu5kmX3hhgm0R8Yj8G3w7lnmeHuv9cUkJyRuBms0iOAy9uguEpH+bm6wZx
	 A7SyBgqvnMXOf4/xcyKE5K0HzMruc5a1VFQYsMtxQKk/uLRuiIxwS5KWuBCNyylr73
	 quQ7P2PO+fBKTU8xoCShrTwPIjoR6HaH8qD7acFC2fDOWv8oQSOQ9OEeETxx+D4jqZ
	 pN8jUMBHcVmyIxU3GNkBGqI+zO5ApLEkgLZznWv3MeGCjGTGWwppgcDX8ig2hNERwx
	 okGmNeXvEMzh1VwIIOk3AqczSd9MFWLoR745KZr0uv2gpheW5Fs4ceA/A0w/0tf3aO
	 omC73ng8cUNmA==
Date: Thu, 8 Jan 2026 09:54:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ASHISH YADAV <Ashish.Yadav@infineon.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon/pmbus: Add Infineon TDA38740A
Message-ID: <20260108-unbiased-kind-wasp-d8b61b@quoll>
References: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
 <20260107144507.46491-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260107144507.46491-2-Ashish.Yadav@infineon.com>

On Wed, Jan 07, 2026 at 08:15:07PM +0530, ASHISH YADAV wrote:
> Document the TDA38740A/25A device tree binding.
> 
> Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>

Also, fails checkpatch on SoB difference.

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Best regards,
Krzysztof

