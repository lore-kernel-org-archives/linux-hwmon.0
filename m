Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E536B3C10A0;
	Thu, 16 Jul 2026 21:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237575; cv=none; b=NT4nQCRpUwzfvcpLzMlkmE0OdRd+YrT3BtefcVOTRKPkOix0qHmIs0Yf1PrpR8nNcW217e+thnrdq1ZLVz6nbIJMytRFFUGKlB4haRzb61np7cELlUp8YYs7QIBeeZD31SE5Dj9c1KorLBB3HZ+xxQWl1A6pH4s1BUPrMv9rybE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237575; c=relaxed/simple;
	bh=aKJ4URduusNk/zvJKmyaYFhgUdMyokDYBo6nJI5B2O8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pMAwj4XDYdOsZOiZMrTOhiAo6nUYNzAMl3iqjWVKnelvFnVJt/a0wA4JAuBMsu4q6umXuuOiZmJ1n58Hx0FdmtZ2RLjjyy+KAkV4jP2TeyCTP4VL0p/Drn+DUAnf9F8LHHv9Z7TZNSs3xA1+U9pNb/GpwLYfFtZJRWXDYC0kwaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LETe42vk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LETe42vk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACA71F000E9;
	Thu, 16 Jul 2026 21:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784237573;
	bh=dVZ712FSxNbeKR8rMDzLvUdRn11bLdpeg3fYR06hlXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LETe42vk6uMI3+msfbQOrKJHv04WlYeYXxJxDZNI9tsongsV7gUa7wWJo6f/z+T7D
	 PTk9N7q8Js959TomC5xmXwi0TU+labXoGWf/N0Hg15JG5jUy/Ay6ewcYyJT4/YfEmz
	 avF5gBrLzzm512yAqzDBs/LL8ePfcwkz28IxeVsWM31pjWyzIu1d4Wcr+V/OQ8iE6l
	 vFr2n66TWmOsITNlBC0H/+p8f/scjmHrWfFQPCWcEUy+eYPvWpRGgzmoci8note/zY
	 yA0wVpBGLb/5B3vGt1NmAV8V9bRYLT9SxWnF2sob3EGVlKv5lJTPfhRg8Hln7rBNsd
	 jY8A30Vtnoeiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] hwmon: (adt7470) Add ADT7470_PWM_MAX macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260716-adt7470_thermalzone-v1-2-cc55ef35edde@gmail.com>
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
 <20260716-adt7470_thermalzone-v1-2-cc55ef35edde@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 21:32:52 +0000
Message-Id: <20260716213252.EACA71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] I2C error during adt7470_read_temperatures() leaves fans permanent=
ly stuck in manual mode
- [High] Unbounded sysfs values for auto_update_interval and num_temp_senso=
rs cause a tight loop and I2C bus flooding
--

--- Patch [2]: [PATCH 2/4] hwmon: (adt7470) Add ADT7470_PWM_MAX macro ---
commit 176c7576aebc83ec3b52518b957109a401b37ada
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Add ADT7470_PWM_MAX macro

Instead of a magic 255, use a macro to refer to it.

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 664349756dc2b..4ac292cd7f47e 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -100,6 +100,7 @@ static const unsigned short normal_i2c[] =3D { 0x2C, =
0x2E, 0x2F, I2C_CLIENT_END };
>  #define ADT7470_REG_FAN_MAX(x)	(ADT7470_REG_FAN_MAX_BASE_ADDR + ((x) * 2=
))
> =20
>  #define ADT7470_PWM_COUNT	4
> +#define ADT7470_PWM_MAX		255
>  #define ADT7470_REG_PWM(x)	(ADT7470_REG_PWM_BASE_ADDR + (x))
>  #define ADT7470_REG_PWM_MAX(x)	(ADT7470_REG_PWM_MAX_BASE_ADDR + (x))
>  #define ADT7470_REG_PWM_MIN(x)	(ADT7470_REG_PWM_MIN_BASE_ADDR + (x))

[ ... ]

[Severity: High]
This is a pre-existing issue, but could an I2C error during
adt7470_read_temperatures() leave the fans permanently stuck in manual mode?

If there is a transient I2C bus error (e.g., NACK) during
adt7470_read_temperatures() when updating ADT7470_REG_PWM_CFG(2) or
resetting ADT7470_T05_STB_MASK, it looks like it returns immediately:

drivers/hwmon/adt7470.c:adt7470_read_temperatures() {
	...
	err =3D regmap_update_bits(data->regmap, ADT7470_REG_PWM_CFG(2),
				 ADT7470_PWM_AUTO_MASK, 0);
	if (err < 0)
		return err;
	...
}

If the function returns here, does it fail to restore PWM_CFG(0) back from
manual mode?

On the next iteration of the periodic kthread, might the driver read this
corrupted manual mode as the original state, permanently locking the fans
in manual mode?

[Severity: High]
This is a pre-existing issue, but does an unbounded sysfs value for
auto_update_interval and num_temp_sensors cause a tight loop and I2C bus
flooding?

When setting the auto_update_interval, the value is allowed to be 0:

drivers/hwmon/adt7470.c:auto_update_interval_store() {
	...
	temp =3D clamp_val(temp, 0, 60000);

	mutex_lock(&data->lock);
	data->auto_update_interval =3D temp;
	...
}

If auto_update_interval is set to 0, does the background thread spin without
delay?

drivers/hwmon/adt7470.c:adt7470_update_thread() {
	...
		schedule_timeout_interruptible(msecs_to_jiffies(data->auto_update_interva=
l));
	...
}

If both auto_update_interval and num_temp_sensors are 0, does this create a
busy-loop of I2C bus transactions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-adt7470_th=
ermalzone-v1-0-cc55ef35edde@gmail.com?part=3D2
