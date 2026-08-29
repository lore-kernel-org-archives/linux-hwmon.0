Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6109641D20D
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 21:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788038084; cv=none; b=dZBDawib+r2VOb8HJIPjzqBnWOYMnqQryxUoWEhFx40iANYpywqEoZ1aTFDpl4FhUYJLwcj0q/05OAQZ+Jotebimvf0J7+iDcVgntJ0TOZmuMolaHoLVcmxRPyyzP7aZJjKcCFhAxVG3YhVboVDYjiJ1Ponyytsq7fzi9Gidn6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788038084; c=relaxed/simple;
	bh=ZyCHLwv6bcSeHkS9BhVFLDvZxeq1YduhkDkCpHSn6ic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e1MSaU7EYR8say/G20hJJdsN/7JLVNSLeJqI/a+eB09ck7zwZfeH79ym8Kv0hHG/0GbGJK4P02b/0ZmM1DRTmTO1SxT90Sz04FZOfn70cPaYQfN3LGprsZoHrKYYaXiljH9ZRR9AqmaAYJ2Q2gC1/ya/lzDLF/xOOcplCt+HsD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=busj8OVZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="busj8OVZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28291F000E9;
	Sat, 29 Aug 2026 21:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788038083;
	bh=Jtv73zGYX6rganjpnRp+gLOXGWv2YHEwxgldAHT+Yys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=busj8OVZQ0SFBN5OnDilBFOtFU+gyzqr16n1I8q1cjz2STPDXFDcdsMblXzLdT/Ga
	 1/AaUjvuYhj+hJDQVqyUGLxGxxrYPDhQNiJKailVT4ZRaz6BQlUHER1QkodDRE7cSj
	 7gLUgwccXTYKhS+xrDBNQGNX9Yju9TJXRByS1CbHFZTCytVH9+o4nnf/Khoi7zIujk
	 y2bSlYguqrZWNS8e6GVOUAabK0jzjdbKkjcRs41ax6ZAro9YDe6snFog+ZUNbA4XWO
	 1Jh7n8v0rVDnT689OB8Y4MJkX605I61hQpg07vSUxo0KldmnIJ3Z2JkTfJ75jDCuxt
	 B+wA/BsIkTmLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] hwmon: it87: prepare for extended PWM temp maps
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Tollet" <jerome.tollet@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260829210036.61136-3-jerome.tollet@gmail.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
 <20260829210036.61136-1-jerome.tollet@gmail.com>
 <20260829210036.61136-3-jerome.tollet@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 21:14:42 +0000
Message-Id: <20260829211442.D28291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] it87_check_pwm corrupts the PWM control register on newer controll=
ers when fixing broken BIOS polarity.
- [High] User-configured temperature mappings are silently discarded when s=
witching legacy controllers to automatic PWM mode.
--

commit e4890144d7762af5309a78a9545773b57261f124
Author: benoit.masson <yahoo@perenite.com>
hwmon: it87: prepare for extended PWM temp maps

Introduce helper logic for PWM-to-temperature mappings so newer register
layouts can be supported while retaining the legacy two groups of three
temperature sources.

> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 1af815b5d33a9..980e425fcc28b 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
[ ... ]
> @@ -1635,27 +1748,30 @@ static ssize_t set_pwm_enable(struct device *dev,=
 struct device_attribute *attr,
[ ... ]
>  	} else {
>  		u8 ctrl;
> =20
>  		if (has_newer_autopwm(data)) {
> -			ctrl =3D (data->pwm_ctrl[nr] & 0x7c) |
> -				data->pwm_temp_map[nr];
> +			ctrl =3D pwm_temp_map_set(data,
> +						data->pwm_ctrl[nr] & ~0x80,
> +						data->pwm_temp_map[nr]);
>  			if (val !=3D 1)
>  				ctrl |=3D 0x80;
>  		} else {
>  			ctrl =3D (val =3D=3D 1 ? data->pwm_duty[nr] : 0x80);
>  		}
>  		data->pwm_ctrl[nr] =3D ctrl;
> -		it87_write_value(data, IT87_REG_PWM[nr], ctrl);
> +		it87_write_value(data, it87_reg_pwm(data, nr), ctrl);

[Severity: High]
This is a pre-existing issue, but does switching legacy controllers to
automatic pwm mode permanently wipe out the user's deferred temperature
mapping?

When set_pwm_enable() executes the legacy controller branch for automatic
mode (when val is 2), it unconditionally sets ctrl to 0x80. Writing this
value to the pwm control register clears bits 0-1, which discards any
user-configured temperature mappings previously deferred in
data->pwm_temp_map[nr]. Can this logic error lead to fans monitoring the
wrong temperature sensor (defaulting to 0) and potentially causing
hardware overheating?

[ ... ]
> @@ -3493,7 +3596,8 @@ static int it87_check_pwm(struct device *dev)
[ ... ]
>  			if (!((pwm[0] | pwm[1] | pwm[2]) & 0x80)) {
>  				dev_info(dev,
>  					 "Reconfiguring PWM to active high polarity\n");
>  				it87_write_value(data, IT87_REG_FAN_CTL,
>  						 tmp | 0x87);
>  				for (i =3D 0; i < 3; i++)
>  					it87_write_value(data,
> -							 IT87_REG_PWM[i],
> +							 it87_reg_pwm(data,
> +								      i),
>  							 0x7f & ~pwm[i]);

[Severity: High]
This isn't a bug introduced by this patch, but does this write corrupt
the temperature mapping on newer controllers?

When fixing broken BIOS polarity in it87_check_pwm(), writing 0x7f & ~pwm[i]
inverts the manual duty cycle bits for older controllers. However, on newer
controllers the duty cycle is in a separate register, and the pwm control
register instead holds the temperature mapping. Does inverting these bits
corrupt the temperature mapping and cause incorrect fan behavior?

>  				return 1;
>  			}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829210036.6113=
6-1-jerome.tollet@gmail.com?part=3D2
