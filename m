Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2614242F6FA;
	Thu, 13 Aug 2026 21:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786657468; cv=none; b=EVYEI47bTIF0BBqh1kfRPvrgfWXrupW+jLQWCBPEfKJ0JLMwCqbmCUnrInXs6Sr4WJ6+g7rvyRnNpYvSuVNqj8GRzKwPMXRTluV+sL2O8w0KJJdbsCJN63oaPr7Zh3ildtAtpPjaAL9pSiWKvnDADvWAWXtGtrQPXUtH1DrqTHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786657468; c=relaxed/simple;
	bh=1jWYqJFd7WTBqYtsK9hZnv4SIIlTW181ksuSS4LKcjs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YFlViUj/bm7maKv6gYIIo7CNEC7y7ZOQU3LjcKki53wY/ApR5X824cNeAwGhxIN6UbGpVL/OSdhyurHpcVaQPDikE2HY/RQp5oR1+mgiIJ/KatWWwPGB37wO23Y0Pwv+YSyARre7brseW6k+2WrFrUVd4nM/wAQ5iNXGs1Izd8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dxv3EfEc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dxv3EfEc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF201F000E9;
	Thu, 13 Aug 2026 21:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786657466;
	bh=jFHIUEyMA7yVroGJpkMPgkHp3ARsJdI9CidXZtIcd1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dxv3EfEcyeRrh1YZYKhFX6bOfZGgkiQCAlaHHtnhDuxde5TmBsqsMH3VX1wLHZi/s
	 kLIGzARdcltH43aaLzacsMojo49RkufTQHIljeo8Lxv7pYFWpeIrpTAnrnPJVLiDTp
	 TnxA3Dio887Ze1rHJucNxi7RDDUwJ5HGllmSlSOUZHG64bTec/Fav6Rfoqwd+Kd5eQ
	 a7E6hH3Mx8hIXdZ9NI0kiclUcZD8WgAbFtNMeHYIBksZ7gvTWn2E9uFW49ysSgrMje
	 cGncHQJLrqEtTmy92/of/Zt+hr042H81PxuDHhgj5tJZqrFRlyJDCHGuNPdmmORiMZ
	 FwXbOFms8wnrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] mfd: add NXP MC33978/MC34978 core driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260313140218.1213393-3-o.rempel@pengutronix.de>
References: <20260313140218.1213393-3-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 21:44:26 +0000
Message-Id: <20260813214426.8EF201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [High] Missing memory barriers in lockless synchronization pattern (`is_h=
andling` and `harvested_flags`) causes missed interrupts.
- [High] Missing cancellation of `event_work` during driver unbind leads to=
 Use-After-Free.
- [High] Missing IRQ flow handler setup in domain allocation.
- [High] Invalid cast of `u32` to `unsigned long *` in `for_each_set_bit()`.
- [High] Unchecked return value of `irq_find_mapping()` leads to `handle_ne=
sted_irq(0)` crash.
- [High] Persistent SPI read failure causes an infinite loop in the event h=
andler.
- [High] Requesting threaded IRQ with a NULL primary handler and IRQF_SHARE=
D fails unconditionally.
- [Medium] Complex platform data passed via device match tables' `.data` fi=
eld.
- [Medium] Using PLATFORM_DEVID_NONE instead of PLATFORM_DEVID_AUTO.
- [Medium] Unvalidated `hwirq` from Device Tree causes out-of-bounds shift =
in domain alloc.
- [Medium] Data race on IRQ configuration fields (`cached_pin_mask`, `irq_r=
ise`, `irq_fall`).
- [Medium] Returning IRQ_NONE after out-of-band event handling breaks share=
d IRQ lines.
- [Low] Incorrect structure naming and commit message conventions.
--

--- Patch [2]: [PATCH v4 2/6] mfd: add NXP MC33978/MC34978 core driver ---
commit 186ef306572bd844817cebe4b20f2f3e74bf4ce4
Author: Oleksij Rempel <o.rempel@pengutronix.de>

mfd: add NXP MC33978/MC34978 core driver

This commit adds the core MFD driver for NXP MC33978/MC34978 devices. It
handles SPI communications, power sequencing, and interrupt routing. Child
devices for pinctrl, hwmon, and mux are populated automatically.

> mfd: add NXP MC33978/MC34978 core driver

[Severity: Low]
This isn't a bug, but MFD subsystem conventions expect the description
after the subsystem prefix to be capitalized. Should this be "Add NXP..."?

