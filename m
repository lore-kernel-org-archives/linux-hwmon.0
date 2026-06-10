Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC3E3EB10A
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099057; cv=none; b=Ea+uibgKL85sAk2pWwLum88r1uxtklKjMfMc8oP06k6Sr51YmU+iq7cMvUezY4jB9umdwwV4Hc5npAoNbzDP2AxRb1WShzLalk7Pe7VGIv2sqkP93mvs+bY5AzJ3SGytF+qBNvQnMRpa07guUWKAVAR8ZV9no+uXCO95lqDKYAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099057; c=relaxed/simple;
	bh=fW82oGQ1W9IkRqJhJcKHEuu/K/MX+pVM+lJO2wOZsAo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lu+BTaC8iuCVLsGCSu6pAWq+gLks7xpLzTdmpA08irKkmY1GJKFVWA9UlV9qdvu7o0KD2p3xpa5enpxeMXPTMD/RWOjR15RfYQbt4OAbIfrAM2pWDiHzy0bLpUUEtB96TCvdF0XAkB214DWSgQuVj01pjYuaaKUxVq3nqckPE2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWyy2ZY9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWyy2ZY9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C961F00893;
	Wed, 10 Jun 2026 13:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781099055;
	bh=fW82oGQ1W9IkRqJhJcKHEuu/K/MX+pVM+lJO2wOZsAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SWyy2ZY9qFcpORouzds1ZogPVQBOfIlO27W/tyuAdsRoeLLaW8vfNSVknYZBXMMEP
	 B4W+/rumIz9+lbcHNsXzvjYxOgOpYm1avaY9oi48SY7M9kI0N3oOMZB36PiI8myvkL
	 oq9JwZk+p1qXt7PW0OOny/RiO2gYEGx22SIDl1vDx8i9VpKyf79lm90NNGJJQjNGoo
	 DHXNsHF3NcC348y9qlugaAzCpknKhVnaHHQRdfgWkyVg0+33bwRZQw2IaZuXvs7tJV
	 x2mOrnwP5ll8YBk/6+c/3VTuPMCb9Cz2sBppZ6rlbTG8qSrNVNLIb/nT4cTj+b80Ps
	 Xz+79YxLCIPNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/lm25066) Fix coefficients and overcurrent
 limit selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Potin Lai" <potin.lai.pt@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610-lm25066-driver-fix-v1-1-ff9b39961a2a@quantatw.com>
References: <20260610-lm25066-driver-fix-v1-1-ff9b39961a2a@quantatw.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 13:44:15 +0000
Message-Id: <20260610134415.A6C961F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Swap high setting and low setting coefficients in the lm25066_coeff
> table for LM25056, LM25066, LM5064, LM5066, and LM5066i. The
> coefficients were previously mapped incorrectly, resulting in inverted
> current and power scaling.
>=20
> Also, correct the overcurrent limit selection logic in probe.
> Bit 4 of the DEVICE_SETUP register (LM25066_DEV_SETUP_CL) selects the
> current limit range, but its active state differs depending on the
> chip family:
> - For lm5064, lm5066, and lm5066i, a set bit selects the low setting.
> - For lm25056 and lm25066, a cleared bit selects the low setting.
> The logic previously treated all chips the same, inverting the flag
> status for lm25056 and lm25066.
>=20
> Finally, dynamically assign the exponent (R) registers inside the
> probe's low setting branches. This ensures that the proper exponent is
> applied (e.g., for lm25056, high setting power exponent is -3, but
> low setting power exponent is -4).
>=20
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-lm25066-dr=
iver-fix-v1-1-ff9b39961a2a@quantatw.com?part=3D1

