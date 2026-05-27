Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40123EDAB0
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 11:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880222; cv=none; b=Brc5yiKhgrQ8/rWNvdIIVn9Im2yuavJR2DyFBjCgjKeUqa2vZbYEsAs07htFYVQvlNhmmXvkQS/Ga1JUFwAjoUT25AmiumYrhLoTCw6dRwIKZp5AVehbKsX7sq56JmisrIDt5lFwGiq6KT8j6ig5jLaH78HwNOvn3UYWHcWVLi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880222; c=relaxed/simple;
	bh=vtzkqobRbDkXWztM3b9lHGFhpH109Tvp4F8TUFMaEWo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LjPb2ybXz0TiYNYHLvZE4gN955YtWovhIKlYFHskXzlVphyxkhlZd0FoKEyncAjvM/sTo16Chg70Uukg3Yo3KZsmcvMImbUGwXXCkOLBDhllvTMIeADweqTJ9pdSKqU1HM+fD8F99SpOOWK1/u1TPGTL65b0GalZ5pgGYPCIWws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScWqFUm5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScWqFUm5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CF51F000E9;
	Wed, 27 May 2026 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779880221;
	bh=vtzkqobRbDkXWztM3b9lHGFhpH109Tvp4F8TUFMaEWo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ScWqFUm55zg6W3x1SDIbph+NK5XLDF4t2WmOlcxtjxCNmeFSYSZNU3wYPcH10zS5k
	 heu1xBRR1GyJ5AmYQkVo+00OZL/ej3f5n7Pg6HpPrwi5Pwv7t6Q8LvmBjlxq+FLlpb
	 8iMy1OaI/kNJspzyYFNsmVAHWqi/nBAvos3nwZSwJgzuoMTtIhkl/Vv6HsnStwtBuO
	 MmFn54znAPVryE6VwPC6qwnPqHyEN9gF26wy7D5EAZQsaJaGziJZEKT4CE0th+pFfp
	 hJ+OPTs1XAdwPec5LfSfP9RH2mG0+b+UHtFEh9hfAXgT8yjLwO+PDqZywGOn4KePGN
	 2uMc32gVbmxXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: (gpd-fan): upgrade log level from warn to
 err for platform device creation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_BE546590D05E58278E73E2AE41117CDC8B08@qq.com>
References: <tencent_BE546590D05E58278E73E2AE41117CDC8B08@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 11:10:20 +0000
Message-Id: <20260527111021.42CF51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Pei Xiao <xiaopei01@kylinos.cn>
>=20
> When platform_create_bundle() fails, the error is fatal and prevents the
> driver from loading. Use pr_err() instead of pr_warn() to clearly indicate
> a critical failure.
>=20
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779876412.gi=
t.xiaopei01@kylinos.cn?part=3D3

