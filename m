Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A95025B09E
	for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 18:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779387896; cv=none; b=ifsIGp0L7IqdqpjB8IyU7rriMyjy4UasK32/oFRUKOcy1KXDBCHJjwwT+83edt82SRG03bCLHakejdc3H/tOi5U25DGRf2otO62UWyFMdwIwPbvEzDoaZAB6S+uT9bJq9ep7cfeyLi6j1qIQzUz5913IoBMmJMEmh67Dg5BJI7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779387896; c=relaxed/simple;
	bh=a51v+GosOXPCjDg1nKdIEWA1oMlikCWmnqVupTKhdB8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GQ/DGYUV2xafhcMZv51OgnOjVDhlqJKx9+rVr1LWisLW3ygEpXNwkuKHOmzXm1jk7CdgfjCqzKgo9mPMrbpvVw0Ys1Ugq7dsnKbjckAXk6xT1nYvmsMD1VtU35/Wn0djHREsD1J2zb4v7MVAngTdQU1/feOaIOqC/X7G/yE51oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJnzIG66; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJnzIG66"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8001F000E9;
	Thu, 21 May 2026 18:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779387894;
	bh=+GIPSrmebzyuGUUrcfliE3GfFhwS94SlZcq+/1GTxXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EJnzIG66akFhJoJjaNfvcmlmiKd3m11YreXQJZ97Klhy86IT4hSatSWQgrGXUG10n
	 digNLxSPcqJZZJDwvebtB+uNDUIML2gKOiVHbJn/co8KLITiCMx4D/tJQqsW/gO4Hq
	 oIQ+PE8v8BN0IYOvQ9X5dr4jeAZv6DgKLV/oCSPDKrD8hTQBgcyCYXakZIgjhphP11
	 HV+VO4CduAM1lUYjN8zweF/MFRUiPyBn7Am7kw0oH2xl+YgzUHg07SpWXPcYPECpdO
	 oVADcpr6QzZ+3XQWqNV7hNt66HaYnksvTObAdsMilLCK0CUqjsQWpBsdJk60mb0t7T
	 BWCMMhbbT6C3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (emc2305) update of_emc2305_match_table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260521180334.19706-1-grandmaster@al2klimov.de>
References: <20260521180334.19706-1-grandmaster@al2klimov.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 18:24:53 +0000
Message-Id: <20260521182454.8B8001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Division by zero when hardware tachometer returns small values in =
emc2305_show_fan().
- [High] Out-of-bounds memory write due to unvalidated Device Tree 'reg' pr=
operty in emc2305_of_parse_pwm_child().
- [High] Incorrect cooling device index mapping causes thermal zone overwri=
tes and potential out-of-bounds array accesses.
- [High] Missing locking between thermal subsystem callbacks and hwmon sysf=
s accesses.
--

commit 2bd774075252c014c572b16649c4114624d8a6fd
Author: Alexander A. Klimov <grandmaster@al2klimov.de>

hwmon: (emc2305) update of_emc2305_match_table
   =20
Latter was added with only emc2305, in contrast to emc2305_ids
which also listed emc2301, emc2302 and emc2303.
So these three devices couldn't be probed based on device tree contents
until now. I fixed this.

> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index 64b213e1451e7..4c99018d0575b 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -716,6 +716,9 @@ static int emc2305_probe(struct i2c_client *client)
> =20
>  static const struct of_device_id of_emc2305_match_table[] =3D {
>  	{ .compatible =3D "microchip,emc2305", },
> +	{ .compatible =3D "microchip,emc2303", },
> +	{ .compatible =3D "microchip,emc2302", },
> +	{ .compatible =3D "microchip,emc2301", },

[Severity: High]
This is a pre-existing issue, but by enabling DT probing for these variants,
this might be exposed further. In emc2305_show_fan(), is it possible for a
division by zero to occur if the hardware returns a tachometer value between
1 and 7?

drivers/hwmon/emc2305.c:emc2305_show_fan() {
    ...
	ret =3D i2c_smbus_read_word_swapped(client, EMC2305_REG_FAN_TACH(channel));
	if (ret <=3D 0)
		return ret;

	ret =3D ret >> EMC2305_TACH_REGS_UNUSE_BITS;
	ret =3D EMC2305_RPM_FACTOR / ret;
    ...
}

If the shifted value is 0, this will cause a kernel panic.


[Severity: High]
This is a pre-existing issue, but does this code write out of bounds if the
DT "reg" property is 5 or greater?

drivers/hwmon/emc2305.c:emc2305_of_parse_pwm_child() {
    ...
	ret =3D of_property_read_u32(child, "reg", &ch);
	if (ret) {
		dev_err(dev, "missing reg property of %pOFn\n", child);
		return ret;
	}

	ret =3D of_parse_phandle_with_args(child, "pwms", "#pwm-cells", 0, &args);

	if (ret)
		return ret;

	if (args.args_count > 0) {
		data->pwm_freq[ch] =3D find_closest(args.args[0], base_freq_table,
						  ARRAY_SIZE(base_freq_table));
    ...
}

Because fixed-size arrays like data->pwm_freq are sized EMC2305_PWM_MAX (5),
providing a device tree node with a reg value of 5 or greater seems to write
out of bounds. Also, ch might be used as a bit-shift offset without
validation.


[Severity: High]
This is a pre-existing issue, but could this iteration logic lead to an
out-of-bounds access and thermal zone overwrites?

drivers/hwmon/emc2305.c:emc2305_probe() {
    ...
	if (IS_REACHABLE(CONFIG_THERMAL)) {
		/* Parse and check for the available PWM child nodes */
		if (pwm_childs > 0) {
			i =3D 0;
			for_each_child_of_node_scoped(dev->of_node, child) {
				ret =3D emc2305_set_single_tz(dev, child, i);
    ...
}

There appears to be no limit on the number of children iterated, meaning if
there are more than 5 children, it will lead to an out-of-bounds access.

Additionally, looking at emc2305_set_single_tz():

drivers/hwmon/emc2305.c:emc2305_set_single_tz() {
    ...
	cdev_idx =3D (idx) ? idx - 1 : 0;
	pwm =3D data->pwm_min[cdev_idx];
    ...
}

Doesn't this map both idx =3D 0 and idx =3D 1 to cdev_idx =3D 0? This looks=
 like
the second cooling device will silently overwrite the first child's
configuration.


[Severity: High]
This is a pre-existing issue, but is there missing locking between thermal
subsystem callbacks and hwmon sysfs accesses?

The hwmon sysfs write callback (emc2305_write()) and the thermal state
update callback (emc2305_set_cur_state()) can execute concurrently without
any synchronization:

drivers/hwmon/emc2305.c:emc2305_write() {
    ...
				if (data->cdev_data[cdev_idx].last_hwmon_state >=3D
				    data->cdev_data[cdev_idx].last_thermal_state)
					return __emc2305_set_cur_state(data, cdev_idx,
							data->cdev_data[cdev_idx].last_hwmon_state);
    ...
}

drivers/hwmon/emc2305.c:emc2305_set_cur_state() {
    ...
	/* Save thermal state. */
	data->cdev_data[cdev_idx].last_thermal_state =3D state;
	ret =3D __emc2305_set_cur_state(data, cdev_idx, state);
    ...
}

Since cooling devices are registered independently via
devm_thermal_of_cooling_device_register(), do these operations need
synchronization (e.g. hwmon_lock()) to prevent data races and incorrect
state transitions?

> 	{},
>  };
>  MODULE_DEVICE_TABLE(of, of_emc2305_match_table);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521180334.1970=
6-1-grandmaster@al2klimov.de?part=3D1
