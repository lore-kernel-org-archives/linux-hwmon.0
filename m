Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C15348C4B;
	Thu, 24 Sep 2026 08:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237464; cv=none; b=dzVxkeZVIbm6Vjeh7pCwSEB1HkNDyhHZMtatkbjtTgR3GUdIxI1fM+69LUhwioWbxc2L2MabLALSZJt9cdSxFQpTHWTaOVDyQ3HZox6XEfS32LN/b53Zxs31h4KMm8OwOnt3Yt+XVmdYPSW79T2yMhLlJ01IUNvnKmCE3yV73Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237464; c=relaxed/simple;
	bh=u/zCSPgotF04F4tEk89JtGPviFNZt0zCsAzwMIg57OI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaRA6+9vREoS80mJx1fyBZtS2uSsoVHQ1b1uBa/cpG2B1j7UGmmHFZWm+wFBGhF2mGKXX/qTrOcpMGQLQj1KAVag4GHS/uuu+GovsrjdDALlXq+2qvIFszqmZUwWEmzv3ckcctimZmxELW7LxuReNQz0SYsgXBDefQpi7M3egJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=layloauo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="layloauo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A671F000FF;
	Thu, 24 Sep 2026 08:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790237463;
	bh=hfqRxle/hFfTdy4URaW6NUOCmaEuRP2IH3lVRTZex/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=layloauoUgWYmwy+dhIybkzZXC6wP+nJ+B8MGdrFLKD177nfPYOqEag3ujhv6+ym1
	 b3lv5z+tpbrhhqoBvpTnDhATE/xFZYijTmzmJxHZpk8KRkvqCmu7/VrdgS3tWpsL3n
	 WYyNaRzy11RFmQ/X0Y9rsumk79UKxBZvB0QDDGNV8YKeZNgzIZWiJs98ppESUfxpYD
	 0iof4jlrU+96tBgElcBZP/1sIWtKXK7dw0GS0QEf2lI+BrUlJivzAKhu5iG2tiwpqi
	 UyulyEoXryfx+2f7WznPkGv8N0iE66nkEaC93pXDim4sqBlN1LY9Lao0sUoQmRLozd
	 dreKboWZYE6gg==
Received: by pali.im (Postfix)
	id EF2B243B; Thu, 24 Sep 2026 10:11:04 +0200 (CEST)
Date: Thu, 24 Sep 2026 10:11:04 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Emanuel =?utf-8?B?w4F2aWxh?= <avilaemanueel@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell 16 DC16250 to fan control
 whitelist
Message-ID: <20260924081104.o2dwdhr6sk2a6f3t@pali>
References: <20260924044829.2889204-1-avilaemanueel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924044829.2889204-1-avilaemanueel@gmail.com>
User-Agent: NeoMutt/20180716

On Thursday 24 September 2026 01:48:29 Emanuel Ávila wrote:
> On the Dell 16 DC16250, the BIOS keeps the CPU fan at its highest state
> (~4700 RPM) even when the system is idle at 45 °C, and fan speed writes
> through pwm1 are overridden by the BIOS within a few seconds.
> 
> The I8K_FAN_30A3_31A3 SMM code pair works on this machine through the
> WMI-SMM backend: after writing 1 to pwm1_enable, the fan accepts all
> three fan states (0, 128 and 255 via pwm1) and reports matching RPM,
> and writing 2 hands control back to the BIOS.
> 
> Tested on BIOS 1.8.1 with kernel 7.1.5 (Pop!_OS 24.04).
> 
> Assisted-by: claude-opus-5-5
> Signed-off-by: Emanuel Ávila <avilaemanueel@gmail.com>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 99a58ed26..88837f028 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1679,6 +1679,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>  		},
>  		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
>  	},
> +	{
> +		.ident = "Dell 16 DC16250",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell 16 DC16250"),
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
> +	},
>  	{ }
>  };
>  
> -- 
> 2.43.0
> 
