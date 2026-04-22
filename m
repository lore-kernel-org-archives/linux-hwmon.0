Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D180A33987F
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 22:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776895624; cv=none; b=mkoShWj8ei1da565N2yDClfa1ztLIg8+sKDCQ63MP6ARk5+oDzD0VZ1lkxA8noRIhxnDPTYfZNAcfhp8pwRSJROTIEb3IURlqaI1Bd0TmqOZnSNuOCzHKJPtKdNF4VkZEOwNEK+wQOE30bwWIvuvIUYmWnloHhfASrHfFqnOfsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776895624; c=relaxed/simple;
	bh=7dkfqZ2QLufa7LNB2J/Ggxkz1VIc9Esfwth4K6XRvb0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wns+Uvx0EA53NQFLPEQdDK7MLyz5NLwD/HXWCyQUDhUzbqfw8gauTJIzAi5j27cx/ltjyUto6od5juDNr10a+MxeY9xpdErO6pMmT+NxUPzyPp9YIX7wx39Zd26RD3V5Sa4VgZ5iaNMlfgHtqqtd2uBhtTieRr7Ed4owj3iJU60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6ZwphJ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6ZwphJ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5F5C19425;
	Wed, 22 Apr 2026 22:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776895624;
	bh=7dkfqZ2QLufa7LNB2J/Ggxkz1VIc9Esfwth4K6XRvb0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=M6ZwphJ9rxAE47QB+gLRMT52sGdOdf2mb5WyTUziqMl17kQ0G1hnByh/e9g3qssl2
	 e+g1OIiolRVnIm7HxkRhzhO3n9Aev42gO9vOVEFXMJR3o1+5BudI9kmq7wPtjXDQIu
	 +Z5P4y3oernl+z63No4WymetTOB3YKmNJFx+VwSlOYDhGgYrSKHjxWE/g3bQzQauKM
	 epsbAqTykS+HSoyU3UNO4AtGJBHFK2346N9NhaIH2k37PU2Yjyi2DX6Hy90+z3R7wy
	 1dKtZJLBaFoZGlFVMXV6IrMtRnbFEuzqGT+MSVx7F7LNEHFS7CjSQupolS7bAGYa64
	 uPi0STpCi1x6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] thermal: hwmon: Register one hwmon device for
 each thermal zone
Reply-To: sashiko@lists.linux.dev
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <2413681.ElGaqSPkdT@rafael.j.wysocki>
References: <2413681.ElGaqSPkdT@rafael.j.wysocki>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 22:07:03 +0000
Message-Id: <20260422220704.5E5F5C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 5 potential issue(s):
- [Critical] UAPI Breakage by changing existing hwmon device names
- [High] Buffer truncation during hwmon name construction defeats disambigu=
ation
- [High] Kernel panic during thermal zone removal due to conditionally re-e=
valuating hardware-dependent state
- [Medium] Subsystem Guideline Violation: Mixing goto and scoped_guard
- [Low] Unused dead code (hwmon_node) left in struct thermal_hwmon_temp
--

commit 7f75c80d7fc0d5195ae6453505545af64be540ea
Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Subject: thermal: hwmon: Register one hwmon device for each thermal zone

The commit reworks the thermal hwmon code to register one hwmon device for =
each
thermal zone. It appends the thermal zone ID to the hwmon device name to
disambiguate identical names.

Link: https://lore.kernel.org/linux-pm/20260402021828.16556-1-liujia6264@gm=
ail.com/

> diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hw=
mon.c
> index b624892bc6d66..46c40c0852804 100644
> --- a/drivers/thermal/thermal_hwmon.c
> +++ b/drivers/thermal/thermal_hwmon.c
[ ... ]
> @@ -136,21 +95,17 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_devi=
ce *tz)
[ ... ]
>  	hwmon =3D kzalloc_obj(*hwmon);
>  	if (!hwmon)
>  		return -ENOMEM;
> =20
> -	INIT_LIST_HEAD(&hwmon->tz_list);
> -	strscpy(hwmon->type, tz->type, THERMAL_NAME_LENGTH);
> +	/*
> +	 * Append the thermal zone ID preceded by an underline character to the
> +	 * type to disambiguate the sensors command output.
> +	 */
> +	scnprintf(hwmon->type, THERMAL_NAME_LENGTH, "%s_%d", tz->type, tz->id);

