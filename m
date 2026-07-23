Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75063EF64F;
	Thu, 23 Jul 2026 21:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840794; cv=none; b=t7+HWpIPJ4gB9JaV0ioLZWmxZCD/pbYm67GFhdGcEZQ6uvq1rZtRpFxwcQ6enrQytwVQhwpsSUKpbK98i4lbAt+bBlPaPkKwZSuQCEjT3gr268Z+EYo7/3JQOyLdQ5zO3/2X3R4UfwQ4ZgP8asAKbESoNSIXWPTXXvf3f7B4M/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840794; c=relaxed/simple;
	bh=D3a6h5x9ABX0vdZ7WgN8inTOwcRFkneG1NtDKoel3i4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ULVCEZacy+lDiTGJgmUO/PhwHHgCc/eMihD3opnBY93q6Rw995DsXqN32VoG2njbx4nxxUbXmlWF+TCERUzhgU4AX5vxL+yW5MB58zWmZbhZoVdpi8uSDpNTMUjpqfXJtMW/QpQnYOBObPmgm3txUyT/gSDHue5wbnvlzGYIZsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVwbiyCQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVwbiyCQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF85B1F000E9;
	Thu, 23 Jul 2026 21:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784840790;
	bh=8rwOS4tmnI2KRxC6h9KPRpRYTvCeN1O8lMnmuv/V/0w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oVwbiyCQIrmWxsJSwMVnQ8QhXPd+Zp1/eoOotkaRmrcIbct9HSETbzGa/Y+zJ6V6q
	 ChNaRV4CdUGbeM4s/lUHxgG+IMMSwTF7PVVZH2gs2bNCMsiGFAF0TjLCcaeoU7UHfB
	 4oAYHPD4iaRD5eKaBiknrP2pi10/nfCyCoyFns0cZ+Tr728ihuc1airO9x/WStKms3
	 geR0A3n0dIzzhsr18/OnA2NWSzMbEjFFQwgTwRWOTvQUeyXBGBguNRwYAmH3c/L7Vd
	 EhZ/9xvQ893HV1uaaIFkcLp2x2DD9XO44vWVMqpPYRT3fZ42hlZE0mM9sUl3yBJjsI
	 uZEf2cIt+FrZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: pmbus: add MPQ8646 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260723-mpq8646_v0-v3-3-1af1f3d38848@free.fr>
References: <20260723-mpq8646_v0-v3-0-1af1f3d38848@free.fr>
 <20260723-mpq8646_v0-v3-3-1af1f3d38848@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 21:06:29 +0000
Message-Id: <20260723210629.DF85B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Premature debugfs registration exposes userspace interfaces before=
 device probe completes, allowing NULL pointer dereferences and Use-After-F=
ree on probe error.
- [High] Incorrect teardown order in `mpq8646_remove()` allows a concurrent=
 debugfs write to re-queue a delayed work on freed memory.
- [High] Stack-allocated buffers are passed to `i2c_transfer()`, which viol=
ates the DMA API rules and can cause kernel panics.
- [Medium] Concurrent I2C probes will cause debugfs registration to fail fo=
r some device instances.
- [Low] The debugfs diagnostic fields last_probe_rc and last_probe_data are=
 updated outside of mps_lock, leading to torn reads.
--

--- Patch [3]: [PATCH v3 3/3] hwmon: pmbus: add MPQ8646 driver ---
commit 543735e252009063d43f85076b5597345b0c78ea
Author: Vincent Jardin <vjardin@free.fr>

hwmon: pmbus: add MPQ8646 driver

Add a new single-chip driver for the MPS MPQ8646 that is a PMBus device.
Beyond basic PMBus telemetry, the driver adds several features like
alarm acknowledge and in-driver alarm-poll fallback.

> diff --git a/drivers/hwmon/pmbus/mpq8646.c b/drivers/hwmon/pmbus/mpq8646.c
> index 0000000000000..830f5724b6ee5
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mpq8646.c
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
> +		{
> +			.addr =3D client->addr,
> +			.flags =3D I2C_M_RD,
> +			.len =3D sizeof(data),
> +			.buf =3D (u8 *)&data,
> +		},
> +	};
> +	int rc;
> +
> +	rc =3D i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));

[Severity: High]
Can this cause a kernel panic if the I2C host controller uses DMA? The cmd
and data buffers are allocated on the stack and passed directly to
i2c_transfer(). On platforms with CONFIG_VMAP_STACK, this can lead to memory
corruption or a crash since stack memory is virtually mapped. Could these
buffers be allocated dynamically or embedded in a DMA-safe structure instea=
d?

