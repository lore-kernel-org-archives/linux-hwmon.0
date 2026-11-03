Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695828;
	b=sy/PHBxxLMWsXlPUV8nt4NKE3QJCcIxivdNOU4eDeIl6ogT8AeQFVuBTM5ozPPyEZzFf
	 pwblnmU4C9xVCzMniJhncDp5Srlqibd5S6yUzqHG5DxluXv7vpxLF1BjRBu+T5R7I9YTH
	 XJHG85gSFVrZUtvxP5YEnO9cWDxfKE7nLrPTDlAEoWNTssl5LALFjKzh+ZkGXKWsq9LvL
	 pK4nmaeK2axtx9/rFG+QlM4Qoraj0RrtyQP1oemECzNoU0a0Hwmam77K2oChKy9cbSjy9
	 FRpEW9si7V3yHIRy9tMljTiANjeW8vw6+T5LY444ILDmCavOuPoWZxtglqKI7bD/Y5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695828;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P28uWKamWX1Y6pmiX/NptKCYBQDWjis07YU3ZlDdIIQ=;
	b=0t3X4fnGWUQRIGRhGZxW4MlTGj4mMdMU8OuKOZzZdGOCpSmK3259Cfci/DFfu+0K7iKu
	 ptoOjIAvvhuoKReYd1DhG1QvFv6JY8/KkpdKKip+imc4zKOG6X0fNeC5PgXH0NPUPF97e
	 5UJUBgaCkC1xBUogKl6XtyStsPGplRVHmMaOm1UJZ4bFneB4H+HXHObw7rUuFwXdyTP2E
	 7LVvgG9avbTWajYlfzmb22eeij+z62Z3ljsj1jQUwWLUJwVdyk8MMP5pTOazBWNhYewvx
	 ZXZaQjyMjHM1TSLdDN52aYJsZgLMsUVX38ag6SyEqQQTUGK+8XKUNDOHRLPUEml89Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BHbMAhM4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9FC606A332
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 08:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BHbMAhM4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58A01F000C1;
	Tue,  3 Nov 2026 08:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793695827;
	bh=P28uWKamWX1Y6pmiX/NptKCYBQDWjis07YU3ZlDdIIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BHbMAhM4DyLB3LnFwlQ+DQHS+LsCs+JHUou2zay2mDSpafd16cRrtx9d9sygmr+E3
	 JNwzoMtexOn5UK7eTxda3jBmKvBl+dWsepatTuG1tINpxXuZcn9vdbNLZDjhe0oGhe
	 t91Pzv+ICMlVKXzbbO/2Nj8uM6CpD+Asf+coxN+R4jx6TEPSO/lIkF0gZzAuZb0997
	 DfXT00fD9sxVylAurNzP4qK0j4CUMHh3vTLEPfWetELkUVUUHzpShHHmg5f5zpwew5
	 16HSEjG8DJA7Uzl3Jx0BF2k/jqo/fvR9aM7a1pDWQTrvOdABh1UEaXnXtVmaSPaG5d
	 mi7pDl2d3DTnQ==
Message-ID: <sashiko-outbox-194885@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: max20830: Add MAX20810,
 MAX20815, LTM4739, LTM4740
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carlos Jones" <carlosjr.jones@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261103084331.449-2-carlosjr.jones@analog.com>
References: <20261103084331.449-1-carlosjr.jones@analog.com>
 <20261103084331.449-2-carlosjr.jones@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 08:50:27 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Carlos Jones Jr <carlosjr.jones@analog.com>
>=20
> The MAX20810 (10A) and MAX20815 (15A) are members of the same device
> family as the MAX20830, sharing an identical PMBus command set and
> telemetry (VIN, VOUT, IOUT, TEMP). The LTM4739 and LTM4740 are the
> LTM-series module equivalents of the MAX20810 and MAX20815 respectively.
>=20
> All variants use the existing adi,max20830 fallback compatible.
>=20
> Signed-off-by: Carlos Jones Jr <carlosjr.jones@analog.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103084331.449-=
1-carlosjr.jones@analog.com?part=3D1

