Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3849C309EEB;
	Wed, 14 Oct 2026 23:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792019011; cv=none; b=XdzAtsVp9/4emm+C8tjhVPSvYQbhqHIzEPtZpaDLjhM+joN57rYR7uvH+MFAXoDspfIZ3zX+sDuWMA4QUQK5WJTtOQqd9hJHGZn/sZ5zmrolLXMIwNEA3QIPUreAjyUyia0HZ1n8ZHgAEV5+RDtO7MEtxe/RJhQnE9X1O9U9onQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792019011; c=relaxed/simple;
	bh=pNN7bs+HIFLG/tBJ3Lt1YhOWWAw03qYL46p4fKQYYWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVOM0vk/0fRyXHDYQS9GzUsXRL02TiEp0QO4Jxk+x8qwK1ejuUXGCM2IgrQmHzJaB60YyDDRRurpnJEP7MXmT54AIpRyR/ECruGAgdjDoLaH3ZjBrpCnEpq7kHOb6XOJX+Dyc1EI8EtWhJZBC6tHdOzWWBhO2qqK7wl9nzOI/yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i74D6Dy6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i74D6Dy6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB06D1F000C4;
	Wed, 14 Oct 2026 23:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792019009;
	bh=rFQ+xXBVw2G3dOM+1QoqfL3CKXPuv2twnZR0oxUkiFc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=i74D6Dy6+ybz9t6qaA2NuhDDS0COBDnrGSk9g3B9Ch+vhqXXXYUyrwB/rXjAh+vGv
	 sE+Q/+a8+fMVDo1+cuDGl6gYzOy+yBpzI0Zq1ZcuwiNVFgyfsaUsL/BB49lu2ysOKv
	 2CkBh+OocWzHK5j6FctBg83yrd7xqarWmqkTOiR0agNEWrwuBkiP1Wj3WPbL8b7AJR
	 Ybbviarn0d+DbOZvvdcBmCTCmuoZovw4gnjllxTg6MOa8Xckqzf2J9rWoZ7htlP3vd
	 VINfT1Y/1jYak2IozXpvTOuEf0HVFrBICn6AVZkywkl/6KmVkFYmOxGdnxO0lsyJni
	 F7PuAvzHT3sxw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 76B0DCE0C55; Wed, 14 Oct 2026 16:03:29 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:03:29 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: =?iso-8859-1?Q?Sebasti=E1n?= Peyrott <speyrott@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (minisforum-um780xtx) Fix clamp() build failure
 with GCC 11
Message-ID: <be58a022-4f57-4666-b573-81881de4d779@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop>
 <20261014214522.243253-1-speyrott@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014214522.243253-1-speyrott@gmail.com>

On Wed, Oct 14, 2026 at 06:45:22PM -0300, Sebastián Peyrott wrote:
> GCC 11 fails to build the driver:
> 
>   error: call to '__compiletime_assert_727' declared with attribute error:
>   clamp() low limit 0 greater than high limit points[1] - 1
> 
> The store function returns -EIO unless points[0] < points[1], so
> points[1] - 1 cannot be negative when the clamp is reached. GCC 11 jump
> threading, however, duplicates the clamp() limit check and does not prune
> the copy in which points[1] is zero, so the compile-time check in clamp()
> fires on an unreachable path. GCC 8 to 10 and 12 to 16 accept the code.
> 
> Select both limits first and use a single clamp_val(). This does not
> change behavior.
> 
> Fixes: 9d980da93bbc ("hwmon: Add Minisforum UM780 XTX EC monitoring and fan control")
> Reported-by: Paul E. McKenney <paulmck@kernel.org>
> Closes: https://lore.kernel.org/r/fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop
> Assisted-by: LLM
> Signed-off-by: Sebastián Peyrott <speyrott@gmail.com>

Thank you!!!

Tested-by: Paul E. McKenney <paulmck@kernel.org>

Though it would be *way* better to fold this back into the original
commit to avoid breaking bisection.

							Thanx, Paul

> ---
> Reproduced on next-20261014 (x86_64) with GCC 11.5.0, both with
> allmodconfig and with defconfig plus this driver; GCC 8.5, 9.5, 10.5,
> 12.4, 13.4, 14.4, 15.3 and 16.1 build the unmodified driver. With this
> change, the driver builds without warnings with W=1 using GCC 11, 13, 14,
> 15 and 16 (x86_64 allmodconfig) and GCC 16 (i386 allmodconfig). A small
> standalone reproducer of the clamp() pattern fails only with GCC 11, and
> the patched form builds with GCC 8 through 16.
> 
> Tested on the UM780 XTX: the installed driver and this version produce
> identical rounding and clamping results for both system fan thresholds,
> with every value verified against the EC registers and the original
> thresholds restored afterwards. Module load and unload are also clean.
> 
> An LLM-based coding assistant helped reproduce and analyse the failure
> and prepare this patch. I reviewed the change and the test results.
> 
>  drivers/hwmon/minisforum-um780xtx.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/minisforum-um780xtx.c b/drivers/hwmon/minisforum-um780xtx.c
> index f5d6e18cb651..962ebf41ffb7 100644
> --- a/drivers/hwmon/minisforum-um780xtx.c
> +++ b/drivers/hwmon/minisforum-um780xtx.c
> @@ -180,7 +180,7 @@ static ssize_t um780xtx_sys_point_temp_store(struct device *dev,
>  	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>  	u8 points[2];
>  	u8 readback;
> -	long value;
> +	long value, lo, hi;
>  	int ret;
>  
>  	ret = kstrtol(buf, 10, &value);
> @@ -198,13 +198,15 @@ static ssize_t um780xtx_sys_point_temp_store(struct device *dev,
>  	if (points[0] >= points[1] || points[1] >= data->sys_point3)
>  		return -EIO;
>  
> +	if (!sattr->index) {
> +		lo = 0;
> +		hi = points[1] - 1;
> +	} else {
> +		lo = points[0] + 1;
> +		hi = data->sys_point3 - 1;
> +	}
>  	value = DIV_ROUND_CLOSEST(value, 1000);
> -	if (!sattr->index)
> -		value = clamp_val(value, 0, points[1] - 1);
> -	else
> -		value = clamp_val(value, points[0] + 1,
> -				  data->sys_point3 - 1);
> -	points[sattr->index] = value;
> +	points[sattr->index] = clamp_val(value, lo, hi);
>  
>  	ret = ec_write(um780xtx_sys_point_offsets[sattr->index],
>  		       points[sattr->index]);
> 
> base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
> -- 
> 2.54.0
> 
