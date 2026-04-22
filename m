Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1D93A1697
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827348; cv=none; b=GmFzBT725hsUMj3IEDnDFWlZwLkl5UquUbAmFz03t1sr8GXM45oBYxdy2VFgYPh9ABZMyTyknt0CDoa8rGd6wCGi1acVRn5AaXoyMsbnaj5GDMwm8jCrYJWOuy7V7UWgfcAXBK2IFYhUN8E/z3vh3y+RHEzcPf49GJ8a7ZeSD0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827348; c=relaxed/simple;
	bh=hP+iiIIku2MrV/xIeM7/5MqKjWpD9hgA9ekphVmkHzs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P8CMyt3dG5sP+jTdM6blKX6Z1oHVos2akdb/sCIL159PBr6ogLiyVyMyRiJqtZrWSbKJ1On7mKyDj1xEG7XXjNdbY4JXNiDhDkRZ+DQGkHjf9f8Y56hQ9fNC3h5SA4uw6rrX+FCzv3PWe100H3r6HTdz3cxVyYhBp3ToKixkHjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXWqNVEB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXWqNVEB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7662AC2BCB6;
	Wed, 22 Apr 2026 03:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827346;
	bh=hP+iiIIku2MrV/xIeM7/5MqKjWpD9hgA9ekphVmkHzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YXWqNVEBT4pFsv0ksuxcC9719o7E+31IGmJOujEuPXZ+9bvxPw2h6sY0nIzgL0GR+
	 lIn7tOc/epDyHCPqWTJgvEWjEOQd6Dyx+7KVcBReKqjeYbBHsx8o/FNE4yr88dtG43
	 4drqbkTyKuf8MkGb4zRF2e90AC5dq/Smo2JKZZO3pSrv1DYizxp1vTTZ83kE3SgNE/
	 6XmtwanjjznY5YZglJjveQ4WL2S0zgVZdIzoqMWOoE2ebw5U26Ca8649VWG0BO6jqE
	 gQcFl7c3YL+acUWCe7h8yEnq7DvF4gDCoPFW7NFd393U5dsvGdbVMeSv1g6G7C4kAj
	 H27tydlDN+jBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 20/23] cgroup/cpuset: Enable runtime update of
 HK_TYPE_{KERNEL_NOISE,MANAGED_IRQ} cpumasks
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: tj@kernel.org, linux-hwmon@vger.kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
In-Reply-To: <20260421030351.281436-21-longman@redhat.com>
References: <20260421030351.281436-21-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:09:05 +0000
Message-Id: <20260422030906.7662AC2BCB6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 6 potential issue(s):
- [High] Stale mask used for DOMAIN isolation when `tick_nohz_full_enabled(=
)` is false, permanently breaking CPU isolation updates.
- [High] Dynamic CPU de-isolation fails silently for `HK_TYPE_KERNEL_NOISE`=
 and `HK_TYPE_MANAGED_IRQ` masks, causing isolated CPUs to grow monotonical=
ly.
- [High] Lack of rollback on `housekeeping_update()` or hotplug failures ca=
uses unrecoverable state desynchronization.
- [High] `cpuset_nohz_update_cbfunc()` silently swallows the return value o=
f `housekeeping_update()`, hiding failures from the hotplug callback.
- [High] Housekeeping updates triggered by partition invalidations are perm=
anently lost during CPU offline callbacks.
- [Medium] TOCTOU race when reading `cpu_online_mask` after dropping `cpus_=
read_lock()` leads to potential hotplug abortion and state inconsistency.
--

commit 35eda8af3da1589e50363cd927f6b3b902b398a2
Author: Waiman Long <longman@redhat.com>
Subject: cgroup/cpuset: Enable runtime update of HK_TYPE_{KERNEL_NOISE,MANA=
GED_IRQ} cpumasks

This commit enables runtime updates for KERNEL_NOISE and MANAGED_IRQ
housekeeping cpumasks. It uses CPU hotplug to facilitate transitioning CPUs
into and out of isolated states when a nohz_full boot parameter is provided.

> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 1b0c50b46a49c..a927b9cd4f718 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c

[ ... ]

> @@ -1328,29 +1336,67 @@ static bool prstate_housekeeping_conflict(int prs=
tate, struct cpumask *new_cpus)
>  	return false;
>  }
> =20
> +static int cpuset_nohz_update_cbfunc(void *arg)
> +{
> +	struct cpumask *isol_cpus =3D (struct cpumask *)arg;
> +
> +	if (isol_cpus)
> +		housekeeping_update(isol_cpus, BIT(HK_TYPE_KERNEL_NOISE));
> +	return 0;
> +}

Is it intentional to discard the return value of housekeeping_update() here?
If housekeeping_update() fails, returning 0 will cause cpuhp_offline_cb()
to assume success, potentially hiding failures from the hotplug callback.

