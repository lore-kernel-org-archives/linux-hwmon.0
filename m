Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD9F3AC0CC
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 21:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680079; cv=none; b=rO+EE9yi5UBkfYudoyTkWERiNuDQ/MSTPDvBQLh/MVYMSQXHlcf3UTcNfrsuSWNGq/0UUlWURVl2IfdI1BDRqAbPYBuyuVoYPuK0lG+yVkqDKk4nLVmUvWuZ6C9LBJkLudJrA+i+o8VHzhiB8h1z5QhJtt1fkP+A5R/yTdG11l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680079; c=relaxed/simple;
	bh=q45x+OUZUM/qOLltXTmGgNMSNfP6JMvkebKD05IhQb8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yatu7axnf+r1GVFx609OsZj3wY4DxKGpAbOijLAIcxa7tsg1EWYdiLZn1JUIhBqCubo4caMlAScYRz//KDEJXZpsM2jFvmKuGfJTcJVm0FVITPAil2iVrfL2pXBtuUDZb/N3bpVomT4CG/k1qzLiIFnTOHyGESuIPeic4Pu5Ems=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFtjVL36; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFtjVL36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D2C1F000FF;
	Thu, 17 Sep 2026 21:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789680077;
	bh=q45x+OUZUM/qOLltXTmGgNMSNfP6JMvkebKD05IhQb8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MFtjVL36URYyFrFSk2y8HhILvJ/Yo4fcpbCxx6bNtgj+yv2YaC2Ch9sjwpiRxO3/8
	 dlrHrh128Oqvm0JvkdSc1PUVux23kw4K1jzastlhxROyp4+qYir5NUi6bb8nKBbeVy
	 92h45N2lk/YmH8UKHhU3A82sK/YEjCTc6FvA8nejCEaZHugC7ibiCpefIBwJ99SOxA
	 Jik3BXsnmqYmhcIW3MLfIE2ky4cDbSNbjAJZ0mPWMUwI9OkZh2EmY7yqL3rQIvVZyc
	 FrhT4AhXjmyrrj9I8ZNdYIC5B4shSQENZ33Nvfg93UZDN3BgKq6DTM4xpujDWpVVN5
	 /P5lmoNjrXHPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: hp-wmi-sensors: Fix info_map[] allocation type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kees Cook" <kees@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260917211338.i.682-kees@kernel.org>
References: <20260917211338.i.682-kees@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 21:21:16 +0000
Message-Id: <20260917212116.F2D2C1F000FF@smtp.kernel.org>
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
> The assigned type of "info_map[type]" is "struct hp_wmi_info **", but
> the converted allocation type would be "struct hp_wmi_info ***", as the
> size was taken from "*info_map", which is one level of indirection too
> many. Luckily both element types are pointers of the same size. Take the
> size from the element type of the assignment target.
>=20
> Build tested ARCH=3Dx86_64 allmodconfig with GCC 16.2.0:
> drivers/hwmon/hp-wmi-sensors.o
>=20
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917211338.i.68=
2-kees@kernel.org?part=3D1

