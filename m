Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE78F43E4B1
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Mar 2026 09:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133546; cv=none; b=tLtWDGg10/WmrNIw8OMCaaB0UgrKBF44mWECwAJ3yy2Pa/oWUtXN+RzyyRaPKVSvS3+CvBKQcWAMwmtfw+i8Q/9CyKz9yZrJNhPZ0bJGaru3/RW0OOU3D9ER0uJVTcsvyAGZhCgggZc5p1V3XYVLM76Vd1pSg734PZqkgktfpuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133546; c=relaxed/simple;
	bh=urzp3iSHfEjQ6iVXeHxOKd723Bxmh1Dpct7m2pzwYCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rtr3Cbdrm7LXSJGinC8yImpV36YJiJCY6YgU9CRMhxfOCw8HCMmU4qCJO3kXRbqRmpyYhtngJf3HzW9V+xE1csjCdW8OcvkgYGnn+PEwUKOGi0nbdelzyuj56XjfJ6QngCcjjIX8sUBN8xXnLmH7xGfaa0ScGrNA3h6gCZiL72o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGvv3mFp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGvv3mFp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90004C4AF09
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Mar 2026 09:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133546;
	bh=urzp3iSHfEjQ6iVXeHxOKd723Bxmh1Dpct7m2pzwYCw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BGvv3mFphJVr/W71Ab+mLz86MOU3m31cH/kSXOLTT1V2yP2h099oBKQNjkWk0enm2
	 7TtNKpFbND6vPDUrU1IvTpeENJy8zSUO5+0mTxp32GJ+KB5aZYllCqeqI3GBRXB+Hl
	 /KYwZo4tPT4tJKeU6O0Nb84vDe0stWZrr13Gto3abeNXVZy/w+hCWjh4//9STHJRxg
	 wuNpQCUozana+xGeNK7NI2DZ+EgUv/+UZxq95rppKjjW+TnRFt8w9d/9CnhamFV3cK
	 xXjVSkqw/eVqfYkC+I4Fn/KrIBpxs0PEDbgJ3lp7bS8g+XLydaJAgmBlWhb0SxWqIV
	 s7mhMQV14bQFA==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64ca2b32f46so9344052d50.3
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Mar 2026 02:05:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpaa4rq1+rvnbA5roBR4yGjKyOgLK1c2GrxaRl+JwNaTzkvJNTEzmwuEL4JagXs8nbPbrSe2vJeM+x8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeL8zouTSc8ZTR8HiwtbcVo09im0agSmzBmxroeskrupghcMWj
	GJ/e5kaR0omNt6p4uR/N25ebMpoR8EntGhbdeO7SeVrtt9oyoLP05NI0vE0ccJEY8oAWDQT2i0E
	2yfc3W139RUSfyzDtWmSLZJ6IvXS2y/E=
X-Received: by 2002:a05:690c:650e:b0:797:dd13:c34 with SMTP id
 00721157ae682-798dd79681fmr141387157b3.60.1773133545879; Tue, 10 Mar 2026
 02:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309134920.1918294-1-o.rempel@pengutronix.de> <20260309134920.1918294-5-o.rempel@pengutronix.de>
In-Reply-To: <20260309134920.1918294-5-o.rempel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:05:35 +0100
X-Gmail-Original-Message-ID: <CAD++jL=3GeHNirtN9diGc8R2rxczo4UUL9_ON28jOj_DPP2Sjg@mail.gmail.com>
X-Gm-Features: AaiRm52uh6SAnzEBILcvzoRESMbYM7g3W10GU92cjVyRNQU9KO9ihPcuvQ7y5Lk
Message-ID: <CAD++jL=3GeHNirtN9diGc8R2rxczo4UUL9_ON28jOj_DPP2Sjg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] gpio: gpiolib: fix allocation order in
 hierarchical IRQ domains
To: Oleksij Rempel <o.rempel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 2:49=E2=80=AFPM Oleksij Rempel <o.rempel@pengutronix=
.de> wrote:

> In gpiochip_hierarchy_irq_domain_alloc(), calling irq_domain_set_info()
> before irq_domain_alloc_irqs_parent() causes a NULL pointer dereference
> for slow-bus (SPI/I2C) IRQ chips.
>
> irq_domain_set_info() locks the child descriptor, triggering .irq_bus_loc=
k.
> If the child proxies this lock to the parent, it crashes because
> parent->chip is not yet allocated.
>
> Fix this by allocating the parent IRQs first, ensuring parent->chip is
> populated before the child's .irq_bus_lock is invoked.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> changes v3
> - new patch

Bartosz, tglx: is this something we should apply for fixes?

I think it needs to go into gpiolib for next at minimum, unless
there is some semantic problem with the patch.

Verbose quote:

> -       /*
> -        * We set handle_bad_irq because the .set_type() should
> -        * always be invoked and set the right type of handler.
> -        */
> -       irq_domain_set_info(d,
> -                           irq,
> -                           hwirq,
> -                           gc->irq.chip,
> -                           gc,
> -                           girq->handler,
> -                           NULL, NULL);
> -       irq_set_probe(irq);
> -
>         /* This parent only handles asserted level IRQs */
>         ret =3D girq->populate_parent_alloc_arg(gc, &gpio_parent_fwspec,
>                                               parent_hwirq, parent_type);
> @@ -1657,12 +1644,27 @@ static int gpiochip_hierarchy_irq_domain_alloc(st=
ruct irq_domain *d,
>          */
>         if (irq_domain_is_msi(d->parent) && (ret =3D=3D -EEXIST))
>                 ret =3D 0;
> -       if (ret)
> +       if (ret) {
>                 gpiochip_err(gc,
>                              "failed to allocate parent hwirq %d for hwir=
q %lu\n",
>                              parent_hwirq, hwirq);
> +               return ret;
> +       }
>
> -       return ret;
> +       /*
> +        * We set handle_bad_irq because the .set_type() should
> +        * always be invoked and set the right type of handler.
> +        */
> +       irq_domain_set_info(d,
> +                           irq,
> +                           hwirq,
> +                           gc->irq.chip,
> +                           gc,
> +                           girq->handler,
> +                           NULL, NULL);
> +       irq_set_probe(irq);
> +
> +       return 0;

Yours,
Linus Walleij
