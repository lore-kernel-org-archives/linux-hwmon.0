Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05339348465;
	Thu, 13 Aug 2026 21:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786657502; cv=none; b=aQ4JZ1DKv1q8RADkH5u6bM86VebiP3IjpCn5QuJLTC8AtnoKiua4oQJ/YdnzrdXq4+aXGk9rm6xkaiM/Jj3SzvJKH2Z49JPF+HDvSHfE77uMBRu4APTZt6fSfHrhRmSJQLuTFzJG2OXtVY5aifLcVeeUD/FmzvJvZ2euX+6lG/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786657502; c=relaxed/simple;
	bh=b2ZAl0uw1NT3trb3hE8BIRgQwCOXY62QxTZE44ZlkhA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eleU3TOmygzCvCP1Npcr8So43hoEIQk1JqvhiRGoLFcgNcIYcH0+5UqoG2mo8cXJQGoibppycUM4XItSrHLGwPExOgmWSxMXbndtsGilYMelbaEy1ouVYlxykWKdlDR/TQZVmSleluyS/dGOmTXh46KqtmT7tAJfiqtdYJaVOxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+HGgw8m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+HGgw8m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2C11F000E9;
	Thu, 13 Aug 2026 21:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786657500;
	bh=CaXGkDqU+8e/6l7RMHCr0X2fk9dKb0zXwBX6I2W5o0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G+HGgw8miVdRQnQqcMy1zJq2fUxOsZTWRZfLchpFtCTUvLUSdyV1pp2+5FL+rGRVU
	 BSov82+WUyieeUPcVWzMpkfQ/Ie1qd1R5wamPfljfZPgWl1+NKtvsOLn7OaZF6A3yR
	 Rj9jLNutyMiuCOwUZfZAzkc0Cw8aDivkn3Zy+WmNhUf3a1stFTcpGl2jT+C4uNVo+P
	 XKlViqDKtOa3vjCAplmKE3wMaAlF0ulDhyYyG7ETBaGFUCXhK8oYbhf4r8jLWceAA/
	 EDb+kLI4nL1lwbVq4yLhbLqm2x0HSNsDYo+1uL7olqcL2T4GSdpG+FVJyKpsKjNgUX
	 abDFxcKASTCrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/7] mfd: add NXP MC33978/MC34978 core driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260309134920.1918294-3-o.rempel@pengutronix.de>
References: <20260309134920.1918294-3-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 21:44:56 +0000
Message-Id: <20260813214500.8F2C11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [High] Out-of-bounds stack read and big-endian logic bug due to casting `=
u32` pointer to `unsigned long *`.
- [High] Missing check for valid virtual IRQ before calling `handle_nested_=
irq()` can cause a NULL pointer dereference.
- [High] Missing `cancel_work_sync()` for `event_work` in the driver cleanu=
p path leads to a Use-After-Free on unbind or probe failure.
- [High] An SPI communication failure causes an infinite loop in the event =
handling thread, leading to a CPU soft lockup.
- [High] Setting IRQ_DOMAIN_FLAG_HIERARCHY breaks MFD child IRQ resolution,=
 causing the hwmon driver to receive an invalid IRQ.
- [High] Missing memory barriers in the lockless event scheduling Dekker pa=
ttern can cause lost events.
- [High] The background harvesting mechanism races with the IRQ thread, pot=
entially causing spurious IRQ_NONE returns on a shared interrupt line.
- [Medium] Passing complex pointers (cell arrays) directly via match table =
`.data` fields violates MFD subsystem guidelines.
- [Medium] Using `PLATFORM_DEVID_NONE` instead of `PLATFORM_DEVID_AUTO` bre=
aks multi-instance support and causes sysfs collisions.
- [Medium] Data race on IRQ configuration fields between the event processi=
ng thread and IRQ configuration callbacks.
- [Medium] Missing bounds check on `hwirq` in `mc33978_irq_domain_alloc` le=
ads to undefined behavior during bit shifts.
- [Low] Incorrect naming of the private data structure and instance variabl=
e.
- [Low] Non-standard commit message prefix and capitalization.
--

--- Patch [2]: [PATCH v3 2/7] mfd: add NXP MC33978/MC34978 core driver ---
commit ec976efb2461e1504417bd0ba87b3eb7ebe2cc78
Author: Oleksij Rempel <o.rempel@pengutronix.de>

mfd: add NXP MC33978/MC34978 core driver

