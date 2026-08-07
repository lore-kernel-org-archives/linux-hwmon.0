Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D7E4B04BB
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 00:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063653; cv=none; b=lt9VJWB9rl5fUBozBHLtZ0eCwBPuX2hPTH4FBHizyvlqi3oNkCN0KQ6NyXag1VuxPus4Tz2dl5qhaasNP12onPYjF0VqG01si2cQ8j+bz+UT3mt1cf6M9bS7dK+/CR+EW5+z6OT1cu34l007aUBo008jcohTezo3RUF9Sms3WOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063653; c=relaxed/simple;
	bh=BtTuHGmAnLYiT6M+FqVXY27+OrqTkqhyO2VS/i6TnkE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MkQzrxu7Qr1Nr31iKlDSWrA5WiyyOxewKZOvT2fOh1erdWXJZG0e1JPPsBjYUtTclttK43MZ5YPIq1xBAhSE7L/yZYuVYpIiPu2s8W80gx8jaeQirhK2/Dpw9D8qS3R0aV3FKSpnRk0GEb2MWSFvbyT9vaQ+BEcyI7HIRBPzQxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvloDJci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvloDJci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEC51F000E9;
	Fri,  7 Aug 2026 00:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786063651;
	bh=tkq9UXHGT4vKvk2XY+1w6ixOKHYXUk6vies8hNuMJCk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KvloDJciFWacvRsiWhzsuo7n3w+5xymdyt6CNqhgVe6WdRh0dPPvg3V+1/6glYh0v
	 N2NrhPB6xYVi6t71IsrzbZ4H8F5lr/Br2YK31U8Hdw6Pb2KahNRDFK2ODfAoOcWuKy
	 JukU4i7p7MtaboK6utab05JwiOfg8+Jw3BPOgap7+lgSWgZsrvmqlgNP8ml1fLdo0M
	 HC2V5ch6J2Lm1dvV+sbiKmDyOI2yWdvnpOmmE+ScjS0Q18RW8e2Pu32zzTLz+ml4Rc
	 DtO4CimRclpc57VKKg+tNqeIjpKcByWIsDQefb8E5bDhDdG2JBasShkxNDgYlDgwZk
	 ZU5Vm0gagELuQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/1] hwmon: Add Minisforum UM780 XTX EC monitoring
 and fan control
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U2ViYXN0acOhbiBQZXlyb3R0?= <speyrott@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260807003842.249957-2-speyrott@gmail.com>
References: <20260807003842.249957-1-speyrott@gmail.com>
 <20260807003842.249957-2-speyrott@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 00:47:30 +0000
Message-Id: <20260807004731.4EEC51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The driver implements a custom mutex for sysfs attributes and ba=
ckground work instead of using the required hwmon_lock(), and performs redu=
ndant locking inside the core read callback.
--

--- Patch [1]: [RFC PATCH 1/1] hwmon: Add Minisforum UM780 XTX EC monitorin=
g and fan control ---
commit 82feeb1647789c448c800c2c55cd4d4766858bc1
Author: Sebasti=C3=A1n Peyrott <speyrott@gmail.com>

hwmon: Add Minisforum UM780 XTX EC monitoring and fan control

This patch adds a DMI-gated hwmon driver for the embedded controller used by
the Minisforum UM780 XTX. It exposes CPU and system fan control temperatures
and tachometers via sysfs. It also caches coherent fan settings and restores
them after the firmware reloads defaults following resume.

> diff --git a/drivers/hwmon/minisforum-um780xtx.c b/drivers/hwmon/minisfor=
um-um780xtx.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/hwmon/minisforum-um780xtx.c

[ ... ]

> +struct um780xtx_data {
> +	struct device *dev;
> +	/* Serializes EC transactions and cached state updates. */
> +	struct mutex lock;

[Severity: Medium]
Does this driver need a custom mutex? The hardware monitoring subsystem
guidelines state that drivers should use hwmon_lock() and hwmon_unlock()
to serialize attributes registered by other means and for background
handling. Using a custom lock might fragment synchronization and race with
the hwmon core's serialization.

[ ... ]

> +static ssize_t pwm1_enable_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	struct um780xtx_data *data =3D dev_get_drvdata(dev);
> +	unsigned long mode;
> +	u8 expected;
> +	u8 profile;
> +	int ret;
> +
> +	ret =3D kstrtoul(buf, 10, &mode);
> +	if (ret)
> +		return ret;
> +	if (mode !=3D 2 && mode !=3D 3)
> +		return -EINVAL;
> +	expected =3D mode =3D=3D 2 ? UM780XTX_EC_PROFILE_B1 : UM780XTX_EC_PROFI=
LE_B2;
> +
> +	mutex_lock(&data->lock);

[Severity: Medium]
Should this use hwmon_lock() instead of the private data->lock? Since
this attribute is registered outside the core hwmon info array (via
extra_groups), the subsystem guidelines require using hwmon_lock() here to
properly synchronize with core operations.

[ ... ]

> +static int um780xtx_read(struct device *dev, enum hwmon_sensor_types typ=
e,
> +			 u32 attr, int channel, long *value)
> +{
> +	struct um780xtx_data *data =3D dev_get_drvdata(dev);
> +	u8 raw;
> +	int ret;
> +
> +	if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_input && channel <=
 2) {
> +		mutex_lock(&data->lock);

[Severity: Medium]
Is this lock acquisition redundant? The hardware monitoring core already
serializes operations for attributes registered via the info parameter of
hwmon_device_register_with_info(). Acquiring another lock inside the core
read callback might be unnecessary if hwmon_lock() is used throughout.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807003842.2499=
57-2-speyrott@gmail.com?part=3D1
