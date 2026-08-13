Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779783D47CF;
	Thu, 13 Aug 2026 22:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786659594; cv=none; b=q+BXFy32+tGnehABf52/BIiRnScj8SWJ2ICjoLG4WfEz7/WNTIajCrO5dUIT91aKPW4FfXl1grLWG4ivfor3YgFBJWatWCrYBp7ZEG97fp44W0pzsemAs9kauQJmTl3Fvt5sZsDKLOvEsIskxTzPWrRMHbB4qcXHSoxqVR3T328=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786659594; c=relaxed/simple;
	bh=uXx/DtGoNN5UreV5uZHCShp+Wkcc8FG0icq0kj88TOk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LdzZFZcjx24ormtrWsKAk+CnRYcsI1CpZMYMnXg/J5Jd2KMasVsoq0iyDcTUB1Qc0Bb1hsyYwKBlQ1c3lXG7BQOGt8vFnCIs292XTdkFTiVq5M8N7Poz+O4MB+PtqPmBrEV1WiLn14B1lQfBlMQQVJOZ/KmrTWRO3xg/7B1puEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=leZw4yMC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="leZw4yMC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E9F1F00A3A;
	Thu, 13 Aug 2026 22:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786659593;
	bh=krjlTRbkhrWV7A3gvuwmcD0kFvGRk66HCuPDB5XVQcY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=leZw4yMCUNieoZt29/MjT6BUOPuIxj16RQK5tsz5FTzqM6gM3qezryESD4jNceG2c
	 7G2IV38xlYhNL+8jcGyOBqWjRgm3D2V40vg+x8HGmD7puyKnas2r/0XOSXFPSxWOeo
	 DKODtDmTbXvzwu2w5qk4+TNzPnMRilLR8zJyVISBhh1sshKpixzGZ5YJEljodoEvRr
	 +2xz8aQC5b6Ejy1HvmpBQ+tVGmFrSTX5QycEaafyi3OJo2uO2DCsPPVSdt66HfrS1F
	 OpKqU1YgAJhqftp9JSBMqnyQlgsljSkvmeJ6SU8ySNqPYEBm1igX6g7CAC0SlkjXY1
	 hLR04uieKztUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/7] mfd: add NXP MC33978/MC34978 core driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260321065146.3918882-3-o.rempel@pengutronix.de>
References: <20260321065146.3918882-3-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 22:19:52 +0000
Message-Id: <20260813221952.D7E9F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [Critical] Incompatible use of hierarchical IRQ domains with MFD core cau=
ses a NULL pointer dereference in the `.alloc` callback during probe.
- [High] The dynamically scheduled `event_work` is never canceled upon driv=
er removal or probe failure, leading to a use-after-free.
- [High] A SPI bus error during event processing causes an infinite loop in=
 the event handling thread, stalling the CPU.
- [High] The result of `irq_find_mapping()` is passed directly to `handle_n=
ested_irq()` without checking if it is non-zero.
- [High] Missing memory barriers between lockless accesses to `is_handling`=
 and `harvested_flags` creates a race condition that permanently drops even=
ts.
- [High] Casting a `u32` pointer to `unsigned long *` for `for_each_set_bit=
` causes out-of-bounds stack reads and logical failures on 64-bit Big Endia=
n systems.
- [High] The `MC33978_REG_WET_SG1` register is missing from the `mc33978_rx=
_decode` status exclusion switch.
- [Medium] Platform data (`mfd_cell` arrays) is passed directly via the `.d=
ata` field of device match tables.
- [Medium] Using `PLATFORM_DEVID_NONE` for MFD cell indexing prevents multi=
ple device instances and causes sysfs collisions.
- [Medium] The driver fails to validate `hwirq` in `mc33978_irq_domain_allo=
c`, allowing out-of-bounds interrupt mappings that lead to undefined behavi=
or.
- [Medium] Missing stabilization delay after enabling power supplies before=
 initiating the first SPI transaction.
- [Low] The driver violates MFD commit prefix rules and data structure nami=
ng conventions.
--

