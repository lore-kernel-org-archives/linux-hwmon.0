Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6CA37CD47
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Jul 2026 14:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125571; cv=none; b=UxBRJGYEqzagfkE8HP9Xz6IyzerawvCRKHRdIGDZbfcRG714xh+dMwf8MqxHptz4xCgdDW0U4R7E99n5HgYWqwjNsxI7W9ia4/v+j32CwCgWaoBxGvBzLAyeup3jJ6SSqmajvQ1u+hSX3IrCyawP4Kw7HYFF8YAD9O/Yqf1zo+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125571; c=relaxed/simple;
	bh=hpdwsiNEjfNuFjFxJ0I5g9WSEg2XgVxEx2/9Y8ipd8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F54Dwe1B/gNaXNsNHsDI4qnKS+3JlDnmG4gGDjXyqSApBpQcqHpEHVRzvopqs5fsbZl4wGIz9b/x0Ar7WG7v6hZ2C8+UTiFpmPWfqbMjLW2JLyYpo3DpEfrUeW75aLRC3M44IK+owY5S64dkImjnSjNBZYiBP34bM8/9HULwEG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=PXdEp3KE; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="PXdEp3KE"
Date: Wed, 15 Jul 2026 16:25:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1784125564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fi0qgS6ZyNxP8nvy1wv+zBNMPjMZLrFGACMYGND39aQ=;
	b=PXdEp3KEhpLj7alz/9kL5ajjnbh6NVDQM8xgT8Xa83yu3bkVH8a3wDgwPI3Vde5itVPDca
	j1sq64vJc9+XH9O3k4/9//cgiRaEfCwfD07S2MSVdalWuDjUsRiGe2EQjOjqSalnucGb/8
	L8R17WT96u8dHU6hVqltEKwXyKrEhPMaSGoQr/jHuYY4VnC17X0zlyZgGbS2ji8HyTmZDZ
	eF/cEnEKePiTT+sn21Z4/EWT0aAX1sUcC9OTbJROShTl0B+QBexi4wAs+CfMZrm6d9ctDP
	xMbYD1BCYgjegf006x5I6p8K/9cKRLXTzh/jZL6SRs+9PLm/Uw7lYyfTbvy1Xw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, David Jander <david@protonic.nl>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v15 4/6] pinctrl: add NXP MC33978/MC34978 pinctrl driver
Message-ID: <aleRFBOTDDByuT8g@pqrs.dk>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-5-o.rempel@pengutronix.de>
 <alEKklx_X4cP3Ire@pqrs.dk>
 <alHSylCU0RISGVn-@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alHSylCU0RISGVn-@pengutronix.de>
X-Migadu-Flow: FLOW_OUT

On Sat, Jul 11, 2026 at 07:21:14AM +0200, Oleksij Rempel wrote:
> Hi Alvin,
> 
> On Fri, Jul 10, 2026 at 05:22:30PM +0200, Alvin Šipraga wrote:
> > Hi Oleksij,
> > 
> > On Fri, Jul 10, 2026 at 12:13:53PM +0200, Oleksij Rempel wrote:
> > > +/*
> > > + * Defensive wrappers for hierarchical IRQ proxying.
> > > + *
> > > + * gpiolib's hierarchical allocation exposes a lifecycle gap: the child
> > > + * descriptor is registered before irq_domain_alloc_irqs_parent() fully
> > > + * instantiates the parent chip.
> > > + *
> > > + * During consumer probe (e.g., gpiod_to_irq()), irq_create_fwspec_mapping()
> > > + * allocates the hierarchy. As part of this, irq_domain_set_info() initializes
> > > + * the top-level irq_desc and calls __irq_set_handler(). If the irq_desc
> > > + * requires locking, __irq_get_desc_lock() will invoke the child's
> > > + * .irq_bus_lock before the parent allocation is complete.
> > > + *
> > > + * Upstream generic helpers (e.g., irq_chip_mask_parent) blindly dereference
> > > + * data->parent_data->chip, causing an immediate NULL pointer panic during
> > > + * this gap. These wrappers check for a valid parent chip to safely drop
> > > + * premature locking or masking events while the legacy subsystem hierarchy
> > > + * is still assembling itself.
> > > + */
> > 
> > I encountered the same problem while working on a pinctrl/GPIO driver
> > this week. While searching lore to see if I'm doing it wrong, I found
> > this series. Such wrappers fix the problem for me too (although in my
> > case, it's not a slow bus, so it crashes in .irq_mask instead of
> > .irq_bus_lock).
> > 
> > But I see that in a previous version, you were reordering things in
> > gpiochip_hierarchy_irq_domain_alloc(). Why did you abandon this
> > approach?
> > 
> > Just wondering if we can find a more generic solution which doesn't
> > require such drivers to add this defensive boilerplate. Another option
> > might be to move such checks into the generic helpers.
> 
> My previous attempts to address it in the core were simply too fragile
> and caused other regressions.
> 
> To be honest, I have already run out of budget for this task. A lot of
> that time was spent just learning how to deal with the new upstreaming
> reality. With sashiko.dev, it is much harder to upstream any moderate to
> large amount of code now. You either have to use public sashiko and spam
> everyone until all issues are addressed, or learn to set up and use your
> own sashiko instance.
> 
> Because of that, these driver-level wrappers are the most practical way
> forward for me right now.

Yeah, that sounds perfectly reasonable. Thank you for
clarifying. Interesting also to hear your (perhaps frustrating)
experience sending a bigger series. I hope the situation will improve.

Kind regards,
Alvin
