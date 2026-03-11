Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5852236DA08
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2026 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238834; cv=none; b=rJZpNntMMDvnAmJR57J6+SZGcyX6Lx5wDryMTp8x+vn76wOu/ldBRMoAKOp/d6ozcXuR85I2wjFmo4CeIRQHC5nIS7a2kjB58sgDYfYVqSgISJvZ5TqpSFsdVL94yCAwP/LtoL3xrvu+DjPIofJ4dCZX1cc+yQ5le4CJ0BBFBAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238834; c=relaxed/simple;
	bh=cnh6CAbbnR9WAaj+M1JYgtVpVT2ZQw3pWuzndGy6i4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWd0Xf1XmF5alBNw1qoyc7oUYdF+okK9fM8OQUDAuuhqyxPyBNFiZK04RWuQg/I9DCQtYaFcxm353aNZggtPjtFV1psquQmkb8jHy/tnS/S3CqyQNZ8K90ArPgArOyAr7dpuVG8XsJSmrpgoAPatDGdB218siI/2bVE4KvR0uVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZiPDXr3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZiPDXr3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2346CC4CEF7
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2026 14:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773238834;
	bh=cnh6CAbbnR9WAaj+M1JYgtVpVT2ZQw3pWuzndGy6i4M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HZiPDXr3ObuN+g40hAZceJtNQgYW9t4sYhNagcVv+yBljgzsl52nxZwqbQSZpgp0a
	 VhiqYZAgZMg+t1ZloYWduUgAXnqt42G/E/KAFQFQqUf5HnfQbo2OY5Xsz4j/lY7mns
	 DWOSPd5gvDhcvet0ziMEflW3/kYmIbrXpgj8bjt0o4NUJTVr5CXdG+5MYD+0Ulw51H
	 qc8mRG0L72X22JKII8AkD6vf80r/ht7tAg2lTtD/jYFgd3gzaS+Vg19gmdrX2MnQUO
	 howkXkbxSKSQH+FXfRwe3efN2iAG4kk1lCK2bX76uptbXY+ADXk+fVrywp5Ppz4L8s
	 /buUPdLRCnhyA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a43f1f978so42665161fa.3
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2026 07:20:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyZbdBUSBn54MjcEbkdYa5sMNNGzrYl8N7mNEj6w2xU5pDEGY1MUPiqZGPnyYuj9h6HpWYZTd7Hy2j3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrULGkD+UaJEhod026IYxyKvmYP3gsIjLs+FaTLURid72fT9Ug
	v8SAGDZSyBI/cgyalnZbbHaFVwdNuxClKOB4eqmo2vnJWiiII0ZhifgtNHWBCsxZS3AzuAXtUUC
	5RhBNszPJ/AMnlVqr5EUuyvg2hU29zna00Gn/MeBihA==
X-Received: by 2002:a2e:bd16:0:b0:38a:6acb:eb31 with SMTP id
 38308e7fff4ca-38a6acc1835mr7139591fa.26.1773238832610; Wed, 11 Mar 2026
 07:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
 <20260309134920.1918294-5-o.rempel@pengutronix.de> <CAD++jL=3GeHNirtN9diGc8R2rxczo4UUL9_ON28jOj_DPP2Sjg@mail.gmail.com>
 <CAMRc=Mdutv6TyU5SG2uzCgRuvYVmfFB0kwXgj45Qajet+TdBhw@mail.gmail.com>
 <CAMRc=Me5Yb_H3oQ7XtWVs+KViL6pkr0b1Qyb7WW1wtxyGkGhAg@mail.gmail.com> <abFwxtDWvkXHx9KS@pengutronix.de>
In-Reply-To: <abFwxtDWvkXHx9KS@pengutronix.de>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Mar 2026 15:20:20 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc=9+74MZFztduJygEJuTdsY32sJhLFey8N2GQRSR1G-Q@mail.gmail.com>
X-Gm-Features: AaiRm51e9HWwdTlKOtm5LOCmEm_pMxwZ_8uBBDvSjeOinyaMSLlG3MqXK3ow_Sg
Message-ID: <CAMRc=Mc=9+74MZFztduJygEJuTdsY32sJhLFey8N2GQRSR1G-Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] gpio: gpiolib: fix allocation order in
 hierarchical IRQ domains
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 2:40=E2=80=AFPM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:
>
> On Wed, Mar 11, 2026 at 02:18:05AM -0700, Bartosz Golaszewski wrote:
> > On Tue, 10 Mar 2026 10:14:59 +0100, Bartosz Golaszewski <brgl@kernel.or=
g> said:
> > > On Tue, Mar 10, 2026 at 10:05=E2=80=AFAM Linus Walleij <linusw@kernel=
.org> wrote:
> > >>
> > >> On Mon, Mar 9, 2026 at 2:49=E2=80=AFPM Oleksij Rempel <o.rempel@peng=
utronix.de> wrote:
> > >>
> > >> > In gpiochip_hierarchy_irq_domain_alloc(), calling irq_domain_set_i=
nfo()
> > >> > before irq_domain_alloc_irqs_parent() causes a NULL pointer derefe=
rence
> > >> > for slow-bus (SPI/I2C) IRQ chips.
> > >> >
> > >> > irq_domain_set_info() locks the child descriptor, triggering .irq_=
bus_lock.
> > >> > If the child proxies this lock to the parent, it crashes because
> > >> > parent->chip is not yet allocated.
> > >> >
> > >> > Fix this by allocating the parent IRQs first, ensuring parent->chi=
p is
> > >> > populated before the child's .irq_bus_lock is invoked.
> > >> >
> > >> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > >> > ---
> > >> > changes v3
> > >> > - new patch
> > >>
> > >> Bartosz, tglx: is this something we should apply for fixes?
> > >>
> > >> I think it needs to go into gpiolib for next at minimum, unless
> > >> there is some semantic problem with the patch.
> > >>
> > >
> > > Looks good to me. I can take it into v7.0-rc4 via the GPIO tree and
> > > tglx can pull the tag once it's out as a base for the rest of the
> > > series?
> > >
> > > Bart
> > >
> >
> > Oleksij: it doesn't look like there are any dependencies for this patch=
, is
> > it ok if I queue it for the next RC?
>
> ACK, there are no dependencies.
>
> > Could you add the Fixes tag as well?
>
> Fixes: fdd61a013a24 ("gpio: Add support for hierarchical IRQ domains")
>
> Should add it in the next round? There are some pending comments for
> this patch set.
>

No, you can drop it, I'll send it for v7.0-rc4.

Bart
