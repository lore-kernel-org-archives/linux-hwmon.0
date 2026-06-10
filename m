Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E661C356A37;
	Wed, 10 Jun 2026 18:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114701; cv=none; b=alk3vOvSHPWg9ZC81N/xDEoT9ZZ/hq5AT0UATBKXBbADk7WPd9ODhd5d7zM+Siz46rw7IFSxItalTWEyMh+6yp4wTMHHpQJkbfMpGRhTkkHUq0myo4lLVgu1cG1xe/hiIpS2ZQf0GllnrSlbMuxAVB0/mKVv9YC+ie7IHpbfvjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114701; c=relaxed/simple;
	bh=ecvrKXnvHoixoWqdG8O6POzhUvcnUtkIrpuWyxJmIgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upKVVmFs66Ut7hKXvd4peYfJe0Qr4oXfkMKt2BLHFCx/LsI2aVrGk8DmJy2LCj2CjMDMsxrQtYFLpc0uC64iQb9EAF8K9zSU0l69k2O7Z/ThxjsXSVi7HhIn8PpgK4lQlQasEj0Kyqo7VyJtiKeJn6k80pRJf2RlHU2SBwsKIdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ariuvMdr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ariuvMdr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EC61F00893;
	Wed, 10 Jun 2026 18:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781114697;
	bh=X0FV1aRcOGpoT+fDnFqAD6TzGy3Mlbv3lQ6ZcfJ10iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ariuvMdrECSyMe1KdDaSOtULoIVbgoXLv22CKrqTaxWp+OpTcpbuAD5jqQzQp6mTH
	 XG0rnZ+VjEFQhhrftIw9kcIL54brtp9+owOQ7I0GvIECM4D6p7X0FeQHxEAUzXY36j
	 rqLGbPfLKbkesNxHefIHMphwbatZaVY42X6rNGAbo+DMPgws8Pso954qyFGG9WAHxk
	 hPg/A2RVtZs6pTvPiCWWwWNovV5D3DBwTu3hqygv2CCJayQKxVNGbpso9Z/4jwxCwT
	 izxet8mNhze4IL6UFRfi9ab0rRUDTCbBBM+EcSIU30+xDo4Eg5Yx0H2Wp7lNC9+0DA
	 X0p0sJ+8oXtrw==
Received: by pali.im (Postfix)
	id 0DF5D4AD; Wed, 10 Jun 2026 20:04:54 +0200 (CEST)
Date: Wed, 10 Jun 2026 20:04:53 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell Latitude 7530 to fan control
 whitelist
Message-ID: <20260610180453.rn7gjbp2fijwbevj@pali>
References: <20260610180141.311503-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610180141.311503-1-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716

On Wednesday 10 June 2026 20:01:41 Armin Wolf wrote:
> A user reported that the Dell Latitude 7530 needs to be whitelisted
> for the special SMM calls necessary for globally enabling/disabling
> BIOS fan control.
> 
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/17
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 038edffc1ac7..9cec0c769e8a 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1574,6 +1574,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>  		},
>  		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
>  	},
> +	{
> +		.ident = "Dell Latitude 7530",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7530"),
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
> +	},
>  	{
>  		.ident = "Dell Latitude E6440",
>  		.matches = {
> -- 
> 2.39.5
> 
