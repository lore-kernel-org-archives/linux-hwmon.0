Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EED0A59
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 06:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970480; cv=none; b=qK84gG69CNA3pqWrQuY1e7KkNybjQf2UgCIQ7dy4I8APwiNSRCMJJLy8pRYSwIqhTl3yNxUb/WI6yI87CuqNm1OIrSJQ6b4Jy5bk4RYiM5fedzxLCmoG6x5ZZTfvbdNsuENjyrdkm1WDPBZ3XYjAnSdusG/phTl7M63/10+1npk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970480; c=relaxed/simple;
	bh=ZWF9zJ3I6cCGv3UGEO8ZYAHZkMGUbPSXD5G82Tae2o4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nx9e+kNGLe6POToWUZEsoEshpr1f2f3nqK8SJ0tUOG/7WFvS3VsrntAJDwlOQwjHpcMvhE33iot49YA3ZSBcu7cjJhPc/MgwTRvvuqOaBH553ihasQfqww6RXdj/C4O17PNdTC0xEpAv46eAtoSAyZjIh5pRj1y87tl7CUAh+YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ruo1ccpO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ruo1ccpO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067AB1F000FF;
	Mon, 21 Sep 2026 06:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789970479;
	bh=ZWF9zJ3I6cCGv3UGEO8ZYAHZkMGUbPSXD5G82Tae2o4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ruo1ccpOuvoj0ubMTrY0YyiMbtXQ15dC55E/czOMVcllV85KLDOSfO82I6cwIc4qB
	 gjW+MlOS6tpXpxY8oicRtKQR8yPoplAVFUULEg4XazCrVhGt+08dSEWJ5q6Bi7z4/3
	 OXqn87ES7dM1R1GdfnItG8SjB5l8E/zTTSFgPYnRRywfsI3RtWuHGfLEO5018Dhgnh
	 /1US7K4Br1ZKk/2Y5c8wIcvT+pWcCPBgRgGD5DuqBy3FvaLq6oPGy5BxiJqwjSB36p
	 0+m8G4iF2+QOgdYmlv1rPBCQJASHgQ3uGFdswrZ5+pgBfztlDgebZ87t7lxtjwj3KH
	 ihVO8etk99d3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/8] EDAC/amd64: Stop matching Hygon CPUs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260921055603.25112-4-wanglin@open-hieco.net>
References: <20260921055603.25112-1-wanglin@open-hieco.net>
 <20260921055603.25112-4-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 06:01:18 +0000
Message-Id: <20260921060119.067AB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The Hygon match predates the conversion of the AMD northbridge cache
> from PCI-ID discovery to topology-derived node counts and fixed PCI
> slots. That conversion removed the Hygon F3 discovery path.
>=20
> Hygon DF devices do not follow the fixed-slot layout, so the cache is
> discarded before amd64_edac can probe a memory controller. Removing
> the Hygon match therefore does not disable a working EDAC configuration.
>=20
> The Family 0x18 case becomes unused and is removed with the match. MCE
> decoding in mce_amd.c is independent and remains unchanged. Hygon memory
> controller support will use the Hygon node interfaces in a separate
> series.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921055603.2511=
2-1-wanglin@open-hieco.net?part=3D3

