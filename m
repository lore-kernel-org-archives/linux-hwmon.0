Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DCA36B902;
	Thu, 23 Jul 2026 16:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824466; cv=none; b=UBhaUYBRXjipxvayFlT1n7TwsSh1yvBTvbqtGbA6kUL7g8Ygjyq5+vwJR0RBsPKgJGhMByc3SvMS0RAcNcJNWSRxCbbLA7cOME9wH72riSaazZJiWqWDAttqIOC837bPC1S/Aea4oEDEU9iCArbV+Jneiu4fYcREi2Wp2Z5XfX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824466; c=relaxed/simple;
	bh=j7bx3BJJRohANpxx0FlLoKaRt2dW3bi9pja3vbe6rgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fv648EN5zN2QeSr7xngdnvz9D26zyg40ItKoV/MT1SvlQ/+qCPMUAraP3v7hrzvtgEPoOvt4jPTIuCvmgpb3x9xEXIvchKpCNLEHWDIJHeQ7FE7A77TBGE+5ol8/QWlSZCgn67Prw1HtN9SU2vwZEc3ZY5q/DoG3J5qwF/znS60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id DBBA6202015;
	Thu, 23 Jul 2026 18:34:16 +0200 (CEST)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1wmwNE-000vXM-2d;
	Thu, 23 Jul 2026 18:34:16 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1wmwNE-0000000Ei0l-2w4l;
	Thu, 23 Jul 2026 18:34:16 +0200
Date: Thu, 23 Jul 2026 18:34:16 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH v15 2/6] platform: misc: add NXP MC33978/MC34978 core
 driver
Message-ID: <amJCiIrqLuZjXUTl@pengutronix.de>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-3-o.rempel@pengutronix.de>
 <20260723145300.GO3363113@google.com>
 <amItd-189DyfS52Y@pengutronix.de>
 <20260723160933.GD3526803@google.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723160933.GD3526803@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain

On Thu, Jul 23, 2026 at 05:09:33PM +0100, Lee Jones wrote:
> On Thu, 23 Jul 2026, Oleksij Rempel wrote:
> 
> > On Thu, Jul 23, 2026 at 03:53:00PM +0100, Lee Jones wrote:
> > > On Fri, 10 Jul 2026, Oleksij Rempel wrote:
> > > 
> > > > Add the core support module for the NXP MC33978 and MC34978 Multiple
> > > > Switch Detection Interfaces (MSDI).
> > > > 
> > > > The MC33978/MC34978 devices provide 22 switch detection inputs, analog
> > > > multiplexing (AMUX), and comprehensive hardware fault detection.
> > > > 
> > > > This core module handles:
> > > > - SPI communications via a custom regmap bus to support the device's
> > > >   pipelined two-frame MISO response requirement.
> > > > - Interrupt demultiplexing, utilizing an irq_domain to provide 22 virtual
> > > >   IRQs for switch state changes and 1 virtual IRQ for hardware faults.
> > > > - Inline status harvesting from the SPI MSB to detect and trigger events
> > > >   without requiring dedicated status register polling.
> > > > 
> > > > It exports mc33978_core_init(), called by the MFD driver added in the
> > > > following patch. CONFIG_MC33978_CORE carries no prompt and is selected
> > > > by CONFIG_MFD_MC33978, so this patch alone builds nothing new.
> > > > 
> > > > Note: The device currently lacks suspend/resume power management
> > > > callbacks. If the system enters a sleep state cutting power to
> > > > VDDQ/VBATP, the device will wake up in POR state with hardware interrupt
> > > > masks reset. Power management support is intentionally deferred for now.
> > > > 
> > > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > > > ---
> > > > changes v15:
> > > > - Split out of the MFD patch, as requested by Lee Jones. The register
> > > >   definitions in include/linux/mfd/mc33978.h are carried here rather than
> > > >   with the MFD driver because this module includes them, keeping every
> > > >   commit individually buildable.
> > > 
> > > I can't help feeling that this is a hack.
> > > 
> > > When I suggested moving the functional parts out, I meant properly
> > > separating off and compartmentalising.  Instead, a huge slice has been
> > > taken out of the initial submission's MFD driver and dumped into the
> > > wild west that is drivers/platform.  Worse still; we're masquerading as
> > > the MFD since the MFD's 'dev' pointer is being passed through so
> > > everything here is operating as though it's the parent device.  You've
> > > created half library / half MFD.
> > > 
> > > I get that we're on v15 and there's still a lot to do, but I guess
> > > that's what happens when 3500 lines of code is submitted at the same
> > > time.
> > > 
> > > My suggestion is to return to first principles; what lives where?
> > > 
> > > Allocating of shared resources, including the various regmaps, IRQs and
> > > domains should live in the MFD subsystem - that's literally what it's
> > > for. 
> > 
> > This is exactly, what you suggest do move to the separate location.
> > 
> > > Anything that does-a-thing, should be allocated a proper subsystem
> > > and platform drivers should be created.
> > 
> > Every thing you suggest to move is making regmap and irq work in
> > the first place.
> 
> Let me know if the above doesn't make sense and I'll try to find another
> way to put it.  Essentially slicing the code out and simply relocating
> it, but still operating as the same (MFD) platform device, is not an
> acceptable strategy.  When I suggested that it should be moved, I meant
> properly separated, not just sliced and shifted.

I mean, the problem is - this HW is kind of tricky. We need to monitor
status bits on each SPI frame to convert them to interrupts. This is why
we have special regmap bus implementation with all related
IRQ code. This code allows to have simple gpio, hwmon and mux drivers.

This hack which we are currently moving around is regmap bus and irq
extraction layer which is coupled with regmap bus code. From my
perspective, it make no much sense to move it to far from regmap
registration code, which is already in the mfd part. But now
i'm in desperate state - i have no idea what is the best
and acceptable way to have it for all related maintainers.

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
