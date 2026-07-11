Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1379921CA0D;
	Sat, 11 Jul 2026 05:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783747280; cv=none; b=qpxsbql3TmkcJLZ1ZlDcBMvydC52U05W73fGCspc6iqPA6HHIr6rkkFLlDqKW2gV+QJBk8kIU2I2bXHpfxAD/mvMoSVm09Qz1Pv7P2nI7Qxb8DADMWYNgOqhjkBiVigY+B9N6bw/tXoxWz6WQWyR7kZ3aog6jPfuyy5UFaSSzVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783747280; c=relaxed/simple;
	bh=v6pgne0CunJw6PsDTbGYzgCWF0Y8IDDivA3XawDoXGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zuv5uE9YCKXXRG7iNtOTOQsHBjSGTHzaj6lZBtwFb+dF2/Y5mrLWU8Nrv15IIcB/HWHCXPHYa7rGO3nhtZC1LowoEjYCcEA8/MRHf/6YxAWGI4rryKgoUIGAdcXoLsznrKpaKm4eFtTs6bubhGr2FmVtiub7cOX0TXpdS0b/BOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B334A20205E;
	Sat, 11 Jul 2026 07:21:14 +0200 (CEST)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1wiQ9K-001C43-25;
	Sat, 11 Jul 2026 07:21:14 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1wiQ9K-000000014Wg-2Czl;
	Sat, 11 Jul 2026 07:21:14 +0200
Date: Sat, 11 Jul 2026 07:21:14 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
Cc: Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	David Jander <david@protonic.nl>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v15 4/6] pinctrl: add NXP MC33978/MC34978 pinctrl driver
Message-ID: <alHSylCU0RISGVn-@pengutronix.de>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-5-o.rempel@pengutronix.de>
 <alEKklx_X4cP3Ire@pqrs.dk>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alEKklx_X4cP3Ire@pqrs.dk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain

Hi Alvin,

On Fri, Jul 10, 2026 at 05:22:30PM +0200, Alvin Šipraga wrote:
> Hi Oleksij,
> 
> On Fri, Jul 10, 2026 at 12:13:53PM +0200, Oleksij Rempel wrote:
> > +/*
> > + * Defensive wrappers for hierarchical IRQ proxying.
> > + *
> > + * gpiolib's hierarchical allocation exposes a lifecycle gap: the child
> > + * descriptor is registered before irq_domain_alloc_irqs_parent() fully
> > + * instantiates the parent chip.
> > + *
> > + * During consumer probe (e.g., gpiod_to_irq()), irq_create_fwspec_mapping()
> > + * allocates the hierarchy. As part of this, irq_domain_set_info() initializes
> > + * the top-level irq_desc and calls __irq_set_handler(). If the irq_desc
> > + * requires locking, __irq_get_desc_lock() will invoke the child's
> > + * .irq_bus_lock before the parent allocation is complete.
> > + *
> > + * Upstream generic helpers (e.g., irq_chip_mask_parent) blindly dereference
> > + * data->parent_data->chip, causing an immediate NULL pointer panic during
> > + * this gap. These wrappers check for a valid parent chip to safely drop
> > + * premature locking or masking events while the legacy subsystem hierarchy
> > + * is still assembling itself.
> > + */
> 
> I encountered the same problem while working on a pinctrl/GPIO driver
> this week. While searching lore to see if I'm doing it wrong, I found
> this series. Such wrappers fix the problem for me too (although in my
> case, it's not a slow bus, so it crashes in .irq_mask instead of
> .irq_bus_lock).
> 
> But I see that in a previous version, you were reordering things in
> gpiochip_hierarchy_irq_domain_alloc(). Why did you abandon this
> approach?
> 
> Just wondering if we can find a more generic solution which doesn't
> require such drivers to add this defensive boilerplate. Another option
> might be to move such checks into the generic helpers.

My previous attempts to address it in the core were simply too fragile
and caused other regressions.

To be honest, I have already run out of budget for this task. A lot of
that time was spent just learning how to deal with the new upstreaming
reality. With sashiko.dev, it is much harder to upstream any moderate to
large amount of code now. You either have to use public sashiko and spam
everyone until all issues are addressed, or learn to set up and use your
own sashiko instance.

Because of that, these driver-level wrappers are the most practical way
forward for me right now.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
