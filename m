Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219577;
	b=bbADeox3XiCnxvi/lGLlNua+9YMtAHtzE1Pv8xyG8cwN1MTM2rk0KU7nZ2kiWANpbPjR
	 qh3BvOD/YstHgJavn3wp0UZCJOYNZro4DZePeHGbYJdQ2aTrP8IjUjdlyvHqlwunY5uSX
	 ySje1TFUnragWXTWxU+4oBycd/X7fX+lrHldmD5USgU7EG+DBJgp3bFg/gS3rnBZaSkEk
	 5vi42uovqaCPMRhmVQ1Cwe/04l++706EDSEdJhGrNQYYzeHXQuWfj6dojR0TSsfl3Do0E
	 oBJltfX5SOwoHNWNslXh2Oav6mzi9u3P9mcuxTrcftJx02pgEo48j3k7XRu6FIz3ViQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219577;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ejl4y/tap39P+E4iq7k+OQcvb0b5EyzWEDMiAZBF92g=;
	b=ohaJMISiuqn4o52koI2BMWgc8I1ulgqh6pD5Gr5VNZw+znFLY1YtO87JX6FbFKa9BtlL
	 3KBKFy1TTSlaYXC0QtkcrVjwmJFkd7NO8Qo7mVGkvlrBrEe/4bJfn2sFewXYfngYxZhZo
	 VWayBUZ4wOnRdy1OtN+CCAZo+R89AL5SpEi1Flm0CcjKs0KHw55CXBYxrhU3ZpIzOLObB
	 siCNxcMqLygiQLaEN8VbiHL+9J3xI7G6fRYfqvDY/+Ez1qVRXIXzSkiotFrWHc2qi5mCT
	 /GdK16zhDQi6+03bFDjWyVolWjm9LogSM2aA7Z9pphplCZswNRJhHjU2lojM6xvcNvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7fKhiCq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F11606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 10:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7fKhiCq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1712B1F0089F;
	Mon,  9 Nov 2026 10:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219577;
	bh=Ejl4y/tap39P+E4iq7k+OQcvb0b5EyzWEDMiAZBF92g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D7fKhiCqPVQgJofRRlODzpm9C13r9Cl1x5WHDdcGJq0k/etRZmvHtwtkUwt51+mtX
	 nZJk/BnWEtIHOfDM0/qz2zOFsqVIOgEyzgdzLpDPAe1tYCtmkqXspAe39QObMJmvcG
	 z1Wo56zD3q8zTT+vYjV4aqL2n7ns4PCIWLUpkOlANIJUCY9+L6pMBrbWrakItN9JiV
	 h886Rsu9Rrvq3hlvCpF3FIufWuqSxImjQbS8niST/wmrTRXAB0Jr7og4sv9MmacP/n
	 N4AbKKDwXEsn9+1Q3v+tDBeKZfJAzfabAGu5JmtzJWHf4dDU+hSTR4XA+nt1HYD/uq
	 6KUcrxqHL3PuQ==
Message-ID: <sashiko-outbox-204800@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Clamp fan control times before
 rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109101629.16713-1-zhujun2@cmss.chinamobile.com>
References: <20261109101629.16713-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:19:36 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> store_fan_time() accepts an unsigned long, but step_time_to_reg()
> narrows it to unsigned int and adds the rounding adjustment before
> clamping. For example, 4294967295 ms wraps and selects register 1
> instead of 255 in either mode.
>=20
> Preserve the input width and clamp to the maximum duration for the
> selected mode before rounding.
>=20
> Fixes: cdcaeceb74ff ("hwmon: (nct6775) Add support for automatic fan cont=
rol")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109101629.1671=
3-1-zhujun2@cmss.chinamobile.com?part=3D1

