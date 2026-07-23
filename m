Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244DB353A8B;
	Thu, 23 Jul 2026 21:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784843668; cv=none; b=T6yZ7W5bEzxY3xn/26QbzZZP86fyWE/IiDhvxt+gujm6hYx8uX+xoefv6vv/M/CrSCOOUfc+udovHYb3geD1PRJwma0VhX0st2+J59jhgQK8Lp+lb8COZzUtkLXmON5evx4yn8t+5qhOdoJiMF4TwfyzvR7P5rDsCpC6zb9+2ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784843668; c=relaxed/simple;
	bh=QDA1n0F780C0rM9/BFIx5Umj8/3AnosqNDzh8tGvlW4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EOPnRbCVlNCYQIcGa9UQK15a5C8mGF5vMthv1pRh3xjIEZgdKeiwPNdrAPHo6jL3EPseQ/+3tJ8IwxQuWuoP+oQiv6fIv/tmMBIphbof8hl+Gy1s4BTFhSteydSe6v9dGEeHk7oYyk1xtFK3iNSAtrGt1+2bFhfykcSOpRpAiiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXS5R+On; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXS5R+On"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5591F000E9;
	Thu, 23 Jul 2026 21:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784843662;
	bh=Q17FwaUcs9wtjnsc8JU2nHsBtx+LfDtUQRfLqHN7ZRM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FXS5R+On48fGawqtgzE++VWpTLo4na2s0qOqwvA5e3IhbhAJ0uaBDVcszju5u+/Qn
	 jFmg8MBIw1p0Ils9sYOBt0/FgBBCa/LF8YK/RkCpBB9sL5YlWOof0Puc1AXF8A8Lqd
	 yj5Fp6viNde2fftOKVw2aNum6Jji1/GVlteIRrIxk2QJWJn5f1dx6/70U2R77QJ/LL
	 f1VrtqDKChM0kkrMe7a0KB3bXT4hd0UT15rUttw4rnoUXtYveILk3aIh3KowAiyi9e
	 ViYoe1PRrPsktnhgAhVA5+vdqekrLnAk73ysA4gq/FRJIbdvkvc7AMSKv8vxEKFbo/
	 1wXQaTmTrRIfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] hwmon: pmbus: add MPQ8646 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723-mpq8646_v0-v4-3-b6323d5fc524@free.fr>
References: <20260723-mpq8646_v0-v4-0-b6323d5fc524@free.fr>
 <20260723-mpq8646_v0-v4-3-b6323d5fc524@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 21:54:22 +0000
Message-Id: <20260723215422.7D5591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Stack-allocated variables are passed to `i2c_transfer()`, violatin=
g DMA safety constraints.
- [Medium] Incorrect channel indices in mpq8646_alarm_map cause off-by-one =
uevent generation for voltage alarms.
- [Low] The shared debugfs root directory 'mpq8646' is leaked upon module u=
nload.
- [Low] The debugfs entry `probe_page_write` is documented but its implemen=
tation is missing.
- [Low] Spelling mistake in the documentation.
--

--- Patch [3]: [PATCH v4 3/3] hwmon: pmbus: add MPQ8646 driver ---
commit f8de07401397e8a8db3fd6012638f3548f012fb7
Author: Vincent Jardin <vjardin@free.fr>
Date:   Thu Jul 23 21:38:46 2026 +0000

    hwmon: pmbus: add MPQ8646 driver
   =20
    Add a new single-chip driver for the MPS MPQ8646 that is
    a PMBus device.
   =20
    Beyond basic PMBus telemetry, the driver adds:
      - MFR_CFG_EXT gate-close retry after CLEAR_LAST_FAULT.
      - alarm acknowledge via inX_reset_history.
      - STATUS_WORD MPS-extended bit decode + post-mortem clear.
      - In-driver alarm-poll fallback work item (thanks lm90) for
        boards without SMBALERT
      - on_off_config/vout_margin/mfr_pmbus_lock sysfs.

diff --git a/Documentation/hwmon/mpq8646.rst b/Documentation/hwmon/mpq8646.=
rst
new file mode 100644
index 0000000000000..61ca2a5387daa
--- /dev/null
+++ b/Documentation/hwmon/mpq8646.rst
@@ -0,0 +1,314 @@
[ ... ]
> +clear_protection_last_force performs the unlock with the following
> +six-step dansing:

[Severity: Low]
This isn't a bug, but there is a typo here (dansing instead of dancing).

[ ... ]
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +File                        Action
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +``probe_smbus_rword <reg>``  i2c_smbus_read_word_data on <reg>
> +``probe_smbus_rbyte <reg>``  i2c_smbus_read_byte_data on <reg>
> +``probe_raw_xfer <reg>``     raw i2c_transfer read-word on <reg>
> +``probe_page_write <pg>``    write PMBUS_PAGE =3D <pg>

[Severity: Low]
The documentation explicitly describes the probe_page_write debugfs entry,
but its implementation appears to be missing from the driver in
mpq8646_debugfs_register().

[ ... ]
diff --git a/drivers/hwmon/pmbus/mpq8646.c b/drivers/hwmon/pmbus/mpq8646.c
new file mode 100644
index 0000000000000..95abd347e3e9b
--- /dev/null
+++ b/drivers/hwmon/pmbus/mpq8646.c
@@ -0,0 +1,1237 @@
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
Are these stack-allocated variables safe for DMA operations?

Passing stack addresses like &cmd and &data in i2c_msg.buf to i2c_transfer()
violates the DMA API when the kernel is compiled with CONFIG_VMAP_STACK=3Dy.
This could lead to a system crash if the underlying I2C controller driver
relies on DMA for transfers.

[ ... ]
> +static void mpq8646_debugfs_register(struct mpq8646_priv *priv)
> +{
> +	struct dentry *root, *parent;
> +	char name[MPQ8646_DEBUGFS_DIRNAME_MAX];
> +	bool parent_ref =3D false;
> +	size_t i;
> +
> +	mutex_lock(&mpq8646_debugfs_root_lock);
> +	parent =3D debugfs_lookup(MPQ8646_DEBUGFS_ROOT_NAME, NULL);
> +	if (!parent)
> +		parent =3D debugfs_create_dir(MPQ8646_DEBUGFS_ROOT_NAME, NULL);

[Severity: Low]
Does this leave a stale directory in debugfs upon module unload?

The shared mpq8646 root directory is created here, but there does not seem
to be a module_exit function handling global teardown to remove it. The
driver relies on module_i2c_driver(), and mpq8646_debugfs_unregister()
only removes the per-device subdirectories, which might leak this root
directory when the module is removed.

[ ... ]
> +static const struct {
> +	u16 mask;
> +	enum hwmon_sensor_types type;
> +	u32 attr;
> +	int channel;
> +} mpq8646_alarm_map[] =3D {
> +	{ PB_STATUS_INPUT,       hwmon_in,   hwmon_in_alarm,   0 },	/* in1_alar=
m  (VIN)  */
> +	{ PB_STATUS_VOUT,        hwmon_in,   hwmon_in_alarm,   1 },	/* in2_alar=
m  (VOUT) */

[Severity: Medium]
Will this correctly attribute the uevents to the intended channels?

Since hwmon_attr_base(hwmon_in) returns 0, hwmon_notify_event() requires
channel 1 for in1_alarm and channel 2 for in2_alarm.

Using 0 and 1 here in mpq8646_alarm_map would misattribute VOUT faults to
in1_alarm, and incorrectly attempt to generate events for in0_alarm which
does not exist.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-mpq8646_v0=
-v4-0-b6323d5fc524@free.fr?part=3D3
