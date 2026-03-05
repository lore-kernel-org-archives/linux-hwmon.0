Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69EC19C54E
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Mar 2026 13:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772718090; cv=none; b=oA6Ue8o85/j7Gxr0QdIoExh1/QHVFC9N9uNmQ4CWWnhQKrQ7HMYarnK9QnhqufJi7tnTy2vZptqgY9YmIW1pJtdrokFw6ibt7MG62amsz6nNHJ2+Mk/JsJ/2+6K+rBWZ0p0L53fnGifdFnyTgbXCTHYwPYAx1aAyV2kqJ9DrSFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772718090; c=relaxed/simple;
	bh=nQ0TL66BvmGTxU4P/K19cUkjZF7VrlRWe+4oIDFI9cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZgaR9MurjcCvr5alzK7SZtU7KbNfQmbtlb7H895sHjChLcvjr0W/Re1p0LQ/0aTQxEj5xdDqliUeZftnWeDJSGkz2jCVQLXql3zBXzqv34ATeGUaYo3Cf+5p1uH0djL8iFaCS5eyUj5Kk1DCbPzdRrLYedB7D/Y6GoMp1UjGanI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3gviU/h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3gviU/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA60C116C6
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Mar 2026 13:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772718090;
	bh=nQ0TL66BvmGTxU4P/K19cUkjZF7VrlRWe+4oIDFI9cs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a3gviU/h6COsyvtnM03E/mUVslzF6/qF358oxk8ufPDD8eIn1by0819SrzlD192uA
	 1Sma8UaYjGAwc8p57mNGa5jDK7+B2vUi1anibEXYGaSBlVVjfpsRG0yOsnDKb+AxIc
	 uUu51jDzjlHY95yHlv1CuM2EdtOqhjD3EbhqFS+94XAvm/lf7hnbFySCiZKa8DTiGa
	 rUWgZ+2zx6Fu0KN0mFsKJFQiKtsiihSNm9Io6TIcoe+gExhP9r1BZ3mSPYcSuIvDFU
	 ljAiZg1u+eRBZ0tJJIU1Zrk5m1iUPRefNdEQipldflK9EPUL9ujoE0mps7Y03inzoS
	 DkQJzRkUaR4jQ==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64c9a398bc7so7564013d50.2
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Mar 2026 05:41:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXFKCdFjAT2revZ+RRM58xP9dus+9myRm1sgp4KHyn7RvDzwkZWOpX6unVmit07r1+vWZByQA0V3EGj2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqxuZZKeGAoekpIg9hHxn9DhTKZu/cmq4+InPZZ0zyYSUHoIOb
	e3D772+bj+Cah1gxhl85aK3EPdb7PCD1BsnB9Sb73T59RHA6K5c4nVJHXHYyJHTQxyDyz7LOZi0
	Qs9aEDdtqmqzgFchLBPJN29tzDrV3E9o=
X-Received: by 2002:a05:690e:e25:b0:64a:d539:1b50 with SMTP id
 956f58d0204a3-64cf9b97783mr3920949d50.38.1772718089942; Thu, 05 Mar 2026
 05:41:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303133947.1123575-1-o.rempel@pengutronix.de> <20260303133947.1123575-5-o.rempel@pengutronix.de>
In-Reply-To: <20260303133947.1123575-5-o.rempel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 14:41:17 +0100
X-Gmail-Original-Message-ID: <CAD++jL=ZYwZ4qCBCnaUPKXGFpNvBgTr3Cyg2ZtrE0ZqAhK1e=w@mail.gmail.com>
X-Gm-Features: AaiRm52QfYDonYBknli9ovJN02qNn7gBdrQenWct8xubGHAgrt_G8nsy7xblEwo
Message-ID: <CAD++jL=ZYwZ4qCBCnaUPKXGFpNvBgTr3Cyg2ZtrE0ZqAhK1e=w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pinctrl: add NXP MC33978/MC34978 pinctrl driver
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, David Jander <david@protonic.nl>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksij,

this is starting to look good!

One thing bothers me:

On Tue, Mar 3, 2026 at 2:40=E2=80=AFPM Oleksij Rempel <o.rempel@pengutronix=
.de> wrote:

> - Add a comment to mc33978_gpio_to_irq() explaining why it must act as a
>   proxy to the parent MFD's irq_domain (shared physical INT_B line with h=
wmon).
(...)

> +static int mc33978_set(struct gpio_chip *chip, unsigned int offset, int =
value)
> +{
> +       struct mc33978_pinctrl *mpc =3D gpiochip_get_data(chip);
> +       int pull;
> +       int ret;
> +
> +       /*
> +        * We emulate open-drain/-source outputs by routing or isolating =
the
> +        * active wetting current sources.
> +        * To drive the line, we apply the current source.
> +        * To turn the line OFF (achieve High-Impedance), we MUST use the
> +        * hardware TRI_SP / TRI_SG tri-state registers to physically iso=
late
> +        * it.
> +        */
> +       if (mc33978_is_sp(offset)) {
> +               pull =3D value ? MC33978_PU : MC33978_PD;
> +               value =3D 1;
> +       } else {
> +               pull =3D MC33978_PU;
> +       }
> +
> +       mutex_lock(&mpc->lock);

Have you considered using guards for this to avoid the goto:s?

> +static int mc33978_gpio_to_irq(struct gpio_chip *chip, unsigned int offs=
et)
> +{
> +       struct mc33978_pinctrl *mpc =3D gpiochip_get_data(chip);
> +       int virq;
> +
> +       if (!mpc->domain)
> +               return -ENXIO;
> +
> +       /*
> +        * The hardware shares a single physical INT_B line for both GPIO=
 pin
> +        * changes and internal hardware faults (hwmon). Therefore, the I=
RQ
> +        * domain and threaded handler are centrally managed by the MFD c=
ore.
> +        */
> +       virq =3D irq_create_mapping(mpc->domain, offset);
> +       if (!virq) {
> +               dev_err(mpc->dev, "Failed to map hwirq %u to virq\n", off=
set);
> +               return -ENXIO;
> +       }
> +
> +       return virq;
> +}

I don't know about this.

If it is clear from internal registers which bits represents the hwmon
IRQs and which bits are GPIO IRQs, the modern way to handle this
is hierarchical irqchip. Have you looked into that?

For a simple example c.f. drivers/gpio/gpio-ixp4xx.c how this
is registered with a parent irqchip using
girq->parent_domain =3D parent;
girq->child_to_parent_hwirq =3D ixp4xx_gpio_child_to_parent_hwirq;
and
ixp4xx_gpio_child_to_parent_hwirq().

This way a unique irqchip for GPIO can be created as a child
of the MFD irqchip.

Yours,
Linus Walleij
