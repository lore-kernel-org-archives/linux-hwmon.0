Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EF6219E8;
	Tue, 29 Sep 2026 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688109; cv=none; b=VVHOgbUj/pcnybtl+ekyIP5cnpu0FzvYyrrDW6XX9al1qFfRFcM/8vrsVj379aDm6k7932UsPqWNr3IDA/MTiDXZOljNFKOYbuZd2OGHFv1zBpqGQpW70AoA/ksP5ne/EIX5DAZ5kneXHiUt75Q2Py/XulNGWZWVoJyGKidxWSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688109; c=relaxed/simple;
	bh=ZwLaJ6FxiAeCXlHXiyBZjBskr+r05pBUI1STm9vldtk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XQaHZ24MtD7HgaXF8HjpOhdDeGA9OM8riNUSl6dM2CI7vFf96akgsYL4JYUXMtKKzUVoOQHYjqTiVOdLZYV2vSI0kAmIdbpb64/9i/laPm0jjpu9n2PTAPPzBKsvRSMhxZZ2s42cTu8AS8D9MVJezgv31DiM9Uwz8e/gPLDvsYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YB84tsTL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YB84tsTL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7C41F000FF;
	Tue, 29 Sep 2026 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790688107;
	bh=TWrlk0hhwwsnguOOwkiv85WIOQWDQuU8oce9apmRiNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YB84tsTLMyQm0uSViFc/lzk+I/iDQ1itOR5OxbKt3wGeD5QA7etSotcYBAlv12eIR
	 Qmg0U2EG9k4yNVZLQHmnZlOOA1ZdCAP+X6jFvK54dC6dSujy1OPKGgws0DSmnb6ofU
	 HYJ9AKSxoXdgsCwdARhYT4Kt/hudR9aIEbV1r7cqlSi7zrzem/CMCv7OqoYrQigSjS
	 IAeMM1gtY24NfsOAh7GH9eKC95xHMqOWV5ROy8tb9Y4hGr2wTGf9EffV/aMXD9BvqE
	 rltghSWBqltGGiTJ1i+tGEjK95OKIpUzTb7rioyQqvdaqKzOiUcSxOemKULBuO/NLl
	 ckbcWZkNoG/3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/12] hwmon: Add Qualcomm PMIC BCL driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-2-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-2-f5ca00889cf7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:21:46 +0000
Message-Id: <20260929132147.2D7C41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] hwmon: use-after-free in delayed work due to missing cleanup on pr=
obe error
- [Medium] hwmon: potential torn read of 16-bit volatile ADC values
- [Low] hwmon: incorrect rounding of negative ADC current readings
--

commit 582b6b399b20e883c83628558dc27f1dcb1c1d4d
Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: hwmon: Add Qualcomm PMIC BCL driver

Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
hardware monitor. The driver exposes battery voltage and current
monitoring through hwmon interface.

> diff --git a/drivers/hwmon/qcom-bcl-hwmon.c b/drivers/hwmon/qcom-bcl-hwmo=
n.c
> new file mode 100644
> index 0000000000000..eb6bfa7ff18f5
> --- /dev/null
> +++ b/drivers/hwmon/qcom-bcl-hwmon.c
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
> +	return div_s64((s64)raw_val * scaling_factor + 500000, 1000000);

[Severity: Low]
Does this math correctly handle negative current values?

When the hardware provides a negative ADC value for current (e.g., during
battery discharging), it is sign-extended in bcl_curr_input_read() and
passed here. The arithmetic unconditionally adds 500000 before performing
integer division (div_s64). For negative dividends, adding a positive offset
shifts the value towards positive infinity, and C integer division truncates
towards zero, causing the hwmon statistics to be off by 1 unit.

Could this conditionally subtract 500000 for negative dividends to ensure
mathematically symmetric rounding?

[ ... ]
> +static int bcl_curr_input_read(struct bcl_device *bcl, long *out)
> +{
> +	int ret;
> +	u32 raw_val =3D 0, msb =3D 0;
> +	s32 signed_val;
> +	const struct bcl_desc *desc =3D bcl->desc;
> +
> +	/* Return cached value if read too soon after last update */
> +	if (bcl->last_curr_updated &&
> +	    time_before(jiffies, bcl->last_curr_updated + HZ)) {
> +		*out =3D bcl->last_curr_input;
> +		return 0;
> +	}
> +
> +	ret =3D regmap_field_read(bcl->fields[F_CURR_INPUT], &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	/* For 16-bit data, read MSB and combine with LSB */
> +	if (desc->data_field_bits_size =3D=3D 16) {
> +		ret =3D regmap_field_read(bcl->fields[F_CURR_INPUT1], &msb);

[Severity: Medium]
Is there a risk of a torn read when fetching this 16-bit volatile ADC value?

These sequential reads can capture hardware registers in an inconsistent
state if the PMIC hardware updates the ADC registers exactly between the two
independent bus transactions. Since the mutex lock only serializes software
threads, a hardware update right between these calls would result in readin=
g a
mix of old and new bytes (e.g., an LSB of 0xFF and an MSB of 0x01).

Should this use an atomic regmap_bulk_read() for 16-bit data fields to
prevent wildly incorrect sensor readings?

> +		if (ret)
> +			return ret;
> +		raw_val |=3D FIELD_PREP(GENMASK(15, 8), msb);
> +	}
[ ... ]
> +static int bcl_alarm_irq_init(struct platform_device *pdev,
> +			      struct bcl_device *bcl)
> +{
> +	int ret, irq_num, i;
> +	struct bcl_alarm_data *alarm;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(bcl->bcl_alarms); i++) {
> +		alarm =3D &bcl->bcl_alarms[i];
[ ... ]
> +		ret =3D devm_request_threaded_irq(&pdev->dev, irq_num, NULL,
> +						bcl_handle_alarm, IRQF_ONESHOT,
> +						bcl_int_names[i], alarm);
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
> +
> +		ret =3D devm_add_action_or_reset(&pdev->dev, bcl_alarm_work_cleanup_ac=
tion,
> +					       alarm);

[Severity: High]
Could this lead to a use-after-free if device probe fails under memory
pressure?

The IRQ is activated by devm_request_threaded_irq() and can immediately
schedule the delayed work. If the very next devm_add_action_or_reset()
fails, the driver returns early without registering
bcl_alarm_work_cleanup_action.

If the IRQ fires in this brief window and schedules the delayed work, the
work will not be safely canceled during the devm teardown sequence and will
execute after the bcl_device memory is freed.

> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-qcom-bcl-h=
wmon-v3-0-f5ca00889cf7@oss.qualcomm.com?part=3D2
