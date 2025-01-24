Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84F314A0A3;
	Fri, 24 Jan 2025 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737707201; cv=none; b=fI6+zg355aRHjluqrCZoxH94hE1WulQRKiQ4ReE9p9FN2oL3CDOgMNpEUpxjKFd3bkXXbpfF9oadO5qGdu2KovYTqEg4H7dsOyoj/WrL6p8R6WWsr7Miy6Uy2LF3cNVENJZZyonoQr08Aw3e8/aDKAIdPJwuswHUNNRTCKuMxgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737707201; c=relaxed/simple;
	bh=Ofo0uYUStZpU1zs0a3ZDkwn7BF71wktY5+AWmGE7cWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEtORn67xwam8z4ic2+riF6FC/5B/P7NaNVtDLMWCgwXGUwSjxoNCV2/PAkrHPj0CC8hZRIayRFFsM1mdgqIAzd4GRXR8urEoHX5XrePsnLG+oqHgIsdZ2yH6RNFRIucO3OnujmIizifOoUrlNyCuxOwhBIFrKJ+djpZEp2+zT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pn0R8IAr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pn0R8IAr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6E2C4CED2;
	Fri, 24 Jan 2025 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737707201;
	bh=Ofo0uYUStZpU1zs0a3ZDkwn7BF71wktY5+AWmGE7cWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pn0R8IArSHTNWvh9TgNFsTuc3zVRuzunBLtpaSrAPelNGfBMO3JPi/RrAUd7c1xFg
	 +TV9ghIJaADiKrdEGR+NSkoVwnlRQSb/535p0MziYgS30BbbedbTti0VG2sWIUWmoJ
	 rVSfigMYACOiTp03hwUyrXEnd1Tl8Jgree1+6BxHl6cVQ5i748DexcIZhHUXCg/O0T
	 dHg1DBHtcg1tQH0g3/EVkOkiWlsQyeXDlKeDYx30XSoVAkZKWWbtLxsxTv74XN5OVg
	 PK34DXCAVgGZ2/fho31VTL2ZCJSXZy0WvGpZWUVu6nheVjp6qubpzyu1Z3b08rNxOJ
	 bk8fMMMnjewnQ==
Date: Fri, 24 Jan 2025 09:26:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, conor+dt@kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: Add description for sensor HTU31
Message-ID: <20250124-powerful-tricky-wolf-ddafaf@krzk-bin>
References: <20250123202528.223966-1-andrey.lalaev@gmail.com>
 <20250123202528.223966-3-andrey.lalaev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250123202528.223966-3-andrey.lalaev@gmail.com>

On Thu, Jan 23, 2025 at 09:25:07PM +0100, Andrei Lalaev wrote:
> Add trivial binding for HTU31 Temperature and Humidity sensor.
> 
> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof

