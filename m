Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655153;
	b=cgx+XM53ITL6JK4oTqcV5CTUW4aIJtPuiUe4fuhgQzo566uPcmuJbCHJxJcAzPxxbhwn
	 /oCxJ9u+n39c1KP7KfisV+6imO4tW5rEvJegDwJcqFZRLP/NVrmo22z+A4k6tGRLYfKpx
	 kipTx3Qmv7MvnDHPktTYG7XITpvBCyYdndRo4qn6rKag6wXQeTrkoKGMKPykG6vZk/nrG
	 bOkCqjFUf6LD++NTU4TdDfYmPVnmOsUDpCOpVg1pSJcYShbCaRkJXaVDv8D+FvinrguH3
	 10FYS3ckzdf3QZxqbiGq4I+MJOHg0+t9w5WL+C+4QNy3vfc0nC6IC+jaMIP+bz+05/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655153;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HYFmQ6tZDMCBPd9739jtFIs/mXVoMDX2umusVJ+csMo=;
	b=fK6j7LzkG82Aci16ESt+GTR2mFU+cPQ18iKjMIc/Ggttcm+Uz3Ek/tva6ndLk+qr3s0a
	 kZZvSz+v48zwaann+KLDCjqAapEA3hNoazohZl7+mQrfF0YZcc2bPKt1/CmPH3Xde6pRX
	 ayQAqrBe4Bgy6Lgh096uR3skHkSB16gq3/KlNQ6dZp4/lxE+/N3WAHfTQ500XluToqLPd
	 e8Jz9/GQ+yvDhiPGonRdyoT8BXSWXX5nnEi6PB5H/m5PrfMAZ1b0FXga1vpfLAi6GJCix
	 zXos0FluhHi5Yq54MxT9CeWgBY7zWUXSTa5Q4kpuK57dzQObZn1gE77jY1Gx0uquOVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QOij3Khz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A00B606A31A
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Oct 2026 07:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QOij3Khz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05B91F000C1;
	Thu, 22 Oct 2026 07:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792655152;
	bh=HYFmQ6tZDMCBPd9739jtFIs/mXVoMDX2umusVJ+csMo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QOij3KhzbCv5rCjmoHNoN3B36ey3AgtzHOLlCG7tXYaNRP2V9Up/XgbxVc4Fs8Xhf
	 qXQVbqlV04TpyqvcfUVA7tAYIpvECetzIE6QwOqHE+z+UcTFM7a+2wwTVmbjRESQBE
	 EaHqqV1dVddH8pVn8Po6zjqhv2Ja0AtNQxgx55g6dAT3SkbelWo7hKHhvGdtHYSci7
	 i5ZzFraj/nxDkfRDFrSgXK4m9rhYJKI+c9gb4kYDEbFiU0rGmY7igbdOU9oFgskFWn
	 LzfA7TP7v82FzFgklwfGrsY4Cj8uUfpl1XKkyET4YQvTNeOmZYAeGyQDNSueO8UpXS
	 1x91krqYKtZzA==
Message-ID: <sashiko-outbox-181131@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/7] EDAC/amd64: Stop matching Hygon CPUs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261022074218.667049-4-wanglin@open-hieco.net>
References: <20261022074218.667049-1-wanglin@open-hieco.net>
 <20261022074218.667049-4-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 07:45:52 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> amd64_edac gets its node count and DF devices from the AMD northbridge
> cache. Since commit 49b96fc0dddc ("x86/amd_nb: Simplify function 3
> search"), the cache finds function 3 only at the fixed PCI slots
> 0x18 + N. Hygon DF devices are not at those slots, so the cache is
> discarded on Hygon and amd64_edac_init() returns -ENODEV at its
> amd_nb_num() check.
>=20
> Remove the Hygon match and the empty Family 0x18 case. MCE decoding
> in mce_amd.c is separate and unchanged. Hygon memory controller support
> will use the Hygon node interfaces in a separate series.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022074218.6670=
49-1-wanglin@open-hieco.net?part=3D3

