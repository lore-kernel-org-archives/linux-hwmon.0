Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B8E46C4D9;
	Tue, 21 Jul 2026 19:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661649; cv=none; b=ipbomZ/hi4lLfmxS0pit3O7503NhbonL4TPrHsTwUbYAqgdqis8G4DiIEGsFjKANd3ONEG5GjH6CM8qWVZ5I7NtlhJH+kjbV+X2zGaR4orEw9UVpvJgz3o6GGpgRoAyjUQj8FVYvEhOUrHcQbkRdXcdYbVVjAUAyh8ezPLcYO6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661649; c=relaxed/simple;
	bh=JSKd0cubOpOjGFX/sfPOicNmfAArOyDw8/F7hv38vRA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pENjFj4/wUP2jzOMYpvfbqA5ZhdmB/oT5TCo8vStl2+2eMDdvikSBBj9fWjIDsx67jG2tThtmk7hR5rs7SkX8Aaj8eWjbW1Kq8ohsczO4qvlfUv/2/NaqERjdHGi2kiCPOkiyxr8csVq+SNAI/W4064GUuOBe9TnXjVKMWdyx8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+NSSIRy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+NSSIRy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76EA01F00A3D;
	Tue, 21 Jul 2026 19:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784661647;
	bh=T0IZn4vCkeOQBaSYJmPgaIxJ37aEWKzPvnTwNBrMX6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j+NSSIRyeVWM1sKTwpRI7TrddiF9pJs273cYx5e0N/bZ0uxaIWvsMzzkfJLdD+Ew6
	 sgjcj3YNCFJF7GkL/g1/XpJ/HVVttBHeMomVVQqhzNsHFiz1zf+UH8SrQrJsLU7yvT
	 BkiviOIK3FheT7xS1Gbg+xZxwHm05OhoPSnDGUOOVQ6B8n2cOIwnld8YU3L0Sma7td
	 Dlqs9/gByqRmVLE2+MOysMPg/io40gNUGK1/TZ0UcPx0yMroayZSmWlE+BZucgBUiN
	 TX1I7EGdvDWvPkqd8b7BClQ+Ad08Xp6JkHzBlaq+G9zgzi11hImccA3NJ8JkTqUPVu
	 BIsgqDpuORksA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 19:20:47 +0000
Message-Id: <20260721192047.76EA01F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Uninitialized cache timestamps cause the driver to erroneously ret=
urn cached 0 readings instead of hardware values for the first 5 minutes of=
 system uptime.
- [High] Writing the maximum valid threshold value to certain sysfs attribu=
tes causes integer truncation when written to the hardware register, silent=
ly applying a dangerously low or zero limit.
- [Medium] Devres teardown ordering race allows the delayed polling work to=
 re-enable `irq_wake` after it was disabled, causing an unbalanced wake cou=
nt and triggering a kernel warning on driver unbind.
- [Medium] pmh0101_data is missing `.data_field_bits_size`, preventing volt=
age input readings from being exposed.
- [Low] Using `DIV_ROUND_CLOSEST` with a 64-bit signed dividend causes a li=
nk error on 32-bit architectures.
--

--- Patch [2]: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver ---
commit d1c02d33d76b0d05ddfd0d17bd163dd47036945c
Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: hwmon: Add Qualcomm PMIC BCL driver

This commit adds a new driver for Qualcomm SPMI PMIC Battery Current Limiti=
ng
(BCL). It exposes battery voltage and current monitoring through the hwmon
interface, including threshold-based alarms and interrupt notifications.

> diff --git a/drivers/hwmon/qcom-bcl-hwmon.c b/drivers/hwmon/qcom-bcl-hwmo=
n.c
> new file mode 100644
> index 0000000000000..a21433b45482c
> --- /dev/null
> +++ b/drivers/hwmon/qcom-bcl-hwmon.c

[ ... ]

