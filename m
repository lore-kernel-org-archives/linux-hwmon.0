Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E7A3921E7
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827347; cv=none; b=hjzBaqlYe/27agxLqsjm6e13/5RrP2r2I447IUz8z0jyumj32lIjgqRXqSutqD8jy42aDyHb464loxhRihY6aemeHZC21vIB7+2hm98m7+4NBgty4n9d6tcf5laS5xv1T5mYmrbgjr5lsZoXtyoxlrhURT7662xnmEt7jw4Jfyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827347; c=relaxed/simple;
	bh=Cp8VPi6KxLq6/5Ps/ZmQE0Xu8w1wm8R+g7UfjRCpQPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uoI0ipVgE5SjqH46Cu2TvY8qRtDtfFuakACaEn/liTI6cuGbKS6bl8CGErHMSKHaljyVKQ/ffYqis2fgq8YmkjGsR6H8GvGg8/EbKp5UZvOey+3vAj/agqeIJylXKTH6KXn7FRnMfL6AGGW8fub300WkFcbY93LO/oZa2KpJT+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=joHKHdX3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joHKHdX3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471D2C2BCB0;
	Wed, 22 Apr 2026 03:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827347;
	bh=Cp8VPi6KxLq6/5Ps/ZmQE0Xu8w1wm8R+g7UfjRCpQPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=joHKHdX34G0oHfhyGG5zC1DnFb39+SQFUm850ZBuQpjTs/aYnAyRx70t7mqCSyp+W
	 j70ArMZMlcIWT7KSeBnNz43E4sDBPJ9ZDy72PnBZDRGwZzoYtknbrFdpSqUFu1z27Q
	 zJmMZTtn0V+L/vrWC3iqyQRgrC2v9MHLnCXTkJlipEoE/7dpZIB7rWo/COvUoumwgo
	 JyUy4P3doOVoN8bW3SSL1h7bYtn1BUJKqDtRlvE+3Kh/9zslon5ViLH6NRYlDz2fW1
	 jX4flAeBm0s7+Sg2mR1983Cy0Kxf6Kjdjce/ZMGw6DhEExKyGBrKGGhSxzxjSWVWiZ
	 w/rgVeocciM1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 21/23] cgroup/cpuset: Limit the side effect of using CPU
 hotplug on isolated partition
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: linux-hwmon@vger.kernel.org, mkoutny@suse.com, hannes@cmpxchg.org, tj@kernel.org
In-Reply-To: <20260421030351.281436-22-longman@redhat.com>
References: <20260421030351.281436-22-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:09:06 +0000
Message-Id: <20260422030907.471D2C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [High] The fallback CPU mask is overwritten and ignored in `cpuset_update=
_tasks_cpumask`, causing task migration to fail silently.
- [High] The `cpuhp_offline_cb_mode` hack bypasses partition invalidation g=
lobally, but its fallback logic only protects `PRS_ISOLATED`, breaking stan=
dard `PRS_ROOT` partitions.
- [High] Unsynchronized access to the global `cpuhp_offline_cb_mode` flag c=
reates a data race and TOCTOU vulnerability in partition validation.
--

commit 273c35c4b20a0b62c4d54c5410e48d5450b71df4
Author: Waiman Long <longman@redhat.com>

cgroup/cpuset: Limit the side effect of using CPU hotplug on isolated parti=
tion

CPU hotplug is used to facilitate the modification of the
HK_TYPE_KERNEL_NOISE and HK_TYPE_MANAGED_IRQ cpumasks. However, tearing
down and bringing up CPUs can impact the cpuset partition states
as well. This patch attempts to work around partition invalidation by
pretending partitions are empty during cpuhp_offline_cb_mode, and
temporarily mapping tasks in isolated partitions to their parent's
effective CPUs.

> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index a927b9cd4f718..5f6b4e67748f2 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -434,6 +434,13 @@ static inline bool partition_is_populated(struct cpu=
set *cs,
>  	struct cpuset *cp;
>  	struct cgroup_subsys_state *pos_css;
> =20
> +	/*
> +	 * Hack: In cpuhp_offline_cb_mode, pretend all partitions are empty
> +	 * to prevent unnecessary partition invalidation.
> +	 */
> +	if (cpuhp_offline_cb_mode)
> +		return false;
> +

Is it safe to read cpuhp_offline_cb_mode here without synchronization?

The hotplug thread sets this flag while holding lock_device_hotplug(). A
concurrent userspace write to cpuset.cpus.partition triggers
validate_partition(), which holds cpuset_mutex and cpus_read_lock(), but not
lock_device_hotplug().

Could validate_partition() read cpuhp_offline_cb_mode as true before the
hotplug thread acquires cpus_write_lock(), causing the safety checks to
falsely conclude the partition is empty and bypassing cgroup validation?

[ ... ]

> @@ -3881,6 +3888,17 @@ hotplug_update_tasks(struct cpuset *cs,
>  	cs->effective_mems =3D *new_mems;
>  	spin_unlock_irq(&callback_lock);
> =20
> +	/*
> +	 * When cpuhp_offline_cb_mode is active, valid isolated partition
> +	 * with tasks may have no online CPUs available for a short while.
> +	 * In that case, we fall back to parent's effective CPUs temporarily
> +	 * which will be reset back to their rightful value once the affected
> +	 * CPUs are online again.
> +	 */
> +	if (cpuhp_offline_cb_mode && cpumask_empty(new_cpus) &&
> +	   (cs->partition_root_state =3D=3D PRS_ISOLATED))
> +		cpumask_copy(new_cpus, parent_cs(cs)->effective_cpus);
> +

By bypassing partition_is_populated() globally during cpuhp_offline_cb_mode,
all partitions skip normal invalidation. However, this fallback logic stric=
tly
checks for PRS_ISOLATED.

If a standard PRS_ROOT partition loses its last online CPU, it gets bypassed
for invalidation but receives no fallback mask. Won't this leave the PRS_RO=
OT
partition with a completely empty effective_cpus mask, breaking its isolati=
on
and causing subsequent cgroup_attach() operations to fail with -ENOSPC?

>  	if (cpus_updated)
>  		cpuset_update_tasks_cpumask(cs, new_cpus);

Does the temporary fallback mask actually get applied to the tasks?

Earlier in hotplug_update_tasks(), cs->effective_cpus is overwritten with t=
he
empty incoming new_cpus mask. Then, inside cpuset_update_tasks_cpumask(),
new_cpus is overwritten again by intersecting it with cs->effective_cpus:

kernel/cgroup/cpuset.c:cpuset_update_tasks_cpumask() {
    ...
		} else {
			cpumask_and(new_cpus, possible_mask, cs->effective_cpus);
		}
		set_cpus_allowed_ptr(task, new_cpus);
    ...
}

Since cs->effective_cpus is already empty, the resulting new_cpus mask pass=
ed
to set_cpus_allowed_ptr() will also be empty. Doesn't set_cpus_allowed_ptr()
fail with -EINVAL when given an empty mask, leaving the task's affinity
unchanged and forcing the scheduler to migrate the tasks to arbitrary fallb=
ack
CPUs system-wide?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D21
