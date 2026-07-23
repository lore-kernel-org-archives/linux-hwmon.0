Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10E513D539;
	Thu, 23 Jul 2026 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812801; cv=none; b=llCkxDCLwiKJTgKQQw/9zwm0jbvVGXB6zcvtPG8u5yY2hWU/HLo5hdv52yQD+u9y3+hOTjCpJmi88JkwyL5ISdAKfc/WwxMrec1GAjyIQH2MndHypkyRhrMsFka35ZIWHfvqPZ2M9UHJPLIGpwAI2reAsoX8yo0IZuZjXfktP6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812801; c=relaxed/simple;
	bh=C/eLYSLK9IehW97UAySyERecMjiL1qOqgts1MATJ4r0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r6K742m0Y03W5vYlM9tyYbPPcFcSzEk4Z6D47d4Zo18uU1bah4rzNmAzRrZGMSlA+SWdLHGXommghdlYoqyHUSVMoh3Qv1/qxM3PVoor/lNZil6KZouV3E+kcuRsj+xrVQXRV4Gl6wC6WFy7/HaIKzrC5BnZTTo/q10wJ9PZ0j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198BD1F000E9;
	Thu, 23 Jul 2026 13:19:52 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: pmbus: add MPQ8646 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723-mpq8646_v0-v1-3-14363c75916f@free.fr>
References: <20260723-mpq8646_v0-v1-0-14363c75916f@free.fr>
 <20260723-mpq8646_v0-v1-3-14363c75916f@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 13:19:48 +0000
Message-Id: <20260723131952.198BD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Missing debugfs unregistration on early probe error paths leads to=
 dangling debugfs files and a Use-After-Free vulnerability.
- [High] Stack-allocated buffers are passed to `i2c_transfer()`, violating =
DMA safety rules.
- [High] Incorrect PMBus Direct format coefficients for VOUT lead to signif=
icantly wrong voltage scaling.
- [High] The shim of PMBUS_WRITE_PROTECT to 0 prevents the core from unlock=
ing the chip, causing silent write failures.
- [Medium] The alarm polling worker unconditionally rearms itself even when=
 an IRQ is configured, causing unnecessary CPU wakeups.
- [Medium] Missing `dput()` after `debugfs_lookup()` causes a dentry refere=
nce leak.
- [Medium] `mpq8646_nvmem_read` accesses NVM registers without holding `mps=
_lock`, leading to data corruption during chip busy windows.
--

--- Patch [3]: [PATCH 3/3] hwmon: pmbus: add MPQ8646 driver ---
commit 55c0a49021c892a77923b9ad41cc1d13d1b685b0
Author: Vincent Jardin <vjardin@free.fr>
Subject: hwmon: pmbus: add MPQ8646 driver

This commit adds a new single-chip PMBus driver for the MPS MPQ8646,
including extended observability and alarm polling fallbacks.

> diff --git a/drivers/hwmon/pmbus/mpq8646.c b/drivers/hwmon/pmbus/mpq8646.c
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mpq8646.c
> @@ -0,0 +1,1214 @@

[ ... ]

