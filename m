Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0EA3542F8
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878215; cv=none; b=J2xcFJOZnga02m3IHhI6FbjWqaq8wJ+a6ybgt2OKxcGDUXFjDOWPEJgUqciNqUzsUKOUfrFP0Pdbyqm3JyoeI7sfxykPT6fc0FSlbd7cQsSlkFp+9p8r/ecXjfuiY9qEe/e4UW8hgaiWU1yl/2NzAC5bv0A2DGtNjRoqx4vMd9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878215; c=relaxed/simple;
	bh=SXtRyAPYjmLBkqWK09BDVXral5MU/RL7sHaNTMGkBG4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dT8aV+7Ts3lFDqBiXt00M4BVJ+WtYzwVOwJiMBNpPXiQidlXdGOmlfs+FPI3AZr0Fx9YpJ9Fn1gok8edg3RtUdH7qauiRRElrRftuKdsRSS42gimHoapkEi3auS+34JUWdruUJ3mYYAmEuR3bfAGdTgZonr4NdKHz0yIBmXBd54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wq4UczNf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wq4UczNf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE8C1F000E9;
	Wed, 27 May 2026 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779878214;
	bh=Jpl63VasiIVflcrsJ7GsU09hM653EYKhYKEB+oBvQ90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wq4UczNfArxO1Ck0FYx668UsDEOV5159W+91tKtw1AQh5Tln+cUQlUj0eJKqu4XhE
	 jEAIfDmxJmA4cVmgvpKZoW88LFFpfpPngR5o1Adhq1sgu0UdBue6gs6wxVQ1AqTMtM
	 Y9CRDxUQz8bCBKwWGJ7ai+aMpaL5jPNwK40jAmWHMXKE0L6Kip4nzmjhBrp+5joAcQ
	 xlWHHRR15aH/8DoPQPuiCc03Y2Pv/do3h3S0xXQgaR1TsV70F7JPd55lOE0aCbWIUr
	 cBXS/5knv1XrdtmpOY00NUh2eX7SyqCoSsHHUZL03qq7C2vmM06qGPZkTNpKABfg2N
	 ZG8h+TU+6mxOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: (gpd-fan): drop global driver data and
 use per-device allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_75F6B92FD7C3883C6E762A08C842AF971307@qq.com>
References: <tencent_75F6B92FD7C3883C6E762A08C842AF971307@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:36:53 +0000
Message-Id: <20260527103654.4FE8C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race conditions between sysfs operations and hardware access in pr=
obe and remove due to incorrect lifecycle management.
- [High] Arithmetic underflow in `gpd_wm2_read_pwm()` causes valid 0 PWM va=
lues to be treated as errors.
--

commit ea545fb4792b8155ce8756f3eaef0ff4a1ea0d74
Author: Pei Xiao <xiaopei01@kylinos.cn>

hwmon: (gpd-fan): drop global driver data and use per-device allocation

This commit replaces the global driver data with a per-device allocated
struct. This allows the driver to support multiple instances and better
aligns with standard kernel practices.

> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index 80de5f20781eb..7284babd4f5c9 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
[ ... ]
> -static int gpd_wm2_read_pwm(void)
> +static int gpd_wm2_read_pwm(struct gpd_fan_data *data)
>  {
> -	const struct gpd_fan_drvdata *const drvdata =3D gpd_driver_priv.drvdata;
> +	const struct gpd_fan_drvdata *drvdata =3D data->drvdata;
>  	u8 var;
> =20
> -	gpd_ecram_read(drvdata->pwm_write, &var);
> +	gpd_ecram_read(drvdata, drvdata->pwm_write, &var);
> =20
>  	// Match gpd_generic_write_pwm(u8) below
>  	return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));

[Severity: High]
This isn't a bug introduced by this patch, but is there an arithmetic
underflow here if the EC returns 0?

If the fan is stopped and var is 0, the expression (var - 1) promotes to an
int and evaluates to -1. Multiplying by 255 and passing to DIV_ROUND_CLOSEST
yields a negative result.

When this propagates back up to gpd_fan_hwmon_read(), it gets caught by the
error check:

gpd_fan_hwmon_read()
    ret =3D gpd_read_pwm(data);
    if (ret < 0)
        return ret;

Could this cause valid 0 PWM values to be incorrectly treated as errors
instead of properly reporting a 0 PWM input?

[ ... ]
> @@ -624,24 +629,42 @@ static int gpd_fan_probe(struct platform_device *pd=
ev)
[ ... ]
>  	hwdev =3D devm_hwmon_device_register_with_info(dev,
>  						     DRIVER_NAME,
> -						     NULL,
> +						     data,
>  						     &gpd_fan_chip_info,
>  						     NULL);
>  	if (IS_ERR(hwdev))
>  		return dev_err_probe(dev, PTR_ERR(hwdev),
>  				     "Failed to register hwmon device\n");
> =20
> -	gpd_init_ec();
> +	gpd_init_ec(data);
> =20
>  	return 0;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition
between sysfs operations and hardware access during probe?

Because devm_hwmon_device_register_with_info() is called before
gpd_init_ec(), hwmon sysfs attributes are exposed to userspace immediately.
Since the EC I/O involves a stateful 5-step sequence on shared index/data
ports (0x2E/0x2F), could concurrent sysfs operations interleave with the
unprotected outb/inb sequences in gpd_init_ec() and corrupt the index
selection?

I note that a later commit in the patch series ("hwmon: (gpd-fan): Initiali=
ze
EC before registering hwmon device") appears to address this issue.

[ ... ]
> -static void gpd_fan_remove(__always_unused struct platform_device *pdev)
> +static void gpd_fan_remove(struct platform_device *pdev)
>  {
> -	gpd_driver_priv.pwm_enable =3D AUTOMATIC;
> -	gpd_set_pwm_enable(AUTOMATIC);
> +	struct gpd_fan_data *data =3D dev_get_drvdata(&pdev->dev);
> +
> +	if (data) {
> +		data->pwm_enable =3D AUTOMATIC;
> +		gpd_set_pwm_enable(data, AUTOMATIC);
> +	}
>  }

[Severity: High]
This is also a pre-existing issue, but does device removal have a similar
race condition?

The driver modifies the hardware state here via gpd_set_pwm_enable() to
restore AUTOMATIC mode. However, because devres teardown occurs after
remove() returns, the sysfs attributes are still registered and accessible.

Could concurrent sysfs accesses during this removal window corrupt EC RAM
offsets? I see another patch in the series ("hwmon: (gpd-fan): fix race
condition between device removal and sysfs access") handles this, but
wanted to point it out.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779876412.gi=
t.xiaopei01@kylinos.cn?part=3D1
