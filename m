Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757478;
	b=454/8AHc6iptUPzNU98QXsTG4eMAbXfAyUCNowWPwhFj63r0tqzm0+dE5Yv/HnPJ3niS
	 R82bxUyvU/yN+wTX/ZwW0CkY2QBdeY9ZYmlV1th8RUXOuICx1hL4m+rbVcX5GebPbReMT
	 dSpmaPOnEpfkaKbm0prUEXfcA79x0FfkwVsUQ0Pffk4kVoeFhyJQWaaVdfVZzE4SSGLaM
	 qqGjsRQay16nR5mBgWRnsGdu87cdEQ7Z5yFsHfnOGvWqTTYWpCUofLisNORvohY756d9v
	 OC2HeN+1Ly4v1PsMb2iPmzUU0vVEZ105bDSTNObtN5Hd3d1z8r55qzLOlMMFztve/Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757478;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kYP0UAiwn4Bie/O1anWbP1BuC/ozuegdhEZmqquWeAU=;
	b=vtGOGXBNFbIrRwPlJpDUVNi7t3U6Lx0dGsdRTLGQ9AzlHahJ1XzAAg3m4k36c/08yG1u
	 NT3vHe113f/ltBDrNNZOQrWAw2JQop4ze1YvNrAT9YcUkXxf/i2Gcgkpp/VhuFxQ6hNKk
	 e4iehxIguBhNadDwBAfJ6DKzJeUHZCmFwJKsGSvI0LKLTWpNirKvH0OirvuiBYFqC2eWe
	 X4mcrxOD1bsBN+FkA53whGtvSonyKpxY6NPPqyXVmKZIi934jEq2nbn+39Mp7OWzcGHCj
	 SYry7x+MkvNh+N0e9o4d64VBpcVn83kiPddTXnOSuTgXO9Nz+lezDKMbWFKwPxoozuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h1K1Zm7X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7EF606A31C
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 05:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h1K1Zm7X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA8B1F000C1;
	Fri, 27 Nov 2026 05:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795757478;
	bh=kYP0UAiwn4Bie/O1anWbP1BuC/ozuegdhEZmqquWeAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h1K1Zm7X1Qm53PxYdB6er7KfLjEBSfudIXrIIbhHbEg3dl982I7nOFlU0Sv0aLcmG
	 yWY48YGUdu+YssMiM/fjb6GAPlxLp5OC9mTFlkkHJ7ZXy8Sk0KlLIjKOVJYc+2V+Ls
	 nP7XruMyao6mQBiDvtXczJ0yamCXuVEgdGNhOlwJyB1+zhg4PQz2f52Cab02iXTFzn
	 qlMtimLklXrdxuxpaJRwLOSUSZELu+dx+VhL7mF61arZuQ29R/+2WCDhNe9lE5lHd7
	 auBb3lE8gTlJBJ73d2IDR3Trxzp2ylseDCm9PwinJ1McA33b4PgHpMJz25ZlNxNIaa
	 NOMAEMWp8PsfA==
Message-ID: <sashiko-outbox-236650@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/2] hwmon: (yogafan) Support >2 fans and add additional
 Lenovo laptops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261127052841.492895-1-sergiomelas@gmail.com>
References: <20261127052841.492895-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 05:31:17 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127052841.4928=
95-1-sergiomelas@gmail.com
