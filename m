Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100333A1D05
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827347; cv=none; b=rtZWP3QI5Ks9oqbh7g/4vqfffXofAJV+rC1Dfv+PvvZJ0Vs33Z4UAf1yEXYMATrrpBTRGgLWOZKwDJ5bgxf9DJUtJJEHN9v4oMfAZX6e/6TWY7VS1vX+uYElUkLJXr3VGn5fLEOyn5rLsblO2m+DiNuVRSWvSPNonyCbZor22kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827347; c=relaxed/simple;
	bh=ds76EB4aXqz9zsoC33KatdNojF+QDZT3aqqu0K9xgbA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eK/E1sjLKzh/8os32PdzcXH/zBxco5VIi8TwPLA0bmpuOtHjoR7csRu+O5L2XZKYjnS9agARQyTV/UUX6aQNTPNSWjkN7b+yDn6vLRyNoRbGIQu2GdA8bsocqtu+GpuSxG3qOpW1hLcLs1wVlfInycxSUcIkCwM/bRZIQfzfvuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUPHOaYu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUPHOaYu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CEFC2BCB5;
	Wed, 22 Apr 2026 03:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827344;
	bh=ds76EB4aXqz9zsoC33KatdNojF+QDZT3aqqu0K9xgbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qUPHOaYu8I2/b8Y+7nw9kGJRt7hbLlgNCcXigsbEQd4GPjVo+l4WjqTxhJ2/EcGUw
	 1LCjRRLjP+lK363CN9nQHsSmrpmaZtBXz8lTE5/0laTGlHlvj6fh9V5kBXepU8gf4f
	 mzhnFq/fC6iA3V2tJF1ia8/NC/kJrDLsRMoBXFtxB/ds4mf+BekAtBxkiq5ZN5VhqG
	 BBvkVDf3X9gYXNCPt+xCn/ZyOamaYtwG5M+a7FYdID4umwHW3NtyZ7cZJBa12jXuXb
	 nn6WnWF3g9hXO0OgUlL7bGxCYBnKyKeb5easvaPBOYFTQ+cPztBikmY2SPlygRNhf+
	 4JglJUscAueiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/23] sched/isolation: Extend
 housekeeping_dereference_check() to cover changes in nohz_full or
 manged_irqs cpumasks
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: hannes@cmpxchg.org, linux-hwmon@vger.kernel.org, mkoutny@suse.com, tj@kernel.org
In-Reply-To: <20260421030351.281436-18-longman@redhat.com>
References: <20260421030351.281436-18-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:09:04 +0000
Message-Id: <20260422030904.B1CEFC2BCB5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 2 potential issue(s):
- [Critical] Unprotected access to newly dynamic HK_TYPE_KERNEL_NOISE cause=
s lockdep splats and Use-After-Free.
- [Critical] Flawed lockdep exemptions mask genuine Use-After-Free vulnerab=
ilities.
--

commit 7b12dcd17d401c6b135ee53ba4e8384a7bd3d867
Author: Waiman Long <longman@redhat.com>

sched/isolation: Extend housekeeping_dereference_check() to cover changes i=
n nohz_full or manged_irqs cpumasks

This commit extends housekeeping_dereference_check() to apply the same
lockdep exemptions used by HK_TYPE_DOMAIN to HK_TYPE_KERNEL_NOISE and
HK_TYPE_MANAGED_IRQ, preparing them to be runtime changeable.

> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -38,7 +38,8 @@ EXPORT_SYMBOL_GPL(housekeeping_enabled);
> =20
>  static bool housekeeping_dereference_check(enum hk_type type)
>  {
> -	if (IS_ENABLED(CONFIG_LOCKDEP) && type =3D=3D HK_TYPE_DOMAIN) {
> +	if (IS_ENABLED(CONFIG_LOCKDEP) &&
> +	   (BIT(type) & (HK_FLAG_DOMAIN | HK_FLAG_KERNEL_NOISE | HK_FLAG_MANAGE=
D_IRQ))) {

Because HK_TYPE_KERNEL_NOISE is becoming runtime changeable, does this
expose existing readers to concurrent updates and use-after-free?

For example, housekeeping_show() reads this mask without holding
rcu_read_lock(). Similarly, tmigr_isolated_exclude_cpumask() reads it
holding only cpus_read_lock(), not the write lock.

If housekeeping_update() allocates a new mask, calls synchronize_rcu(),
and frees the old mask while these functions are accessing the pointer,
could this result in a use-after-free?

Additionally, does extending this lockdep exemption mask genuine
use-after-free vulnerabilities?

The exemptions below assume that holding cpuset_mutex or cpus_write_lock()
protects the pointer:

>  		/* Cpuset isn't even writable yet? */
>  		if (system_state <=3D SYSTEM_SCHEDULING)
>  			return true;
>=20
>  		/* CPU hotplug write locked, so cpuset partition can't be overwritten =
*/
>  		if (IS_ENABLED(CONFIG_HOTPLUG_CPU) && lockdep_is_cpus_write_held())
>  			return true;
>=20
>  		/* Cpuset lock held, partitions not writable */
>  		if (IS_ENABLED(CONFIG_CPUSETS) && lockdep_is_cpuset_held())
>  			return true;

However, housekeeping_update() explicitly drops cpuset_mutex and
cpus_read_lock() before updating masks and calling synchronize_rcu().

This means housekeeping_update() can run in parallel with readers
holding cpuset_mutex or CPU hotplug callbacks holding cpus_write_lock().

Since these readers are exempted from needing rcu_read_lock(),
synchronize_rcu() will not wait for them. Could this result in a silent
use-after-free on a freed cpumask?

>  		return false;
>  	}
>=20
>  	return true;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D17
