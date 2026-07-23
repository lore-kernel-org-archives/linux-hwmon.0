Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7562F44E662;
	Thu, 23 Jul 2026 16:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822840; cv=none; b=ttblgvT0UdUQ0w0y2QJoiK1lvue4PBzV249hy3yePRC75u4+k485uEDIWtE6wi7G6lTCbgMSKJMKR39fQitYNZflUIl4tAMeeJZapFN5q+abrMGUyIGyXN/lrkouTc+G0N6ei+Z3f0c1o+eX9Vw5RDJPvDvxdzwr9wpKFAV+1+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822840; c=relaxed/simple;
	bh=qQk2w9GyWZ2R83vs4/zMvOqLQ8DLrpquL1dBXEEuE/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LZoIryqXyehhUP0IPpNxCJ/VQT4JaYcqkseICvzUs730dw6ky9BVf20BopJ8f3A2asr1KLDYwApqIYWWhH659J0MEWEQP/rTNEAUCyu6nC3SRFO80FpytL+tRUp/Ip3QdKtWeIxKzTW1MwV/P6SX9YdZm3FC4NEXt/OOgp42+No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmGYEMpc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmGYEMpc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEA61F000E9;
	Thu, 23 Jul 2026 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784822837;
	bh=cIUx+IkdD8M2OCasN3M99fmzbDxWRPzG4tlzT0WzXLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZmGYEMpcltWvhFPhoT6yStyMSW1DN8CKtjhx5XGcMsvQ5O0/grZvAYf9WdyuFrvv4
	 v+yCAvHVX+UlEkIDXNqPvK6QviGbiS/ZSvrCdnDsP0xzTgd0uhW9N14bZiUX/NVFRM
	 J8qDseJKU3Q0cX6X6XuGy/T7xhPEpM/HrA/gIIp+bCbM3P6FBevTz/x4MRL+eGJPL4
	 3v5CiMJZxMgmYekqL81gKjLNyOWwgrcRmvBYCkrwQPP21Nui+RpGOFEvkaMvt13asu
	 +7XS4TNJdBQTfA5Wo9bGOcZnjwiCPL2++fQ4HaUqTde9CIa9/XLi+w52nDeh+Iw26D
	 FA+6S/VDdUq5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: pmbus: add MPQ8646 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723-mpq8646_v0-v2-3-3c4cb71f23c0@free.fr>
References: <20260723-mpq8646_v0-v2-0-3c4cb71f23c0@free.fr>
 <20260723-mpq8646_v0-v2-3-3c4cb71f23c0@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 16:07:17 +0000
Message-Id: <20260723160717.8AEA61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Stack-allocated buffers are passed to `i2c_transfer()` in `mpq8646=
_raw_xfer_rword()`, violating DMA mapping rules.
- [Medium] Writing to `alarm_poll_interval_ms` via debugfs fails to restart=
 polling if it was previously disabled.
- [Medium] The driver bypasses the PMBus core lock (`pmbus_lock()`) during =
concurrent hardware accesses from delayed workers, debugfs, and NVMEM reads.
- [Low] `mpq8646_write_byte` incorrectly hooks the Send Byte callback to in=
tercept `PMBUS_PAGE` writes, making the swallow logic dead code.
- [Low] Multi-variable data race in debugfs probe handlers leads to torn di=
agnostic data being exposed to userspace.
- [Low] Direct hardware page writes in debugfs bypass PMBus core, permanent=
ly desynchronizing the cached page state.
--

--- Patch [3]: [PATCH v2 3/3] hwmon: pmbus: add MPQ8646 driver ---
commit 8f8537703d7daf4f173be90253175f7bc734cf66
Author: Vincent Jardin <vjardin@free.fr>
Subject: hwmon: pmbus: add MPQ8646 driver

This commit adds a new PMBus driver for the MPS MPQ8646 synchronous buck
converter. It provides basic PMBus telemetry along with MPS-specific
extensions for alarm polling, STATUS_WORD decoding, and NVM recovery.
The driver also integrates with the regulator framework and provides debugfs
entries for hardware introspection.

> diff --git a/drivers/hwmon/pmbus/mpq8646.c b/drivers/hwmon/pmbus/mpq8646.c
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

[Severity: High]
Is it safe to pass stack-allocated buffers to i2c_transfer() here?
If the underlying I2C adapter driver uses DMA for transfers, dma_map_single=
()
will attempt to map these stack addresses. On systems with virtually mapped
stacks, this violates DMA mapping rules and could lead to memory corruption.

