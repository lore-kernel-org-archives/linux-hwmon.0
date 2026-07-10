Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745BE41C2E4
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 11:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683230; cv=none; b=V17mk3ftAWp427AiLNZd2p6Ow9tXrXq6tTho4GDNneAG4ZqpoiWZKMy9sVp7GiGGSf8hfieRS6zNHZINs+Co7mLj+ANfa0AEN3w/IOtIRYd2j6VmvKmbve3c2jKSY3UHsze4SjrSxKg+WZCA7KGkrZ3EXUp/9nRpvVzsZp4Hmjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683230; c=relaxed/simple;
	bh=dEhBYMfVIq5AG3q1Xwlc9KvM0rQxVMtvLGVmkZnL1Cc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=beEC23Wm3RNkcArK7Yzedf6gmP/rqy+VRBUwqLgVuZYHra/EAfWv4/bAqGxfeb2unIWVsSILbWZ1Bb2VA2jvZIubwcHC36cBZUWuAcDXbQQ9XE/HJHUu5yUmB7V6g3Us11nZk6M6ik1wQyjBpQJYBmeH9uHL625Z5aSuZhkxeWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fY970SDC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fY970SDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78B11F000E9;
	Fri, 10 Jul 2026 11:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783683218;
	bh=/Iy3rt0g90U93XvEW1D1qp56Ztiu6W7PBOZCnVGEsik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fY970SDCGXQghgq5IBsKGVEZ0yz+0YZN6UEf38w/LLcJCqifG8e6ENLA/LAUfGGL1
	 cvSBZbPb8shO/KwJHRZ3WSTlWC/NtIo1RXqBPjUDCkrTnzO/dSvz9I9tE3tNQovALE
	 kSun8+wQopqJk3NixagRlYOH3cV9uBok978TLe2NEkIMONxCRSuCEITsLDgRiRcI40
	 xR2lktD8cENfeJ8cDQehN4IFp0KutxWN75n7apgLzkJSPURqQVzEahTJwtFXBWXg0a
	 OjfEBJJDeyNjBYUOlLqfgTb5KIcn7Jx5ViD+OHQO4aP2FRrLehNKWtYp3D7oUbfQ9Q
	 mGdkvKBfOGkjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: emc2305: Add missing device tree compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Robinson" <pbrobinson@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260710112110.466240-1-pbrobinson@gmail.com>
References: <20260710112110.466240-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:33:37 +0000
Message-Id: <20260710113337.E78B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to use `hwmon_lock()` to protect shared state and=
 hardware registers during thermal cooling device operations, violating hwm=
on subsystem concurrency rules.
- [High] A division by zero vulnerability exists when reading the fan tacho=
meter input if the hardware returns a small non-zero value between 1 and 7.
- [High] When thermal management is enabled, user inputs for PWM sysfs attr=
ibutes bypass bounds checking, leading to massive integer underflow and unp=
redictable PWM duty cycles.
- [High] Device tree parsing hardcodes `pwm_separate =3D false` when multip=
le PWM children exist, breaking independent cooling zones.
--

--- Patch [1]: [PATCH] hwmon: emc2305: Add missing device tree compatibles =
---
commit f16b37d8579458e0cc2f0b0ac6e79ec7dd8c69ac
Author: Peter Robinson <pbrobinson@gmail.com>

hwmon: emc2305: Add missing device tree compatibles

Add the missing device tree compatibles for all the variants
so they can be specified. There's at least the use of emc2301
already.

> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index eef3b021671b0..38034d7a30901 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -762,6 +762,9 @@ static void emc2305_shutdown(struct i2c_client *clien=
t)
>  }
> =20
>  static const struct of_device_id of_emc2305_match_table[] =3D {
> +	{ .compatible =3D "microchip,emc2301", },
> +	{ .compatible =3D "microchip,emc2302", },
> +	{ .compatible =3D "microchip,emc2303", },
>  	{ .compatible =3D "microchip,emc2305", },
>  	{},
>  };

[Severity: High]
This isn't a bug introduced by this patch, but could the lack of locking he=
re
cause race conditions?

The hwmon subsystem core serializes sysfs operations using its internal loc=
k,
which protects emc2305_write(). However, the thermal subsystem callback can
execute concurrently:

drivers/hwmon/emc2305.c:emc2305_set_cur_state() {
	/* Save thermal state. */
	data->cdev_data[cdev_idx].last_thermal_state =3D state;
	ret =3D __emc2305_set_cur_state(data, cdev_idx, state);
	if (ret < 0)
		return ret;
}

Should emc2305_set_cur_state() use hwmon_lock() and hwmon_unlock() to preve=
nt
corrupting logical fan states and interleaving I2C transactions with
emc2305_write()?

[Severity: High]
This is a pre-existing issue, but is it possible for this code to trigger a
division by zero?

If the hardware returns a small non-zero value between 1 and 7, the shift
operation evaluates to 0:

drivers/hwmon/emc2305.c:emc2305_show_fan() {
...
	ret =3D i2c_smbus_read_word_swapped(client, EMC2305_REG_FAN_TACH(channel));
	if (ret <=3D 0)
		return ret;

	ret =3D ret >> EMC2305_TACH_REGS_UNUSE_BITS;
	ret =3D EMC2305_RPM_FACTOR / ret;
...
}

Might we need an additional check to ensure ret is not zero after the shift
before performing the division?

[Severity: High]
This isn't a bug introduced by this patch, but does emc2305_write() lack
bounds checking for val when thermal management is active?

When a user writes to the PWM sysfs attribute, the input val is used direct=
ly
in EMC2305_PWM_DUTY2STATE:

drivers/hwmon/emc2305.c:emc2305_write() {
...
			if (IS_REACHABLE(CONFIG_THERMAL)) {
...
				data->cdev_data[cdev_idx].last_hwmon_state =3D
					EMC2305_PWM_DUTY2STATE(val, data->max_state,
							       EMC2305_FAN_MAX);
...
}

If val is negative, could the macro EMC2305_PWM_DUTY2STATE evaluate to a
negative integer that underflows the unsigned long field last_hwmon_state?

This appears to bypass the validation naturally present in emc2305_set_pwm(=
).

[Severity: High]
This is a pre-existing issue, but does device tree parsing correctly support
independent cooling zones?

When pwm_childs is greater than 0, the driver hardcodes pwm_separate to fal=
se:

drivers/hwmon/emc2305.c:emc2305_probe() {
...
	pwm_childs =3D emc2305_probe_childs_from_dt(dev);
...
	if (!pwm_childs) {
...
	} else {
		data->max_state =3D EMC2305_FAN_MAX_STATE;
		data->pwm_separate =3D false;
...
	}
...
}

Because pwm_separate is forced to false, it looks like emc2305_get_cdev_idx=
()
bypasses channel indexing:

drivers/hwmon/emc2305.c:emc2305_get_cdev_idx() {
...
	if (!data->pwm_separate)
		return 0;
...
}

Will independent cooling devices mapped to separate fans incorrectly write
their thermal states to channel 0 and broadcast their PWM values to all fan=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710112110.4662=
40-1-pbrobinson@gmail.com?part=3D1
