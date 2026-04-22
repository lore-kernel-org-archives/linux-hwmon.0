Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9B8139D
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827341; cv=none; b=HOSn++4qan4EeHfWJWzIVhZqdEPmB+nG5NkOxm3dsTMvnlMGpjhA2GLmtjLMwpgNts/ARilRQq5HJHo2uhpWB9sSSbgIzjVTaU2N8VhwtH7soQNTB7jyT9QJ8Gr/s3YtURJmG+hEIkiR2iZLUjFeityrlrz0UM2r22/aVu6tNns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827341; c=relaxed/simple;
	bh=iYLQm2yVob1+ixrdg9vlr1UQuJjyW5NaSeUr01l5dNs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k/0dXtOkO+kZpCyqphFbDiS3LLXHX6zNdUJoXvtkGeRQVR05izIdGo/0k2KO9tCtYwZWHOFWpaXySXw2wyZWqXzEQZLt5DRXkOjavF6V3TkdIbDoQs03D6l0oEs5dr143J7Br3p+uLz7UZBa4xuimI8q9J9kgLj7R+Gbj/horoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uUZ9Scff; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uUZ9Scff"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE3AC2BCB7;
	Wed, 22 Apr 2026 03:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827339;
	bh=iYLQm2yVob1+ixrdg9vlr1UQuJjyW5NaSeUr01l5dNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uUZ9Scff224PxN0G3Jwdt4QA2FQDlBTis1kvcC/dq5AIws9pugT1QeF2+3aFKIfGb
	 AcWfOhpZX0Sg3oMvXE6RW98EiVYxlFLZDgkcsBsjl7ClaEb30p9KXbNs9OvIRNlJbv
	 pxSzwAlxut4akwUHVQZQDieHE/rSxSsPzMgKXJMJXZC6lmG73vqhiFXAqTQBzDwM7N
	 vAwT1MkoCcuhT4CRWdgJySJp3Pjww9TZGhbxisEXWHmGy8+n0Q0END54Lgr+cZa7Be
	 MnsXODhFr2mQYlUkbAc8YXUcBqor8IcNxgPu8HaqWftnGOEDNFFaCLy9PBwghCvpZT
	 uz5QkuM3Z1qIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/23] arm64: topology: Use RCU to protect access to
 HK_TYPE_TICK cpumask
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com, linux-hwmon@vger.kernel.org
In-Reply-To: <20260421030351.281436-9-longman@redhat.com>
References: <20260421030351.281436-9-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:08:59 +0000
Message-Id: <20260422030859.9DE3AC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [High] The `hk_cpu` variable is evaluated only once outside the `while (1=
)` loop, causing it to use stale housekeeping status when iterating over fa=
llback CPUs.
--

commit ad2cf9abc3cffbdb84c73b305a44e5027c5f5e64
Author: Waiman Long <longman@redhat.com>

arm64: topology: Use RCU to protect access to HK_TYPE_TICK cpumask
   =20
This commit uses RCU to protect access to the HK_TYPE_TICK cpumask to
prevent it from going away in the middle of the operation.

> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index b32f13358fbb1..48f1508016895 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
[ ... ]
> @@ -187,11 +188,16 @@ int arch_freq_get_on_cpu(int cpu)
>  	unsigned int start_cpu =3D cpu;
>  	unsigned long last_update;
>  	unsigned int freq =3D 0;
> +	bool hk_cpu;
>  	u64 scale;
> =20
>  	if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
>  		return -EOPNOTSUPP;
> =20
> +	scoped_guard(rcu) {
> +		hk_cpu =3D housekeeping_cpu(cpu, HK_TYPE_TICK);
> +	}
> +
>  	while (1) {
> =20
>  		amu_sample =3D per_cpu_ptr(&cpu_amu_samples, cpu);
> @@ -204,16 +210,21 @@ int arch_freq_get_on_cpu(int cpu)
>  		 * (and thus freq scale), if available, for given policy: this boils
>  		 * down to identifying an active cpu within the same freq domain, if a=
ny.
>  		 */
> -		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
> +		if (!hk_cpu ||
>  		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_E=
XP_MS))) {
>  			struct cpufreq_policy *policy =3D cpufreq_cpu_get(cpu);

Since hk_cpu is evaluated outside the while loop, does it use the
housekeeping status of the initial start_cpu for all iterations?

If the start_cpu is tickless (hk_cpu =3D=3D false), it appears !hk_cpu will
remain permanently true for all loop iterations. This would cause the loop
to unconditionally reject every fallback cpu and eventually return -EAGAIN.

Conversely, if start_cpu is a housekeeping CPU with a stale sample, it
might improperly accept a tickless fallback cpu since hk_cpu remains true.

Should the hk_cpu evaluation be moved inside the while loop so it is
re-evaluated when the cpu variable changes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D8
