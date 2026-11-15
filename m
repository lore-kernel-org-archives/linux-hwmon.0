Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709445;
	b=inKkITd9IbMLS0S2akJjLsSyRe1Yv2ldpLSgARVREwJZJClg+YZM47weaxkp7jcXBkMK
	 VdrEufCjMPcmpqyhXaPnboK89Un80UPBIMQwT/xE7/EG4v0LmWcAcWvye0dYBETx+n7oK
	 EIhOry+lfvgkDq88lxFzQHWNXxbWGz1PKs92av4lngFNg8YCFOKHPfwGlewf/a6Ob5CCF
	 mC4Qq8S7p496Gglpe/lq+JQZ6yIyNbcu9j/2GBILpacsYlZ/oLupTQABU03oa56f3VfCo
	 A4Nncu19wCayP1++3kmGn0WMsmIZOY6Wla5sBUKtac8RGfrEXb2knm9oPHikt39df3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709445;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=99vo4QNBejrueX2GLewmNXZ1V9gdjvcee74gUO5hWAs=;
	b=2RQlKbYlwUXoapxJUpABenxZtcgp+UeBwTzL3raGvUxP71c4grhSHDRyPOyGjGMyYI0c
	 J2SiIqY83S1Q227yNESMFGvydhjIMX6ZwA5SQt35wLAddEnl/WL0ZhByAaSAcf+JTqfKb
	 6nlIO5ihFKHAaHfJCtmcVB2d2m0TvstHPEVbP98g2LYsTZBosT+0RqSNPJQMjFfGTmpT0
	 Ckfeg9xq6NLKV1sAOftlNtmPBXatwEtFPum7bc2DRYozTe7bUBZhqswAVdf7PdYcKbkru
	 WN2AdZMK1lybp1ACG2z/obOy8V8KHoN7BpBGQQp/l65G1fNQxcFWdSABBgc1PrtyBFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Za1YsEsg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755BE606A323
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 02:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Za1YsEsg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D164C1F000C4;
	Sun, 15 Nov 2026 02:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794709445;
	bh=99vo4QNBejrueX2GLewmNXZ1V9gdjvcee74gUO5hWAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Za1YsEsgVDc+vKy6TXqeQqPqX7qVXv9C1LaFB2PFsyXfzlMI26QTXsOjLG96O5mik
	 X3nmSRnhh1suxEgsO42LvLKAzu1cbpnO3VldCTFHI2VxBIVLg7baCqsTdrtnrHIYRg
	 L9h5EcfUziyssUCUlSsb5d4gzKJTEMak1puvg+bblSm4O3h+f2F10ou3uL9N1vWVS9
	 9mEA4RHZ5Ju909o6xjpdlzvCkTQ3n4zE31BMdk5ANrwT+WaBmYRe/vMprmFSg0scJ2
	 1rtSdw3+Ffoov/Vs2vohTdZGdIbOr88NSxoE++LrkoM9npJuHeZSiQ82zCM/z00NTY
	 gCNDGr/WcQAoQ==
Message-ID: <sashiko-outbox-215187@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/xdp710) Use dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Niloy Meharchandani" <niloymeharchandani@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261115022053.32321-1-niloymeharchandani@gmail.com>
References: <20261115022053.32321-1-niloymeharchandani@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 02:24:04 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Use dev_err_probe() in xdp710_probe() instead of dev_err() followed by
> returning the error. This simplifies the error paths and prints the error
> code in symbolic form.
>=20
> No functional change intended. Compile-tested only.
>=20
> Signed-off-by: Niloy Meharchandani <niloymeharchandani@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115022053.3232=
1-1-niloymeharchandani@gmail.com?part=3D1

