Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA6D3FF1AD;
	Tue, 14 Jul 2026 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017999; cv=none; b=iTrHRWy3AnhXPmLH98rEwq72++OMmk2lUxaxMmblMubKChmikhzVB1YWqCw+1NVoxh9K5iZ23XrH8mKgTzqhvJZsuGnxiyrCwm6MS8vHfBl51mP5gMMGzhGXHiRV98MJG8Qr8xh3kqY4KG6/v0W+7BwLZAve6/Vodvk1vwbQDqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017999; c=relaxed/simple;
	bh=Po1thjD6LauR3HB2IqTO/d2jgfb6F9Zl6ups29ddTb8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P0ezvLsWwRElI9RQst6ooaCywbq1+KMUXugcEDXRcryE17GdMOrCg83LZMll94RmLF2nWdOf7pLErdzBLDXkB7CYiLqnU14iMs00MuPe7iGeTIQyBbHBNxpBcuvr8o9rg+vdZ6o6ZSGwPDTpLRlOnULoIF/wgqlLPdDLvMcBy6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/2DrJlw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/2DrJlw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156CB1F00A3F;
	Tue, 14 Jul 2026 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784017992;
	bh=2T6VTgE/HAHTF7/jH40rKpPfJqrCHhb+B/zO7oYPW/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i/2DrJlwPnjjEkM4dm6/Nu9Ndqa6rOoUwLXOFgXX33dFgO9B58QGCAhznzKixe9dL
	 +iYC27/R6FMZSNuclj4ZBOwyWeRpKdzCWpyMYBt0UpLSE3NnNxAuNlV8sJnPPsVIdj
	 siM8Siol7in13DlPeqZq11TU3oj0zwH00lWhNf+I8/360apbHLxOvVYgItHwG5tlDU
	 jDzrnBlzHmyp6F6cXwdU+kY4v9cwgsyzDFkIQ3N976n9uV5JZyfY/BvDPjlrjx9Xj0
	 xxrlNz3zebh0Hcby5UosS9mDfXD+1rt9jLcFRFbTlU12ThtgwjRxjB2KJBgd9/xIS6
	 YyejuAaEEMvow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] hwmon: (kb9002) Add driver for Kandou KB9002
 retimer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260714-kb9002-upstream-v1-3-8fd2f0b135d8@amd.com>
References: <20260714-kb9002-upstream-v1-0-8fd2f0b135d8@amd.com>
 <20260714-kb9002-upstream-v1-3-8fd2f0b135d8@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 08:33:11 +0000
Message-Id: <20260714083312.156CB1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] The driver introduces its own mutex for register accesses instea=
d of using the standard hwmon lock, violating subsystem guidelines.
- [Medium] Probe loop retries repeatedly on fatal I2C read failures, causin=
g extreme bus delays on missing devices.
- [Medium] Unconditional requirement for I2C_FUNC_I2C prevents driver from =
loading on SMBus-only adapters.
- [Medium] Missing suspend/resume handlers will cause devices strapped to r=
aw I2C to fail after system resume.
--

--- Patch [3]: [PATCH 3/4] hwmon: (kb9002) Add driver for Kandou KB9002 ret=
imer ---
commit 929a2de2e63d6d8333f36707bf6da054f63aeab6
Author: Andy Chung <Andy.Chung@amd.com>
Subject: hwmon: (kb9002) Add driver for Kandou KB9002 retimer

The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes an SMBus target
with mandatory PEC. This patch adds a hwmon driver reporting the firmware
aggregated maximum die temperature as temp1_input, with the firmware version
and boot status under debugfs.

> diff --git a/drivers/hwmon/kb9002.c b/drivers/hwmon/kb9002.c
> new file mode 100644
> index 0000000000000..2a3dffe52a62f
> --- /dev/null
> +++ b/drivers/hwmon/kb9002.c

[ ... ]

> +struct kb9002_data {
> +	struct i2c_client *client;
> +	struct mutex lock;	/* serialises register accesses */
> +};

[Severity: Medium]
According to the hwmon subsystem guidelines, drivers must use hwmon_lock()
and hwmon_unlock() to serialize attributes registered by other means, such
as the debugfs entries.

Is it appropriate to introduce a custom mutex here instead of saving the
hwmon_dev pointer during kb9002_probe() and utilizing the standard hwmon lo=
ck
in functions like kb9002_fw_read()?

[ ... ]

> +static int kb9002_read_revid(struct i2c_client *client, u32 *revid)
> +{
> +	u8 dummy;
> +	int ret;
> +	int i;
> +
> +	for (i =3D 0; i < KB9002_REVID_READ_RETRIES; i++) {
> +		ret =3D kb9002_i2c_read(client, KB9002_HW_REG_REVID, revid);
> +		if (!ret && (*revid >> 24) !=3D 0xff)
> +			return 0;
> +		/* Drain one byte from the chip to re-align the I2C FIFO. */
> +		i2c_master_recv(client, &dummy, 1);
> +	}
> +
> +	return ret ? ret : -EIO;
> +}

[Severity: Medium]
If the initial I2C read fails with a hard error, such as when the device is
missing and kb9002_i2c_read() returns a negative error code, this loop does
not short-circuit.

Could this needlessly loop and execute a failing i2c_master_recv() on every
iteration, causing unnecessary bus traffic and probe delays?

[ ... ]

> +static int kb9002_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct kb9002_data *data;
> +	struct device *hwmon_dev;
> +	u32 vid;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_BLOCK_DATA |
> +				     I2C_FUNC_SMBUS_PEC | I2C_FUNC_I2C))
> +		return -ENODEV;

[Severity: Medium]
This check unconditionally requires I2C_FUNC_I2C.

Could this prevent the driver from loading on SMBus-only adapters even if
the retimer is properly strapped to SMBus mode and does not require the raw
I2C fallback?

Would it be better to defer checking for raw I2C functionality to
kb9002_enable_smbus_target() where it is actually needed?

[ ... ]

> +static struct i2c_driver kb9002_driver =3D {
> +	.driver =3D {
> +		.name =3D KB9002_DEV_NAME,
> +		.of_match_table =3D kb9002_of_match,
> +	},
> +	.probe =3D kb9002_probe,
> +	.id_table =3D kb9002_id,
> +};
> +module_i2c_driver(kb9002_driver);

[Severity: Medium]
If the retimer is strapped to raw I2C mode, the driver switches it to SMBus
mode during probe.

If the device loses power during system suspend and defaults back to raw
I2C mode on wake, will all subsequent SMBus accesses by the driver fail?

Does this driver need pm_ops with a resume handler to restore the device
state after suspend?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-kb9002-ups=
tream-v1-0-8fd2f0b135d8@amd.com?part=3D3
