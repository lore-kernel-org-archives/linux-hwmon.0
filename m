Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0DE331A56
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 18:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534819; cv=none; b=Ov3akw8vqnhihG8jYyAztqW6ULXA7bJ925pL7DzvMPRjDR79tWnhFW2MaU5/Ljrh/X+/Fm+dgBOvbXQg7OduvEvTjQZ7CHFD/q4YkDSvNYKaTjoS64BdsfiT/XGLyNp8LBkQsxnSo5sCEKCbtH3iSToGZtlxd+NGvQ8ebJ6olhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534819; c=relaxed/simple;
	bh=cinpGvQRcP4788YEg+cBcrbFgm4M6CqBPQEIgduW9Go=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ElPArKH4ugedFg/7SAZRVAwaZZGUQj2Z0ehHr8ebb7LL0VV6dLYMsXjm1vPa1Mz+TSTQcbhUrZTe/u/qqeXqaebZvFGlXv4qSsNnZGFMKwnAStzrROZihzLpOlanMSdySUBA7Y4FnApAqT1IqJSSMzXvjvtJQv51C3fEckfH4mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVqhnP7g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVqhnP7g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5131F000FF;
	Sun, 27 Sep 2026 18:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790534818;
	bh=cinpGvQRcP4788YEg+cBcrbFgm4M6CqBPQEIgduW9Go=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WVqhnP7gfPkFO+iN5retXGEn3IDdGDM19U8u0pFPzSQV4wlE0PJiXvnxjhY0YC28Q
	 m59ymU4hg61M5um6QLF7k0cs5Lwe1cKwDeZbuLVosYE1qzODc1/c7XqQ/2lC9oDYYI
	 d35Verw1l28RZoj6quiFrs2+JtLk7D0ptarkwJC4lnuboQcRbAS6aO6WqCdOVKj/1u
	 JdyL6uePdrKjP2p2vFFmSjkxWPF41l1ROAdYuzHzZFoCNBK/fLN1p5nx/BMEw40nvc
	 El19468ZEx+sNcnYjXkDV+aZXGtQSiWAYR0rvRxEsTax/5ecXfHc1n/3XVRn1DnHKO
	 2t+Dvr3Q0lw7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] hwmon: (aquacomputer_d5next) Add AMPINEL
 telemetry support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vas Zayarskiy" <contact@vasily.cc>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260927183723.4078226-6-contact@vasily.cc>
References: <20260927183723.4078226-1-contact@vasily.cc>
 <20260927183723.4078226-6-contact@vasily.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 18:46:57 +0000
Message-Id: <20260927184658.3C5131F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add read-only total power, total current, input voltage, hotspot
> temperature and six channel currents for the Aquacomputer AMPINEL.
>=20
> Decode its 544-byte input report through the existing serial-number,
> temperature and update path, with power, current and voltage handled in
> the device-specific switch. Store all readings in hwmon units.
>=20
> Select the telemetry interface in probe by its vendor collection and
> input report layout, following the existing Aquaero and Leakshield
> probe filtering. No match callback or HID core change is required.
>=20
> The separate keyboard interface is not supported. The driver rejects
> it in probe, and stock hid-generic yields to this driver's product ID
> entry, leaving it unbound. This intentionally limits support to telemetry;
> keyboard support can be addressed separately. Channel labels follow
> report order; configuration and alarms are not supported.
>=20
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927183723.4078=
226-1-contact@vasily.cc?part=3D5

