Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA2D495AD7
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 21:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679793; cv=none; b=KC5e6CnFrt6Rk4UVyzG9tyD8kcqH0JH9lVXVgSaVmX8NP3Y74mHWYTg3Zw92ZOQmB1z044cHD+pH+2VZcQ7pLSjnsxdsmqt4TyBGSPcgxGKCshUgf9CztAj8V4c1WTHWKUK7bLl5PswYRgK/QPAGNf0rl9tRxQABfgfZ62prIqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679793; c=relaxed/simple;
	bh=z7Hrp+XsGROxAb0T21+C/wGk6383FRLdyan7nuC0j1k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eUhaIWopSz1O1JgpsvhBaP/t2+8ii6e+p6b9jg4KuCJ9iHKZMdlbvBx0hoU6u1CoN5S2AGd+EAhv086X8aRMlmhIX0nlUvpb2a0i8IhpSl/zxK7hUPRL05GgJ5yK9fDKjkbcoVSiwGlaULGamGD/NcyEWz1Bel0BRN+S8y2H8AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ms5DIPDg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ms5DIPDg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57CF1F000FF;
	Thu, 17 Sep 2026 21:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789679792;
	bh=z7Hrp+XsGROxAb0T21+C/wGk6383FRLdyan7nuC0j1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ms5DIPDguSAXLRrPoG6lqj4PsDHgvlk8gTu7M7I1BawXgCDvmmCJ7/6B0lQzTIjmI
	 D3gMzZmDGq5hgtQIzRiKT9GRG4NojdVrv391rXwYSAMHDOCzLD9Tvni8IFpFZxl+AF
	 nY2rFUhCAgVUlAAHe+SPQN2u8iwbJwz+aUeb7tliYh6UxqpmUD5uc1Lzmy2Mqc4Mj5
	 1QTn7vsHXap4JHjbnUkYArlsn3Ryvfkk9Cf7TnWGwSyXFcOoz74o7QG/bnTTX4qKum
	 cdpQlwhkah6UkS0vcrIYJ6bt9AhYDixBXh69BEN187+4zFnoTnlRZlD9+V9R7dItp8
	 j2N/CCAqsQBUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: scmi: Fix info[] allocation type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kees Cook" <kees@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260917211344.i.911-kees@kernel.org>
References: <20260917211344.i.911-kees@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 21:16:31 +0000
Message-Id: <20260917211631.E57CF1F000FF@smtp.kernel.org>
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
> The assigned type of "scmi_sensors->info[type]" is
> "const struct scmi_sensor_info **", but the converted allocation type
> would be "const struct scmi_sensor_info ***", as the size was taken from
> "*scmi_sensors->info", which is one level of indirection too many.
> Luckily both element types are pointers of the same size. Take the size
> from the element type of the assignment target.
>=20
> Build tested ARCH=3Dx86_64 allmodconfig with GCC 16.2.0:
> drivers/hwmon/scmi-hwmon.o
>=20
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917211344.i.91=
1-kees@kernel.org?part=3D1

