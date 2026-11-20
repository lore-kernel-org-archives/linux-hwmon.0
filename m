Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194144;
	b=vRj8KAgLTyVfCYFS7O8VMfjCn+35oPJDXvkaAyn6QIiy+fjdRObhLI6tOiGgKyRsJi9a
	 0C4BJ639cVG5us5/MHUjvWAm+rWCwpjW6wqtLnI0/Chzsxm4x8wp+md9M1xxWsZTFOstV
	 dwEFX8cuTyPjSFE8YRPlx58vgfbkLOmxDd+Mwc6LIAW1itKTP/sgPjNGvWLFsOAUNWphZ
	 oO9nvpUISz6VfuFiOzEKlu4LESU+WkxBnSoDMpEv+CuuWCKVmkftyeGsaZg1R4QTkRCVw
	 hZPlsOUmz3MMo/IbmcdI7MqUpxTvigsivyJBvcnRLG7m+tjP3XLmaCxsNioPiyr4TjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194144;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UpX0WgIY/KLQzXeabdPrv0nerNm6LHx8Bs3DZLDOcsg=;
	b=4WEdNkcmMGwdmBVLfdbkHReAtmOJucSd4EGbyqFwwROyn4KwNphQ93gx85TOpJCxrcuK
	 S8dqi1l4bfkpBnfC74qQqeGFAbv4HBWlPiDAWRrQtzof7WYS/GUVAKcA4BAmAilyKIBSD
	 ctiXTdm9KkE3mNa1GGyDpEEJLs/NinUsET9P6S7H/6OEyQFx/IQ8lQXikyy8tjtS2oNi0
	 VXYzAc5gqJuSX1w9tDWAwXZ/IxLf68FW9vCl2g2JN0NhDBLOyoQHCb8U6Mvdl/isJYwW1
	 2FYzs9ENdhP4jxn9CIOmLMDoDKqcos514cAW9jAs1bzKoJki/IEiB9KyckNcY+aR1ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AiLDetF6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9838060A2600
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 17:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AiLDetF6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F1D1F000D2;
	Fri, 20 Nov 2026 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795194144;
	bh=UpX0WgIY/KLQzXeabdPrv0nerNm6LHx8Bs3DZLDOcsg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AiLDetF69BOYHCYD2i43S+02a/Phrv39T6u0CQyA0TtXtcERZ4FwrIsJk5vyaTVMg
	 nbc2iNh61P6vNPs8ClX28Ss+qrnNe0PL2D0y7sGSXibOepkeiT0XbvR3DHniac8koa
	 66JUTESVyiqWOFI3WjVD0b6cvlUx9Lqw15JWGe7OU1E6QRxfZdxsF7IiwNrj4VlZOY
	 RSz2GgN2kJYZ6xsgjKbKk5Z/qdtRGblNsQO/+c7pLp93x3biENAPdeHvBWvWHdq674
	 bvRZmwl2aYucxsR+BHsnqc6b/XObWVq1XqWVH3Si9LSbjs6G/FzDkFw+3XDGvI+Tuu
	 Au6YUYc9epxog==
Message-ID: <sashiko-outbox-225616@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Remove unused for_each_sibling() and
 name_attr
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QXNhZiBOdXJpIEJlcnRpemxpb8SfbHU=?= <asafbertizlioglu@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261120165926.579575-1-asafbertizlioglu@gmail.com>
References: <20261120165926.579575-1-asafbertizlioglu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 17:02:23 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The for_each_sibling() macro lost its only user in commit
> e1b370b64031 ("hwmon: (coretemp) Simplify sibling management").
>=20
> The name_attr member of struct platform_data has been unused since
> commit d72d19c26c41 ("hwmon: (coretemp) Convert to use
> devm_hwmon_device_register_with_groups"), which left the "name"
> attribute to the hwmon core.
>=20
> Remove both. No functional change.
>=20
> Built with CONFIG_SMP=3Dy and CONFIG_SMP=3Dn at W=3D1 with no new
> warnings. Apart from the struct platform_data allocation size,
> which shrinks from 88 to 56 bytes, the generated code is unchanged.
>=20
> The unused definitions were found with an LLM-based coding assistant,
> which also drafted this changelog. Both findings were confirmed with
> gcc -Wunused-macros, git grep and the git history.
>=20
> Signed-off-by: Asaf Nuri Bertizlio=C4=9Flu <asafbertizlioglu@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120165926.5795=
75-1-asafbertizlioglu@gmail.com?part=3D1

