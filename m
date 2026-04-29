Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B2528CF77
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 20:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777493242; cv=none; b=EMrBJBWGGAtu04Gy/A89H1/1IamNQODXurlV3Umdnocizg6pS3uG5rAch3UamtkAUz4SkrDVQdPChcUoFZbsOShbJ+lFRdNr6lCca870nLykgJqAGQresnDS4ZB8N92efMwLzLvJDe5JEVFriC7Ii9AWGBJYL1nONXgXXgjSYKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777493242; c=relaxed/simple;
	bh=OnOEOgKfs3AZU8SIhAL1qoOHqCdwFoqKBzNywKLdQXs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dxkdXdb6KvkSIKZMInT8jh5++yQ5FcmKBmDzFucVZVvTuuMKplI6vGfY4hypARsXyXEo2JSK8tjtHp/fAHngrXcMD0hALwV7kWWlleCeaZJv6sHAB93A/ei7eVG0dH1s22OrnFCQS6Ir5KW1AMGj1+EpTlInfe7oVmN+EygShJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3J6kPs+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3J6kPs+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDD2C19425;
	Wed, 29 Apr 2026 20:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777493242;
	bh=OnOEOgKfs3AZU8SIhAL1qoOHqCdwFoqKBzNywKLdQXs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=j3J6kPs+P6b9EKakj4uVs4aRlqQ75HjXognR6EFFssuwzB6Xc2oJ7wmj4NVJFiTpd
	 7VbCzx8k+G9r9uZdSgTWZ8UfF5iJScaEdx7+HaNndS6dRDOMemSKPNBOLDHBQbuvBy
	 +faxEFKgkV0vq9MzQLdjJhWkWx/iuEj1jTyORd4cViDS9dK15vAfznqnlD7Vyqh7Q2
	 ByT6Vgxs2BAf25YW4zTCMHPBY4MgUtrWFSWikU4hijzyg1XzmuiKWBl1phCJS3lWy/
	 oxQyKG+Br/dYMmzJe7d66CDMTiaxJ1qWpdvvZthNvc0s1AvcRkF6ITJY2a8I43FlQt
	 hhJ4Oyy1VAYSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/3] hwmon: ltc4283: Add support for the LTC4283
 Swap Controller
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6EgdmlhIEI0IFJlbGF5?= <devnull+nuno.sa.analog.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260429-ltc4283-support-v11-2-27ccde619dad@analog.com>
References: <20260429-ltc4283-support-v11-2-27ccde619dad@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2026 20:07:21 +0000
Message-Id: <20260429200722.1EDD2C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Use-After-Free due to lingering debugfs files after driver unbind =
or probe failure
- [High] Race condition causing lost hardware alarms via Read-Modify-Write =
(RMW) on status registers
- [High] NULL pointer dereference in the auxiliary GPIO driver due to missi=
ng platform data
- [Low] Missing documentation for the `in0_reset_history` sysfs attribute
--

commit fe2f05d89e51b9f3d68748be92daeb1de9889838
Author: Nuno S=C3=A1 <nuno.sa@analog.com>
hwmon: ltc4283: Add support for the LTC4283 Swap Controller

This commit adds support for the LTC4283 Hot Swap Controller, providing
programmable current limit, SOA timer, and I2C/ADC monitoring capabilities.

> diff --git a/Documentation/hwmon/ltc4283.rst b/Documentation/hwmon/ltc428=
3.rst
> --- /dev/null
> +++ b/Documentation/hwmon/ltc4283.rst
> @@ -39,6 +39,10 @@
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  in0_lcrit_alarm         Critical Undervoltage alarm
>  in0_crit_alarm          Critical Overvoltage alarm
>  in0_label		Channel label (VIN)
> =20
>  in1_input		Output voltage (mV).

This isn't a bug, but should in0_reset_history be documented here? The
channel info array exposes HWMON_I_RESET_HISTORY for channel 0, and the
driver implements it, but it appears to be missing from the documentation.

> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> --- /dev/null
> +++ b/drivers/hwmon/ltc4283.c

[ ... ]

> +static int ltc4283_read_alarm(struct ltc4283_hwmon *st, u32 reg,
> +			      u32 mask, long *val)
> +{
> +	u32 alarm;
> +	int ret;
> +
> +	ret =3D regmap_read(st->map, reg, &alarm);
> +	if (ret)
> +		return ret;
> +
> +	*val =3D !!(alarm & mask);
> +
> +	/* If not status/fault logs, clear the alarm after reading it. */
> +	if (reg !=3D LTC4283_FAULT_STATUS && reg !=3D LTC4283_FAULT_LOG)
> +		return regmap_write(st->map, reg, alarm & ~mask);
> +
> +	return 0;
> +}

Can this sequence cause other alarms to be lost if they are asserted by the
hardware between the read and the write?=20

Writing back the modified alarm value could inadvertently clear new alarms
that were just set. Would it be safer to write a constant mask directly
without a read-modify-write cycle?

[ ... ]

> +static int ltc4283_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev, *hwmon;
> +	struct auxiliary_device *adev;
> +	struct ltc4283_hwmon *st;
> +	int ret, id;
> +
> +	st =3D devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return -ENOMEM;

[ ... ]

> +	ltc4283_debugfs_init(st, client);

Could this lead to a Use-After-Free if the driver is manually unbound?=20

The private data st is allocated with devm_kzalloc, so it is freed when the
driver unbinds. However, ltc4283_debugfs_init attaches debugfs files to
the I2C client's debugfs directory, which persists until the device itself
is removed.

If a user space read occurs on those files after the driver unbinds, could
it dereference the freed pointer?

> +
> +	if (!st->gpio_mask)
> +		return 0;
> +
> +	id =3D (client->adapter->nr << 10) | client->addr;
> +	adev =3D __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
> +					      NULL, id);

Will this cause a NULL pointer dereference in the auxiliary GPIO driver?=20

The auxiliary device is created with NULL passed for the platform data.
If the GPIO driver expects valid platform data to initialize its valid mask
via dev_get_platdata, passing NULL here could result in a crash during
bitmap copying.

> +	if (!adev)
> +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260429-ltc4283-su=
pport-v11-0-27ccde619dad@analog.com?part=3D2
