Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655781;
	b=NaSFnKTBSc2wRyrUCbR+RIbd8Xefe34L9Jx101Po8af7cAGGth/yHdWXhfIgQoWV7Isd
	 Z+fbwqYKv6XbM/zqhfYy1TJpA5FcqDqrzkWEDoCu/vzx9IMUjP4nSASqne7o46SgrxJcD
	 05uDabQ5d9IqN6TZO3njWe6nmWfKLj9baeqDgQrh/paP1eZb1Ri7ctcM0Ba9g6muWYjDY
	 fWUsJGuQkzPMhVcyCfUt23Yw+IrcRjgGOWawKeJuEnlF2yGQyoULV7h2G1ml+CPVlSJDB
	 0wICXwwlreTmboOp9RXRKugMpVQoyv48s9541hY98mLM3EQ/7aw+RDPmrVByAY0kAZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655781;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=miJYuj+FTWtP/ryTMvwraXteND/g34V7jRUYglHGOIs=;
	b=bBzi5XS/gEJWMp2RNNQ0ZKxNi29pFLMptcmrv9dwLQLKPUjq7GK6cgPs4pPXqnKEvP8/
	 MH/CHH5JGl8eZgXtgdt1J4wf2tHndV2nDJ3kroVMm5bNmZ1SrUeVVGTHB1oLrk5SzZhmk
	 TGlzN7dJH/wCmnmJ+ljLSQ3shzA9Oe+ZIP/ic4EI4FYBXeUVMD7FBCwDCDL/44JWnQwIS
	 6pdNwPfhYnCzqM1VjLtag7WrxUdI0l9DVxCxixVGoC+95CukVZ2HZkplcM0cNBXx7Q7Lj
	 +ouOb2h/+3IUTJi/Ozmd7wVrel0JUk023Xuhmq+/sMmnUBQXYBz+lv8Hl86HmWRdUfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C0pkKeRI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C44606A31B
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Oct 2026 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C0pkKeRI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2B61F000C1;
	Thu, 22 Oct 2026 07:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792655780;
	bh=miJYuj+FTWtP/ryTMvwraXteND/g34V7jRUYglHGOIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C0pkKeRI/eE0oEHrGe7x/In1tNijy24TWlY923GmX0+83j5fNyvRAH+kT9BSox4qc
	 RzgmznKf2NzOJ7s5gyRjZP4a+PofiH1qU/TQBtEA8N145JAJ9JnzgsS81JiayMg+os
	 0HpKIncQgaVzup5wsKhgLmTfVqQatRqfNDjN0PpIXuagd0/iTbyzEXgsD+37iav3t4
	 gkO6DswNoSfn8KnN0oJjcSN5wCRf+pkw+0/xc7YXmYh+p7cEkpyfq0VaWDouF2vnXN
	 J/6adSoyP1rp13OIflC7bebu5bwgagp/V/kQxMnbAPhLKCL0+P2R5dEnAyOM3lY4Sm
	 ATzLVnEwwvlyg==
Message-ID: <sashiko-outbox-181148@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/7] x86/hygon: Map CPU NodeIds to DF nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261022074218.667049-3-wanglin@open-hieco.net>
References: <20261022074218.667049-1-wanglin@open-hieco.net>
 <20261022074218.667049-3-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 07:56:19 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> On bare-metal Hygon systems, CPUID 0x8000001E ECX[7:0] encodes a
> CPU's socket and local CDD ordinal. The value is sparse across sockets
> and cannot directly index the dense DF node cache.
>=20
> Resolve the encoded socket and local ordinal against CDD entries in the
> cache, which are ordered by socket and DFID. The NodeId reported by
> CPUID in a guest may not describe the physical DF topology, so return
> -ENODEV in guests or when it does not identify an enumerated CDD.
>=20
> Hygon EDAC and ATL support will use this mapping. Keep it local until
> that support is added.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022074218.6670=
49-1-wanglin@open-hieco.net?part=3D2

