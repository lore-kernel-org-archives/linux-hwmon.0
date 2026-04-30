Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA69927EFE9
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 10:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543423; cv=none; b=CxeGXGr7J/cvZHHoSH/0N9d2qkpkixtdheYKJI5ObQ4hgBK25mYVxqgrNFKjqELBNb9m3oOVyPxXLPOG387nbWN9+6ys5wO9qlbSA7GzWcgHNBOdmYU5nwz1pSAGHj2fvsQR+O5UKxEmu5LHWQ78ATm2Bn1NLkRGhFeuPo4Cd80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543423; c=relaxed/simple;
	bh=ngAA55b4mi+jLZ0nu9ksP+eB/DRp55ue+FmaSQMGoyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JAERctEcCT4vFWh41/Mr/a1KmCHnchjoLS7BznDIljmJmAtjZ9gWJM9k+4K2RofrtjbbcCHMlwTOxUHzZb5qzKbehfBOIh6U1ANCEggbpR+DFdrrbrJ+40adDfyw3M4fItI8lKEz+7e5tTCrC67+tC8ubgfQU9ZYi0OUhR1YXeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTvwSLt3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTvwSLt3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D31C2BCB3;
	Thu, 30 Apr 2026 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777543423;
	bh=ngAA55b4mi+jLZ0nu9ksP+eB/DRp55ue+FmaSQMGoyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uTvwSLt3s1RoZN/TwKXDY73DMJBizavFozU8Gkg8ABNpb/T5XBm9XmWZw1ra0gb7j
	 MyyTmUvXN6XTHATjFnuja+z7IN5D3uIZGLiFT2Duehi8rzowVgZuBR8oBHDdO1+75X
	 mrT3C92uOVP8ei2Ia+peG5Rq+mZKJoFkK8I94x17wiinICkvzwpGUseZsmXtnFeT7E
	 NZSJo3lNGP7hpZpcNCCobVioul9qdET/S3Z8DYVjU931gUFg7xvj3s33A4mXNQAsRo
	 7QgRyk4p0kOYFqNRgXJl1F86H7uI6NDRLGFBgflrldYdBpinbAYvzuln/00xJyHSGd
	 qNAZL0StMlPJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/3] hwmon: ltc4283: Add support for the LTC4283
 Swap Controller
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6EgdmlhIEI0IFJlbGF5?= <devnull+nuno.sa.analog.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260430-ltc4283-support-v12-2-5dc9901f2567@analog.com>
References: <20260430-ltc4283-support-v12-2-5dc9901f2567@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2026 10:03:42 +0000
Message-Id: <20260430100343.45D31C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Debugfs entries are leaked and will trigger a Use-After-Free if `_=
_devm_auxiliary_device_create` fails during probe.
- [Medium] Read-modify-write (RMW) operations on hardware fault/alarm log r=
egisters can accidentally clear and permanently lose concurrent hardware ev=
ents.
- [Low] The debugfs attributes for FET faults are registered with incorrect=
 names (`in0_...` instead of `in11_...`).
- [Low] Invalid string values in device tree properties are silently ignore=
d despite comments indicating they should be caught.
--

commit d9fab3c87e5bd2f43c5dc67392ad85d9104dbf0b
Author: Nuno S=C3=A1 <nuno.sa@analog.com>
Subject: hwmon: ltc4283: Add support for the LTC4283 Swap Controller

This commit adds support for the Analog Devices LTC4283 Hot Swap Controller.
It provides monitoring of board current, voltage, power, energy, and fault
status via an I2C interface.

> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> new file mode 100644
> index 0000000000000..d66815bfb1341
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

Could this read-modify-write operation accidentally clear concurrent hardwa=
re
events? If a new hardware event asserts immediately between the read and the
write, the mask inversion might write 0 to that newly asserted bit, causing
the event to be cleared before the software ever processes it.

[ ... ]

> +static void ltc4283_debugfs_init(struct ltc4283_hwmon *st, struct i2c_cl=
ient *i2c)
> +{
> +	debugfs_create_file_unsafe("in0_crit_fault_log", 0400, i2c->debugfs, st,
> +				   &ltc4283_in0_crit_fault_log);
> +	debugfs_create_file_unsafe("in0_lcrit_fault_log", 0400, i2c->debugfs, s=
t,
> +				   &ltc4283_in0_lcrit_fault_log);
> +	debugfs_create_file_unsafe("in0_fet_bad_fault_log", 0400, i2c->debugfs,=
 st,
> +				   &ltc4283_fet_bad_fault_log);
> +	debugfs_create_file_unsafe("in0_fet_short_fault_log", 0400, i2c->debugf=
s, st,
> +				   &ltc4283_fet_short_fault_log);

Should these debugfs attributes for the FET faults be named starting with
in11_ instead of in0_? The MOSFET DRAIN channel is in11, and the
documentation in ltc4283.rst lists these attributes as
in11_fet_short_fault_log and in11_fet_bad_fault_log.

[ ... ]

> +static int ltc4283_setup(struct ltc4283_hwmon *st, struct device *dev)
> +{
[ ... ]
> +	ret =3D device_property_match_property_string(dev, "adi,overcurrent-ret=
ries",
> +						    ltc4283_oc_fet_retry,
> +						    ARRAY_SIZE(ltc4283_oc_fet_retry));
> +	/* We still want to catch when an invalid string is given. */
> +	if (ret < 0 && ret !=3D -EINVAL)
> +		return dev_err_probe(dev, ret,
> +				     "adi,overcurrent-retries invalid value\n");

Does this condition silently ignore invalid string values?
device_property_match_property_string() returns -EINVAL both when a
property is missing and when the string does not match any entry in the
provided array.

[ ... ]

> +static int ltc4283_probe(struct i2c_client *client)
> +{
[ ... ]
> +	hwmon =3D devm_hwmon_device_register_with_info(dev, "ltc4283", st,
> +						     &ltc4283_chip_info, NULL);
> +
> +	if (IS_ERR(hwmon))
> +		return PTR_ERR(hwmon);
> +
> +	ltc4283_debugfs_init(st, client);
> +
> +	if (!st->gpio_mask)
> +		return 0;
> +
> +	id =3D (client->adapter->nr << 10) | client->addr;
> +	adev =3D __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
> +					      &st->gpio_mask, id);
> +	if (!adev)
> +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");

Can this error path lead to a use-after-free?

According to the I2C subsystem rules, debugfs entries attached to the
client debugfs directory are only cleaned up during the client device
removal function on driver unbind.

If __devm_auxiliary_device_create() fails, the probe function aborts and
the devres subsystem frees the st pointer. However, the debugfs files
persist and retain operations that operate on the freed st pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260430-ltc4283-su=
pport-v12-0-5dc9901f2567@analog.com?part=3D2
