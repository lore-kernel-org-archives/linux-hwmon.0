Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655285;
	b=Fwd586FgH1mwzxQ4+mQlsI2bjepmJwZhvoTKImF94t4tyG0gT5FN/a8gKuI6ZVIfBvPH
	 8l8jznr16MMO8MmIe6fet+kXZiKyYUddenpCz/5tLtiU7wBMljq5pbu6XT/i06hhLDAYq
	 Ie7CGahd00O352p79+ekJkK3Hjji7ilo3SHMMn2QR3pMRKmPdXPHE7yd6n7SgAj6FWYs7
	 +vKtm9x7Umt8NwZdH9ftLIcez0DZghmG16NaZn9NFkYp9iXqGVRJlab6Hv1vMRXJOCoG1
	 jxgU4B/ma9iKDJohazbVH3b5kwCu60jgZHbMQ6ZX15yNMzw200VKe0VkyowAVpD5Rvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655285;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3YNoYhprz3b5tjUNRoDVAb2JBiF6wuQB3DtwNREXjp8=;
	b=Jz8L8uT13kYzYy5x/BpwCpj89N4yRn4ldmRsAa6VZHFh3L8mnvg9XYszIsHO2os+9o9p
	 JSkatSVS1B5b7o6xHI/3u9wdfGvwWfYtOC+lhGjCvKJmBKafKYwEBafNNHZG9veMp80UM
	 Mf3WRa83UqIfeLO+A7q0q7Bnu44CzK83WzW//LMOjGFPrIW/lCmKiW/tS2YWYV2bryDip
	 QzM/1QdG99W09/kf/7z53opyXDGNnBfY6jov22ucvHQznft64R70NjDG8mDCVZrCi3Cd3
	 FK9Co13egduF2ausPT26/tlWSSzWMJpONvtgM9bBFYAfJBXXYJpxrPpZVYW/QMeSGiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TuZ01U9J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4E4606A31A
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Oct 2026 07:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TuZ01U9J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEABF1F000C1;
	Thu, 22 Oct 2026 07:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792655285;
	bh=3YNoYhprz3b5tjUNRoDVAb2JBiF6wuQB3DtwNREXjp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TuZ01U9JtlxZv+BZb2woU2/cj6cv8r4bgxMOh9js0U9EAsfxgHBZ5nzKM5SemXOYr
	 wEvIWAkiBIGKx9/sdfZzuo80tVUTH7b05uMeFFij0XSVqL6p8vr4qO3tlaY6Okaq4Z
	 WAdYpGrktkexftBuz2T+1BZl7NXsjK7+yKHK26a2wgw7wCcPcE2Yets8Vrwq77Qo/C
	 SeRTHoV0cXOLOIBJCyr9pBmzUd0N/btsQobjEwhjlqufJNBBgs5L4m1L4NJtZQPiSd
	 fX9DhgKs8VqMq/a3GKfiL2fZz1ueSokYgx78YIq/ZgobzABLptuz1Bk7DJzsQTzktB
	 dPXEZH3FOoEkQ==
Message-ID: <sashiko-outbox-181134@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/7] x86/amd_nb: Restrict the northbridge framework
 to AMD CPUs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261022074218.667049-6-wanglin@open-hieco.net>
References: <20261022074218.667049-1-wanglin@open-hieco.net>
 <20261022074218.667049-6-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 07:48:04 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

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

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022074218.6670=
49-1-wanglin@open-hieco.net?part=3D5

