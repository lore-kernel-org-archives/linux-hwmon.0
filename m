Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370C626ACC
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 11:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777719726; cv=none; b=OjGrSlHQetxPI8Mez4Z83TMrwXf0w5ENb/OtHJuepCgvehDkTgNf0q3HlAZvC5k9h0YYn8Mq6SgtDhYHkyY/hNZVm4i8hxFOsE1wTpp4KJ82VoKVbKcdlPcz33hialXBYBVennALWxBRQFwZ1HWyF1cjhrYAaHsGjROFp3D+BLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777719726; c=relaxed/simple;
	bh=0WCjieGWQK0PVQzmRC5jCLWVEzs855JUlJZCOJKppok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UxeMRtMfQozlxiQIX0WV/7/YVr2gK7XpTT9CVFd0dO5X4648i+SDW2119yCgrBoKG3VLTzcswD0ZRXW1u7hPq6XmlPv9REYrE/rm4V06vo/wFtfvDh1sKwhyHOgCmkx5rFYATnpieSs6kor1WqjVdM2F2YcBVjOEyMmosyFvNbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lc2PLMqt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lc2PLMqt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08C5C19425;
	Sat,  2 May 2026 11:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777719725;
	bh=0WCjieGWQK0PVQzmRC5jCLWVEzs855JUlJZCOJKppok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Lc2PLMqtUV0zv5JuYuxdhoLeh77Ma4kINTcrrbtAqIfzCoQFuV1j6B1VTlpSw6yoY
	 k/n+xNNC7uIDAaWqt6iyqZVotXf6mKHIpxlqxPRTKxDL8EU2UxSUkHelALnHVOtvC3
	 cPZ9czEQ1rJGxjWI2wBZbkhVcbbMZLJB0wLFCPCOi108Y7eQ6N0KAD48nGN3F7Y2lb
	 ikDp0lHC74YoTARqffBRMtJFVqTCTUDVpNbdDargEUpwQVUwvM+CVBtkKQBHr54/1Y
	 NSWKkQWqjnMy0ViHFD+bIM/e4cVkpinAkTO59JpnXQ9z9zxvbhaB2pD5nC9ca3uAAB
	 XYM7r3MrhuqGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6EgdmlhIEI0IFJlbGF5?= <devnull+nuno.sa.analog.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260502-ltc4283-support-v13-3-1c206542e652@analog.com>
References: <20260502-ltc4283-support-v13-3-1c206542e652@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 02 May 2026 11:02:05 +0000
Message-Id: <20260502110205.B08C5C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware glitch in `ltc4283_gpio_direction_output` because pin dir=
ection is set before output value.
- [High] NULL pointer dereference in `ltc4283_init_valid_mask` if platform =
data is not provided.
- [High] Missing PGIO pin initialization logic contrary to commit message, =
leading to incorrect state reporting.
--

commit 75b887d21b6291239c2e7e790fcef64a2fef85d7
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

This patch introduces GPIO support for the Analog Devices LTC4283 Swap
Controller. It adds a new driver via the auxiliary bus interface to manage
up to 8 pins configurable as GPIOs.

> Note that PGIO pins are not set as GPIOs by default so if they are
> configured to be used as GPIOs we need to make sure to initialize them
> to a sane default. They are set as inputs by default.

Is the PGIO pin initialization logic missing from the probe sequence?

The commit message mentions initializing them to a sane default, but there
doesn't appear to be any logic in the driver's probe sequence to enforce
this. If the hardware default config for these pins is not
LTC4283_PGIO_DIR_IN, ltc4283_pgio_get_direction() will return
GPIO_LINE_DIRECTION_OUT for any other value, leading the GPIO framework
to mistakenly report the uninitialized pins as outputs.

[ ... ]

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

Does this sequence cause a hardware glitch?=20

By calling ltc4283_gpio_direction_set() before __ltc4283_gpio_set_value(),
the pin is configured as an output before the new value is written. As these
are two separate regmap operations, the hardware will briefly drive the old
value present in the output register onto the pin.

Should the intended output value be set first, and only then enable the
output direction to ensure a glitch-free transition?

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

Can the mask pointer be NULL here if the parent device does not provide
platform data?

If dev_get_platdata() returns NULL, passing it to bitmap_copy() will
result in a NULL pointer dereference, as bitmap_copy() does not internally
check for a NULL source pointer.

Would it be safer to add a check to handle the absence of platform data?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502-ltc4283-su=
pport-v13-0-1c206542e652@analog.com?part=3D3
