Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6F341F35C;
	Wed, 15 Jul 2026 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107162; cv=none; b=ZDBtkRUc2Gx7FQhTeFQwHqemvsszt6Gw7n0DMbGyGnIqMRLkoym/aNCmLUJfy6acpy54nMj8ERuwY5XD4561DF/auRTrFUaYQQlexlctP+iBxiH6GCSXiaf3lXS/uhKTgAwiTkJ6ZcYEAnHd6sSWBqrw0cZwf9tFM4pz0PtxFKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107162; c=relaxed/simple;
	bh=yTNeCQYAVw1I2aJSvC3ypbspFE1jXVE2lgSbpS0+o3Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cvUFg0wUVyW8BCwfwwybCR9KOmNrBkhvWOQrPkN7cy5oBBgBeja+Mq0aF6a4XQQ281cMY9ynBJsuEUYMrk0nIPWKIpuP8GgzlzIBhebsH/pzSz7Y8B2iLJS0/Zb+CWPreDVv6UNhpIpuqdAp9vl0ViFmQcSaZEeX2Dqq3WbY9Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpXEHY5i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpXEHY5i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AA81F000E9;
	Wed, 15 Jul 2026 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784107159;
	bh=ty8uHDtWe5zjfS/fRCQdvJ13E/CKokpCSXKqMAVn0a8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KpXEHY5i9M6Y+vOTdpfZ87gID95pUURFKb1hsI67LsMs36f83RpaTgRDsNZbG4myX
	 sgjwEdAy1P91nhazIikPiXLpy5UhQABCVF9+rjHC28FzOjBcoSSjgaUcsOn6LsC1yy
	 s4lAOaAPqrAHKzOxhK2H/e2br4xySvzVV+ZLV2nvKmdCJDofm2uO0Irea6nWNvaA7e
	 irK1dz8POpU0Kfw+/VzQG8qfB0filaVoc0K0yM/2Vk//oASt04hTPq7duouPngHnZS
	 nsldDAB3Rh2v5UbZIeuGSSD/2uurSDBnMKpWz91ijP/bZZoJl7io4gYlhh7L4+HsuI
	 S+ZWMNjO9AOVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: (kb9002) Add documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715-kb9002-upstream-v2-4-2fd390383da5@amd.com>
References: <20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com>
 <20260715-kb9002-upstream-v2-4-2fd390383da5@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 09:19:18 +0000
Message-Id: <20260715091919.31AA81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The driver implements a custom private mutex to serialize access=
 instead of using the mandated hwmon_lock() API.
- [Low] The i2c_device_id array is initialized without named initializers, =
violating I2C subsystem guidelines.
--

--- Patch [4]: [PATCH v2 4/4] hwmon: (kb9002) Add documentation ---
commit 9ba497f3aeb63905e9272367f2a7abaf03805f1c
Author: Andy Chung <Andy.Chung@amd.com>

hwmon: (kb9002) Add documentation
   =20
Document the sysfs and debugfs interfaces of the Kandou KB9002 hwmon
driver.

> diff --git a/drivers/hwmon/kb9002.c b/drivers/hwmon/kb9002.c
> new file mode 100644
> index 0000000000000..94c7d95b3fff5
> --- /dev/null
> +++ b/drivers/hwmon/kb9002.c

[ ... ]

> +struct kb9002_data {
> +	struct i2c_client *client;
> +	struct mutex lock;	/* serialises register accesses */
> +};

[Severity: Medium]
Does this custom mutex violate the hwmon locking guidelines?

The hwmon subsystem core already serializes operations for registered
attributes. For attributes registered by other means (such as the debugfs
entries added by this driver), the hwmon guidelines state that drivers
should use hwmon_lock() and hwmon_unlock() rather than implementing a
private lock.

Using a custom lock here results in unnecessary double-locking on the sysfs
read paths.

[ ... ]

> +static int kb9002_fw_read(struct kb9002_data *data, u16 reg, u32 *val)
> +{
> +	struct i2c_client *client =3D data->client;
> +	u8 addr[2];
> +	u8 rbuf[I2C_SMBUS_BLOCK_MAX];
> +	int ret;
> +
> +	put_unaligned_le16(reg, addr);
> +
> +	mutex_lock(&data->lock);

[Severity: Medium]
Can this lock be replaced with hwmon_lock()?

The private lock is taken here during firmware reads instead of relying on
hwmon core serialization or hwmon_lock().

[ ... ]

> +static int kb9002_smbus_hw_read(struct kb9002_data *data, u32 reg, u32 *=
val)
> +{
> +	struct i2c_client *client =3D data->client;
> +	u8 addr[4];
> +	u8 rbuf[I2C_SMBUS_BLOCK_MAX];
> +	int ret;
> +
> +	put_unaligned_le32(reg, addr);
> +
> +	mutex_lock(&data->lock);

[Severity: Medium]
Similarly, can this hardware read use hwmon_lock() instead of the custom
lock?

[ ... ]

> +static const struct i2c_device_id kb9002_id[] =3D {
> +	{ KB9002_DEV_NAME },
> +	{ }
> +};

[Severity: Low]
Does this array initialization violate I2C subsystem guidelines?

The I2C subsystem explicitly mandates that initialized arrays of type
struct i2c_device_id must use named initializers. Should this be updated
to use .name =3D KB9002_DEV_NAME?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-kb9002-ups=
tream-v2-0-2fd390383da5@amd.com?part=3D4
