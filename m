Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E3D31326A
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 21:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781213953; cv=none; b=KPPGRxyD1WslkaBRhYVDFRKf9d8zPnQuiwwcnxzcSzX1106hV/+sVq+qXM9sXQgCn/cHqg7IHdQNq+qVqppdnSxNRgdwpYq6tsanSMFN7HXAMKR2r+t0ZOsTYMD1jFR3yDAKIskQa9hH+TC8y9P0QCjmg1ameFGJ5qpDs0pNHYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781213953; c=relaxed/simple;
	bh=Vzb7EFon4GkMY3qpDZQTkEoTN0h2qrMwhMPQ3hyVKUU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i7Z0eETJvfFpiphttt2FQakdfheMb05ki+aKjIlq3R9eNeqYG+/jmNnyWfVctWT+yk4yOqD4aY+v7nrdVrrLyHXvg1w65W0f6OKhzwpzEk9tPa94DraNqJuFiB7SV7fEjPyPWGvu8Dut4oi7Wq30bw4YeFakJoGEZ6qCAvA/bVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9QW285t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9QW285t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7961F000E9;
	Thu, 11 Jun 2026 21:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781213952;
	bh=Bu9y9hbZf9AibjCsP6cwJ7PZ6zbq+LEFGTP3/eW+M1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f9QW285tgAx+1+NRAoZ1o/JfwHlXqKeJTsZfNnv1+c2Ru7V+QKPV5YDX2vzxwUTeD
	 REG0keVKYPUMf3zb1rpQT/WMg18grKrlMhTu3uc1dnRtdVb9wBl1+uzKSxfjNlmYrC
	 EortuCIjBkvnLkF6HATCicBULT/kghyaewe3pRPZNel9YXB0e1zf/Wbh+eoKgF4DIc
	 XY1rAf4w+qkLe4cXxI8aYHK5/WS2ih8pUBdGhFvzRRd6Kwu41MdftPCngqa+6pKwkR
	 lwJktanZuie9fsDhcybJQC/d0VGrwgVSKgCuW4zQqc8KVU8oJmDpItubXwwP1mYCxS
	 b8mbcT6xe+QZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] hwmon: (ina2xx) Fix overflow issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260611212634.846262-1-linux@roeck-us.net>
References: <20260611212634.846262-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 21:39:11 +0000
Message-Id: <20260611213912.0B7961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The INA2XX_CURRENT limit calculation artificially restricts physic=
ally valid high-current alerts due to a mathematically flawed clamp derivat=
ion.
--

commit bc9d600ea70203e68f587fb999176459b42802ea
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (ina2xx) Fix overflow issues

This patch updates the return type of ina2xx_get_value() to long to
support a wider range of values on 64-bit systems. It also adds and adjusts
clamping limits in ina2xx_get_value() and ina226_alert_to_reg() to prevent
integer overflows during intermediate calculations.

> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 613ffb622b7c4..b488e58ed2f4f 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c

[ ... ]

> @@ -378,23 +381,27 @@ static int ina2xx_read_init(struct device *dev, int=
 reg, long *val)
>   */
>  static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, long v=
al)
>  {
> +	long limit;
> +
>  	switch (reg) {

[ ... ]

>  	case INA2XX_CURRENT:
> -		val =3D clamp_val(val, INT_MIN / 1000, INT_MAX / 1000);
> +		limit =3D ((INT_MAX - data->current_lsb_uA) / 1000) >>
> +		  data->config->current_shift;
> +		val =3D clamp_val(val, -limit, limit);

[Severity: High]
Does this calculation miscalculate the maximum safe input limit by not
accounting for the subsequent division?

To prevent the final shifted value (val * 1000 / current_lsb_uA) << shift
from overflowing, the limit would need to factor in the division by
current_lsb_uA. Instead, this formula subtracts the LSB and effectively
shifts the INT_MAX / 1000 limit right by current_shift.

For devices like the INA234 (current_shift =3D 4) configured with a small
shunt, the LSB can be very large. As noted in the commit message,
current_lsb_uA can reach 40,000,000. In this configuration, the hardware's
physical maximum alert limit is (32767 >> 4) * 40A =3D 81,880A.

By not multiplying the allowable upper bound by the LSB before the shift,
does this artificially cap the user input to ((INT_MAX - 40000000) / 1000)
>> 4 =3D 131,717 mA (131.7A)? This restricts users to less than 0.2% of the
sensor's valid measurement range.

>  		/* signed register, result in mA */
>  		val =3D DIV_ROUND_CLOSEST(val * 1000, data->current_lsb_uA);
>  		val <<=3D data->config->current_shift;
>  		return clamp_val(val, SHRT_MIN, SHRT_MAX);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611212634.8462=
62-1-linux@roeck-us.net?part=3D1
