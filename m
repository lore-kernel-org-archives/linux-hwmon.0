Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793577454;
	b=PnPj7GDEtVIRYFz/xg2UaWnYpD94K+AWS3FThfhHhzWUyZvykWddwLQGogoQshlbgdiH
	 knpPk8Sm1QVnQxvBM1EDr8ptlTZqg1MrCx4x7J0M6Ufc2e8ENLkhnRI66gLFf4NddCCFH
	 tvWAps59tHAKDlIS1pLhPi2CX4RPfrlD97B7jpPbhT285vyxAZzPvUWeaRnl+VDf4tTE5
	 d7KdLoCYBmW8X3wopZWqiVW/AEobHfKQGRQU7+FAPeuaI8pgYWh4h+r+JLwXyGtPfRaHD
	 1nJs4jqzQv1xWpX77RhSww1wpV42hvUY2Tump6UhsPNT3wyp3zZ13ACAst/d8BHqUxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793577454;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4wyy0MiJHSjgOIeTg4y9UGrpk84CkZFb4py0ZECGnaw=;
	b=f3deLynrEeJfV3FMczfrPzSNMWNqVTAhMkrLpZemym1YshGMLB+yBwOQmjEPf8JFaCMB
	 J513G6EqY7FXaKnF3Enp77BmFXR3gV1eTX8xF5yZq5BGd+7thyYGdvoi8VqOIm32bdlRH
	 YQiJJvArw6jXqQLlpES878cRjY3BzyH0cBD2SDhbRrwc8vnXPeKi2HyM5Rx8K0Xu3hpAr
	 ZgU7qTibC2Tle4m03CxtoPj+5F/QbC673FFEstizbsjmYIIlLxS9S+F4418hnSUR59Xxf
	 wXdyJh1iNX508iEvvxy7hF9okUhfIzzc8AoeeaQbDKGm00ScrA8QFOVkRoMJxQ7D2ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z43FFWxM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEED606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 23:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z43FFWxM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0511F000C1;
	Sun,  1 Nov 2026 23:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793577453;
	bh=4wyy0MiJHSjgOIeTg4y9UGrpk84CkZFb4py0ZECGnaw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z43FFWxMMhSwQFeULIXlv5Lwm2ozSaGjZjvz8Rz5H7cLw+hEGpqs5R7mAoTsoT/93
	 hW9kF+3vKAMx5cjt2Vt5Akxgi/N005fYxx4ooXjoSfwcRjLX2KEd/c7zF7DnKKHOy9
	 rZOS0IWDagXDSH/LtAvsz7D9sw1X7LmRG4WwYRzVqHodAFAUVY7DH1SGXTHELQdX/o
	 kzVXK/r3jBGLKsYMo2Vm4Y/qWpmFPFoO3dtHL0L26FEj+YBAOiU2x9/mEUQWQnvQwR
	 W44sVcDkQtcNBs2VPrv1nQQTcd5SY1GU6yVQjzO6HfeV6AGFVURf051YF4bftsSH7V
	 WheoD5PHXW5gA==
Message-ID: <sashiko-outbox-192787@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (it87) Add support for IT8607E
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ismael Ojeda Perez" <iojedaperez@proton.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <179357707375.834227.595814448085536071@proton.me>
References: <179357707375.834227.595814448085536071@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 23:57:32 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] hwmon: (it87) NULL pointer dereference in it87_reg_pwm() due to mi=
ssing reg_pwm
- [High] hwmon: (it87) broken PWM temp mapping for it8607 due to missing nu=
m_temp_map
--

commit fa2803179a2b666c8fd1b5211259f3072f2f691f
Author: Ismael Ojeda Perez <iojedaperez@proton.me>

hwmon: (it87) Add support for IT8607E

This commit adds hardware monitoring support for the ITE IT8607E Super I/O
chip found on Intel NUC6i3SYB and NUC6i5SYB boards, configuring its features
based on the IT8603E.

> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 2757d428a23db..bdef0b78332b7 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c

[ ... ]

> @@ -530,6 +532,14 @@ static const struct it87_devices it87_devices[] =3D {
>  		.num_temp_map =3D 6,
>  		.peci_mask =3D 0x07,
>  	},
> +	[it8607] =3D {
> +		.name =3D "it8607",
> +		.model =3D "IT8607E",
> +		.features =3D FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
> +		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
> +		  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
> +		.peci_mask =3D 0x07,
> +	},

[Severity: High]
Does the it8607 entry in it87_devices[] need to initialize .reg_pwm (such as
.reg_pwm =3D IT87_REG_PWM, as in it8603)?

Without .reg_pwm initialized, chip->reg_pwm is NULL and it87_probe() copies
that NULL pointer into data->reg_pwm:

drivers/hwmon/it87.c:it87_probe() {
    ...
    data->reg_pwm =3D chip->reg_pwm;
    ...
}

When any PWM channel is active in data->has_pwm (such as pwm2), reading any
hwmon sysfs attribute or running it87_resume() calls:

  it87_update_device()
    -> it87_update_pwm_ctrl()
      -> it87_reg_pwm(data, nr)

where it87_reg_pwm() dereferences data->reg_pwm[nr]:

static inline u16 it87_reg_pwm(const struct it87_data *data, int nr)
{
	return data->reg_pwm[nr];
}

Writing to pwmX, pwmX_enable, or pwmX_auto_channels_temp via set_pwm(),
set_pwm_enable(), or set_pwm_temp_map() also calls it87_reg_pwm() and will
dereference NULL.

[Severity: High]
Should the it8607 entry in it87_devices[] also initialize .num_temp_map (for
example, .num_temp_map =3D 4 to match it8603)?

Leaving .num_temp_map unset initializes data->num_temp_map to 0 in
it87_probe(). Because 0 !=3D IT87_PWM_OLD_NUM_TEMP (3), uses_global_temp_ma=
p()
returns true:

static inline bool uses_global_temp_map(const struct it87_data *data)
{
	return has_new_tempmap(data) ||
		pwm_num_temp_map(data) !=3D IT87_PWM_OLD_NUM_TEMP;
}

In it87_update_pwm_ctrl() and pwm_temp_channel(), the comparison against
pwm_num_temp_map(data) (0) is always true and resets data->pwm_temp_map[nr]
to 0:

	if (uses_global_temp_map(data) &&
	    data->pwm_temp_map[nr] >=3D pwm_num_temp_map(data))
		data->pwm_temp_map[nr] =3D 0;

Similarly, in pwm_temp_map_from_channel(), channel >=3D num (where num is 0=
) is
always true for unsigned int channel, causing all writes to
pwmX_auto_channels_temp via set_pwm_temp_map() to fail with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179357707375.834227=
.595814448085536071@proton.me?part=3D1
