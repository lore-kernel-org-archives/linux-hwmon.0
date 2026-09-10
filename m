Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E93C39B97B
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 08:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029245; cv=none; b=tCUSpGtiGMzt70loVnl8+89/6xVUf/MHMdlbd9UjjNZVbP/arx2Fy5Xx8PEoT+H1groX1hZf4edkOqVmkgIYzr6VJgsz2xWpSBiXJV3IhR0GYiPBFqZN8TEOP1DbnHHYct19IpTIMXO2zG/Mh/pEVBPEipwjJJdflwkvgkuJ0i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029245; c=relaxed/simple;
	bh=4laUYZWakDqSqkzbbHpcSw/n05gw8FN0NCS9QTRn64c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BeswzJUgvuRmcl4ETC6IpzkL9KcIt9mRM7wdRyb2ZDSs/sISt3gcpSYXd1rFDzSruMOXFnT3MA4MSfx4wlsO8/Ibnb5seheGqUj6wfZQ2LXpRYNVw6qRYA435isHVNd2Glvd2rJwbHKUdq2HGpzNG36FiRFwlLP+1T1sKJctDVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUuthF5z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUuthF5z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36491F00893;
	Thu, 10 Sep 2026 08:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029243;
	bh=4laUYZWakDqSqkzbbHpcSw/n05gw8FN0NCS9QTRn64c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EUuthF5z9BUAaJv7apyNLriAe1/5NHlpmi4lXiuFjcAfXRrmtDa8aBFS1MQZdOCxr
	 2Kv6TURgiuFtkuyJRRnp5Lk3wy1QLoa/w/jz8Yw0/56rW0Cphx5DKqYeyeMsaNeNw9
	 yKJ5DchUAjBmCdLByuTIcBZauyfzZXkMi9eU3XO7g57fbmCRljG5ftGgtIOzzSW/2P
	 wn6mK4CdcLfxKpbOfxodX7pGB0rVXlSWFnJmyIbl3EI54/nFtRzL4mHGkPOXavA3xN
	 81Tg4GO/hS0/UqqXJWiBOq+1wl8VGr7y8uyKvomT0pzVL6C7NKtQUfnMoORMkLxl+3
	 rah5SAIgBvUlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/8] RAS/AMD/ATL: Match AMD CPUs only
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910082734.3771675-5-wanglin@open-hieco.net>
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
 <20260910082734.3771675-5-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 08:34:03 +0000
Message-Id: <20260910083403.A36491F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The ATL CPU table matches Hygon through X86_FEATURE_SMCA and
> X86_FEATURE_ZEN, but the library obtains its node count and F4 devices
> from the AMD northbridge cache. That cache maps dense node indices to
> fixed PCI slots. Hygon PCI slots do not encode node identity, and CPU
> NodeIds are sparse across sockets. The cache therefore cannot represent
> the Hygon topology or provide ATL with a valid node-to-F4 mapping.
>=20
> A failed fixed-slot F3 lookup leaves the cache empty, so amd_atl_init()
> exits at its amd_nb_num() check.
>=20
> Limit both feature matches to AMD. Hygon address translation requires
> the Hygon node interfaces and will be added separately.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910082734.3771=
675-1-wanglin@open-hieco.net?part=3D4

