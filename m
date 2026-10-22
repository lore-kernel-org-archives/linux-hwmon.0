Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655391;
	b=a0MCBU9jXhBdBdEkO2fbigAx9/hYSu/3qLxyfZtYFguFHEq6/DmhdKvhkKuHHNHe2Npp
	 XdPIL4coHqOBIM2JvGqemA1b+7k7O4UJy+/LlkUF+Svyz0N9C+4FsLVJ8BEQ978wQrsA2
	 3Nho2aBqd0lKScw0CPa1Cr1vpDJlMaTaIMJTCCYMJUYp9IRI5uODml7C5qp45K9Ei0sn3
	 yoWmJ7SoMRq/IzCTU4GMk/e9kadhwPxwo3Qks7z00VuShPojzho8a/B+Vp5ssuy6T45i0
	 XjnPkbMspNLXALf+oIzkMC6aXfXguY0kuVt4+R/wUKUTAHUrilLcOlzF51wAJMo2jvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655391;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pvb2xklWi4JNgyU9/u/HLRmIZy9yIK3HVA7WjrOEQ/E=;
	b=phyjy7bS/ymSBQZvjdlFu+eugSnf1POJOJo3JITEeV29kbsCgfO6hmiAzRFg7n7AWw8d
	 3qw0afBOVFgeOwFPAU1Ai3Ah25luzAyfB1iif+s9wH4hps7K+5c2favvK7u/BxXkO7mNc
	 sPC9k3uSaflPOicmT4YDWyhyaKeCdRZtZ+cnTnZwOUEKLVo0Blqy9ep4qBWXOGW0iPSLq
	 7KQXImA/YIsIXC2/CC6wLeFauUhmZEGRIAxMTF29sGn1S99K00FczHgxNsouOEDTAvG3T
	 YsEltrJe8wFM2EOjCwMINqieFBYKOzaMBhR4U2m2L7yLoTAn1pfufHZsUxVcxpzpZSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hpwyMwXl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6131606A31A
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Oct 2026 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hpwyMwXl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF4B1F000C1;
	Thu, 22 Oct 2026 07:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792655391;
	bh=pvb2xklWi4JNgyU9/u/HLRmIZy9yIK3HVA7WjrOEQ/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hpwyMwXl/ev/XZ9QVxypV2/Rv7UjybJtUzZlKTiWJOiTzMBq5xjfxWoSF/iGqimia
	 3FsPOFwQDjXwJk7WFKGEWgHPY7jKPJIHf/Bk/AbXB5UyCsyLWSVY4eIz6lCiQOcewj
	 BPNdcmGb+jq+fmCvLP3nawhi8bYFW5f5+/PvbHCi5wNACCh5D4Z7dojbpra6tuyyPr
	 8X9ghm8/EBmK+g16oyoXHa2q/PXSCeVXi9ni7WWIYc83HzzF387hXrbNFa12nwgsGE
	 aG2maCRxaZgo/BJrtmnoQImF8/muJcTUoKyBhoGdMnGlE9mf8OaaZtBIoTGI4+3EJy
	 MuRpPMOGifgjw==
Message-ID: <sashiko-outbox-181136@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 6/7] x86/amd_node: Restrict SMN setup to AMD CPUs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261022074218.667049-7-wanglin@open-hieco.net>
References: <20261022074218.667049-1-wanglin@open-hieco.net>
 <20261022074218.667049-7-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 07:49:50 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> amd_smn_init() also runs on Hygon because Hygon sets X86_FEATURE_ZEN.
> It reserves config space on the matching host-bridge roots and groups
> them by the CPU-derived node count. Hygon DF nodes are enumerated by
> PCI ID, CPU NodeIds are sparse, and the nodes in a socket share one SMN
> ingress, so the resulting root map is wrong on Hygon. These reservations
> also prevent the Hygon node layer from claiming roots for its own
> node-to-root mapping.
>=20
> Hygon vendor matching has been removed from amd64_edac, amd_atl, and
> k10temp modules. The remaining users match AMD PCI IDs or check for an
> AMD CPU. With these changes in place, no in-tree Hygon driver uses the
> AMD SMN accessors.
>=20
> Restrict SMN setup and root discovery to AMD CPUs.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022074218.6670=
49-1-wanglin@open-hieco.net?part=3D6

