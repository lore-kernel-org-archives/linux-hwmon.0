Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7183A169F
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827351; cv=none; b=A3g54ZB52vF0fs2p0idH2UKG5vhVKFwVVnaP7wU7sSwEJjfraL5hStHq/1I1Sam6zgPIFXAMP2tN+wlhbR42mtad8SdlV94bNKqkbNnuJSUFuqXgjSUjrz9D2H3k6bnoz2hxrqx7NtWdyDFecVpfxULKvx9Ivd4X6iHYrou2nmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827351; c=relaxed/simple;
	bh=b05ALdjr+jcS8C2WNBcRztYFiAOv1zZf2PvGucdFrck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O9iHgXMcuEqB1KvKQbjTv8h9JiXk4iLlzCtuUkjFIsLK21I6pEQDhq/KI2G8zAnF47Wl/13/c0mFJ2ncDOdh5I3tS9QTAbolJijwkUivEUnf5f/RIJ5DqnpODRIv3OhIhya9Mr5aFQfBUQ63bxSKFzWOTIf+6R/2zpo/YYWs4eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BViuea0W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BViuea0W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3F4C2BCB0;
	Wed, 22 Apr 2026 03:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827349;
	bh=b05ALdjr+jcS8C2WNBcRztYFiAOv1zZf2PvGucdFrck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=BViuea0WwrJj1OmCUVz+IE4COXO/VjwwswevbEpKXpsVeuEXEtLG+9QoBkDlDmtOo
	 2JcWKSR/IHWNJQxiiqSXFdo9wNjjSoaviC9CbNAOtHQdo7XXc/snqonarHdC8vek9a
	 /TQ9qfIhSo9tbsHD4wificlcX6GkF8/uDpzoNGq9/ExqdCMYUvDIyQndRhJ3SGHOtl
	 wATEb/N23GDxcmu2To1TuSTeXqYpHyuswvpUIMo6IH7x0zE0eFzhPZToMdxB8r5XTO
	 ZHxNNDEIom6T3ZH32Rerz6AO2J6yfbZD2NB6DYFqqK6ZdhujJSr11w7XD0AqyXP7XN
	 cULlwjxQkR5Ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 23/23] cgroup/cpuset: Documentation and kselftest
 updates
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, linux-hwmon@vger.kernel.org, mkoutny@suse.com
In-Reply-To: <20260421030351.281436-24-longman@redhat.com>
References: <20260421030351.281436-24-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:09:08 +0000
Message-Id: <20260422030908.CA3F4C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 5 potential issue(s):
- [Medium] The newly added `nohz_full` check in `check_isolcpus()` is place=
d before the state stabilization retry loop, leading to false test failures=
 and bypassed validation.
- [Medium] The selftest script enables kernel dynamic debugging globally bu=
t fails to restore its state when the test finishes or aborts.
- [Medium] The new `CPU0_ISOLCPUS_MATRIX` test cases omit the 12th field (`=
ISOLCPUS`), silently bypassing validation of the `cpuset.cpus.isolated` sta=
te.
- [Low] Dead code: the variable `CHK_NOHZ_FULL` is defined and assigned but=
 never used.
- [Low] Grammatical errors and typos in documentation and commit message.
--

commit 84d90aacf6dde2c021ed021a8f60057d923655be
Author: Waiman Long <longman@redhat.com>

cgroup/cpuset: Documentation and kselftest updates

This commit updates cpuset tests and documentation to reflect new CPU
hotplug capabilities for nohz_full. It adds tests to prevent using CPU 0
in isolated partitions when it cannot be brought offline, and updates
documentation in cgroup-v2.rst.

> A new test will also be run in offline isn't allowed in CPU 0 to verify
> that using CPU 0 as part of an isolated partition will fail.

This isn't a bug, but should "run in offline" be "run if offline"?

> Since there is a slight performance overhead to enable runtime changes
> to nohz_full CPU list, users have to explicitly opt in by adding a
> "nohz_ful" kernel command line parameter with or without a CPU list.

This isn't a bug, but there's a typo ("nohz_ful") in the commit message.

> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admi=
n-guide/cgroup-v2.rst
> index 91beaa6798ce0..81181dc100ead 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
[ ... ]
> @@ -2647,11 +2648,29 @@ Cpuset Interface Files
>  	partition or scheduling domain.  The set of exclusive CPUs is
>  	determined by the value of its "cpuset.cpus.exclusive.effective".
> =20
> -	When set to "isolated", the CPUs in that partition will be in
> -	an isolated state without any load balancing from the scheduler
> -	and excluded from the unbound workqueues.  Tasks placed in such
> -	a partition with multiple CPUs should be carefully distributed
> -	and bound to each of the individual CPUs for optimal performance.
> +	When set to "isolated", the CPUs in that partition will be in an
> +	isolated state without any load balancing from the scheduler and
> +	excluded from the unbound workqueues as well as other OS noises.
> +	Tasks placed in such a partition with multiple CPUs should be
> +	carefully distributed and bound to each of the individual CPUs
> +	for optimal performance.
> +
> +	As CPU hotplug, if supported, is used to improve the degree of
> +	CPU isolation close to the "nohz_full" kernel boot parameter.

