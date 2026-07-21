Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC29D403E9E;
	Tue, 21 Jul 2026 04:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784608110; cv=none; b=p111Qo9UdXlx9iQbEI/kNXqE/9M3g22Akxt2VvW8Dcf4EFFwJreqZuBjlxIEOKsbRkwtAOk3XqWr4GNShQ6+rFfCA2VK/OTy6x10hN44rhlDtKVQF+cbVJCfaRtgrQCny4GBNZa0ov6YzknQURSVrLKMd0U84196LgjbvbUg0AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784608110; c=relaxed/simple;
	bh=FZw7pIg/LDfDyt/lhCm7JiguQ/YyI1pHEVAYl5e8WYU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MjzPo3O5YLqta63MHsh7dU/kLaqLPS59FB8CUZfLHRqkNO28GIF1COjxTSGCAuFk6ygNr+eaeb8twS1d4zm/LlSuZjXtCM2P+NFF/YTuDPt16j5ennMlYWMuiUXrSJ7PBUTnNEGlJKVO06sdct81JmrTSqs3P1IqTqLtVpckFAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMNH6k6v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMNH6k6v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3331F000E9;
	Tue, 21 Jul 2026 04:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784608109;
	bh=FZw7pIg/LDfDyt/lhCm7JiguQ/YyI1pHEVAYl5e8WYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XMNH6k6v3x/BUp/NOHOzEeakMZG7vQp8H6uL0+qi3yDFRI2HQoMI5xq5d89f0i/b3
	 1BiUJyMhlCo0RBRXWMNF3LhvyH6UhSysgkJMCnqeDB/1z0aGoRjJtzCT7TvxmC6uNX
	 HwAsb37ALIrmIkiLH4hxvMO22H3xzUOsKRYW8+DmbJyv3w4rcc57Ph4Vfw+0k9rR0o
	 Myg/ZRFhFtWQwdXrwhvtKOmYeyLixoICWefRBCawAjfEbwrwYT7JapcLACOahCnCcB
	 4hufhJm4Lyd0TD2i60A83GB0ck1v4XXCmjFBKFvql6zVEBrQBZ+kjNKg7HHHx/jpr2
	 COGbofLwHwYYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, Frank.Li@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260721040805.1696503-13-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-13-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:28:28 +0000
Message-Id: <20260721042829.4E3331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Enable I3C subsystem (I3C), Synopsys DesignWare I3C master controller
> (DW_I3C_MASTER), and SPD5118 hwmon temperature sensor (SENSORS_SPD5118)
> as modules.
>=20
> The NVIDIA Vera CPU uses SOCAMM LPDDR5X memory module, which contains
> SPD5118 (JEDEC JESD300) compliant temperature sensor. This sensor is
> accessible over the I3C bus through the DesignWare I3C controller present
> on the SoC. Enabling these configs allows monitoring memory module
> temperatures on platforms such as Vera Rubin. Vera is an ACPI-based
> platform and does not use device tree.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721040805.1696=
503-1-akhilrajeev@nvidia.com?part=3D12

