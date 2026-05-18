Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C220634250D;
	Mon, 18 May 2026 10:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100867; cv=none; b=nOMF59KalHSkRHH8WYTkicdabRx1A37lmiRa7QVOgxLxdKyS3+a47YTdFgxNZA9ynLrZZvgukzyTrQF8QOr6wJ/adCs8JF1Lwls8eMhBaxq/ZGNpBMAYlKCZJDQ/sWr+UHl3KYBlYpMnMuUY9VsdJswIXUJFYTPpJimjf2DTX9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100867; c=relaxed/simple;
	bh=jaReAO60D3BjnUZS6hadjRcjHJfx/UAoiI//OuOiMOg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z8rkg1fJZA0HriOruZ13HonbNzxalwq4u6OZaldwKCvawrFQihHOgGnKd8wBGvCHjOBzBdghigHrdU0zF3eNYctvLcwlrveCbrIoSz5FERFinarXIhMYOlzNsCIcov8T6N87woD6UWHIKFWyDVqv2kS2XOwAEB9uIGY0SyUllCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbKyIAZC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbKyIAZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE75C2BCB7;
	Mon, 18 May 2026 10:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779100866;
	bh=jaReAO60D3BjnUZS6hadjRcjHJfx/UAoiI//OuOiMOg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nbKyIAZCXrtcmoeYGW4sFM8pIArTdLOfPFs1rqdymObCihdM4t5UTJHYDGSK9p6A/
	 dDd17dX7LTy9dC6QYEMgCC6+WcEASJRUExVBKKPVAti8Zd1NA1fTILoXM3stKmr589
	 KIfxGKMUPnILyTkP/Lbh+maTLQQqIRpfXi2b71Jo/NqGp+0lS3VPpl1rb9TBNTHzMb
	 j/paIuB0XpUpMfMMyq0hdk7EFZ7kCzUWi4qRXhvyuLE0bc6r1MCzk6R1WXCUuQSinh
	 IJE2E4K6MCa3QY7xdPszNEw7kPeIrP2bN9S826lGxd/O4SA8KQ6pyRpANkrZutdNBx
	 Ex+9Lgobi5nXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/6] mfd: add NXP MC33978/MC34978 core driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260518100054.3552143-3-o.rempel@pengutronix.de>
References: <20260518100054.3552143-3-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 10:40:59 +0000
Message-Id: <20260518104059.CEE75C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Stale POR status flags are not cleared before enabling event proce=
ssing, causing a spurious hardware fault interrupt.
- [High] The pipelined SPI read message forcefully toggles chip select with=
out guaranteeing a minimum CS inactive time.
- [Low] The validation check for the IRQ domain size contains an off-by-one=
 error.
--

commit cbdb6fa84cbdc2a33e2c2e0cdc333ff4eef528f4
Author: Oleksij Rempel <o.rempel@pengutronix.de>

mfd: add NXP MC33978/MC34978 core driver

Add core Multi-Function Device (MFD) driver for the NXP MC33978 and
MC34978 Multiple Switch Detection Interfaces (MSDI). This driver provides
an IRQ domain, event processing, and interfaces for child devices.

