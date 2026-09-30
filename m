Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456C43FF1AC
	for <linux-hwmon@vger.kernel.org>; Wed, 30 Sep 2026 22:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807885; cv=none; b=fCuFpYlG3dViUO30GPs6mQlw/OVzyPbqgZm3+6QK898LGaMW6i69iX/AxbYhzdjWv49UBWreeTDKuVoCvEwu7CTFFP8ueqOaUH0ycCcyLrJnQvIrlZf6KVVvIT/YZtNOocrcggNzeF3/QyrTDO7UskQ4Y2vdi1PzSFyqxO4CC+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807885; c=relaxed/simple;
	bh=Nz/rv86OEIhHhADdfV78x1Z5MwvWVlrOUpPj66SYVW4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=saNLRsnxFPSq1HWaWFW5amcDSM+34niuydjT/X/O7H9vc5pjE3/QkA8MW6nKSH7Hd6Iv9HhLKpmBDjU9VHvjRKsiuyqpiAeD5bBrr69N2Rr/GqHt3NKmr2vZL/n7Pkeewxi7JFuJSPtoSXPNWOrEcm3qnfOKFLZZ5cuAq2ht7BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8yFFH6T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8yFFH6T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A161F000FF;
	Wed, 30 Sep 2026 22:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790807882;
	bh=llfDsTYbL6sDJcGJIQmusEMjhSdp67pQRCw6/bhRyAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k8yFFH6TYH5+kzmhMgsFeZN+5UhF/CkE/r9pvTxl8rMb/TLYeNb45xsVuTFAoM3gh
	 MvNatAUycm/mJ39bezQHRc6m8Dipl0mwDAdCu6B5u8NRQPLMNdxK12OUYNZu9ujXUJ
	 gDu1myWFgaKKpMV3bfFFFS8FIA76/Rn2fJMyX/tBl4YLPggVFeFiAP/Cocg3QF0xtJ
	 lPEl8afiRPnshk95XAvZbdaw8O1EKy5CQ4zz4e7O2tO3ea2V7bs7mXl2MCWuGDH8MU
	 vyM8ZD0/55YCGgS5K+eyRWVabWicC6FzI4rdVzF2DxIsAPvFJjHG7HzcG8IFVMczQm
	 eidL5RJaxpN0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: (applesmc) add
 charge_control_end_threshold support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jordan Brough" <jordan@brough.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260930222650.1883805-4-jordan@brough.org>
References: <20260930222650.1883805-1-jordan@brough.org>
 <20260930222650.1883805-4-jordan@brough.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 22:38:02 +0000
Message-Id: <20260930223802.83A161F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] hwmon: applesmc implements secondary power supply feature native=
ly instead of using auxiliary device
- [Medium] hwmon: applesmc uses custom mutex instead of hwmon_lock() for ex=
ternal attributes
--

commit 7f74cc774d21a32964e467d3d8da2004ccb22a1e
Author: Jordan Brough <jordan@brough.org>

hwmon: (applesmc) add charge_control_end_threshold support

This commit exposes the MacBook battery charge limit (BCLM) as
charge_control_end_threshold through the power_supply extension API.
It attaches to the battery with ACPI battery hooks and serializes writes
with a newly introduced mutex.

> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index d0baa10502f7d..b6d9ca3027308 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
[ ... ]
> @@ -724,6 +748,120 @@ static struct platform_driver applesmc_driver =3D {
>  	},
>  };
> =20
> +static DEFINE_MUTEX(applesmc_bat_lock);

[Severity: Medium]
Does this custom lock violate the hwmon subsystem locking guidelines?=20

The guidelines mandate that drivers use hwmon_lock() and hwmon_unlock() for
serializing attributes registered by any means other than the info paramete=
r=20
of hwmon_device_register_with_info(). Since this lock is used to serialize=
=20
power supply property access, it appears we should be using hwmon_lock()=20
instead.

> +
> +static int applesmc_bat_get_property(struct power_supply *psy,
[ ... ]
> +static int applesmc_bat_set_property(struct power_supply *psy,
> +				     const struct power_supply_ext *ext,
> +				     void *data,
> +				     enum power_supply_property psp,
> +				     const union power_supply_propval *val)
> +{
> +	u8 limit, led_limit, readback;
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		/* 20 is known to work and 10 is not accepted; the floor is unknown. */
> +		if (val->intval < 20 || val->intval > 100)
> +			return -EINVAL;
> +
> +		limit =3D val->intval;
> +		/* At 100% charging is never cut short, so no margin is needed. */
> +		led_limit =3D limit < 100 ?
> +			limit - APPLESMC_BATTERY_CHARGE_LIMIT_LED_MARGIN : limit;
> +
> +		scoped_guard(mutex, &applesmc_bat_lock) {

[Severity: Medium]
As mentioned above, should this be using hwmon_lock() to serialize access
instead of the custom applesmc_bat_lock?

> +			ret =3D applesmc_write_key(BATTERY_CHARGE_LIMIT_KEY, &limit, 1);
[ ... ]
> +static const struct power_supply_ext applesmc_bat_ext =3D {
> +	.name			=3D "applesmc-charge-control",
> +	.properties		=3D applesmc_bat_props,
> +	.num_properties		=3D ARRAY_SIZE(applesmc_bat_props),
> +	.get_property		=3D applesmc_bat_get_property,
> +	.set_property		=3D applesmc_bat_set_property,
> +	.property_is_writeable	=3D applesmc_bat_property_is_writeable,
> +};
> +
> +static int applesmc_bat_add(struct power_supply *battery, struct acpi_ba=
ttery_hook *hook)
> +{
> +	return power_supply_register_extension(battery, &applesmc_bat_ext, &pde=
v->dev, NULL);
> +}

[Severity: Medium]
Is this direct registration of the power supply extension bypassing the hwm=
on
subsystem layering rules?

The hardware monitoring subsystem guidelines state that secondary
functionality (like power supply properties) should be implemented as an
auxiliary device driver, with the driver residing in the appropriate
subsystem directory, rather than being registered directly from the hwmon
driver.

> +
> +static int applesmc_bat_remove(struct power_supply *battery, struct acpi=
_battery_hook *hook)
> +{
> +	power_supply_unregister_extension(battery, &applesmc_bat_ext);
> +	return 0;
> +}
> +
> +static struct acpi_battery_hook applesmc_bat_hook =3D {
> +	.name =3D "Apple SMC Battery Charge Control",
> +	.add_battery =3D applesmc_bat_add,
> +	.remove_battery =3D applesmc_bat_remove,
> +};

[Severity: Medium]
Similar to the power supply extension above, should this ACPI battery hook
also be separated into an auxiliary device driver?

Registering it directly here in the hardware monitoring driver tightly coup=
les
unrelated subsystems and bypasses proper review from the power supply
maintainers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930222650.1883=
805-1-jordan@brough.org?part=3D3
