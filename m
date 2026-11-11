Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411870;
	b=u0rD0659yepQiaeFCOKNmOVfR586qq4qhkfnZ43/qx4BH+njXG5H+QYnzzVeSOr02lOW
	 YEdWZu+97TQdaj0Rqjrydgvo233VS+niksCsjd352D+Wyomxp7ZWiK/UCDwuLDsMJ9DGC
	 Kwr5oFwTFtWUsMPQTYxxorn0LzviDM3EvAKyAwb0eTNZWiYjX5zfJXT4RfBwhVYSmEBoX
	 2ynJ8dmy0+0PkbRxJ4FF4KmmxzMSAlQsH9mfjljK/Ni5ibZFpcYvMpn+3/YXiEMhBUbi2
	 Gf0ms6Pjqg189Ul/SlSi94OM5gXYhBzWClpbUeLAgxIa+Wybd/Wh5CQrhzF3A39j21A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411870;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=WZBJJYuO9Jw3Mle6p1PSqvX7wbBUqo9myC1U18B7xmc=;
	b=XyK+P7JnDf1lWsyoCc4QBOLjldsjOKrgNJVwB3EI7jIxHWlQ9k0YYrrkftcNf1UJjqO1
	 2EA4gSb8S1nQTSaxUwU+blLWOaxYQPTrs4v+2SZ8F9MXRErMlTNdAN+klDQ54s7FmHqA/
	 3UV+GdvgT26GnXEArWEJlWTuBCL8uH+aPwSEgXf8zkvt6ObSC/kqKV1QNMyKDam/vUgE1
	 zwTc/foeKfe24a3R2JtufAlFPhaYe3BDS5RWipM1EdKwZ/V3o9uG58y8O0HdkZyidy3vx
	 1ZDJzUydxx86bzAalmlA2NWz9tZde+KdDDXtG541R2GUBjRpi/xafVQiM7IJs1plKPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mLIQXOdC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0C8606A321;
	Wed, 11 Nov 2026 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mLIQXOdC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203D11F00A05;
	Wed, 11 Nov 2026 15:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794411870;
	bh=WZBJJYuO9Jw3Mle6p1PSqvX7wbBUqo9myC1U18B7xmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mLIQXOdCphxrNEOezHV7qZTRnFCz1/RTBvvn2M/tyZav0mX1LGGj1ZYOlqdZQ3aHT
	 sJKSCIX/ibWDPlON49uZzFngJmQ9gl+OI3igH3UwntBvSu+fSXT7AzD0BVeMf65mcJ
	 QzLvPCDDUafmvh5ObPt32qP0xnKcQEKQaT++M1ZYicuVZVLOeFmXtxyTnpfOGE9Ri2
	 yJ06MEbo3NsrZjh3JLzaB5BfCHMOSuFsySfp9dkfDD6+Um19sax9dzbCly+6rBiqik
	 GekRWxOkrnhNx/V2K9Q0gwEeVHH8TtgKBw+x7Vqr2UIq78LQpa8prU7slFgR2YHp54
	 Ui2EcsLQ96roQ==
Received: by pali.im (Postfix)
	id 3988465A; Wed, 11 Nov 2026 16:44:27 +0100 (CET)
Date: Wed, 11 Nov 2026 16:44:27 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: shadyabh <shady.abh@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell Pro Precision 7 16 PW716260
 to fan control whitelist
Message-ID: <20261111154427.cigjsua4gregykiu@pali>
References: <20261111150435.75965-1-shady.abh@gmail.com>
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
In-Reply-To: <20261111150435.75965-1-shady.abh@gmail.com>
User-Agent: NeoMutt/20180716

+Armin

On Wednesday 11 November 2026 15:04:35 shadyabh wrote:
> On the Dell Pro Precision 7 16 PW716260 the firmware fan control
> cannot be overridden using the default SMM method, writes to pwmX
> are ignored and pwmX_enable returns -EINVAL. The firmware AC fan
> policy also requests speeds below the minimum sustainable speed of
> the fans, so one fan repeatedly stops and restarts every few
> seconds at low load.
> 
> Add the machine to the fan control whitelist using the
> I8K_FAN_30A3_31A3 SMM codes. With this, writing 1 to pwm1_enable
> disables automatic fan control, the fans follow the requested
> state (0: off, 1: ~2500 RPM, 2: ~3950 RPM), and writing 2 to
> pwm1_enable restores automatic fan control.
> 
> Tested on BIOS 1.5.0 with kernel 7.2.15.
> 
> Signed-off-by: shadyabh <shady.abh@gmail.com>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 5ec487843..250d8c1e6 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1687,6 +1687,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>  		},
>  		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
>  	},
> +	{
> +		.ident = "Dell Pro Precision 7 16 PW716260",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell Pro Precision 7 16 PW716260"),
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
> +	},
>  	{ }
>  };
>  
> -- 
> 2.56.0
> 
