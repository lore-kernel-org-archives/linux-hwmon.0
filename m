Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1975340D562
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 00:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782777986; cv=none; b=qWnTOmEXV1r+pGCNx1IVsVav1fYWvJfpa4EBztjt2dzpyHvG9s8qeS4A+5QuRY4dfhFqvzsu9ELZk13Jg3TkbcUR3QEXQ9RvcHGnNusRwHlk7TrV6q/7D+oi7rABywJNDQM4XHbaLIdkd3giTVLuq3gKu4dbaTur4RkNwLzFq7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782777986; c=relaxed/simple;
	bh=LBhcYPVgws2P8FCfkZhkzMB5zpeSc5Xb6aLB3JAokrs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iPZB3YMTz94m5w2h2OmIC4JYK8SyOikLO5sPvbgPZqU8HZ7xwSNvjxezC2r72tMRdEi7vGUxoE9C6t49i3HCL95KSWxt0U0nlBLSEztovctkvCielF6I/Y6/lakai394kzgkn99huYWJ+I4KfS+tkJYg/n46PaE3i2Zy+O21Kwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwGrE5dB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwGrE5dB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F091F000E9;
	Tue, 30 Jun 2026 00:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782777984;
	bh=dJSODQ/8QMNEahR+ppe6QSBNXKNLFS/g1zulI9foVSY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YwGrE5dBtyYvYPVIqO6vDNhxVI8EURBFFMS9jEpXtb/0LE9vpvyZa9FGAF3eCEOUX
	 QgXkHt68Y2ab+26ZaRDnM1m2uAxt/yKxLAZWNcheoPk4zvlx+McBLH1g2wULEA3pwW
	 WuUx84ejNGsf37WLznrqFYaeOWUmgWsOTKhiD24clzh9s3g31Ut4NbRdit1Uf/mwvq
	 MOumUP2HlaRfIKoJZg/bCUdBBCVS5YvLRBO2vcC/dtHSS8qPNKzMWZwMPyzNvc6Gr8
	 nIZwtrTDwfffCmYk7u8pJeWYJ5+1XZfR9vom2zsC4bT6wmfNIcbVMiAGpQPoUGnzwr
	 vm3vrYRDfCCFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tach) Validate the number of tach
 channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260629235503.2019362-1-linux@roeck-us.net>
References: <20260629235503.2019362-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 00:06:24 +0000
Message-Id: <20260630000624.91F091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Medium] Input validation is performed mid-loop during hardware state mut=
ation, leaving previously processed fan channels permanently enabled in har=
dware if a later channel fails validation.

Pre-existing issues:
- [High] A single global `priv->tach_divisor` variable is incorrectly share=
d across all fan channels, corrupting RPM calculations for independent chan=
nels.
- [High] Integer overflow and lack of zero-checks in `aspeed_tach_val_to_rp=
m` can lead to division by zero panics or wildly incorrect RPM values.
- [Medium] Probe error handling returns `0` when fan monitor creation fails=
, silently abandoning hardware monitoring registration while leaving the de=
vice successfully bound.
- [Medium] Duty cycle calculations in `aspeed_pwm_apply` can overflow a 64-=
bit integer, resulting in a near-zero duty cycle for very large requested p=
eriods.
--

commit 1d7e6c15019c0fdc2af8d78d76b900c9f2bb4d7e
Author: Guenter Roeck <linux@roeck-us.net>
Subject: hwmon: (aspeed-g6-pwm-tach) Validate the number of tach channels

This commit adds validation for the number of tachometer channels parsed
from the device tree to prevent out-of-bounds array accesses. It also
validates individual channel numbers before enabling hardware features.

Closes: https://sashiko.dev/#/patchset/20260629232305.2013406-1-linux%40roe=
ck-us.net

> diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6=
-pwm-tach.c
> --- a/drivers/hwmon/aspeed-g6-pwm-tach.c
> +++ b/drivers/hwmon/aspeed-g6-pwm-tach.c

