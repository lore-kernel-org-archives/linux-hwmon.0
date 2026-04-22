Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90373A16B1
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827340; cv=none; b=F4QfllC8d633YXRizxSD8I/FzbYnH+aTPRkn6tKKj5p9hXs9RIAl6r2KAb1kCNL3fd/O/MDCjtTY/J37qZN6lempNO3E4zFCKnh+iRht9aWdrR602LKRuSydHqEPzBSLvSoWWsvl17sAKkqiP1QR58m1HJMnQRqkLywvjW31aa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827340; c=relaxed/simple;
	bh=GIwh6LLIew80wjRmw4KxHjC01e9eAefRs7aLUulbVDU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mkcwWG8ooeCUpqS6jYpazZQejGch8M7e/bxG9XntETqy4GHyVHjdJ4OboCI3YPPtCx878MxB3WVue4vZemUyXOx9ubqic5ZOW38qEKLNL4PlZJIsTNjGQ+QPsZplVgx1djuavR6lGEh61NgMFwWXL6iE/FSEnhzQHfG2ODFeBUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQ7A+vCr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQ7A+vCr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C613AC2BCB6;
	Wed, 22 Apr 2026 03:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827339;
	bh=GIwh6LLIew80wjRmw4KxHjC01e9eAefRs7aLUulbVDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SQ7A+vCrRkiNShuPI+ceMltL5FqAgXXvZA6SAxqVZCPheXRL04Cz9nI+0W1DH5dUj
	 i1hlYkwqL2qDtASwk1iLMTj+2Daxy80eG1QFrkGslgIoZa+6q4TRnPnefVU+nfue3r
	 S9BMqXjak82D7pWjPbcerkPnEvO3UAE/pL8+h8ywYfRsm/X4phfbJ3R7T5JVZrxPXQ
	 tnITobB/VAfsPI+15f9H/fpD4/woBfu2qAkxy3CizZdA3nH5OZc7i3mzi+0WrYfQr3
	 mFLZyq6JRyQI/3ZOZs6nPBE4boVzZSlhWNz4ZbsVL3JtKvaiatgbXdvcXyEuwYezSs
	 O36AIguhh6qkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/23] sched/isolation: Enhance housekeeping_update() to
 support updating more than one HK cpumask
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: tj@kernel.org, mkoutny@suse.com, linux-hwmon@vger.kernel.org, hannes@cmpxchg.org
In-Reply-To: <20260421030351.281436-3-longman@redhat.com>
References: <20260421030351.281436-3-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:08:58 +0000
Message-Id: <20260422030858.C613AC2BCB6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 2 potential issue(s):
- [Low] The dummy static inline function for `housekeeping_update()` for `!=
CONFIG_CPU_ISOLATION` kernels was not updated with the new `flags` paramete=
r.
- [Low] The `hk_types` mapping array is missing the `const` qualifier.
--

commit a7583f48d85bde2543fa30edd95c2d2d24ceae16
Author: Waiman Long <longman@redhat.com>

sched/isolation: Enhance housekeeping_update() to support updating more tha=
n one HK cpumask

This commit extends housekeeping_update to support updating multiple
housekeeping cpumasks simultaneously. It adds a new flags parameter to
pass the target housekeeping types and ensures the new mask is a subset
of the boot cpumask.

> diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolat=
ion.h
> index d1707f121e203..a17f16e0156e9 100644
> --- a/include/linux/sched/isolation.h
> +++ b/include/linux/sched/isolation.h
> @@ -51,7 +51,7 @@ extern const struct cpumask *housekeeping_cpumask(enum =
hk_type type);
>  extern bool housekeeping_enabled(enum hk_type type);
>  extern void housekeeping_affine(struct task_struct *t, enum hk_type type=
);
>  extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
> -extern int housekeeping_update(struct cpumask *isol_mask);
> +extern int housekeeping_update(struct cpumask *isol_mask, unsigned long =
flags);
>  extern void __init housekeeping_init(void);
> =20
>  #else

While the extern declaration in the CONFIG_CPU_ISOLATION block is updated,
is the dummy static inline fallback function in the #else block lower down
missing the new flags parameter?=20

It looks like it might still be defined as taking only the isol_mask
parameter, which would cause an API mismatch for builds without
CONFIG_CPU_ISOLATION.

[ ... ]

> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index 258601ad20113..c24215e05b7b2 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
[ ... ]
> +/* HK type processing table */
> +static struct {
> +	int type;
> +	int boot_type;
> +} hk_types[] =3D {
> +	{ HK_TYPE_DOMAIN,       HK_TYPE_DOMAIN_BOOT	  },
> +	{ HK_TYPE_MANAGED_IRQ,  HK_TYPE_MANAGED_IRQ_BOOT  },
> +	{ HK_TYPE_KERNEL_NOISE, HK_TYPE_KERNEL_NOISE_BOOT }
> +};

This isn't a bug, but could this static array be marked as const so it is
placed in the read-only section instead of the mutable data section?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D2
