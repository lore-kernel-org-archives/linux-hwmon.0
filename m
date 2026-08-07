Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064A74B04B1
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 04:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786076795; cv=none; b=Z417DBOTyn9Jkt0baOirCW1Uu2eVbAduxrmMq5Yo0nSKSXwrXeXI7jSpE+q8xxYUzH8oiO5BnW6SwsqJa+nBcFjBcD5RUTOVlliISrrPdkOP1Yg1JgWmZjoeqDOaJEC03stmcyP2bgWo+3ubKiW5eSsG3/xUZb+oWR/3uWx4Cos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786076795; c=relaxed/simple;
	bh=O6ImJgSvFCgfYSunwjmpEACSm/z56ilvaHDLP6SSCMs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JnaQLY1G88ltEhSSfVkoWC5Aue21kwdLYYXyV4rMQAfAmJcYiD4+RtA9wo+NDfo6KhuXMBG+22onxd+srClX0MJn7RmRRvubTKMgFDWpI+9jsxfakyao6GQz22sij4vrdTxk9peVVugUS0iKUY7uwb+Ma7NzoWGddW3Ea41VAts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=WIP3AoiG; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="WIP3AoiG"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 6F6D6240103
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 06:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1786076789;
	bh=lcjPgHxsFfeISevgspG2Xk+sichoIEXow+nYwKLOsxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=WIP3AoiGXjEGexgVK+dGxCwWHYbgqbtq+YWbABNaxk2SSMkeP9DlqmOdXOqkRBGb8
	 cbYKDsWtIk/Yi+k6UMuqClFl5TgWArNqt6XpzhsUwnYpavEAEMiufLuT3OLNHcBbax
	 hGEshYb9OjJOf3Em4/ndOp09NZsn/faxFsalvDY4pNwgSxuyC4UZ/29UN8LwtaR1TS
	 Tp2JstraPqhY/qvr+pkf9mzLBx9N+drjF+Y00dbfr6sEIuF7dzKMndUHdZxHhxMuKa
	 7/G7VLCG5Yv4FGn/NGxj8Q2YwU7uWplf7GuVw/bZUgywr1g+PEMV+FmtxEPRrO5ttP
	 lGVFkOT4UX9Ig==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hGWLX6Nrjz6trs;
	Fri,  7 Aug 2026 06:26:28 +0200 (CEST)
Date: Fri, 07 Aug 2026 04:26:29 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] hwmon: (corsair-psu) Fix linear11 calculation
Message-ID: <20260807062627.3cb50d82@posteo.net>
In-Reply-To: <20260804034811.2385506-1-linux@roeck-us.net>
References: <20260804034811.2385506-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon,  3 Aug 2026 20:48:11 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> In corsairpsu_linear11_to_int(), the mantissa is extracted using bitwise
> operations and cast to s16 before being shifted left:
>=20
> static int corsairpsu_linear11_to_int(const u16 val, const int scale)
> {
>     ...
>     const int mant =3D (((s16)(val & 0x7ff)) << 5) >> 5;
>     ...
> }
>=20
> Due to C integer promotion rules, the masked value (which is always
> positive) is promoted to a 32-bit integer before the left shift. As a
> result, the sign bit is never extended to bit 31 of the promoted integer.
>=20
> When the device hardware reports a negative temperature in Linear11 format
> (such as an ambient temperature probe reporting sub-zero), the negative
> mantissa is parsed incorrectly as a massive positive value. For example,
> -1 becomes 2047, which scales to 2047 degrees Celsius.
>=20
> Fix the problem by type casting the result of the left shift operation
> to s16.
>=20
> Another problem is left-shifting of negative values. In C, the result of
> left-shifting negative values is undefined. Use a multiplication instead
> to avoid the problem.
>=20
> Also use a local s64 variable to store temporary results, change
> the return value type from int to long, and clamp the final value
> to LONG_MIN and LONG_MAX to avoid under- and overflow issues while
> retaining as much information as possible.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Skip handling right-shift of negative values
>     (since it is widely used in the kernel)
>=20
>  drivers/hwmon/corsair-psu.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index 24100519cd83..c437b469de5c 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -137,13 +137,18 @@ struct corsairpsu_data {
>  };
> =20
>  /* some values are SMBus LINEAR11 data which need a conversion */
> -static int corsairpsu_linear11_to_int(const u16 val, const int scale)
> +static long corsairpsu_linear11_to_long(const u16 val, const int scale)
>  {
>  	const int exp =3D ((s16)val) >> 11;
> -	const int mant =3D (((s16)(val & 0x7ff)) << 5) >> 5;
> -	const int result =3D mant * scale;
> +	const int mant =3D ((s16)((val & 0x7ff) << 5)) >> 5;
> +	s64 result =3D mant * scale;
> =20
> -	return (exp >=3D 0) ? (result << exp) : (result >> -exp);
> +	if (exp >=3D 0)
> +		result *=3D (int)(1UL << exp);
> +	else
> +		result >>=3D -exp;
> +
> +	return clamp(result, LONG_MIN, LONG_MAX);
>  }
> =20
>  /* the micro-controller uses percentage values to control pwm */
> @@ -263,13 +268,13 @@ static int corsairpsu_get_value(struct corsairpsu_d=
ata *priv, u8 cmd, u8
> rail, l case PSU_CMD_RAIL_AMPS:
>  	case PSU_CMD_TEMP0:
>  	case PSU_CMD_TEMP1:
> -		*val =3D corsairpsu_linear11_to_int(tmp & 0xFFFF, 1000);
> +		*val =3D corsairpsu_linear11_to_long(tmp & 0xFFFF, 1000);
>  		break;
>  	case PSU_CMD_FAN:
> -		*val =3D corsairpsu_linear11_to_int(tmp & 0xFFFF, 1);
> +		*val =3D corsairpsu_linear11_to_long(tmp & 0xFFFF, 1);
>  		break;
>  	case PSU_CMD_FAN_PWM_ENABLE:
> -		*val =3D corsairpsu_linear11_to_int(tmp & 0xFFFF, 1);
> +		*val =3D corsairpsu_linear11_to_long(tmp & 0xFFFF, 1);
>  		/*
>  		 * 0 =3D automatic mode, means the micro-controller controls the fan u=
sing a plan
>  		 *     which can be modified, but changing this plan is not supported =
by this
> @@ -283,12 +288,12 @@ static int corsairpsu_get_value(struct corsairpsu_d=
ata *priv, u8 cmd, u8
> rail, l *val =3D 2;
>  		break;
>  	case PSU_CMD_FAN_PWM:
> -		*val =3D corsairpsu_linear11_to_int(tmp & 0xFFFF, 1);
> +		*val =3D corsairpsu_linear11_to_long(tmp & 0xFFFF, 1);
>  		*val =3D corsairpsu_dutycycle_to_pwm(*val);
>  		break;
>  	case PSU_CMD_RAIL_WATTS:
>  	case PSU_CMD_TOTAL_WATTS:
> -		*val =3D corsairpsu_linear11_to_int(tmp & 0xFFFF, 1000000);
> +		*val =3D corsairpsu_linear11_to_long(tmp & 0xFFFF, 1000000);
>  		break;
>  	case PSU_CMD_TOTAL_UPTIME:
>  	case PSU_CMD_UPTIME:

Don't see any anomalies here, so the change is fine. Though, my test is lim=
ited,
I can not simulate negative temperatures to fully test this. But that shoul=
d not
matter, because the allowed continuous operating temperature is 0=C2=B0C - =
50=C2=B0C anyway.

Tested-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>

greetings,
Wilken
