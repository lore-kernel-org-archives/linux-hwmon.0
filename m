Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09984052C9
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 16:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341906; cv=none; b=gx6gUymtUnQOj0QZVHW7fsdaHSG8ZuZl0O+q/u+iSaVn9HnGF4+9imq/nzll08SjXOKbCzKOky52kVuRGwSzMynHybmNlhg/Tffk7653zL5e1V+tFzZsbXjFdBAWuboCC9msurZq4+YK33HcS1h3Phc/3esExPU8+/BoZXn2tHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341906; c=relaxed/simple;
	bh=/Evx0Nl5eOo0ZJcio3y40mIeZNmj8aMMIQ90E+qgPfg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ej7+AliBBuoVj1iPhLK9oLDjUk3DZw8GvSFUeoxCZJ9vn3bpiZkNWSBIQBntkh/y5e8GhIp0QSchWCVw1qCPTaEL9FLBkTtozIZ83I19/YVxfUb7su1zcYrODEpUY1WPEdMyvLgmbzNajIsWDWFozd9HKyr9x8Jl9pI6XiVuFPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtI0wlHt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtI0wlHt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4C01F000E9;
	Wed, 29 Jul 2026 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785341904;
	bh=zODpb64UoWOukieTj3Ps3fi9bTfRdXZ5tTKgFY8WBJk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FtI0wlHtlW+jmMS37yd3qKD55gDspGHjbwhPm/4fKRBc/ZhzoKFKSMDhR8oI83FBC
	 77DwTUgySW+yj7eoLUqKE2sA26fvCLwxB3tKArXiWxSI1zUBshPobVnCVEgBe+4gdd
	 Yx7CzLWFNcjgm0M8C0CDeSyx61HBk52h7VvtAruqW407vPfyXHb2fEdkYRs48VqtIw
	 96taUuP3pe7RgHu+/VmOmQBZngwGIV9BI4qmACunkhOVbp8aIg4kzDFAcA/PNhNMCb
	 8+eJo/GeONvcMioczZBlTuU81u0pijdNuVOauBm4xxwfGITqVc7a3rSMUbd7fsIIs2
	 WHY9aHOrg4/Sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] hwmon: (ina2xx) Track active alarm in ina2xx_data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jared Kangas" <jkangas@redhat.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-3-349f7b2f1df8@redhat.com>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
 <20260729-upstream-ina2xx-in0-curr1-alarms-v1-3-349f7b2f1df8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 16:18:23 +0000
Message-Id: <20260729161824.5D4C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Writing 0 to an inactive alert limit unintentionally clears the ha=
rdware mask, disabling the unrelated, currently active alert limit.
- [Medium] The `ina226_alert_read` function fails to use the new `active_al=
ert` disambiguation state, causing unconfigured alarm attributes to incorre=
ctly return 1 if another alarm triggers.

Pre-existing issues:
- [High] On 32-bit architectures, setting any positive power limit results =
in a limit of 0 due to an integer underflow when interacting with `clamp_va=
l()`.
- [High] Setting large shunt voltage limits causes an integer overflow on 3=
2-bit architectures, resulting in a limit of 0 instead of the maximum clamp=
ed limit.
--

--- Patch [3]: [PATCH 3/4] hwmon: (ina2xx) Track active alarm in ina2xx_dat=
a ---
commit 480990f993b0efa725eee2c5b0c2a864cd60bcfb
Author: Jared Kangas <jkangas@redhat.com>

hwmon: (ina2xx) Track active alarm in ina2xx_data

INA2XX current limits are converted into shunt voltage limits internally
using the shunt resistor value. Once a current limit's corresponding
voltage limit is written to the hardware, shunt voltage and current
alarms are indistinguishable from each other.

> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -157,6 +157,7 @@ struct ina2xx_data {
>  	const struct ina2xx_config *config;
>  	enum ina2xx_ids chip;
> =20
> +	enum ina2xx_alert_type active_alert;

[Severity: Medium]
Will this new state also be checked in ina226_alert_read()?

If an unconfigured alarm triggers, could it incorrectly return 1 since both
alarms map to the same hardware mask?

drivers/hwmon/ina2xx.c:ina226_alert_read() {
    ...
    mask =3D ina2xx_alert_type_to_mask(alert);
    *val =3D (regval & mask) && (regval & INA226_ALERT_FUNCTION_FLAG);
    ...
}

[ ... ]

> @@ -492,9 +522,13 @@ static int ina226_alert_limit_write(struct ina2xx_da=
ta *data, enum ina2xx_alert_
> =20
>  	if (val) {
>  		mask =3D ina2xx_alert_type_to_mask(alert);
> -		return regmap_update_bits(regmap, INA226_MASK_ENABLE,
> -					  INA226_ALERT_CONFIG_MASK, mask);
> +		ret =3D regmap_update_bits(regmap, INA226_MASK_ENABLE,
> +					 INA226_ALERT_CONFIG_MASK, mask);
> +		if (ret < 0)
> +			return ret;
>  	}
> +
> +	data->active_alert =3D val ? alert : INA2XX_ALERT_NONE;

[Severity: High]
If a user writes 0 to an inactive alert limit, will it unintentionally clear
the hardware mask at the beginning of ina226_alert_limit_write() and wipe o=
ut
the currently active alert?

drivers/hwmon/ina2xx.c:ina226_alert_limit_write() {
    ...
    ret =3D regmap_update_bits(regmap, INA226_MASK_ENABLE,
                 INA226_ALERT_CONFIG_MASK, 0);
    ...
}

[Severity: High]
This is a pre-existing issue, but on 32-bit architectures, does this clamp
operation compute a negative boundary for INA2XX_POWER?

drivers/hwmon/ina2xx.c:ina226_alert_to_reg() {
    ...
    case INA2XX_POWER:
        val =3D clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
    ...
}

Because UINT_MAX is cast to signed long by clamp_val(), it could result in a
negative upper bound, forcing val to a negative number which is then clamped
to 0.

[Severity: High]
This is also a pre-existing issue, but does setting a large shunt voltage
limit cause an integer overflow on 32-bit architectures?

drivers/hwmon/ina2xx.c:ina226_alert_to_reg() {
    ...
    case INA2XX_SHUNT_VOLTAGE:
        val =3D clamp_val(val, 0, SHRT_MAX * data->config->shunt_div);
        val *=3D data->config->shunt_div;
    ...
}

If a user sets a large valid limit on a 32-bit system, the multiplication
might overflow the signed 32-bit long into a negative number, which is then
incorrectly clamped to 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-upstream-i=
na2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com?part=3D3
