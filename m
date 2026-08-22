Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E365333A9D1
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385443; cv=none; b=uozBt5ZVPf8JXbN5pCjnYrtvXibhBeIOXj7VtY5rVfnx1pDq4WqBvqUvDeEzrzVmDKQpP3kPyLYonboTVv1b4ohmMZrifefOduYOt3H8ArFxOmXKi/Rw3Mf2XmgHDDYV+E6j7fz8QaDY9fxEMrFNqNRLhcDQlyn+CyuJnAzHp2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385443; c=relaxed/simple;
	bh=rOXFjpv9g21k09TZQM3GutgjixoweiA5Xve+8+hAYaY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sfG+Lv+U+C9a9AI3dPwIrWjdimJeWHjOc0UgVZM6tgdclb+3oZTC01TQ8MZQqCwn6dAZ+tnoPeCLAq88cwEy6iwdm2DoaUk88Xd+87v6FiJnyj9kQcXuulnfTpR20KDB61UIy5aME9TnirzGNt3RSAkI3hjkLSuEakzzOH1A6gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDg6Twb8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDg6Twb8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C4B1F000E9;
	Sat, 22 Aug 2026 07:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787385437;
	bh=Y5e3T7Pi7KBaTcO4D1DYfxV5+wiP9z0RCBlZN/vimgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SDg6Twb8OA3tMKHp3YIfubglg1OJcf2jUwiLRDKFBlfVuILStJmfp86UQ67tR6Mx6
	 fWtssX8dlIvYVT0Wg2W8gLISfAZdmGFPYSrmlEoV8MhtIKNSKGsxupEZqTiEfcXCWK
	 QQ+2AzQDaYlzt1pYn8hEJIT+OPl7Av7frp5F20XyqMURESsJiYwt2zwlN2hYInT50M
	 042nwYh6vXSf6knhPH0Ycx5EJdtDEhjq8iz2j7o+ZKgDNWENueoKSgRPxHPfi6AdkD
	 GJv31hAU8UfE2uVXmYBcaNhKA1XWC3O+PVRm6pM/62zGKXs7SFrI4f11dNaSfd/nJN
	 s7GQy1xcR2xqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: valid the data size before reading the sensor
 data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Edward Adam Davis" <eadavis@qq.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_D74E75F577C166FC3CBB36B6966836D44A09@qq.com>
References: <20260822054428.D55F71F000E9@smtp.kernel.org>
 <tencent_D74E75F577C166FC3CBB36B6966836D44A09@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 07:57:16 +0000
Message-Id: <20260822075716.D9C4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The bounds checking logic in `aqc_raw_data_valid` uses an incorrec=
t comparison, resulting in off-by-one errors that allow 1-byte out-of-bound=
s reads.
- [High] `aqc_raw_data_valid` incorrectly assumes `fan_sensor_offsets` is s=
orted in ascending order, failing to validate larger offsets at lower array=
 indices.

Pre-existing issues:
- [High] `aqc_raw_data_valid` completely omits bounds checks for several of=
fsets that are subsequently read in `aqc_raw_event`, leaving the driver vul=
nerable to out-of-bounds reads.
- [High] Processing a crafted report for legacy devices like `aquastreamxt`=
 triggers a NULL pointer dereference on `priv->fan_structure`.
--

--- Patch [1]: [PATCH v2] hwmon: valid the data size before reading the sen=
sor data ---
commit a13b90e2804a6e0d888f292535c33b47d5d8f7fb
Author: Edward Adam Davis <eadavis@qq.com>

hwmon: valid the data size before reading the sensor data

The user-forged sensor data is only 65 bytes long; however, aqc_raw_event()
fails to handle cases where the sensor data length is too small when reading
the data, resulting in [1] during the read process.

Add a data size check, if the size is less than that required for the
specific data item to be read, abort the sensor data read operation.

Reported-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3D9ee5f5dc18673d6b2f37
Tested-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com

> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomp=
uter_d5next.c
> index 1ca70e7262988..c6fe36abfe569 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c

[ ... ]

> @@ -1324,6 +1324,76 @@ static const struct hwmon_chip_info aqc_chip_info =
=3D {
>  	.info =3D aqc_info,
>  };
> =20
> +static bool aqc_raw_data_valid(struct aqc_data *priv, int size)
> +{
> +	int off;
> +	char *msg;
> +
> +	if (!priv)
> +		return false;
> +
> +	off =3D priv->serial_number_start_offset + SERIAL_PART_OFFSET;
> +	if (off >=3D size) {

[Severity: High]
Does this bounds check adequately protect against multi-byte reads?

The condition if (off >=3D size) evaluates to false when size =3D=3D off + =
1.
However, aqc_raw_event() uses get_unaligned_be16(), which reads 2 bytes.

If the device sends a report with a size exactly equal to off + 1, won't
reading 2 bytes at offset size - 1 access one byte beyond the buffer?

[ ... ]

> +	/* Fan speed and related readings data size check */
> +	if (priv->num_fans > 0) {
> +		int fan_off =3D priv->fan_sensor_offsets[priv->num_fans - 1];

[Severity: High]
Does this code assume that the fan_sensor_offsets array is always sorted in
ascending order?

For devices like d5next, the array is initialized as:
{ D5NEXT_PUMP_OFFSET (108), D5NEXT_FAN_OFFSET (95) }

The check uses the last index (95) for bounds validation. This would pass a
report of size 104, but aqc_raw_event() will subsequently access index 0
(108), resulting in an out-of-bounds read.

> +
> +		off =3D fan_off + priv->fan_structure->power;

[Severity: High]
This isn't a bug introduced by this patch, but can priv->fan_structure be
NULL here?

For legacy devices like aquastreamxt, priv->num_fans is set to 2 during
probe, but priv->fan_structure is never assigned and remains NULL. While
this NULL dereference already existed in aqc_raw_event(), this patch adds
another immediate dereference here.

> +		if (off >=3D size) {
> +			msg =3D "fan power offset";
> +			goto invalid;
> +		}
> +
> +		off =3D fan_off + priv->fan_structure->voltage;
> +		if (off >=3D size) {
> +			msg =3D "fan voltage offset";
> +			goto invalid;
> +		}
> +
> +		off =3D fan_off + priv->fan_structure->curr;
> +		if (off >=3D size) {

[Severity: High]
This is a pre-existing issue, but does this adequately cover all fields
accessed in aqc_raw_event()?

This validation omits checks for several offsets, such as:
- priv->fan_structure->speed
- priv->flow_sensors_start_offset
- priv->power_cycle_count_offset
- Device-specific offsets inside the switch (priv->kind) block (e.g.,
  HIGHFLOWNEXT_POWER).

Since aqc_raw_event() unconditionally reads these fields, an out-of-bounds
read could still occur for truncated reports.

> +			msg =3D "fan curr offset";
> +			goto invalid;
> +		}
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_D74E75F577C=
166FC3CBB36B6966836D44A09@qq.com?part=3D1