[ ... ]

> @@ -399,13 +399,16 @@ static const struct hwmon_chip_info aspeed_tach_chi=
p_info =3D {
>  	.info =3D aspeed_tach_info,
>  };
> =20
> -static void aspeed_present_fan_tach(struct aspeed_pwm_tach_data *priv, u=
8 *tach_ch, int count)
> +static int aspeed_present_fan_tach(struct aspeed_pwm_tach_data *priv, u8=
 *tach_ch, int count)
>  {
>  	u8 ch, index;
>  	u32 val;
> =20
>  	for (index =3D 0; index < count; index++) {
>  		ch =3D tach_ch[index];
> +		if (ch >=3D TACH_ASPEED_NR_TACHS)
> +			return -EINVAL;
> +

[Severity: Medium]
If the device tree array contains a valid channel followed by an invalid
channel, does returning early here leave the previously processed valid
channels permanently enabled in hardware?=20

It looks like the earlier iterations would have already called
aspeed_tach_ch_enable(priv, ch, true) without disabling them on this error
path.

>  		priv->tach_present[ch] =3D true;
>  		priv->tach_divisor =3D DEFAULT_TACH_DIV;

[Severity: High]
This is a pre-existing issue, but is priv->tach_divisor a single global
variable shared across all fan channels?=20

Looking at aspeed_tach_hwmon_write():

drivers/hwmon/aspeed-g6-pwm-tach.c:aspeed_tach_hwmon_write() {
    ...
    priv->tach_divisor =3D val;
    reg_val =3D readl(priv->base + TACH_ASPEED_CTRL(channel));
    ...
}

Does this mean modifying the divisor for one fan channel overwrites the
global state, corrupting RPM calculations in aspeed_tach_val_to_rpm() for
other independent channels?

[ ... ]

[Severity: Medium]
This isn't a bug introduced by this patch, but does the probe function
silently mask failures when fan monitor creation fails?

drivers/hwmon/aspeed-g6-pwm-tach.c:aspeed_pwm_tach_probe() {
    ...
    ret =3D aspeed_create_fan_monitor(dev, child, priv);
    if (ret) {
        dev_warn(dev, "Failed to create fan %d", ret);
        return 0;
    }
    ...
}

If the fan channel configuration in the device tree is invalid, this returns
0 instead of the error code. Could this leave the driver in a partially
functional state where hardware monitoring is completely missing without
signaling a probe failure to the driver core?

[Severity: High]
This is a pre-existing issue, but can the RPM calculations in
aspeed_tach_val_to_rpm() lead to a division by zero panic?

drivers/hwmon/aspeed-g6-pwm-tach.c:aspeed_tach_val_to_rpm() {
    ...
    tach_div =3D tach_val * priv->tach_divisor * DEFAULT_FAN_PULSE_PR;
    ...
    do_div(rpm, tach_div);
    ...
}

If the hardware legitimately reports 0 for tach_val, or if the 32-bit
multiplication overflows and wraps to 0, wouldn't the subsequent do_div()
trigger a division by zero?

[Severity: Medium]
This is a pre-existing issue, but can the duty cycle calculations in
aspeed_pwm_apply() overflow a 64-bit integer?

drivers/hwmon/aspeed-g6-pwm-tach.c:aspeed_pwm_apply() {
    ...
    duty_pt =3D div64_u64(state->duty_cycle * priv->clk_rate,
                        (u64)NSEC_PER_SEC * (div_l + 1) << div_h);
    ...
}

When a very large PWM state is requested, the period is limited to avoid
overflow, but duty_cycle doesn't appear to be capped. Could the
state->duty_cycle * priv->clk_rate evaluation overflow u64, resulting in a
near-zero hardware duty cycle instead of the requested value?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629235503.2019=
362-1-linux@roeck-us.net?part=3D1
