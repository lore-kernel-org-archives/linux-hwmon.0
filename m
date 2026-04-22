Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6476339DBCF
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827348; cv=none; b=nQKdTlp/ekhevOlH3ZQ4koJwfQAbTBiC0YT8KjHYAk0jOOmI6rFtURg8OLK5gh8fHg+l3OYv3p5EojRjDEU/1faFtgvaayBhKKx3vGKMWy7rCmAIawlvLsncoNFfv6wGSLIxMKu2ZvwWAcoB4kZeGYid5c63kM4uiCU/oLplW/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827348; c=relaxed/simple;
	bh=u3q5jOESPUFXy78Ez3DYVknyqjW/GmfksrNbr2qYR1c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rq/HM5i+CcUKgmSHzVlBfrJqNHUm7Q6AeTU45hM1OdRnhf8tnuA9SpEAWMPSh5K9gdLYne5X8q2TF+FmVnWb7ywVCaiR8PzcLmLYEgFoRH0iW4zG3SzVY0aYQIgN/SvjGNhWfVERjpIjXe/Oj3B40mo6KxQnUhgUnUXmBZQW4+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qsCORiB7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qsCORiB7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D055C2BCB0;
	Wed, 22 Apr 2026 03:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827348;
	bh=u3q5jOESPUFXy78Ez3DYVknyqjW/GmfksrNbr2qYR1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qsCORiB7NndXeA7dZXPrQE1N10y/7yD7ELz7oWHanOM9ecY/DNTf+rxm9BV311VsL
	 XaHWfYrpG+RsZW+t7baMuHhpzDXfX9jJxA7ixFXXHGQ9YtgXVw6exNBtM5QhzMSlU8
	 ZIWTeG2oMSRgLxC7XcwZ/pfnA4rR3dcux2fUZ6Nwyyco3+pkMpRx/1bzOri3ho+2Yl
	 AX2RqiskBCmm358zTh8Yl3Lk6jrvFPKd0wpu//5pk38p2bs+QgVpu28VNJgInuvdiG
	 YiDW/XTnxzeDh6++Phf64y3NdycEy/ZtogoznRB3zmDwg3l1fVFLbggDkv4WOt8C9u
	 sOxWXxRft2E2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 22/23] cgroup/cpuset: Prevent offline_disabled CPUs from
 being used in isolated partition
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: hannes@cmpxchg.org, mkoutny@suse.com, linux-hwmon@vger.kernel.org, tj@kernel.org
In-Reply-To: <20260421030351.281436-23-longman@redhat.com>
References: <20260421030351.281436-23-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:09:07 +0000
Message-Id: <20260422030908.0D055C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [High] Unconditional NULL pointer dereference causes boot-time kernel pan=
ic on architectures with late CPU registration or systems with non-present =
possible CPUs.
- [Medium] Caching the `offline_disabled` state at early boot misses dynami=
c runtime updates, allowing illegal CPUs to enter isolated partitions.
- [Low] Buffer truncation for the isolated partition error message when mul=
tiple CPUs have `offline_disabled` set.
--

commit b13420f1f2cd136dd5780ea125eec8631214ef49
Author: Waiman Long <longman@redhat.com>

cgroup/cpuset: Prevent offline_disabled CPUs from being used in isolated pa=
rtition

This commit introduces a check to prevent CPUs with the offline_disabled
flag set from being added to isolated cpuset partitions. It initializes
a cpumask during late boot to track these CPUs and checks against it
when partition states are updated.

> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 5f6b4e67748f2..f3af8ef6c64ee 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c

[ ... ]

> @@ -164,6 +167,12 @@ static cpumask_var_t	isolated_mirq_cpus;	/* T */
>  static bool		boot_nohz_le_domain __ro_after_init;
>  static bool		boot_mirq_le_domain __ro_after_init;
> =20
> +/*
> + * Cpumask of CPUs with offline_disabled set
> + * The cpumask is effectively __ro_after_init.
> + */
> +static cpumask_var_t	offline_disabled_cpus;

Is it safe to assume this mask is effectively ro_after_init? On some
architectures like ARM64, the offline_disabled state can be set dynamically
at runtime, such as when an asymmetric 32-bit EL0 CPU is brought online.
Does caching this state at boot miss these dynamic updates, potentially
allowing dynamically restricted CPUs to enter isolated partitions later on?

[ ... ]

> @@ -4188,6 +4240,39 @@ void __init cpuset_init_smp(void)
>  	BUG_ON(!cpuset_migrate_mm_wq);
>  }
> =20
> +/**
> + * cpuset_init_late - initialize the list of CPUs with offline_disabled =
set
> + *
> + * Description: Initialize a cpumask with CPUs that have the offline_dis=
abled
> + *		bit set. It is done in a separate initcall as cpuset_init_smp()
> + *		is called before driver_init() where the CPU devices will be
> + *		set up.
> + */
> +static int __init cpuset_init_late(void)
> +{
> +	int cpu;
> +
> +	if (!tick_nohz_full_enabled())
> +		return 0;
> +	/*
> +	 * Iterate all the possible CPUs to see which one has offline disabled.
> +	 */
> +	for_each_possible_cpu(cpu) {
> +		if (get_cpu_device(cpu)->offline_disabled)

Can get_cpu_device() return NULL here? Because this is a pure_initcall,
it runs before topology_init() on architectures like PowerPC, MIPS, and
SPARC, meaning the CPU devices might not be registered yet.=20

Furthermore, on systems with physical CPU hotplug where possible_cpus excee=
ds
present_cpus, the non-present possible CPUs might also return NULL. Could
this lead to a NULL pointer dereference during early boot?

> +			__cpumask_set_cpu(cpu, offline_disabled_cpus);
> +	}
> +	if (!cpumask_empty(offline_disabled_cpus)) {
> +		char buf[128];
> +
> +		snprintf(buf, sizeof(buf),
> +			 "CPU %*pbl with offline disabled not allowed in isolated partition",
> +			 cpumask_pr_args(offline_disabled_cpus));

This isn't a bug, but could the 128-byte buffer silently truncate if there
are multiple non-contiguous offline-disabled CPUs? The static text takes up
59 bytes, leaving 68 bytes for the cpumask string. If the formatted string =
is
longer, the resulting error message surfaced to userspace via perr_strings
might be incomplete.

> +		perr_strings[PERR_OL_DISABLED] =3D kstrdup(buf, GFP_KERNEL);
> +	}
> +	return 0;
> +}
> +pure_initcall(cpuset_init_late);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D22
