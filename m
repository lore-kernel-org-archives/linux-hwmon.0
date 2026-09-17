Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196064D7975
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 21:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679975; cv=none; b=pc87eHgVggmzuihVUO0WA9gX8eadTTX8LD0YrfAs0Hrntn9nktVYq7NFGLhJeHbcr9GHc61jJLGQL9iswCW+7OqJM2nmnL43TXN10GhHkfB4+5bZT3QdvAaPYmMBmvb6JExFp6PluVK7N1okhlKFUhMfOEB2kiFxgNfgjRcI1eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679975; c=relaxed/simple;
	bh=HD7V+ymZn651zpqlRIax8pFKwWcViNUIhDkbaBnttEU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WeX6o/Gf/dMHyxTPEFpLkvaDPVngYfMiiWiKSqyYpwrWD2BW4OYVMT/wNKppNzYOj4U92YzzNd6o/hmvrEqvpyrJErea8nh9yWr7Kgy09sNbjfZGdRRWTvm55Emf+Xwj4You7NuvU9BDiW2dewjSHIw7H1re0mVFZWc2NzdQVwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcTp9d0j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcTp9d0j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95FFE1F000FF;
	Thu, 17 Sep 2026 21:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789679973;
	bh=HD7V+ymZn651zpqlRIax8pFKwWcViNUIhDkbaBnttEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RcTp9d0jkxxBbM90a+LgtqXvPKZNADncBFFVlDWO93MlJUrIfzm0CrmuOy+qEfNkc
	 pl+ByvELBhIJ5+LRKaEhkdu5jNkEL+F/fICFnbUrAzD3B19WXaGOEXO/qZdFcrKinI
	 OlfX634J1jEJw3oDdbR0ORV19QQFsjtpZj3jaKdxKzoe9GuD289X/aCms965LxKxH6
	 eQsbEYAuqMT/2KRppbKL+JbNek+2ixxB/B6fXvr+KWcI6t76sPEIPieMj3w89PezNs
	 UgSJsj/WZdHib7PaxTgEMkNXlgM1fbpYdr4xNQfBllNfIshF8vVJMI4Bs4PXkqu8ze
	 MQ2y0gBKjVBwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: pwm-fan: Add const to channels allocation type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kees Cook" <kees@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260917211417.i.173-kees@kernel.org>
References: <20260917211417.i.173-kees@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 21:19:33 +0000
Message-Id: <20260917211933.95FFE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Kees Cook <kees+treewide@kernel.org>
>=20
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
>=20
> The assigned type is "const struct hwmon_channel_info **", but the
> converted allocation type would be "struct hwmon_channel_info **", which
> is the same type without the const qualifier. As there is no general way
> to safely add const qualifiers, take the size from the assignment target
> instead. No change in allocation size results.
>=20
> Build tested ARCH=3Dx86_64 allmodconfig with GCC 16.2.0:
> drivers/hwmon/pwm-fan.o
>=20
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917211417.i.17=
3-kees@kernel.org?part=3D1

