Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695643BBFB6
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 08:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029211; cv=none; b=DyAq87TG39pSz46y43XNU61WlUBP5LCv1Unm6+DwYyOnhiaqVJ0ukeU7Pxppf+w5fdeq9Lj6ph9zs/uL+AEEBdnJCE7c8APBdw8CaRaZXu4By3gTsu4oOSUOSJYdGQQ79haZSmuc2OgdlQlap1jb1CseRkiS6w1VxepFRz5jBls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029211; c=relaxed/simple;
	bh=AoP7KQuiN5Vh0yM3xUlfky7XL0+hv0FZpWm1oz9kQ8g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E8DlpYqFTSHfCizND1oMGBZc+5V0sBaR+LK7dEKO7AdDFTW+0MkljvT7RTTxsXG1yfWJ/w1yxuqnamsYmZkzjdNZfi/BluonEGji8/q7/VoyCLFC+jzmZExI+NE7/uc73tMmRVF8XOLQvP9FmJ6RDYQEbQSbsMi/7Kpc14bGPRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mmhu9XI8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mmhu9XI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2671F000FF;
	Thu, 10 Sep 2026 08:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029208;
	bh=AoP7KQuiN5Vh0yM3xUlfky7XL0+hv0FZpWm1oz9kQ8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mmhu9XI8V0sVBP6buIOchO/L8gg3G3RNowCjnMXdDRH1jz5wnZPb2GWXdL2FMVsKs
	 AfTDzfNmjGzkuhK4yDzhryfNcDP5aX9tyLZxnEtVwZdaB6K1I+teDsrZHXIoWl3XRe
	 v3VI6B23+vuK/ih8hf9B1gnmTAE6ZwkNI31i9ixdRjVi98HOtx3K0ezhuuLHDpMSqy
	 uA2hPjuq3UHwh/wsnbIT+41QskNMgYBK7uxE6TmyAkwgPx0gQ4vNcRfZf8QOxZ0DWC
	 2IBwRAOzDEyy4V07O+/shsBwEdzF8OCHLiuJc3TGgpe4FGniPSV/6NFwSRJ1j7U86W
	 5im8xa3WurtyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/8] EDAC/amd64: Stop matching Hygon CPUs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910082734.3771675-4-wanglin@open-hieco.net>
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
 <20260910082734.3771675-4-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 08:33:27 +0000
Message-Id: <20260910083327.DB2671F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> amd64_edac matches Hygon Family 0x18, but obtains its node count and
> F3 devices from the AMD northbridge cache. That cache maps dense node
> indices to fixed PCI slots starting at 0x18. Hygon discovers DF devices
> by PCI ID and reads their identities from DF registers. Their PCI slots
> do not encode node identity, and CPU NodeIds are sparse across sockets.
> The cache therefore cannot represent the Hygon topology.
>=20
> A failed fixed-slot F3 lookup causes amd_cache_northbridges() to discard
> the cache, and amd64_edac then exits at its amd_nb_num() check. The
> driver has no valid Hygon node count or node-to-F3 mapping.
>=20
> Remove the Hygon CPU match and the unused Family 0x18 case. Hygon memory
> controller support requires the Hygon node interfaces and will be added
> separately. This does not affect MCE decoding in mce_amd.c.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910082734.3771=
675-1-wanglin@open-hieco.net?part=3D3

