Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2333438A1
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783764319; cv=none; b=AAas71LaJxWjqWf1oMEhpoA1YtyplXS+izJki7/m1//nrUcoNGhTq9I+lXY2mBzmhlnHHGP+LYU8hi1yi5vVPV8d+LG1Ec2drbaTlj+U6r71ZP7fZdxlijHGIOCsw9kWgKdc3ySKw/Pb9DcVU+cfh/PIhnhfFT+YpHguINF9JNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783764319; c=relaxed/simple;
	bh=wjVuB74sfGxOcSPntWKnO4H94n6xkI3wqmhXLyMFXPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=crGokJ8++pm3BioVs2wHflrEF4MrxiYpUsaUm/V6M+HGK85fUawvFGXpSRwKruujZ8TUxxPUb78TvEI/I+mqF5X95ZVrL7zkCbfkp+iKtpB4OrVOogTo2HNgOJYyCkuuBqHC5YWqMImFhrKzD82ZRn5dIO6+hU21oRFBqYVVL/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhWhDR9D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhWhDR9D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99871F000E9;
	Sat, 11 Jul 2026 10:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783764317;
	bh=VvWB/Dqe4E0BqPBAbdUI5ke/IMVfpyTBEjSBd1gNcUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PhWhDR9DiwjECL1RMDnVZV1kr5z1JE2zHyY+4rr0DNnArqu0YTzPlumQ9O6+8eDGY
	 mrd7rtbXn2MqwoNWcHtesA3Pz1jccPuH/poOupGYkClr7uMotlyck30wU5wvuiYuZA
	 enM0OIx2esiGSJS78gNrCM4yE7laEXOttBLDpx9BAGiT0ECgXh7zEuII2Z+NpHoDta
	 qPxgh+5g8RuE+YayThPOUACBfmtnCUfGcuTO+kIIsR0y5gbCs/PMcUY4x5R7vA0fEL
	 /aK1qwQ8guM3N/r4hCNI6GmXkVyAsc5M0OasiQ9SIPafO4eLvmzvohJQ0z03nJpyQb
	 w3bWnGZ0LKjqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (cros_ec) Store the hwmon device in
 cros_ec_hwmon_priv
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711-cros_ec-hwmon-locking-v1-2-cb6d0fdbb2d3@weissschuh.net>
References: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
 <20260711-cros_ec-hwmon-locking-v1-2-cb6d0fdbb2d3@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 10:05:17 +0000
Message-Id: <20260711100517.A99871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A TOCTOU race condition exists between thermal core cooling state =
updates and hwmon sysfs attribute writes, leading to the EC fan control mod=
e being unintentionally overridden from auto back to manual.
--

--- Patch [2]: [PATCH 2/3] hwmon: (cros_ec) Store the hwmon device in cros_=
ec_hwmon_priv ---
commit 7ca9614b2a60a2ddf82816080be1dcfa8ab66da6
Author: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

hwmon: (cros_ec) Store the hwmon device in cros_ec_hwmon_priv

This patch adds a pointer to the hwmon device within the cros_ec_hwmon_priv
structure. The change prepares the driver for an upcoming locking scheme
for thermal devices that requires access to the hwmon device.

> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index f9b19da50472d..fb5daa9f80d1c 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -25,6 +25,7 @@
> =20
>  struct cros_ec_hwmon_priv {
>  	struct cros_ec_device *cros_ec;
> +	struct device *hwmon_dev;

[Severity: High]
This is a pre-existing issue, but since this patch prepares the driver for
an upcoming thermal locking scheme, is there a TOCTOU race condition during
PWM updates without hwmon_lock() serialization?

Looking at cros_ec_hwmon_write_pwm_input(), which can be called by the ther=
mal
core to update the cooling state:

static int cros_ec_hwmon_write_pwm_input(struct cros_ec_device *cros_ec, u8=
 index, u8 val)
{
	u8 control_method;
	int ret;

	ret =3D cros_ec_hwmon_read_pwm_enable(cros_ec, index, &control_method);
	if (ret)
		return ret;
	if (control_method !=3D 1)
		return -EOPNOTSUPP;

	return cros_ec_hwmon_set_fan_pwm_val(cros_ec, index, val);
}

If a concurrent user-space thread writes to the hwmon_pwm_enable sysfs
attribute to set the mode to auto after the control_method check, the EC
successfully transitions to auto.

When the thermal core thread resumes and writes the PWM value via
cros_ec_hwmon_set_fan_pwm_val(), the EC implicitly reverts the fan control
mode back to manual.

If the mode is overridden back to manual after user-space successfully set =
it
to auto, the fan could remain stuck at a low or zero PWM speed. Does this
path need to be protected by hwmon_lock() to ensure the fan control mode
is not unintentionally altered?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711-cros_ec-hw=
mon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net?part=3D2
