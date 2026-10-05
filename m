Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F6437DE99;
	Mon,  5 Oct 2026 12:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204019; cv=none; b=V9mGjpVRTyee1nEG+P1ZQiKjrlXjFCrVuGApL5DiXBgeCsQxN+P6E2Dh6HYs3zPMTbNT9PduE2NbmOLFGl0y2s06M4YFCTYQwTVBmQdOXTfGVGTZ54biJuDrCoBwzuTFwh9ZQ/ey0K9Xi7DjN7HHmDm7N9PNkkk1rgEVDWAkxLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204019; c=relaxed/simple;
	bh=+7ImQTDefiwwqONUS6iB1B7G6ertxrCvdbcPhWVc8HA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PHXGziaqjQWmr66pR0Hgz2134wP//RB9WvAvAOH5HB+C/r/cizrKXY+ty5FO3lx7OkJUZUls67w+AR4ZPh/w3WaNjHIsX0NA5yK4kuwQbpkuMspTjB1pa5OBAd3fhBdLFUwvkKygP7Fc6ucoIx8QwOI0CHMSUNbnrqt2tqxmiXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgFHmcp0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgFHmcp0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81141F000FF;
	Mon,  5 Oct 2026 12:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791204017;
	bh=Cs79M38fjUFqbDcRGNWW1r2DwQv+YmkAZQxpwzwCjF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OgFHmcp0FBhYd6+WunEr4l62fsr5qrJB/VFWKcYHemvwUCr3RSRGk7K62lKJ6320x
	 jV1GaI6cCQFly5H4YzJEq7Ar42HbQSrnfskZVcrkRP6Mo8F3ldMd5D/T66inbSiaoj
	 iNpQd8N98vWvY6al3FsYJU3CS/FjUQRJWsgekpXO13nUYOAXGmcjSXiBp8YsM5Lg/c
	 6OiPCchRGhspp4Yfy00vJ1RDdLGW47XTRUoTQMa6rZLz2vs5gq9Tu0fe8f+KDpnJIp
	 maElIzqpw0VbZAFKvGF06YNvGo/HKyrb7fJKsN6fdH8pP/X6AXrIJsI9VMz8T2LdYW
	 97+bSl9EFVTGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 12:40:17 +0000
Message-Id: <20261005124017.A81141F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] hwmon: qcom-bcl: IRQ storm on teardown due to devres LIFO ordering
- [Medium] hwmon: qcom-bcl: leaked wake source due to devres LIFO race with=
 delayed work
- [Medium] hwmon: qcom-bcl: max_mu limits for SMB2360/SMB2370 exceed L1/L2 =
threshold register capacity
--

commit 89d1ce4f2b9b2e93fca41d6caf2cfb094e5b9f02
Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

hwmon: Add Qualcomm PMIC BCL driver

This commit adds a hardware monitoring driver for the Qualcomm SPMI PMIC
Battery Current Limiting (BCL) peripheral. It provides real-time voltage and
current readings, configurable threshold-based alarms, and automatic
threshold management with polling-based recovery.

> diff --git a/drivers/hwmon/qcom-bcl-hwmon.c b/drivers/hwmon/qcom-bcl-hwmo=
n.c
> --- /dev/null
> +++ b/drivers/hwmon/qcom-bcl-hwmon.c
[ ... ]
> +static const struct bcl_desc smb2360_data =3D {
> +	.reg_fields =3D bcl_smb2360_reg_fields,
> +	.num_reg_fields =3D F_CURR_INPUT + 1,
> +	.data_field_bits_size =3D 8,
> +	.thresh_field_bits_size =3D 8,
> +	.battery_config_field =3D REG_FIELD(0x2a50, 0, 1),
> +	.in_mon_enabled =3D true,
> +	.in_input_enabled =3D true,
> +	.curr_mon_enabled =3D true,
> +	.channel_cfg[BCL_BATT_2S][CHANNEL_IN] =3D {
> +		.base_mu =3D 4500,
> +		.max_mu =3D 8400,
> +		.step_mu =3D 50,

[Severity: Medium]
Does this maximum threshold value exceed the capacity of the L1 and L2
registers?

The L1 and L2 registers use a 6-bit index field, which limits the maximum
value to 63. For BCL_BATT_2S, this gives a maximum voltage of 7650 mV
(4500 base + 63 * 50 step).

Since max_mu is 8400, if userspace tries to set a valid value like 8000 mV,
the computed index will exceed the field mask and be rejected by
bcl_validate_threshold_fits(), resulting in an unexpected -EINVAL error.

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
> +		/*
> +		 * Register the work cleanup action right after the IRQ is
> +		 * requested, before any other fallible step in this loop, so
> +		 * a delayed work scheduled by the IRQ handler is guaranteed to
> +		 * be canceled on teardown even if the wake cleanup registration
> +		 * below fails. Keeping it after the IRQ request also preserves
> +		 * safe devm LIFO teardown order.
> +		 */
> +		ret =3D devm_add_action_or_reset(&pdev->dev, bcl_alarm_work_cleanup_ac=
tion,
> +					       alarm);

[Severity: High]
Is it possible for an endless IRQ storm to occur during teardown?

Because devres uses LIFO ordering, the work cleanup action runs before the
IRQ is freed, which sets shutting_down to true. If the hardware asserts the
interrupt in this window, bcl_handle_alarm() will return IRQ_HANDLED without
calling disable_irq_nosync().

Could this leave the level-triggered interrupt unmasked and cause it to
continuously fire in a loop?

> +		if (ret)
> +			return ret;
> +
> +		if (!enable_irq_wake(irq_num))
> +			alarm->irq_wake_enabled =3D true;
> +
> +		ret =3D devm_add_action_or_reset(&pdev->dev, bcl_alarm_wake_cleanup_ac=
tion,
> +					       alarm);

[Severity: Medium]
Could this lead to a leaked wake source during driver unbind?

The bcl_alarm_wake_cleanup_action is registered after the work cleanup acti=
on,
meaning devres will execute it first and disable the wake source. However, =
the
delayed polling work hasn't been canceled yet.

If bcl_alarm_enable_poll() executes concurrently in this window, it will see
shutting_down is still false and could call enable_irq_wake() again, leaving
the wake source permanently enabled after the work is finally canceled.

> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-qcom-bcl-h=
wmon-v4-0-50b9a8c730b7@oss.qualcomm.com?part=3D2
