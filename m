Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239BC2DEA89
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785504020; cv=none; b=Fb9QyGcz0KyTYZZvFLY77c0e5EiZqfX+VCDtgBQvwKZdu2qjeQPGDmL1wS/t9aSqjSDxlmUbVjQL5FwCyTGNpdUkxQ0F2bzH0Cj9uBobuxNo5ZpvYK11Ul/YNoUTs5nJHQWmD72b+2aZe0Tkecsag6oSfjZYkpclF8VpPyH5j1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785504020; c=relaxed/simple;
	bh=xk334xli7LPlaFp/fFOEjS6uEwMpefiW02wzXonFPh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i0ghBl5ofRMo8BWrgzaaJDdHyB134P42cvW3CwBvY37vrU2MwBhcQhToR8QJLTllksNCZyR19ld8VRh2yj6QkVnofPinA/ZGCwySxHKKE7ErdNSi+6BLIDTKxwvy0Ty2ycCGH5Dm0Ln4ZzQG8tJty5IqZ1URRjHhVLBxtfiyIf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtZ8u0Zz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtZ8u0Zz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEC51F000E9;
	Fri, 31 Jul 2026 13:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785504019;
	bh=fjt94rgMlgs4B1M71pi/wZHYry3Gjw9/51nmY1RDlOw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JtZ8u0ZzhStGZ/ZJEU9AH45bN65HYLx8CPKv8w3MMNqLI95mTlc05nShukEG1Plmo
	 URRTPEgt4iDPC185cWc9HzjPdJn++2CfMN0TaSJux8QL86Q0LJ6WhpwU5U3jDpS95F
	 LAjiext8/OvbyyVzwUCWTtrGQqnM4mVK9a2oBCRygff1NVsrjNuupR5x8+2a/5ZrOV
	 PsCwO0sNzQkqysFEUBlam3U4AGwZ363xyI5QA1YfriOFo2X95cRNCkF5RLj3YQ1aN/
	 H9wapBSjTKd22vSE7giL2a6+Pr8tlJ9q3qrRXd9dN3pWAKTVrt1oPXtuAJdU7mXgvu
	 0MqEED0QmSoYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] Revert "thermal: hwmon: Use extra_groups for
 adding temperature attributes"
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <1992232.tdWV9SEqCh@rafael.j.wysocki>
References: <6319276.lOV4Wx5bFT@rafael.j.wysocki>
 <1992232.tdWV9SEqCh@rafael.j.wysocki>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 13:20:18 +0000
Message-Id: <20260731132018.CAEC51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Adding sysfs attributes via `device_create_file()` after device =
registration creates a race condition with userspace uevents.
--

--- Patch [1]: [PATCH v1 1/2] Revert "thermal: hwmon: Use extra_groups for =
adding temperature attributes" ---
commit fd1537461eb002e63315e0164251174bf300f7cc
Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Revert "thermal: hwmon: Use extra_groups for adding temperature attributes"

This reverts commit cfb5dc0f60fb because it was depended on by another comm=
it
that turned out to be problematic.

> diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hw=
mon.c
> index 386dfb9f559e3..223ae1571655b 100644
> --- a/drivers/thermal/thermal_hwmon.c
> +++ b/drivers/thermal/thermal_hwmon.c
[ ... ]
> @@ -120,13 +114,35 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_dev=
ice *tz)
>  	scnprintf(hwmon->name, THERMAL_HWMON_NAME_LENGTH, "%s_%d", tz->type, tz=
->id);
>  	strreplace(hwmon->name, '-', '_');
>  	hwmon->device =3D hwmon_device_register_for_thermal(&tz->device,
> -							  hwmon->name, hwmon,
> -							  thermal_hwmon_groups);
> +							  hwmon->name, hwmon);
>  	if (IS_ERR(hwmon->device)) {
> -		int result =3D PTR_ERR(hwmon->device);
> +		result =3D PTR_ERR(hwmon->device);
> +		goto free_mem;
> +	}
> =20
> -		kfree(hwmon);
> -		return result;
> +	temp =3D &hwmon->tz_temp;
> +
> +	temp->tz =3D tz;
> +
> +	temp->temp_input.attr.attr.name =3D "temp1_input";
> +	temp->temp_input.attr.attr.mode =3D 0444;
> +	temp->temp_input.attr.show =3D temp_input_show;
> +	sysfs_attr_init(&temp->temp_input.attr.attr);
> +	result =3D device_create_file(hwmon->device, &temp->temp_input.attr);

[Severity: Medium]
Does this sequence create a race condition with userspace uevents?=20

When thermal_add_hwmon_sysfs() calls hwmon_device_register_for_thermal(),
the device is registered and the KOBJ_ADD uevent fires immediately.

If userspace monitoring daemons or udev rules respond to this uevent and=20
read the hwmon device directory right away, they might query it before=20
device_create_file() finishes adding the temp1_input and temp1_crit=20
attributes.

Could this lead to missing sensor attributes in userspace during device
initialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6319276.lOV4Wx5bFT@=
rafael.j.wysocki?part=3D1