[ ... ]
> +static int mpq8646_write_byte(struct i2c_client *client, int page, u8 va=
lue)
> +{
> +	struct mpq8646_priv *priv =3D mpq8646_priv_from_client(client);
> +
> +	atomic_inc(&priv->write_byte_calls);
> +	MPQ8646_TRACE("write_byte page=3D%d value=3D0x%02x\n", page, value);
> +
> +	if (priv->debug_delay_us)
> +		udelay(priv->debug_delay_us);
> +
> +	if (value =3D=3D PMBUS_PAGE) {
> +		atomic_inc(&priv->page_writes_swallowed);
> +		return 0;
> +	}

[Severity: Low]
Does this hook effectively intercept page writes?
The write_byte callback is used for the PMBus Send Byte protocol, but PMBus
page changes use the Write Byte Data protocol via i2c_smbus_write_byte_data=
().
It appears page changes will completely bypass this check.

[ ... ]
> +static int mpq8646_nvmem_read(void *data, unsigned int offset, void *val,
> +			      size_t bytes)
> +{
> +	struct mpq8646_priv *priv =3D data;
> +	u8 *out =3D val;
> +	size_t i;
> +
> +	if (offset >=3D MPQ8646_NVMEM_SIZE)
> +		return -EINVAL;
> +	if (offset + bytes > MPQ8646_NVMEM_SIZE)
> +		bytes =3D MPQ8646_NVMEM_SIZE - offset;
> +
> +	memset(out, 0, bytes);
> +
> +	mutex_lock(&priv->mps_lock);
> +	for (i =3D 0; i < ARRAY_SIZE(mpq8646_nvmem_map); i++) {

[Severity: Medium]
Does this sequence bypass the PMBus core serialization?
By using the private mps_lock instead of pmbus_lock(), the PMBus core could
concurrently issue sysfs reads during these NVMEM reads.

[ ... ]
> +static int mpq8646_dbg_probe_smbus_rword(void *data, u64 val)
> +{
> +	struct mpq8646_priv *priv =3D data;
> +	int rc;
> +
> +	rc =3D i2c_smbus_read_word_data(priv->client, (u8)val);
> +	priv->last_probe_rc =3D rc;
> +	priv->last_probe_data =3D (rc < 0) ? 0 : (u16)rc;
> +	return 0;
> +}

[Severity: Low]
Could concurrent debugfs writes cause torn diagnostic state here?
The last_probe_rc and last_probe_data variables are updated sequentially
without synchronization. This might expose mismatched values to userspace
readers in mpq8646_dbg_last_probe_show().

[ ... ]
> +static int mpq8646_dbg_probe_page_write(void *data, u64 val)
> +{
> +	struct mpq8646_priv *priv =3D data;
> +	int rc;
> +
> +	rc =3D i2c_smbus_write_byte_data(priv->client, PMBUS_PAGE, (u8)val);

[Severity: Low]
Could this direct hardware page write desynchronize the PMBus core page cac=
he?
Since the core's software page cache is not updated, and the driver declares
pages =3D 1, the core assumes page switches are unnecessary and will not re=
store
it. This could cause sysfs telemetry to return incorrect data until reload.

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
> +	mutex_lock(&priv->mps_lock);
> +
> +	wp_orig =3D i2c_smbus_read_byte_data(priv->client, PMBUS_WRITE_PROTECT);

[Severity: Medium]
Does this multi-step unlock sequence bypass pmbus_lock()?
The PMBus core could issue interleaved sysfs reads while the chip is unlock=
ed
or busy writing to NVM, potentially leading to I2C NACKs.

[ ... ]
> +static void mpq8646_debugfs_register(struct mpq8646_priv *priv)
> +{
[ ... ]
> +	debugfs_create_file_unsafe("restore_all", 0200, root, priv,
> +				   &mpq8646_dbg_restore_all_fops);
> +	debugfs_create_u32("alarm_poll_interval_ms", 0600, root,
> +			   &priv->alarm_poll_interval_ms);

[Severity: Medium]
How is the worker restarted if a user writes to this debugfs file after
disabling polling?
Because the variable is exported directly without a setter function, writing
a non-zero value updates the integer but fails to call schedule_delayed_wor=
k()
to re-arm the worker.

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
> +		return;	/* SMBALERT# wired; polling not needed */
> +
> +	if (!priv->alarm_poll_interval_ms)
> +		return;	/* polling disabled; don't re-arm */
> +
> +	if (!priv->hwmon_dev)
> +		goto rearm;	/* hwmon not ready yet; try again next tick */
> +
> +	rc =3D i2c_smbus_read_word_data(priv->client, PMBUS_STATUS_WORD);

[Severity: Medium]
Does this direct hardware telemetry access also bypass pmbus_lock()?
Without the core lock, concurrent accesses from this background worker
could conflict with other sysfs polling.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-mpq8646_v0=
-v2-0-3c4cb71f23c0@free.fr?part=3D3
