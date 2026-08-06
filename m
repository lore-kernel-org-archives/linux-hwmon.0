Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1105047CC85
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030461; cv=none; b=Q5diis7wYxFKSFpmgBlLEtaDlCFsDzD5TI+AGxUZ/ZTTs/xG4XAmepRjkeIfqVJKObsraIRzKbYB651eH4jspxI/LJzNnXkjuR3C6abrGJ22yXeUHFvEETcab0m+rLh/0c8NcyK1euEhIecG7O4QzM4F1lAVQQM7mSKFIhNAmfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030461; c=relaxed/simple;
	bh=DctdhrZbmFy5lV7PLyZ1Tv8+iZVg0EJMXb5B9QqxMIY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=At5ipzjyaOacrznA/XooqiuiRhqI6OY1Y8ZuNZbDVY4mzSIy0bY2i/gid/ABQPrWFC0pgVJ7g5hhMEPQo7tRhElVt/EZaxUpLggwhxGhTtJ7WTc834qE1xnO1mpJEKcexXHEms/3N+PkuEKTU74o1N0jMNjdQb5R+T/PAy1OXHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=oL0n6ZpA; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="oL0n6ZpA"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 58FE0240028
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 17:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1786030453;
	bh=NRTtQz5L6H/2EChLV5jGrgZhOEK56e84RSV9vVVW/Is=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=oL0n6ZpAnxDH5YsbSVBjOZsjzF1m11xN1ONUHoSjQm4ABMQiadW7+d6vvanngG08c
	 l+tWOfsMqgUrafX5/E6uvGpuH/pZkRN8EUqUoOfO5tG9UhaFNqrxT4C8o4CtvW+3m9
	 cqy6d/5jdbrjTkXeyqEQ0Rus+qyRJM7UpcjMcH7XL/nA+ayxRHG9yspRyxLcbYPrVW
	 FGtRipMxcrd4ZdsJpVQk8A9jTO9t6wgqjn9uM08EtVoFwpnxy0vJI+lfebMdOJAurO
	 pzLlbwx5o+KX9Npi6CyZ6gF35MXaQ6TQt5XqfqHVNhxiQHQbhdhhcS4OE2MjRR4CET
	 NvcafWXcOMX2A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hGBCS54MXz9rxM;
	Thu,  6 Aug 2026 17:34:12 +0200 (CEST)
Date: Thu, 06 Aug 2026 15:34:13 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] hwmon: (corsair-psu) Fix linear11 calculation
Message-ID: <20260806173411.6be71067@posteo.net>
In-Reply-To: <20260804034811.2385506-1-linux@roeck-us.net>
References: <20260804034811.2385506-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  3 Aug 2026 20:48:11 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> In corsairpsu_linear11_to_int(), the mantissa is extracted using bitwise
> operations and cast to s16 before being shifted left:
> 
> static int corsairpsu_linear11_to_int(const u16 val, const int scale)
> {
>     ...
>     const int mant = (((s16)(val & 0x7ff)) << 5) >> 5;
>     ...
> }
> 
> Due to C integer promotion rules, the masked value (which is always
> positive) is promoted to a 32-bit integer before the left shift. As a
> result, the sign bit is never extended to bit 31 of the promoted integer.
> 
> When the device hardware reports a negative temperature in Linear11 format
> (such as an ambient temperature probe reporting sub-zero), the negative
> mantissa is parsed incorrectly as a massive positive value. For example,
> -1 becomes 2047, which scales to 2047 degrees Celsius.
> 
> Fix the problem by type casting the result of the left shift operation
> to s16.
> 
> Another problem is left-shifting of negative values. In C, the result of
> left-shifting negative values is undefined. Use a multiplication instead
> to avoid the problem.
> 
> Also use a local s64 variable to store temporary results, change
> the return value type from int to long, and clamp the final value
> to LONG_MIN and LONG_MAX to avoid under- and overflow issues while
> retaining as much information as possible.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Skip handling right-shift of negative values
>     (since it is widely used in the kernel)
> 
>  drivers/hwmon/corsair-psu.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index 24100519cd83..c437b469de5c 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -137,13 +137,18 @@ struct corsairpsu_data {
>  };
>  
>  /* some values are SMBus LINEAR11 data which need a conversion */
> -static int corsairpsu_linear11_to_int(const u16 val, const int scale)
> +static long corsairpsu_linear11_to_long(const u16 val, const int scale)
>  {
>  	const int exp = ((s16)val) >> 11;
> -	const int mant = (((s16)(val & 0x7ff)) << 5) >> 5;
> -	const int result = mant * scale;
> +	const int mant = ((s16)((val & 0x7ff) << 5)) >> 5;


> +	s64 result = mant * scale;

Uhm, this is a 32bit multiplicaiton, actully a C gotcha I explain the beginners
in our company. https://godbolt.org/z/eM6TbGG5E

> -	return (exp >= 0) ? (result << exp) : (result >> -exp);
> +	if (exp >= 0)
> +		result *= (int)(1UL << exp);
> +	else
> +		result >>= -exp;
> +
> +	return clamp(result, LONG_MIN, LONG_MAX);
>  }
>  
>  /* the micro-controller uses percentage values to control pwm */
> @@ -263,13 +268,13 @@ static int corsairpsu_get_value(struct corsairpsu_data *priv, u8 cmd, u8
> rail, l case PSU_CMD_RAIL_AMPS:
>  	case PSU_CMD_TEMP0:
>  	case PSU_CMD_TEMP1:
> -		*val = corsairpsu_linear11_to_int(tmp & 0xFFFF, 1000);
> +		*val = corsairpsu_linear11_to_long(tmp & 0xFFFF, 1000);
>  		break;
>  	case PSU_CMD_FAN:
> -		*val = corsairpsu_linear11_to_int(tmp & 0xFFFF, 1);
> +		*val = corsairpsu_linear11_to_long(tmp & 0xFFFF, 1);
>  		break;
>  	case PSU_CMD_FAN_PWM_ENABLE:
> -		*val = corsairpsu_linear11_to_int(tmp & 0xFFFF, 1);
> +		*val = corsairpsu_linear11_to_long(tmp & 0xFFFF, 1);
>  		/*
>  		 * 0 = automatic mode, means the micro-controller controls the fan using a plan
>  		 *     which can be modified, but changing this plan is not supported by this
> @@ -283,12 +288,12 @@ static int corsairpsu_get_value(struct corsairpsu_data *priv, u8 cmd, u8
> rail, l *val = 2;
>  		break;
>  	case PSU_CMD_FAN_PWM:
> -		*val = corsairpsu_linear11_to_int(tmp & 0xFFFF, 1);
> +		*val = corsairpsu_linear11_to_long(tmp & 0xFFFF, 1);
>  		*val = corsairpsu_dutycycle_to_pwm(*val);
>  		break;
>  	case PSU_CMD_RAIL_WATTS:
>  	case PSU_CMD_TOTAL_WATTS:
> -		*val = corsairpsu_linear11_to_int(tmp & 0xFFFF, 1000000);
> +		*val = corsairpsu_linear11_to_long(tmp & 0xFFFF, 1000000);
>  		break;
>  	case PSU_CMD_TOTAL_UPTIME:
>  	case PSU_CMD_UPTIME:

