Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02682E7BD3;
	Tue, 21 Jul 2026 04:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784608517; cv=none; b=tCnCISwkubITyu6+ZNezTVCAeNalaV8+1zaEMX1M74cbMPCImKEhRVWU6Ojz2sWeNc0NDyLXr9WJeNrbj8ZvxuEfOav0sGocKcOs2E9lYnPjtqyQ4cXoRxdUmRoSKzJn0nZz1WtKBwXOJfkMibLShvmCEZOmlgbAcVCDx/qU2xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784608517; c=relaxed/simple;
	bh=FMehk5wCbL1iRb5X9b7BSoOkDg0AR3O9qECuG9IBz4w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zptk/TqM9J2pgwIiNhtHInfFOv/2pP/P6lJXmK5RExZ55RTS+Da8jnAxI6sHyLRInsfcrNo9w6J5aJfRSDgXOIdR3aPs5Qbhr6Rk7Dfm9hd9KgpFscB5yegRlaKVHtXAIeJepoTxYg3m9l94W8xpY/9UcLlFm/WyPcctz8q5t1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osmua9jg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osmua9jg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73AE1F000E9;
	Tue, 21 Jul 2026 04:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784608515;
	bh=FMehk5wCbL1iRb5X9b7BSoOkDg0AR3O9qECuG9IBz4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=osmua9jgoxJ4ulMKauEn+AbAFLNFg6mI6t2pc4RBe1nkR8cbKJ4wOxCpm2xxOEUrC
	 snWMbwwgR/ewBqHQOafNxKR8pWuxhzqQ3UN4jyxlDw49+kKgFqhiJQMVrNfp/dIijj
	 T0kyLPf2VQPSAONCsnNx+6mVH62/NPtydnj736uCm6ZeXDV3C82eRKS/tyBcjnASFj
	 uqVzhNfX0Ixv2xHgmwz0FM+pjkCVJMEV+7k9DVqjCU6AHQW/KfWMEU9GAi5NQOdsdA
	 Sk7+PqYviiOFBVZyfRfbJY709NlqXkBaCS1/MzhAtr9LoqmPQzljQGnAQpguuJMChs
	 6cOpNmDPHtq1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/12] hwmon: spd5118: Add I3C support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260721040805.1696503-12-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-12-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:35:14 +0000
Message-Id: <20260721043514.B73AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a regmap config and a probe function to support I3C-based
> communication with SPD5118 devices.
>=20
> On an I3C bus, SPD5118 devices are enumerated via SETAASA and always
> require an ACPI or device tree entry. Device matching is hence through
> the OF match tables only and does not need an I3C class match table. The
> device identity is verified in the type registers before proceeding to
> the common probe function.
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721040805.1696=
503-1-akhilrajeev@nvidia.com?part=3D11