[ ... ]

> +	/*
> +	 * Update isolated_nohz_cpus/isolated_mirq_cpus if necessary
> +	 */
> +	if (!boot_nohz_le_domain) {
> +		cpumask_andnot(cpus, cpu_possible_mask,
> +			       housekeeping_cpumask(HK_TYPE_KERNEL_NOISE));
> +		cpumask_or(cpus, cpus, isolated_cpus);

Could this prevent dynamic CPU de-isolation? Because housekeeping_cpumask()
returns the current runtime mask rather than the boot mask, the newly
isolated CPUs remain in the mask when cpumask_or() is called. This might
cause isolated CPUs to grow monotonically rather than allowing removal.

> +		update_nohz =3D !cpumask_equal(isolated_nohz_cpus, cpus);
> +		if (update_nohz)
> +			cpumask_copy(isolated_nohz_cpus, cpus);

If a failure occurs later in this function, these tracking masks are updated
but the state is not. For example, if cpuhp_offline_cb() fails, the code
jumps to out_free. If userspace then retries the operation, won't it see
cpumask_equal(isolated_cpus, isolated_hk_cpus) as true and return early,
leaving the system permanently out of sync?

[ ... ]

> @@ -1360,10 +1406,103 @@ static void cpuset_update_sd_hk_unlock(void)
>  	 */
>  	mutex_unlock(&cpuset_mutex);
>  	cpus_read_unlock();

[ ... ]

> +		/*
> +		 * Mask out offline CPUs in cpus
> +		 * If there is no online CPUs, we can call
> +		 * housekeeping_update() directly if needed.
> +		 */
> +		cpumask_and(cpus, cpus, cpu_online_mask);

Can this race with CPU hotplug operations? The cpus_read_lock was released
earlier in this function. If a CPU is offlined concurrently right after this
check, cpuhp_offline_cb() might be passed a CPU that is no longer online,
potentially causing the hotplug loop to abort.

[ ... ]

> +/*
> + * cpuset_update_sd_hk_unlock - Rebuild sched domains, update HK & unlock
> + *
> + * Update housekeeping cpumasks and rebuild sched domains if necessary a=
nd
> + * then do a cpuset_full_unlock().
> + * This should be called at the end of cpuset operation.
> + */
> +static void cpuset_update_sd_hk_unlock(void)
> +	__releases(&cpuset_mutex)
> +	__releases(&cpuset_top_mutex)
> +{
> +	/* force_sd_rebuild will be cleared in rebuild_sched_domains_locked() */
> +	if (force_sd_rebuild)
> +		rebuild_sched_domains_locked();
> +
> +	update_housekeeping =3D false;
> +
> +	if (cpumask_equal(isolated_cpus, isolated_hk_cpus)) {
> +		cpuset_full_unlock();
> +		return;
> +	}
> +
> +	if (!tick_nohz_full_enabled()) {
> +		/*
> +		 * housekeeping_update() is now called without holding
> +		 * cpus_read_lock and cpuset_mutex. Only cpuset_top_mutex
> +		 * is still being held for mutual exclusion.
> +		 */
> +		mutex_unlock(&cpuset_mutex);
> +		cpus_read_unlock();
> +		WARN_ON_ONCE(housekeeping_update(isolated_hk_cpus,
> +						 BIT(HK_TYPE_DOMAIN)));

Are we passing a stale mask here? If tick_nohz_full_enabled() is false, we
skip calling cpuset_update_housekeeping_unlock(), which means
isolated_hk_cpus is never updated to match isolated_cpus. Subsequent checks
for cpumask_equal(isolated_cpus, isolated_hk_cpus) will continue to fail,
and the new mask is never applied to the DOMAIN isolation.

> +		mutex_unlock(&cpuset_top_mutex);
> +	} else {
> +		cpuset_update_housekeeping_unlock();
> +	}
> +}

[ ... ]

> @@ -3954,7 +4116,10 @@ static void cpuset_handle_hotplug(void)
>  	 */
>  	if (force_sd_rebuild)
>  		rebuild_sched_domains_cpuslocked();
> -	if (update_housekeeping)
> +	/*
> +	 * Don't need to update housekeeping cpumasks in cpuhp_offline_cb mode.
> +	 */
> +	if (update_housekeeping && !cpuhp_offline_cb_mode)
>  		queue_work(system_dfl_wq, &hk_sd_work);
> =20
>  	free_tmpmasks(ptmp);

Does this cause housekeeping updates to be lost? If a CPU is offlined and
it invalidates a cpuset partition, update_housekeeping is set to true. If we
skip queuing the work here because cpuhp_offline_cb_mode is true, there
doesn't appear to be a mechanism to retroactively process the pending flag
once the bounce cycle completes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D20
