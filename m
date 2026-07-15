Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E1941D65D;
	Wed, 15 Jul 2026 09:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107049; cv=none; b=K5tCBXPatbLjWwxGWuUzLIfzEb+O+VZRoJOXRQo22dR9t8II7EJaG/JVotCbpVC+s3qGbN28i4o4QDgZtfsByP6Jjn81Jjz0qJAXbRoOEsEYXawHLRX+x+XmkM8h+iqs8geus9fBBGq+9fXVpIE5r9rextpI+AxyiQgfWvGlF8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107049; c=relaxed/simple;
	bh=VgHMCGzNBXGaPywPybMQMIbKO8EQpYffRuRZpY/DQys=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IQOq+yMJFc61cCGaTtyxeLFQ0avBx2FmECtZ/uigoXNaPGDZ+H0pOCrMLPc+qIA2ADvmVunWHvWv7NGT5Rg+N0Df8xItjiyh0ZKK2n4L3fASZ7GLsFuprP+Q/91VEc3suezMDsPKrmTpZiB3zq6L6qtIZEb+M+JXvzbcVq/dkKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xjy2E3uY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xjy2E3uY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BC21F000E9;
	Wed, 15 Jul 2026 09:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784107044;
	bh=BMtuoqFSnZRAC/VAd7l7Q/Lccquxe4xx3tV4v3AAv9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xjy2E3uYq21Yon4JMrD6i/FYSCf43J52rV2l10QDmWd2G9e9UCefPWROINhLqFV8j
	 9DD+G7v1R8ZyuVDrueh16eDtOr8a+bLBdCi+Wgvg9SAAceKH5M+hc+u0KMdYW6GTxu
	 LwFczGFs1YhDUb4A7ecP8dQX5e9yzZ3wSHZXuOyjq0u92PYFMlKgdR3tdzD/fET/Wy
	 4c3wSbK9TdJxp8PGPf6Af4S7ETDBheUKerHsMTVeznjEU+hvrUxtZloefoEGcHNtjP
	 gL/xRny6AI1FitBFzYrt2nEzqzJsRKomrBv10xAIUejhGJvLRBgaBE+0jv3L8Ae8eK
	 4kIEUvo+R4C2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: (kb9002) Add driver for Kandou KB9002
 retimer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-kb9002-upstream-v2-3-2fd390383da5@amd.com>
References: <20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com>
 <20260715-kb9002-upstream-v2-3-2fd390383da5@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 09:17:23 +0000
Message-Id: <20260715091724.18BC21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The driver implements its own internal mutex for locking hardwar=
e accesses instead of using the hwmon subsystem's `hwmon_lock()` API.
- [Low] The `i2c_device_id` array is initialized using a positional instead=
 of a named initializer.
--

--- Patch [3]: [PATCH v2 3/4] hwmon: (kb9002) Add driver for Kandou KB9002 =
retimer ---
commit 59c6448090144292eb629f4257436694b1eaaa0d
Author: Andy Chung <Andy.Chung@amd.com>

hwmon: (kb9002) Add driver for Kandou KB9002 retimer
   =20
The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes an SMBus
target with mandatory PEC. Add a hwmon driver reporting the firmware
aggregated maximum die temperature as temp1_input, with the firmware
version and boot status under debugfs.

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
Is this custom mutex necessary? The hwmon subsystem guidelines state that
drivers should use hwmon_lock() and hwmon_unlock() to serialize operations
for attributes registered by other means.

By using a custom internal mutex, does the driver bypass the standard
subsystem synchronization architecture and introduce inefficient double-loc=
king
on sysfs reads, which are already protected by the hwmon core?

[ ... ]
> +static const struct i2c_device_id kb9002_id[] =3D {
> +	{ KB9002_DEV_NAME },
> +	{ }
> +};

[Severity: Low]
This isn't a bug, but does this array initialization bypass the I2C
subsystem guidelines?=20

The I2C client initialization rules request that initialized arrays of type
struct i2c_device_id use named initializers rather than positional
initializers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-kb9002-ups=
tream-v2-0-2fd390383da5@amd.com?part=3D3
