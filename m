Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D98F2E7185
	for <linux-hwmon@vger.kernel.org>; Sun, 13 Sep 2026 23:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789342001; cv=none; b=WNd5/fIyXHKPc7fQHQ+tzZsSbg+W3uFR46WEVxLgjd7j4oM6BQMa1GoxN/W6JYKbWlYZKOBsqAXk/o3QnMInQ4Pv3563O693YaFH4nAEayvor4QyiT7XWcrEOdl9h7CoNQR4TRhmNR67gr6uPQh7jo4BB0ZB/y+C6DXrC7D9bjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789342001; c=relaxed/simple;
	bh=daJCFFHFEvuZy+JNsbkdkmaVr7hiw8ZNozKazYgBurk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d7ymPWwCApNyeuw9sn8Di13vGPLUotR2EKqtvceeqqt4Y0GPKRvig32Iqclo9aPuKf9l8v/qMv157LzieStciCViLVBvEpYlqLO+Mw0lvEs9aGLo9jMUbZX/Xe7rKQQg7jAPRKU8K/BviYmkd8RjmGQns7BsetOC2vBN8ra+Cr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEKCKFAg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEKCKFAg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC58A1F00893;
	Sun, 13 Sep 2026 23:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789341998;
	bh=xHsnGSVHqM0CV6IfLU4vX2tPg4RoM4x4RW3evsPQU3k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AEKCKFAgZdTOBGMf8OBoQRTC7+YZTAbiZoALAXLhvhn2PUct/QTe9OwOtdYKjgnp4
	 +qxU2BfRroyvD4FcVhE6qmWJ7pps3XM/mLPDTSC198Ct22Upx8b4B2jExp/JKS8n2i
	 /ioYqzFZdEMvphewC4f50hVPEObvzDsd/Fs7y1CRHrRUvlh6K9iPRTbvz1fIhSh3OS
	 Zu5uKuJz5uIlkYKjyQwBKeBXZCCcgC6bgKHcuEwHAhq0y/5jm+pS65MzK2z4WlZv0+
	 CJXYc7IhYbbBdMx9DN5LDZSg0aq19rVEvwwCDGCPvP+X1qZtTFLDjvC3z7bKSh6kLY
	 RPlSdU1kUlalQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (applesmc) add charge_control_end_threshold
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jordan Brough" <jordan@brough.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260913231410.416922-3-jordan@brough.org>
References: <20260913231410.416922-1-jordan@brough.org>
 <20260913231410.416922-3-jordan@brough.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 23:26:37 +0000
Message-Id: <20260913232637.DC58A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Concurrent battery additions cause a TOCTOU data race on the `appl=
esmc_hooked_battery` global pointer, risking leaked extensions and Use-Afte=
r-Free.
- [Medium] Secondary functionality (battery charge limit) is implemented di=
rectly in the hwmon driver instead of using an auxiliary device.
- [Medium] Multi-variable race condition when updating BCLM and BFCL SMC ke=
ys.
- [Low] Incorrect state assignment on failure causes a spurious kernel warn=
ing during rollback.
- [Low] The newly registered power supply attribute callbacks do not use th=
e mandated `hwmon_lock()` API for mutual exclusion.
--

commit 31b80fd6344420398af17504b367d0f876c4eee2
Author: Jordan Brough <jordan@brough.org>
Subject: hwmon: (applesmc) add charge_control_end_threshold support

This commit adds native charge_control_end_threshold support to the applesmc
driver using the power_supply_ext extension API. It allows standard userspa=
ce
tools to read and write the BCLM threshold via sysfs, while automatically
keeping the cosmetic BFCL key synchronized.

> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index d0baa10502f7d..39276cdba3da7 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
[ ... ]
> @@ -724,6 +751,120 @@ static struct platform_driver applesmc_driver =3D {
>  	},
>  };
> =20
> +static int applesmc_bat_get_property(struct power_supply *psy,
[ ... ]
> +static int applesmc_bat_set_property(struct power_supply *psy,
> +				     const struct power_supply_ext *ext,
> +				     void *data,
> +				     enum power_supply_property psp,
> +				     const union power_supply_propval *val)
> +{
> +	u8 limit, led_limit;
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		if (val->intval < 20 || val->intval > 100)
> +			return -EINVAL;
> +
> +		limit =3D val->intval;
> +		ret =3D applesmc_write_key(BATTERY_CHARGE_LIMIT_KEY, &limit, 1);

[Severity: Low]
Are we required to use hwmon_lock() here? The hwmon subsystem guidelines
state that drivers must use hwmon_lock() and hwmon_unlock() to serialize
operations for attributes registered out-of-band. These power supply
extension callbacks seem to rely only on internal driver locks without invo=
king
the mandated hwmon API.

[Severity: Medium]
Could concurrent sysfs writes to the charge control threshold attribute cau=
se
the BCLM and BFCL keys to become desynchronized?

Since these two sequential writes happen without a unifying lock across the
entire function block, it appears that if two sysfs writes interleave, the
hardware could end up with mismatched keys, breaking the LED state machine.

> +		if (ret)
> +			return ret;
> +
> +		led_limit =3D limit > APPLESMC_BATTERY_CHARGE_LIMIT_LED_MARGIN ?
> +			limit - APPLESMC_BATTERY_CHARGE_LIMIT_LED_MARGIN : limit;
> +		applesmc_write_key(BATTERY_CHARGE_LIMIT_LED_KEY, &led_limit, 1);
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
[ ... ]
> +static const struct power_supply_ext applesmc_bat_ext =3D {
> +	.name			=3D "applesmc-charge-control",
> +	.properties		=3D applesmc_bat_props,
> +	.num_properties		=3D ARRAY_SIZE(applesmc_bat_props),
> +	.get_property		=3D applesmc_bat_get_property,
> +	.set_property		=3D applesmc_bat_set_property,
> +	.property_is_writeable	=3D applesmc_bat_property_is_writeable,
> +};

[Severity: Medium]
Does embedding this power supply extension natively inside the hwmon driver
violate the auxiliary device architecture mandate?=20

The subsystem guidelines indicate that secondary functionalities should be
isolated into auxiliary devices and placed in the appropriate subsystem
directory. By doing this here, the hwmon driver bypasses the auxiliary devi=
ce
framework and registers itself directly into the ACPI battery subsystem.

> +
> +static struct power_supply *applesmc_hooked_battery;
> +
> +static int applesmc_battery_add(struct power_supply *battery, struct acp=
i_battery_hook *hook)
> +{
> +	if (applesmc_hooked_battery)
> +		return 0;
> +
> +	applesmc_hooked_battery =3D battery;

[Severity: High]
Is there a potential data race on the applesmc_hooked_battery global pointer
here?

If concurrent battery hotplug events are triggered by the ACPI and SBS
subsystems, could two threads race during this lockless check-and-set seque=
nce?
It seems like both threads might register the extension, but only one would
ultimately be recorded in the global pointer. If that happens, would the
unrecorded extension be leaked and cause a use-after-free on module unload,
since applesmc_battery_remove() only unregisters the recorded battery?

> +	return power_supply_register_extension(battery, &applesmc_bat_ext, &pde=
v->dev, NULL);

[Severity: Low]
What happens if power_supply_register_extension() fails?=20

The global applesmc_hooked_battery pointer was already assigned just prior =
to
this call. Does this leave the pointer set on failure, such that the ACPI
battery hook core's removal hook will later invoke
power_supply_unregister_extension() on a never-registered extension and tri=
gger
a kernel warning?

> +}
> +
> +static int applesmc_battery_remove(struct power_supply *battery, struct =
acpi_battery_hook *hook)
> +{
> +	if (applesmc_hooked_battery !=3D battery)
> +		return 0;
> +
> +	power_supply_unregister_extension(battery, &applesmc_bat_ext);
> +	applesmc_hooked_battery =3D NULL;
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913231410.4169=
22-1-jordan@brough.org?part=3D2