--- Patch [2]: [PATCH v6 2/7] mfd: add NXP MC33978/MC34978 core driver ---
commit 573144fde701ff82da9c6492a0c0004903d3501c
Author: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: mfd: add NXP MC33978/MC34978 core driver

This commit adds the core Multi-Function Device (MFD) driver for the NXP
MC33978 and MC34978 Multiple Switch Detection Interfaces (MSDI). It handles
SPI communications, power sequencing, and interrupt routing, and
instantiates child devices for pinctrl, hwmon, and amux.

> diff --git a/drivers/mfd/mc33978.c b/drivers/mfd/mc33978.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/mfd/mc33978.c

[ ... ]

> +struct mc33978_data {
> +	const struct mfd_cell *cells;
> +	int num_cells;
> +};
> +
> +struct mc33978_mfd_priv {

[Severity: Low]
Is this naming convention intentional? Following MFD subsystem rules,
structures are typically named after the device (e.g. struct mc33978)
rather than including mfd_priv.

> +	struct spi_device *spi;
> +	struct regmap *map;

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

[Severity: Critical]
Could arg be NULL here?

When the hwmon child is instantiated via mfd_add_devices(), the IRQ core
calls irq_domain_alloc_irqs_hierarchy() passing NULL for arg. Unconditional=
ly
casting and dereferencing fwspec->param_count could lead to a NULL pointer
dereference during probe.

> +		return -EINVAL;
> +
> +	hwirq =3D fwspec->param[0];

[Severity: Medium]
Should we validate hwirq against MC33978_NUM_PINS + 1 here?

A malformed device tree could provide an out-of-bounds hwirq, which might
later be used in mc33978_irq_set_type() where BIT(hwirq) could overflow
and cause undefined behavior.

> +
> +	for (i =3D 0; i < nr_irqs; i++) {
> +		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> +					      &mc33978_irq_chip, mc);

[ ... ]

> +static bool mc33978_handle_pin_changes(struct mc33978_mfd_priv *mc,
> +				       unsigned int pin_state)
> +{
> +	u32 fired_pins =3D 0;
> +	u32 changed_pins;
> +	u32 rise, fall;
> +	int i;
> +
> +	changed_pins =3D pin_state ^ mc->cached_pin_state;

[ ... ]

> +	for_each_set_bit(i, (unsigned long *)&fired_pins, MC33978_NUM_PINS) {

[Severity: High]
Does casting a u32 pointer to unsigned long * here cause issues on 64-bit
systems?

On 64-bit architectures, unsigned long is 8 bytes, which might lead to
a 4-byte out-of-bounds stack memory read. Furthermore, on 64-bit Big Endian
systems, the 32 bits might be placed in the upper half of the 64-bit word,
meaning the bit iterator reads uninitialized stack memory from the lower
32 bits.

> +		int virq =3D irq_find_mapping(mc->domain, i);
> +
> +		handle_nested_irq(virq);

[Severity: High]
Should virq be checked before calling handle_nested_irq()?

If the IRQ mapping was disposed or never created, irq_find_mapping()
could return 0. Passing 0 to handle_nested_irq() attempts to look up
and dereference the descriptor for IRQ 0, which could lead to a NULL
pointer dereference.

> +	}
> +
> +	return true;
> +}

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

[Severity: High]
Can an early return here lead to an infinite loop?

If regmap_read() fails, the function returns early without clearing
harvested_flags via atomic_xchg(). Back in mc33978_handle_events(),
the loop condition atomic_read(&mc->harvested_flags) !=3D 0 will remain
perpetually true, causing the worker thread to spin indefinitely.

> +
> +	/*
> +	 * harvested_flags will be set by regmap_read() above if the FAULT_STAT
> +	 * or INT_flg bits were detected in the response
> +	 */
> +	hw_flags =3D atomic_xchg(&mc->harvested_flags, 0);

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
Are memory barriers needed between accesses to is_handling and
harvested_flags here and in mc33978_harvest_status()?

Because atomic_set(), atomic_read(), and atomic_or() do not imply barriers
on weakly ordered architectures like ARM, the loads and stores can be
reordered by the CPU.

If they are reordered, both threads might assume the other is handling
the event, which could result in dropped hardware interrupts.

> +
> +	} while (atomic_read(&mc->harvested_flags) !=3D 0);
> +
> +	return handled;
> +}

