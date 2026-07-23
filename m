Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B211344DA0;
	Thu, 23 Jul 2026 14:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784818401; cv=none; b=UUFm925Kn21fXtj3/weTVrkC1dqcepdK7yG+fdW2Ur4mdlCOGScSg3k7XWDRCWIdyEDqa4QSRy2sKBtVXpFZ3Fxax2E9uTQKVd5nTZNTCQVD2Sn9bi4cJaHF0+yeLm7wTZjs0/PK+6ewI7ukPm5hT2wHetOCtsUz2V4XZt1BO/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784818401; c=relaxed/simple;
	bh=zYaA0BR0Vwo/A3nMghadgnD3/zM+LKKV9PgIRD76Bys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=poeO4vFbYju7T1EOy+aUq3kmQOJRxd4RDpil8vCsj35Gx9Mth8gp+9g5gWCQRdpfPrmnjzCrWeo/iGiFgJKOjqa/MjEQ1zfbS+Xw6MrMQIz/SEUAiZ41Pd6hICFaheUNX9hn81yUGQMXE3vlwMKUND6fvFFMFQQm+0W63guXEqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16951F000E9;
	Thu, 23 Jul 2026 14:53:14 +0000 (UTC)
Date: Thu, 23 Jul 2026 15:53:00 +0100
From: Lee Jones <lee@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH v15 2/6] platform: misc: add NXP MC33978/MC34978 core
 driver
Message-ID: <20260723145300.GO3363113@google.com>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-3-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710101358.2606941-3-o.rempel@pengutronix.de>

On Fri, 10 Jul 2026, Oleksij Rempel wrote:

> Add the core support module for the NXP MC33978 and MC34978 Multiple
> Switch Detection Interfaces (MSDI).
> 
> The MC33978/MC34978 devices provide 22 switch detection inputs, analog
> multiplexing (AMUX), and comprehensive hardware fault detection.
> 
> This core module handles:
> - SPI communications via a custom regmap bus to support the device's
>   pipelined two-frame MISO response requirement.
> - Interrupt demultiplexing, utilizing an irq_domain to provide 22 virtual
>   IRQs for switch state changes and 1 virtual IRQ for hardware faults.
> - Inline status harvesting from the SPI MSB to detect and trigger events
>   without requiring dedicated status register polling.
> 
> It exports mc33978_core_init(), called by the MFD driver added in the
> following patch. CONFIG_MC33978_CORE carries no prompt and is selected
> by CONFIG_MFD_MC33978, so this patch alone builds nothing new.
> 
> Note: The device currently lacks suspend/resume power management
> callbacks. If the system enters a sleep state cutting power to
> VDDQ/VBATP, the device will wake up in POR state with hardware interrupt
> masks reset. Power management support is intentionally deferred for now.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> changes v15:
> - Split out of the MFD patch, as requested by Lee Jones. The register
>   definitions in include/linux/mfd/mc33978.h are carried here rather than
>   with the MFD driver because this module includes them, keeping every
>   commit individually buildable.

I can't help feeling that this is a hack.

When I suggested moving the functional parts out, I meant properly
separating off and compartmentalising.  Instead, a huge slice has been
taken out of the initial submission's MFD driver and dumped into the
wild west that is drivers/platform.  Worse still; we're masquerading as
the MFD since the MFD's 'dev' pointer is being passed through so
everything here is operating as though it's the parent device.  You've
created half library / half MFD.

I get that we're on v15 and there's still a lot to do, but I guess
that's what happens when 3500 lines of code is submitted at the same
time.

My suggestion is to return to first principles; what lives where?

Allocating of shared resources, including the various regmaps, IRQs and
domains should live in the MFD subsystem - that's literally what it's
for.  Anything that does-a-thing, should be allocated a proper subsystem
and platform drivers should be created.

Complicated platform / embedded-controller type work (events,
conditions, bespoke messaging, etc) that truly cannot live anywhere else
can live in drivers/platform, but perhaps don't invent a new
sub-sub-system here or create an extended MFD device here - it should be
a separate entity.

Take a look to see how the other drivers/platform dumpers work.

-- 
Lee Jones
