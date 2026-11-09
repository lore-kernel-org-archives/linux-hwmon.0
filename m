Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217323;
	b=pi/2sm6AulfBv4ABA9W9J4ZzmKQsGVge5gWqepwzEwVPzQuINHzMlxSnZq8GV2y3etua
	 Sf454YYvlJrpFYSmBELZgaIWxYleCGqCayVUr6ShEhQ3czVG/VAH5xZJzs39Us/OBvedW
	 NgY0SiwGNiKhT7hA2r7Tm1UzXkyoXnAwWBESPzDR8qg5o5QTmDsahtwmFqZl9gMkObfB5
	 087pr6JDr6YiRXIZuIl5Xl6w5YdENufyxU0+RK0JoHwEl7qgE5U57cYSELvM0hiGS3VOJ
	 Dm7I7UZu3iQoAZdkR48cS1SeZDU/4RJFDLJ9MnwwlBWLn6+TKi0Kmualr0GsqgP0a2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217323;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d9UzkgTq40zuA+YG/VGlosMrFLkoXfuVtAGM0Q6VOLA=;
	b=Pxl+VTe/1gDQnDP2ORp53h550MSJEVawZOQ9+dsEu79ABUA4QEQWK/FI3p8UlijvjctY
	 ZznHAGpeUQ4TQ8cKsaMCvrSP9QzXmMh285hAJCFmNGNqPdzD2+U7G4RqWPfiQQwCLdqt8
	 rQMoykKVNjs83jpCbjaEWgeBRlIeHi3s4InncKjX16dSuURixq/OD6JPwdnLmr0Q3If0/
	 Rq667ESZSMshSpPUCm2TNK41xbtnzEli4iBoENhj/oPO7L5jcPLiB4HiLf7apZqUsLhJi
	 2MOqMlzYRd6M6z3dgUU3+drtZtWsINrTojr/Djh7SIIAWLQxreA7ZprT5Wm0zigizBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oD/Zyl/h";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D362606D803
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oD/Zyl/h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087481F008A7;
	Mon,  9 Nov 2026 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794217323;
	bh=d9UzkgTq40zuA+YG/VGlosMrFLkoXfuVtAGM0Q6VOLA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oD/Zyl/hppYKvC95G0ol7v0JkDd8YzfzHBQUr5RfQ7vXmcLYNUK+viKWGmYFkgJ7h
	 vLS/77FwCVNW3IlhAcK/YYasEfIlJwASHaSz8QjcjNsM9c06kS3p6H8dckOlou3rz+
	 FYhohxAYfPhVwziHjbIVq4LljWm5uCw/MIu7wbnSmqA2NrSnitXj+R/HsouzjnY4w2
	 7TZwGKtht4QdjHI5x/2ji03CLp2UTGzqkj+Szq7jU1w4E2Bg1BlYp1WSa43wVO6vnf
	 oIj4lq5B3MYNFbDteWN6p+6sUzbsuFcEDAuP5QRT7+0ZIszxPOHVS0kY0J9PfuU+oz
	 aLFQTClg5ZFDg==
Message-ID: <sashiko-outbox-204732@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lochnagar) Avoid oversized shifts for zero
 readings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109093453.5384-1-zhujun2@cmss.chinamobile.com>
References: <20261109093453.5384-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 09:42:02 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: zhujun <zhujun2@cmss.chinamobile.com>
>=20
> A zero IEEE754 reading gives exp =3D -150 in float_to_long(). Both shifts
> in the rounding expression then exceed the width of u64. UBSAN reports a
> shift exponent of 149, and the conversion can return a nonzero reading.
>=20
> Return zero when the required right shift is at least 64 bits. With the
> supported precisions, the scaled mantissa is too small to round up in
> this case.
>=20
> Fixes: 4cdb56214746 ("hwmon: lochnagar: Add Lochnagar 2 hardware monitori=
ng driver")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109093453.5384=
-1-zhujun2@cmss.chinamobile.com?part=3D1

