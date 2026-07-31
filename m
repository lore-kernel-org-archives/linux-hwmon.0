Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AB31DF248
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785503968; cv=none; b=Qgt9Mcvr/lFHDx48oJ4Mjw6Dr24HKWP8myOPD4ydvOKUR7+4fkTsOxoMBaN5lzYtzIAINuCrCw+1jsklNDAB91apnIMvuG3TN2CrQec7tJn0vGHo+LtmRdeDyHgCNBd/LvZwQcR5qTkp0A5v2LKTAONNx5nvnzDMl0MXAZV6g7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785503968; c=relaxed/simple;
	bh=aDbkyhhGTmIB5Y+WHxx8eiNcEMAMOhyPCWsP/qAJmC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L9RfN2zDqVhJNIGdBMEZsKL/2jTjfZ7n0JACS7xCNnJ4psG+Lanvd5/RzPO9XoPjTU7Wl2YzGov3z5dtEjtZidVEje3ZTNEElqa5OvEm7Gr2hIqMlaBd522IHKsnVTfucdDPT0yZFQ45D3EuHxn3S+zycSIXlSXRs8uZunnT4Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oebWA6k1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oebWA6k1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9081F000E9;
	Fri, 31 Jul 2026 13:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785503967;
	bh=wTG5gJkiTKfrd7VrN5PlAZj23qsjiLhydHzrbW3fPIU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oebWA6k1Fxj0Au0/zmAFwwZaE7WFbNZiS4bDhTidcbO5AVhgXUuHaJ9T9tJkzsY8J
	 YfugUZbXdHqmHTrUGdJLJqaV+/6muIN/8cl1AqHRBZC+nYuqnLTV3dbKx6exYzkqvD
	 iWjmyObLA0vLDGD8scZIAjymSSVg4r+2Yx3lStPH6MwgPaIsq9r1BY5VW06MIizdSf
	 +5byqA2Vgr0q8Yq9+8BpEwiZEo1fxj2eIhfkrBJ4+ziQFx5dzgzALFwOPG0b1QJA22
	 UfTIMzgWG/yw3RGN0r1DuQd1AbYRCj4Reww4q6VIZ49GtiF05QNPN+E88Ope7l0DQi
	 UQdIPsLM8ywXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] Revert "thermal: hwmon: Register a hwmon device
 for each thermal zone"
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <2301040.irdbgypaU6@rafael.j.wysocki>
References: <6319276.lOV4Wx5bFT@rafael.j.wysocki>
 <2301040.irdbgypaU6@rafael.j.wysocki>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 13:19:26 +0000
Message-Id: <20260731131926.BB9081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The error handling path in `thermal_add_hwmon_sysfs()` uncondition=
ally frees a shared `hwmon` device, causing a Use-After-Free vulnerability.
- [High] Lack of reference counting and inadequate lock scope for shared `h=
wmon` devices lead to TOCTOU races, duplicate device registration, and Use-=
After-Free vulnerabilities.
- [Medium] Unprotected concurrent modification of `hwmon->count` causes dat=
a races and sysfs file name collisions.
--

--- Patch [2]: [PATCH v1 2/2] Revert "thermal: hwmon: Register a hwmon devi=
ce for each thermal zone" ---
commit 811b1574f43c922402d0fcdcdca33812b6bd90b8
Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Revert "thermal: hwmon: Register a hwmon device for each thermal zone"

This commit reverts a previous change to thermal zone hwmon device names and
sysfs layout, restoring the behavior where thermal zone devices with the sa=
me
type share one hwmon device.

Link: https://lore.kernel.org/linux-pm/cafd8af9-c6e9-4bf2-b496-23e796fbc9a6=
@linux.dev/
Link: https://lore.kernel.org/linux-hwmon/ab8b093b-46e6-4738-afcf-4b97c9ad5=
af9@googlemail.com/

> diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hw=
mon.c
> index 223ae1571655b..597c33c8a5550 100644
> --- a/drivers/thermal/thermal_hwmon.c
> +++ b/drivers/thermal/thermal_hwmon.c

[ ... ]

> @@ -91,6 +88,45 @@ temp_crit_show(struct device *dev, struct device_attri=
bute *attr, char *buf)
>  	return sysfs_emit(buf, "%d\n", temperature);
>  }
> =20
> +
> +static struct thermal_hwmon_device *
> +thermal_hwmon_lookup_by_type(const struct thermal_zone_device *tz)
> +{
> +	struct thermal_hwmon_device *hwmon;
> +	char type[THERMAL_NAME_LENGTH];
> +
> +	mutex_lock(&thermal_hwmon_list_lock);
> +	list_for_each_entry(hwmon, &thermal_hwmon_list, node) {
> +		strscpy(type, tz->type);
> +		strreplace(type, '-', '_');
> +		if (!strcmp(hwmon->type, type)) {
> +			mutex_unlock(&thermal_hwmon_list_lock);
> +			return hwmon;

[Severity: High]
Does this introduce a race condition resulting in a use-after-free?

If a thread calls thermal_hwmon_lookup_by_type(), the lock is dropped before
returning the shared hwmon pointer. If another thread concurrently removes =
the
last thermal zone for this type via thermal_remove_hwmon_sysfs(), it could
free the hwmon device while the first thread is still executing
thermal_add_hwmon_sysfs().

Would it be safer to hold a reference count on the shared hwmon object befo=
re
dropping thermal_hwmon_list_lock?

> +		}
> +	}
> +	mutex_unlock(&thermal_hwmon_list_lock);
> +
> +	return NULL;
> +}
> +

[ ... ]

> @@ -101,39 +137,54 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_dev=
ice *tz)

[ ... ]

> + register_sys_interface:
> +	temp =3D kzalloc_obj(*temp);
> +	if (!temp) {
> +		result =3D -ENOMEM;
> +		goto unregister_name;
> +	}
> +
> +	temp->tz =3D tz;
> +	hwmon->count++;
> +
> +	snprintf(temp->temp_input.name, sizeof(temp->temp_input.name),
> +		 "temp%d_input", hwmon->count);

[Severity: Medium]
Is it possible for concurrent probes to race on hwmon->count?

If two threads execute thermal_add_hwmon_sysfs() for the same thermal zone
type simultaneously, they could increment hwmon->count outside of any lock.
Could this lead to both threads formatting identical sysfs attribute names
and causing device_create_file() to fail with -EEXIST?

> +	temp->temp_input.attr.attr.name =3D temp->temp_input.name;
> +	temp->temp_input.attr.attr.mode =3D 0444;

[ ... ]

> @@ -145,17 +196,21 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_dev=
ice *tz)

[ ... ]

>   unregister_input:
>  	device_remove_file(hwmon->device, &temp->temp_input.attr);
> + free_temp_mem:
> +	kfree(temp);
>   unregister_name:
> -	hwmon_device_unregister(hwmon->device);
> +	if (new_hwmon_device)
> +		hwmon_device_unregister(hwmon->device);
>   free_mem:
>  	kfree(hwmon);

[Severity: High]
Will this unconditionally free the shared hwmon object on an error path?

If new_hwmon_device is 0 (meaning the hwmon device was found via
thermal_hwmon_lookup_by_type and is shared), and an error occurs during sys=
fs
file creation, execution jumps to free_mem. Calling kfree(hwmon) here would
destroy the shared object while it is still in use by other thermal zones.

Should this kfree() be conditional on new_hwmon_device being true?

> -	return 0;
> +	return result;
>  }
>  EXPORT_SYMBOL_GPL(thermal_add_hwmon_sysfs);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6319276.lOV4Wx5bFT@=
rafael.j.wysocki?part=3D2
