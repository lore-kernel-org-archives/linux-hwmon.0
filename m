Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301C13A1D05
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827345; cv=none; b=okZFOSrBcApkgdBvzwhxCUfn72VbqOoys6xPu0/lFAvoNtYVKIm0WetL079yzOllQeCA+c3T3bSJnS4yBEe942k/GtyhU/I2GI2JbCn8xjWIqC59/7xl3JG/1KQ8Z9w1EviQDJqfaA8+gtxMZQZf0HoADi5+kX2FkalzDj8qfOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827345; c=relaxed/simple;
	bh=8bm78vUKdsk8Po8E7LxyjC8xxBtU4HtuWx2z2NS/1a4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ElDKbnZgsQaEKsNKD2yPwxPpaEIpvwP5xmSwgOiBacN59G9IkSRlgHUXqUFTo+UOeAwCWgk6ZgX4eZ0+C+xLP+S6mqG5rmQGbMTSKWra2KJFQiV6T7MxCWh4zig7y1pZmnJIwUHYeYW/nxJQYpriDTldMPaXFWZspFTNAR7oV3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNlGUUCg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNlGUUCg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1BFCC2BCB0;
	Wed, 22 Apr 2026 03:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827344;
	bh=8bm78vUKdsk8Po8E7LxyjC8xxBtU4HtuWx2z2NS/1a4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VNlGUUCgOXKtqwspkQjUdQwF1rWjJtNy82vXXwwYr0UFE4gtLjRZsbCat+W3ijjhj
	 TNZwtM/j16Ozz8vtCc9zsihTSKjOb42Z2UyLWS0qicEDDkcwuAO4ALHhGz4HvMxSh9
	 L9sv9BiA/SoR9Ch0GNn3a89UqUl57b8JQuQn11tTRUZke84u5VmtwpJhtF8ay09cib
	 5pV7OfidKI4nQ+DC6UIYM9vF5N8VscFmdfLQYFgAOhSjgqW9IFiUglIBUz3U5n3u3e
	 0M1FoVqkMNvQwgECINzKzV9BfYBFFBH5Vlx8XqPG5GK7g0g8POWR+gHBrxxPn1CjiG
	 3BH4iK9+jWwng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/23] Drivers: hv: Use RCU to protect access of
 HK_TYPE_MANAGED_IRQ cpumask
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: tj@kernel.org, mkoutny@suse.com, linux-hwmon@vger.kernel.org, hannes@cmpxchg.org
In-Reply-To: <20260421030351.281436-16-longman@redhat.com>
References: <20260421030351.281436-16-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:09:03 +0000
Message-Id: <20260422030903.E1BFCC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [High] Infinite loop causing RCU stall when a NUMA node lacks housekeepin=
g CPUs.
- [Medium] Mixing `goto`-based cleanup with scope-based `guard()` violates =
subsystem guidelines.
- [Low] Unnecessary unconditional memory allocation for non-performance cha=
nnels.
--

[Note: Due to recitation restrictions, this report uses a free-form summary
format rather than quoting the original patch lines directly.]

commit bc4398753271c194097795d20b6095f594c74b4c
Author: Waiman Long <longman@redhat.com>
Drivers: hv: Use RCU to protect access of HK_TYPE_MANAGED_IRQ cpumask

This commit uses RCU to protect the HK_TYPE_MANAGED_IRQ cpumask during acce=
ss,
moving the cpumask allocation before taking the RCU read lock since the
allocation can sleep.

I noticed a few potential regressions in this patch:

First, looking at the loop in init_vp_index(), if a selected NUMA node has
no CPUs present in the housekeeping mask (for example, if the entire node is
isolated), the intersection of available_mask and hk_mask becomes empty.
The code then clears allocated_mask and jumps back to the retry label.

Since the variables do not change state across retries, does this create
an infinite loop? Because this patch places the loop inside an RCU
read-side critical section via guard(rcu)(), would this spin result in
an RCU stall?

Second, the patch introduces guard(rcu)() in init_vp_index() while retaining
the goto out_free cleanup path for free_cpumask_var(). According to the
kernel's cleanup guidelines, mixing goto-based error handling with
scope-based cleanups like guard() in the same function creates confusing
ownership semantics.=20

Should this function be fully converted to scope-based cleanup, or=20
alternatively, use explicit rcu_read_lock() and rcu_read_unlock() calls=20
to avoid this mix?

Finally, before this patch, the code used short-circuit logic to skip
allocating the cpumask if the channel was not performance-critical. The
patch refactors this to unconditionally call alloc_cpumask_var() at the top
of the function before evaluating the channel type.=20

Does this introduce unnecessary sleepable memory allocation and deallocatio=
n=20
cycles for non-performance channels?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D15
