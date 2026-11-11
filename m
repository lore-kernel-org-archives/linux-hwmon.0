Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380342;
	b=Ac0CP+fkH6OaF+Tj/lkC+Q07mL6KpHyHBb9FhYWfiuqHBoGjUfIFhJMvEsNNCG7NDDGN
	 QqrKUpZUIjkH6GR/bFUBw6wcbnXVgK7gA7vtM1L3DjnsaeZdRzVtgX7JJRi5LsPCEuE4x
	 RWr0YHVjkFSXOmoh3ocqK4Gn7nh13UspnaQ7+lqZNZppdSwswFKijq4KzWE18HynZmEji
	 4cwQJDQlftEv7HSjtwbiNIVW8m4tC4NnFNE2m96UpExJQz5R26Oj1GPqeIqOlRYnex/iv
	 PcYZVmZ+kghRjpzGqMqM6ExdW3AexlwL5Ef3IvjPf18nWVhltmvQNmn82YtGM+EviBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380342;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ujy85oUGWL5if9ewaBvAA3wwhAy5zNT9R2HyDR6dgac=;
	b=RVYHpAA3cdN0/Vh4W7ZFgg2UguG7jt6Z9GEFnP0LWgSjfPIW3OSWZAU90vilmr16rrKo
	 ZsEloRdgB3/XIobgFbzLSDmkR1InFT88sg5IDS86s82mIiUBwbE/34dnwH8pmlJHC7psM
	 Km7+XWkiSuZgS08rLK+FW+5om7LwRootNLjl22IEU5m9Auo7pjEpAkHcBMnSzbzMeidys
	 r/QwRVevNFI5TwXa+rIbTaq1eIh08VK/d1yGMbFnao0YqGHLX44kuPdlV/hdxvDaM532a
	 7LLVlO3gcLUz2rukU/kT2I5zMAyJnvOiVemAN4NkPhSds21ONaTA9KgEBIY1TmMow9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h3GjkZ8J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFE2606A321
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 06:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h3GjkZ8J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416FE1F00A05;
	Wed, 11 Nov 2026 06:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380342;
	bh=ujy85oUGWL5if9ewaBvAA3wwhAy5zNT9R2HyDR6dgac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h3GjkZ8JExk5WsBduhP40hmOW1y2dKl80jgxYceqm6IxhbwhIp/emIp/cFKcHkiSk
	 EwK4f2Ph31WG86ZHHDmZx7wsfXV4bXeEDH2xkf2VaHM0pC9wrhCqwyZJ8b8wFeOFUg
	 G0+AOJ+5vWNWrp+68fMGuiITEr98JMj2tyBHccerT2yAEBb1RrmwlxC6i1JCW1SC01
	 CUThiXb1NYssqPe+w11oB1V+fBok6s5Naxt9Fb8u+tmCS90VRSn7yBC0ShCecbbRZ8
	 ZVuZKCUPKQbYDBqfypDW4WYkbkyZrtLTY4DQ/N+PuzqMuORUh6zv2bcCNoZikRt60e
	 V8uiESkPSfG7A==
Message-ID: <sashiko-outbox-208475@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (it87) Bound 16-bit fan limits before conversion
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111065246.17682-1-zhujun2@cmss.chinamobile.com>
References: <20261111065246.17682-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:59:01 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> FAN16_TO_REG() doubles an unrestricted positive long and adds 1350000
> before dividing. Large fan limits can overflow these intermediate values
> and select an incorrect tachometer limit. Converting LONG_MAX can select
> 0xfffe instead of 1.
>=20
> Apply the same RPM bound used by the 8-bit conversion before doing the
> arithmetic. Keep zero as the alarm-disable value.
>=20
> Fixes: 17d648bf5786 ("it87: Add support for the IT8716F")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111065246.1768=
2-1-zhujun2@cmss.chinamobile.com?part=3D1

