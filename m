Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02414364EB8
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696984; cv=none; b=AeJFYYtwJ2xvkBiKoNJlrdPPGnTYg9LjJvLkFS3TYfu1I1zCgZtEY8I/459gL/eZGH4kbpSK1OABcVMQSDsHTkWIXthwwgxlqaayW2VAK/A4l3AnvG8KlvQKfQP020JBbYkb5vgaHxxHBi4pxtWhla2xO0Rl81CNgxOvI1IRk84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696984; c=relaxed/simple;
	bh=HcRdaAu+YXh+oqiaQgcC0oWhTIqjAakazYG64v+Dyn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBzBqZ0AhzKp82EFrHjXImvZTYGgd0MZGHSepHslNosW9Uz3EiIA/gMgoASCz9/1K5t7PuUGyzAVgzDGR4H6b2cS6nHPtfQ+QtxFwOKtRudWS0tqcgfiCBkXRrBJDHgwVGKPBDRjEnhjNB3OmN9qcP3CO1SX16OPjWCyFp5HhZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=1ie5J2yh; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="1ie5J2yh"
Date: Fri, 10 Jul 2026 17:22:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1783696965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9R8U/eYnNbuglVICT64v2YDxI3a9qvevZ58PLGIGQS8=;
	b=1ie5J2yhF6zMiCjIvCyjHYnHhKxyU2OKxL10tXyU/4+dcu9n/fCMfO9V5I3j0E7Ka/NflJ
	nR8E3J5dsCF691kKdRnwil3ZaM14Czwxh2gMqZqTqxSXMyZDJynSyub0Aluw0OClcUdVwf
	zYd5xuKOqEB4kFTgrPFKlVFoZTENdswasSqT8VmA9KfZ25NCQPLfGygHzA1CEAvWhcRJSo
	ydQqv2RbhJoBOLy28wXKJzfBi/KzrLlXaYF+SDX0U/umFZCCS1PfR0oTC55L9rpi5VsXBk
	F4GBgu6Kdj+8wimc6DdAQF353fHa6P54X/+zM9FQfXhIe36VL613FpbihmjWTQ==
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
Message-ID: <alEKklx_X4cP3Ire@pqrs.dk>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-5-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710101358.2606941-5-o.rempel@pengutronix.de>
X-Migadu-Flow: FLOW_OUT

Hi Oleksij,

On Fri, Jul 10, 2026 at 12:13:53PM +0200, Oleksij Rempel wrote:
> +/*
> + * Defensive wrappers for hierarchical IRQ proxying.
> + *
> + * gpiolib's hierarchical allocation exposes a lifecycle gap: the child
> + * descriptor is registered before irq_domain_alloc_irqs_parent() fully
> + * instantiates the parent chip.
> + *
> + * During consumer probe (e.g., gpiod_to_irq()), irq_create_fwspec_mapping()
> + * allocates the hierarchy. As part of this, irq_domain_set_info() initializes
> + * the top-level irq_desc and calls __irq_set_handler(). If the irq_desc
> + * requires locking, __irq_get_desc_lock() will invoke the child's
> + * .irq_bus_lock before the parent allocation is complete.
> + *
> + * Upstream generic helpers (e.g., irq_chip_mask_parent) blindly dereference
> + * data->parent_data->chip, causing an immediate NULL pointer panic during
> + * this gap. These wrappers check for a valid parent chip to safely drop
> + * premature locking or masking events while the legacy subsystem hierarchy
> + * is still assembling itself.
> + */

I encountered the same problem while working on a pinctrl/GPIO driver
this week. While searching lore to see if I'm doing it wrong, I found
this series. Such wrappers fix the problem for me too (although in my
case, it's not a slow bus, so it crashes in .irq_mask instead of
.irq_bus_lock).

But I see that in a previous version, you were reordering things in
gpiochip_hierarchy_irq_domain_alloc(). Why did you abandon this
approach?

Just wondering if we can find a more generic solution which doesn't
require such drivers to add this defensive boilerplate. Another option
might be to move such checks into the generic helpers.


> +static void mc33978_gpio_irq_mask(struct irq_data *data)
> +{
> +	struct irq_data *parent = data->parent_data;
> +
> +	if (parent && parent->chip && parent->chip->irq_mask)
> +		parent->chip->irq_mask(parent);
> +}

Kind regards,
Alvin