> diff --git a/drivers/mfd/mc33978.c b/drivers/mfd/mc33978.c
> --- /dev/null
> +++ b/drivers/mfd/mc33978.c
> @@ -0,0 +1,870 @@

[ ... ]

> +struct mc33978_mfd_priv {

[Severity: Low]
This isn't a bug, but does embedding implementation details like "mfd" and
"priv" in the structure name conflict with MFD naming conventions?

[ ... ]

> +static int mc33978_irq_domain_alloc(struct irq_domain *domain,
> +				    unsigned int virq,
> +				    unsigned int nr_irqs, void *arg)
> +{
> +	struct mc33978_mfd_priv *mc =3D domain->host_data;
> +	struct irq_fwspec *fwspec =3D arg;
> +	irq_hw_number_t hwirq;
> +	int i;
> +
> +	if (fwspec->param_count < 1)
> +		return -EINVAL;
> +
> +	hwirq =3D fwspec->param[0];
> +
> +	for (i =3D 0; i < nr_irqs; i++) {
> +		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> +					      &mc33978_irq_chip, mc);

[Severity: Medium]
Is it possible for the unvalidated hwirq value from the device tree to
exceed MC33978_NUM_PINS?

If a malformed DT specifies a large hwirq, could this cause an out-of-bounds
bitwise shift when creating the pin mask in mc33978_irq_mask(), potentially
corrupting masks for other interrupts?

[Severity: High]
Does this hierarchical IRQ domain allocation miss the flow handler setup?

It seems we only call irq_domain_set_hwirq_and_chip(), which leaves the
handler as handle_bad_irq. When child devices request their IRQs, will
request_irq() fail with -EINVAL?

Should we use irq_domain_set_info() or irq_set_handler() here?

[ ... ]

> +static bool mc33978_handle_pin_changes(struct mc33978_mfd_priv *mc,
> +				       unsigned int pin_state)
> +{
> +	u32 fired_pins =3D 0;
> +	u32 changed_pins;
> +	int i;
> +
> +	changed_pins =3D pin_state ^ mc->cached_pin_state;
> +	if (!changed_pins)
> +		return false;
> +
> +	mc->cached_pin_state =3D pin_state;
> +	changed_pins &=3D mc->cached_pin_mask;
> +
> +	if (!changed_pins)
> +		return false;
> +
> +	fired_pins |=3D (changed_pins & pin_state) & mc->irq_rise;
> +	fired_pins |=3D (changed_pins & ~pin_state) & mc->irq_fall;

[Severity: Medium]
Could reading the IRQ configuration fields (cached_pin_mask, irq_rise,
irq_fall) without acquiring irq_lock lead to a data race?

These fields appear to be modified under irq_lock elsewhere, but only
event_lock is held here. Could this cause the event handler to read torn
masks if an IRQ type is changed concurrently, resulting in spurious or
missed interrupts?

> +
> +	for_each_set_bit(i, (unsigned long *)&fired_pins, MC33978_NUM_PINS) {

[Severity: High]
Does casting a 32-bit u32 variable (fired_pins) to unsigned long * cause an
out-of-bounds stack read on 64-bit architectures?

On 64-bit big-endian systems, might this read the wrong half of the 64-bit
word, causing the driver to completely miss active interrupts and process
adjacent stack memory?

> +		int virq =3D irq_find_mapping(mc->domain, i);
> +
> +		handle_nested_irq(virq);

[Severity: High]
Can irq_find_mapping() return 0 here if a mapping does not exist?

If so, passing 0 to handle_nested_irq() will dereference the IRQ descriptor
for IRQ 0. Could this result in a kernel panic if the mapping is absent
during a teardown race or an early interrupt?

[ ... ]

> +static bool mc33978_process_single_event(struct mc33978_mfd_priv *mc)
> +{
> +	unsigned int pin_state;
> +	bool handled =3D false;
> +	u8 hw_flags;
> +	int ret;
> +
> +	ret =3D regmap_read(mc->map, MC33978_REG_READ_IN, &pin_state);
> +	if (ret)
> +		return false;
> +
> +	/*
> +	 * harvested_flags will be set by regmap_read() above if the FAULT_STAT
> +	 * or INT_flg bits were detected in the response
> +	 */
> +	hw_flags =3D atomic_xchg(&mc->harvested_flags, 0);

[Severity: High]
If regmap_read() fails and returns early, the harvested_flags are not
cleared via atomic_xchg().

Since mc33978_handle_events() loops continuously while harvested_flags is
non-zero, would a persistent SPI read failure trap the worker thread or
IRQ handler in an infinite loop?

[ ... ]

> +static bool mc33978_handle_events(struct mc33978_mfd_priv *mc)
> +{
> +	bool handled =3D false;
> +
> +	guard(mutex)(&mc->event_lock);
> +
> +	do {
> +		atomic_set(&mc->is_handling, 1);
> +
> +		if (mc33978_process_single_event(mc))
> +			handled =3D true;
> +
> +		atomic_set(&mc->is_handling, 0);

[Severity: High]
Does this lockless Dekker-like synchronization need memory barriers?

Since atomic_set(), atomic_read(), and atomic_or() do not imply full memory
barriers in Linux, could the CPU or compiler reorder reads before writes
become globally visible?

If both this thread and mc33978_harvest_status() concurrently read the
other's state as 0, could the event loop exit while the worker fails to
schedule, leading to permanently missed interrupts?

> +
> +	} while (atomic_read(&mc->harvested_flags) !=3D 0);
> +
> +	return handled;
> +}
> +
> +static irqreturn_t mc33978_irq_thread(int irq, void *data)
> +{
> +	return mc33978_handle_events(data) ? IRQ_HANDLED : IRQ_NONE;

[Severity: Medium]
If the out-of-band worker thread finishes processing the event before this
shared IRQ thread runs, will this return IRQ_NONE?

On a shared IRQ line, if this frequently returns IRQ_NONE because the event
was already consumed, will the kernel's spurious interrupt detector
eventually disable the shared line for all devices?

> +}
> +
> +static int mc33978_irq_init(struct mc33978_mfd_priv *mc)
> +{

[ ... ]

> +	if (mc->spi->irq <=3D 0)
> +		return dev_err_probe(dev, -EINVAL, "No valid IRQ provided for INT_B pi=
n\n");
> +
> +	ret =3D devm_request_threaded_irq(dev, mc->spi->irq, NULL,
> +					mc33978_irq_thread,
> +					IRQF_ONESHOT | IRQF_SHARED,
> +					dev_name(dev), mc);

[Severity: High]
Does requesting a threaded IRQ with IRQF_SHARED and a NULL primary hardirq
handler violate the API contract?

The kernel IRQ subsystem explicitly rejects this configuration with -EINVAL
because shared interrupts require a primary handler to verify the interrupt
source. Will this cause the probe to fail unconditionally?

[ ... ]

> +static int mc33978_probe(struct spi_device *spi)
> +{

[ ... ]

> +	mutex_init(&mc->event_lock);
> +	INIT_WORK(&mc->event_work, mc33978_event_work);
> +
> +	atomic_set(&mc->harvested_flags, 0);

[Severity: High]
Is the event_work left without a devm action or explicit cancellation during
driver unbind?

If the driver is unbound or probe fails after the work is scheduled, the mc
structure will be freed by devres. When the pending work executes later,
could it dereference freed memory and cause a use-after-free?

[ ... ]

> +	ret =3D mc33978_irq_init(mc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> +				   match_data->cells, match_data->num_cells,
> +				   NULL, 0, mc->domain);

[Severity: Medium]
Is it correct to use PLATFORM_DEVID_NONE here?

The MFD subsystem guidelines mandate the use of PLATFORM_DEVID_AUTO for
automatic cell indexing. Passing PLATFORM_DEVID_NONE assigns a fixed ID (-1)
to child devices, which might cause sysfs naming collisions and driver load
failures if multiple instances exist.

[ ... ]

> +static const struct of_device_id mc33978_of_match[] =3D {
> +	{ .compatible =3D "nxp,mc33978", .data =3D &mc33978_match_data },
> +	{ .compatible =3D "nxp,mc34978", .data =3D &mc34978_match_data },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mc33978_of_match);
> +
> +static const struct spi_device_id mc33978_spi_id[] =3D {
> +	{ "mc33978", (kernel_ulong_t)&mc33978_match_data },
> +	{ "mc34978", (kernel_ulong_t)&mc34978_match_data },
> +	{ }
> +};

[Severity: Medium]
Does assigning a complex data structure pointer directly to the match
table's .data field violate MFD subsystem guidelines?

Guidelines forbid passing dynamic platform data or complex structures this
way to prevent initialization ordering races and memory safety hazards.
Should an ID enum be used instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260313140218.1213=
393-1-o.rempel@pengutronix.de?part=3D2
