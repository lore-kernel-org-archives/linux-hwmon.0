Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E30429CFC;
	Thu, 13 Aug 2026 21:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786657551; cv=none; b=QRWu3+7XRAt6XKO7sxvQXzp6rONOhyL2i8O7TWHIRS9ettH7vasLjBd4m58AfaYHbRalyWc9jq6dvZKy8VbkuED4c4TOncnSSXEQw7/Kla+Zew/o13Toh2CZJfdhpQUiFIc49PKmUDSemgfsZD7wk9eR0Di9tHp0DI+YY7Ts+yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786657551; c=relaxed/simple;
	bh=uBtR3BRgQvBKnsYsfTf9W7wqbBfn1NjqId3Wsl4fWnI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l3YONwobBs6hD/nZQ9EHAXBTh1iKzA/9UaP260+HNDgiFLZvf2ndqk5OdoLjGUI6uVknxhpcpGHHSoLsnWm1p3wiRz3iNtRylfw55XGF9jYmV4cStS0nFGTY/RQfMjhZFgH9gYJ/J7l+3s9OcLnHt/haoioCa8NPyTwKeeGj7zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Td3WDxXW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Td3WDxXW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829121F000E9;
	Thu, 13 Aug 2026 21:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786657549;
	bh=vhU54VAgR7vLJr5qr3XL8q7Jl2qORAw9W6+Y4T+t2GU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Td3WDxXWYd+7dvURQ+6A2PYhzHb/ITlXap+m2o8ZHDsEwBy2eXH/u27zCBBLhgYa0
	 04T2sxNT2+NLU2d5pP3Tr++nXdZkD3BCtfRiUeRRXorM6LzeJtP2s+oFRGKxAt5Xtf
	 QgWZvcNISKfIVXMB0rowvP4gtNTffx1/jqgPIrxo+WxURGNwfOXk32U4ceXpGZJ5Uc
	 cU0TMM4THvMuYORbmlpoIIkP+6zXbcZY20GLjAqIzUYsGB68jKURbbQ8/f2ai0FmDH
	 BtnSeJyT0zfZrGReIfN7UUZiUx3jw27n/vCw8awPbJipBL+M3N5BpFA0XWbtszyKkJ
	 Q9uqi2BXtxc1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/7] mfd: add NXP MC33978/MC34978 core driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260316140514.1406588-3-o.rempel@pengutronix.de>
References: <20260316140514.1406588-3-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 21:45:49 +0000
Message-Id: <20260813214549.829121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] Missing cancellation of `event_work` on probe failure and driver u=
nbind causes a use-after-free crash.
- [High] Missing memory barriers in lockless event synchronization (Dekker =
pattern) lead to permanently dropped hardware events.
- [High] Casting a 32-bit variable to `unsigned long *` for `for_each_set_b=
it` causes out-of-bounds stack reads and endianness bugs.
- [High] An SPI read failure in the event processing loop causes an uninter=
ruptible infinite loop and soft lockup.
- [High] Probe fails unconditionally because IRQF_SHARED | IRQF_ONESHOT is =
rejected with a NULL primary handler.
- [Medium] Passing platform data via the match table `.data` field violates=
 MFD subsystem guidelines.
- [Medium] Usage of `PLATFORM_DEVID_NONE` when registering MFD child device=
s causes sysfs naming collisions.
- [Medium] Stale `cached_pin_state` initialization causes spurious edge int=
errupts at boot.
- [Medium] Data race due to lockless reads of IRQ configuration data in `mc=
33978_handle_pin_changes`.
- [Low] Driver uses non-compliant private data structure and instance namin=
g.
- [Low] Commit message formatting violates MFD subsystem conventions.
--

--- Patch [2]: [PATCH v5 2/7] mfd: add NXP MC33978/MC34978 core driver ---
commit b887e898d9ba559f475a16e17a578293a3569bfb
Author: Oleksij Rempel <o.rempel@pengutronix.de>
mfd: add NXP MC33978/MC34978 core driver

This commit adds a core MFD driver for the NXP MC33978 and MC34978 Multiple
Switch Detection Interfaces. It handles SPI communications with pipelined
responses, power sequencing, interrupt demultiplexing, and event harvesting
from the SPI MSB. The driver automatically populates child devices for
pinctrl, hwmon, and mux functionality.

> mfd: add NXP MC33978/MC34978 core driver

[Severity: Low]
This isn't a bug, but the commit message prefix doesn't follow MFD
conventions. Should this be capitalized and include the driver name, for
example: "mfd: mc33978: Add NXP MC33978/MC34978 core driver"?