> diff --git a/drivers/mfd/mc33978.c b/drivers/mfd/mc33978.c
> index 0000000000000..d46b76ca91473
> --- /dev/null
> +++ b/drivers/mfd/mc33978.c
[ ... ]
> +static int mc33978_mfd_probe(struct spi_device *spi)
> +{
[ ... ]
> +	ret =3D mc33978_core_init(dev, spi, &ddata->domain);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Validate IRQ domain size before passing to child devices.
> +	 * hwirq_max is inclusive, we need MC33978_NUM_IRQS entries (0..22).
> +	 */
> +	if (ddata->domain->hwirq_max < MC33978_NUM_IRQS - 1)

Is this bounds check correct?

For a linear IRQ domain, domain->hwirq_max represents the exclusive upper
bound (the size of the domain). Since the driver requires 23 hwirqs (0
through 22, where 22 is MC33978_HWIRQ_FAULT), hwirq_max must be at least 23.

Checking if hwirq_max < 22 allows a domain size of 22 to pass the validatio=
n,
which only supports hwirqs 0-21 and would fail when requesting hwirq 22.

Should this be checked as < MC33978_NUM_IRQS instead?

[ ... ]
> diff --git a/drivers/platform/misc/mc33978-core.c b/drivers/platform/misc=
/mc33978-core.c
> index 0000000000000..b5b3388b270bd
> --- /dev/null
> +++ b/drivers/platform/misc/mc33978-core.c
[ ... ]
> +static void mc33978_prepare_messages(struct mc33978_core_data *cdata)
> +{
[ ... ]
> +	/* --- Prepare Read Message (2 Frames) --- */
> +	spi_message_init(&cdata->msg_read);
> +
> +	/* Frame 1: Request */
> +	cdata->xfer_read[MC33978_FRAME_REQ].tx_buf =3D
> +		cdata->tx_frame[MC33978_FRAME_REQ];
> +	cdata->xfer_read[MC33978_FRAME_REQ].rx_buf =3D
> +		cdata->rx_frame[MC33978_FRAME_REQ];
> +	cdata->xfer_read[MC33978_FRAME_REQ].len =3D MC33978_FRAME_LEN;
> +	/* Latch command */
> +	cdata->xfer_read[MC33978_FRAME_REQ].cs_change =3D 1;

Does this transfer need an explicit cs_inactive delay?

Setting cs_change to 1 without populating the cs_inactive delay structure
can cause the SPI core to toggle the Chip Select line too quickly on modern
hardware-accelerated controllers. This might violate the MC33978's minimum =
CS
inactive time requirements for latching the command, causing a communication
regression.

[ ... ]
> +int mc33978_core_init(struct device *dev, struct spi_device *spi,
> +		      struct irq_domain **domain_out)
> +{
[ ... ]
> +	/*
> +	 * Prime the cached pin state under lock to prevent spurious events.
> +	 * Work scheduling is disabled (irq_ready=3Dfalse) to prevent the work
> +	 * feedback loop that would occur during init: regmap_read() harvests
> +	 * status -> schedules work -> work does regmap_read() -> schedules more
> +	 * work -> infinite loop on single-core systems where work monopolizes
> +	 * CPU before init can complete.
> +	 */
> +	scoped_guard(mutex, &cdata->event_lock) {
> +		ret =3D regmap_read(cdata->map, MC33978_REG_READ_IN,
> +				  &cdata->cached_pin_state);
> +	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read initial pin state\n");
> +
> +	if (spi->irq <=3D 0)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "no valid IRQ provided for INT_B pin\n");
> +
> +	/*
> +	 * Not using IRQF_SHARED: threaded handler with IRQF_ONESHOT may hold
> +	 * line masked too long on slow SPI, making shared operation impractica=
l.
> +	 */
> +	ret =3D devm_request_threaded_irq(dev, spi->irq,
> +					NULL,
> +					mc33978_irq_thread,
> +					IRQF_ONESHOT,
> +					dev_name(dev), cdata);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request IRQ\n");
> +
> +	/*
> +	 * Enable work scheduling now that IRQ handler is registered.
> +	 * This prevents the work feedback loop during initialization while
> +	 * allowing proper event processing after setup completes.
> +	 */
> +	scoped_guard(spinlock_irqsave, &cdata->state_lock)
> +		cdata->irq_ready =3D true;

Could this cause a regression by triggering a spurious hardware fault
interrupt?

During initialization, regmap accesses (like reading MC33978_REG_READ_IN ab=
ove)
harvest the initial Power-On Reset status flags into cdata->harvested_flags.
Since irq_ready is false, the event worker is correctly prevented from runn=
ing.

However, the stale harvested flags are not cleared before irq_ready is set =
to
true. When a child driver makes its first regmap read, mc33978_harvest_stat=
us()
will run, see irq_ready =3D=3D true with a non-zero harvested_flags, and sc=
hedule
the event_work.

The worker will then process the stale FAULT_STAT bit, see that the live bus
fault is false, and incorrectly treat it as a transient fault, dispatching a
spurious interrupt to the child driver.=20

Should atomic_set(&cdata->harvested_flags, 0) be called right before setting
irq_ready to true?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518100054.3552=
143-1-o.rempel@pengutronix.de?part=3D2
