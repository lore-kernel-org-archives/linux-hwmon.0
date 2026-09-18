Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB6A3E49EE
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 18:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754468; cv=none; b=bcST5El7VtvRZ7fHEw+ig41yhzGmFDdviuLkbyNcxv8VlnvrPx8m4K3B4+Ztzvql9ddmTIWipwcr7Fs2i0CMHCJxTrarkLXxtT91aqV58uvy1OJ+G6h6Xr4mlUZZDfjd/xuaLvdaf6UGBirrAAf4bq/8bAOBt1TO+QZlKYrrP00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754468; c=relaxed/simple;
	bh=0kQ5pc64muz7yZld8Ux4aYTX2JmN0iL8qn3XCO9PiFc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qb7nAFuJyQZB+E+LcI4gjgQBzkcYANt9WU4lsGi+qtfP8P279/nRCTZAvv7LS6h9qsfsiNN8exHCMytAwZAoKlTmPJOD1SQM0R7/HircUz4le+O19MJ+ObttYc2bscN49bVunCXzqazFB8DNFlicfYnJDA564syZgKZJYDvxRBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMx5OhZw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMx5OhZw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42651F0089C;
	Fri, 18 Sep 2026 18:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789754466;
	bh=X2ntLi+3mjA0s/u31q3chpP7m+9QsaMdZHknjkhJpfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iMx5OhZwUHZg3TMV5aE5R+UQB0G/+b2jU4G8z1Ur4et+fGJEXEWNhKcZX90Z6FWxr
	 +UOkWPDL3K26TkR98ZwEgzH8NjlFN0bpFpjRlXnRL4dknXG3r4d/8idD14iWuBhyyB
	 dCZJiyB2+NjRH3vbomU2fGStE5YEnMZ8YFhcKfaGiScefHYmkJH7dKEZ2ZmR91fFio
	 BxcHRJpEvAODxXBM3nuiBe70xI3a8pMFVLj/F8AB8JaQJjSifQe3JHzNOVICbfI0L3
	 cIWs4e1jChOoML+C+XIOAEmNLRBSCQ+chaWKwLTHq+4yQAwtx7y74k738Z7gITXFzM
	 Bu0FuPJYLOb3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (applesmc) add
 charge_control_end_threshold support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jordan Brough" <jordan@brough.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260918175052.85461-3-jordan@brough.org>
References: <20260918175052.85461-1-jordan@brough.org>
 <20260918175052.85461-3-jordan@brough.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 18:01:06 +0000
Message-Id: <20260918180106.B42651F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] hwmon: applesmc: AB-BA deadlock between applesmc_bat_lock and exte=
nsions_sem
- [Medium] hwmon: applesmc: secondary battery functionality not implemented=
 as auxiliary device
--

commit 1bfe7b94e596c2681653ce0f082904d5c162cf4d
Author: Jordan Brough <jordan@brough.org>

hwmon: (applesmc) add charge_control_end_threshold support

This commit adds native charge_control_end_threshold support to the
applesmc driver using the power_supply_ext API and ACPI battery hook
infrastructure. It introduces read/write capabilities for battery charge li=
mit
registers (BCLM and BFCL) directly within the hwmon driver.

> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index d0baa10502f7d..2444bea8a0f19 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
[ ... ]
> @@ -724,6 +751,119 @@ static struct platform_driver applesmc_driver =3D {
>  	},
>  };
> =20
> +static DEFINE_MUTEX(applesmc_bat_lock);
> +
> +static int applesmc_bat_get_property(struct power_supply *psy,
> +				     const struct power_supply_ext *ext,
> +				     void *data,
> +				     enum power_supply_property psp,
> +				     union power_supply_propval *val)
> +{
> +	u8 limit;
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		scoped_guard(mutex, &applesmc_bat_lock) {

[Severity: High]
Can this introduce an AB-BA deadlock with the power supply core's
extensions_sem?

When userspace reads a property via sysfs, the power supply core's
__power_supply_get_property() acquires psy->extensions_sem for reading
before invoking this get_property callback. This establishes a lock
order where extensions_sem is held before attempting to acquire
applesmc_bat_lock.

However, in applesmc_battery_remove() below, applesmc_bat_lock is
acquired before calling power_supply_unregister_extension(), which
acquires psy->extensions_sem for writing, establishing the reverse lock
order.

> +			ret =3D applesmc_read_key(BATTERY_CHARGE_LIMIT_KEY, &limit, 1);
> +			if (ret)
> +				return ret;
> +			val->intval =3D limit;
> +			return 0;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +}
[ ... ]
> +static int applesmc_battery_add(struct power_supply *battery, struct acp=
i_battery_hook *hook)
> +{
> +	int ret;
> +
> +	guard(mutex)(&applesmc_bat_lock);
> +	if (applesmc_hooked_battery)
> +		return 0;
> +
> +	ret =3D power_supply_register_extension(battery, &applesmc_bat_ext, &pd=
ev->dev, NULL);

[Severity: Medium]
Is hooking directly into the power_supply subsystem from within the
hwmon subsystem directory a violation of the hardware monitoring
subsystem layering guidelines?

The hwmon subsystem guidelines explicitly require that secondary
functionality (like battery charge control) be implemented as an
auxiliary device, with the driver residing in the appropriate subsystem
directory.

> +	if (ret)
> +		return ret;
> +
> +	applesmc_hooked_battery =3D battery;
> +	return 0;
> +}
> +
> +static int applesmc_battery_remove(struct power_supply *battery, struct =
acpi_battery_hook *hook)
> +{
> +	guard(mutex)(&applesmc_bat_lock);
> +	if (applesmc_hooked_battery !=3D battery)
> +		return 0;
> +
> +	power_supply_unregister_extension(battery, &applesmc_bat_ext);

This acquires psy->extensions_sem for writing while applesmc_bat_lock
is already held, completing the AB-BA deadlock cycle mentioned above.

> +	applesmc_hooked_battery =3D NULL;
> +	return 0;
> +}
> +
[ ... ]
> @@ -1563,6 +1703,10 @@ static int __init applesmc_init(void)
>  		goto out_light_ledclass;
>  	}
> =20
> +	if (smcreg.has_battery_charge_limit &&
> +	    (IS_REACHABLE(CONFIG_ACPI_BATTERY) || IS_REACHABLE(CONFIG_ACPI_SBS)=
))
> +		battery_hook_register(&applesmc_battery_hook);

[Severity: Medium]
Should this secondary battery functionality be implemented as an
auxiliary device instead of being registered natively during the hwmon
driver initialization?

Embedding the ACPI battery hooks directly in drivers/hwmon/applesmc.c
appears to bypass power supply subsystem maintainer review and violate
layering rules.

> +
>  	return 0;
> =20
>  out_light_ledclass:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918175052.8546=
1-1-jordan@brough.org?part=3D2