[ ... ]

> +static u8 mc33978_rx_decode(const u8 *rx_frame, u8 *val_buf)
> +{
> +	u8 cmd =3D rx_frame[MC33978_FRAME_CMD] & ~MC33978_CMD_BYTE_WRITE;
> +	bool has_status;
> +	u8 status =3D 0;
> +
> +	switch (cmd) {
> +	case MC33978_REG_CHECK:
> +	case MC33978_REG_WET_SP:
> +	case MC33978_REG_WET_SG0:

[Severity: High]
Should MC33978_REG_WET_SG1 be included in this exclusion list?

Since WET_SP and WET_SG0 are excluded from status harvesting, reading
the sibling register WET_SG1 (0x0c) might cause its payload to fall through
to the default case. This could incorrectly interpret the data as FAULT_STAT
and INT_flg bits, triggering false interrupt events.

> +		has_status =3D false;
> +		break;
> +	default:
> +		has_status =3D true;
> +		break;
> +	}

[ ... ]

> +static int mc33978_probe(struct spi_device *spi)
> +{
> +	const struct mc33978_data *match_data;

[ ... ]

> +	ret =3D mc33978_power_on(mc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(dev, mc33978_power_off, mc);
> +	if (ret)
> +		return ret;
> +
> +	mutex_init(&mc->event_lock);
> +	INIT_WORK(&mc->event_work, mc33978_event_work);

[Severity: High]
Does this dynamically scheduled work need a cancellation action?

If the driver is removed or probe fails after the work is scheduled,
the allocated mc context is freed. Without devm_work_autocancel() or
a manual cancellation action, the workqueue could execute later and
dereference freed memory.

> +
> +	atomic_set(&mc->harvested_flags, 0);
> +	atomic_set(&mc->is_handling, 0);
> +
> +	mc33978_prepare_messages(mc);
> +
> +	mc->map =3D devm_regmap_init(dev, &mc33978_regmap_bus, mc,
> +				   &mc33978_regmap_config);
> +	if (IS_ERR(mc->map))
> +		return dev_err_probe(dev, PTR_ERR(mc->map), "can't init regmap\n");
> +
> +	ret =3D mc33978_check_device(mc);

[Severity: Medium]
Is a stabilization delay required after enabling regulators before the
first SPI communication?

Without a delay, the hardware Power-On Reset (POR) circuit might not
have finished ramping up, which could cause mc33978_check_device() to fail.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "can't use SPI bus\n");

[ ... ]

> +	ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,

[Severity: Medium]
Does using PLATFORM_DEVID_NONE prevent multiple instances of this driver?

If multiple MC33978 devices exist on the same board, the core will
attempt to register identically named child devices (like mc33978-pinctrl),
causing sysfs collisions. The MFD subsystem typically requires
PLATFORM_DEVID_AUTO for this.

> +				   match_data->cells, match_data->num_cells,
> +				   NULL, 0, mc->domain);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add MFD child devices\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mc33978_of_match[] =3D {
> +	{ .compatible =3D "nxp,mc33978", .data =3D &mc33978_match_data },

[Severity: Medium]
Is it safe to pass platform data pointers directly via the match data field?

According to MFD subsystem guidelines, passing complex pointers through
match data tables can cause initialization ordering races. The standard
approach is to pass an enum or integer ID in the match table, and use a
switch statement in the probe function to select the correct mfd_cell array.

> +	{ .compatible =3D "nxp,mc34978", .data =3D &mc34978_match_data },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mc33978_of_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260321065146.3918=
882-1-o.rempel@pengutronix.de?part=3D2