[ ... ]
> +static int mpq8646_dbg_clear_protection_last(void *data, u64 val)
> +{
> +	struct mpq8646_priv *priv =3D data;
> +	int rc;
> +
> +	if (!val)
> +		return 0;
> +
> +	mutex_lock(&priv->mps_lock);
> +	rc =3D i2c_smbus_write_byte(priv->client, MPS_CLEAR_LAST_FAULT);
> +	mutex_unlock(&priv->mps_lock);
> +
> +	priv->last_probe_rc =3D rc;
> +	priv->last_probe_data =3D 0;

[Severity: Low]
Are these fields intentionally updated outside of mps_lock? Since a concurr=
ent
reader in mpq8646_dbg_last_probe_show() takes the lock, it might observe a
torn state between last_probe_rc and last_probe_data.

[ ... ]
> +static int mpq8646_dbg_clear_protection_last_force(void *data, u64 val)
> +{
> +	struct mpq8646_priv *priv =3D data;
> +	int rc, last_rc;
> +	int wp_orig, cfg_orig;
> +
> +	if (!val)
> +		return 0;
> +
> +	pmbus_lock(priv->client);
> +	mutex_lock(&priv->mps_lock);

[Severity: High]
Could this cause a NULL pointer dereference if it's called before probe
finishes? The debugfs files are registered before pmbus_do_probe() complete=
s,
so pmbus_lock() might try to access an uninitialized clientdata pointer.

[ ... ]
> +static int mpq8646_dbg_store_all(void *data, u64 val)
> +{
> +	struct mpq8646_priv *priv =3D data;
> +	int rc;
> +
> +	if (!val)
> +		return 0;
> +
> +	mutex_lock(&priv->mps_lock);
> +	rc =3D i2c_smbus_write_byte(priv->client, PMBUS_STORE_USER_ALL);
> +	mutex_unlock(&priv->mps_lock);
> +
> +	priv->last_probe_rc =3D rc;
> +	priv->last_probe_data =3D 0;

[Severity: Low]
Similarly to mpq8646_dbg_clear_protection_last(), these fields are updated
outside the locked region. Might this lead to inconsistent diagnostic data
being read?

[ ... ]
> +static void mpq8646_debugfs_register(struct mpq8646_priv *priv)
> +{
> +	struct dentry *root, *parent;
> +	char name[MPQ8646_DEBUGFS_DIRNAME_MAX];
> +	bool parent_ref =3D false;
> +	size_t i;
> +
> +	parent =3D debugfs_lookup(MPQ8646_DEBUGFS_ROOT_NAME, NULL);
> +	if (!parent)
> +		parent =3D debugfs_create_dir(MPQ8646_DEBUGFS_ROOT_NAME, NULL);
> +	else
> +		parent_ref =3D true;
> +	if (IS_ERR_OR_NULL(parent))
> +		return;

[Severity: Medium]
Will concurrent probes of multiple devices cause debugfs registration to fa=
il?
Since the creation of the shared root directory is not serialized, a second
thread might see NULL from debugfs_lookup(), attempt debugfs_create_dir(),
and receive -EEXIST. That would cause IS_ERR_OR_NULL(parent) to evaluate to
true, aborting debugfs initialization for the second device.

[ ... ]
> +static int mpq8646_probe(struct i2c_client *client)
> +{
[ ... ]
> +	mpq8646_debugfs_register(priv);
> +
> +	ret =3D pmbus_do_probe(client, info);
> +	if (ret) {
> +		mpq8646_debugfs_unregister(priv);
> +		return ret;
> +	}

[Severity: High]
Does registering debugfs before pmbus_do_probe() expose the driver interfac=
es
too early? Besides the pmbus_lock() issue mentioned earlier, a userspace
write to alarm_poll_interval_ms could queue priv->alarm_poll_work. If
pmbus_do_probe() then fails, the work isn't cancelled before priv is freed,
which could lead to a use-after-free when the timer fires.

[ ... ]
> +static void mpq8646_remove(struct i2c_client *client)
> +{
> +	struct mpq8646_priv *priv =3D mpq8646_priv_from_client(client);
> +
> +	cancel_delayed_work_sync(&priv->alarm_poll_work);
> +	mpq8646_debugfs_unregister(priv);
> +}

[Severity: High]
Is it safe to cancel the delayed work before unregistering debugfs? A
concurrent userspace write to the alarm_poll_interval_ms debugfs file
could re-queue the work right after cancel_delayed_work_sync() returns.
Then mpq8646_remove() completes, freeing priv, which leads to a
use-after-free when the re-armed timer executes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-mpq8646_v0=
-v3-0-1af1f3d38848@free.fr?part=3D3
