Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD6D18A6A8
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 00:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777422304; cv=none; b=Ilp6V0Xm+tE83J8M5SA+8NgsKXoM46h0Kr2z+0h3UU5R3P3zg3vVGlsve1u7ossHlwFCowYGZfbxkgMHhBrK6nkexmXHuqpSRU0Pip/TwR6an+frnEN0/go1CFTvwiHkoJ6XfEkj6dcmGULVfZwJn9+0TpQi3PKdZmH/dfy/lUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777422304; c=relaxed/simple;
	bh=uo/wuF+NrfUf8XMqXplAPbVTbXosbJFNV3FzHsyLSNo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k4CLuoJ1evK2gGj1XoU3R6Ufm5f6SCyT5mC+CoYHaFA1Or1Io8KGCxTiQnTIFdIsS3uF2jVj4dblHEdv7+Hr0meUdwbitxZCkHdHv28uKRtfhElwEOFAZFdnZVFhslUuEcZ8WaaLZLvZ//AWV0lyAVa9dFpa6GL1exlgJOeVTZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjDMXiAO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjDMXiAO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29322C2BCAF;
	Wed, 29 Apr 2026 00:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777422304;
	bh=uo/wuF+NrfUf8XMqXplAPbVTbXosbJFNV3FzHsyLSNo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=RjDMXiAOl07rw0sdyZsqzN762rg7Hd4MC8EcPbNlLYYL0h/CXx4hJozUeeVSOu6bQ
	 IrBkK+AlEcuWc0yBsLxkjTwJxkykv8IlrYGWM0c8qxmFxQRWYtQ5db18T7vA/rIToc
	 P5K5Vcd8/SLjZQbCw5McS1Syype8oFM2tup+KLVgQF7vOxgoxnA8MTPX8YraMW3hFQ
	 buMdOqhu5ve8eM6TSkbbpyysYQiKWA3wgIcvIDetxCUYb2adVV6eCmRvtQk6gOWBhn
	 IPlNw5uA+kicVcpMxAz1u88SPA+iS9lngf417s4Ykuatlvu9WdzKKcwyV9mOsK33LF
	 5SnoEPmK65cWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6EgdmlhIEI0IFJlbGF5?= <devnull+nuno.sa.analog.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260428-ltc4283-support-v10-3-4f26f46491c3@analog.com>
References: <20260428-ltc4283-support-v10-3-4f26f46491c3@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2026 00:25:02 +0000
Message-Id: <20260429002504.29322C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Unchecked NULL pointer dereference in ltc4283_init_valid_mask(=
) leads to guaranteed kernel panic on probe.
- [Medium] Hardware glitch in ltc4283_gpio_direction_output() caused by set=
ting pin direction before the output value.
--

commit b21abd683d70453a9fa63ff159113ec69ce2380a
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

This commit introduces a driver for the GPIO functionality found on the
LTC4283 Negative Voltage Hot Swap Controller. It provides support for up to
8 pins configured via an auxiliary bus.

> diff --git a/drivers/gpio/gpio-ltc4283.c b/drivers/gpio/gpio-ltc4283.c
> new file mode 100644
> index 000000000000..6609443c5d62
> --- /dev/null
> +++ b/drivers/gpio/gpio-ltc4283.c

[ ... ]

> +static int ltc4283_gpio_direction_output(struct gpio_chip *gc, unsigned =
int off, int val)
> +{
> +	struct ltc4283_gpio *st =3D gpiochip_get_data(gc);
> +	int ret;
> +
> +	ret =3D ltc4283_gpio_direction_set(st, off, false);
> +	if (ret)
> +		return ret;
> +
> +	return __ltc4283_gpio_set_value(st, off, val);
> +}

Will this cause a transient hardware glitch on the output pin?

If ltc4283_gpio_direction_set() configures the pin as an output before
__ltc4283_gpio_set_value() establishes the intended logic level, the pin
might temporarily drive a stale value from the output data register.

Since the registers are accessed via an I2C regmap, there is a measurable
delay between these two operations. Would it be safer to reverse the order
and set the output value before changing the pin direction?

[ ... ]

> +static int ltc4283_init_valid_mask(struct gpio_chip *gc, unsigned long *=
valid_mask,
> +				   unsigned int ngpios)
> +{
> +	unsigned long *mask =3D dev_get_platdata(gc->parent);
> +
> +	bitmap_copy(valid_mask, mask, ngpios);
> +	return 0;
> +}

Will this cause a NULL pointer dereference during device probe?

If the parent driver creates the auxiliary device without setting
platform_data, dev_get_platdata() returns NULL. Passing this directly to
bitmap_copy() as the source argument:

include/linux/bitmap.h:bitmap_copy()
    if (small_const_nbits(nbits))
        *dst =3D *src;

will dereference the NULL pointer. Should there be a check to verify mask
is valid before copying it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260428-ltc4283-su=
pport-v10-0-4f26f46491c3@analog.com?part=3D3
