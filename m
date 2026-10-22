Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693481;
	b=YDojTwb99sfoOB8UGrMCkuOI7i4RWvIA33NH4yY9SsFlFZFIhNPaGf8GZ/MO3nh23A5D
	 fUnm0I0wy0tjVczJeemYs0C9KHtOvVTReySd6BjEbcK+bZ+J0WLCBfkvrK0SZUQfCMEYB
	 X5EM4bzmbBfpjq/tp3CJ7hWMPcQliNi/LU5VWomUsEwnKIRSQ2Zl+lcCP+JRN1I8nxOYD
	 wmY6zyNoIQawt4xA2x20luguzwYRBLrBfDCVjq/GcpsCjb5PWPtELRjXTKN/bee5Wq8cg
	 148oDVYF+qM1a/2nfGPDdmWIROEw2e3bnoKJ3cjgV48vTJyo0625r3I1+ZOtOuv+5+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693481;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=40z7GD0XTv6isHfm5s3ZXI747Y9N+zbxmXQpu4yJlUA=;
	b=aYmKXG6ssx12v4TJ03Awn85Pj3Yt3hlnbFxpRCRJuM/ghkEYftaLbfBAXhpsbPSAos2J
	 cnNG8JOiLBjRZgUFKvcDHNv8Nhn65CSHOQoIVmsIjasDqB42nEBkmm+yTCUV440G6oO4U
	 evqwyNRku5JR3QgkY+ms7O1bAIPBnNsLGP9Q5UwYxo2QR91DSsMn8LTMCOqQ9FHXWAQ4B
	 TrSDcMKEB6xKy3ld6M5FExc/CkeyzjKTjXUtyBibR8mUIGybJEX8cK4gtjNScD3eCNCV+
	 OWZWoF8iR4cLkNVIgZaCsSRbcyhRgdx11ONEIlb+zaSsM7Yd8wLyQNx4yh+xLjBUvxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AoyJA1j+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B111F606A319
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Oct 2026 18:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AoyJA1j+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065EE1F01828;
	Thu, 22 Oct 2026 18:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693480;
	bh=40z7GD0XTv6isHfm5s3ZXI747Y9N+zbxmXQpu4yJlUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AoyJA1j+PRg/Y0us+8x7rej2NC7Y3edDxUvZouI4SCeQRtjNyYfw5JGM9E5vlCcc0
	 eu4I99Nd0j1wKiT7juL933D3LyduJtxhxO9EnDZ0FcI1tvxgvqOsW3YfAA7KD623Gr
	 D5jFpJM30FtivKlugJCWoHXtXMwQCmUh6Ge9LO0tbPDwkp1kPvW3K7bS7H1uALoTrx
	 8G0BVTM8KWgb9OKPGSkG3w4blihOfUassKkJUPwCi15ihdW+JYYH4CZi2Iny+SWdnl
	 PCzI84Rb5pEmabULNEIKFyJVQU/nxB5ggbHfqT2dwzJnZo05i72rPdnzN/K9PEQj4z
	 cHqMOygU70jbw==
Received: by pali.im (Postfix)
	id 8587BB31; Thu, 22 Oct 2026 20:24:20 +0200 (CEST)
Date: Thu, 22 Oct 2026 20:24:20 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org, serjo32.dev@gmail.com
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell Pro Micro Plus QBM1250 to fan
 control whitelist
Message-ID: <20261022182420.6z7jwf2rbfwnr7xz@pali>
References: <20261022182247.46381-1-W_Armin@gmx.de>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261022182247.46381-1-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716

On Thursday 22 October 2026 20:22:16 Armin Wolf wrote:
> A user reported that the Dell Pro Micro Plus QBM1250 needs to be
> whitelisted for the special SMM calls necessary for globally
> enabling/disabling BIOS fan control.
> 
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/20
> Co-developed-by: Sergei <serjo32.dev@gmail.com>
> Signed-off-by: Sergei <serjo32.dev@gmail.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 88837f028405..43587f98201f 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1615,6 +1615,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>  		},
>  		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
>  	},
> +	{
> +		.ident = "Dell Pro Micro Plus QBM1250",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell Pro Micro Plus QBM1250"),
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
> +	},
>  	{
>  		.ident = "Dell XPS 13 7390",
>  		.matches = {
> -- 
> 2.56.0
> 
