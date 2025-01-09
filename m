Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0541A4F1F;
	Thu,  9 Jan 2025 23:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736465172; cv=none; b=pBBeuP9WK0Dcyif0ar1WoULZ7p2nUjX8Y9VvgGsUN0P/4tnT+6ZgmA78qAavPZGEf55EIS1cnKE/hoD4GGuNElj/gWVQJaAqnHACJoYkm9ZGT4pJfWMEcHkORaTymGkK+G840g+sTngDZ0flEo422oX7F5CyBoiqW47drshabn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736465172; c=relaxed/simple;
	bh=F9v1DZTFN4/pGLH68mpiTT5rMWUsLpG+Ls5DxIZs14M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxVsmrqi+MpCgCly7+npwgs0Oj06kJCJeuRxLu0iKDYdQgxOBgV5Ybm9N7bBFfHI8I62cfq77e25/tnj383ePAlh69QSnVjnMujNeELZCPDpvbQg0yi0AanP1JrgNx8cVIQ+gJo35QsZD5BAViC1lC7lrMJwmhPQfn2Okqb53F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUqla9G4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUqla9G4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13440C4CED2;
	Thu,  9 Jan 2025 23:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736465172;
	bh=F9v1DZTFN4/pGLH68mpiTT5rMWUsLpG+Ls5DxIZs14M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oUqla9G4T5d9uCWDAuABl/ZWUEUK0t9Sb8HKtuE2MC9NSUjsjcvyay2JlmNrYYKN2
	 I2WiGfm7ysS3zls6MPYBLOX66k81ni6x9ojd7BQx8c09zAeubskNsV8Hc2jO8dBnkN
	 SX+v1ML6jJxU9TP9TW9iKsJrAYGs5czwRxRt4OWwMtq3COB9seqHzPicwEJKiLW50G
	 5guILgRF1emibAl95e9ucWol3tT4B8vF9Ywxj+8V9jbInZn4tkC8uZRQsulfRdOKNm
	 4M4fEGM+mq6OsmOdWRRxWbzqGuurm9CnbZpks5cmJeoCpVk19Veo5RvByK0qN2smML
	 KnqFAgUYMNvjw==
Received: by pali.im (Postfix)
	id 4AE65768; Fri, 10 Jan 2025 00:26:01 +0100 (CET)
Date: Fri, 10 Jan 2025 00:26:01 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Povilas Kanapickas <povilas@radix.lt>
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell XPS 9370 to fan control
 whitelist
Message-ID: <20250109232601.ziqekyemkrm4yfcx@pali>
References: <6e6b7a47-d0e3-4c5a-8be2-dfc58852da8e@radix.lt>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e6b7a47-d0e3-4c5a-8be2-dfc58852da8e@radix.lt>
User-Agent: NeoMutt/20180716

On Thursday 09 January 2025 23:07:00 Povilas Kanapickas wrote:
> Add the Dell XPS 9370 to the fan control whitelist to allow
> for manual fan control.
> 
> Signed-off-by: Povilas Kanapickas <povilas@radix.lt>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
> 
> Notes:
>     v1->v2:
>     * Use I8K_FAN_30A3_31A3 call instead of I8K_FAN_34A3_35A3.
> 
>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index f5bdf842040e..cd00adaad1b4 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1544,6 +1544,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>  		},
>  		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
>  	},
> +	{
> +		.ident = "Dell XPS 13 9370",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 13 9370"),
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
> +	},
>  	{
>  		.ident = "Dell Optiplex 7000",
>  		.matches = {
> -- 
> 2.39.5
