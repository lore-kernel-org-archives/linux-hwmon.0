Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE1517BB21
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 06:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970651; cv=none; b=T+FLI1jQQJw1uif7YwLCVhBxZl0qDRHMobtOih9SH47q2S9WCw7GeBqVy/60lrFupqnRXT5nam6WMlhI6XmhAeqjIGxZflbx+mPQnIMBJ3Byv0iAUpVb8XV2l6lcxURxtmMLCf6UlwAJ94EN8nqzlHzjRx5H87LcDN34qAdOi+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970651; c=relaxed/simple;
	bh=SiW8VYbRdslhkZd1aoPQ04ehRjQUzpE9XcCMDwR/6z0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ULyNhAPUvIMCzUKQlpGPUkQ6yWdbnHZaaMQlze8nIij8qjhzt0/iccTJbJJYRl+9+BjUrZ4Q1YBAZ9KwST42730pUCLX9GfsoISazL+GikNbwRh07jJFtZfEx361JmFIydkrozmJBS5AnsJ0gc/sUxoY4E6DKd7dKeG4j5NM8Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQsrgGOY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQsrgGOY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05CE1F000FF;
	Mon, 21 Sep 2026 06:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789970649;
	bh=SiW8VYbRdslhkZd1aoPQ04ehRjQUzpE9XcCMDwR/6z0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FQsrgGOYeIGdd9P4ydsGMVhLyznqP9Y67HAk8R0ZIc0N7oBWH2Toabn//FbzGj2uh
	 HZEwYDN8OBzkaIWdwciq9O5o4MOqhDB6vPlLonmImi9pnfp6bkyr7Yk3NEM5RaLuef
	 CUi/PMMR5V+k6lsuoU2SWaxFjL+2cberliCJ86nVNm907UQJEuR7omiFYRC1YOcu9o
	 XB8Bnu7LEReK6maxVcsAP5F2xhIEM13J2D3DvnGQjU2gy/59rcWo+pNh+E3GHC0ipl
	 ZO0yPw0WPCwptCelweIuDCvXzkldimFxAE90aHxsRhMU7nCoUuVUQ7Vn09DDso2sR0
	 5N5irzyoul91A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/8] x86/amd_nb: Restrict the northbridge framework
 to AMD CPUs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260921055603.25112-7-wanglin@open-hieco.net>
References: <20260921055603.25112-1-wanglin@open-hieco.net>
 <20260921055603.25112-7-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 06:04:09 +0000
Message-Id: <20260921060409.B05CE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The AMD northbridge cache previously discovered Hygon F3 devices by PCI
> ID. It now derives the node count from CPU topology and locates node
> functions at fixed PCI slots. Hygon DF devices do not follow that
> layout, so the Hygon branch no longer builds a usable cache.
>=20
> amd64_edac and ATL no longer use this cache on Hygon. Restrict
> northbridge initialization and the early northbridge check to AMD CPUs.
> Keep amd_get_mmconfig_range() available on Hygon because it reads the
> MMCONFIG MSR without using the northbridge cache.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921055603.2511=
2-1-wanglin@open-hieco.net?part=3D6