> diff --git a/drivers/mfd/mc33978.c b/drivers/mfd/mc33978.c
> index 0000000000000..ccc2a62d61c9d
> --- /dev/null
> +++ b/drivers/mfd/mc33978.c
[ ... ]
> +struct mc33978_mfd_priv {

[Severity: Low]
This isn't a bug, but does this structure name violate MFD naming conventio=
ns?
MFD guidelines recommend avoiding generic names like priv and not including
mfd in the name. Would struct mc33978 be more appropriate here?

> +	struct spi_device *spi;
> +	struct regmap *map;
[ ... ]
> +	u32 cached_pin_state;
> +	u32 cached_pin_mask;
> +	u32 irq_rise;
> +	u32 irq_fall;
> +
> +	/* Protects IRQ mask registers and cached IRQ state */
> +	struct mutex irq_lock;
[ ... ]
> +static bool mc33978_handle_pin_changes(struct mc33978_mfd_priv *mc,
> +				       unsigned int pin_state)
> +{
> +	u32 fired_pins =3D 0;
> +	u32 changed_pins;
> +	int i;
> +
> +	changed_pins =3D pin_state ^ mc->cached_pin_state;

[Severity: Medium]
Since cached_pin_state is initialized to 0, will this trigger spurious
interrupts at boot for any pins that are physically HIGH when the driver
starts? Does the driver need to read the initial hardware state into
cached_pin_state during probe?

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
Are there data races occurring here? The irq_rise, irq_fall, and
cached_pin_mask fields are updated in the IRQ masking functions while holdi=
ng
irq_lock. However, they appear to be read here locklessly from the event
thread. Could this result in torn reads or evaluating a mix of old and new =
IRQ
configurations?

> +
> +	for_each_set_bit(i, (unsigned long *)&fired_pins, MC33978_NUM_PINS) {

[Severity: High]
Does casting this 32-bit variable to an unsigned long pointer cause
out-of-bounds stack reads on 64-bit architectures? On Big-Endian systems,
will the bit positions be misaligned and break interrupt handling?

> +		int virq =3D irq_find_mapping(mc->domain, i);
> +
> +		handle_nested_irq(virq);
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
If this regmap_read fails, it returns early without clearing harvested_flag=
s.
Since mc33978_handle_events loops continuously while harvested_flags is
non-zero, will an SPI read failure result in an uninterruptible infinite lo=
op
and soft lockup?

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
> +
> +	} while (atomic_read(&mc->harvested_flags) !=3D 0);

[Severity: High]
Are memory barriers needed here for lockless event synchronization?
atomic_set and atomic_read do not imply memory barriers.

Can the loop thread clearing is_handling be reordered with reading
harvested_flags, while the SPI thread setting harvested_flags is reordered
with reading is_handling? If both threads read the other's flag as 0, could
the event loop exit and the SPI thread skip scheduling the work, permanently
dropping hardware events?

> +
> +	return handled;
> +}
[ ... ]
> +static int mc33978_irq_init(struct mc33978_mfd_priv *mc)
> +{
[ ... ]
> +	ret =3D devm_request_threaded_irq(dev, mc->spi->irq, NULL,
> +					mc33978_irq_thread,
> +					IRQF_ONESHOT | IRQF_SHARED,
> +					dev_name(dev), mc);

[Severity: High]
Does the Linux IRQ core unconditionally reject the IRQF_SHARED and
IRQF_ONESHOT flags when provided with a NULL primary handler? Will this cau=
se
the driver probe to always fail, since a shared interrupt line requires a
primary handler to identify if the device generated the interrupt before
masking the shared line?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +
> +	return 0;
> +}
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
As mentioned in mc33978_handle_events, atomic_or and atomic_read do not
provide memory barriers. Can the lack of smp_mb() cause this read to be
reordered, resulting in a race condition that loses hardware events?

> +		schedule_work(&mc->event_work);
> +}
[ ... ]
> +static int mc33978_probe(struct spi_device *spi)
> +{
[ ... ]
> +	mutex_init(&mc->event_lock);
> +	INIT_WORK(&mc->event_work, mc33978_event_work);

[Severity: High]
If probe fails after IRQ is requested, or when the driver is unbound, does
this missing devm action to cancel the event_work result in a use-after-free
crash? If an SPI transfer schedules the work just before teardown, it might
execute after the mc structure is freed by devres.

> +
> +	atomic_set(&mc->harvested_flags, 0);
> +	atomic_set(&mc->is_handling, 0);
> +
> +	mc33978_prepare_messages(mc);
[ ... ]
> +	ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> +				   match_data->cells, match_data->num_cells,
> +				   NULL, 0, mc->domain);

[Severity: Medium]
Will using PLATFORM_DEVID_NONE here cause sysfs naming collisions if multip=
le
MC33978/MC34978 devices exist on the system? Should PLATFORM_DEVID_AUTO be
used to dynamically assign unique IDs instead?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add MFD child devices\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mc33978_of_match[] =3D {
> +	{ .compatible =3D "nxp,mc33978", .data =3D &mc33978_match_data },
> +	{ .compatible =3D "nxp,mc34978", .data =3D &mc34978_match_data },

[Severity: Medium]
Does directly passing struct pointers via the .data field violate MFD subsy=
stem
guidelines? MFD guidelines mandate using an enum or integer ID instead of
embedding pointers in the match table to prevent memory safety hazards and
initialization ordering races.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mc33978_of_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260316140514.1406=
588-1-o.rempel@pengutronix.de?part=3D2
