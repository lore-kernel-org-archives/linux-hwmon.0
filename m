Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C533016F2
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 14:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787408409; cv=none; b=lJ7Pchir/Mmn+d38wRTEWsXmfzoSenGkIKj0P2c+AwnukTqY9tkUHosocpxGxrc+ks4lrDrjAGV4JRkGAjJ1ZDCU9d66krJxff2sXKGsxEmUUf8L/z83Ae6g9ibDS0hoNVSEmPOpvn7iZpyz/EtrmsNA1GRpklQWtylBjBHrF8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787408409; c=relaxed/simple;
	bh=qPNPEAfNUrI+FXVrsDW6ptC/UEfUuRjVT+ljdNsfmvM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=joqpMlALlMCARJs74R+uS4ZU4aoehCr1FAXgi7iJ/392jaeNzCtiLlUY/Sy92UOvlJ2RFGdtjdstrrSPHurwXNuVCSiA6C0aRJJA8iQ5cicIGs6Hu4c0u2ScEgSkXMzel2s6NkA8eHw13HYYa4tdudbBNjhfaXRNxPP54nm489A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dfqzdf7Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dfqzdf7Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1111F000E9;
	Sat, 22 Aug 2026 14:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787408405;
	bh=XpRz2EnFEnQADXH9kZRWb1NvlSSD5Xi62ZDLegfsPGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dfqzdf7YKH+CU2mhqIPgAvo/RV1TEx9ATIMXyuOwNzY75YTOy5O9DQxWjUdYeU9YK
	 fQLgDYiwhjBLEJHQ0e7cUjRonQYf1DfRrxaMemR4q3QpRYLzFb3G1hQgq+qzmvmjFp
	 rf8ETosgJ0Fr3Lp4fgw+Ol7CAXmwBZoT1oj/9wVkPhkfSLk2BAc4Rs/RXDbFJpCuTL
	 P0XJXGvMcABLthbmUbY+dE0/EIBUmDBwtA0nGhHVQbWGKkgxTEgtjxamEhQFPID95U
	 AdDJVw73ZoC7Yk2l64ShLqw26gF0SUJLe9zfiGK2MwboYJXIFnCIx+WmGLkSNKd/vO
	 t9NeFrPGtMi9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] hwmon: (aquacomputer_d5next) valid the data size
 before reading the sensor data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Edward Adam Davis" <eadavis@qq.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_5F7DC370E96643AEA458177FB76E86C8F305@qq.com>
References: <tencent_6A66F77626CA5371C36D2968E3AEC4409705@qq.com>
 <tencent_5F7DC370E96643AEA458177FB76E86C8F305@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 14:20:05 +0000
Message-Id: <20260822142005.BB1111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete bounds check leaves special-case sensor readings vulner=
able to out-of-bounds reads.
- [High] Malicious HID report can trigger a NULL pointer dereference for `a=
quastreamxt` devices.
--

--- Patch [1]: [PATCH v5] hwmon: (aquacomputer_d5next) valid the data size =
before reading the sensor data ---
commit 0485af53a3a623fa52b28d4e153bb06db94d49e4
Author: Edward Adam Davis <eadavis@qq.com>

hwmon: (aquacomputer_d5next) valid the data size before reading the sensor =
data

This commit adds a data size check for sensor readings in the
aquacomputer_d5next driver to prevent out-of-bounds memory accesses when
processing truncated HID reports.

Link: https://syzkaller.appspot.com/bug?extid=3D9ee5f5dc18673d6b2f37

> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomp=
uter_d5next.c
> index 1ca70e7262988..352b227c30159 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c
> @@ -1324,6 +1324,84 @@ static const struct hwmon_chip_info aqc_chip_info =
=3D {
>  	.info =3D aqc_info,
>  };
> =20
> +/* aqc_raw_data_valid()
> + * Does not support special-case sensor readings data size check
> + */

[Severity: High]
This is a pre-existing issue, but since this patch aims to fix out-of-bounds
reads during report processing, is it safe to leave special-case sensor
readings unvalidated?

If a malicious USB device presenting as leakshield, highflownext, or
aquastreamult sends a truncated HID report, it could pass this new generic
validation but still be too small for the special-case fields accessed late=
r.

For example, in aqc_raw_event():

drivers/hwmon/aquacomputer_d5next.c:aqc_raw_event() {
    ...
    switch (priv->kind) {
    ...
    case leakshield:
        priv->speed_input[0] =3D
            ((s16)get_unaligned_be16(data + LEAKSHIELD_PRESSURE_ADJUSTED)) =
* 100;
    ...
}

Could this lead to another slab-out-of-bounds read if the report is too sma=
ll
to contain these offsets?

> +static bool aqc_raw_data_valid(struct aqc_data *priv, int size)
> +{
> +	int off, fan_off, i;
> +
> +	if (!priv)
> +		return false;

[ ... ]

> +	/* Virtual temperature sensor */
> +	for (i =3D 0; i < priv->num_virtual_temp_sensors; i++) {
> +		off =3D priv->virtual_temp_sensor_start_offset +
> +		      i * AQC_SENSOR_SIZE + 1;
> +
> +		if (off >=3D size)
> +			goto invalid;
> +	}
> +
> +	/* Fan speed and related */
> +	if (!priv->fan_structure)
> +		goto flow;

[Severity: High]
This is a pre-existing issue, but does skipping this validation when
priv->fan_structure is NULL expose a NULL pointer dereference later in
aqc_raw_event()?

For devices like aquastreamxt, priv->fan_structure is NULL but priv->num_fa=
ns
is greater than 0. Later in aqc_raw_event(), the code loops over num_fans a=
nd
unconditionally dereferences fan_structure:

drivers/hwmon/aquacomputer_d5next.c:aqc_raw_event() {
    ...
    /* Fan speed and related readings */
    for (i =3D 0; i < priv->num_fans; i++) {
        priv->speed_input[i] =3D
            get_unaligned_be16(data + priv->fan_sensor_offsets[i] +
                               priv->fan_structure->speed);
    ...
}

Could this crash the kernel if a malicious USB device sends a status report
for such a device?

> +
> +	for (i =3D 0; i < priv->num_fans; i++) {
> +		fan_off =3D priv->fan_sensor_offsets[i] + 1;
> +		off =3D fan_off + priv->fan_structure->speed;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_5F7DC370E96=
643AEA458177FB76E86C8F305@qq.com?part=3D1
