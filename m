Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9A64908D7
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 03:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785124221; cv=none; b=g3S366YRDZ54nYTIAtsj2zV5kaaLnhsYfTPUHUdjonlcegskWDQeHXgfwHHTnLquqcMxH+P4oA5+/YQPEHbUB0iineMVX3EW0dBMICKg0XkYDIBRwfEcAp5efk5Z4EBkzCNfoSHbdxC1ftrhoCFvSnPBcOENmDrpWM/k+lila4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785124221; c=relaxed/simple;
	bh=P8cjMrC3CVEpCKh7zGnyAQC97idOEf9WNp5KxjYCwcU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pvTAdvOgITX9h80Rzb1nYZBZLXxm2U6zeLYlvoW6Nx+ZWkLjp3gtE9LM9km05i6XdjN9/kugypQXg7ZWNYCAqfxxyNwKpCgRgmXYc0b96965n07kCz9mb+H5amfhuWJsNS2EJldCGe8QQzIF3WgPZBi64K0KOxDoTbkqUV/1Pbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mh3jegfd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mh3jegfd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF6F1F000E9;
	Mon, 27 Jul 2026 03:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785124220;
	bh=fVRHOjXuuzFLUqpWJ/zQbQ1ZlMrs1e2Je6QQVxwQe5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mh3jegfdxkPCqxfzkXeraCD+BuzDWE3wDT9wLu2XpcB+EXkPMquzlHu9O6j/01xIZ
	 ViL/9qeX01O6MK+aIXtmc+8EoW2QSqV4myG/gA8adgMYs/CUzEHMBfaaezRQwEREVV
	 p3o5AirA1nB8K/Gu8UIZqMkmhba134iZ21m8JHMsPJPomKgz5aIk8Hi1ytl4KhCnDK
	 xQpwZGyOUU8Cb+DZmydQcd8Hxt5Dk+etDNOJDaNeIJkOB2lCbe03TyRd6w/SV4v3QU
	 3+zckXe6RauhSrjeM9aPjfX8zmaivMvz7V/JWqBhpJB2CPUwwRnskX8cqSEnbh5ogD
	 grOoX/j/oSJ+A==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v3 2/6] hwmon: (adt7470) Fix cache updated before
 hardware write on I2C error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727-adt7470_thermalzone-v3-2-21424d550c3d@gmail.com>
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-2-21424d550c3d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 03:50:19 +0000
Message-Id: <20260727035020.1CF6F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The PWM enable mask logic swaps the bitmasks for channels 2 and 3 =
(PWM3 and PWM4).
--

--- Patch [2]: [hwmon PATCH v3 2/6] hwmon: (adt7470) Fix cache updated befo=
re hardware write on I2C error ---
commit 6776a671fbb0d95bfa3d1f5ca2bae943732d5533
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Fix cache updated before hardware write on I2C error

This commit ensures the driver's cached values are only updated after a
successful regmap_write. By checking the return value, the cache accurately
reflects the actual hardware state even if an I2C transaction fails.

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 481d51617f4be..62ec68ea0a406 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c

[ ... ]

> @@ -847,10 +850,11 @@ static int adt7470_pwm_write(struct device *dev, u3=
2 attr, int channel, long val
>  		val--;
> =20
>  		mutex_lock(&data->lock);
> -		data->pwm_automatic[channel] =3D val;
>  		err =3D regmap_update_bits(data->regmap, ADT7470_REG_PWM_CFG(channel),
>  					 pwm_auto_reg_mask,

[Severity: High]
This is a pre-existing issue, but does this modulo logic for the PWM enable=
=20
mask swap the bitmasks for channels 2 and 3 (PWM3 and PWM4)?

Earlier in adt7470_pwm_write(), the mask is assigned using modulo arithmeti=
c:

    case hwmon_pwm_enable:
        if (channel % 2)
            pwm_auto_reg_mask =3D ADT7470_PWM2_AUTO_MASK;
        else
            pwm_auto_reg_mask =3D ADT7470_PWM1_AUTO_MASK;

This assigns the mask for PWM4 (0x80) to channel 2 (PWM3) and the mask for=
=20
PWM3 (0x40) to channel 3 (PWM4) during sysfs write. As a result, operations=
=20
intended for PWM3 modify the hardware state of PWM4, and vice versa.

The same pattern is used during the periodic sensor state update in=20
adt7470_update_sensors():

    if (i % 2)
        mask =3D ADT7470_PWM2_AUTO_MASK;
    else
        mask =3D ADT7470_PWM1_AUTO_MASK;

Could this cause fans to fail to enter the commanded automatic or manual mo=
de,=20
potentially leading to improper cooling?

>  					 val ? pwm_auto_reg_mask : 0);
> +		if (!err)
> +			data->pwm_automatic[channel] =3D val;
>  		mutex_unlock(&data->lock);
>  		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_th=
ermalzone-v3-0-21424d550c3d@gmail.com?part=3D2