> +static int mpq8646_raw_xfer_rword(struct i2c_client *client, u8 reg)
> +{
> +	u8 cmd =3D reg;
> +	__le16 data =3D 0;
> +	struct i2c_msg msg[] =3D {
> +		{
> +			.addr =3D client->addr,
> +			.flags =3D 0,
> +			.len =3D sizeof(cmd),
> +			.buf =3D &cmd,
> +		},

[Severity: High]
Does this pass stack-allocated buffers to i2c_transfer()? Since many I2C
host controllers use DMA, mapping stack memory for DMA can cause a kernel
panic if CONFIG_VMAP_STACK is enabled. Should these buffers be dynamically
allocated?

[ ... ]

> +static int mpq8646_identify(struct i2c_client *client,
> +			    struct pmbus_driver_info *info)
> +{
> +	int vout_mode;

[ ... ]

> +	case PB_VOUT_MODE_VID >> PB_VOUT_MODE_MODE_SHIFT:
> +	case PB_VOUT_MODE_DIRECT >> PB_VOUT_MODE_MODE_SHIFT:
> +		info->format[PSC_VOLTAGE_OUT] =3D direct;
> +		info->m[PSC_VOLTAGE_OUT] =3D MPQ8646_VID_M;
> +		info->b[PSC_VOLTAGE_OUT] =3D MPQ8646_VID_B;
> +		info->R[PSC_VOLTAGE_OUT] =3D MPQ8646_VID_R;
> +		break;

[Severity: High]
Will these coefficients result in the correct voltage scaling? The Direct
format equation converts register Y to physical X using
X =3D (Y * 10^-R - b) / m. With m =3D 64, b =3D 0, and R =3D 1, the effecti=
ve LSB is
10^-1 / 64 =3D 1.5625 mV/LSB.

To match the 6.4 mV/LSB mentioned in the macro comments, would the correct
coefficients be m =3D 15625 and R =3D -2?

[ ... ]

> +static int mpq8646_read_byte_data(struct i2c_client *client, int page, i=
nt reg)
> +{
> +	struct mpq8646_priv *priv =3D mpq8646_priv_from_client(client);
> +	int ret;

[ ... ]

> +	case PMBUS_WRITE_PROTECT:
> +		MPQ8646_TRACE("  WRITE_PROTECT shimmed to 0 (framework path)\n");
> +		return 0;

[Severity: High]
Does returning 0 here prevent the PMBus core from automatically unlocking t=
he
chip? The core initialization code checks PMBUS_WRITE_PROTECT and writes 0 =
to
unlock it only if it appears enabled. By faking an unlocked state, the core
skips the unlock command, which might cause the hardware to silently ignore
sysfs configuration writes.

[ ... ]

> +#if IS_ENABLED(CONFIG_NVMEM)

[ ... ]

> +static int mpq8646_nvmem_read(void *data, unsigned int offset, void *val,
> +			      size_t bytes)
> +{
> +	struct mpq8646_priv *priv =3D data;

[ ... ]

> +		if (e->is_word)
> +			rc =3D i2c_smbus_read_word_data(priv->client, e->reg);
> +		else
> +			rc =3D i2c_smbus_read_byte_data(priv->client, e->reg);
> +		if (rc < 0)
> +			continue;	/* leave the zero-fill in place */

[Severity: Medium]
Does this sequence need to hold mps_lock during the NVM register reads? If
an nvmem read races with a force clear or an NVM store/restore operation, it
might hit an undocumented NVM-busy window, resulting in NACKs and silently
returning zero-filled snapshot data.

[ ... ]

> +#ifdef CONFIG_DEBUG_FS

[ ... ]

> +static void mpq8646_debugfs_register(struct mpq8646_priv *priv)
> +{
> +	struct dentry *root, *parent;
> +	char name[MPQ8646_DEBUGFS_DIRNAME_MAX];
> +	size_t i;
> +
> +	parent =3D debugfs_lookup(MPQ8646_DEBUGFS_ROOT_NAME, NULL);
> +	if (!parent)
> +		parent =3D debugfs_create_dir(MPQ8646_DEBUGFS_ROOT_NAME, NULL);

[Severity: Medium]
Does this code leak the dentry reference returned by debugfs_lookup()? If t=
he
directory already exists, debugfs_lookup() returns it with an incremented
reference count, which requires a matching dput() to prevent a memory leak.

[ ... ]

> +static void mpq8646_alarm_poll_work(struct work_struct *work)
> +{
> +	struct mpq8646_priv *priv =3D container_of(to_delayed_work(work),
> +						 struct mpq8646_priv,
> +						 alarm_poll_work);
> +	int rc;
> +	u16 cur, newly_set;
> +	size_t i;
> +
> +	if (priv->client->irq)
> +		goto rearm;

[ ... ]

> +rearm:
> +	if (priv->alarm_poll_interval_ms)
> +		schedule_delayed_work(&priv->alarm_poll_work,
> +				      msecs_to_jiffies(priv->alarm_poll_interval_ms));
> +}

[Severity: Medium]
Does this unconditionally reschedule the worker even when an IRQ is already
configured? If client->irq is present, taking the goto rearm path will cause
the worker to perpetually wake up and reschedule itself without performing
any checks.

[ ... ]

> +static int mpq8646_probe(struct i2c_client *client)
> +{

[ ... ]

> +	mpq8646_debugfs_register(priv);
> +
> +	if (!device_property_read_u32(dev, "mps,vout-fb-divider-ratio-permille",
> +				      &voltage_scale)) {
> +		if (voltage_scale > MPQ8646_VOUT_SCALE_LOOP_MAX)
> +			return -EINVAL;

[Severity: High]
Can this early return cause a use-after-free in debugfs?

Since mpq8646_debugfs_register() has already created files referencing the
devm_kzalloc-allocated priv struct, returning -EINVAL here leaves dangling
dentry files. If these files are read later, they will dereference the freed
priv structure. Should mpq8646_debugfs_unregister() be called before
returning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-mpq8646_v0=
-v1-0-14363c75916f@free.fr?part=3D3