Could this truncation defeat the disambiguation? hwmon->type is defined as
char type[THERMAL_NAME_LENGTH]. If tz->type is already near
THERMAL_NAME_LENGTH characters long, the appended _%d suffix would be
truncated to fit the buffer, potentially resulting in identical names for
different zones.

Can appending a suffix to the name break the userspace ABI? Existing
user-space utilities and configurations that match exactly on the original
zone type string might no longer work when _0 is appended to the name.

>  	strreplace(hwmon->type, '-', '_');
>  	hwmon->device =3D hwmon_device_register_for_thermal(&tz->device,
>  							  hwmon->type, hwmon);
[ ... ]
> @@ -193,21 +137,17 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_dev=
ice *tz)
>  			goto unregister_input;
>  	}
> =20
> -	mutex_lock(&thermal_hwmon_list_lock);
> -	if (new_hwmon_device)
> +	/* The list is needed for hwmon lookup during removal. */
> +	scoped_guard(mutex, &thermal_hwmon_list_lock) {
>  		list_add_tail(&hwmon->node, &thermal_hwmon_list);
> -	list_add_tail(&temp->hwmon_node, &hwmon->tz_list);

Since hwmon->tz_list is removed, does temp->hwmon_node still need to exist
in struct thermal_hwmon_temp? It looks like it is no longer used anywhere.

> -	mutex_unlock(&thermal_hwmon_list_lock);
> +	}
> =20
>  	return 0;
> =20
>   unregister_input:
>  	device_remove_file(hwmon->device, &temp->temp_input.attr);
> - free_temp_mem:
> -	kfree(temp);
>   unregister_name:
> -	if (new_hwmon_device)
> -		hwmon_device_unregister(hwmon->device);
> +	hwmon_device_unregister(hwmon->device);
>   free_mem:
>  	kfree(hwmon);

Does this code mix goto-based error handling and scope-based cleanup helper=
s?
The cleanup subsystem guidelines expect that usage of goto and cleanup
helpers are never mixed in the same function.

This was noted as being fixed later in the series, but is included here
for completeness.

> =20
> @@ -215,39 +155,37 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_dev=
ice *tz)
[ ... ]
>  void thermal_remove_hwmon_sysfs(struct thermal_zone_device *tz)
>  {
>  	struct thermal_hwmon_device *hwmon;
>  	struct thermal_hwmon_temp *temp;
> =20
> -	hwmon =3D thermal_hwmon_lookup_by_type(tz);
> -	if (unlikely(!hwmon)) {
> -		/* Should never happen... */
> -		dev_dbg(&tz->device, "hwmon device lookup failed!\n");
> -		return;
> -	}
> +	scoped_guard(mutex, &thermal_hwmon_list_lock) {
> +		hwmon =3D thermal_hwmon_lookup(tz);
> +		if (!hwmon)
> +			return;
> =20
> -	temp =3D thermal_hwmon_lookup_temp(hwmon, tz);
> -	if (unlikely(!temp)) {
> -		/* Should never happen... */
> -		dev_dbg(&tz->device, "temperature input lookup failed!\n");
> -		return;
> +		list_del(&hwmon->node);
>  	}
> =20
> +	temp =3D &hwmon->tz_temp;
> +
>  	device_remove_file(hwmon->device, &temp->temp_input.attr);
>  	if (thermal_zone_crit_temp_valid(tz))
>  		device_remove_file(hwmon->device, &temp->temp_crit.attr);

Is there a potential panic during removal if the hardware state changes?

If thermal_zone_crit_temp_valid() fails during thermal_add_hwmon_sysfs()
initialization, the temp_crit attribute is never created and its name
remains NULL.

If the hardware state later recovers and thermal_zone_crit_temp_valid()
returns true during thermal_remove_hwmon_sysfs(), device_remove_file()
will be called with a NULL name, which can cause a panic in the sysfs core.

This issue was also noted as being fixed later in the series.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/5100596.31r3eYUQgx@=
rafael.j.wysocki?part=3D1
