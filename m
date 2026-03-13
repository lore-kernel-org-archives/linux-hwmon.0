Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09ED392802
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 14:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773412549; cv=none; b=a1cCcV2TiZevusZwsWolx/vzXyEdJI6F4nRftETexYQNjV5+wFPF8flfDq/v69fDVVfUBds0wjYqe8EgqnlUrwsUlV5jT1dusP8ypjm3xGGTTp7XcXr5A0GQRNQK7qokfbcASNmB5YSz8gzsQ2iB5csbYzi1GAgz1CrAUT9hGwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773412549; c=relaxed/simple;
	bh=O2J/uQoWGCK3ip4Lixu2BMrCjPLqW3Zx94+ZkIjekMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MIHau2W9ukcgrLboreQ6sePrEo66FpR9aNI+cA8mdAjcTXW0rRCAFkqDWjREfZa74FkyU9YwqLCjaAr48JOHMMTv/23BIe73hXuIJtRanL2NOXwcnVZ7OMlsjXNrPxLZUBvfzrqmqoEcF9tOU6iCYESTseR0QeeA1PSp6s9kM8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcMIPOlx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcMIPOlx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9935FC2BCB8
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 14:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773412548;
	bh=O2J/uQoWGCK3ip4Lixu2BMrCjPLqW3Zx94+ZkIjekMk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gcMIPOlxmx5TVIcEUhr6VVb9Uz71nC3VqZgdy4jrRyflWw0PHwhFdbHt69io4eLPL
	 kqgjYYLinmnFU9Zkj4vMqRemxBXI+pGGhnOPfC/b0Z7AToeNI0Jx/YiphMjgG2ia9p
	 QK33RhmQj6gUVT1ZorRrXGxsUakkR4bTFowBDBKBXXrmfMnAevq0SY9SXty2++on9N
	 GE3w5G8llVJVkUQWsGKA/U9KFjc0OTRXZaYyUFtJL5jmWm3jfnTXjHRxJ93kzhFOAP
	 rSd2gLetvBhF1wfvlLjDlVW96PvWGkdzZ44+2dcGfyMHeENNsf1qDh4wdnsBT9RvcH
	 izggXM9PJzKqw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a67221fe8so19462331fa.3
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 07:35:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3XxuxahidsgpTrSo3i0mOutIJ/kckKZ4fOtafDNn3dELpNDV3rUru0pxKtBwTs5fEJaAVG/N0x2Oq+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzittkdnhVDGymX2UTN9pRdtHOQWObfpWRiptBAu9ZKst9go7pG
	npQo4w6ndxxYaZinarbB6yQsbNUVtqmtfFaioUBslBVeWQlLy4aoSc3EI5tsNPxMEziTy3q0Gst
	bDKeH/izIJ7P89PvNjUVANK+YZCXM9Rtm5GK4FieURw==
X-Received: by 2002:a2e:bc05:0:b0:37b:a30e:fe1e with SMTP id
 38308e7fff4ca-38a896b63edmr11623971fa.18.1773412546966; Fri, 13 Mar 2026
 07:35:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
 <20260309134920.1918294-5-o.rempel@pengutronix.de> <abPqGvy5FqJ0a0ug@tom-desktop>
 <abQMQAbbvV60bV2j@pengutronix.de> <7b1e12b2-f55d-4e70-9cb7-ecfa9d82ebdf@bp.renesas.com>
In-Reply-To: <7b1e12b2-f55d-4e70-9cb7-ecfa9d82ebdf@bp.renesas.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Mar 2026 15:35:34 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc4x0SOfoxB9Fv4VUmNjJLjdBnMSmFG=Y1JvLih6cODww@mail.gmail.com>
X-Gm-Features: AaiRm51exk9bRfCOxBgMLnbyRkpHTWu9jExfiPkKZkcq3MNpB6_WKeGjZSAnPjg
Message-ID: <CAMRc=Mc4x0SOfoxB9Fv4VUmNjJLjdBnMSmFG=Y1JvLih6cODww@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] gpio: gpiolib: fix allocation order in
 hierarchical IRQ domains
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>, biju.das.jz@bp.renesas.com, 
	tomm.merciai@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 3:05=E2=80=AFPM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Hi Oleksij,
>
> On 3/13/26 14:08, Oleksij Rempel wrote:
> > Hi Tommaso,
> >
> > On Fri, Mar 13, 2026 at 11:42:34AM +0100, Tommaso Merciai wrote:
> >> Hi Oleksij,
> >> Thanks for your patch.
> >>
> >> I'm working on DSI support for RZ/G3E
> >>
> >> from this morning rebasing on top of next-20260312 I'm seeing
> >> the following:
> >> I found out the the issue is related to the interrupt of the adv7535
> >> bridge:
> >>
> >>          adv7535: hdmi1@3d {
> >>                  compatible =3D "adi,adv7535";
> >>                  ...
> >>                  ...
> >>                  interrupts-extended =3D <&pinctrl RZG3E_GPIO(L, 4) IR=
Q_TYPE_EDGE_FALLING>;
> >>
> >> RZ/G3E is using:
> >>   - drivers/pinctrl/renesas/pinctrl-rzg2l.c
> >>
> >> Reverting this patch fix the issue.
> >> (git revert a23463beb3d5)
> >
> > Thank you for the feedback! If I understand the problem correctly, the
> > adv7535 is asserting its IRQ line early during probe, which creates an
> > irq storm due to a missing handler.
> >
> > My patch moved irq_domain_set_info() after the parent allocation. When
> > the parent allocates the IRQ, the pending hardware interrupt fires
> > immediately. Because the child descriptor isn't fully configured yet, i=
t
> > routes to handle_bad_irq. This fails to acknowledge the hardware
> > interrupt, locking up the CPU and causing the RCU stall.
> >
> > I hope splitting the irq_domain_set_info() should fix the regression.
> > Can you please test if this change resolve the RCU stalls on your setup=
:
>
> Thanks for sharing.
>
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 13dd97344b26..376daeddbbbb 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -1628,6 +1628,9 @@ static int gpiochip_hierarchy_irq_domain_alloc(st=
ruct irq_domain *d,
> >       }
> >       gpiochip_dbg(gc, "found parent hwirq %u\n", parent_hwirq);
> >
> > +     irq_set_handler(irq, girq->handler);
> > +     irq_set_handler_data(irq, gc);
> > +
> >       /* This parent only handles asserted level IRQs */
> >       ret =3D girq->populate_parent_alloc_arg(gc, &gpio_parent_fwspec,
> >                                             parent_hwirq, parent_type);
> > @@ -1655,13 +1658,7 @@ static int gpiochip_hierarchy_irq_domain_alloc(s=
truct irq_domain *d,
> >        * We set handle_bad_irq because the .set_type() should
> >        * always be invoked and set the right type of handler.
> >        */
> > -     irq_domain_set_info(d,
> > -                         irq,
> > -                         hwirq,
> > -                         gc->irq.chip,
> > -                         gc,
> > -                         girq->handler,
> > -                         NULL, NULL);
> > +     irq_domain_set_hwirq_and_chip(d, irq, hwirq, gc->irq.chip, gc);
> >       irq_set_probe(irq);
> >
> >       return 0;
>
> Tested on RZ/G3E + adv7535.
>
> With this fix all is working fine on my side.
> I'm not more seeing the seeing the RCU stall.
>

Ah, I sent this patch upstream for v7.0. I will tell Linus to not pull
it. How do we want to handle it then? Should this patch go together
with the rest of the series?

Bartosz
