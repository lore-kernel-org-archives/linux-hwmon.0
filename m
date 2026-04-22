Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8545F3988E3
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827339; cv=none; b=BLtuNnPb3cKo/a8S5yT+3Y2yPTDEtCjLjPcjqsYAkb892VRUBt/o9/ZGh9AYLU2xLvNFvME5AfMqGXUsmcA/tgoP1FfcurTsUNkgcx+9UyoiUcUmbwUbR165hU1smTfxjN8bk0Tj5qWNTXC47AhndPOjWF0mwZ5klS3oOjIpBNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827339; c=relaxed/simple;
	bh=5YB9zBJh9I7khkYAr187yOgzdeotZNUuyVgO1I1M4PA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hS/DwgSKMEPJ8OC1eKmTXy1+5OWbGJP+aCw2UZR0koFvbRQbcS0oLAC5YLGSZ1zUcBTupjHLGgWSU9NrpjBfcxZTd1Vjhs0dawLSY3aIQXiDfm3qkuW/+dmj4udqqLN81LpgtSYljpDztGgrwUzDCHVhdYryt+wo5hZNMyPA7sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uqqvMvhP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uqqvMvhP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD64C2BCB5;
	Wed, 22 Apr 2026 03:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827337;
	bh=5YB9zBJh9I7khkYAr187yOgzdeotZNUuyVgO1I1M4PA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uqqvMvhPq9wkaXqPNjl8jWwydWgWyoZLjGIlPEP1War0ExRQaG1ZR0aJAJtlZs8s0
	 DJDzuCtPx/WK1UGuDYneU8oSsWA+McGDpxQ/wogB7CNZyPhTQ09m0/EPY/QHvPqEZ/
	 0VtrpDie9rPIAYqH7/otgCrBOiQXDRIMhdk3QctpyEExpqTFrHWA7vRSw3idKia0Q4
	 4G6szCkI+ZlexIj0AsRJLx1+zmCNRQ+5VH0ADI+9yXwflgmTtryirxUcCveLWHHTi9
	 lq/AEZ9hlMYOKd0lMH5zd08so36lat0XBHnPBogTjcaxGNNIzHlULMwBedooaJBSL7
	 tGDenpsF7drTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/23] tick/nohz: Allow runtime changes in full dynticks
 CPUs
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: hannes@cmpxchg.org, linux-hwmon@vger.kernel.org, tj@kernel.org, mkoutny@suse.com
In-Reply-To: <20260421030351.281436-5-longman@redhat.com>
References: <20260421030351.281436-5-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:08:56 +0000
Message-Id: <20260422030857.2AD64C2BCB5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 4 potential issue(s):
- [High] Removing the TICK_DO_TIMER_NONE check in can_stop_idle_tick() allo=
ws all housekeeping CPUs to stop their ticks, permanently freezing timekeep=
ing.
- [High] Modifying context_tracking.active for online CPUs bypasses RCU con=
text tracking, causing Use-After-Free vulnerabilities.
- [High] Late context tracking initialization fails to propagate TIF_NOHZ t=
o existing tasks and triggers an unconditional WARN_ON_ONCE.
- [Medium] Incomplete implementation: failed to remove the __init attribute=
 from tick_nohz_init().
--

commit 4a1b2d82a8726c69f585b6c42f365c673f890897
Author: Waiman Long <longman@redhat.com>

tick/nohz: Allow runtime changes in full dynticks CPUs

This commit introduces tick_nohz_full_update_cpus() to update
tick_nohz_full_mask at runtime when isolated cpusets are changed.
It modifies context tracking to allow enabling and disabling user
context tracking dynamically.

>     We also need to enable CPU context tracking for those CPUs that
>     are in tick_nohz_full_mask. So remove __init from tick_nohz_init()
>     and ct_cpu_track_user() so that they be called later when an isolated
>     cpuset partition is being created.

This isn't a bug, but the commit message says __init is removed from
tick_nohz_init(), but this change doesn't appear in the patch diff.

> diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
> index 925999de1a28c..394e432630a39 100644
> --- a/kernel/context_tracking.c
> +++ b/kernel/context_tracking.c
[ ... ]
> @@ -674,9 +674,9 @@ void user_exit_callable(void)
>  }
>  NOKPROBE_SYMBOL(user_exit_callable);
> =20
> -void __init ct_cpu_track_user(int cpu)
> +void ct_cpu_track_user(int cpu)
>  {
> -	static __initdata bool initialized =3D false;
> +	static bool initialized;

If this function runs for the first time during a runtime update, will it
trigger the WARN_ON_ONCE(!tasklist_empty()) located further down in this
function?

Also, since only the init_task receives the TIF_NOHZ flag during
this initialization block, will existing tasks that migrate to the newly
isolated CPUs be missing the flag and bypass context tracking checks?

> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index 081f674a65882..67a747207f735 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
[ ... ]
> @@ -629,6 +626,36 @@ void __init tick_nohz_full_setup(cpumask_var_t cpuma=
sk)
>  	tick_nohz_full_running =3D true;
>  }
> =20
> +/* Get the new set of run-time nohz CPU list & update accordingly */
> +void tick_nohz_full_update_cpus(struct cpumask *cpumask)
> +{
[ ... ]
> +	for_each_cpu_andnot(cpu, tick_nohz_full_mask, cpumask) {
> +		WARN_ON_ONCE(cpu_online(cpu));
> +		ct_cpu_untrack_user(cpu);
> +		cpumask_clear_cpu(cpu, tick_nohz_full_mask);
> +	}
> +}

Could this cause Use-After-Free issues if a CPU is online and executing in
userspace when its context tracking is disabled?

The WARN_ON_ONCE warns if the CPU is online, but doesn't prevent
ct_cpu_untrack_user() from running.

If the active flag is cleared while the CPU is in an RCU Extended Quiescent
State, won't it enter the kernel without calling rcu_user_exit(), causing
RCU to incorrectly assume the CPU is still in a quiescent state?

[ ... ]
> @@ -1238,10 +1265,6 @@ static bool can_stop_idle_tick(int cpu, struct tic=
k_sched *ts)
>  		 */
>  		if (tick_cpu =3D=3D cpu)
>  			return false;
> -
> -		/* Should not happen for nohz-full */
> -		if (WARN_ON_ONCE(tick_cpu =3D=3D TICK_DO_TIMER_NONE))
> -			return false;
>  	}
> =20
>  	return true;

Is it possible for timekeeping to permanently freeze here?

If tick_do_timer_cpu becomes TICK_DO_TIMER_NONE as mentioned in the commit
message, and all non-isolated housekeeping CPUs enter idle, won't they all
evaluate tick_cpu =3D=3D cpu as false?

Without this check, it seems they will all proceed to stop their ticks,
leaving no CPU to take over the timekeeping duty.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D4
