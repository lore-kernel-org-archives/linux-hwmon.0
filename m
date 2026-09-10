Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65C92D9EFB
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 08:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029447; cv=none; b=Np8kmBLn82i734JCLY2hJX4Zfnu88Hgz3HTIb8HJbJnd/RMGfX1hzFP3Iwwa6/gM8DSxTF8nykShOD95c/9I1NR8Vh/SYSo1MV9gTU7l3Yk/5yHCQyNk6gXDO08Gsls/gBTT7PYDL3ymBdwb88abhBMaP8e/xY9O9iZlimB3+ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029447; c=relaxed/simple;
	bh=WlfutA7+5FwoTnpDQCJhnzjjHHO3QB4bIGyVQWVMD70=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h3rYMwSHYV37zPqxH16gRKXPd4wYKp8UbB90wzf9U4y83bAV2GERLBYja+zc0LaFu5GmMqXXwM0P15sPnvJlV4VFr4iE1OaVXPTk7gO74tRP8Ya8gXhyb4P3unkojUCQJr5eHxnxx7D4Gfqq7XD9O023/0jWY4EVzR5Ulg4oZYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guJ06xUj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guJ06xUj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802681F000FF;
	Thu, 10 Sep 2026 08:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029446;
	bh=WlfutA7+5FwoTnpDQCJhnzjjHHO3QB4bIGyVQWVMD70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=guJ06xUjaIvOMQPc/qR0nLuKDMijmy4o87T7X0DnFhF1hhtioFZsUhKp+MLPCBXL/
	 3TIFo+hT5Y1EaFlU+Z48HcScxEeO8DhLhdXAqgBgOKUUgmCdPD0MuwSo3havHuKYxG
	 65mq/Gg8IEsNEAJ7Vu93FEQCqZngFrs9HPG5wP5rmNrFD7mLz9+R53x7GlrJiZssY/
	 m//zwwEQBZTyHHViPWAGsP2jKI0tYnpX5WxSnl04ut0IwSvraM6CJGTsj3/NbumPgM
	 YFz4nveVFLbqROT1OQDv2GVawSbKE7fht7gQM3Mb1EPp3j1Upx5OJC7KjWu4KAjjGg
	 SbcpcXzWsEAPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/8] x86/amd_nb: Restrict the northbridge framework
 to AMD CPUs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910082734.3771675-7-wanglin@open-hieco.net>
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
 <20260910082734.3771675-7-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 08:37:26 +0000
Message-Id: <20260910083726.802681F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> amd_cache_northbridges() obtains function 3 and function 4 for node N
> from fixed PCI slot 0x18 + N. Hygon DF devices are discovered by PCI
> ID and their slots do not encode node identity, so this cache cannot
> represent the Hygon topology.
>=20
> The preceding patches remove the Hygon matches from amd64_edac and ATL.
> Restrict the northbridge initialization and early device check to AMD
> CPUs. Keep amd_get_mmconfig_range() available on Hygon because it reads
> the MMCONFIG MSR without using the northbridge cache.
>=20
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910082734.3771=
675-1-wanglin@open-hieco.net?part=3D6

