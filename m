Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC57E3921E7
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827341; cv=none; b=RAwGqMMpCRs0rMS7VqL4Dni8E8cYcuTtb8H9TIHU4l9MWa7Oo2AKp7/uORfoX/GNFME6MgYu5iu+n485a+2UJY+PJeAviD+zFmsJD+judS1FFOP8OsfkgEtvB1L7eaXB9jptqy1/NEz3vXVgct8InCgW09IsN0FKknnUqQDQolE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827341; c=relaxed/simple;
	bh=9qWQI/kjqaZPuPlHEf/fOOLy+9FUizI8lwUO+Bkq3XI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fgsx+6GISceil2zfAxNtlbjdJAHt59+LEIKZmUPu3r7HAbPpAhhYcRc9ehHCqlUZMa2hq0SucgYKoY46aVmB1fkn1DQ+1qy0uOMnu5A9OI1wMTpO83RMUPDqbHioKpNw15k3SbYg8w0f+hvxLXIdrWiwF1+uXYtdZCCKIJJCd9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uO0G3450; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uO0G3450"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C45EC2BCB6;
	Wed, 22 Apr 2026 03:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827341;
	bh=9qWQI/kjqaZPuPlHEf/fOOLy+9FUizI8lwUO+Bkq3XI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uO0G3450NpCf9473olYTSx6EJorg0l0OOcIqhPBCGYXc764NbjRnMN3DvawDV8XuK
	 EjiwSEIg/vbbc13AIOSzljypxuqTuhnOp8YsQLL/sM3CtybV/uuCqusQGfXa+xlf/+
	 3YciLm54VBreh9YAyk227+Hof4J1HIMIqXBMqnilQVeUPUKYKQnpZuVtrm0hG5aevk
	 LPZWNsUQu1/pRbk8upIx+pSGgoPP7s5sZLTCc9racRCxsVijIdXPkuyjTNV39p7FpI
	 fSq/dwOqG5Z5x7hacqYd7f9fn8t8WvxTIdRvEycIqL6z3nNVSR8a4bhn/EMamnvKk/
	 B48BLvny1x/2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/23] hrtimer: Use RCU to protect access of
 HK_TYPE_TIMER cpumask
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: linux-hwmon@vger.kernel.org, mkoutny@suse.com, hannes@cmpxchg.org, tj@kernel.org
In-Reply-To: <20260421030351.281436-12-longman@redhat.com>
References: <20260421030351.281436-12-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:09:00 +0000
Message-Id: <20260422030901.6C45EC2BCB6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [High] Missing bounds check on the CPU index returned by cpumask_any_and(=
), leading to potential out-of-bounds array access in per_cpu().
--

commit 9c505fb411d64c62ba8b88daa1385610377293b4
Author: Waiman Long <longman@redhat.com>

hrtimer: Use RCU to protect access of HK_TYPE_TIMER cpumask

This commit updates the housekeeping cpumask access in get_target_base() to
be protected by an RCU read lock. This change prepares for the HK_TYPE_TIMER
cpumask becoming changeable at runtime.

> diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
> index 5bd6efe598f0f..bc3652f928b9d 100644
> --- a/kernel/time/hrtimer.c
> +++ b/kernel/time/hrtimer.c
> @@ -242,8 +242,10 @@ static bool hrtimer_suitable_target(struct hrtimer *=
timer, struct hrtimer_clock_
>  static inline struct hrtimer_cpu_base *get_target_base(struct hrtimer_cp=
u_base *base, bool pinned)
>  {
>  	if (!hrtimer_base_is_online(base)) {
> -		int cpu =3D cpumask_any_and(cpu_online_mask, housekeeping_cpumask(HK_T=
YPE_TIMER));
> +		int cpu;
> =20
> +		guard(rcu)();
> +		cpu =3D cpumask_any_and(cpu_online_mask, housekeeping_cpumask(HK_TYPE_=
TIMER));

As dynamic runtime updates of the housekeeping masks are being enabled, is =
it
possible for the intersection of cpu_online_mask and
housekeeping_cpumask(HK_TYPE_TIMER) to be empty?

If all housekeeping CPUs are offlined, cpumask_any_and() could return a val=
ue
greater than or equal to nr_cpu_ids.

>  		return &per_cpu(hrtimer_bases, cpu);

If cpu is greater than or equal to nr_cpu_ids, could this lead to an
out-of-bounds array access in per_cpu()?

Would it make sense to add a bounds check here to fall back safely if an
online housekeeping CPU is not found?

>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D11
