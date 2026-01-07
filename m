Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6250C26A08F;
	Wed,  7 Jan 2026 08:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773650; cv=none; b=tuvtP/JiTts7W4xrWY62aVtbPwhN6kUSCduP827+8Kho6dKsh2j0csvih6IkRVrhKsRJ4sm02KB5K3ixaisv4F0qUMbUUfknCcIDZUduwmK1+ICSzkBxbdeP8EI3IHUuyytlMpgRWQctNbdZE7ZKoEroVBgsurJ46DiOxeZc7xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773650; c=relaxed/simple;
	bh=oqWblsQJnZEXS64taA/InJSpvOjYFs8E+jPob3Z1VF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+MFichldPIRIZFwYZrOhbEcega9o0/U0HKkMdM/LyIsmWRhHGrJjtE/sEOlOuM2XOlJ1zPnbzBg+oTAJcTJE19yC9Q9LpXB3qZbrdzvX9KU0U9MYzgjkeBFfzwP/RzS8BMTus+FdbkPncZaZtkO6UfwIIURGhtgiqKZIDvqG6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eB+6PaJP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eB+6PaJP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FC0C4CEF7;
	Wed,  7 Jan 2026 08:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767773650;
	bh=oqWblsQJnZEXS64taA/InJSpvOjYFs8E+jPob3Z1VF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eB+6PaJPiJoHlvnu4fyHI3OHWnnyeprRp3/6B3w+10ShK0mKteI4XMKwKsEwyVbQb
	 QoRv6jDSAbH0jpOFlF++/IB4U4Bo+zAaAdOt+BX9tdlDlTFVKTi0zfiIgKAlJUUHw9
	 z/LdZWBuvwxbPVMBGToQw6Q/WLG0tBopxuBg5z1QebeDDAHuqfsJihZ5SdZKdmg4l8
	 Q8xe+UZ9DbNiBPUwVo3ud2b9poBENDba5fzOj+sEojYIwpzN3EBaYMbqpidvu21ni6
	 XLy/z1NGqC06kzYsgPrNaht1GIdRfABs69fbx7BkJiQar2QzJ1hY1df5l5vBJK0STf
	 Qel5Ymek6x+Nw==
Date: Wed, 7 Jan 2026 09:14:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vasileios Amoiridis <vassilisamir@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux@roeck-us.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
Subject: Re: [PATCH v1 1/2] dt-bindings: trivial-devices: Add hitron,hac300s
Message-ID: <20260107-beautiful-charcoal-ammonite-673a14@quoll>
References: <20260106160353.14023-1-vassilisamir@gmail.com>
 <20260106160353.14023-2-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106160353.14023-2-vassilisamir@gmail.com>

On Tue, Jan 06, 2026 at 05:03:52PM +0100, Vasileios Amoiridis wrote:
> From: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> 
> Add HiTRON HAC300S PSU to trivial devices since it is simple PMBUS
> capable device.
> 
> Since this is the first supported device from this vendor, document its
> name to the vendor-prefixes.yaml file as well.
> 
> Signed-off-by: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index d0f7dbf15d6f..4864ef9bed7c 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -123,6 +123,8 @@ properties:
>            - fsl,mma8450
>              # MPR121: Proximity Capacitive Touch Sensor Controller
>            - fsl,mpr121
> +            # HiTRON AC/DC CompatcPCI Power Supply

Typo, CompactPCI

With this fixed:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

