Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7A6351C1C
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 06:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970537; cv=none; b=YkmykVkA4UmNdNU8vpdCs8a85O8P0U2LMXaFOgBLYbt+gysCI0Vr7+zyfaIWT1+HyCoElAeLB+bcvs8R4Q2hIVWDVswYnC+wb0QMqBvCyS4S7mmeu8usMi6p37a0692afCryR7VcfilrC0ZYXhkwe7F5y/dt7VVNtBnrjEpyyUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970537; c=relaxed/simple;
	bh=oiTM8JIxH6NlUHDSaRuluJ1VOXlk9OcB9p4xMKc+xVk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t35fCrVhmrQwiVmYbR3tE74oFyx3HWjkYImPkLiKNhhzFMtYAo7qNIaZ4zrR8VUP7Ld2fygcfK9Y+z4A0dXIvRHtrE6+7bfSHEaCl3y30vGTVnrILYCagzQId7eM3K+LLUtTygzayEsvADPzZJsxP+S0wqbSUbF+K3RoGeKMKQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjqSSb9C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjqSSb9C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228911F000FF;
	Mon, 21 Sep 2026 06:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789970536;
	bh=oiTM8JIxH6NlUHDSaRuluJ1VOXlk9OcB9p4xMKc+xVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MjqSSb9CRJNeo88Y2NCwoveKM9Em8gTVL3Zkw2OLxq6qcjKy77RQe6eKxO3XQpLso
	 etNzRwO2EwtnrbKdpyRZdduQUd+930AAx84Zl2T8/dYhxfHWEVFnEMjVt31TJkzmbZ
	 Dv57EnZEHp9mwrMe/bcbfL+sjNmjlX/URHStSgEaNjNOz9dM/8pHHldBqJWH6KWLnG
	 vvzf6u85DYbjjaawfoh2uIA99N1Vdl5csrEaj2cGXmubAOlmSNSXvW6/fuxITfOEB7
	 horPvBeR40xxTEr1BteWcTDQXdweQg/1JGDwfVqsLoY1FkAd01pPWUCXHGhL6CUA7F
	 Tx+G47jjDNlbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/8] x86/hygon: Map CPU NodeIds to DF nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260921055603.25112-3-wanglin@open-hieco.net>
References: <20260921055603.25112-1-wanglin@open-hieco.net>
 <20260921055603.25112-3-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 06:02:15 +0000
Message-Id: <20260921060216.228911F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> On bare-metal Hygon systems, CPUID 0x8000001E ECX[7:0] encodes a
> CPU's socket and local CDD ordinal. The value is sparse across sockets
> and cannot directly index the dense DF node cache.
>=20
> Resolve the encoded socket and local ordinal against CDD entries in the
> cache, which are ordered by socket and DFID. The NodeId reported by
> CPUID in a guest may not describe the physical DF topology, so return
> -ENODEV in guests or when it does not identify an enumerated CDD.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921055603.2511=
2-1-wanglin@open-hieco.net?part=3D2