This commit adds the core MFD driver for the NXP MC33978 and MC34978
Multiple Switch Detection Interfaces. It handles SPI communications with
a custom regmap bus, power sequencing, and interrupt demultiplexing. It
also implements inline status harvesting from SPI responses to detect
events.

> mfd: add NXP MC33978/MC34978 core driver

[Severity: Low]
Does this commit subject follow the subsystem guidelines? The MFD subsystem
expects the prefix format mfd: <Driver>: <Capitalized description>.

> diff --git a/drivers/mfd/mc33978.c b/drivers/mfd/mc33978.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/mfd/mc33978.c
[ ... ]
> +struct mc33978_mfd_priv {
> +	struct spi_device *spi;
> +	struct regmap *map;

[Severity: Low]
Does this struct name violate the subsystem naming conventions? The subsyst=
em
rules state that private data structures should be named after the device,
avoiding mfd or priv, and the instance variable should be named ddata.

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

[Severity: Medium]
Could this hwirq value exceed the valid range and cause undefined behavior?

There is no bounds check on hwirq here to ensure it falls within 0 to 22.
If a malformed device tree supplies an out-of-bounds hwirq, subsequent
calls to IRQ chip callbacks will execute a bit shift exceeding the variable
width.

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

[Severity: Medium]
Can this read of mc->cached_pin_mask race with concurrent updates?

The fields mc->cached_pin_mask, mc->irq_rise, and mc->irq_fall are written
inside IRQ chip callbacks while protected by mc->irq_lock.

However, they are read here under mc->event_lock without holding
irq_lock. Concurrent IRQ configurations on another CPU could cause data
races, potentially leading the driver to misroute or drop interrupts.

> +
> +	if (!changed_pins)
> +		return false;
> +
> +	fired_pins |=3D (changed_pins & pin_state) & mc->irq_rise;
> +	fired_pins |=3D (changed_pins & ~pin_state) & mc->irq_fall;
> +
> +	for_each_set_bit(i, (unsigned long *)&fired_pins, MC33978_NUM_PINS) {

[Severity: High]
Can this cast cause an out-of-bounds stack read and a big-endian logic bug?

The for_each_set_bit() macro expects an 8-byte aligned unsigned long pointe=
r,
but it is passed a pointer to a 4-byte u32 stack variable (fired_pins).

On big-endian 64-bit systems, the 4-byte fired_pins becomes the most
significant 32 bits of the read 64-bit word, while the least significant
32 bits contain uninitialized stack memory. The loop will exclusively itera=
te
over the garbage stack bits instead of the actual fired_pins value.

> +		int virq =3D irq_find_mapping(mc->domain, i);
> +
> +		handle_nested_irq(virq);

[Severity: High]
Does this unconditionally pass a potentially invalid virq to handle_nested_=
irq()?

Since mc->cached_pin_mask is read locklessly under event_lock, a concurrent
call to free_irq() can dispose of the mapping right after the bit is checke=
d.
irq_find_mapping() will then return 0.

Passing 0 to handle_nested_irq() resolves IRQ 0 to a null irq_desc and
crashes when acquiring desc->lock. A check for virq > 0 is required here.

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
Will an SPI communication failure cause an infinite loop here?

If regmap_read() fails, the function immediately returns false before
executing the atomic_xchg(&mc->harvested_flags, 0).

Because harvested_flags is never cleared on this error path, the
while (atomic_read(&mc->harvested_flags) !=3D 0) condition in
mc33978_handle_events() remains true endlessly, hanging the thread.

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
> +
> +	} while (atomic_read(&mc->harvested_flags) !=3D 0);

[Severity: High]
Are memory barriers needed here to prevent lost events?

The lockless communication between the thread and the SPI status harvester
relies on a Dekker-like pattern.

Void RMW atomic operations (atomic_or, atomic_set) do not imply full
memory barriers. Weakly-ordered CPUs can reorder the loads and stores.

The handler might evaluate atomic_read(&mc->harvested_flags) before its wri=
te
to is_handling becomes visible, causing both threads to assume the other
will process the event. smp_mb() or smp_mb__after_atomic() are required.

> +
> +	return handled;
> +}
> +
> +static irqreturn_t mc33978_irq_thread(int irq, void *data)
> +{
> +	return mc33978_handle_events(data) ? IRQ_HANDLED : IRQ_NONE;

[Severity: High]
Can the background harvesting mechanism race with this IRQ thread?

If an interrupt is physically asserted and the IRQ thread is scheduled, but=
 a
concurrent SPI transaction runs first, mc33978_harvest_status() will capture
the event and schedule event_work.

The workqueue processes the event and clears it. When the IRQ thread execut=
es,
it finds no events to process and returns IRQ_NONE. Over time, enough
spurious IRQ_NONE returns on an IRQF_SHARED line will trigger the kernel to
shut down the IRQ line entirely.

> +}
> +
> +static int mc33978_irq_init(struct mc33978_mfd_priv *mc)
> +{
> +	struct device *dev =3D &mc->spi->dev;
> +	int ret;
> +
> +	mutex_init(&mc->irq_lock);
> +
> +	/*
> +	 * Create IRQ domain with 23 interrupts:
> +	 * - hwirq 0-21: Pin change interrupts (22 pins)
> +	 * - hwirq 22: Fault interrupt (for hwmon driver)
> +	 */
> +	mc->domain =3D irq_domain_add_linear(dev->of_node, MC33978_NUM_PINS + 1,
> +					   &mc33978_irq_domain_ops, mc);
> +	if (!mc->domain)
> +		return dev_err_probe(dev, -ENOMEM, "Failed to create IRQ domain\n");
> +
> +	mc->domain->flags |=3D IRQ_DOMAIN_FLAG_HIERARCHY;

[Severity: High]
Does setting this flag break MFD child IRQ resolution?

The MFD core relies on irq_create_mapping() to translate the mfd_cell's
DEFINE_RES_IRQ(MC33978_HWIRQ_FAULT) resource to a Linux virq.

However, irq_create_mapping() explicitly aborts and returns 0 when called on
an IRQ domain bearing the IRQ_DOMAIN_FLAG_HIERARCHY flag. As a result, the
child device is instantiated with IRQ 0 and will never receive fault
interrupts.

[ ... ]
> +static void mc33978_harvest_status(struct mc33978_mfd_priv *mc, u8 statu=
s)
> +{
> +	if (!status)
> +		return;
> +
> +	atomic_or(status, &mc->harvested_flags);
> +
> +	if (!atomic_read(&mc->is_handling))

[Severity: High]
Does this Dekker-like pattern require memory barriers?

As mentioned above in mc33978_handle_events(), weakly-ordered CPUs can reor=
der
the loads and stores. The harvester might evaluate
!atomic_read(&mc->is_handling) before its store to harvested_flags becomes
visible, resulting in lost events.

[ ... ]
> +static int mc33978_probe(struct spi_device *spi)
> +{
> +	const struct mc33978_data *match_data;
> +	struct device *dev =3D &spi->dev;
> +	struct mc33978_mfd_priv *mc;
> +	int ret;
[ ... ]
> +	mutex_init(&mc->event_lock);
> +	INIT_WORK(&mc->event_work, mc33978_event_work);

[Severity: High]
Is event_work properly cancelled during driver cleanup?

The core driver uses devres to manage the mc struct lifetime but fails to
register a devres action to cancel mc->event_work.

If a child device triggers a background SPI harvest during its devres teard=
own
phase, the workqueue is scheduled. The parent driver's devres teardown then
completes and frees the mc structure, leading to a use-after-free when the
workqueue executes.

[ ... ]
> +	ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> +				   match_data->cells, match_data->num_cells,
> +				   NULL, 0, mc->domain);

[Severity: Medium]
Will using PLATFORM_DEVID_NONE break multi-instance support?

MFD guidelines dictate preferring PLATFORM_DEVID_AUTO. Using
PLATFORM_DEVID_NONE prevents the MFD core from appending instance indices to
the child device names. This causes identical names on the platform bus for
multiple parent devices, leading to driver load failures.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add MFD child devices\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mc33978_of_match[] =3D {
> +	{ .compatible =3D "nxp,mc33978", .data =3D &mc33978_match_data },

[Severity: Medium]
Is passing a complex pointer directly via the match table .data field safe?

The MFD subsystem guidelines forbid passing complex pointers (such as
structure wrapping mfd_cell arrays) through the .data field of of_device_id
or spi_device_id tables.

To avoid memory safety hazards and initialization ordering races, the
driver should use an enum or integer ID to select the static array in the
probe function instead.

> +	{ .compatible =3D "nxp,mc34978", .data =3D &mc34978_match_data },
> +	{ }
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260309134920.1918=
294-1-o.rempel@pengutronix.de?part=3D2