This isn't a bug, but this sentence seems to be a subordinate clause lacking
a main clause.

> diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/te=
sting/selftests/cgroup/test_cpuset_prs.sh
> index a56f4153c64df..eebb4122b581c 100755
> --- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> +++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> @@ -67,6 +67,12 @@ then
>  	echo Y > /sys/kernel/debug/sched/verbose
>  fi
> =20
> +# Enable dynamic debug message if available
> +DYN_DEBUG=3D/proc/dynamic_debug/control
> +[[ -f $DYN_DEBUG ]] && {
> +	echo "file kernel/cpu.c +p" > $DYN_DEBUG
> +}

Does this leak the debug state after the test finishes?

The script enables dynamic debug messages for the CPU hotplug subsystem her=
e.

Looking at the cleanup() function triggered via trap, it does not restore or
disable this configuration, which permanently alters the system's global de=
bug
state.

Should the cleanup() function revert this change?

[ ... ]
> @@ -84,6 +90,15 @@ echo member > test/cpuset.cpus.partition
>  echo "" > test/cpuset.cpus
>  [[ $RESULT -eq 0 ]] && skip_test "Child cgroups are using cpuset!"
> =20
> +#
> +# If nohz_full parameter is specified and nohz_full file exists, CPU hot=
plug
> +# will be used to modify nohz_full cpumask to include all the isolated C=
PUs
> +# in cpuset isolated partitions.
> +#
> +NOHZ_FULL=3D/sys/devices/system/cpu/nohz_full
> +BOOT_NOHZ_FULL=3D$(fmt -1 /proc/cmdline | grep "^nohz_full")
> +[[ "$BOOT_NOHZ_FULL" =3D nohz_full ]] && CHK_NOHZ_FULL=3D1

Is CHK_NOHZ_FULL used anywhere else in the script?

It looks like it is defined and assigned here, but the same string
comparison is redundantly evaluated later inside check_isolcpus() without
using this variable.

[ ... ]
> +#
> +# Test matrix to verify that using CPU 0 in isolated (local or remote) p=
artition
> +# will fail when offline isn't allowed for CPU 0.
> +#
> +CPU0_ISOLCPUS_MATRIX=3D(
> +	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs P=
state ISOLCPUS
> +	#  ------ ------ ------ ------ ------ ------ ------ ------ ---- ----- -=
----- --------
> +	"   C0-3     .      .    C4-5     P2     .      .      .     0 A1:0-3|B=
1:4-5 A1:P-2"
> +	"   C1-3     .      .      .      P2     .      .      .     0 A1:1-3 A=
1:P2"
> +	"   C1-3     .      .      .    P2:C0-3  .      .      .     0 A1:0-3 A=
1:P-2"
> +	"  CX0-3   C0-3     .      .       .     P2     .      .     0 A1:0-3|A=
2:0-3 A2:P-2"
> +	"  CX0-3 C0-3:X1-3  .      .       .     P2     .      .     0 A1:0|A2:=
1-3 A2:P2"
> +	"  CX0-3 C0-3:X1-3  .      .       .   P2:X0-3  .      .     0 A1:0-3|A=
2:0-3 A2:P-2"
> +)

Are these test cases bypassing the validation of the cpuset.cpus.isolated
state?

The test matrix headers indicate 12 fields, but the entries only provide
11 fields, omitting the final ISOLCPUS field.

Because the 12th field is missing, check_test_results() will evaluate if
ISOLCPUS is non-empty as false and skip calling check_isolcpus(), leaving
the isolated state unchecked.

[ ... ]
> @@ -789,6 +821,18 @@ check_isolcpus()
>  		EXPECTED_SDOMAIN=3D$EXPECTED_ISOLCPUS
>  	fi
> =20
> +	#
> +	# Check if nohz_full match cpuset.cpus.isolated if nohz_boot parameter
> +	# specified with no parameter.
> +	#

This isn't a bug, but there's a typo ("nohz_boot" instead of "nohz_full")
in this comment.

> +	[[ -f $NOHZ_FULL && "$BOOT_NOHZ_FULL" =3D nohz_full ]] && {
> +		NOHZ_FULL_CPUS=3D$(cat $NOHZ_FULL)
> +		[[ "$ISOLCPUS" !=3D "$NOHZ_FULL_CPUS" ]] && {
> +			echo "nohz_full ($NOHZ_FULL_CPUS) does not match cpuset.cpus.isolated=
 ($ISOLCPUS)"
> +			return 1
> +		}
> +	}
> +

Will this check cause false test failures or bypass validation due to
asynchronous state updates?

The script reads the state and immediately returns an error if they mismatc=
h.

However, later in the function there is a 50ms retry loop to account for
transient states.

If the files update at slightly different times, the check instantly fails.
If both files are in their old state, they match, passing the check, but
then the script pauses and reads the new state without re-evaluating
nohz_full against the final state.

Could this check be moved after the state stabilization retry loop?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D23