> +static const struct bcl_desc pmh0101_data =3D {
> +	.reg_fields =3D bcl_pmh0101_reg_fields,
> +	.num_reg_fields =3D F_CURR_MON_EN + 1,
> +	.thresh_field_bits_size =3D 8,
> +	.battery_config_field =3D REG_FIELD(0, 0, 0),
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_IN] =3D {

[Severity: Medium]
Is the pmh0101_data descriptor missing a .data_field_bits_size initializati=
on?

This descriptor defines F_IN_INPUT and F_IN_INPUT1 for 16-bit reads but
omits .data_field_bits_size. Since it zero-initializes to 0,
bcl_build_hwmon_info() will treat the input reading feature as disabled and
skip initializing the sensor, hiding the hardware functionality.

[ ... ]

> +static int bcl_convert_raw_to_milliunit(const struct bcl_device *bcl,
> +					s32 raw_val,
> +					enum bcl_channel type,
> +					u8 field_width)
> +{
> +	const struct bcl_desc *desc =3D bcl->desc;
> +	u32 def_scale =3D desc->channel_cfg[bcl->batt_config][type].default_sca=
le_nu;
> +	u32 scaling_factor =3D (field_width > 8) ? def_scale : (def_scale << fi=
eld_width);
> +
> +	return DIV_ROUND_CLOSEST((s64)raw_val * scaling_factor, 1000000);
> +}

[Severity: Low]
Will this cause a build failure on 32-bit architectures?

Using DIV_ROUND_CLOSEST with a 64-bit signed dividend utilizes the standard
division operator, which translates to a 64-bit signed division instruction.
Since the kernel does not implement __divdi3 for 32-bit architectures,
should div_s64() be used instead to prevent link errors?

[ ... ]

> +static int bcl_curr_thresh_write(struct bcl_device *bcl, long value, enu=
m bcl_limit_alarm lvl)
> +{
> +	const struct bcl_desc *desc =3D bcl->desc;
> +	u32 raw_val;
> +
> +	int thresh =3D clamp_val(value, 0, desc->channel_cfg[bcl->batt_config][=
CHANNEL_CURR].max);
> +
> +	if (desc->channel_cfg[bcl->batt_config][CHANNEL_CURR].thresh_type[lvl] =
=3D=3D THRESH_TYPE_ADC)
> +		raw_val =3D bcl_convert_milliunit_to_raw(bcl, thresh, CHANNEL_CURR,
> +						       desc->thresh_field_bits_size);
> +	else
> +		raw_val =3D bcl_convert_milliunit_to_index(bcl, thresh, CHANNEL_CURR);
> +
> +	return regmap_field_write(bcl->fields[F_CURR_H0_THR + lvl], raw_val);
> +}

[Severity: High]
Can writing the maximum valid threshold value to the sysfs attributes cause
integer truncation when written to the hardware register?

For the pm7250b_data variant, the maximum threshold is set to 10000, which
translates to a raw value of 256. When regmap_field_write() writes this to
an 8-bit field, it gets masked to 0, silently applying a 0 mA threshold
instead of the maximum.

Similarly for smb2360_data, the max voltage is 8400, which translates to
index 78. This masks to 14 in a 6-bit field, setting a 5200mV threshold.
Could the driver verify the value fits in the destination regmap field
before writing?

[ ... ]

> +static int bcl_curr_input_read(struct bcl_device *bcl, long *out)
> +{
> +	int ret;
> +	u32 raw_val =3D 0, msb =3D 0;
> +	s32 signed_val;
> +	const struct bcl_desc *desc =3D bcl->desc;
> +
> +	/* Return cached value if read too soon after last update */
> +	if (time_before(jiffies, bcl->last_curr_updated + HZ)) {
> +		*out =3D bcl->last_curr_input;
> +		return 0;
> +	}

[Severity: High]
Will this erroneously return cached 0 readings for the first 5 minutes of
system uptime?

The last_curr_updated timestamp is zero-initialized by devm_kzalloc(). The
kernel initializes jiffies to INITIAL_JIFFIES (typically 5 minutes before
wrap-around, e.g., -300 * HZ). Due to unsigned wrap-around comparison
semantics, time_before(jiffies, bcl->last_curr_updated + HZ) will evaluate
to true until jiffies reaches HZ.

This causes the driver to bypass hardware reads entirely and return the
uninitialized 0 value across all channels.

[ ... ]

> +static int bcl_alarm_irq_init(struct platform_device *pdev,
> +			      struct bcl_device *bcl)
> +{

[ ... ]

> +		ret =3D devm_request_threaded_irq(&pdev->dev, irq_num, NULL,
> +						bcl_handle_alarm, IRQF_ONESHOT,
> +						bcl_int_names[i], alarm);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D devm_add_action_or_reset(&pdev->dev, bcl_alarm_work_cleanup_ac=
tion,
> +					       alarm);
> +		if (ret)
> +			return ret;
> +
> +		if (!enable_irq_wake(irq_num))
> +			alarm->irq_wake_enabled =3D true;
> +
> +		ret =3D devm_add_action_or_reset(&pdev->dev, bcl_alarm_wake_cleanup_ac=
tion,
> +					       alarm);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Does this devres teardown ordering allow the delayed polling work to
re-enable irq_wake after it was already disabled?

Since bcl_alarm_work_cleanup_action is registered before
bcl_alarm_wake_cleanup_action, the LIFO teardown executes the wake cleanup
first, disabling irq_wake.

Concurrently, the uncancelled alarm_poll_work can race to execute
bcl_alarm_enable_poll() and re-enable irq_wake before the work cleanup
action runs to cancel the work queue. Could this cause an unbalanced wake
count and trigger a kernel warning on driver unbind?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-qcom-bcl-h=
wmon-v2-0-febe2805e17b@oss.qualcomm.com?part=3D2
