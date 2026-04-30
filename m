Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66E937FF5B
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 10:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777545289; cv=none; b=XqPiO+SwnO5wX/WKAa9CqLFF1BzpdpVvMkSlG3+W5abK7UrHmHbZA/rnMbrrUouxw5ZjCGys5tip1nTTORBMOdMrVTRswGfk+U6Olp2Jinw+dMHoMH1aUAZAI8jTXz1BzIz+wIjt3UlfpzjBRKfTx8gK/JA+0YkRXjVSeUulQ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777545289; c=relaxed/simple;
	bh=Le27chp0Kggv5wS0Ik6WsnSqQmRN5qnAVdWA1q64Vis=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PTKTYSNpvxWCfQ1n2PfuPFyAWw1Gk6ehdQeHwcpONbMCT70kpzokReJ8GV0W7Q/raYl3gvDcDweOR33bLMQy2+1b68ZbKVyM3CjAmLx4L9eWnaZDIQdRH0UWhmhJzJQzgIlzLOVpPZuaPLg3BT35EaYNgrE6RRDhPfg6UtV6u3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPOSPa3l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPOSPa3l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F2BC2BCB3;
	Thu, 30 Apr 2026 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777545289;
	bh=Le27chp0Kggv5wS0Ik6WsnSqQmRN5qnAVdWA1q64Vis=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=vPOSPa3ldpWAvjVxFw6jNSVBQ/2FRHNdnMCHLOIwAol4gbGgHLEYyzDgn0XqeCayY
	 TmTCOXAKJ5KpQV411YmSOitxuutWbxgtXTQEgc0bijn4L9Ygb+gFJ7T6FMQYkTcBkg
	 vAqWlFJFIxIs2m6+7l3xTJE1aHah1FDvuBDjFVb8pS97IhvDA+f8KcG9yjhe3HZkE3
	 80IJ5c72VKCTX2dvF42rmMEhdjUI5WKxsmU0QpVgq3yMXTlhP1DiAZSh+6Tfcz0EK1
	 KT6ULTHH7S3heSq4t9KXL8RQ4EeWDubZoprTxZXeI0fltsCMfoMgG5Dl0LDLPHvn6F
	 KfIGAYB4dqPLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6EgdmlhIEI0IFJlbGF5?= <devnull+nuno.sa.analog.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260430-ltc4283-support-v12-3-5dc9901f2567@analog.com>
References: <20260430-ltc4283-support-v12-3-5dc9901f2567@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2026 10:34:48 +0000
Message-Id: <20260430103449.71F2BC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardware glitch due to setting GPIO direction to output before s=
etting the output value.
--

commit 50e4fcc0438eacaeeb8d0e7b85d04586253d71c0
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

This commit adds GPIO support for the LTC4283 device. It registers an auxil=
iary
driver and a gpio_chip for up to 8 pins that can be configured as GPIOs.

[ ... ]

> diff --git a/drivers/gpio/gpio-ltc4283.c b/drivers/gpio/gpio-ltc4283.c
> new file mode 100644
> index 0000000000000..6609443c5d62c
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

Does this sequence cause a hardware glitch on the GPIO line?

By calling ltc4283_gpio_direction_set() before __ltc4283_gpio_set_value(),
the pin is configured as an output while holding whatever residual logic
level was previously stored in the output value register.

If the residual value differs from the requested val, the hardware might
momentarily drive the pin with an unintended electrical state.

Should the driver write the intended output value first, and then configure
the pin as an output?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260430-ltc4283-su=
pport-v12-0-5dc9901f2567@analog.com?part=3D3
