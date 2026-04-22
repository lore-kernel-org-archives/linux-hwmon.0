Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4F23A1E9B
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827347; cv=none; b=aZaBuKFIw0TqQOVBqYRgGuOozjSapcUa0cgGUeNydzLgtVdcQeaB7O2niOpAtmuUfcUU4QcjA2iGX/FcenmujtMyaDpn5FCfj2Nv83kP/S4NHB3PTVnJuTk6W3WAcgzzeSHWD0/7FhVjYBRgLzb5J9sBpYdCR7MPt2s/AH4RMZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827347; c=relaxed/simple;
	bh=CXcOC8EpU2mlFVkaMvmVIcdfDN5KvtTohNiRWi0YLrE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Suayuyi4CiPz/gi1ubVag1Vm01nUDN0ZX1s8vWbkD7r88ze0qf+lCXSdsyiEyHXMPyVegvh1H2MAS9EQLZuYMfQkerlIY5IXstLKbzVBC8KDZh4nwLjByIFlteCkt5VvBnFFcHkIYtZiABiP3ozJKHNTRp+o9wHZgVBLAZx1tlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OK3yvufX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OK3yvufX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB79C2BCB0;
	Wed, 22 Apr 2026 03:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827345;
	bh=CXcOC8EpU2mlFVkaMvmVIcdfDN5KvtTohNiRWi0YLrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=OK3yvufXbKGroOLOjtzpUUQP2inTEooIsv8EUT3KKgPUC8QfQuSQ5yX/x2VGJYHhF
	 Fx6+edN4aAEjA2TR4++cqRAr/Wc9qFQNrdcIe9+TvGMSndH85TC9Uh02IoMTHvfwWq
	 qC2J2C9wfOJtRy33PsNIEeMJeZA0xOFkNioPBBnkyRyVlhjGW2ZPdInHkcdrJg1HRU
	 +lS2WjjgCNHIrE7uUQiU1JWoAzevJMsauBlCvBdrYaCTBI0f68rtBoYiQUleu7LPnN
	 Rbq1kBfmzTKD5rzCTZVjFczlQNYH/0KJbR/KvuMh3dzceoy4lwX1+b1KAbyVGrs4Zl
	 GxCF65YX1SMoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/23] cpu/hotplug: Add a new cpuhp_offline_cb() API
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: linux-hwmon@vger.kernel.org, hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com
In-Reply-To: <20260421030351.281436-19-longman@redhat.com>
References: <20260421030351.281436-19-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:09:05 +0000
Message-Id: <20260422030905.8FB79C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 4 potential issue(s):
- [High] Early loop break in the rollback path leaves successfully offlined=
 CPUs permanently offline.
- [High] Race condition in the `device_online()` retry loop bypasses recove=
ry if hotplug is re-enabled immediately.
- [High] Hardcoded 100ms timeout for `cpu_hotplug_disabled` is brittle due =
to lock dropping, leading to permanently stranded CPUs.
- [Medium] Time-of-check to time-of-use (TOCTOU) race on `cpu_online_mask` =
validation triggers spurious kernel warnings and API failure.
--

commit ebe2a08265b3e2e79b0d74906f6ed951ac37520b
Author: Waiman Long <longman@redhat.com>

cpu/hotplug: Add a new cpuhp_offline_cb() API

This patch introduces the cpuhp_offline_cb() API to offline a set of CPUs,
execute a callback function, and then bring them back online. It allows
runtime adjustment of command line options like nohz_full and isolcpus.
A new flag, cpuhp_offline_cb_mode, is added to optimize hotplug operations
while the system is in this transient state.

> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index 0d02b5d7a7baf..9b32f742cd1da 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -1520,6 +1520,76 @@ int remove_cpu(unsigned int cpu)
>  }
>  EXPORT_SYMBOL_GPL(remove_cpu);
> =20
> +bool cpuhp_offline_cb_mode;
> +
> +/**
> + * cpuhp_offline_cb - offline CPUs, invoke callback function & online CP=
Us afterward
> + * @mask: A mask of CPUs to be taken offline and then online
> + * @func: A callback function to be invoked while the given CPUs are off=
line
> + * @arg:  Argument to be passed back to the callback function
> + *
> + * Return: 0 if successful, an error code otherwise
> + */
> +int cpuhp_offline_cb(struct cpumask *mask, cpuhp_cb_t func, void *arg)
> +{
> +	int off_cpu, on_cpu, ret, ret2 =3D 0;
> +
> +	if (WARN_ON_ONCE(cpumask_empty(mask) ||
> +	   !cpumask_subset(mask, cpu_online_mask)))
> +		return -EINVAL;

Since the mask validation checks cpu_online_mask before acquiring
lock_device_hotplug(), could a concurrent user-initiated sysfs CPU offline
operation remove a CPU from cpu_online_mask after the caller generates the
mask? This would trigger a spurious WARN_ON_ONCE and fail with -EINVAL.
Should this validation be moved under the hotplug lock?

> +
> +	pr_debug("%s: begin (CPU list =3D %*pbl)\n", __func__, cpumask_pr_args(=
mask));
> +	lock_device_hotplug();
> +	cpuhp_offline_cb_mode =3D true;

[ ... ]

> +	/* Bring previously offline CPUs back online */
> +	for_each_cpu(on_cpu, mask) {
> +		int retries =3D 0;
> +
> +		if (on_cpu =3D=3D off_cpu)
> +			break;
> +
> +retry:
> +		ret2 =3D device_online(get_cpu_device(on_cpu));
> +
> +		/*
> +		 * With the unlikely event that CPU hotplug is disabled while
> +		 * this operation is in progress, we will need to wait a bit
> +		 * for hotplug to hopefully be re-enabled again. If not, print
> +		 * a warning and return the error.
> +		 *
> +		 * cpu_hotplug_disabled is supposed to be accessed while
> +		 * holding the cpu_add_remove_lock mutex. So we need to
> +		 * use the data_race() macro to access it here.
> +		 */
> +		while ((ret2 =3D=3D -EBUSY) && data_race(cpu_hotplug_disabled) &&
> +		       (++retries <=3D 5)) {

If device_online() returns -EBUSY, but another thread re-enables CPU hotplug
right before the while loop condition is evaluated,
data_race(cpu_hotplug_disabled) will evaluate to false. Doesn't this
short-circuit the loop entirely, leaving ret2 =3D=3D -EBUSY and bypassing t=
he
retry mechanism exactly when recovery would have succeeded?

Additionally, is the hardcoded 100ms (5 * 20ms) timeout sufficient?
Concurrent paths like PCI probing or idle injection might hold the
cpu_add_remove_lock for several seconds via cpu_hotplug_disable(). If the
timeout expires during the online phase, won't this abort the API and
permanently abandon the CPUs in an offline state?

> +			msleep(20);
> +			if (!data_race(cpu_hotplug_disabled))
> +				goto retry;
> +		}
> +		if (ret2) {
> +			pr_warn("%s: Failed to bring CPU %d back online!\n",
> +				__func__, on_cpu);
> +			break;

If device_online() fails to bring a CPU back online and breaks out of the
loop here, doesn't it prematurely exit the restoration loop? This would skip
any remaining CPUs in the mask that were successfully taken offline, leaving
them permanently offline and reducing system capacity. Should this use
continue instead of break to ensure all offlined CPUs have a chance to be
restored?

> +		}
> +	}
> +	cpuhp_offline_cb_mode =3D false;
> +	unlock_device_hotplug();
> +	pr_debug("%s: end\n", __func__);
> +	return ret ? ret : ret2;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D18
