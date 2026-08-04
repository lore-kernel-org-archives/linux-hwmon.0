Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DE142B756
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 20:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875097; cv=none; b=ebAofgDxheOFulv0y3cDu5AGmMedEOXdpF35YaUX21+JtENun32G+uC9BBrZEOP/P96JDEdSvYhKkx7RRfItz3MQtwQpNgaLqbmUzUv/l2vEOX43vZ7X3aa/tMYURlY4QFBDRh4QFCAU+GLQZBjaV7v8ODKcxRPUdRH4Lz8ocx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875097; c=relaxed/simple;
	bh=z/uykjnAVuc1t/c90RAcJUJY4zoUr69cKbcnsRs2nEM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TAAC+Hwn+Iymyw5QV4sDEEJmdiY6EFGLDJQJTH3L4AOtnAAalLM6YBgAIXzAP7nxYDJkuED7sQpOAtKRV4117nJs4wLYVjm/n1ENipdzjfcypCvvn2CseUyPck9/dDFE7u368pGknDroD+ZOvkxdydwEnrjKeCG4B6oGZJEzyks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FB5tebUW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FB5tebUW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359C21F000E9;
	Tue,  4 Aug 2026 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785875092;
	bh=ZtRNYmPSO51YKz2J7fH+W5taqJuxS1UFpSVoan0nveE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FB5tebUW59tPJFMEP0444gsxbIjYR4Q4SIIKGHLbvRN3E9VIR6qUjY4+ogLtmjwC+
	 j4+0Lst+Ncln7r/hQORQWQh8wj8QxYfM59Ni8FGTHu98v2vtXXQwb4T6uYdhm487lA
	 q+18pwbFyyWZLOtEwijnVt/16x626KBTtYZgrfHVjHzbg2CmoCnR615NrdxdoKDH2R
	 dd6rVZMcCE51naZKTpre1BxPg1Uk48owlfk6jMuIaF9WoXcHq2ITeTk3PKOW+vLGzb
	 TSNk1i6hxJR62tSJsmzrJ57HjGI6ePlVOiESbqmsDo5zRV2dtDSanyeEjlIPwR9ULY
	 SQLIZPpYtDsMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] Revert "thermal/drivers/hwmon: Cleanup coding
 style a bit"
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <5123895.31r3eYUQgx@rafael.j.wysocki>
References: <12947893.O9o76ZdvQC@rafael.j.wysocki>
 <5123895.31r3eYUQgx@rafael.j.wysocki>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 20:24:51 +0000
Message-Id: <20260804202452.359C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lack of synchronization during hwmon device lookup and creation re=
sults in Use-After-Free of `hwmon` and Time-of-Check to Time-of-Use (TOCTOU=
) list duplication.
- [High] The hwmon sysfs attribute callbacks do not use `hwmon_lock()` as r=
equired by the subsystem guidelines.
--

--- Patch [1]: [PATCH v2 1/2] Revert "thermal/drivers/hwmon: Cleanup coding=
 style a bit" ---
commit 85ae4605921a40cd95c1000cfc56b0df8bf8c9f1
Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Subject: Revert "thermal/drivers/hwmon: Cleanup coding style a bit"

Reverts a commit that introduced a use-after-free in the error path of
thermal_add_hwmon_sysfs() by removing a valid check.

Link: https://lore.kernel.org/linux-hwmon/20260803183915.4ED7D1F000E9@smtp.=
kernel.org/

> diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hw=
mon.c
> index 597c33c8a5550..ec73d03a1e60a 100644
> --- a/drivers/thermal/thermal_hwmon.c
> +++ b/drivers/thermal/thermal_hwmon.c
> @@ -212,7 +212,8 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_devic=
e *tz)
>  	if (new_hwmon_device)
>  		hwmon_device_unregister(hwmon->device);
>   free_mem:
> -	kfree(hwmon);
> +	if (new_hwmon_device)
> +		kfree(hwmon);
> =20
>  	return result;
>  }

[Severity: High]
This is a pre-existing issue, but is there a use-after-free and TOCTOU race
when looking up and adding a new hwmon device?

If one thread calls thermal_add_hwmon_sysfs() and looks up the hwmon device
via thermal_hwmon_lookup_by_type(), the list lock is dropped and an
unrefcounted pointer is returned:

drivers/thermal/thermal_hwmon.c:thermal_hwmon_lookup_by_type() {
    ...
		if (!strcmp(hwmon->type, type)) {
			mutex_unlock(&thermal_hwmon_list_lock);
			return hwmon;
		}
    ...
}

Concurrently, another thread could call thermal_remove_hwmon_sysfs() for the
last thermal zone sharing that hwmon device. It removes the last entry,
drops the list lock, unregisters the device, and frees the hwmon pointer
without synchronizing with active readers:

drivers/thermal/thermal_hwmon.c:thermal_remove_hwmon_sysfs() {
    ...
	if (!list_empty(&hwmon->tz_list)) {
		mutex_unlock(&thermal_hwmon_list_lock);
		return;
	}
	list_del(&hwmon->node);
	mutex_unlock(&thermal_hwmon_list_lock);

	hwmon_device_unregister(hwmon->device);
	kfree(hwmon);
}

The first thread could then resume in thermal_add_hwmon_sysfs() and
dereference the freed pointer when incrementing the count:

drivers/thermal/thermal_hwmon.c:thermal_add_hwmon_sysfs() {
    ...
 register_sys_interface:
	temp =3D kzalloc_obj(*temp);
	if (!temp) {
		result =3D -ENOMEM;
		goto unregister_name;
	}

	temp->tz =3D tz;
	hwmon->count++;
    ...
}

Could this lead to memory corruption during concurrent device probing or
unbinding?

[Severity: High]
This is a pre-existing issue, but do the hwmon sysfs attribute callbacks
need to use hwmon_lock() and hwmon_unlock() wrappers?

The hwmon subsystem guidelines require drivers to implement locking for
attributes registered by other means than hwmon_device_register_with_info().

The temp_input_show() and temp_crit_show() callbacks read attributes direct=
ly
without the required lock:

drivers/thermal/thermal_hwmon.c:temp_input_show() {
    ...
	struct thermal_zone_device *tz =3D temp->tz;

	ret =3D thermal_zone_get_temp(tz, &temperature);
    ...
}

drivers/thermal/thermal_hwmon.c:temp_crit_show() {
    ...
	struct thermal_zone_device *tz =3D temp->tz;
	int temperature;
	int ret;

	guard(thermal_zone)(tz);

	ret =3D tz->ops.get_crit_temp(tz, &temperature);
    ...
}

Could this result in a race condition with interrupt handlers or driver
unregistration since it bypasses the core kernel locking rules for the hwmon
subsystem?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/12947893.O9o76ZdvQC=
@rafael.j.wysocki?part=3D1
