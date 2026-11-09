Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219690;
	b=dgL/EqIphB5xPEmXwCMt89anR2dAwb8uAjtUkVaVVaDQ3fWxfM9gW4SBcnZbnos4jI51
	 TkJodPj1rGPSTBNJKoqLPCozPnTWzyW+dryRCZuXVSP/fDEqpUZ+e9+Kk+GL9ssymwGTk
	 e9EyUCr4dFTE0G+4FmrFMXrVBQFyFpWGEHvTF3054rm//DZkhh4TztL/fC8PlSF4Yq3FH
	 3GIT20DmuBDgilAXnKJ12xOkRvpTNz+M8GMxn9ecNeFV71xr8phrjVFrD9nNbc0R0Y+mT
	 CyIzArlwoXso3aJxC2Ys2C6zg3eBMJ7doI5UGtLIoAb3nJV6xhb3no+AXYiBIVMq2TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219690;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=C2rpQfDL3mwFSufaaf6u1QIKqC6l2bnBwOdm6XWNd0A=;
	b=3Xmr9QJVTHoS43ct5ufiKsujSpWuVhPQ1VGsPfZRMZeeitxr1iR1Ker2i3rs0h4vmwah
	 wyWOJrZu3EAYVzba2c1VizzJmq+pBLduhoMWO4hFaIBDX+8n5rJxRYZZXIdBWHdYKRnTM
	 0zY8Ax//4FX7CCZC2jI5CDQdNp8tNouTj3X8urao0g8a+3n0HEQmBUFOgC7tQxhXFv4qb
	 VLFtpy6/CtHsy1rYY4LIGI35I6tUv8aG6MwlX62SNNq4cCd4Tmd/YjcPzjP8BrYWJ+6qv
	 ceFiZZDKZLuXjOhHAVT5ibsfiGAqo9rG4URxyaLqh0O+5X+Bbz3XcXIU4WrNNKzRDQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ikyB3ZX0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283C6606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ikyB3ZX0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E6B1F0089F;
	Mon,  9 Nov 2026 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219690;
	bh=C2rpQfDL3mwFSufaaf6u1QIKqC6l2bnBwOdm6XWNd0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ikyB3ZX0GX8XA46o3ZwvugpV5nID49L6mBgnmetOBl9SeBV7ykNY3Tldfs0zpF5zS
	 STMENAwhhQBp7KCBETUxgpuRcH6JFSNncUi/TWrj6YsdY+u9UP/DJRosjFpzjO10xm
	 b+zc39QgUc2duyo598sNnJS6wezxZqVE4oinHqyERxSW3dPH1o7QJmM1Fs9D5lk6Cc
	 BX4Fphs5KUFrBc2sZj1fx9KEEO+mObDPPfzhGn4tnLFPdp+DJwMYaDfnUW6PDOA5cJ
	 /xkqI65WDgBRVQrGyefmOe/MdkK5SSVYLbHzlRdfu2qc9Al+wWdduqmCiD75LKetdy
	 cm7YglWaPQuXQ==
Message-ID: <sashiko-outbox-204803@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83791d) Clamp voltage limits before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109101900.17256-1-zhujun2@cmss.chinamobile.com>
References: <20261109101900.17256-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:21:29 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> IN_TO_REG() adds the rounding adjustment before checking the register
> range. For an unsigned sysfs input such as ULONG_MAX, this addition
> wraps and selects zero instead of the maximum voltage limit.
>=20
> Clamp the millivolt value to the representable range before rounding to
> 16 mV register units.
>=20
> Fixes: 9873964d6eb2 ("[PATCH] HWMON: w83791d: New hardware monitoring dri=
ver for the Winbond W83791D")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109101900.1725=
6-1-zhujun2@cmss.chinamobile.com?part=3D1

