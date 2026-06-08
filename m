Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86ED42050
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 01:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780883328; cv=none; b=B4JxSqhe2yw0w2DlIW+nq8GtNru6ztoFjuICIgzWKhBQrnhp8GRHPIwUyirQeWGXQ0U+w9eQG9hfSoJiT6mZQMVZviMGyHpyC1SCmzcCBC3aTMjsnR8AnPbH0LjGWXIphtep5W2PcEgijYuSuZ4IE6t97aveUBgLIFxYZhtIRK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780883328; c=relaxed/simple;
	bh=FSaJmgC9YosgRtLqnaSpWn4+aVxVctQq1peFj7Svi+k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uykpW/mQFN8eF8jw+kOBo+qzMDCHKT9KSR+U4v2ev0yPS2jnXIr0AGcu7MJeenpw0Ylgu9kRqEBR7ZXqn6tNOHeo7wXLDXeKhqoA3gBqf/PbNycZPudbwU71I9WTF/ikNH1BvT6VRd2HLy/lnAmnSHAarAbPqnrX1oEGPNu5NFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+6uGSPD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+6uGSPD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378041F00893;
	Mon,  8 Jun 2026 01:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780883327;
	bh=FSaJmgC9YosgRtLqnaSpWn4+aVxVctQq1peFj7Svi+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W+6uGSPDghFyMdRf8JIGIKwb7vj2jP0MnSouRSp1DNQhM0gkL88GoNn3G7x+3Yxqg
	 lCtW/JCGxky9+X4fmuiiNuGvRv3kaHTYqm64P6ZmxWHnDSatatFE469QPdHDTsoGkD
	 VUiRiSQz3IllcyEfVWvvSI0f8WpNfLrEhaaWISY6z41H3GmSNw6xNk9KvUsUL0Nxtn
	 EslChxiC+5AGaeVcGStJeADqLjaeR0vPfH6Ml+7lj2omU81Ys9ANSK2D/6f/Kn80DP
	 +laxyPzX0uNfuDa2LvNJpeVrNyK9+kgo4ze3ffcBnQvQWojlGTW9QbE2gic2xbLSmj
	 mWocrHP/WQakg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] hwmon: (gpd-fan): upgrade log level from warn to
 err for platform device creation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_91CA78C59FD4CDC1BB5A4524727B5145430A@qq.com>
References: <tencent_91CA78C59FD4CDC1BB5A4524727B5145430A@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 01:48:46 +0000
Message-Id: <20260608014847.378041F00893@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780880972.gi=
t.xiaopei01@kylinos.cn?part=3D3

